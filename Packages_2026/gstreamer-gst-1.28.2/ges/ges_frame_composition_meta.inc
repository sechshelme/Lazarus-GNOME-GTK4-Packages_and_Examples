

  {$IFDEF read_struct}
type
  PGESFrameCompositionMeta = ^TGESFrameCompositionMeta;
  TGESFrameCompositionMeta = record
    meta: TGstMeta;
    alpha: Tgdouble;
    posx: Tgdouble;
    posy: Tgdouble;
    height: Tgdouble;
    width: Tgdouble;
    zorder: Tguint;
    operer: Tgint;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function ges_frame_composition_meta_api_get_type: TGType; cdecl; external libges;
function ges_buffer_add_frame_composition_meta(buffer: PGstBuffer): PGESFrameCompositionMeta; cdecl; external libges;

// === Konventiert am: 27-7-26 20:01:34 ===

function GES_TYPE_META_FRAME_COMPOSITION: TGType;
{$ENDIF read_function}


{$IFDEF read_implementation}

function GES_TYPE_META_FRAME_COMPOSITION: TGType;
begin
  GES_TYPE_META_FRAME_COMPOSITION := ges_frame_composition_meta_api_get_type;
end;

{$ENDIF read_implementation}
