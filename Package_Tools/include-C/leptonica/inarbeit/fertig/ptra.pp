
unit ptra;
interface

{
  Automatically converted by H2Pas 1.0.0 from ptra.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    ptra.h
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
PL_Ptra  = ^L_Ptra;
PL_Ptraa  = ^L_Ptraa;
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
{$ifndef  LEPTONICA_PTRA_H}
{$define LEPTONICA_PTRA_H}
{!
 * \file ptra.h
 *
 * <pre>
 *  Contains the following structs:
 *      struct L_Ptra
 *      struct L_Ptraa
 *
 *  Contains definitions for:
 *      L_Ptra compaction flags for removal
 *      L_Ptra shifting flags for insert
 *      L_Ptraa accessor flags
 * </pre>
  }
{ Bound on max initial ptra size  }
(* Const before type ignored *)
  var
    MaxInitPtraSize : Tl_uint32;cvar;external;
{------------------------------------------------------------------------*
 *                     Generic Ptr Array Structs                          *
 *------------------------------------------------------------------------ }
{! Generic pointer array  }
{!< size of allocated ptr array          }
{!< greatest valid index                 }
{!< actual number of stored elements     }
{!< ptr array                            }
type
  PL_Ptra = ^TL_Ptra;
  TL_Ptra = record
      nalloc : Tl_int32;
      imax : Tl_int32;
      nactual : Tl_int32;
      array : ^pointer;
    end;

{! Array of generic pointer arrays  }
{!< size of allocated ptr array          }
{!< array of ptra                        }
  PL_Ptraa = ^TL_Ptraa;
  TL_Ptraa = record
      nalloc : Tl_int32;
      ptra : ^PL_Ptra;
    end;

{------------------------------------------------------------------------*
 *          Accessor and modifier flags for L_Ptra and L_Ptraa            *
 *------------------------------------------------------------------------ }
{! Ptra Removal  }
{!< null the pointer only                 }
{!< compact the array                     }
  Txxxxxxxxxx =  Longint;
  Const
    L_NO_COMPACTION = 1;
    L_COMPACTION = 2;

{! Ptra Insertion  }
{!< choose based on number of holes         }
{!< downshifts min # of ptrs below insert   }
{!< downshifts all ptrs below insert        }
type
  Txxxxxxxxxx =  Longint;
  Const
    L_AUTO_DOWNSHIFT = 0;
    L_MIN_DOWNSHIFT = 1;
    L_FULL_DOWNSHIFT = 2;

{! Ptraa Accessor  }
{!< ptr to L_Ptra; caller can inspect only     }
{!< caller owns; destroy or save in L_Ptraa    }
type
  Txxxxxxxxxx =  Longint;
  Const
    L_HANDLE_ONLY = 0;
    L_REMOVE = 1;

{$endif}
{ LEPTONICA_PTRA_H  }

implementation


end.
