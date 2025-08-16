
unit ccbord;
interface

{
  Automatically converted by H2Pas 1.0.0 from ccbord.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    ccbord.h
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
PCCBord  = ^CCBord;
PCCBorda  = ^CCBorda;
PNumaa  = ^Numaa;
PPix  = ^Pix;
PPta  = ^Pta;
PPtaa  = ^Ptaa;
Pxxxxxxxxx  = ^xxxxxxxxx;
Pxxxxxxxxxxx  = ^xxxxxxxxxxx;
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
{$ifndef  LEPTONICA_CCBORD_H}
{$define LEPTONICA_CCBORD_H}
{!
 * \file ccbord.h
 *
 * <pre>
 *           CCBord:   represents a single connected component
 *           CCBorda:  an array of CCBord
 * </pre>
  }
{! Use in ccbaStepChainsToPixCoords()  }
{! CCB Coords  }
type
  Txxxxxxxxx =  Longint;
  Const
    CCB_LOCAL_COORDS = 1;
    CCB_GLOBAL_COORDS = 2;

{! Use in ccbaGenerateSPGlobalLocs()  }
{! CCB Points  }
type
  Txxxxxxxxxxx =  Longint;
  Const
    CCB_SAVE_ALL_PTS = 1;
    CCB_SAVE_TURNING_PTS = 2;

{!
     * <pre>
     * CCBord contains:
     *
     *    (1) a minimally-clipped bitmap of the component (pix),
     *    (2) a boxa consisting of:
     *          for the primary component:
     *                (xul, yul) pixel location in global coords
     *                (w, h) of the bitmap
     *          for the hole components:
     *                (x, y) in relative coordinates in primary component
     *                (w, h) of the hole border (which is 2 pixels
     *                       larger in each direction than the hole itself)
     *    (3) a pta ('start') of the initial border pixel location for each
     *        closed curve, all in relative coordinates of the primary
     *        component.  This is given for the primary component,
     *        followed by the hole components, if any.
     *    (4) a refcount of the ccbord; used internally when a ccbord
     *        is accessed from a ccborda (array of ccbord)
     *    (5) a ptaa for the chain code for the border in relative
     *        coordinates, where the first pta is the exterior border
     *        and all other pta are for interior borders (holes)
     *    (6) a ptaa for the global pixel loc rendition of the border,
     *        where the first pta is the exterior border and all other
     *        pta are for interior borders (holes).
     *        This is derived from the local or step chain code.
     *    (7) a numaa for the chain code for the border as orientation
     *        directions between successive border pixels, where
     *        the first numa is the exterior border and all other
     *        numa are for interior borders (holes).  This is derived
     *        from the local chain code.  The 8 directions are 0 - 7.
     *    (8) a pta for a single chain for each c.c., comprised of outer
     *        and hole borders, plus cut paths between them, all in
     *        local coords.
     *    (9) a pta for a single chain for each c.c., comprised of outer
     *        and hole borders, plus cut paths between them, all in
     *        global coords.
     * </pre>
      }
{!< component bitmap (min size)       }
{!< regions of each closed curve      }
{!< initial border pixel locations    }
{!< number of handles; start at 1     }
{!< ptaa of chain pixels (local)      }
{!< ptaa of chain pixels (global)     }
{!< numaa of chain code (step dir)    }
{!< pta of single chain (local)       }
{!< pta of single chain (global)      }
type
  PCCBord = ^TCCBord;
  TCCBord = record
      pix : PPix;
      boxa : PBoxa;
      start : PPta;
      refcount : Tl_int32;
      local : PPtaa;
      global : PPtaa;
      step : PNumaa;
      splocal : PPta;
      spglobal : PPta;
    end;

{! Array of CCBord  }
{!< input pix (may be null)           }
{!< width of pix                      }
{!< height of pix                     }
{!< number of ccbord in ptr array     }
{!< number of ccbord ptrs allocated   }
{!< ccb ptr array                     }
  PCCBorda = ^TCCBorda;
  TCCBorda = record
      pix : PPix;
      w : Tl_int32;
      h : Tl_int32;
      n : Tl_int32;
      nalloc : Tl_int32;
      ccb : ^PCCBord;
    end;

{$endif}
{ LEPTONICA_CCBORD_H  }

implementation


end.
