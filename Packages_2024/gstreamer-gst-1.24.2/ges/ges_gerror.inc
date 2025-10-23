{$IFDEF read_interface}

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

  function GES_ERROR: TGQuark;

  // === Konventiert am: 13-12-24 16:48:24 ===

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GES_ERROR: TGQuark;
begin
  GES_ERROR := g_quark_from_static_string('GES_ERROR');
end;



{$ENDIF read_implementation}
