
unit sudoku;
interface

{
  Automatically converted by H2Pas 1.0.0 from sudoku.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    sudoku.h
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
Pl_int32  = ^l_int32;
PL_Sudoku  = ^L_Sudoku;
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
{$ifndef SUDOKU_H_INCLUDED}
{$define SUDOKU_H_INCLUDED}
{!
 * \file sudoku.h
 *
 * <pre>
 *    The L_Sudoku holds all the information of the current state.
 *
 *    The input to sudokuCreate() is a file with any number of lines
 *    starting with '#', followed by 9 lines consisting of 9 numbers
 *    in each line.  These have the known values and use 0 for the unknowns.
 *    Blank lines are ignored.
 *
 *    The %locs array holds the indices of the unknowns, numbered
 *    left-to-right and top-to-bottom from 0 to 80.  The array size
 *    is initialized to %num.  %current is the index into the %locs
 *    array of the current guess: locs[current].
 *
 *    The %state array is used to determine the validity of each guess.
 *    It is of size 81, and is initialized by setting the unknowns to 0
 *    and the knowns to their input values.
 * </pre>
  }
{!< number of unknowns                      }
{!< location of unknowns                    }
{!< index into %locs of current location    }
{!< initial state, with 0 representing      }
{!< the unknowns                            }
{!< present state, including inits and      }
{!< guesses of unknowns up to %current      }
{!< shows current number of guesses         }
{!< set to 1 when solved                    }
{!< set to 1 if no solution is possible     }
type
  PL_Sudoku = ^TL_Sudoku;
  TL_Sudoku = record
      num : Tl_int32;
      locs : Pl_int32;
      current : Tl_int32;
      init : Pl_int32;
      state : Pl_int32;
      nguess : Tl_int32;
      finished : Tl_int32;
      failure : Tl_int32;
    end;

{! For printing out array data  }
{! Sudoku Output  }
  Txxxxxxxxxx =  Longint;
  Const
    L_SUDOKU_INIT = 0;
    L_SUDOKU_STATE = 1;

{$endif}
{ SUDOKU_H_INCLUDED  }

implementation


end.
