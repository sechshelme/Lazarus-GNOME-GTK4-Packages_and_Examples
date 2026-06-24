
unit gmarshal;
interface

{
  Automatically converted by H2Pas 1.0.0 from gmarshal.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gmarshal.h
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
PGClosure  = ^GClosure;
PGType  = ^GType;
PGValue  = ^GValue;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GObject - GLib Type, Object, Parameter and Signal Library
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General
 * Public License along with this library; if not, see <http://www.gnu.org/licenses/>.
  }
{$ifndef __G_MARSHAL_H__}
{$define __G_MARSHAL_H__}
{ VOID:VOID  }
(* Const before type ignored *)

procedure g_cclosure_marshal_VOID__VOID(closure:PGClosure; return_value:PGValue; n_param_values:Tguint; param_values:PGValue; invocation_hint:Tgpointer; 
            marshal_data:Tgpointer);cdecl;external;
procedure g_cclosure_marshal_VOID__VOIDv(closure:PGClosure; return_value:PGValue; instance:Tgpointer; args:Tva_list; marshal_data:Tgpointer; 
            n_params:longint; param_types:PGType);cdecl;external;
{ VOID:BOOLEAN  }
(* Const before type ignored *)
procedure g_cclosure_marshal_VOID__BOOLEAN(closure:PGClosure; return_value:PGValue; n_param_values:Tguint; param_values:PGValue; invocation_hint:Tgpointer; 
            marshal_data:Tgpointer);cdecl;external;
procedure g_cclosure_marshal_VOID__BOOLEANv(closure:PGClosure; return_value:PGValue; instance:Tgpointer; args:Tva_list; marshal_data:Tgpointer; 
            n_params:longint; param_types:PGType);cdecl;external;
{ VOID:CHAR  }
(* Const before type ignored *)
procedure g_cclosure_marshal_VOID__CHAR(closure:PGClosure; return_value:PGValue; n_param_values:Tguint; param_values:PGValue; invocation_hint:Tgpointer; 
            marshal_data:Tgpointer);cdecl;external;
procedure g_cclosure_marshal_VOID__CHARv(closure:PGClosure; return_value:PGValue; instance:Tgpointer; args:Tva_list; marshal_data:Tgpointer; 
            n_params:longint; param_types:PGType);cdecl;external;
{ VOID:UCHAR  }
(* Const before type ignored *)
procedure g_cclosure_marshal_VOID__UCHAR(closure:PGClosure; return_value:PGValue; n_param_values:Tguint; param_values:PGValue; invocation_hint:Tgpointer; 
            marshal_data:Tgpointer);cdecl;external;
procedure g_cclosure_marshal_VOID__UCHARv(closure:PGClosure; return_value:PGValue; instance:Tgpointer; args:Tva_list; marshal_data:Tgpointer; 
            n_params:longint; param_types:PGType);cdecl;external;
{ VOID:INT  }
(* Const before type ignored *)
procedure g_cclosure_marshal_VOID__INT(closure:PGClosure; return_value:PGValue; n_param_values:Tguint; param_values:PGValue; invocation_hint:Tgpointer; 
            marshal_data:Tgpointer);cdecl;external;
procedure g_cclosure_marshal_VOID__INTv(closure:PGClosure; return_value:PGValue; instance:Tgpointer; args:Tva_list; marshal_data:Tgpointer; 
            n_params:longint; param_types:PGType);cdecl;external;
{ VOID:UINT  }
(* Const before type ignored *)
procedure g_cclosure_marshal_VOID__UINT(closure:PGClosure; return_value:PGValue; n_param_values:Tguint; param_values:PGValue; invocation_hint:Tgpointer; 
            marshal_data:Tgpointer);cdecl;external;
procedure g_cclosure_marshal_VOID__UINTv(closure:PGClosure; return_value:PGValue; instance:Tgpointer; args:Tva_list; marshal_data:Tgpointer; 
            n_params:longint; param_types:PGType);cdecl;external;
{ VOID:LONG  }
(* Const before type ignored *)
procedure g_cclosure_marshal_VOID__LONG(closure:PGClosure; return_value:PGValue; n_param_values:Tguint; param_values:PGValue; invocation_hint:Tgpointer; 
            marshal_data:Tgpointer);cdecl;external;
procedure g_cclosure_marshal_VOID__LONGv(closure:PGClosure; return_value:PGValue; instance:Tgpointer; args:Tva_list; marshal_data:Tgpointer; 
            n_params:longint; param_types:PGType);cdecl;external;
{ VOID:ULONG  }
(* Const before type ignored *)
procedure g_cclosure_marshal_VOID__ULONG(closure:PGClosure; return_value:PGValue; n_param_values:Tguint; param_values:PGValue; invocation_hint:Tgpointer; 
            marshal_data:Tgpointer);cdecl;external;
procedure g_cclosure_marshal_VOID__ULONGv(closure:PGClosure; return_value:PGValue; instance:Tgpointer; args:Tva_list; marshal_data:Tgpointer; 
            n_params:longint; param_types:PGType);cdecl;external;
{ VOID:ENUM  }
(* Const before type ignored *)
procedure g_cclosure_marshal_VOID__ENUM(closure:PGClosure; return_value:PGValue; n_param_values:Tguint; param_values:PGValue; invocation_hint:Tgpointer; 
            marshal_data:Tgpointer);cdecl;external;
procedure g_cclosure_marshal_VOID__ENUMv(closure:PGClosure; return_value:PGValue; instance:Tgpointer; args:Tva_list; marshal_data:Tgpointer; 
            n_params:longint; param_types:PGType);cdecl;external;
{ VOID:FLAGS  }
(* Const before type ignored *)
procedure g_cclosure_marshal_VOID__FLAGS(closure:PGClosure; return_value:PGValue; n_param_values:Tguint; param_values:PGValue; invocation_hint:Tgpointer; 
            marshal_data:Tgpointer);cdecl;external;
procedure g_cclosure_marshal_VOID__FLAGSv(closure:PGClosure; return_value:PGValue; instance:Tgpointer; args:Tva_list; marshal_data:Tgpointer; 
            n_params:longint; param_types:PGType);cdecl;external;
{ VOID:FLOAT  }
(* Const before type ignored *)
procedure g_cclosure_marshal_VOID__FLOAT(closure:PGClosure; return_value:PGValue; n_param_values:Tguint; param_values:PGValue; invocation_hint:Tgpointer; 
            marshal_data:Tgpointer);cdecl;external;
procedure g_cclosure_marshal_VOID__FLOATv(closure:PGClosure; return_value:PGValue; instance:Tgpointer; args:Tva_list; marshal_data:Tgpointer; 
            n_params:longint; param_types:PGType);cdecl;external;
{ VOID:DOUBLE  }
(* Const before type ignored *)
procedure g_cclosure_marshal_VOID__DOUBLE(closure:PGClosure; return_value:PGValue; n_param_values:Tguint; param_values:PGValue; invocation_hint:Tgpointer; 
            marshal_data:Tgpointer);cdecl;external;
procedure g_cclosure_marshal_VOID__DOUBLEv(closure:PGClosure; return_value:PGValue; instance:Tgpointer; args:Tva_list; marshal_data:Tgpointer; 
            n_params:longint; param_types:PGType);cdecl;external;
{ VOID:STRING  }
(* Const before type ignored *)
procedure g_cclosure_marshal_VOID__STRING(closure:PGClosure; return_value:PGValue; n_param_values:Tguint; param_values:PGValue; invocation_hint:Tgpointer; 
            marshal_data:Tgpointer);cdecl;external;
procedure g_cclosure_marshal_VOID__STRINGv(closure:PGClosure; return_value:PGValue; instance:Tgpointer; args:Tva_list; marshal_data:Tgpointer; 
            n_params:longint; param_types:PGType);cdecl;external;
{ VOID:PARAM  }
(* Const before type ignored *)
procedure g_cclosure_marshal_VOID__PARAM(closure:PGClosure; return_value:PGValue; n_param_values:Tguint; param_values:PGValue; invocation_hint:Tgpointer; 
            marshal_data:Tgpointer);cdecl;external;
procedure g_cclosure_marshal_VOID__PARAMv(closure:PGClosure; return_value:PGValue; instance:Tgpointer; args:Tva_list; marshal_data:Tgpointer; 
            n_params:longint; param_types:PGType);cdecl;external;
{ VOID:BOXED  }
(* Const before type ignored *)
procedure g_cclosure_marshal_VOID__BOXED(closure:PGClosure; return_value:PGValue; n_param_values:Tguint; param_values:PGValue; invocation_hint:Tgpointer; 
            marshal_data:Tgpointer);cdecl;external;
procedure g_cclosure_marshal_VOID__BOXEDv(closure:PGClosure; return_value:PGValue; instance:Tgpointer; args:Tva_list; marshal_data:Tgpointer; 
            n_params:longint; param_types:PGType);cdecl;external;
{ VOID:POINTER  }
(* Const before type ignored *)
procedure g_cclosure_marshal_VOID__POINTER(closure:PGClosure; return_value:PGValue; n_param_values:Tguint; param_values:PGValue; invocation_hint:Tgpointer; 
            marshal_data:Tgpointer);cdecl;external;
procedure g_cclosure_marshal_VOID__POINTERv(closure:PGClosure; return_value:PGValue; instance:Tgpointer; args:Tva_list; marshal_data:Tgpointer; 
            n_params:longint; param_types:PGType);cdecl;external;
{ VOID:OBJECT  }
(* Const before type ignored *)
procedure g_cclosure_marshal_VOID__OBJECT(closure:PGClosure; return_value:PGValue; n_param_values:Tguint; param_values:PGValue; invocation_hint:Tgpointer; 
            marshal_data:Tgpointer);cdecl;external;
procedure g_cclosure_marshal_VOID__OBJECTv(closure:PGClosure; return_value:PGValue; instance:Tgpointer; args:Tva_list; marshal_data:Tgpointer; 
            n_params:longint; param_types:PGType);cdecl;external;
{ VOID:VARIANT  }
(* Const before type ignored *)
procedure g_cclosure_marshal_VOID__VARIANT(closure:PGClosure; return_value:PGValue; n_param_values:Tguint; param_values:PGValue; invocation_hint:Tgpointer; 
            marshal_data:Tgpointer);cdecl;external;
procedure g_cclosure_marshal_VOID__VARIANTv(closure:PGClosure; return_value:PGValue; instance:Tgpointer; args:Tva_list; marshal_data:Tgpointer; 
            n_params:longint; param_types:PGType);cdecl;external;
{ VOID:UINT,POINTER  }
(* Const before type ignored *)
procedure g_cclosure_marshal_VOID__UINT_POINTER(closure:PGClosure; return_value:PGValue; n_param_values:Tguint; param_values:PGValue; invocation_hint:Tgpointer; 
            marshal_data:Tgpointer);cdecl;external;
procedure g_cclosure_marshal_VOID__UINT_POINTERv(closure:PGClosure; return_value:PGValue; instance:Tgpointer; args:Tva_list; marshal_data:Tgpointer; 
            n_params:longint; param_types:PGType);cdecl;external;
{ BOOL:FLAGS  }
(* Const before type ignored *)
procedure g_cclosure_marshal_BOOLEAN__FLAGS(closure:PGClosure; return_value:PGValue; n_param_values:Tguint; param_values:PGValue; invocation_hint:Tgpointer; 
            marshal_data:Tgpointer);cdecl;external;
procedure g_cclosure_marshal_BOOLEAN__FLAGSv(closure:PGClosure; return_value:PGValue; instance:Tgpointer; args:Tva_list; marshal_data:Tgpointer; 
            n_params:longint; param_types:PGType);cdecl;external;
{*
 * g_cclosure_marshal_BOOL__FLAGS:
 * @closure: A #GClosure.
 * @return_value: A #GValue to store the return value. May be %NULL
 *   if the callback of closure doesn't return a value.
 * @n_param_values: The length of the @param_values array.
 * @param_values: An array of #GValues holding the arguments
 *   on which to invoke the callback of closure.
 * @invocation_hint: The invocation hint given as the last argument to
 *   g_closure_invoke().
 * @marshal_data: Additional data specified when registering the
 *   marshaller, see g_closure_set_marshal() and
 *   g_closure_set_meta_marshal()
 *
 * An old alias for g_cclosure_marshal_BOOLEAN__FLAGS().
  }
const
  g_cclosure_marshal_BOOL__FLAGS = g_cclosure_marshal_BOOLEAN__FLAGS;  
{ STRING:OBJECT,POINTER  }
(* Const before type ignored *)

procedure g_cclosure_marshal_STRING__OBJECT_POINTER(closure:PGClosure; return_value:PGValue; n_param_values:Tguint; param_values:PGValue; invocation_hint:Tgpointer; 
            marshal_data:Tgpointer);cdecl;external;
procedure g_cclosure_marshal_STRING__OBJECT_POINTERv(closure:PGClosure; return_value:PGValue; instance:Tgpointer; args:Tva_list; marshal_data:Tgpointer; 
            n_params:longint; param_types:PGType);cdecl;external;
{ BOOL:BOXED,BOXED  }
(* Const before type ignored *)
procedure g_cclosure_marshal_BOOLEAN__BOXED_BOXED(closure:PGClosure; return_value:PGValue; n_param_values:Tguint; param_values:PGValue; invocation_hint:Tgpointer; 
            marshal_data:Tgpointer);cdecl;external;
procedure g_cclosure_marshal_BOOLEAN__BOXED_BOXEDv(closure:PGClosure; return_value:PGValue; instance:Tgpointer; args:Tva_list; marshal_data:Tgpointer; 
            n_params:longint; param_types:PGType);cdecl;external;
{*
 * g_cclosure_marshal_BOOL__BOXED_BOXED:
 * @closure: A #GClosure.
 * @return_value: A #GValue to store the return value. May be %NULL
 *   if the callback of closure doesn't return a value.
 * @n_param_values: The length of the @param_values array.
 * @param_values: An array of #GValues holding the arguments
 *   on which to invoke the callback of closure.
 * @invocation_hint: The invocation hint given as the last argument to
 *   g_closure_invoke().
 * @marshal_data: Additional data specified when registering the
 *   marshaller, see g_closure_set_marshal() and
 *   g_closure_set_meta_marshal()
 *
 * An old alias for g_cclosure_marshal_BOOLEAN__BOXED_BOXED().
  }
const
  g_cclosure_marshal_BOOL__BOXED_BOXED = g_cclosure_marshal_BOOLEAN__BOXED_BOXED;  
{$endif}
{ __G_MARSHAL_H__  }

implementation


end.
