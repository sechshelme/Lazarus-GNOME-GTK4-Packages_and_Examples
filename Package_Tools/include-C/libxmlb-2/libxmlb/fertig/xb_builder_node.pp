
unit xb_builder_node;
interface

{
  Automatically converted by H2Pas 1.0.0 from xb_builder_node.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    xb_builder_node.h
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
Pgchar  = ^gchar;
PGError  = ^GError;
PGPtrArray  = ^GPtrArray;
PXbBuilderNode  = ^XbBuilderNode;
PXbBuilderNodeClass  = ^XbBuilderNodeClass;
PXbBuilderNodeFlags  = ^XbBuilderNodeFlags;
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
{$include "xb-node.h"}

{ was #define dname def_expr }
function XB_TYPE_BUILDER_NODE : longint; { return type might be wrong }

{G_DECLARE_DERIVABLE_TYPE(XbBuilderNode, xb_builder_node, XB, BUILDER_NODE, GObject) }
{< private > }
type
  PXbBuilderNodeClass = ^TXbBuilderNodeClass;
  TXbBuilderNodeClass = record
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
 * XbBuilderNodeFlags:
 * @XB_BUILDER_NODE_FLAG_NONE:			No extra flags to use
 * @XB_BUILDER_NODE_FLAG_IGNORE:		Do not include this node in the silo
 * @XB_BUILDER_NODE_FLAG_LITERAL_TEXT:		Assume the node CDATA is already valid
 * @XB_BUILDER_NODE_FLAG_HAS_TEXT:		If the node has leading text
 * @XB_BUILDER_NODE_FLAG_HAS_TAIL:		If the node has trailing text
 * @XB_BUILDER_NODE_FLAG_TOKENIZE_TEXT:		Tokenize and fold text to ASCII (Since: 0.3.1)
 * @XB_BUILDER_NODE_FLAG_STRIP_TEXT:		Strip leading and trailing spaces from text (Since:
 *0.3.4)
 *
 * The flags used when building a node.
 * }
{ Since: 0.1.0  }
{ Since: 0.1.0  }
{ Since: 0.1.0  }
{ Since: 0.1.12  }
{ Since: 0.1.12  }
{ Since: 0.3.1  }
{ Since: 0.3.4  }
{< private > }

  PXbBuilderNodeFlags = ^TXbBuilderNodeFlags;
  TXbBuilderNodeFlags =  Longint;
  Const
    XB_BUILDER_NODE_FLAG_NONE = 0;
    XB_BUILDER_NODE_FLAG_IGNORE = 1 shl 0;
    XB_BUILDER_NODE_FLAG_LITERAL_TEXT = 1 shl 1;
    XB_BUILDER_NODE_FLAG_HAS_TEXT = 1 shl 2;
    XB_BUILDER_NODE_FLAG_HAS_TAIL = 1 shl 3;
    XB_BUILDER_NODE_FLAG_TOKENIZE_TEXT = 1 shl 4;
    XB_BUILDER_NODE_FLAG_STRIP_TEXT = 1 shl 5;
    XB_BUILDER_NODE_FLAG_LAST = (1 shl 5)+1;
;
type

  TXbBuilderNodeTraverseFunc = function (bn:PXbBuilderNode; user_data:Tgpointer):Tgboolean;cdecl;

  TXbBuilderNodeSortFunc = function (bn1:PXbBuilderNode; bn2:PXbBuilderNode; user_data:Tgpointer):Tgint;cdecl;
(* Const before type ignored *)

function xb_builder_node_new(element:Pgchar):PXbBuilderNode;cdecl;external;
(* Const before type ignored *)
function xb_builder_node_insert(parent:PXbBuilderNode; element:Pgchar; args:array of const):PXbBuilderNode;cdecl;external;
function xb_builder_node_insert(parent:PXbBuilderNode; element:Pgchar):PXbBuilderNode;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure xb_builder_node_insert_text(parent:PXbBuilderNode; element:Pgchar; text:Pgchar; args:array of const);cdecl;external;
procedure xb_builder_node_insert_text(parent:PXbBuilderNode; element:Pgchar; text:Pgchar);cdecl;external;
function xb_builder_node_has_flag(self:PXbBuilderNode; flag:TXbBuilderNodeFlags):Tgboolean;cdecl;external;
procedure xb_builder_node_add_flag(self:PXbBuilderNode; flag:TXbBuilderNodeFlags);cdecl;external;
(* Const before type ignored *)
function xb_builder_node_get_element(self:PXbBuilderNode):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure xb_builder_node_set_element(self:PXbBuilderNode; element:Pgchar);cdecl;external;
(* Const before type ignored *)
function xb_builder_node_get_text(self:PXbBuilderNode):Pgchar;cdecl;external;
function xb_builder_node_get_text_as_uint(self:PXbBuilderNode):Tguint64;cdecl;external;
(* Const before type ignored *)
procedure xb_builder_node_set_text(self:PXbBuilderNode; text:Pgchar; text_len:Tgssize);cdecl;external;
procedure xb_builder_node_tokenize_text(self:PXbBuilderNode);cdecl;external;
(* Const before type ignored *)
function xb_builder_node_get_tail(self:PXbBuilderNode):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure xb_builder_node_set_tail(self:PXbBuilderNode; tail:Pgchar; tail_len:Tgssize);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function xb_builder_node_get_attr(self:PXbBuilderNode; name:Pgchar):Pgchar;cdecl;external;
(* Const before type ignored *)
function xb_builder_node_get_attr_as_uint(self:PXbBuilderNode; name:Pgchar):Tguint64;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure xb_builder_node_set_attr(self:PXbBuilderNode; name:Pgchar; value:Pgchar);cdecl;external;
(* Const before type ignored *)
procedure xb_builder_node_remove_attr(self:PXbBuilderNode; name:Pgchar);cdecl;external;
procedure xb_builder_node_add_child(self:PXbBuilderNode; child:PXbBuilderNode);cdecl;external;
procedure xb_builder_node_remove_child(self:PXbBuilderNode; child:PXbBuilderNode);cdecl;external;
function xb_builder_node_get_children(self:PXbBuilderNode):PGPtrArray;cdecl;external;
function xb_builder_node_get_first_child(self:PXbBuilderNode):PXbBuilderNode;cdecl;external;
function xb_builder_node_get_last_child(self:PXbBuilderNode):PXbBuilderNode;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function xb_builder_node_get_child(self:PXbBuilderNode; element:Pgchar; text:Pgchar):PXbBuilderNode;cdecl;external;
procedure xb_builder_node_unlink(self:PXbBuilderNode);cdecl;external;
function xb_builder_node_get_parent(self:PXbBuilderNode):PXbBuilderNode;cdecl;external;
function xb_builder_node_depth(self:PXbBuilderNode):Tguint;cdecl;external;
procedure xb_builder_node_traverse(self:PXbBuilderNode; order:TGTraverseType; flags:TGTraverseFlags; max_depth:Tgint; func:TXbBuilderNodeTraverseFunc; 
            user_data:Tgpointer);cdecl;external;
procedure xb_builder_node_sort_children(self:PXbBuilderNode; func:TXbBuilderNodeSortFunc; user_data:Tgpointer);cdecl;external;
function xb_builder_node_export(self:PXbBuilderNode; flags:TXbNodeExportFlags; error:PPGError):Pgchar;cdecl;external;
function xb_builder_node_get_tokens(self:PXbBuilderNode):PGPtrArray;cdecl;external;
(* Const before type ignored *)
procedure xb_builder_node_add_token(self:PXbBuilderNode; token:Pgchar);cdecl;external;

implementation

{ was #define dname def_expr }
function XB_TYPE_BUILDER_NODE : longint; { return type might be wrong }
  begin
    XB_TYPE_BUILDER_NODE:=xb_builder_node_get_type;
  end;


end.
