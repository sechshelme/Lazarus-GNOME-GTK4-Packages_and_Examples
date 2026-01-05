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

  MagickWand pixel wand methods.
*/
#ifndef MAGICKWAND_PIXEL_WAND_H
#define MAGICKWAND_PIXEL_WAND_H


typedef struct _PixelWand
  PixelWand;

extern  char
  *PixelGetColorAsNormalizedString(const PixelWand *);
extern  char
  *PixelGetColorAsString(const PixelWand *);
extern  char
  *PixelGetException(const PixelWand *,ExceptionType *);

extern  double
  PixelGetAlpha(const PixelWand *);
extern  double
  PixelGetBlack(const PixelWand *);
extern  double
  PixelGetBlue(const PixelWand *);
extern  double
  PixelGetCyan(const PixelWand *);
extern  double
  PixelGetFuzz(const PixelWand *);
extern  double
  PixelGetGreen(const PixelWand *);
extern  double
  PixelGetMagenta(const PixelWand *);
extern  double
  PixelGetOpacity(const PixelWand *);
extern  double
  PixelGetRed(const PixelWand *);
extern  double
  PixelGetYellow(const PixelWand *);

extern  ExceptionType
  PixelGetExceptionType(const PixelWand *);

extern  IndexPacket
  PixelGetIndex(const PixelWand *);

extern  MagickBooleanType
  IsPixelWand(const PixelWand *);
extern  MagickBooleanType
  IsPixelWandSimilar(PixelWand *,PixelWand *,const double);
extern  MagickBooleanType
  PixelClearException(PixelWand *);
extern  MagickBooleanType
  PixelSetColor(PixelWand *,const char *);

extern  PixelWand
  *ClonePixelWand(const PixelWand *);
extern  PixelWand
  **ClonePixelWands(const PixelWand **,const size_t);
extern  PixelWand
  *DestroyPixelWand(PixelWand *);
extern  PixelWand
  **DestroyPixelWands(PixelWand **,const size_t);
extern  PixelWand
  *NewPixelWand(void);
extern  PixelWand
  **NewPixelWands(const size_t);

extern  Quantum
  PixelGetAlphaQuantum(const PixelWand *);
extern  Quantum
  PixelGetBlackQuantum(const PixelWand *);
extern  Quantum
  PixelGetBlueQuantum(const PixelWand *);
extern  Quantum
  PixelGetCyanQuantum(const PixelWand *);
extern  Quantum
  PixelGetGreenQuantum(const PixelWand *);
extern  Quantum
  PixelGetMagentaQuantum(const PixelWand *);
extern  Quantum
  PixelGetOpacityQuantum(const PixelWand *);
extern  Quantum
  PixelGetRedQuantum(const PixelWand *);
extern  Quantum
  PixelGetYellowQuantum(const PixelWand *);

extern  size_t
  PixelGetColorCount(const PixelWand *);

extern  void
  ClearPixelWand(PixelWand *);
extern  void
  PixelGetHSL(const PixelWand *,double *,double *,double *);
extern  void
  PixelGetMagickColor(const PixelWand *,MagickPixelPacket *);
extern  void
  PixelGetQuantumColor(const PixelWand *,PixelPacket *);
extern  void
  PixelSetAlpha(PixelWand *,const double);
extern  void
  PixelSetAlphaQuantum(PixelWand *,const Quantum);
extern  void
  PixelSetBlack(PixelWand *,const double);
extern  void
  PixelSetBlackQuantum(PixelWand *,const Quantum);
extern  void
  PixelSetBlue(PixelWand *,const double);
extern  void
  PixelSetBlueQuantum(PixelWand *,const Quantum);
extern  void
  PixelSetColorFromWand(PixelWand *,const PixelWand *);
extern  void
  PixelSetColorCount(PixelWand *,const size_t);
extern  void
  PixelSetCyan(PixelWand *,const double);
extern  void
  PixelSetCyanQuantum(PixelWand *,const Quantum);
extern  void
  PixelSetFuzz(PixelWand *,const double);
extern  void
  PixelSetGreen(PixelWand *,const double);
extern  void
  PixelSetGreenQuantum(PixelWand *,const Quantum);
extern  void
  PixelSetHSL(PixelWand *,const double,const double,const double);
extern  void
  PixelSetIndex(PixelWand *,const IndexPacket);
extern  void
  PixelSetMagenta(PixelWand *,const double);
extern  void
  PixelSetMagentaQuantum(PixelWand *,const Quantum);
extern  void
  PixelSetMagickColor(PixelWand *,const MagickPixelPacket *);
extern  void
  PixelSetOpacity(PixelWand *,const double);
extern  void
  PixelSetOpacityQuantum(PixelWand *,const Quantum);
extern  void
  PixelSetQuantumColor(PixelWand *,const PixelPacket *);
extern  void
  PixelSetRed(PixelWand *,const double);
extern  void
  PixelSetRedQuantum(PixelWand *,const Quantum);
extern  void
  PixelSetYellow(PixelWand *,const double);
extern  void
  PixelSetYellowQuantum(PixelWand *,const Quantum);


