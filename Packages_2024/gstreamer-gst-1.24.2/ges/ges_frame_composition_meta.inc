{$IFDEF read_interface}

function ges_frame_composition_meta_api_get_type: TGType; cdecl; external libges;

type
  TGESFrameCompositionMeta = record
    meta: TGstMeta;
    alpha: Tgdouble;
    posx: Tgdouble;
    posy: Tgdouble;
    Height: Tgdouble;
    Width: Tgdouble;
    zorder: Tguint;
    operator_: Tgint;
  end;
  PGESFrameCompositionMeta = ^TGESFrameCompositionMeta;


function ges_buffer_add_frame_composition_meta(buffer: PGstBuffer): PGESFrameCompositionMeta; cdecl; external libges;

// === Konventiert am: 13-12-24 16:48:17 ===

function GES_TYPE_META_FRAME_COMPOSITION: TGType;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GES_TYPE_META_FRAME_COMPOSITION: TGType;
begin
  GES_TYPE_META_FRAME_COMPOSITION := ges_frame_composition_meta_api_get_type;
end;


{$ENDIF read_implementation}
