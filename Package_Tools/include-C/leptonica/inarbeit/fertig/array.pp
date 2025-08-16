
unit array;
interface

{
  Automatically converted by H2Pas 1.0.0 from array.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    array.h
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
PL_Bytea  = ^L_Bytea;
PL_Dna  = ^L_Dna;
PL_Dnaa  = ^L_Dnaa;
PL_DnaHash  = ^L_DnaHash;
Pl_float32  = ^l_float32;
Pl_float64  = ^l_float64;
Pl_uint8  = ^l_uint8;
PNuma  = ^Numa;
PNumaa  = ^Numaa;
PSarray  = ^Sarray;
Pxxxxxxxxx  = ^xxxxxxxxx;
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
{$ifndef  LEPTONICA_ARRAY_H}
{$define LEPTONICA_ARRAY_H}
{!
 * \file array.h
 *
 * <pre>
 *  Contains the following structs:
 *      struct Numa          array of floats
 *      struct Numaa
 *      struct L_Dna         array of doubles
 *      struct L_Dnaa
 *      struct L_Dnahash
 *      struct Sarray        array of C-strings
 *      struct L_Bytea       array of bytes
 *
 *  Contains definitions for:
 *      Numa interpolation flags
 *      Numa border flags
 *      Numa data type conversion to string
 *
 *  Here are the non-image-related arrays in leptonica:
 *  * Numa, L_Dna, L_Ptra, Sarray:
 *    These have most of the typical operations of vectors, such as add,
 *    insert, remove and replace.
 *  * Numaa, L_Dnaa, L_Ptraa:
 *    These are arrays of float, double and generic pointer arrays.
 *  * L_Bytea:
 *    This is an array of bytes, analogous to a C++ string.
 *  * L_Dnahash:
 *    This is a simple hashing for integers, used in the jbig2 classifier.
 * </pre>
  }
{------------------------------------------------------------------------*
 *                             Array Structs                              *
 *------------------------------------------------------------------------ }
{! Numa version for serialization  }

const
  NUMA_VERSION_NUMBER = 1;  
{! Number array: an array of floats  }
{!< size of allocated number array       }
{!< number of numbers saved              }
{!< reference count (1 if no clones)     }
{!< x value assigned to array[0]         }
{!< change in x value as i --> i + 1     }
{!< number array                         }
type
  PNuma = ^TNuma;
  TNuma = record
      nalloc : Tl_int32;
      n : Tl_int32;
      refcount : Tl_int32;
      startx : Tl_float32;
      delx : Tl_float32;
      array : Pl_float32;
    end;

{! Array of number arrays  }
{!< size of allocated ptr array           }
{!< number of Numa saved                  }
{!< array of Numa                         }
  PNumaa = ^TNumaa;
  TNumaa = record
      nalloc : Tl_int32;
      n : Tl_int32;
      numa : ^PNuma;
    end;

{! Dna version for serialization  }

const
  DNA_VERSION_NUMBER = 1;  
{! Double number array: an array of doubles  }
{!< size of allocated number array       }
{!< number of numbers saved              }
{!< reference count (1 if no clones)     }
{!< x value assigned to array[0]         }
{!< change in x value as i --> i + 1     }
{!< number array                         }
type
  PL_Dna = ^TL_Dna;
  TL_Dna = record
      nalloc : Tl_int32;
      n : Tl_int32;
      refcount : Tl_int32;
      startx : Tl_float64;
      delx : Tl_float64;
      array : Pl_float64;
    end;

{! Array of double number arrays  }
{!< size of allocated ptr array           }
{!< number of L_Dna saved                 }
{!< array of L_Dna                        }
  PL_Dnaa = ^TL_Dnaa;
  TL_Dnaa = record
      nalloc : Tl_int32;
      n : Tl_int32;
      dna : ^PL_Dna;
    end;

{!< initial size of each dna that is made   }
{!< array of L_Dna                        }
  PL_DnaHash = ^TL_DnaHash;
  TL_DnaHash = record
      nbuckets : Tl_int32;
      initsize : Tl_int32;
      dna : ^PL_Dna;
    end;

{! Sarray version for serialization  }

const
  SARRAY_VERSION_NUMBER = 1;  
{! String array: an array of C strings  }
{!< size of allocated ptr array          }
{!< number of strings allocated          }
{!< reference count (1 if no clones)     }
{!< string array                         }
type
  PSarray = ^TSarray;
  TSarray = record
      nalloc : Tl_int32;
      n : Tl_int32;
      refcount : Tl_int32;
      array : ^Pchar;
    end;

{! Byte array (analogous to C++ "string")  }
{!< number of bytes allocated in data array   }
{!< number of bytes presently used            }
{!< reference count (1 if no clones)          }
{!< data array                                }
  PL_Bytea = ^TL_Bytea;
  TL_Bytea = record
      nalloc : Tsize_t;
      size : Tsize_t;
      refcount : Tl_int32;
      data : Pl_uint8;
    end;

{------------------------------------------------------------------------*
 *                              Array flags                               *
 *------------------------------------------------------------------------ }
{! Numa Interpolation  }
{!< linear      }
{!< quadratic   }
  Txxxxxxxxx =  Longint;
  Const
    L_LINEAR_INTERP = 1;
    L_QUADRATIC_INTERP = 2;

{! Numa Border Adding  }
{!< extended with same value                   }
{!< extended with constant normal derivative   }
{!< mirrored                                   }
type
  Txxxxxxxxxx =  Longint;
  Const
    L_CONTINUED_BORDER = 1;
    L_SLOPE_BORDER = 2;
    L_MIRRORED_BORDER = 3;

{! Numa Data Conversion  }
{!< convert to integer   }
{!< convert to float     }
type
  Txxxxxxxxxx =  Longint;
  Const
    L_INTEGER_VALUE = 1;
    L_FLOAT_VALUE = 2;

{$endif}
{ LEPTONICA_ARRAY_H  }

implementation


end.
