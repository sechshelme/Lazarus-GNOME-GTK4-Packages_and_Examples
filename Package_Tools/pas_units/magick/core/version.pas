unit version;

interface

uses
  fp_magiccore;

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

function GetMagickHomeURL:Pchar;cdecl;external libmagiccore;
function GetMagickCopyright:Pchar;cdecl;external libmagiccore;
function GetMagickDelegates:Pchar;cdecl;external libmagiccore;
function GetMagickFeatures:Pchar;cdecl;external libmagiccore;
function GetMagickLicense:Pchar;cdecl;external libmagiccore;
function GetMagickPackageName:Pchar;cdecl;external libmagiccore;
function GetMagickQuantumDepth(para1:Psize_t):Pchar;cdecl;external libmagiccore;
function GetMagickQuantumRange(para1:Psize_t):Pchar;cdecl;external libmagiccore;
function GetMagickReleaseDate:Pchar;cdecl;external libmagiccore;
function GetMagickVersion(para1:Psize_t):Pchar;cdecl;external libmagiccore;
procedure ListMagickVersion(para1:PFILE);cdecl;external libmagiccore;
{$endif}

// === Konventiert am: 6-1-26 15:36:48 ===


implementation



end.
