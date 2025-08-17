unit bmp;

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
{$ifndef  LEPTONICA_BMP_H}
{$define LEPTONICA_BMP_H}
{!
 * \file bmp.h
 *
 * <pre>
 * This file is here to describe the fields in the header of
 * the BMP file.  These fields are not used directly in Leptonica.
 * The only thing we use are the sizes of these two headers.
 * Furthermore, because of potential namespace conflicts with
 * the typedefs and defined sizes, we have changed the names
 * to protect anyone who may also need to use the original definitions.
 * Thanks to J. D. Bryan for pointing out the potential problems when
 * developing on Win32 compatible systems.
 * </pre>
  }
{-------------------------------------------------------------*
 *                       BMP file header                       *
 *------------------------------------------------------------- }
{! BMP file header
 *
 * Notes:
 *  (1) The bfSize field is stored as a 32 bit integer and includes
 *      the size of the BMP_FileHeader, BMP_InfoHeader, the color
 *      table (if any), and the size of the DIB bits.
 *  (2) The bfOffBits field is also stored as a 32 bit integer and
 *      contains the absolute offset in bytes of the image data
 *      in this file. Some bmp files have additional data after the
 *      BMP_InfoHeader and before the color table (if it exists).
 *      However, enabling reading of these files makes the reader
 *      vulnerable to various malware attacks.  Therefore we do not
 *      read bmp files with extra data, and require that the size
 *      of the color table in bytes is
 *         offset - sizeof(BMP_FileHeader) - sizeof(BMP_InfoHeader)
 *  (3) Use arrays of l_uint8[] to make an endianness agnostic
 *      access to the BMP_FileHeader easier.
  }
{!< file type; must be "BM"             }
{!< length of the file;
                                       sizeof(BMP_FileHeader) +
                                       sizeof(BMP_InfoHeader) +
                                       size of optional extra data +
                                       size of color table +
                                       size of DIB bits                     }
{!< don't care (set to 0)               }
{!< don't care (set to 0)               }
{!< offset from beginning of file       }
type
  PBMP_FileHeader = ^TBMP_FileHeader;
  TBMP_FileHeader = record
      bfType : array[0..1] of Tl_uint8;
      bfSize : array[0..3] of Tl_uint8;
      bfReserved1 : array[0..1] of Tl_uint8;
      bfReserved2 : array[0..1] of Tl_uint8;
      bfOffBits : array[0..3] of Tl_uint8;
    end;

  TBMP_FileHeader = TBMP_FH;
{! Number of bytes in a BMP file header  }

{ was #define dname def_expr }
function BMP_FHBYTES : longint; { return type might be wrong }

{-------------------------------------------------------------*
 *                       BMP info header                       *
 *------------------------------------------------------------- }
{! BMP info header  }
{!< size of the BMP_InfoHeader struct    }
{!< bitmap width in pixels               }
{!< bitmap height in pixels              }
{!< number of bitmap planes              }
{!< number of bits per pixel             }
{!< compress format (0 == uncompressed)  }
{!< size of image in bytes               }
{!< pixels per meter in x direction      }
{!< pixels per meter in y direction      }
{!< number of colors used                }
{!< number of important colors used      }
type
  PBMP_InfoHeader = ^TBMP_InfoHeader;
  TBMP_InfoHeader = record
      biSize : Tl_int32;
      biWidth : Tl_int32;
      biHeight : Tl_int32;
      biPlanes : Tl_int16;
      biBitCount : Tl_int16;
      biCompression : Tl_int32;
      biSizeImage : Tl_int32;
      biXPelsPerMeter : Tl_int32;
      biYPelsPerMeter : Tl_int32;
      biClrUsed : Tl_int32;
      biClrImportant : Tl_int32;
    end;

  TBMP_InfoHeader = TBMP_IH;
{! Number of bytes in a BMP info header  }

{ was #define dname def_expr }
function BMP_IHBYTES : longint; { return type might be wrong }

{-------------------------------------------------------------*
 *           Align BMP headers on 4 byte boundaries            *
 *------------------------------------------------------------- }
{! BMP_IH is misaligned, causing crashes on some big-endians.
 *  A packed struct forces alignment.  }
{$if defined(__GNUC__)}
type
  PBMP_HEADER = ^TBMP_HEADER;
  TBMP_HEADER = record
      bmpfh : TBMP_FH;
      bmpih : TBMP_IH;
    end;
{$endif}
{$endif}
{ LEPTONICA_BMP_H  }

// === Konventiert am: 17-8-25 13:39:55 ===


implementation


{ was #define dname def_expr }
function BMP_FHBYTES : longint; { return type might be wrong }
  begin
    BMP_FHBYTES:=sizeof(BMP_FH);
  end;

{ was #define dname def_expr }
function BMP_IHBYTES : longint; { return type might be wrong }
  begin
    BMP_IHBYTES:=sizeof(BMP_IH);
  end;


end.
