unit xb_node;

interface

uses
  fp_glib2, fp_xmlb;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TXbNode = record
    parent_instance: TGObject;
  end;
  PXbNode = ^TXbNode;
  PPXbNode = ^PXbNode;

  TXbNodeClass = record
    parent_class: TGObjectClass;
    _xb_reserved1: procedure; cdecl;
    _xb_reserved2: procedure; cdecl;
    _xb_reserved3: procedure; cdecl;
    _xb_reserved4: procedure; cdecl;
    _xb_reserved5: procedure; cdecl;
    _xb_reserved6: procedure; cdecl;
    _xb_reserved7: procedure; cdecl;
  end;
  PXbNodeClass = ^TXbNodeClass;

  PXbNodeExportFlags = ^TXbNodeExportFlags;
  TXbNodeExportFlags = longint;

const
  XB_NODE_EXPORT_FLAG_NONE = 0;
  XB_NODE_EXPORT_FLAG_ADD_HEADER = 1 shl 0;
  XB_NODE_EXPORT_FLAG_FORMAT_MULTILINE = 1 shl 1;
  XB_NODE_EXPORT_FLAG_FORMAT_INDENT = 1 shl 2;
  XB_NODE_EXPORT_FLAG_INCLUDE_SIBLINGS = 1 shl 3;
  XB_NODE_EXPORT_FLAG_ONLY_CHILDREN = 1 shl 4;
  XB_NODE_EXPORT_FLAG_COLLAPSE_EMPTY = 1 shl 5;
  XB_NODE_EXPORT_FLAG_LAST = (1 shl 5) + 1;

type
  TXbNodeAttrIter = record
    dummy1: Tgpointer;
    dummy2: Tguint8;
    dummy3: Tgpointer;
    dummy4: Tgpointer;
    dummy5: Tgpointer;
    dummy6: Tgpointer;
  end;
  PXbNodeAttrIter = ^TXbNodeAttrIter;

  TXbNodeChildIter = record
    dummy1: Tgpointer;
    dummy2: Tgpointer;
    dummy3: Tgboolean;
    dummy4: Tgpointer;
    dummy5: Tgpointer;
    dummy6: Tgpointer;
  end;
  PXbNodeChildIter = ^TXbNodeChildIter;

  TXbNodeTransmogrifyFunc = function(self: PXbNode; user_data: Tgpointer): Tgboolean; cdecl;

function xb_node_get_type: TGType; cdecl; external libxmlb;
function xb_node_transmogrify(self: PXbNode; func_text: TXbNodeTransmogrifyFunc; func_tail: TXbNodeTransmogrifyFunc; user_data: Tgpointer): Tgboolean; cdecl; external libxmlb;
function xb_node_export(self: PXbNode; flags: TXbNodeExportFlags; error: PPGError): Pgchar; cdecl; external libxmlb;
function xb_node_get_data(self: PXbNode; key: Pgchar): PGBytes; cdecl; external libxmlb;
procedure xb_node_set_data(self: PXbNode; key: Pgchar; data: PGBytes); cdecl; external libxmlb;
function xb_node_get_root(self: PXbNode): PXbNode; cdecl; external libxmlb;
function xb_node_get_parent(self: PXbNode): PXbNode; cdecl; external libxmlb;
function xb_node_get_next(self: PXbNode): PXbNode; cdecl; external libxmlb;
function xb_node_get_child(self: PXbNode): PXbNode; cdecl; external libxmlb;
function xb_node_get_children(self: PXbNode): PGPtrArray; cdecl; external libxmlb;
function xb_node_get_element(self: PXbNode): Pgchar; cdecl; external libxmlb;
function xb_node_get_text(self: PXbNode): Pgchar; cdecl; external libxmlb;
function xb_node_get_text_as_uint(self: PXbNode): Tguint64; cdecl; external libxmlb;
function xb_node_get_tail(self: PXbNode): Pgchar; cdecl; external libxmlb;
function xb_node_get_attr(self: PXbNode; name: Pgchar): Pgchar; cdecl; external libxmlb;
function xb_node_get_attr_as_uint(self: PXbNode; name: Pgchar): Tguint64; cdecl; external libxmlb;
function xb_node_get_depth(self: PXbNode): Tguint; cdecl; external libxmlb;
procedure xb_node_attr_iter_init(iter: PXbNodeAttrIter; self: PXbNode); cdecl; external libxmlb;
function xb_node_attr_iter_next(iter: PXbNodeAttrIter; name: PPgchar; value: PPgchar): Tgboolean; cdecl; external libxmlb;
procedure xb_node_child_iter_init(iter: PXbNodeChildIter; self: PXbNode); cdecl; external libxmlb;
function xb_node_child_iter_next(iter: PXbNodeChildIter; child: PPXbNode): Tgboolean; cdecl; external libxmlb;
function xb_node_child_iter_loop(iter: PXbNodeChildIter; child: PPXbNode): Tgboolean; cdecl; external libxmlb;

// === Konventiert am: 1-10-25 19:42:24 ===

function XB_TYPE_NODE: TGType;
function XB_NODE(obj: Pointer): PXbNode;
function XB_IS_NODE(obj: Pointer): Tgboolean;
function XB_NODE_CLASS(klass: Pointer): PXbNodeClass;
function XB_IS_NODE_CLASS(klass: Pointer): Tgboolean;
function XB_NODE_GET_CLASS(obj: Pointer): PXbNodeClass;

implementation

function XB_TYPE_NODE: TGType;
begin
  Result := xb_node_get_type;
end;

function XB_NODE(obj: Pointer): PXbNode;
begin
  Result := PXbNode(g_type_check_instance_cast(obj, XB_TYPE_NODE));
end;

function XB_IS_NODE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, XB_TYPE_NODE);
end;

function XB_NODE_CLASS(klass: Pointer): PXbNodeClass;
begin
  Result := PXbNodeClass(g_type_check_class_cast(klass, XB_TYPE_NODE));
end;

function XB_IS_NODE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, XB_TYPE_NODE);
end;

function XB_NODE_GET_CLASS(obj: Pointer): PXbNodeClass;
begin
  Result := PXbNodeClass(PGTypeInstance(obj)^.g_class);
end;


end.
