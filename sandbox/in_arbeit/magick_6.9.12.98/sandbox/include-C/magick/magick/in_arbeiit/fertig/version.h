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

extern  char
  *GetMagickHomeURL(void);

extern  const char
  *GetMagickCopyright(void) ;
extern  const char
  *GetMagickDelegates(void) ;
extern  const char
  *GetMagickFeatures(void) ;
extern  const char
  *GetMagickLicense(void) ;
extern  const char
  *GetMagickPackageName(void);
extern  const char
  *GetMagickQuantumDepth(size_t *);
extern  const char
  *GetMagickQuantumRange(size_t *);
extern  const char
  *GetMagickReleaseDate(void);
extern  const char
  *GetMagickVersion(size_t *);

extern  void
  ListMagickVersion(FILE *);


#endif
