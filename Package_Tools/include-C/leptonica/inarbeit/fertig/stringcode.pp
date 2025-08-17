
unit stringcode;
interface

{
  Automatically converted by H2Pas 1.0.0 from stringcode.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    stringcode.h
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
PL_StrCode  = ^L_StrCode;
PSARRAY  = ^SARRAY;
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
{$ifndef  LEPTONICA_STRINGCODE_H}
{$define LEPTONICA_STRINGCODE_H}
{!
 * \file stringcode.h
 *
 *     Data structure to hold accumulating generated code for storing
 *     and extracting serializable leptonica objects (e.g., pixa, recog).
 *
 *     Also a flag for selecting a string from the L_GenAssoc struct
 *     in stringcode.
  }
{!< index for function and output file names    }
{!< index into struct currently being stored    }
{!< store case code for extraction              }
{!< store base64 encoded data as strings        }
{!< store line in description table             }
{!< number of data strings                      }
type
  PL_StrCode = ^TL_StrCode;
  TL_StrCode = record
      fileno : Tl_int32;
      ifunc : Tl_int32;
      _function : PSARRAY;
      data : PSARRAY;
      descr : PSARRAY;
      n : Tl_int32;
    end;

{! Select string in stringcode for a specific serializable data type  }
{! Stringcode Select  }
{!< typedef for the data type                       }
{!< name of the data type                           }
{!< reader to get the data type from file           }
{!< reader to get the compressed string in memory   }
  Txxxxxxxxxx =  Longint;
  Const
    L_STR_TYPE = 0;
    L_STR_NAME = 1;
    L_STR_READER = 2;
    L_STR_MEMREADER = 3;

{$endif}
{ LEPTONICA_STRINGCODE_H  }

implementation


end.
