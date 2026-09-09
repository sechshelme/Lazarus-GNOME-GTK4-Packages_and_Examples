{$IFDEF read_interface}


type
  PradioNuclideData = ^TradioNuclideData;
  TradioNuclideData = record
    name: pchar;
    Z: longint;
    A: longint;
    N: longint;
    Z_xray: longint;
    nXrays: longint;
    XrayLines: Plongint;
    XrayIntensities: Pdouble;
    nGammas: longint;
    GammaEnergies: Pdouble;
    GammaIntensities: Pdouble;
  end;

function GetRadioNuclideDataByName(radioNuclideString: pchar; error: PPxrl_error): PradioNuclideData; cdecl; external libxrl;
function GetRadioNuclideDataByIndex(radioNuclideIndex: longint; error: PPxrl_error): PradioNuclideData; cdecl; external libxrl;
function GetRadioNuclideDataList(nRadioNuclides: Plongint; error: PPxrl_error): Ppchar; cdecl; external libxrl;
procedure FreeRadioNuclideData(radioNuclideData: PradioNuclideData); cdecl; external libxrl;

const
  RADIO_NUCLIDE_55FE = 0;
  RADIO_NUCLIDE_57CO = 1;
  RADIO_NUCLIDE_109CD = 2;
  RADIO_NUCLIDE_125I = 3;
  RADIO_NUCLIDE_137CS = 4;
  RADIO_NUCLIDE_133BA = 5;
  RADIO_NUCLIDE_153GD = 6;
  RADIO_NUCLIDE_238PU = 7;
  RADIO_NUCLIDE_241AM = 8;
  RADIO_NUCLIDE_244CM = 9;

  // === Konventiert am: 8-9-26 17:30:44 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
