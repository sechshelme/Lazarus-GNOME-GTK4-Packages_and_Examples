unit gskrendernode;

interface

uses
  fp_glib2, fp_graphene, fp_cairo, fp_gtk4, gsktypes, gskenums;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PGskColorStop = ^TGskColorStop;
  TGskColorStop = record
    offset: single;
    color: TGdkRGBA;
  end;

  PGskParseLocation = ^TGskParseLocation;
  TGskParseLocation = record
    bytes: Tgsize;
    chars: Tgsize;
    lines: Tgsize;
    line_bytes: Tgsize;
    line_chars: Tgsize;
  end;

  TGskParseErrorFunc = procedure(start: PGskParseLocation; end_: PGskParseLocation; error: PGError; user_data: Tgpointer); cdecl;

function gsk_render_node_get_type: TGType; cdecl; external libgtk4;
function gsk_serialization_error_quark: TGQuark; cdecl; external libgtk4;
function gsk_render_node_ref(node: PGskRenderNode): PGskRenderNode; cdecl; external libgtk4;
procedure gsk_render_node_unref(node: PGskRenderNode); cdecl; external libgtk4;
function gsk_render_node_get_node_type(node: PGskRenderNode): TGskRenderNodeType; cdecl; external libgtk4;
procedure gsk_render_node_get_bounds(node: PGskRenderNode; bounds: Pgraphene_rect_t); cdecl; external libgtk4;
function gsk_render_node_get_children(self: PGskRenderNode; n_children: Pgsize): PPGskRenderNode; cdecl; external libgtk4;
function gsk_render_node_get_opaque_rect(self: PGskRenderNode; out_opaque: Pgraphene_rect_t): Tgboolean; cdecl; external libgtk4;
procedure gsk_render_node_draw(node: PGskRenderNode; cr: Pcairo_t); cdecl; external libgtk4;
function gsk_render_node_serialize(node: PGskRenderNode): PGBytes; cdecl; external libgtk4;
function gsk_render_node_write_to_file(node: PGskRenderNode; filename: pchar; error: PPGError): Tgboolean; cdecl; external libgtk4;
function gsk_render_node_deserialize(bytes: PGBytes; error_func: TGskParseErrorFunc; user_data: Tgpointer): PGskRenderNode; cdecl; external libgtk4;

procedure gsk_value_set_render_node(value: PGValue; node: PGskRenderNode); cdecl; external libgtk4;
procedure gsk_value_take_render_node(value: PGValue; node: PGskRenderNode); cdecl; external libgtk4;
function gsk_value_get_render_node(value: PGValue): PGskRenderNode; cdecl; external libgtk4;
function gsk_value_dup_render_node(value: PGValue): PGskRenderNode; cdecl; external libgtk4;

function GSK_SERIALIZATION_ERROR: TGQuark;
function GSK_VALUE_HOLDS_RENDER_NODE(value: PGValue): Tgboolean;



// === Konventiert am: 5-7-26 13:36:21 ===

function GSK_TYPE_RENDER_NODE: TGType;
function GSK_IS_RENDER_NODE(obj: Pointer): Tgboolean;

implementation

function GSK_TYPE_RENDER_NODE: TGType;
begin
  GSK_TYPE_RENDER_NODE := gsk_render_node_get_type;
end;

function GSK_IS_RENDER_NODE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GSK_TYPE_RENDER_NODE);
end;


function GSK_SERIALIZATION_ERROR: TGQuark;
begin
  GSK_SERIALIZATION_ERROR := gsk_serialization_error_quark;
end;

function GSK_VALUE_HOLDS_RENDER_NODE(value: PGValue): Tgboolean;
begin
  GSK_VALUE_HOLDS_RENDER_NODE := G_VALUE_HOLDS(value, GSK_TYPE_RENDER_NODE);
end;


end.
