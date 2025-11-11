{$IFDEF read_interface}


const
  SPQR_ORDERING_FIXED = 0;
  SPQR_ORDERING_NATURAL = 1;
  SPQR_ORDERING_COLAMD = 2;
  SPQR_ORDERING_GIVEN = 3;
  SPQR_ORDERING_CHOLMOD = 4;
  SPQR_ORDERING_AMD = 5;
  SPQR_ORDERING_METIS = 6;
  SPQR_ORDERING_DEFAULT = 7;
  SPQR_ORDERING_BEST = 8;
  SPQR_ORDERING_BESTAMD = 9;
  SPQR_DEFAULT_TOL = -(2);
  SPQR_NO_TOL = -(1);
  SPQR_QTX = 0;
  SPQR_QX = 1;
  SPQR_XQT = 2;
  SPQR_XQ = 3;
  SPQR_RX_EQUALS_B = 0;
  SPQR_RETX_EQUALS_B = 1;
  SPQR_RTX_EQUALS_B = 2;
  SPQR_RTX_EQUALS_ETB = 3;
  SPQR_DATE = 'Jan 20, 2024';
  SPQR_MAIN_VERSION = 4;
  SPQR_SUB_VERSION = 3;
  SPQR_SUBSUB_VERSION = 2;

function SPQR_VER_CODE(main, sub: longint): longint;
function SPQR_VERSION: longint;

// === Konventiert am: 4-11-25 19:29:35 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function SPQR_VER_CODE(main, sub: longint): longint;
begin
  SPQR_VER_CODE := SUITESPARSE_VER_CODE(main, sub);
end;

function SPQR_VERSION: longint;
begin
  SPQR_VERSION := SPQR_VER_CODE(4, 3);
end;


{$ENDIF read_implementation}
