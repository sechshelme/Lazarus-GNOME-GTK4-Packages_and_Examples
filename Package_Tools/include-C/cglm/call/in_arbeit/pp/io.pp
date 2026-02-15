
unit io;
interface

{
  Automatically converted by H2Pas 1.0.0 from io.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    io.h
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
PFILE  = ^FILE;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (c), Recep Aslantas.
 *
 * MIT License (MIT), http://opensource.org/licenses/MIT
 * Full license can be found in the LICENSE file
  }
{$ifndef cglmc_io_h}
{$define cglmc_io_h}
{ C++ extern C conditionnal removed }
{$include "../cglm.h"}

procedure glmc_mat4_print(matrix:Tmat4; ostream:PFILE);cdecl;external;
procedure glmc_mat3_print(matrix:Tmat3; ostream:PFILE);cdecl;external;
procedure glmc_vec4_print(vec:Tvec4; ostream:PFILE);cdecl;external;
procedure glmc_vec3_print(vec:Tvec3; ostream:PFILE);cdecl;external;
procedure glmc_versor_print(vec:Tversor; ostream:PFILE);cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}
{ cglmc_io_h  }

implementation


end.
