{$IFDEF read_interface}


type
  PGskShadow = ^TGskShadow;
  TGskShadow = record
    color: TGdkRGBA;
    dx: single;
    dy: single;
    radius: single;
  end;

function gsk_shadow_node_get_type: TGType; cdecl; external libgtk4;
function gsk_shadow_node_new(child: PGskRenderNode; shadows: PGskShadow; n_shadows: Tgsize): PGskRenderNode; cdecl; external libgtk4;
function gsk_shadow_node_get_child(node: PGskRenderNode): PGskRenderNode; cdecl; external libgtk4;
function gsk_shadow_node_get_shadow(node: PGskRenderNode; i: Tgsize): PGskShadow; cdecl; external libgtk4;
function gsk_shadow_node_get_n_shadows(node: PGskRenderNode): Tgsize; cdecl; external libgtk4;

// === Konventiert am: 5-7-26 13:35:29 ===

function GSK_TYPE_SHADOW_NODE: TGType;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GSK_TYPE_SHADOW_NODE: TGType;
begin
  GSK_TYPE_SHADOW_NODE := gsk_shadow_node_get_type;
end;



{$ENDIF read_implementation}
