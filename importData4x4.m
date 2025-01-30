function data = importData4x4(filename)

    dataRaw = readtable(filename);
    data.freq = dataRaw.freq_Hz_./1e9;
    data.S11_mag = dataRaw.db_Trc1_S11;
    data.S11_ph = unwrap(dataRaw.ang_Trc1_S11./180*pi)./pi*180;
    data.S12_mag = dataRaw.db_Trc2_S12;
    data.S12_ph = unwrap(dataRaw.ang_Trc2_S12./180*pi)./pi*180;
    data.S13_mag = dataRaw.db_Trc3_S13;
    data.S13_ph = unwrap(dataRaw.ang_Trc3_S13./180*pi)./pi*180;
    data.S14_mag = dataRaw.db_Trc4_S14;
    data.S14_ph = unwrap(dataRaw.ang_Trc4_S14./180*pi)./pi*180;
    data.S21_mag = dataRaw.db_Trc5_S21;
    data.S21_ph = unwrap(dataRaw.ang_Trc5_S21./180*pi)./pi*180;
    data.S22_mag = dataRaw.db_Trc6_S22;
    data.S22_ph = unwrap(dataRaw.ang_Trc6_S22./180*pi)./pi*180;
    data.S23_mag = dataRaw.db_Trc7_S23;
    data.S23_ph = unwrap(dataRaw.ang_Trc7_S23./180*pi)./pi*180;
    data.S24_mag = dataRaw.db_Trc8_S24;
    data.S24_ph = unwrap(dataRaw.ang_Trc8_S24./180*pi)./pi*180;
    data.S31_mag = dataRaw.db_Trc9_S31;
    data.S31_ph = unwrap(dataRaw.ang_Trc9_S31./180*pi)./pi*180;
    data.S32_mag = dataRaw.db_Trc10_S32;
    data.S32_ph = unwrap(dataRaw.ang_Trc10_S32./180*pi)./pi*180;
    data.S33_mag = dataRaw.db_Trc11_S33;
    data.S33_ph = unwrap(dataRaw.ang_Trc11_S33./180*pi)./pi*180;
    data.S34_mag = dataRaw.db_Trc12_S34;
    data.S34_ph = unwrap(dataRaw.ang_Trc12_S34./180*pi)./pi*180;
    data.S41_mag = dataRaw.db_Trc13_S41;
    data.S41_ph = unwrap(dataRaw.ang_Trc13_S41./180*pi)./pi*180;
    data.S42_mag = dataRaw.db_Trc14_S42;
    data.S42_ph = unwrap(dataRaw.ang_Trc14_S42./180*pi)./pi*180;
    data.S43_mag = dataRaw.db_Trc15_S43;
    data.S43_ph = unwrap(dataRaw.ang_Trc15_S43./180*pi)./pi*180;
    data.S44_mag = dataRaw.db_Trc16_S44;
    data.S44_ph = unwrap(dataRaw.ang_Trc16_S44./180*pi)./pi*180;

end