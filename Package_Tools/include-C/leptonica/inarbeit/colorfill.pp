
unit colorfill;
interface

{
  Automatically converted by H2Pas 1.0.0 from colorfill.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    colorfill.h
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
PBoxa  = ^Boxa;
PL_Colorfill  = ^L_Colorfill;
PL_Dnaa  = ^L_Dnaa;
PNumaa  = ^Numaa;
PPix  = ^Pix;
PPixa  = ^Pixa;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{====================================================================*
 -  Copyright (C) 2001 Leptonica.  All rights reserved.
 -
 -  Redistribution and use in source and binary forms, with or without
 -  modification, are permitted provided that the following conditions
 -  are met:
 -  1. Redistributions of source code must retain the above copyright
 -     notice, this list of conditions and the following disclaimer.
 -  2. Redistributions in binary form must reproduce the above
 -     copyright notice, this list of conditions and the following
 -     disclaimer in the documentation and/or other materials
 -     provided with the distribution.
 -
 -  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 -  ``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 -  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 -  A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL ANY
 -  CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 -  EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 -  PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
 -  PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY
 -  OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
 -  NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 -  SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *==================================================================== }
{$ifndef  LEPTONICA_COLORFILL_H}
{$define LEPTONICA_COLORFILL_H}
{!
 * \file colorfill.h
 *
 * <pre>
 *  Contains the following struct
 *      struct L_Colorfill
 *
 *  This accumulates color information, linked to location, within a
 *  set of tiles that (mostly) covers an input RGB image.
 * </pre>
  }
{------------------------------------------------------------------------*
 *                            Colorfill data                              *
 *------------------------------------------------------------------------ }
{! Colorfill data  }
{!< clone of source pix                     }
{!< source pix, after optional transform    }
{!< number of tiles in each tile row        }
{!< number of tiles in each tile column     }
{!< width of each tile                      }
{!< height of each tile                     }
{!< min number of pixels in a color region  }
{!< tile locations                          }
{!< tiles from source pix                   }
{!< mask tiles with components covering     }
{!< regions with similar color              }
{!< sizes of color regions (in pixels)      }
{!< average color in each region            }
{!< debug reconstruction from segmentation  }
type
  PL_Colorfill = ^TL_Colorfill;
  TL_Colorfill = record
      pixs : PPix;
      pixst : PPix;
      nx : Tl_int32;
      ny : Tl_int32;
      tw : Tl_int32;
      th : Tl_int32;
      minarea : Tl_int32;
      boxas : PBoxa;
      pixas : PPixa;
      pixam : PPixa;
      naa : PNumaa;
      dnaa : PL_Dnaa;
      pixadb : PPixa;
    end;

{$endif}
{ LEPTONICA_COLORFILL_H  }

implementation


end.
