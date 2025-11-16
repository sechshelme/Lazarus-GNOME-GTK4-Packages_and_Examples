{$IFDEF read_interface}


function GEOCODE_ERROR: TGQuark;

type
  PGeocodeError = ^TGeocodeError;
  TGeocodeError = longint;

const
  GEOCODE_ERROR_PARSE = 0;
  GEOCODE_ERROR_NOT_SUPPORTED = 1;
  GEOCODE_ERROR_NO_MATCHES = 2;
  GEOCODE_ERROR_INVALID_ARGUMENTS = 3;
  GEOCODE_ERROR_INTERNAL_SERVER = 4;

function geocode_error_quark: TGQuark; cdecl; external libgeocode_glib;

// === Konventiert am: 15-11-25 16:51:28 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function GEOCODE_ERROR: TGQuark;
begin
  GEOCODE_ERROR := geocode_error_quark;
end;


{$ENDIF read_implementation}
