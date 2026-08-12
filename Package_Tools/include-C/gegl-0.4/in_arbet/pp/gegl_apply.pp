
unit gegl_apply;
interface

{
  Automatically converted by H2Pas 1.0.0 from gegl_apply.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gegl_apply.h
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
PGeglBuffer  = ^GeglBuffer;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ This file is part of GEGL
 *
 * GEGL is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 3 of the License, or (at your option) any later version.
 *
 * GEGL is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with GEGL; if not, see <https://www.gnu.org/licenses/>.
 *
 * Copyright 2003 Calvin Williamson
 *           2006 Øyvind Kolås
  }
{$ifndef __GEGL_APPLY_H__}
{$define __GEGL_APPLY_H__}
{*
 * gegl_apply_op:
 * @buffer: the #GeglBuffer to apply onto
 * @operation_name: name of the operation to apply
 * @...: the settings for the operation. Zero or more key/value pairs,
 * ended terminated with NULL.
 *
 * Apply the operation to buffer, overwritting the contents of buffer.
 *
  }
(* Const before type ignored *)

procedure gegl_apply_op(buffer:PGeglBuffer; operation_name:Pgchar; args:array of const);cdecl;external;
procedure gegl_apply_op(buffer:PGeglBuffer; operation_name:Pgchar);cdecl;external;
{*
 * gegl_filter_op:
 * @source_buffer: the source #GeglBuffer for the filter
 * @operation_name: name of the operation to apply
 * @...: the settings for the operation. Zero or more key/value pairs,
 * ended terminated with NULL.
 *
 * Apply the operation to source_buffer, returning the result in a new buffer.
 *
 * Return value: (transfer full): the result of the filter
  }
(* Const before type ignored *)
function gegl_filter_op(source_buffer:PGeglBuffer; operation_name:Pgchar; args:array of const):PGeglBuffer;cdecl;external;
function gegl_filter_op(source_buffer:PGeglBuffer; operation_name:Pgchar):PGeglBuffer;cdecl;external;
{*
 * gegl_render_op:
 * @source_buffer: the source #GeglBuffer for the filter
 * @target_buffer: the source #GeglBuffer for the filter
 * @operation_name: name of the operation to apply
 * @...: the settings for the operation. Zero or more key/value pairs,
 * ended terminated with NULL.
 *
 * Apply the operation to source_buffer, writing the results to target_buffer.
 *
  }
(* Const before type ignored *)
procedure gegl_render_op(source_buffer:PGeglBuffer; target_buffer:PGeglBuffer; operation_name:Pgchar; args:array of const);cdecl;external;
procedure gegl_render_op(source_buffer:PGeglBuffer; target_buffer:PGeglBuffer; operation_name:Pgchar);cdecl;external;
{ the following only exist to make gegl_apply and gegl_filter bindable  }
{*
 * gegl_apply_op_valist:
 * @buffer: the #GeglBuffer to apply onto
 * @operation_name: name of the operation to apply
 * @var_args: the settings for the operation. Zero or more key/value pairs,
 * ended terminated with NULL.
 *
 * Apply the operation to buffer, overwritting the contents of buffer.
 *
  }
(* Const before type ignored *)
procedure gegl_apply_op_valist(buffer:PGeglBuffer; operation_name:Pgchar; var_args:Tva_list);cdecl;external;
{*
 * gegl_filter_op_valist:
 * @source_buffer: the source #GeglBuffer for the filter
 * @operation_name: name of the operation to apply
 * @var_args: the settings for the operation. Zero or more key/value pairs,
 * ended terminated with NULL.
 *
 * Apply the operation to source_buffer, returning the result in a new buffer.
 *
 * Return value: (transfer full): the result of the filter
  }
(* Const before type ignored *)
function gegl_filter_op_valist(source_buffer:PGeglBuffer; operation_name:Pgchar; var_args:Tva_list):PGeglBuffer;cdecl;external;
{*
 * gegl_render_op_valist:
 * @source_buffer: the source #GeglBuffer for the filter
 * @target_buffer: the source #GeglBuffer for the filter
 * @operation_name: name of the operation to apply
 * @var_args: the settings for the operation. Zero or more key/value pairs,
 * ended terminated with NULL.
 *
 * Apply the operation to source_buffer, writing the results to target_buffer.
 *
  }
(* Const before type ignored *)
procedure gegl_render_op_valist(source_buffer:PGeglBuffer; target_buffer:PGeglBuffer; operation_name:Pgchar; var_args:Tva_list);cdecl;external;
{$endif}
{ __GEGL_APPLY_H__  }

implementation


end.
