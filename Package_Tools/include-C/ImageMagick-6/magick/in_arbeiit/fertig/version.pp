
unit version;
interface

{
  Automatically converted by H2Pas 1.0.0 from version.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    version.h
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
PFILE  = ^FILE;
Psize_t  = ^size_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
  Copyright 1999 ImageMagick Studio LLC, a non-profit organization
  dedicated to making software imaging solutions freely available.
  
  You may not use this file except in compliance with the License.
  obtain a copy of the License at
  
    https://imagemagick.org/script/license.php
  
  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.

  MagickCore version methods.
 }
{$ifndef _MAGICKCORE_VERSION_H}
{$define _MAGICKCORE_VERSION_H}
{
  Define declarations.
 }

function GetMagickHomeURL:Pchar;cdecl;external;
(* Const before type ignored *)
function GetMagickCopyright:Pchar;cdecl;external;
(* Const before type ignored *)
function GetMagickDelegates:Pchar;cdecl;external;
(* Const before type ignored *)
function GetMagickFeatures:Pchar;cdecl;external;
(* Const before type ignored *)
function GetMagickLicense:Pchar;cdecl;external;
(* Const before type ignored *)
function GetMagickPackageName:Pchar;cdecl;external;
(* Const before type ignored *)
function GetMagickQuantumDepth(para1:Psize_t):Pchar;cdecl;external;
(* Const before type ignored *)
function GetMagickQuantumRange(para1:Psize_t):Pchar;cdecl;external;
(* Const before type ignored *)
function GetMagickReleaseDate:Pchar;cdecl;external;
(* Const before type ignored *)
function GetMagickVersion(para1:Psize_t):Pchar;cdecl;external;
procedure ListMagickVersion(para1:PFILE);cdecl;external;
{$endif}

implementation


end.
