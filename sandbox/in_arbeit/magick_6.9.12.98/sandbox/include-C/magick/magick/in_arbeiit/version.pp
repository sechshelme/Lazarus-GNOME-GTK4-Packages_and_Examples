
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

const
  MagickPackageName = 'ImageMagick';  
  MagickCopyright = '(C) 1999 ImageMagick Studio LLC';  
  MagickLibVersion = $69C;  
  MagickLibVersionText = '6.9.12';  
  MagickLibAddendum = '-98';  
  MagickLibInterface = 7;  
  MagickLibMinInterface = 7;  
  MagickPlatform = 'x86_64';  
  MagickppLibVersionText = '6.9.12';  
  MagickppLibAddendum = '-98';  
  MagickppLibInterface = 9;  
  MagickppLibMinInterface = 9;  
  MagickGitRevision = '18038';  
  MagickReleaseDate = '2024-03-31';  
  MagickHomeURL = 'file:///usr/share/doc/imagemagick-6-common/html/index.html';  
  MagickAuthoritativeLicense = 'https://imagemagick.org/script/license.php';  
  MagickAuthoritativeURL = 'https://legacy.imagemagick.org';  
{$if (MAGICKCORE_QUANTUM_DEPTH == 8)}

const
  MagickQuantumDepth = 'Q8';  
  MagickQuantumRange = '255';  
(*** was #elif ****){$else (MAGICKCORE_QUANTUM_DEPTH == 16)}

const
  MagickQuantumDepth = 'Q16';  
  MagickQuantumRange = '65535';  
(*** was #elif ****){$else (MAGICKCORE_QUANTUM_DEPTH == 32)}

const
  MagickQuantumDepth = 'Q32';  
  MagickQuantumRange = '4294967295';  
(*** was #elif ****){$else (MAGICKCORE_QUANTUM_DEPTH == 64)}

const
  MagickQuantumDepth = 'Q64';  
  MagickQuantumRange = '18446744073709551615.0';  
{$else}

const
  MagickQuantumDepth = 'Q?';  
  MagickQuantumRange = '?';  
{$endif}
{$if defined(MAGICKCORE_HDRI_SUPPORT)}

const
  MagickHDRISupport = '-HDRI';  
{$else}

const
  MagickHDRISupport = '';  
{$endif}
{$endif}

implementation


end.
