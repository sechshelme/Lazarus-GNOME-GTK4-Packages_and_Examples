
unit xb_node;
interface

{
  Automatically converted by H2Pas 1.0.0 from xb_node.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    xb_node.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
PGBytes  = ^GBytes;
Pgchar  = ^gchar;
PGError  = ^GError;
PGPtrArray  = ^GPtrArray;
PXbNode  = ^XbNode;
PXbNodeAttrIter  = ^XbNodeAttrIter;
PXbNodeChildIter  = ^XbNodeChildIter;
PXbNodeClass  = ^XbNodeClass;
PXbNodeExportFlags  = ^XbNodeExportFlags;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2018 Richard Hughes <richard@hughsie.com>
 *
 * SPDX-License-Identifier: LGPL-2.1+
  }
(** unsupported pragma#pragma once*)
{$include "xb-compile.h"}

{ was #define dname def_expr }
function XB_TYPE_NODE : longint; { return type might be wrong }

{G_DECLARE_DERIVABLE_TYPE(XbNode, xb_node, XB, NODE, GObject) }
{< private > }
type
  PXbNodeClass = ^TXbNodeClass;
  TXbNodeClass = record
      parent_class : TGObjectClass;
      _xb_reserved1 : procedure ;cdecl;
      _xb_reserved2 : procedure ;cdecl;
      _xb_reserved3 : procedure ;cdecl;
      _xb_reserved4 : procedure ;cdecl;
      _xb_reserved5 : procedure ;cdecl;
      _xb_reserved6 : procedure ;cdecl;
      _xb_reserved7 : procedure ;cdecl;
    end;

{*
 * XbNodeExportFlags:
 * @XB_NODE_EXPORT_FLAG_NONE:			No extra flags to use
 * @XB_NODE_EXPORT_FLAG_ADD_HEADER:		Add an XML header to the data
 * @XB_NODE_EXPORT_FLAG_FORMAT_MULTILINE:	Split up children with a newline
 * @XB_NODE_EXPORT_FLAG_FORMAT_INDENT:		Indent the XML by child depth
 * @XB_NODE_EXPORT_FLAG_INCLUDE_SIBLINGS:	Include the siblings when converting
 * @XB_NODE_EXPORT_FLAG_ONLY_CHILDREN:		Only export the children of the node
 * @XB_NODE_EXPORT_FLAG_COLLAPSE_EMPTY:		If node has no children, collapse open and close
 *tags
 *
 * The flags for converting to XML.
 * }
{ Since: 0.1.0  }
{ Since: 0.1.0  }
{ Since: 0.1.0  }
{ Since: 0.1.0  }
{ Since: 0.1.0  }
{ Since: 0.1.0  }
{ Since: 0.2.2  }
{< private > }

  PXbNodeExportFlags = ^TXbNodeExportFlags;
  TXbNodeExportFlags =  Longint;
  Const
    XB_NODE_EXPORT_FLAG_NONE = 0;
    XB_NODE_EXPORT_FLAG_ADD_HEADER = 1 shl 0;
    XB_NODE_EXPORT_FLAG_FORMAT_MULTILINE = 1 shl 1;
    XB_NODE_EXPORT_FLAG_FORMAT_INDENT = 1 shl 2;
    XB_NODE_EXPORT_FLAG_INCLUDE_SIBLINGS = 1 shl 3;
    XB_NODE_EXPORT_FLAG_ONLY_CHILDREN = 1 shl 4;
    XB_NODE_EXPORT_FLAG_COLLAPSE_EMPTY = 1 shl 5;
    XB_NODE_EXPORT_FLAG_LAST = (1 shl 5)+1;
;
{< private > }
type
  PXbNodeAttrIter = ^TXbNodeAttrIter;
  TXbNodeAttrIter = record
      dummy1 : Tgpointer;
      dummy2 : Tguint8;
      dummy3 : Tgpointer;
      dummy4 : Tgpointer;
      dummy5 : Tgpointer;
      dummy6 : Tgpointer;
    end;
{< private > }

  PXbNodeChildIter = ^TXbNodeChildIter;
  TXbNodeChildIter = record
      dummy1 : Tgpointer;
      dummy2 : Tgpointer;
      dummy3 : Tgboolean;
      dummy4 : Tgpointer;
      dummy5 : Tgpointer;
      dummy6 : Tgpointer;
    end;

  TXbNodeTransmogrifyFunc = function (self:PXbNode; user_data:Tgpointer):Tgboolean;cdecl;

function xb_node_transmogrify(self:PXbNode; func_text:TXbNodeTransmogrifyFunc; func_tail:TXbNodeTransmogrifyFunc; user_data:Tgpointer):Tgboolean;cdecl;external;
function xb_node_export(self:PXbNode; flags:TXbNodeExportFlags; error:PPGError):Pgchar;cdecl;external;
(* Const before type ignored *)
function xb_node_get_data(self:PXbNode; key:Pgchar):PGBytes;cdecl;external;
(* Const before type ignored *)
procedure xb_node_set_data(self:PXbNode; key:Pgchar; data:PGBytes);cdecl;external;
function xb_node_get_root(self:PXbNode):PXbNode;cdecl;external;
function xb_node_get_parent(self:PXbNode):PXbNode;cdecl;external;
function xb_node_get_next(self:PXbNode):PXbNode;cdecl;external;
function xb_node_get_child(self:PXbNode):PXbNode;cdecl;external;
function xb_node_get_children(self:PXbNode):PGPtrArray;cdecl;external;
(* Const before type ignored *)
function xb_node_get_element(self:PXbNode):Pgchar;cdecl;external;
(* Const before type ignored *)
function xb_node_get_text(self:PXbNode):Pgchar;cdecl;external;
function xb_node_get_text_as_uint(self:PXbNode):Tguint64;cdecl;external;
(* Const before type ignored *)
function xb_node_get_tail(self:PXbNode):Pgchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function xb_node_get_attr(self:PXbNode; name:Pgchar):Pgchar;cdecl;external;
(* Const before type ignored *)
function xb_node_get_attr_as_uint(self:PXbNode; name:Pgchar):Tguint64;cdecl;external;
function xb_node_get_depth(self:PXbNode):Tguint;cdecl;external;
procedure xb_node_attr_iter_init(iter:PXbNodeAttrIter; self:PXbNode);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function xb_node_attr_iter_next(iter:PXbNodeAttrIter; name:PPgchar; value:PPgchar):Tgboolean;cdecl;external;
procedure xb_node_child_iter_init(iter:PXbNodeChildIter; self:PXbNode);cdecl;external;
function xb_node_child_iter_next(iter:PXbNodeChildIter; child:PPXbNode):Tgboolean;cdecl;external;
function xb_node_child_iter_loop(iter:PXbNodeChildIter; child:PPXbNode):Tgboolean;cdecl;external;

implementation

{ was #define dname def_expr }
function XB_TYPE_NODE : longint; { return type might be wrong }
  begin
    XB_TYPE_NODE:=xb_node_get_type;
  end;


end.
