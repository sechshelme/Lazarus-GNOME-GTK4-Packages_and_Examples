unit gsktexturescalenode;

interface

uses
  fp_glib2, fp_graphene, fp_gtk4, gsktypes, gskenums;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function gsk_texture_scale_node_get_type: TGType; cdecl; external libgtk4;
function gsk_texture_scale_node_new(texture: PGdkTexture; bounds: Pgraphene_rect_t; filter: TGskScalingFilter): PGskRenderNode; cdecl; external libgtk4;
function gsk_texture_scale_node_get_texture(node: PGskRenderNode): PGdkTexture; cdecl; external libgtk4;
function gsk_texture_scale_node_get_filter(node: PGskRenderNode): TGskScalingFilter; cdecl; external libgtk4;

// === Konventiert am: 5-7-26 13:38:55 ===

function GSK_TYPE_TEXTURE_SCALE_NODE: TGType;

implementation

function GSK_TYPE_TEXTURE_SCALE_NODE: TGType;
begin
  GSK_TYPE_TEXTURE_SCALE_NODE := gsk_texture_scale_node_get_type;
end;



end.
