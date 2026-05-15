
unit mongoc_macros;
interface

{
  Automatically converted by H2Pas 1.0.0 from mongoc_macros.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    mongoc_macros.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright 2017 MongoDB, Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
  }
{$include "mongoc-prelude.h"}
{$ifndef MONGOC_MACROS_H}
{$define MONGOC_MACROS_H}
{ Decorate public functions:
 * - if MONGOC_STATIC, we're compiling a static libmongoc or a program
 *   that uses libmongoc as a static library. Don't decorate functions
 * - else if MONGOC_COMPILATION, we're compiling a shared libmongoc,
 *   mark public functions for export from the shared lib.
 * - else, we're compiling a program that uses libmongoc as a shared library,
 *   mark public functions as DLL imports for Microsoft Visual C.
  }
{$ifdef _MSC_VER}
{
 * Microsoft Visual C
  }
{$ifdef MONGOC_STATIC}
{$define MONGOC_API}
(*** was #elif ****){$else defined(MONGOC_COMPILATION)}

{ was #define dname def_expr }
function MONGOC_API : longint; { return type might be wrong }

{$else}

{ was #define dname def_expr }
function MONGOC_API : longint; { return type might be wrong }

{$endif}

const
  MONGOC_CALL = __cdecl;  
(*** was #elif ****){$else defined(__GNUC__)}
{
 * GCC
  }
{$ifdef MONGOC_STATIC}
{$define MONGOC_API}
(*** was #elif ****){$else defined(MONGOC_COMPILATION)}

{ was #define dname def_expr }
function MONGOC_API : longint; { return type might be wrong }

{$else}
{$define MONGOC_API}
{$endif}
{$define MONGOC_CALL}
{$else}
{
 * Other compilers
  }
{$define MONGOC_API}
{$define MONGOC_CALL}
{$endif}
{$endif}
{ MONGOC_MACROS_H  }

implementation

{ was #define dname def_expr }
function MONGOC_API : longint; { return type might be wrong }
  begin
    MONGOC_API:=__declspec(dllexport);
  end;

{ was #define dname def_expr }
function MONGOC_API : longint; { return type might be wrong }
  begin
    MONGOC_API:=__declspec(dllimport);
  end;

{ was #define dname def_expr }
function MONGOC_API : longint; { return type might be wrong }
  begin
    MONGOC_API:=__attribute__(visibility('default'));
  end;


end.
