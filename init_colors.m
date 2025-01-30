% init_colors.m
% 
% Author: Jacob Moynihan (adapted from 'rgb.m' provided by MathWorks)
% Date: Feb.13.2024
% 
% -------------------------------------------------------------------------
% 
% The purpose of this function is to import a very large variety of colors
% into any existing MATLAB script where plotting data is required. These
% colors are imported as a single structure variable 'c', and each color
% can be accessed using dot indexing. For example:
% 
%     'plot(x,y,'Color',c.lightGrey)'
% 
% New colors can also be added to the existing color structure simply by
% declaring them in the same way as they are defined in the function
% below. For example:
% 
%    'c.myColor01 = '#XXXXXX';    % hex argument'
%    'c.myColor02 = [X X X];      % RGB triplet argument'
% 
% To use this script, make sure it has been added to the current MATLAB
% path or exists in the current working directory, and then initialize the
% color structure by writing the following line of code at the beginning of
% the plotting script:
% 
%    'c = init_colors();' 
% 
% If done right, the color structure 'c' should appear in the 'Workspace'
% panel, where the user can investigate which colors are contained therein.
% -------------------------------------------------------------------------

function c = init_colors()

    c = struct();

    % --- MATLAB Colors ---
    c.matBlue = [0 0.4470 0.7410];
    c.matOrange = [0.8500 0.3250 0.0980];
    c.matYellow = [0.9290 0.6940 0.1250];
    c.matPurple = [0.4940 0.1840 0.5560];
    c.matGreen = [0.4660 0.6740 0.1880];
    c.matCyan = [0.3010 0.7450 0.9330];
    c.matRed = [0.6350 0.0780 0.1840];
    c.matGold = [0.75 0.75 0];
    c.matGrey = [0.25 0.25 0.25];
    
    % --- White colors ---
    c.white = '#FFFFFF';
    c.snow = '#FFFAFA';
    c.honeydew = '#F0FFF0';
    c.mintCream = '#F5FFFA';
    c.azure = '#F0FFFF';
    c.aliceBlue = '#F0F8FF';
    c.ghostWhite = '#F8F8FF';
    c.whiteSmoke = '#F5F5F5';
    c.seashell = '#FFF5EE';
    c.beige = '#F5F5DC';
    c.oldLace = '#FDF5E6';
    c.floralWhite = '#FFFAF0';
    c.ivory = '#FFFFF0';
    c.antiqueWhite = '#FAEBD7';
    c.linen = '#FAF0E6';
    c.lavenderBlush = '#FFF0F5';
    c.mistyRose = '#FFE4E1';
    
    % --- Grey colors ---
    c.grey = '#808080';
    c.gainsboro = '#DCDCDC';
    c.lightGrey = '#D3D3D3';
    c.silver = '#C0C0C0';
    c.darkGrey = '#A9A9A9';
    c.dimGrey = '#696969';
    c.lightSlateGrey = '#778899';
    c.slateGrey = '#708090';
    c.darkSlateGrey = '#2F4F4F';
    c.black = '#000000';

    % --- Red colors ---
    c.red = '#FF0000';
    c.lightSalmon = '#FFA07A';
    c.salmon = '#FA8072';
    c.darkSalmon = '#E9967A';
    c.lightCoral = '#F08080';
    c.indianRed = '#CD5C5C';
    c.crimson = '#DC143C';
    c.fireBrick = '#B22222';
    c.darkRed = '#8B0000';

    % --- Pink colors ---
    c.pink = '#FFC0CB';
    c.lightPink = '#FFB6C1';
    c.hotPink = '#FF69B4';
    c.deepPink = '#FF1493';
    c.paleVioletRed = '#DB7093';
    c.mediumVioletRed = '#C71585';

    % --- Orange colors ---
    c.orange = '#FFA500';
    c.darkOrange = '#FF8C00';
    c.coral = '#FF7F50';
    c.tomato = '#FF6347';
    c.orangeRed = '#FF4500';

    % --- Yellow colors ---
    c.yellow = '#FFFF00';
    c.lightYellow = '#FFFFE0';
    c.lemonChiffon = '#FFFACD';
    c.lightGoldenrodYellow = '#FAFAD2';
    c.papayaWhip = '#FFEFD5';
    c.moccasin = '#FFE4B5';
    c.peachPuff = '#FFDAB9';
    c.paleGoldenrod = '#EEE8AA';
    c.khaki = '#F0E68C';
    c.darkKhaki = '#BDB76B';
    c.gold = '#FFD700';

    % --- Brown colors ---
    c.brown = '#A52A2A';
    c.cornsilk = '#FFF8DC';
    c.blanchedAlmond = '#FFEBCD';
    c.bisque = '#FFE4C4';
    c.navajoWhite = '#FFDEAD';
    c.wheat = '#F5DEB3';
    c.burlyWood = '#DEB887';
    c.tan = '#D2B48C';
    c.rosyBrown = '#BC8F8F';
    c.sandyBrown = '#F4A460';
    c.goldenrod = '#DAA520';
    c.darkGoldenrod = '#B8860B';
    c.peru = '#CD853F';
    c.chocolate = '#D2691E';
    c.saddleBrown = '#8B4513';
    c.sienna = '#A0522D';
    c.maroon = '#800000';

    % --- Green colors ---
    c.green = '#008000';
    c.paleGreen = '#98FB98';
    c.lightGreen = '#90EE90';
    c.yellowGreen = '#9ACD32';
    c.greenYellow = '#ADFF2F';
    c.chartreuse = '#7FFF00';
    c.lawnGreen = '#7CFC00';
    c.lime = '#00FF00';
    c.limeGreen = '#32CD32';
    c.mediumSpringGreen = '#00FA9A';
    c.springGreen = '#00FF7F';
    c.mediumAquamarine = '#66CDAA';
    c.aquamarine = '#7FFFD4';
    c.lightSeaGreen = '#20B2AA';
    c.mediumSeaGreen = '#3CB371';
    c.seaGreen = '#2E8B57';
    c.darkSeaGreen = '#8FBC8F';
    c.forestGreen = '#228B22';
    c.darkGreen = '#006400';
    c.oliveDrab = '#6B8E23';
    c.olive = '#808000';
    c.darkOliveGreen = '#556B2F';
    c.teal = '#008080';

    % --- Blue colors ---
    c.blue = '#0000FF';
    c.lightBlue = '#ADD8E6';
    c.powderBlue = '#B0E0E6';
    c.paleTurquoise = '#AFEEEE';
    c.turquoise = '#40E0D0';
    c.mediumTurquoise = '#48D1CC';
    c.darkTurquoise = '#00CED1';
    c.lightCyan = '#E0FFFF';
    c.cyan = '#00FFFF';
    c.aqua = '#00FFFF';
    c.darkCyan = '#008B8B';
    c.cadetBlue = '#5F9EA0';
    c.lightSteelBlue = '#B0C4DE';
    c.steelBlue = '#4682B4';
    c.lightSkyBlue = '#87CEFA';
    c.skyBlue = '#87CEEB';
    c.deepSkyBlue = '#00BFFF';
    c.dodgerBlue = '#1E90FF';
    c.cornflowerBlue = '#6495ED';
    c.royalBlue = '#4169E1';
    c.mediumBlue = '#0000CD';
    c.darkBlue = '#00008B';
    c.navy = '#000080';
    c.midnightBlue = '#191970';

    % --- Purple colors ---
    c.purple = '#800080';
    c.lavender = '#E6E6FA';
    c.thistle = '#D8BFD8';
    c.plum = '#DDA0DD';
    c.violet = '#EE82EE';
    c.orchid = '#DA70D6';
    c.fuchsia = '#FF00FF';
    c.magenta = '#FF00FF';
    c.mediumOrchid = '#BA55D3';
    c.mediumPurple = '#9370DB';
    c.amethyst = '#9966CC';
    c.blueViolet = '#8A2BE2';
    c.darkViolet = '#9400D3';
    c.darkOrchid = '#9932CC';
    c.darkMagenta = '#8B008B';
    c.slateBlue = '#6A5ACD';
    c.darkSlateBlue = '#483D8B';
    c.mediumSlateBlue = '#7B68EE';
    c.indigo = '#4B0082';

end



% function c = init_colors()
% 
%     % --- White colors ---
%     c.white = '#FFFFFF';
%     c.snow = '';
%     c.honeydew = '';
%     c.mintCream = '';
%     c.azure = '';
%     c.aliceBlue = '';
%     c.ghostWhite = '';
%     c.whiteSmoke = '';
%     c.seashell = '';
%     c.beige = '';
%     c.oldLace = '';
%     c.floralWhite = '';
%     c.ivory = '';
%     c.antiqueWhite= '';
%     c.linen = '';
%     c.lavenderBlush = '';
%     c.mistyRose = '';
% 
%     % --- Grey colors ---
%     c.grey = '';
%     c.gainsboro = '';
%     c.lightGrey = '';
%     c.silver = '';
%     c.darkGrey = '';
%     c.dimGrey = '';
%     c.lightSlateGrey = '';
%     c.slateGrey = '';
%     c.darkSlateGrey = '';
%     c.black = '#000000';
% 
%     % --- Red colors ---
%     c.red = '';
%     c.lightSalmon = '';
%     c.salmon = '';
%     c.darkSalmon = '';
%     c.lightCoral = '';
%     c.indianRed = '';
%     c.crimson = '';
%     c.fireBrick = '';
%     c.darkRed = '';
% 
%     % --- Pink colors ---
%     c.pink = '';
%     c.lightPink = '';
%     c.hotPink = '';
%     c.deepPink = '';
%     c. = '';
%     c. = '';
% 
%     % --- Orange colors ---
%     c. = '';
%     c. = '';
%     c. = '';
%     c. = '';
%     c. = '';
% 
%     % --- Yellow colors ---
%     c. = '';
%     c. = '';
%     c. = '';
%     c. = '';
%     c. = '';
%     c. = '';
%     c. = '';
%     c. = '';
%     c. = '';
%     c. = '';
%     c. = '';
% 
%     % --- Brown colors ---
%     c. = '';
%     c. = '';
%     c. = '';
%     c. = '';
%     c. = '';
%     c. = '';
%     c. = '';
%     c. = '';
%     c. = '';
%     c. = '';
%     c. = '';
%     c. = '';
%     c. = '';
%     c. = '';
%     c. = '';
%     c. = '';
%     c. = '';
% 
%     % --- Green colors ---
%     c. = '';
%     c. = '';
%     c. = '';
%     c. = '';
%     c. = '';
%     c. = '';
%     c. = '';
%     c. = '';
%     c. = '';
%     c. = '';
%     c. = '';
%     c. = '';
%     c. = '';
%     c. = '';
%     c. = '';
%     c. = '';
%     c. = '';
%     c. = '';
%     c. = '';
%     c. = '';
%     c. = '';
%     c. = '';
%     c. = '';
% 
%     % --- Blue colors ---
%     c. = '';
%     c. = '';
%     c. = '';
%     c. = '';
%     c. = '';
%     c. = '';
%     c. = '';
%     c. = '';
%     c. = '';
%     c. = '';
%     c. = '';
%     c. = '';
%     c. = '';
%     c. = '';
%     c. = '';
%     c. = '';
%     c. = '';
%     c. = '';
%     c. = '';
%     c. = '';
%     c. = '';
%     c. = '';
%     c. = '';
%     c. = '';
% 
%     % --- Purple colors ---
%     c. = '';
%     c. = '';
%     c. = '';
%     c. = '';
%     c. = '';
%     c. = '';
%     c. = '';
%     c. = '';
%     c. = '';
%     c. = '';
%     c. = '';
%     c. = '';
%     c. = '';
%     c. = '';
%     c. = '';
%     c. = '';
%     c. = '';
%     c. = '';
%     c. = '';
% 
% end