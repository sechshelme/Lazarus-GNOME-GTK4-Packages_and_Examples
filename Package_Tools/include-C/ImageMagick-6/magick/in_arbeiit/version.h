/*
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
*/
#ifndef _MAGICKCORE_VERSION_H
#define _MAGICKCORE_VERSION_H


/*
  Define declarations.
*/
#define MagickPackageName "ImageMagick"
#define MagickCopyright  "(C) 1999 ImageMagick Studio LLC"
#define MagickLibVersion  0x69C
#define MagickLibVersionText  "6.9.12"
#define MagickLibAddendum  "-98"
#define MagickLibInterface  7
#define MagickLibMinInterface  7
#define MagickPlatform  "x86_64"
#define MagickppLibVersionText  "6.9.12"
#define MagickppLibAddendum  "-98"
#define MagickppLibInterface  9
#define MagickppLibMinInterface  9
#define MagickGitRevision  "18038"
#define MagickReleaseDate  "2024-03-31"
#define MagickHomeURL  "file:///usr/share/doc/imagemagick-6-common/html/index.html"
#define MagickAuthoritativeLicense  \
  "https://imagemagick.org/script/license.php"
#define MagickAuthoritativeURL  "https://legacy.imagemagick.org"
#if (MAGICKCORE_QUANTUM_DEPTH == 8)
#define MagickQuantumDepth  "Q8"
#define MagickQuantumRange  "255"
#elif (MAGICKCORE_QUANTUM_DEPTH == 16)
#define MagickQuantumDepth  "Q16"
#define MagickQuantumRange  "65535"
#elif (MAGICKCORE_QUANTUM_DEPTH == 32)
#define MagickQuantumDepth  "Q32"
#define MagickQuantumRange  "4294967295"
#elif (MAGICKCORE_QUANTUM_DEPTH == 64)
#define MagickQuantumDepth  "Q64"
#define MagickQuantumRange  "18446744073709551615.0"
#else
#define MagickQuantumDepth  "Q?"
#define MagickQuantumRange  "?"
#endif
#if defined(MAGICKCORE_HDRI_SUPPORT)
#define MagickHDRISupport  "-HDRI"
#else
#define MagickHDRISupport  ""
#endif


#endif
