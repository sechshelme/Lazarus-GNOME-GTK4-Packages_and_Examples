
unit bmf;
interface

{
  Automatically converted by H2Pas 1.0.0 from bmf.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    bmf.h
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
PL_Bmf  = ^L_Bmf;
Pl_int32  = ^l_int32;
PPixa  = ^Pixa;
Pxxxxx  = ^xxxxx;
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
{$ifndef  LEPTONICA_BMF_H}
{$define LEPTONICA_BMF_H}
{!
 * \file bmf.h
 *
 *     Simple data structure to hold bitmap fonts and related data
  }
{! Constants for deciding when text block is divided into paragraphs  }
{! Split Text  }
{!< tab or space at beginning of line    }
{!< newline with optional white space    }
{!< leading white space or newline       }
type
  Txxxxx =  Longint;
  Const
    SPLIT_ON_LEADING_WHITE = 1;
    SPLIT_ON_BLANK_LINE = 2;
    SPLIT_ON_BOTH = 3;

{! Data structure to hold bitmap fonts and related data  }
{!< pixa of bitmaps for 93 characters         }
{!< font size (in points at 300 ppi)          }
{!< directory containing font bitmaps         }
{!< baseline offset for ascii 33 - 57         }
{!< baseline offset for ascii 58 - 91         }
{!< baseline offset for ascii 93 - 126        }
{!< max height of line of chars               }
{!< pixel dist between char bitmaps           }
{!< pixel dist between word bitmaps           }
{!< extra vertical space between text lines   }
{!< table mapping ascii --> font index        }
{!< table mapping ascii --> baseline offset   }
{!< table mapping ascii --> char width        }
type
  PL_Bmf = ^TL_Bmf;
  TL_Bmf = record
      pixa : PPixa;
      size : Tl_int32;
      directory : Pchar;
      baseline1 : Tl_int32;
      baseline2 : Tl_int32;
      baseline3 : Tl_int32;
      lineheight : Tl_int32;
      kernwidth : Tl_int32;
      spacewidth : Tl_int32;
      vertlinesep : Tl_int32;
      fonttab : Pl_int32;
      baselinetab : Pl_int32;
      widthtab : Pl_int32;
    end;

{$endif}
{ LEPTONICA_BMF_H  }

implementation


end.
