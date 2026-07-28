unit ges_gerror;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gst, ges_enums;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



  {$IFDEF read_enum}
type
  PGESError = ^TGESError;
  TGESError = longint;
const
  GES_ERROR_ASSET_WRONG_ID = 0;
  GES_ERROR_ASSET_LOADING = 1;
  GES_ERROR_FORMATTER_MALFORMED_INPUT_FILE = 2;
  GES_ERROR_INVALID_FRAME_NUMBER = 3;
  GES_ERROR_NEGATIVE_LAYER = 4;
  GES_ERROR_NEGATIVE_TIME = 5;
  GES_ERROR_NOT_ENOUGH_INTERNAL_CONTENT = 6;
  GES_ERROR_INVALID_OVERLAP_IN_TRACK = 7;
  GES_ERROR_INVALID_EFFECT_BIN_DESCRIPTION = 8;
  {$ENDIF read_enum}

{$IFDEF read_function}
function ges_error_quark: TGQuark; cdecl; external libges;

// === Konventiert am: 27-7-26 20:01:23 ===

function GES_ERROR: TGQuark;
{$ENDIF read_function}

implementation

function GES_ERROR: TGQuark;
begin
  GES_ERROR := ges_error_quark;
end;

end.
