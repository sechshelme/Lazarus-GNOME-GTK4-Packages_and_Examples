unit gmime_error;

interface

uses
  fp_glib2, fp_gmime3;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


var
  gmime_error_quark: TGQuark; cvar;external libgmime3;

const
  GMIME_ERROR = gmime_error_quark;

function GMIME_ERROR_IS_SYSTEM(error: longint): longint;

const
  GMIME_ERROR_GENERAL = -(1);
  GMIME_ERROR_NOT_SUPPORTED = -(2);
  GMIME_ERROR_INVALID_OPERATION = -(3);
  GMIME_ERROR_PARSE_ERROR = -(4);
  GMIME_ERROR_PROTOCOL_ERROR = -(5);

var
  gmime_gpgme_error_quark: TGQuark; cvar;external libgmime3;

const
  GMIME_GPGME_ERROR = gmime_gpgme_error_quark;

  // === Konventiert am: 18-9-25 15:26:53 ===


implementation


function GMIME_ERROR_IS_SYSTEM(error: longint): longint;
begin
  GMIME_ERROR_IS_SYSTEM := error > 0;
end;


end.
