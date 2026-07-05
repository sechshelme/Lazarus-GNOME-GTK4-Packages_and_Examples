{$IFDEF read_interface}


function gsk_border_node_get_type: TGType; cdecl; external libgtk4;
function gsk_border_node_new(outline: PGskRoundedRect; border_width: Psingle; border_color: PGdkRGBA): PGskRenderNode; cdecl; external libgtk4;
function gsk_border_node_get_outline(node: PGskRenderNode): PGskRoundedRect; cdecl; external libgtk4;
function gsk_border_node_get_widths(node: PGskRenderNode): Psingle; cdecl; external libgtk4;
function gsk_border_node_get_colors(node: PGskRenderNode): PGdkRGBA; cdecl; external libgtk4;

// === Konventiert am: 4-7-26 20:09:37 ===

function GSK_TYPE_BORDER_NODE: TGType;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GSK_TYPE_BORDER_NODE: TGType;
begin
  GSK_TYPE_BORDER_NODE := gsk_border_node_get_type;
end;



{$ENDIF read_implementation}
