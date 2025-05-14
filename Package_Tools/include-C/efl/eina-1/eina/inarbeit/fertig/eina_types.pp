
unit eina_types;
interface

{
  Automatically converted by H2Pas 1.0.0 from eina_types.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    eina_types.h
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
PEina_Bool  = ^Eina_Bool;
PEina_Process_Cb  = ^Eina_Process_Cb;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ EINA - EFL data type library
 * Copyright (C) 2007-2008 Carsten Haitzler, Vincent Torri, Jorge Luis Zapata Muga
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
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library;
 * if not, see <http://www.gnu.org/licenses/>.
  }
{$ifndef EINA_TYPES_H_}
{$define EINA_TYPES_H_}
{*
 * @addtogroup Eina_Core_Group Core
 *
 * @
  }
{*
 * @defgroup Eina_Types_Group Types
 *
 * @brief Definition for eina types and core functions.
 *
 * @
  }
type
  PEina_Bool = ^TEina_Bool;
  TEina_Bool = byte;
{*
 * @def EINA_FALSE
 * boolean value FALSE (numerical value 0)
  }

{ was #define dname def_expr }
function EINA_FALSE : TEina_Bool;  

{*
 * @def EINA_TRUE
 * boolean value TRUE (numerical value 1)
  }
{ was #define dname def_expr }
function EINA_TRUE : TEina_Bool;  

{*
 * @typedef Eina_Compare_Cb
 * Function used in functions using sorting. It compares @p data1 and
 * @p data2. If @p data1 is 'less' than @p data2, -1 must be returned,
 * if it is 'greater', 1 must be returned, and if they are equal, 0
 * must be returned.
  }
(* Const before type ignored *)
(* Const before type ignored *)
type

  TEina_Compare_Cb = function (data1:pointer; data2:pointer):longint;cdecl;
{*
 * @def EINA_COMPARE_CB
 * Macro to cast to Eina_Compare_Cb.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }

function EINA_COMPARE_CB(_function : longint) : TEina_Compare_Cb;

{*
 * @typedef Eina_Random_Cb
 * Function used in shuffling functions. An integer between min and max
 * inclusive must be returned.
 *
 * @since 1.8
  }
(* Const before type ignored *)
(* Const before type ignored *)
type

  TEina_Random_Cb = function (min:longint; max:longint):longint;cdecl;
{*
 * @def EINA_RANDOM_CB
 * Macro to cast to Eina_Random_Cb.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }

function EINA_RANDOM_CB(_function : longint) : TEina_Random_Cb;

{*
 * @typedef Eina_Process_Cb
 * Method that processes some data and returns new data.
 * It's meant to be used as a callback to process all nodes inside a container
 * (See eina_iterator_processed_new, for example.)
 * @param data The data to process.
 * @param fdata Context data.
 * @return The processed data.
  }
(* Const before type ignored *)
type
  PEina_Process_Cb = ^TEina_Process_Cb;
  TEina_Process_Cb = function (container:pointer; data:pointer; fdata:pointer):pointer;cdecl;
{*
 * @def EINA_PROCESS_CB
 * Macro to cast to Eina_Process.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }

function EINA_PROCESS_CB(_Function : longint) : TEina_Process_Cb;

{*
 * @typedef Eina_Each_Cb
 * A callback type used when iterating over a container.
  }
(* Const before type ignored *)
type

  TEina_Each_Cb = function (container:pointer; data:pointer; fdata:pointer):TEina_Bool;cdecl;
{*
 * @def EINA_EACH_CB
 * Macro to cast to Eina_Each.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }

function EINA_EACH_CB(_Function : longint) : TEina_Each_Cb;

{*
 * @typedef Eina_Free_Cb
 * A callback type used to free data when iterating over a container.
  }
type

  TEina_Free_Cb = procedure (data:pointer);cdecl;
{*
 * @def EINA_FREE_CB
 * Macro to cast to Eina_Free_Cb.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }

function EINA_FREE_CB(_Function : longint) : TEina_Free_Cb;

{*
 * @def EINA_C_ARRAY_LENGTH
 * Macro to return the array length of a standard c array.
 *
 * For example:
 * int foo[] =  0, 1, 2, 3 ;
 * would return 4 and not 4 * sizeof(int).
 *
 * @since 1.2.0
  }
{ xxxxxxxx#define EINA_C_ARRAY_LENGTH(arr) (sizeof(arr) / sizeof((arr)[0])) }
{*
 * @def EINA_DOUBLE_EQUAL
 * Macro to compare 2 double floating point values and deal with precision
 * loss issues.
 *
 * @since 1.18
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function EINA_DOUBLE_EQUAL(x,y : longint) : longint;

{*
 * @
  }
{*
 * @
  }
{$endif}
{ EINA_TYPES_H_  }

implementation

{ was #define dname def_expr }
function EINA_FALSE : TEina_Bool;
  begin
    EINA_FALSE:=TEina_Bool(0);
  end;

{ was #define dname def_expr }
function EINA_TRUE : TEina_Bool;
  begin
    EINA_TRUE:=TEina_Bool(1);
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function EINA_COMPARE_CB(_function : longint) : TEina_Compare_Cb;
begin
  EINA_COMPARE_CB:=TEina_Compare_Cb(_function);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function EINA_RANDOM_CB(_function : longint) : TEina_Random_Cb;
begin
  EINA_RANDOM_CB:=TEina_Random_Cb(_function);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function EINA_PROCESS_CB(_Function : longint) : TEina_Process_Cb;
begin
  EINA_PROCESS_CB:=TEina_Process_Cb(_Function);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function EINA_EACH_CB(_Function : longint) : TEina_Each_Cb;
begin
  EINA_EACH_CB:=TEina_Each_Cb(_Function);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function EINA_FREE_CB(_Function : longint) : TEina_Free_Cb;
begin
  EINA_FREE_CB:=TEina_Free_Cb(_Function);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function EINA_DOUBLE_EQUAL(x,y : longint) : longint;
begin
  EINA_DOUBLE_EQUAL:=(fabs(Tx(-(y))))<=(2.2204460492503131e-16*(fabs(x)));
end;


end.
