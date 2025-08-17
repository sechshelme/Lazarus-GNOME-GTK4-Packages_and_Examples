
unit imageio;
interface

{
  Automatically converted by H2Pas 1.0.0 from imageio.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    imageio.h
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
PBox  = ^Box;
Pchar  = ^char;
PL_Compressed_Data  = ^L_Compressed_Data;
PL_Dna  = ^L_Dna;
PL_Pdf_Data  = ^L_Pdf_Data;
PL_Ptra  = ^L_Ptra;
Pl_uint8  = ^l_uint8;
PPta  = ^Pta;
PSarray  = ^Sarray;
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
{!
 * \file imageio.h
 *
 * <pre>
 *  General features of image I/O in leptonica
 *
 *  At present, there are 9 file formats for images that can be read
 *  and written:
 *      png (requires libpng, libz)
 *      jpeg (requires libjpeg)
 *      tiff (requires libtiff, libz)
 *      gif (requires libgif)
 *      webp (requires libwebp)
 *      jp2 (requires libopenjp2)
 *      bmp (no library required)
 *      pnm (no library required)
 *      spix (no library required)
 *  Additionally, there are two file formats for writing (only) images:
 *      PostScript (requires libpng, libz, libjpeg, libtiff)
 *      pdf (requires libpng, libz, libjpeg, libtiff)
 *
 *  For all 9 read/write formats, leptonica provides interconversion
 *  between pix (with raster data) and formatted image data:
 *      Conversion from pix (typically compression):
 *          pixWrite():        pix --> file
 *          pixWriteStream():  pix --> filestream (aka FILE*)
 *          pixWriteMem():     pix --> memory buffer
 *      Conversion to pix (typically decompression):
 *          pixRead():         file --> pix
 *          pixReadStream():   filestream --> pix
 *          pixReadMem():      memory buffer --> pix
 *
 *  Conversions for which the image data is not compressed are:
 *     * uncompressed tiff   (IFF_TIFF)
 *     * bmp
 *     * pnm
 *     * spix (fast serialization that copies the pix raster data)
 *
 *  The image header (metadata) information can be read from either
 *  the compressed file or a memory buffer, for all 9 formats.
 * </pre>
  }
{$ifndef  LEPTONICA_IMAGEIO_H}
{$define LEPTONICA_IMAGEIO_H}
{ --------------------------------------------------------------- *
 *                    Image file format types                      *
 * ---------------------------------------------------------------  }
{
 *  The IFF_DEFAULT flag is used to write the file out in the
 *  same (input) file format that the pix was read from.  If the pix
 *  was not read from file, the input format field will be
 *  IFF_UNKNOWN and the output file format will be chosen to
 *  be compressed and lossless; namely, IFF_TIFF_G4 for d = 1
 *  and IFF_PNG for everything else.
 *
 *  In the future, new format types that have defined extensions
 *  will be added before IFF_DEFAULT, and will be kept in sync with
 *  the file format extensions in writefile.c.  The positions of
 *  file formats before IFF_DEFAULT will remain invariant.
  }
{! Image Formats  }
type
  Txxxxxxxxxx =  Longint;
  Const
    IFF_UNKNOWN = 0;
    IFF_BMP = 1;
    IFF_JFIF_JPEG = 2;
    IFF_PNG = 3;
    IFF_TIFF = 4;
    IFF_TIFF_PACKBITS = 5;
    IFF_TIFF_RLE = 6;
    IFF_TIFF_G3 = 7;
    IFF_TIFF_G4 = 8;
    IFF_TIFF_LZW = 9;
    IFF_TIFF_ZIP = 10;
    IFF_PNM = 11;
    IFF_PS = 12;
    IFF_GIF = 13;
    IFF_JP2 = 14;
    IFF_WEBP = 15;
    IFF_LPDF = 16;
    IFF_TIFF_JPEG = 17;
    IFF_DEFAULT = 18;
    IFF_SPIX = 19;

{xxxxxxxxxxxxx Convenient macro for checking requested tiff output  }
{
#define  L_FORMAT_IS_TIFF(f)  ((f) == IFF_TIFF || (f) == IFF_TIFF_PACKBITS || \
                               (f) == IFF_TIFF_RLE || (f) == IFF_TIFF_G3 || \
                               (f) == IFF_TIFF_G4 || (f) == IFF_TIFF_LZW || \
                               (f) == IFF_TIFF_ZIP || (f) == IFF_TIFF_JPEG)
 }
{ --------------------------------------------------------------- *
 *                         Format header ids                       *
 * ---------------------------------------------------------------  }
{! Header Ids  }
{!< BM - for bitmaps     }
{!< MM - for 'motorola'  }
{!< II - for 'intel'     }
type
  Txxxxxxxxxx =  Longint;
  Const
    BMP_ID = $4d42;
    TIFF_BIGEND_ID = $4d4d;
    TIFF_LITTLEEND_ID = $4949;

{ --------------------------------------------------------------- *
 *                Hinting bit flags in jpeg reader                 *
 * ---------------------------------------------------------------  }
{! Jpeg Hints  }
{ The default behavior is now to fail on data corruption.  }
{!< only want luminance data; no chroma  }
{!< return possibly damaged pix  }
type
  Txxxxxxxxxx =  Longint;
  Const
    L_JPEG_READ_LUMINANCE = 1;
    L_JPEG_CONTINUE_WITH_BAD_DATA = 2;

{ --------------------------------------------------------------- *
 *                            Jp2k codecs                          *
 * ---------------------------------------------------------------  }
{! Jp2k Codecs  }
{!< codestream                  }
{!< file format with 'ihdr'     }
type
  Txxxxxxxxxx =  Longint;
  Const
    L_J2K_CODEC = 1;
    L_JP2_CODEC = 2;

{ --------------------------------------------------------------- *
 *                    Pdf formatted encoding types                 *
 * ---------------------------------------------------------------  }
{! Pdf Encoding  }
{!< use default encoding based on image         }
{!< use dct encoding: 8 and 32 bpp, no cmap     }
{!< use ccitt g4 fax encoding: 1 bpp            }
{!< use flate encoding: any depth, cmap ok      }
{!< use jp2k encoding: 8 and 32 bpp, no cmap    }
type
  Txxxxxxxxxx =  Longint;
  Const
    L_DEFAULT_ENCODE = 0;
    L_JPEG_ENCODE = 1;
    L_G4_ENCODE = 2;
    L_FLATE_ENCODE = 3;
    L_JP2K_ENCODE = 4;

{ --------------------------------------------------------------- *
 *                    Compressed image data                        *
 * ---------------------------------------------------------------  }
{
 *  In use, either datacomp or data85 will be produced, depending
 *  on whether the data needs to be ascii85 encoded.  PostScript
 *  requires ascii85 encoding; pdf does not.
 *
 *  For the colormap (flate compression only), PostScript uses ascii85
 *  encoding and pdf uses a bracketed array of space-separated
 *  hex-encoded rgb triples.  Only tiff g4 (type == L_G4_ENCODE) uses
 *  the minisblack field.
  }
{! Compressed image data  }
{!< encoding type: L_JPEG_ENCODE, etc    }
{!< gzipped raster data                  }
{!< number of compressed bytes           }
{!< ascii85-encoded gzipped raster data  }
{!< number of ascii85 encoded bytes      }
{!< ascii85-encoded uncompressed cmap    }
{!< hex pdf array for the cmap           }
{!< number of colors in cmap             }
{!< image width                          }
{!< image height                         }
{!< bits/sample; typ. 1, 2, 4 or 8       }
{!< samples/pixel; typ. 1 or 3           }
{!< tiff g4 photometry                   }
{!< flate data has PNG predictors        }
{!< number of uncompressed raster bytes  }
{!< resolution (ppi)                     }
type
  PL_Compressed_Data = ^TL_Compressed_Data;
  TL_Compressed_Data = record
      _type : Tl_int32;
      datacomp : Pl_uint8;
      nbytescomp : Tsize_t;
      data85 : Pchar;
      nbytes85 : Tsize_t;
      cmapdata85 : Pchar;
      cmapdatahex : Pchar;
      ncolors : Tl_int32;
      w : Tl_int32;
      h : Tl_int32;
      bps : Tl_int32;
      spp : Tl_int32;
      minisblack : Tl_int32;
      predictor : Tl_int32;
      nbytes : Tsize_t;
      res : Tl_int32;
    end;

  TL_Compressed_Data = TL_COMP_DATA;
{ ------------------------------------------------------------------------- *
 *                           Pdf multi image flags                           *
 * -------------------------------------------------------------------------  }
{! Pdf MultiImage  }
{!< first image to be used                       }
{!< intermediate image; not first or last        }
{!< last image to be used                        }
  Txxxxxxxxxx =  Longint;
  Const
    L_FIRST_IMAGE = 1;
    L_NEXT_IMAGE = 2;
    L_LAST_IMAGE = 3;

{ ------------------------------------------------------------------------- *
 *                     Intermediate pdf generation data                      *
 * -------------------------------------------------------------------------  }
{
 *  This accumulates data for generating a pdf of a single page consisting
 *  of an arbitrary number of images.
 *
 *  None of the strings have a trailing newline.
  }
{! Intermediate pdf generation data  }
{!< optional title for pdf               }
{!< number of images                     }
{!< number of colormaps                  }
{!< array of compressed image data       }
{!< %PDF-1.2 id string                   }
{!< catalog string                       }
{!< metadata string                      }
{!< pages string                         }
{!< page string (variable data)          }
{!< content string (variable data)       }
{!< post-binary-stream string            }
{!< trailer string (variable data)       }
{!< store (xpt, ypt) array               }
{!< store (wpt, hpt) array               }
{!< bounding region for all images       }
{!< pre-binary-stream xobject strings    }
{!< colormap pdf object strings          }
{!< sizes of each pdf string object      }
{!< location of each pdf string object   }
{!< location of xref                     }
type
  PL_Pdf_Data = ^TL_Pdf_Data;
  TL_Pdf_Data = record
      title : Pchar;
      n : Tl_int32;
      ncmap : Tl_int32;
      cida : PL_Ptra;
      id : Pchar;
      obj1 : Pchar;
      obj2 : Pchar;
      obj3 : Pchar;
      obj4 : Pchar;
      obj5 : Pchar;
      poststream : Pchar;
      trailer : Pchar;
      xy : PPta;
      wh : PPta;
      mediabox : PBox;
      saprex : PSarray;
      sacmap : PSarray;
      objsize : PL_Dna;
      objloc : PL_Dna;
      xrefloc : Tl_int32;
    end;

{$endif}
{ LEPTONICA_IMAGEIO_H  }

implementation


end.
