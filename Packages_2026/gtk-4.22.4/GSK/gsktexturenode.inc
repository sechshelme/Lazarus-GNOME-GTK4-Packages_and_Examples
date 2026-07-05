{$IFDEF read_interface}


function gsk_texture_node_get_type: TGType; cdecl; external libgtk4;
function gsk_texture_node_new(texture: PGdkTexture; bounds: Pgraphene_rect_t): PGskRenderNode; cdecl; external libgtk4;
function gsk_texture_node_get_texture(node: PGskRenderNode): PGdkTexture; cdecl; external libgtk4;

// === Konventiert am: 5-7-26 13:38:59 ===

function GSK_TYPE_TEXTURE_NODE: TGType;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GSK_TYPE_TEXTURE_NODE: TGType;
begin
  GSK_TYPE_TEXTURE_NODE := gsk_texture_node_get_type;
end;



{$ENDIF read_implementation}
