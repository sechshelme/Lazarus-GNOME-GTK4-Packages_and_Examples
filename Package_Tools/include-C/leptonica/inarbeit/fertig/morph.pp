
unit morph;
interface

{
  Automatically converted by H2Pas 1.0.0 from morph.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    morph.h
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
Pl_float32  = ^l_float32;
Pl_int32  = ^l_int32;
PL_Kernel  = ^L_Kernel;
PSel  = ^Sel;
PSela  = ^Sela;
Pxxxxxxxxxx  = ^xxxxxxxxxx;
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
{$ifndef  LEPTONICA_MORPH_H}
{$define LEPTONICA_MORPH_H}
{!
 * \file morph.h
 *
 * <pre>
 *  Contains the following structs:
 *      struct Sel
 *      struct Sela
 *      struct Kernel
 *
 *  Contains definitions for:
 *      morphological b.c. flags
 *      structuring element types
 *      runlength flags for granulometry
 *      direction flags for grayscale morphology
 *      morphological operation flags
 *      standard border size
 *      grayscale intensity scaling flags
 *      morphological tophat flags
 *      arithmetic and logical operator flags
 *      grayscale morphology selection flags
 *      distance function b.c. flags
 *      image comparison flags
 * </pre>
  }
{-------------------------------------------------------------------------*
 *                             Sel and Sel array                           *
 *------------------------------------------------------------------------- }

const
  SEL_VERSION_NUMBER = 1;  
{! Selection  }
{!< sel height                                }
{!< sel width                                 }
{!< y location of sel origin                  }
{!< x location of sel origin                  }
{!< 0,1,2; data[i][j] in [row][col] order   }
{!< used to find sel by name                  }
type
  PSel = ^TSel;
  TSel = record
      sy : Tl_int32;
      sx : Tl_int32;
      cy : Tl_int32;
      cx : Tl_int32;
      data : ^Pl_int32;
      name : Pchar;
    end;

{! Array of Sel  }
{!< number of sel actually stored            }
{!< size of allocated ptr array              }
{!< sel ptr array                            }
  PSela = ^TSela;
  TSela = record
      n : Tl_int32;
      nalloc : Tl_int32;
      sel : ^PSel;
    end;

{-------------------------------------------------------------------------*
 *                                 Kernel                                  *
 *------------------------------------------------------------------------- }

const
  KERNEL_VERSION_NUMBER = 2;  
{! Kernel  }
{!< kernel height                             }
{!< kernel width                              }
{!< y location of kernel origin               }
{!< x location of kernel origin               }
{!< data[i][j] in [row][col] order            }
type
  PL_Kernel = ^TL_Kernel;
  TL_Kernel = record
      sy : Tl_int32;
      sx : Tl_int32;
      cy : Tl_int32;
      cx : Tl_int32;
      data : ^Pl_float32;
    end;

{-------------------------------------------------------------------------*
 *                 Morphological boundary condition flags                  *
 *                                                                         *
 *  Two types of boundary condition for erosion.                           *
 *  The global variable MORPH_BC takes on one of these two values.         *
 *  See notes in morph.c for usage.                                        *
 *------------------------------------------------------------------------- }
{! Morph Boundary  }
  Txxxxxxxxxx =  Longint;
  Const
    SYMMETRIC_MORPH_BC = 0;
    ASYMMETRIC_MORPH_BC = 1;

{-------------------------------------------------------------------------*
 *                        Structuring element vals                         *
 *------------------------------------------------------------------------- }
{! SEL Vals  }
type
  Txxxxxxxxxx =  Longint;
  Const
    SEL_DONT_CARE = 0;
    SEL_HIT = 1;
    SEL_MISS = 2;

{-------------------------------------------------------------------------*
 *                  Runlength flags for granulometry                       *
 *------------------------------------------------------------------------- }
{! Runlength Polarity  }
type
  Txxxxxxxxxx =  Longint;
  Const
    L_RUN_OFF = 0;
    L_RUN_ON = 1;

{-------------------------------------------------------------------------*
 *         Direction flags for grayscale morphology, granulometry,         *
 *                 composable Sels, convolution, etc.                      *
 *------------------------------------------------------------------------- }
{! Direction Flags  }
type
  Txxxxxxxxxx =  Longint;
  Const
    L_HORIZ = 1;
    L_VERT = 2;
    L_BOTH_DIRECTIONS = 3;

{-------------------------------------------------------------------------*
 *                   Morphological operation flags                         *
 *------------------------------------------------------------------------- }
{! Morph Operator  }
type
  Txxxxxxxxxx =  Longint;
  Const
    L_MORPH_DILATE = 1;
    L_MORPH_ERODE = 2;
    L_MORPH_OPEN = 3;
    L_MORPH_CLOSE = 4;
    L_MORPH_HMT = 5;

{-------------------------------------------------------------------------*
 *                    Grayscale intensity scaling flags                    *
 *------------------------------------------------------------------------- }
{! Pixel Value Scaling  }
type
  Txxxxxxxxxx =  Longint;
  Const
    L_LINEAR_SCALE = 1;
    L_LOG_SCALE = 2;

{-------------------------------------------------------------------------*
 *                      Morphological tophat flags                         *
 *------------------------------------------------------------------------- }
{! Morph Tophat  }
type
  Txxxxxxxxxx =  Longint;
  Const
    L_TOPHAT_WHITE = 0;
    L_TOPHAT_BLACK = 1;

{-------------------------------------------------------------------------*
 *                Arithmetic and logical operator flags                    *
 *                 (use on grayscale images and Numas)                     *
 *------------------------------------------------------------------------- }
{! ArithLogical Ops  }
{ on numas only  }
{ on numas only  }
{ on numas only  }
{ on numas only  }
{ on numas only  }
{ on numas only  }
type
  Txxxxxxxxxx =  Longint;
  Const
    L_ARITH_ADD = 1;
    L_ARITH_SUBTRACT = 2;
    L_ARITH_MULTIPLY = 3;
    L_ARITH_DIVIDE = 4;
    L_UNION = 5;
    L_INTERSECTION = 6;
    L_SUBTRACTION = 7;
    L_EXCLUSIVE_OR = 8;

{-------------------------------------------------------------------------*
 *                        Min/max selection flags                          *
 *------------------------------------------------------------------------- }
{! MinMax Selection  }
{ useful in a downscaling "erosion"        }
{ useful in a downscaling "dilation"       }
{ useful in a downscaling contrast         }
{ use a modification of the min value      }
{ use a modification of the max value      }
type
  Txxxxxxxxxx =  Longint;
  Const
    L_CHOOSE_MIN = 1;
    L_CHOOSE_MAX = 2;
    L_CHOOSE_MAXDIFF = 3;
    L_CHOOSE_MIN_BOOST = 4;
    L_CHOOSE_MAX_BOOST = 5;

{-------------------------------------------------------------------------*
 *            Exterior value b.c. for distance function flags              *
 *------------------------------------------------------------------------- }
{! Exterior Value  }
{ assume bg outside image  }
{ assume fg outside image  }
type
  Txxxxxxxxxx =  Longint;
  Const
    L_BOUNDARY_BG = 1;
    L_BOUNDARY_FG = 2;

{-------------------------------------------------------------------------*
 *                         Image comparison flags                          *
 *------------------------------------------------------------------------- }
{! Image Comparison  }
type
  Txxxxxxxxxx =  Longint;
  Const
    L_COMPARE_XOR = 1;
    L_COMPARE_SUBTRACT = 2;
    L_COMPARE_ABS_DIFF = 3;

{-------------------------------------------------------------------------*
 *    Standard size of border added around images for special processing   *
 *------------------------------------------------------------------------- }
{ xxxxxxxxxxxxxxxxxxxx static const l_int32  ADDED_BORDER = 32;   /*!< pixels, not bits */ }
{$endif}
{ LEPTONICA_MORPH_H  }

implementation


end.
