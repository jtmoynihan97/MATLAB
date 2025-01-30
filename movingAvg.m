% Jake's Moving Average

% << Scroll down to skip explanation and see input/output variables >>

% The purpose of this function is to take in a 1-dimensional numeric data
% vector, and calculate that vector's moving average given a certain window
% size. Beacause a moving average inherently "trims" the data array by a
% number of samples equal to the chosen window size, the user may also 
% choose to pass in a 1-dimensional x-axis vector versus which to plot said
% data array (eg. time, frequency, etc.), and this function will also 
% return a "trimmed" version of this x-axis vector which is ready for 
% immediate plotting. 
%
% The moving average algorithm is implemented here as a convolution between
% a data array and a normalized "window" array. The window array has an 
% area is equal to one with a length equal to the chosen window size, such
% as to take an average at each point without performing any unnecessary
% scaling. Keeping the window area equal to one roughly translates to
% multiplying each data point by one (such as to preserve the data), while
% the window length determines how much smoothing should occur.
%
% For example, if the data array is convolved with a 1x1 square whose area 
% is one (eg. [1]), then the data array will literally be multiplied by 
% one and each sample will remain unchanged. This results in a one-sample
% latency in our convolved output.
% If the data array is convolved with a 1x1 square whose area is five 
% (eg. [5]), then the data array will be multiplied by five and each sample 
% will remain unchanged. This results in a one-sample latency in our 
% convolved output.
% If the data array is convolved with a 1x5 rectangle whose area is one
% (eg. [1/5 1/5 1/5 1/5 1/5]), we are *effectively* multiplying the data 
% array by one (eg. we are not scaling it) BUT we're averaging it over the 
% previous five samples such as to smooth things out. This results in a 
% five-sample latency in our convolved output.
% If the data array is convolved with a 1x5 rectangle whose area is five
% (eg. [1 1 1 1 1]), then the data array will be multiplied by five(?) AND
% each sample will be the average of the previous five samples to smooth
% things out, which will result in a five-sample latency in our convolved
% output.
% To simplify, the window length determines the amount of averaging that
% takes place, and the window area determines the relative scaling done by
% that window. For this script, the window length is a user-defined
% parameter, and the window area is hard-coded to be equal to one (eg. no
% scaling). Changing the function variable 'winHeight' will change the
% window area.
%
% Finally, this function is hard-coded to correct for the window latency
% seen in the optional x-axis vector output (eg. time, frequency, etc.). In
% other words, there should not be a noticeable shift in the convolution
% output when it is plotted against the optional x-axis output. If this
% feature is not desired, one may simply swap the current 'xAxisConv(ii)'
% line of code with the one directly above it, which is commented out by
% default. This will remove latency correction, and the convolution output
% will have a latency equal to the window length when plotted against the
% optional x-axis output.

% -------------------------------------------------------------------------

% Inputs:
%   - data: any numeric 1-dimensional vector [size 1xN or Nx1]
%   - winSize: the number of samples you would like to average for each
%              point in 'data' (winSize = 150 is a good starting point)
%   - varargin: < optional input variables >
%       > xAxisVar: any independent array versus which you wish to plot
%                   'data' [size 1xN or Nx1]

% Outputs:
%   - dataConv: a 1-dimensional vector that represents the moving average
%               of the 'data' input [size 1x(N-winSize)]
%   - varargout: < optional output variables >
%       > xAxisConv: a 1-dimensional vector that represents the independent
%                    variable versus which to plot 'dataConv'; adjusted for
%                    size to allow immediate plotting of 'dataConv', and
%                    potentially adjusted for window latency depending on
%                    configuration of 'xAxisConv(ii)' line below [size
%                    1x(N-winSize)]

function [outputVar,varargout] = movingAvg(data,winSize,varargin)
    
    winLen = winSize;
    
    winHeight = 1/winLen;
    
    % >>> for i in range(size(data){2}), populate dataOut array <<<
    % >>> if size(data){2} is greater than 1, get table labels <<<
    % >>> ...then construct outputVar as table variable <<<
    % >>> else, save dataOut array to outputVar as 1D double <<<
    
    dataDimens = size(data);
    numVars = dataDimens(2);
    numPoints = dataDimens(1);
    numPointsConv = numPoints - 2*winLen;
    dataOut = zeros(numPointsConv,numVars);
    
    % -- Perform checks in the event that input variable is not 1-dimensional --
    if(numVars>1)
        labels = data.Properties.VariableNames;             % table lables
        varTypes = data.Properties.VariableDescriptions;    % column variable types
        isValid = ~isempty(varTypes{end}); % checks if last column is empty array (which breaks the code below)
        % -- If last column of data is empty, trim data and re-calculate previous variables --
        if(isValid==0)
            numVars = numVars - 1;  % recalculate numVars
            if(numVars==0)  % should only happen if you pass empty 1D array into movingAvg function
                disp('Error: Cannot take a moving average on an empty 1D array');
            end
            labels = labels(1:numVars);     % get rid of last label
            data = data(:,1:numVars);       % trim data
            dataOut = zeros(numPointsConv,numVars); % re-initialize dataOut
        end
        data = table2array(data);
    end
    
    for kk=1:numVars
        dataConv = zeros(numPointsConv,1);  % averaged data output
        dataAux = zeros(winLen,1);  % auxiliary data array, moving avg window

        for ii=1:numPointsConv
            % -- Update current window with values from 'data' --
            for jj=1:winLen
                dataAux(jj) = data(ii+jj-1,kk);
            end
            % -- Calculate and write moving average values --
            dataConv(ii) = winHeight*sum(dataAux);
        end
        dataOut(:,kk) = dataConv;
    end
    
    if(numVars==1)
        outputVar = dataOut;
    elseif(numVars>1)
        outputVar = array2table(dataOut,'VariableNames',labels);
    else
        disp('Error: ''numVars'' should not be less than one at this point in the code, check ''movingAvg()'' code');
        outputVar = "Look in movingAvg() code to find error";
    end
    
    % -- If frequency array was included, trim this to match convolved data --
    if(nargin==3)
        xAxisVar = varargin{1};
        xAxisConv = zeros(numPointsConv,1);   % resultant frequency array
        % -- Calculate and write moving average values & frequencies --
        for nn=1:numPointsConv
            %xAxisConv(nn) = xAxisVar(nn+(winLen-1)); % true moving average
            xAxisConv(nn) = xAxisVar(nn+ceil(winLen/2)); % corrected for window latency
        end
        varargout{1} = xAxisConv;
    end
end



% -------------------------------------------------------------------------

% function [freqConv,dataConv] = movingAvg(frequency,data,winSize)
%     
%     winLen = winSize;
%     winHeight = 1/winLen;
%     
%     dataConv = zeros(length(data)-2*winLen,1);  % averaged data output
%     freqConv = zeros(length(dataConv),1);       % resultant frequency array
%     dataAux = zeros(winLen,1);  % auxiliary data array, moving avg window
%     
%     for ii=1:length(dataConv)
%         % -- Update current window with values from 'data' --
%         for jj=1:winLen
%             dataAux(jj) = data(ii+jj-1);
%         end
%         % -- Calculate and write moving average values & frequencies --
%         dataConv(ii) = winHeight*sum(dataAux);
%         %freqConv(ii) = frequency(ii+(winLen-1)); % true moving average
%         freqConv(ii) = frequency(ii+(winLen/2)); % corrected for window latency
%     end
%     
% end
