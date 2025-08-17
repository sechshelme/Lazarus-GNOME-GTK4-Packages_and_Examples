unit watershed;

interface

uses
  fp_lept;

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
{$ifndef  LEPTONICA_WATERSHED_H}
{$define LEPTONICA_WATERSHED_H}
{!
 * \file watershed.h
 *
 *     Simple data structure to hold watershed data.
 *     All data here is owned by the L_WShed and must be freed.
  }
{! Simple data structure to hold watershed data.  }
{!< clone of input 8 bpp pixs                 }
{!< clone of input 1 bpp seed (marker) pixm   }
{!< minimum depth allowed for a watershed     }
{!< 16 bpp label pix                          }
{!< scratch pix for computing wshed regions   }
{!< line ptrs for pixs                        }
{!< line ptrs for pixm                        }
{!< line ptrs for pixlab                      }
{!< line ptrs for pixt                        }
{!< result: 1 bpp pixa of watersheds          }
{!< pta of initial seed pixels                }
{!< numa of seed indicators; 0 if completed   }
{!< numa of initial seed heights              }
{!< numa of initial minima heights            }
{!< result: numa of watershed levels          }
{!< number of seeds (markers)                 }
{!< number of minima different from seeds     }
{!< lut for pixel indices                     }
{!< back-links into lut, for updates          }
{!< size of links array                       }
{!< set to 1 for debug output                 }
type
  PL_WShed = ^TL_WShed;
  TL_WShed = record
      pixs : PPix;
      pixm : PPix;
      mindepth : Tl_int32;
      pixlab : PPix;
      pixt : PPix;
      lines8 : ^pointer;
      linem1 : ^pointer;
      linelab32 : ^pointer;
      linet1 : ^pointer;
      pixad : PPixa;
      ptas : PPta;
      nasi : PNuma;
      nash : PNuma;
      namh : PNuma;
      nalevels : PNuma;
      nseeds : Tl_int32;
      nother : Tl_int32;
      lut : Pl_int32;
      links : ^PNuma;
      arraysize : Tl_int32;
      debug : Tl_int32;
    end;

{$endif}
{ LEPTONICA_WATERSHED_H  }

// === Konventiert am: 17-8-25 13:40:45 ===


implementation



end.
