
unit xb_opcode;
interface

{
  Automatically converted by H2Pas 1.0.0 from xb_opcode.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    xb_opcode.h
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
PXbOpcode  = ^XbOpcode;
PXbOpcodeFlags  = ^XbOpcodeFlags;
PXbOpcodeKind  = ^XbOpcodeKind;
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
{*
 * XbOpcodeFlags:
 * @XB_OPCODE_FLAG_NONE:			No flags set
 * @XB_OPCODE_FLAG_INTEGER:			Integer value set
 * @XB_OPCODE_FLAG_TEXT:			Text value set
 * @XB_OPCODE_FLAG_FUNCTION:			An operator
 * @XB_OPCODE_FLAG_BOUND:			A bound value, assigned later
 * @XB_OPCODE_FLAG_TOKENIZED:			Tokenized text
 *
 * The opcode flags. The values have been carefully chosen so that a simple
 * bitmask can be done to know how to compare for equality.
 *
 * function─┐ ┌─string
 * bound──┐ │ │ ┌──integer
 * token┐ │ │ │ │
 *  X X X X X X X
 *        8 4 2 1
 * }
{ Since: 0.1.4  }
{ Since: 0.1.4  }
{ Since: 0.1.4  }
{ Since: 0.1.4  }
{ Since: 0.1.4  }
{ Since: 0.1.11  }
{ Since: 0.3.1  }
{< private > }
type
  PXbOpcodeFlags = ^TXbOpcodeFlags;
  TXbOpcodeFlags =  Longint;
  Const
    XB_OPCODE_FLAG_UNKNOWN = $0;
    XB_OPCODE_FLAG_INTEGER = 1 shl 0;
    XB_OPCODE_FLAG_TEXT = 1 shl 1;
    XB_OPCODE_FLAG_FUNCTION = 1 shl 2;
    XB_OPCODE_FLAG_BOUND = 1 shl 3;
    XB_OPCODE_FLAG_BOOLEAN = 1 shl 4;
    XB_OPCODE_FLAG_TOKENIZED = 1 shl 5;
    XB_OPCODE_FLAG_LAST = (1 shl 5)+1;
;
{*
 * XbOpcodeKind:
 * @XB_OPCODE_KIND_UNKNOWN:			Unknown opcode
 * @XB_OPCODE_KIND_INTEGER:			A literal integer value
 * @XB_OPCODE_KIND_TEXT:			A literal text value
 * @XB_OPCODE_KIND_FUNCTION:			An operator
 * @XB_OPCODE_KIND_BOUND_INTEGER:		A bound integer value
 * @XB_OPCODE_KIND_BOUND_TEXT:			A bound text value
 * @XB_OPCODE_KIND_INDEXED_TEXT:		An indexed text value
 * @XB_OPCODE_KIND_BOUND_INDEXED_TEXT:		An bound indexed text value
 * }
{ Since: 0.1.1  }
{ Since: 0.1.1  }
{ Since: 0.1.1  }
{ Since: 0.1.1  }
{ Since: 0.1.4  }
{ Since: 0.1.4  }
{ Since: 0.1.4  }
{ Since: 0.1.4  }
{ Since: 0.1.11  }
{ Since: 0.3.12  }
{< private > }
type
  PXbOpcodeKind = ^TXbOpcodeKind;
  TXbOpcodeKind =  Longint;
  Const
    XB_OPCODE_KIND_UNKNOWN = $0;
    XB_OPCODE_KIND_INTEGER = XB_OPCODE_FLAG_INTEGER;
    XB_OPCODE_KIND_TEXT = XB_OPCODE_FLAG_TEXT;
    XB_OPCODE_KIND_FUNCTION = XB_OPCODE_FLAG_FUNCTION or XB_OPCODE_FLAG_INTEGER;
    XB_OPCODE_KIND_BOUND_UNSET = XB_OPCODE_FLAG_BOUND;
    XB_OPCODE_KIND_BOUND_INTEGER = XB_OPCODE_FLAG_BOUND or XB_OPCODE_FLAG_INTEGER;
    XB_OPCODE_KIND_BOUND_TEXT = XB_OPCODE_FLAG_BOUND or XB_OPCODE_FLAG_TEXT;
    XB_OPCODE_KIND_INDEXED_TEXT = XB_OPCODE_FLAG_INTEGER or XB_OPCODE_FLAG_TEXT;
    XB_OPCODE_KIND_BOOLEAN = XB_OPCODE_FLAG_INTEGER or XB_OPCODE_FLAG_BOOLEAN;
    XB_OPCODE_KIND_BOUND_INDEXED_TEXT = (XB_OPCODE_FLAG_BOUND or XB_OPCODE_FLAG_INTEGER) or XB_OPCODE_FLAG_TEXT;
    XB_OPCODE_KIND_LAST = ((XB_OPCODE_FLAG_BOUND or XB_OPCODE_FLAG_INTEGER) or XB_OPCODE_FLAG_TEXT)+1;
;
type

function xb_opcode_cmp_val(self:PXbOpcode):Tgboolean;cdecl;external;
function xb_opcode_cmp_str(self:PXbOpcode):Tgboolean;cdecl;external;
function xb_opcode_to_string(self:PXbOpcode):Pgchar;cdecl;external;
(* Const before type ignored *)
function xb_opcode_kind_to_string(kind:TXbOpcodeKind):Pgchar;cdecl;external;
(* Const before type ignored *)
function xb_opcode_kind_from_string(str:Pgchar):TXbOpcodeKind;cdecl;external;
function xb_opcode_get_kind(self:PXbOpcode):TXbOpcodeKind;cdecl;external;
(* Const before type ignored *)
function xb_opcode_get_str(self:PXbOpcode):Pgchar;cdecl;external;
function xb_opcode_get_val(self:PXbOpcode):Tguint32;cdecl;external;
procedure xb_opcode_func_init(self:PXbOpcode; func:Tguint32);cdecl;external;
procedure xb_opcode_integer_init(self:PXbOpcode; val:Tguint32);cdecl;external;
(* Const before type ignored *)
procedure xb_opcode_text_init(self:PXbOpcode; str:Pgchar);cdecl;external;
(* Const before type ignored *)
procedure xb_opcode_text_init_static(self:PXbOpcode; str:Pgchar);cdecl;external;
procedure xb_opcode_text_init_steal(self:PXbOpcode; str:Pgchar);cdecl;external;

implementation


end.
