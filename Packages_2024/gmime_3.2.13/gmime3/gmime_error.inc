{$IFDEF read_interface}


var
  gmime_error_quark: TGQuark; cvar;external libgmime3;
  GMIME_ERROR_: TGQuark absolute gmime_error_quark;

function GMIME_ERROR_IS_SYSTEM(error: TGQuark): Boolean;

const
  GMIME_ERROR_GENERAL = -(1);
  GMIME_ERROR_NOT_SUPPORTED = -(2);
  GMIME_ERROR_INVALID_OPERATION = -(3);
  GMIME_ERROR_PARSE_ERROR = -(4);
  GMIME_ERROR_PROTOCOL_ERROR = -(5);

var
  gmime_gpgme_error_quark: TGQuark; cvar;external libgmime3;
  GMIME_GPGME_ERROR: TGQuark absolute gmime_gpgme_error_quark;

  // === Konventiert am: 18-9-25 15:26:53 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function GMIME_ERROR_IS_SYSTEM(error: TGQuark): Boolean;
begin
  GMIME_ERROR_IS_SYSTEM := error > 0;
end;


{$ENDIF read_implementation}
