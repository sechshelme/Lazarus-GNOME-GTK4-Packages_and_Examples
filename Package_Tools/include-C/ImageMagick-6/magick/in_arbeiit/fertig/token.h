/*
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

  MagickCore token methods.
*/
#ifndef MAGICKCORE_TOKEN_H
#define MAGICKCORE_TOKEN_H

/*
  Typedef declarations.
*/
typedef struct _TokenInfo
  TokenInfo;

extern  int
  Tokenizer(TokenInfo *,const unsigned int,char *,const size_t,const char *,
    const char *,const char *,const char *,const char,char *,int *,char *);

extern  MagickBooleanType
  GlobExpression(const char *magick_restrict,const char *magick_restrict,
    const MagickBooleanType);
extern  MagickBooleanType
  IsGlob(const char *);
extern  MagickBooleanType
  IsMagickTrue(const char *);

extern  size_t
  GetNextToken(const char *magick_restrict,const char **magick_restrict,
    const size_t,char *magick_restrict) ;

extern  TokenInfo
  *AcquireTokenInfo(void);
extern  TokenInfo
  *DestroyTokenInfo(TokenInfo *);

