
unit eina_util;
interface

{
  Automatically converted by H2Pas 1.0.0 from eina_util.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    eina_util.h
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
Pchar  = ^char;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ EINA - EFL data type library
 * Copyright (C) 2015 Vincent Torri
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
{$ifndef EINA_UTIL_H_}
{$define EINA_UTIL_H_}
{$include <float.h>}
{$include <math.h>}
{*
 * @addtogroup Eina_Tools_Group Tools
 *
 * @
  }
{*
 * @brief Returns the content of the environment referred by HOME on this system.
 * @return A temporary string to the content referred by HOME on this system.
 *
 * @note The result of this call is highly system dependent and you better use
 * it instead of the naive getenv("HOME").
 *
 * @since 1.15
  }
(* Const before type ignored *)

function eina_environment_home_get:Pchar;cdecl;external;
{*
 * @brief Returns the content of the environment referred as TMPDIR on this system.
 * @return A temporary string to the content referred by TMPDIR on this system.
 *
 * @note The result of this call is highly system dependent and you better use
 * it instead of the naive getenv("TMPDIR").
 *
 * @since 1.15
  }
(* Const before type ignored *)
function eina_environment_tmp_get:Pchar;cdecl;external;
{*
 * @brief Warningless comparison of doubles using ==
 * @param[in] a First member to compare
 * @param[in] b Second member to compare
 *
 * @return @c true if two doubles match
 * @since 1.19
  }
{*
 * @brief Safe comparison of float
 * @param[in] a First member to compare
 * @param[in] b Second member to compare
 * @since 1.19
 *
 * @return @c true if two floats match
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function EINA_FLT_EQ(a,b : longint) : longint;

{*
 * @brief Determines if a float is not zero
 * @param[in] a The float
 *
 * @return @c true if float is not zero
 * @since 1.19
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function EINA_FLT_NONZERO(a : longint) : longint;

{*
 * @brief Safe comparison of double
 * @param[in] a First member to compare
 * @param[in] b Second member to compare
 * @since 1.19
 *
 * @return @c true if two double match
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function EINA_DBL_EQ(a,b : longint) : longint;

{*
 * @brief Determines if a double is not zero
 * @param[in] a The double
 *
 * @return @c true if double is not zero
 * @since 1.19
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function EINA_DBL_NONZERO(a : longint) : longint;

{*
 * @
  }
{$include "eina_inline_util.x"}
{$endif}

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function EINA_FLT_EQ(a,b : longint) : longint;
begin
  EINA_FLT_EQ:= not ( not ((fabsf(single(Ta(-(single(b))))))<=FLT_EPSILON));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function EINA_FLT_NONZERO(a : longint) : longint;
begin
  EINA_FLT_NONZERO:= not ( not ((fpclassify(single(a)))<>FP_ZERO));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function EINA_DBL_EQ(a,b : longint) : longint;
begin
  EINA_DBL_EQ:= not ( not ((fabs(Tdouble(Ta(-(Tdouble(b))))))<=DBL_EPSILON));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function EINA_DBL_NONZERO(a : longint) : longint;
begin
  EINA_DBL_NONZERO:= not ( not ((fpclassify(Tdouble(a)))<>FP_ZERO));
end;


end.
