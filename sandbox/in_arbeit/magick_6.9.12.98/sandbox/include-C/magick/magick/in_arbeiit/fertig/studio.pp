
unit studio;
interface

{
  Automatically converted by H2Pas 1.0.0 from studio.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    studio.h
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


{
  Copyright 1999 ImageMagick Studio LLC, a non-profit organization
  dedicated to making software imaging solutions freely available.

  You may not use this file except in compliance with the License.  You may
  obtain a copy of the License at

    https://imagemagick.org/script/license.php

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.

  MagickCore private application programming interface declarations.
 }
{ xxxxxxxxxxxxxxxxx testen }

function pread(para1:longint; para2:pointer; para3:Tsize_t; para4:Toff_t):Tssize_t;cdecl;external;
(* Const before type ignored *)
function pwrite(para1:longint; para2:pointer; para3:Tsize_t; para4:Toff_t):Tssize_t;cdecl;external;
(* Const before type ignored *)
function strlcpy(para1:Pchar; para2:Pchar; para3:Tsize_t):Tsize_t;cdecl;external;
(* Const before type ignored *)
function vsnprintf(para1:Pchar; para2:Tsize_t; para3:Pchar; para4:Tva_list):longint;cdecl;external;
const
  DirectorySeparator = '/';  
  DirectoryListSeparator = ':';  
{xxxxxxx # define EditorOptions  " -title \"Edit Image Comment\" -e vi" }
  Exit = exit;  
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function IsBasenameSeparator(c : longint) : longint;

const
  X11_PREFERENCES_PATH = '~/.';  
{$endif}

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IsBasenameSeparator(c : longint) : longint;
var
   if_local1 : longint;
(* result types are not known *)
begin
  if '/' then
    if_local1:=MagickTrue
  else
    if_local1:=MagickFalse;
  IsBasenameSeparator:=c=(if_local1);
end;


end.
