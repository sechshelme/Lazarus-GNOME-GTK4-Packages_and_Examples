
unit pix;
interface

{
  Automatically converted by H2Pas 1.0.0 from pix.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    pix.h
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
Palloc_fn  = ^alloc_fn;
PBox  = ^Box;
PBoxa  = ^Boxa;
PBoxaa  = ^Boxaa;
Pchar  = ^char;
PDPix  = ^DPix;
PFPix  = ^FPix;
PFPixa  = ^FPixa;
Pl_float32  = ^l_float32;
Pl_float64  = ^l_float64;
Pl_uint32  = ^l_uint32;
Pl_uint8  = ^l_uint8;
PPix  = ^Pix;
PPixa  = ^Pixa;
PPixaa  = ^Pixaa;
PPixacc  = ^Pixacc;
PPixaComp  = ^PixaComp;
PPixColormap  = ^PixColormap;
PPixComp  = ^PixComp;
PPixTiling  = ^PixTiling;
PPta  = ^Pta;
PPtaa  = ^Ptaa;
PRGBA_Quad  = ^RGBA_Quad;
Pxxxxxxxx  = ^xxxxxxxx;
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
{$ifndef  LEPTONICA_PIX_H}
{$define LEPTONICA_PIX_H}
{!
 * \file pix.h
 *
 * <pre>
 *   Valid image types in leptonica:
 *       Pix: 1 bpp, with and without colormap
 *       Pix: 2 bpp, with and without colormap
 *       Pix: 4 bpp, with and without colormap
 *       Pix: 8 bpp, with and without colormap
 *       Pix: 16 bpp (1 spp)
 *       Pix: 32 bpp (rgb, 3 spp)
 *       Pix: 32 bpp (rgba, 4 spp)
 *       FPix: 32 bpp float
 *       DPix: 64 bpp double
 *       Notes:
 *          (1) The only valid Pix image type with alpha is rgba.
 *              In particular, the alpha component is not used in
 *              cmapped images.
 *          (2) PixComp can hold any Pix with IFF_PNG encoding.
 *
 *   Contents:
 *
 *   (1) This file defines most of the image-related structs used in leptonica:
 *         struct Pix
 *         struct PixColormap
 *         struct RGBA_Quad
 *         struct Pixa
 *         struct Pixaa
 *         struct Box
 *         struct Boxa
 *         struct Boxaa
 *         struct Pta
 *         struct Ptaa
 *         struct Pixacc
 *         struct PixTiling
 *         struct FPix
 *         struct FPixa
 *         struct DPix
 *         struct PixComp
 *         struct PixaComp
 *
 *   (2) This file has definitions for:
 *         Colors for RGBA
 *         Colors for drawing boxes
 *         Perceptual color weights
 *         Colormap conversion flags
 *         Rasterop bit flags
 *         Structure access flags (for insert, copy, clone, copy-clone)
 *         Sorting flags (by type and direction)
 *         Blending flags
 *         Graphics pixel setting flags
 *         Size and location filter flags
 *         Color component selection flags
 *         Color content flags
 *         16-bit conversion flags
 *         Rotation and shear flags
 *         Affine transform order flags
 *         Grayscale filling flags
 *         Flags for setting to white or black
 *         Flags for getting white or black pixel value
 *         Flags for 8 and 16 bit pixel sums
 *         Dithering flags
 *         Distance flags
 *         Value flags
 *         Statistical measures
 *         Set selection flags
 *         Text orientation flags
 *         Edge orientation flags
 *         Line orientation flags
 *         Image orientation flags
 *         Scan direction flags
 *         Box size adjustment flags
 *         Flags for modifying box boundaries using a second box
 *         Handling overlapping bounding boxes in boxa
 *         Selecting or making a box from two (intersecting) boxes
 *         Flags for replacing invalid boxes
 *         Flags for box corners and center
 *         Horizontal warp
 *         Pixel selection for resampling
 *         Thinning flags
 *         Runlength flags
 *         Edge filter flags
 *         Subpixel color component ordering in LCD display
 *         HSV histogram flags
 *         Region flags (inclusion, exclusion)
 *         Flags for adding text to a pix
 *         Flags for plotting on a pix
 *         Flags for making simple masks
 *         Flags for selecting display program
 *         Flags in the 'special' pix field for non-default operations
 *         Handling negative values in conversion to unsigned int
 *         Relative to zero flags
 *         Flags for adding or removing trailing slash from string
 *
 *   (3) This file has typedefs for the pix allocator and deallocator functions
 *         alloc_fn()
 *         dealloc_fn().
 * </pre>
  }
{-------------------------------------------------------------------------*
 *                              Basic Pix                                  *
 *------------------------------------------------------------------------- }
{ The 'special' field is by default 0, but it can hold integers
     * that direct non-default actions, e.g., in png and jpeg I/O.  }
{! Basic Pix  }
{!< width in pixels                    }
{!< height in pixels                   }
{!< depth in bits (bpp)                }
{!< number of samples per pixel        }
{!< 32-bit words/line                  }
{!< reference count (1 if no clones)   }
{!< image res (ppi) in x direction     }
{!< (use 0 if unknown)                 }
{!< image res (ppi) in y direction     }
{!< (use 0 if unknown)                 }
{!< input file format, IFF_*           }
{!< special instructions for I/O, etc  }
{!< text string associated with pix    }
{!< colormap (may be null)             }
{!< the image data                     }
type
  PPix = ^TPix;
  TPix = record
      w : Tl_uint32;
      h : Tl_uint32;
      d : Tl_uint32;
      spp : Tl_uint32;
      wpl : Tl_uint32;
      refcount : Tl_uint32;
      xres : Tl_int32;
      yres : Tl_int32;
      informat : Tl_int32;
      special : Tl_int32;
      text : Pchar;
      colormap : PPixColormap;
      data : Pl_uint32;
    end;

{! Colormap of a Pix  }
{!< colormap table (array of RGBA_QUAD)      }
{!< of pix (1, 2, 4 or 8 bpp)                }
{!< number of color entries allocated        }
{!< number of color entries used             }
  PPixColormap = ^TPixColormap;
  TPixColormap = record
      array : pointer;
      depth : Tl_int32;
      nalloc : Tl_int32;
      n : Tl_int32;
    end;

  TPixColormap = TPIXCMAP;
{! Colormap table entry (after the BMP version).
     * Note that the BMP format stores the colormap table exactly
     * as it appears here, with color samples being stored sequentially,
     * in the order (b,g,r,a).  }
{!< blue value  }
{!< green value  }
{!< red value  }
{!< alpha value  }
  PRGBA_Quad = ^TRGBA_Quad;
  TRGBA_Quad = record
      blue : Tl_uint8;
      green : Tl_uint8;
      red : Tl_uint8;
      alpha : Tl_uint8;
    end;

{-------------------------------------------------------------------------*
 *                           Colors for 32 RGBA                            *
 *------------------------------------------------------------------------- }
{ <pre>
 *  Notes:
 *      (1) These are the byte indices for colors in 32 bpp images.
 *          They are used through the GET/SET_DATA_BYTE accessors.
 *          The 4th byte, typically known as the "alpha channel" and used
 *          for blending, is used to a small extent in leptonica.
 *      (2) Do not change these values!  If you redefine them, functions
 *          that have the shifts hardcoded for efficiency and conciseness
 *          (instead of using the constants below) will break.  These
 *          functions are labelled with "***"  next to their names at
 *          the top of the files in which they are defined.
 *      (3) The shifts to extract the red, green, blue and alpha components
 *          from a 32 bit pixel are defined here.
 * </pre>
  }
{! RGBA Color  }
{!< red color index in RGBA_QUAD     }
{!< green color index in RGBA_QUAD   }
{!< blue color index in RGBA_QUAD    }
{!< alpha value index in RGBA_QUAD   }
  Txxxxxxxx =  Longint;
  Const
    COLOR_RED = 0;
    COLOR_GREEN = 1;
    COLOR_BLUE = 2;
    L_ALPHA_CHANNEL = 3;

{ xxxxxxxxxx }
{static const l_int32  L_RED_SHIFT =       8 * (sizeof(l_uint32) - 1 - COLOR_RED);           /* 24 */ }
{static const l_int32  L_GREEN_SHIFT =       8 * (sizeof(l_uint32) - 1 - COLOR_GREEN);         /* 16 */ }
{static const l_int32  L_BLUE_SHIFT =       8 * (sizeof(l_uint32) - 1 - COLOR_BLUE);          /*  8 */ }
{static const l_int32  L_ALPHA_SHIFT =       8 * (sizeof(l_uint32) - 1 - L_ALPHA_CHANNEL);     /*  0 */ }
{-------------------------------------------------------------------------*
 *                       Colors for drawing boxes                          *
 *------------------------------------------------------------------------- }
{! Box Color  }
{!< draw in red                    }
{!< draw in green                  }
{!< draw in blue                   }
{!< draw specified color           }
{!< draw as sequence of r,g,b      }
{!< draw randomly chosen colors    }
type
  Txxxxxxxxxx =  Longint;
  Const
    L_DRAW_RED = 0;
    L_DRAW_GREEN = 1;
    L_DRAW_BLUE = 2;
    L_DRAW_SPECIFIED = 3;
    L_DRAW_RGB = 4;
    L_DRAW_RANDOM = 5;

{-------------------------------------------------------------------------*
 *                       Perceptual color weights                          *
 *------------------------------------------------------------------------- }
{ <pre>
 *  Notes:
 *      (1) These perceptual weighting factors are ad-hoc, but they do
 *          add up to 1.  Unlike, for example, the weighting factors for
 *          converting RGB to luminance, or more specifically to Y in the
 *          YUV colorspace.  Those numbers come from the
 *          International Telecommunications Union, via ITU-R.
 * </pre>
  }
{ xxxxxxxx }
{static const l_float32 L_RED_WEIGHT =   0.3f; /*!< Percept. weight for red   */ }
{static const l_float32 L_GREEN_WEIGHT = 0.5f; /*!< Percept. weight for green */ }
{static const l_float32 L_BLUE_WEIGHT =  0.2f; /*!< Percept. weight for blue  */ }
{-------------------------------------------------------------------------*
 *                        Flags for colormap conversion                    *
 *------------------------------------------------------------------------- }
{! Cmap Conversion  }
{!< remove colormap for conv to 1 bpp   }
{!< remove colormap for conv to 8 bpp   }
{!< remove colormap for conv to 32 bpp  }
{!< remove colormap and alpha           }
{!< remove depending on src format      }
type
  Txxxxxxxxxx =  Longint;
  Const
    REMOVE_CMAP_TO_BINARY = 0;
    REMOVE_CMAP_TO_GRAYSCALE = 1;
    REMOVE_CMAP_TO_FULL_COLOR = 2;
    REMOVE_CMAP_WITH_ALPHA = 3;
    REMOVE_CMAP_BASED_ON_SRC = 4;

{------------------------------------------------------------------------*
 *!
 * <pre>
 * The following operation bit flags have been modified from
 * Sun's pixrect.h.
 *
 * The 'op' in 'rasterop' is represented by an integer
 * composed with Boolean functions using the set of five integers
 * given below.  The integers, and the op codes resulting from
 * boolean expressions on them, need only be in the range from 0 to 15.
 * The function is applied on a per-pixel basis.
 *
 * Examples: the op code representing ORing the src and dest
 * is computed using the bit OR, as PIX_SRC | PIX_DST;  the op
 * code representing XORing src and dest is found from
 * PIX_SRC ^ PIX_DST;  the op code representing ANDing src and dest
 * is found from PIX_SRC & PIX_DST.  Note that
 * PIX_NOT(PIX_CLR) = PIX_SET, and v.v., as they must be.
 *
 * We use the following set of definitions:
 *
 *      #define   PIX_SRC      0xc
 *      #define   PIX_DST      0xa
 *      #define   PIX_NOT(op)  (op) ^ 0xf
 *      #define   PIX_CLR      0x0
 *      #define   PIX_SET      0xf
 *
 * These definitions differ from Sun's, in that Sun left-shifted
 * each value by 1 pixel, and used the least significant bit as a
 * flag for the "pseudo-operation" of clipping.  We don't need
 * this bit, because it is both efficient and safe ALWAYS to clip
 * the rectangles to the src and dest images, which is what we do.
 * See the notes in rop.h on the general choice of these bit flags.
 *
 * [If for some reason you need compatibility with Sun's xview package,
 * you can adopt the original Sun definitions to avoid redefinition conflicts:
 *
 *      #define   PIX_SRC      (0xc << 1)
 *      #define   PIX_DST      (0xa << 1)
 *      #define   PIX_NOT(op)  ((op) ^ 0x1e)
 *      #define   PIX_CLR      (0x0 << 1)
 *      #define   PIX_SET      (0xf << 1)
 * ]
 *
 * We have, for reference, the following 16 unique op flags:
 *
 *      PIX_CLR                           0000             0x0
 *      PIX_SET                           1111             0xf
 *      PIX_SRC                           1100             0xc
 *      PIX_DST                           1010             0xa
 *      PIX_NOT(PIX_SRC)                  0011             0x3
 *      PIX_NOT(PIX_DST)                  0101             0x5
 *      PIX_SRC | PIX_DST                 1110             0xe
 *      PIX_SRC & PIX_DST                 1000             0x8
 *      PIX_SRC ^ PIX_DST                 0110             0x6
 *      PIX_NOT(PIX_SRC) | PIX_DST        1011             0xb
 *      PIX_NOT(PIX_SRC) & PIX_DST        0010             0x2
 *      PIX_SRC | PIX_NOT(PIX_DST)        1101             0xd
 *      PIX_SRC & PIX_NOT(PIX_DST)        0100             0x4
 *      PIX_NOT(PIX_SRC | PIX_DST)        0001             0x1
 *      PIX_NOT(PIX_SRC & PIX_DST)        0111             0x7
 *      PIX_NOT(PIX_SRC ^ PIX_DST)        1001             0x9
 *
 * </pre>
 *------------------------------------------------------------------------- }
{!< use source pixels       }
  PIX_SRC = $c;  
{!< use destination pixels  }
  PIX_DST = $a;  
{ xxxxxxxxxxxxx #define   PIX_NOT(op)  ((op) ^ 0x0f)          }
{!< clear pixels            }
  PIX_CLR = $0;  
{!< set pixels              }
  PIX_SET = $f;  
{!< paint = src | dst       }
  PIX_PAINT = PIX_SRC or PIX_DST;  
{!< mask = src & dst        }
  PIX_MASK = PIX_SRC and PIX_DST;  
{!< subtract =            }

{ was #define dname def_expr }
function PIX_SUBTRACT : longint; { return type might be wrong }

{!<    src & !dst         }
{ xxxxxxxxxxxxxx #define   PIX_XOR      (PIX_SRC ^ PIX_DST)        /*!< xor = src ^ dst        */ }
{-------------------------------------------------------------------------*
 * <pre>
 *   Important Notes:
 *
 *       (1) The image data is stored in a single contiguous
 *           array of l_uint32, into which the pixels are packed.
 *           By "packed" we mean that there are no unused bits
 *           between pixels, except for end-of-line padding to
 *           satisfy item (2) below.
 *
 *       (2) Every image raster line begins on a 32-bit word
 *           boundary within this array.
 *
 *       (3) Pix image data is stored in 32-bit units, with the
 *           pixels ordered from left to right in the image being
 *           stored in order from the MSB to LSB within the word,
 *           for both big-endian and little-endian machines.
 *           This is the natural ordering for big-endian machines,
 *           as successive bytes are stored and fetched progressively
 *           to the right.  However, for little-endians, when storing
 *           we re-order the bytes from this byte stream order, and
 *           reshuffle again for byte access on 32-bit entities.
 *           So if the bytes come in sequence from left to right, we
 *           store them on little-endians in byte order:
 *                3 2 1 0 7 6 5 4 ...
 *           This MSB to LSB ordering allows left and right shift
 *           operations on 32 bit words to move the pixels properly.
 *
 *       (4) We use 32 bit pixels for both RGB and RGBA color images.
 *           The A (alpha) byte is ignored in most leptonica functions
 *           operating on color images.  Within each 4 byte pixel, the
 *           color samples are ordered from MSB to LSB, as follows:
 *
 *                |  MSB  |  2nd MSB  |  3rd MSB  |  LSB  |
 *                   red      green       blue      alpha
 *                    0         1           2         3   (big-endian)
 *                    3         2           1         0   (little-endian)
 *
 *           Because we use MSB to LSB ordering within the 32-bit word,
 *           the individual 8-bit samples can be accessed with
 *           GET_DATA_BYTE and SET_DATA_BYTE macros, using the
 *           (implicitly big-ending) ordering
 *                 red:    byte 0  (MSB)
 *                 green:  byte 1  (2nd MSB)
 *                 blue:   byte 2  (3rd MSB)
 *                 alpha:  byte 3  (LSB)
 *
 *           The specific color assignment is made in this file,
 *           through the definitions of COLOR_RED, etc.  Then the R, G
 *           B and A sample values can be retrieved using
 *                 redval = GET_DATA_BYTE(&pixel, COLOR_RED);
 *                 greenval = GET_DATA_BYTE(&pixel, COLOR_GREEN);
 *                 blueval = GET_DATA_BYTE(&pixel, COLOR_BLUE);
 *                 alphaval = GET_DATA_BYTE(&pixel, L_ALPHA_CHANNEL);
 *           and they can be set with
 *                 SET_DATA_BYTE(&pixel, COLOR_RED, redval);
 *                 SET_DATA_BYTE(&pixel, COLOR_GREEN, greenval);
 *                 SET_DATA_BYTE(&pixel, COLOR_BLUE, blueval);
 *                 SET_DATA_BYTE(&pixel, L_ALPHA_CHANNEL, alphaval);
 *
 *           More efficiently, these components can be extracted directly
 *           by shifting and masking, explicitly using the values in
 *           L_RED_SHIFT, etc.:
 *                 (pixel32 >> L_RED_SHIFT) & 0xff;         (red)
 *                 (pixel32 >> L_GREEN_SHIFT) & 0xff;       (green)
 *                 (pixel32 >> L_BLUE_SHIFT) & 0xff;        (blue)
 *                 (pixel32 >> L_ALPHA_SHIFT) & 0xff;       (alpha)
 *           The functions extractRGBValues() and extractRGBAValues() are
 *           provided to do this.  Likewise, the pixels can be set
 *           directly by shifting, using composeRGBPixel() and
 *           composeRGBAPixel().
 *
 *           All these operations work properly on both big- and little-endians.
 *
 *       (5) A reference count is held within each pix, giving the
 *           number of ptrs to the pix.  When a pixClone() call
 *           is made, the ref count is increased by 1, and
 *           when a pixDestroy() call is made, the reference count
 *           of the pix is decremented.  The pix is only destroyed
 *           when the reference count goes to zero.
 *
 *       (6) The version numbers (below) are used in the serialization
 *           of these data structures.  They are placed in the files,
 *           and rarely (if ever) change.
 *
 *       (7) The serialization dependencies are as follows:
 *               pixaa  :  pixa  :  boxa
 *               boxaa  :  boxa
 *           So, for example, pixaa and boxaa can be changed without
 *           forcing a change in pixa or boxa.  However, if pixa is
 *           changed, it forces a change in pixaa, and if boxa is
 *           changed, if forces a change in the other three.
 *           We define four version numbers:
 *               PIXAA_VERSION_NUMBER
 *               PIXA_VERSION_NUMBER
 *               BOXAA_VERSION_NUMBER
 *               BOXA_VERSION_NUMBER
 * </pre>
 *------------------------------------------------------------------------- }
{-------------------------------------------------------------------------*
 *                              Array of pix                               *
 *------------------------------------------------------------------------- }
{  Serialization for primary data structures  }
{!< Version for Pixaa serialization  }
const
  PIXAA_VERSION_NUMBER = 2;  
{!< Version for Pixa serialization   }
  PIXA_VERSION_NUMBER = 2;  
{!< Version for Boxa serialization   }
  BOXA_VERSION_NUMBER = 2;  
{!< Version for Boxaa serialization  }
  BOXAA_VERSION_NUMBER = 3;  
{! Array of pix  }
{!< number of Pix in ptr array         }
{!< number of Pix ptrs allocated       }
{!< reference count (1 if no clones)   }
{!< the array of ptrs to pix           }
{!< array of boxes                     }
type
  PPixa = ^TPixa;
  TPixa = record
      n : Tl_int32;
      nalloc : Tl_int32;
      refcount : Tl_uint32;
      pix : ^PPix;
      boxa : PBoxa;
    end;

{! Array of arrays of pix  }
{!< number of Pixa in ptr array        }
{!< number of Pixa ptrs allocated      }
{!< array of ptrs to pixa              }
{!< array of boxes                     }
  PPixaa = ^TPixaa;
  TPixaa = record
      n : Tl_int32;
      nalloc : Tl_int32;
      pixa : ^PPixa;
      boxa : PBoxa;
    end;

{-------------------------------------------------------------------------*
 *                    Basic rectangle and rectangle arrays                 *
 *------------------------------------------------------------------------- }
{! Basic rectangle  }
{!< left coordinate                    }
{!< top coordinate                     }
{!< box width                          }
{!< box height                         }
{!< reference count (1 if no clones)   }
  PBox = ^TBox;
  TBox = record
      x : Tl_int32;
      y : Tl_int32;
      w : Tl_int32;
      h : Tl_int32;
      refcount : Tl_uint32;
    end;

{! Array of Box  }
{!< number of box in ptr array         }
{!< number of box ptrs allocated       }
{!< reference count (1 if no clones)   }
{!< box ptr array                      }
  PBoxa = ^TBoxa;
  TBoxa = record
      n : Tl_int32;
      nalloc : Tl_int32;
      refcount : Tl_uint32;
      box : ^PBox;
    end;

{! Array of Boxa  }
{!< number of boxa in ptr array        }
{!< number of boxa ptrs allocated      }
{!< boxa ptr array                     }
  PBoxaa = ^TBoxaa;
  TBoxaa = record
      n : Tl_int32;
      nalloc : Tl_int32;
      boxa : ^PBoxa;
    end;

{-------------------------------------------------------------------------*
 *                               Array of points                           *
 *------------------------------------------------------------------------- }
{!< Version for Pta serialization      }

const
  PTA_VERSION_NUMBER = 1;  
{! Array of points  }
{!< actual number of pts               }
{!< size of allocated arrays           }
{!< reference count (1 if no clones)   }
{!< arrays of floats                   }
type
  PPta = ^TPta;
  TPta = record
      n : Tl_int32;
      nalloc : Tl_int32;
      refcount : Tl_uint32;
      x : Pl_float32;
      y : Pl_float32;
    end;

{-------------------------------------------------------------------------*
 *                              Array of Pta                               *
 *------------------------------------------------------------------------- }
{! Array of Pta  }
{!< number of pta in ptr array         }
{!< number of pta ptrs allocated       }
{!< pta ptr array                      }
  PPtaa = ^TPtaa;
  TPtaa = record
      n : Tl_int32;
      nalloc : Tl_int32;
      pta : ^PPta;
    end;

{-------------------------------------------------------------------------*
 *                       Pix accumulator container                         *
 *------------------------------------------------------------------------- }
{! Pix accumulator container  }
{!< array width                        }
{!< array height                       }
{!< used to allow negative             }
{!< intermediate results               }
{!< the 32 bit accumulator pix         }
  PPixacc = ^TPixacc;
  TPixacc = record
      w : Tl_int32;
      h : Tl_int32;
      offset : Tl_int32;
      pix : PPix;
    end;

{-------------------------------------------------------------------------*
 *                              Pix tiling                                 *
 *------------------------------------------------------------------------- }
{! Pix tiling  }
{!< input pix (a clone)                }
{!< number of tiles horizontally       }
{!< number of tiles vertically         }
{!< tile width                         }
{!< tile height                        }
{!< overlap on left and right          }
{!< overlap on top and bottom          }
{!< strip for paint; default is TRUE   }
  PPixTiling = ^TPixTiling;
  TPixTiling = record
      pix : PPix;
      nx : Tl_int32;
      ny : Tl_int32;
      w : Tl_int32;
      h : Tl_int32;
      xoverlap : Tl_int32;
      yoverlap : Tl_int32;
      strip : Tl_int32;
    end;

{-------------------------------------------------------------------------*
 *                       FPix: pix with float array                        *
 *------------------------------------------------------------------------- }
{!< Version for FPix serialization     }

const
  FPIX_VERSION_NUMBER = 2;  
{! Pix with float array  }
{!< width in pixels                    }
{!< height in pixels                   }
{!< 32-bit words/line                  }
{!< reference count (1 if no clones)   }
{!< image res (ppi) in x direction     }
{!< (use 0 if unknown)                 }
{!< image res (ppi) in y direction     }
{!< (use 0 if unknown)                 }
{!< the float image data               }
type
  PFPix = ^TFPix;
  TFPix = record
      w : Tl_int32;
      h : Tl_int32;
      wpl : Tl_int32;
      refcount : Tl_uint32;
      xres : Tl_int32;
      yres : Tl_int32;
      data : Pl_float32;
    end;

{! Array of FPix  }
{!< number of fpix in ptr array        }
{!< number of fpix ptrs allocated      }
{!< reference count (1 if no clones)   }
{!< the array of ptrs to fpix          }
  PFPixa = ^TFPixa;
  TFPixa = record
      n : Tl_int32;
      nalloc : Tl_int32;
      refcount : Tl_uint32;
      fpix : ^PFPix;
    end;

{-------------------------------------------------------------------------*
 *                       DPix: pix with double array                       *
 *------------------------------------------------------------------------- }
{!< Version for DPix serialization     }

const
  DPIX_VERSION_NUMBER = 2;  
{! Pix with double array  }
{!< width in pixels                    }
{!< height in pixels                   }
{!< 32-bit words/line                  }
{!< reference count (1 if no clones)   }
{!< image res (ppi) in x direction     }
{!< (use 0 if unknown)                 }
{!< image res (ppi) in y direction     }
{!< (use 0 if unknown)                 }
{!< the double image data              }
type
  PDPix = ^TDPix;
  TDPix = record
      w : Tl_int32;
      h : Tl_int32;
      wpl : Tl_int32;
      refcount : Tl_uint32;
      xres : Tl_int32;
      yres : Tl_int32;
      data : Pl_float64;
    end;

{-------------------------------------------------------------------------*
 *                        PixComp: compressed pix                          *
 *------------------------------------------------------------------------- }
{! Compressed Pix  }
{!< width in pixels                    }
{!< height in pixels                   }
{!< depth in bits                      }
{!< image res (ppi) in x direction     }
{!<   (use 0 if unknown)               }
{!< image res (ppi) in y direction     }
{!<   (use 0 if unknown)               }
{!< compressed format (IFF_TIFF_G4,    }
{!<   IFF_PNG, IFF_JFIF_JPEG)          }
{!< text string associated with pix    }
{!< flag (1 for cmap, 0 otherwise)     }
{!< the compressed image data          }
{!< size of the data array             }
  PPixComp = ^TPixComp;
  TPixComp = record
      w : Tl_int32;
      h : Tl_int32;
      d : Tl_int32;
      xres : Tl_int32;
      yres : Tl_int32;
      comptype : Tl_int32;
      text : Pchar;
      cmapflag : Tl_int32;
      data : Pl_uint8;
      size : Tsize_t;
    end;

  TPixComp = TPIXC;
{-------------------------------------------------------------------------*
 *                     PixaComp: array of compressed pix                   *
 *------------------------------------------------------------------------- }
{!< Version for PixaComp serialization  }

const
  PIXACOMP_VERSION_NUMBER = 2;  
{! Array of compressed pix  }
{!< number of PixComp in ptr array     }
{!< number of PixComp ptrs allocated   }
{!< indexing offset into ptr array     }
{!< the array of ptrs to PixComp       }
{!< array of boxes                     }
type
  PPixaComp = ^TPixaComp;
  TPixaComp = record
      n : Tl_int32;
      nalloc : Tl_int32;
      offset : Tl_int32;
      pixc : ^PPixComp;
      boxa : PBoxa;
    end;

  TPixaComp = TPIXAC;
{-------------------------------------------------------------------------*
 *                         Access and storage flags                        *
 *------------------------------------------------------------------------- }
{
 * <pre>
 *  For Pix, Box, Pta and Numa, there are 3 standard methods for handling
 *  the retrieval or insertion of a struct:
 *     (1) direct insertion (Don't do this if there is another handle
 *                           somewhere to this same struct!)
 *     (2) copy (Always safe, sets up a refcount of 1 on the new object.
 *               Can be undesirable if very large, such as an image or
 *               an array of images.)
 *     (3) clone (Makes another handle to the same struct, and bumps the
 *                refcount up by 1.  OK to use except in two situations:
 *                (a) You change data through one of the handles but don't
 *                    want those changes to be seen by the other handle.
 *                (b) The application is multi-threaded.  Because the clone
 *                    operation is not atomic (e.g., locked with a mutex),
 *                    it is possible to end up with an incorrect ref count,
 *                    causing either a memory leak or a crash.
 *
 *  For Pixa and Boxa, which are structs that hold an array of clonable
 *  structs, there is an additional method:
 *     (4) copy-clone (Makes a new higher-level struct with a refcount
 *                     of 1, but clones all the structs in the array.)
 *
 *  Unlike the other structs, when retrieving a string from an Sarray,
 *  you are allowed to get a handle without a copy or clone (i.e., the
 *  string is not owned by the handle).  You must not either free the string
 *  or insert it in some other struct that would own it.  Specifically,
 *  for an Sarray, the copyflag for retrieval is either:
 *         L_COPY or L_NOCOPY
 *  and for insertion, the copyflag is either:
 *         L_COPY or one of L_INSERT , L_NOCOPY (the latter are equivalent
 *                                                 for insertion))
 *  Typical patterns are:
 *  (1) Reference a string in an Sarray with L_NOCOPY and insert a copy
 *      of it in another Sarray with L_COPY.
 *  (2) Copy a string from an Sarray with L_COPY and insert it in
 *      another Sarray with L_INSERT (or L_NOCOPY).
 *  In both cases, a copy is made and both Sarrays own their instance
 *  of that string.
 * </pre>
  }
{! Object Access  }
{!< do not copy the object; do not delete the ptr   }
{!< stuff it in; do not copy or clone         }
{!< make/use a copy of the object                   }
{!< make/use clone (ref count) of the object        }
{!< make a new array object (e.g., pixa) and fill   }
{!< the array with clones (e.g., pix)               }
  Txxxxxxxxxx =  Longint;
  Const
    L_NOCOPY = 0;
    L_INSERT = L_NOCOPY;
    L_COPY = 1;
    L_CLONE = 2;
    L_COPY_CLONE = 3;

{----------------------------------------------------------------------------*
 *                              Sort flags                                    *
 *---------------------------------------------------------------------------- }
{! Sort Mode  }
{!< use shell sort                         }
{!< use bin sort                           }
type
  Txxxxxxxxxx =  Longint;
  Const
    L_SHELL_SORT = 1;
    L_BIN_SORT = 2;

{! Sort Order  }
{!< sort in increasing order               }
{!< sort in decreasing order               }
type
  Txxxxxxxxxx =  Longint;
  Const
    L_SORT_INCREASING = 1;
    L_SORT_DECREASING = 2;

{! Sort Type  }
{!< sort box or c.c. by left edge location   }
{!< sort box or c.c. by top edge location    }
{!< sort box or c.c. by right edge location  }
{!< sort box or c.c. by bot edge location    }
{!< sort box or c.c. by width                }
{!< sort box or c.c. by height               }
{!< sort box or c.c. by min dimension        }
{!< sort box or c.c. by max dimension        }
{!< sort box or c.c. by perimeter            }
{!< sort box or c.c. by area                 }
{!< sort box or c.c. by width/height ratio   }
type
  Txxxxxxxxxx =  Longint;
  Const
    L_SORT_BY_X = 1;
    L_SORT_BY_Y = 2;
    L_SORT_BY_RIGHT = 3;
    L_SORT_BY_BOT = 4;
    L_SORT_BY_WIDTH = 5;
    L_SORT_BY_HEIGHT = 6;
    L_SORT_BY_MIN_DIMENSION = 7;
    L_SORT_BY_MAX_DIMENSION = 8;
    L_SORT_BY_PERIMETER = 9;
    L_SORT_BY_AREA = 10;
    L_SORT_BY_ASPECT_RATIO = 11;

{---------------------------------------------------------------------------*
 *                             Blend flags                                   *
 *--------------------------------------------------------------------------- }
{! Blend Types  }
{!< add some of src inverse to itself      }
{!< shift src colors towards white         }
{!< shift src colors towards black         }
{!< blend src directly with blender        }
{!< add amount of src inverse to itself,   }
{!< based on blender pix value             }
type
  Txxxxxxxxxx =  Longint;
  Const
    L_BLEND_WITH_INVERSE = 1;
    L_BLEND_TO_WHITE = 2;
    L_BLEND_TO_BLACK = 3;
    L_BLEND_GRAY = 4;
    L_BLEND_GRAY_WITH_INVERSE = 5;

{! Paint Selection  }
{!< colorize non-black pixels              }
{!< colorize non-white pixels              }
type
  Txxxxxxxxxx =  Longint;
  Const
    L_PAINT_LIGHT = 1;
    L_PAINT_DARK = 2;

{-------------------------------------------------------------------------*
 *                        Graphics pixel setting                           *
 *------------------------------------------------------------------------- }
{! Pixel Setting  }
{!< set all bits in each pixel to 1        }
{!< set all bits in each pixel to 0        }
{!< flip all bits in each pixel            }
type
  Txxxxxxxxxx =  Longint;
  Const
    L_SET_PIXELS = 1;
    L_CLEAR_PIXELS = 2;
    L_FLIP_PIXELS = 3;

{-------------------------------------------------------------------------*
 *                     Size and location filter flags                      *
 *------------------------------------------------------------------------- }
{! Size Comparison  }
{!< save if value is less than threshold   }
{!< save if value is more than threshold   }
{!< save if value is <= to the threshold   }
{!< save if value is >= to the threshold   }
type
  Txxxxxxxxxx =  Longint;
  Const
    L_SELECT_IF_LT = 1;
    L_SELECT_IF_GT = 2;
    L_SELECT_IF_LTE = 3;
    L_SELECT_IF_GTE = 4;

{! Size Selection  }
{!< select by width; 1 bpp             }
{!< select by height; 1 bpp            }
{!< select by max of width and         }
{!< height; 1 bpp                      }
{!< select by foreground area; 1 bpp   }
{!< select by perimeter; 1 bpp         }
type
  Txxxxxxxxxx =  Longint;
  Const
    L_SELECT_BY_WIDTH = 1;
    L_SELECT_BY_HEIGHT = 2;
    L_SELECT_BY_MAX_DIMENSION = 3;
    L_SELECT_BY_AREA = 4;
    L_SELECT_BY_PERIMETER = 5;

{! Location Filter  }
{!< width must satisfy constraint          }
{!< height must satisfy constraint         }
{!< x value must satisfy constraint        }
{!< y value must satisfy constraint        }
{!< either width or height (or xval        }
{!< or yval) can satisfy constraint        }
{!< both width and height (or xval         }
{!< and yval must satisfy constraint       }
type
  Txxxxxxxxxx =  Longint;
  Const
    L_SELECT_WIDTH = 1;
    L_SELECT_HEIGHT = 2;
    L_SELECT_XVAL = 3;
    L_SELECT_YVAL = 4;
    L_SELECT_IF_EITHER = 5;
    L_SELECT_IF_BOTH = 6;

{! Boxa Check  }
{!< check and possibly modify width        }
{!< check and possibly modify height       }
{!< check and possibly modify both         }
type
  Txxxxxxxxxx =  Longint;
  Const
    L_CHECK_WIDTH = 1;
    L_CHECK_HEIGHT = 2;
    L_CHECK_BOTH = 3;

{-------------------------------------------------------------------------*
 *                    Color component selection flags                      *
 *------------------------------------------------------------------------- }
{! Color Selection  }
{!< use red component                      }
{!< use green component                    }
{!< use blue component                     }
{!< use min color component                }
{!< use max color component                }
{!< use average of color components        }
{!< use hue value (in HSV color space)     }
{!< use saturation value (in HSV space)    }
{!< use weighted average of color comps    }
type
  Txxxxxxxxxx =  Longint;
  Const
    L_SELECT_RED = 1;
    L_SELECT_GREEN = 2;
    L_SELECT_BLUE = 3;
    L_SELECT_MIN = 4;
    L_SELECT_MAX = 5;
    L_SELECT_AVERAGE = 6;
    L_SELECT_HUE = 7;
    L_SELECT_SATURATION = 8;
    L_SELECT_WEIGHTED = 9;

{-------------------------------------------------------------------------*
 *                          Color content flags                            *
 *------------------------------------------------------------------------- }
{! Color Content  }
{!< intermediate of diff component values  }
{!< diff average closest comps to third    }
{!< maximum diff of component values       }
type
  Txxxxxxxxxx =  Longint;
  Const
    L_INTERMED_DIFF = 1;
    L_AVE_MAX_DIFF_2 = 2;
    L_MAX_DIFF = 3;

{-------------------------------------------------------------------------*
 *                         16-bit conversion flags                         *
 *------------------------------------------------------------------------- }
{! 16-bit Conversion  }
{!< use LSB                                }
{!< use MSB                                }
{!< use LSB if max(val) < 256; else MSB    }
{!< use max(val, 255)                      }
{!< use two LSB                            }
{!< use two MSB                            }
{!< use max(val, 65535)                    }
type
  Txxxxxxxxxx =  Longint;
  Const
    L_LS_BYTE = 1;
    L_MS_BYTE = 2;
    L_AUTO_BYTE = 3;
    L_CLIP_TO_FF = 4;
    L_LS_TWO_BYTES = 5;
    L_MS_TWO_BYTES = 6;
    L_CLIP_TO_FFFF = 7;

{-------------------------------------------------------------------------*
 *                        Rotate and shear flags                           *
 *------------------------------------------------------------------------- }
{! Rotation Type  }
{!< use area map rotation, if possible      }
{!< use shear rotation                      }
{!< use sampling                            }
type
  Txxxxxxxxxx =  Longint;
  Const
    L_ROTATE_AREA_MAP = 1;
    L_ROTATE_SHEAR = 2;
    L_ROTATE_SAMPLING = 3;

{! Background Color  }
{!< bring in white pixels from the outside  }
{!< bring in black pixels from the outside  }
type
  Txxxxxxxxxx =  Longint;
  Const
    L_BRING_IN_WHITE = 1;
    L_BRING_IN_BLACK = 2;

{! Shear Point  }
{!< shear image about UL corner             }
{!< shear image about center                }
type
  Txxxxxxxxxx =  Longint;
  Const
    L_SHEAR_ABOUT_CORNER = 1;
    L_SHEAR_ABOUT_CENTER = 2;

{-------------------------------------------------------------------------*
 *                     Affine transform order flags                        *
 *------------------------------------------------------------------------- }
{! Affine Transform Order  }
{!< translate, scale, rotate                }
{!< scale, rotate, translate                }
{!< rotate, translate, scale                }
{!< translate, rotate, scale                }
{!< rotate, scale, translate                }
{!< scale, translate, rotate                }
type
  Txxxxxxxxxx =  Longint;
  Const
    L_TR_SC_RO = 1;
    L_SC_RO_TR = 2;
    L_RO_TR_SC = 3;
    L_TR_RO_SC = 4;
    L_RO_SC_TR = 5;
    L_SC_TR_RO = 6;

{-------------------------------------------------------------------------*
 *                       Grayscale filling flags                           *
 *------------------------------------------------------------------------- }
{! Grayscale Fill  }
{!< fill white pixels (e.g, in fg map)       }
{!< fill black pixels (e.g., in bg map)      }
type
  Txxxxxxxxxx =  Longint;
  Const
    L_FILL_WHITE = 1;
    L_FILL_BLACK = 2;

{-------------------------------------------------------------------------*
 *                   Flags for setting to white or black                   *
 *------------------------------------------------------------------------- }
{! BlackWhite Set  }
{!< set pixels to white                       }
{!< set pixels to black                       }
type
  Txxxxxxxxxx =  Longint;
  Const
    L_SET_WHITE = 1;
    L_SET_BLACK = 2;

{-------------------------------------------------------------------------*
 *                  Flags for getting white or black value                 *
 *------------------------------------------------------------------------- }
{! BlackWhite Get  }
{!< get white pixel value                     }
{!< get black pixel value                     }
type
  Txxxxxxxxxx =  Longint;
  Const
    L_GET_WHITE_VAL = 1;
    L_GET_BLACK_VAL = 2;

{-------------------------------------------------------------------------*
 *                  Flags for 8 bit and 16 bit pixel sums                  *
 *------------------------------------------------------------------------- }
{! BlackWhite Sum  }
{!< white pixels are 0xff or 0xffff; black are 0   }
{!< black pixels are 0xff or 0xffff; white are 0   }
type
  Txxxxxxxxxx =  Longint;
  Const
    L_WHITE_IS_MAX = 1;
    L_BLACK_IS_MAX = 2;

{-------------------------------------------------------------------------*
 *                           Dither parameters                             *
 *         If within this grayscale distance from black or white,          *
 *         do not propagate excess or deficit to neighboring pixels.       *
 *------------------------------------------------------------------------- }
{! Dither Distance  }
{!< dist to black with no prop; 1 bpp       }
{!< dist to black with no prop; 1 bpp       }
{!< dist to black with no prop; 2 bpp       }
{!< dist to black with no prop; 2 bpp       }
type
  Txxxxxxxxxx =  Longint;
  Const
    DEFAULT_CLIP_LOWER_1 = 10;
    DEFAULT_CLIP_UPPER_1 = 10;
    DEFAULT_CLIP_LOWER_2 = 5;
    DEFAULT_CLIP_UPPER_2 = 5;

{-------------------------------------------------------------------------*
 *                          Distance type flags                            *
 *------------------------------------------------------------------------- }
{! Distance Type  }
{!< L1 distance (e.g., in color space)      }
{!< L2 distance                             }
type
  Txxxxxxxxxx =  Longint;
  Const
    L_MANHATTAN_DISTANCE = 1;
    L_EUCLIDEAN_DISTANCE = 2;

{-------------------------------------------------------------------------*
 *                         Distance Value flags                            *
 *------------------------------------------------------------------------- }
{! Distance Value  }
{!< values < 0                                    }
{!< values >= 0                                   }
{!< values > 0                                    }
{!< values <= 0                                   }
{!< values = 0                                    }
{!< all values                                    }
type
  Txxxxxxxxxx =  Longint;
  Const
    L_NEGATIVE = 1;
    L_NON_NEGATIVE = 2;
    L_POSITIVE = 3;
    L_NON_POSITIVE = 4;
    L_ZERO = 5;
    L_ALL = 6;

{-------------------------------------------------------------------------*
 *                         Statistical measures                            *
 *------------------------------------------------------------------------- }
{! Stats Type  }
{!< average of abs values                   }
{!< median value of set                     }
{!< mode value of set                       }
{!< mode count of set                       }
{!< rms of values                           }
{!< standard deviation from mean            }
{!< variance of values                      }
type
  Txxxxxxxxxx =  Longint;
  Const
    L_MEAN_ABSVAL = 1;
    L_MEDIAN_VAL = 2;
    L_MODE_VAL = 3;
    L_MODE_COUNT = 4;
    L_ROOT_MEAN_SQUARE = 5;
    L_STANDARD_DEVIATION = 6;
    L_VARIANCE = 7;

{-------------------------------------------------------------------------*
 *                       Set index selection flags                         *
 *------------------------------------------------------------------------- }
{! Index Selection  }
{!< select 'n' consecutive                  }
{!< select at intervals of 'n'              }
type
  Txxxxxxxxxx =  Longint;
  Const
    L_CHOOSE_CONSECUTIVE = 1;
    L_CHOOSE_SKIP_BY = 2;

{-------------------------------------------------------------------------*
 *                         Text orientation flags                          *
 *------------------------------------------------------------------------- }
{! Text Orientation  }
{!< low confidence on text orientation      }
{!< portrait, text rightside-up             }
{!< landscape, text up to left              }
{!< portrait, text upside-down              }
{!< landscape, text up to right             }
type
  Txxxxxxxxxx =  Longint;
  Const
    L_TEXT_ORIENT_UNKNOWN = 0;
    L_TEXT_ORIENT_UP = 1;
    L_TEXT_ORIENT_LEFT = 2;
    L_TEXT_ORIENT_DOWN = 3;
    L_TEXT_ORIENT_RIGHT = 4;

{-------------------------------------------------------------------------*
 *                         Edge orientation flags                          *
 *------------------------------------------------------------------------- }
{! Edge Orientation  }
{!< filters for horizontal edges             }
{!< filters for vertical edges               }
{!< filters for all edges                    }
type
  Txxxxxxxxxx =  Longint;
  Const
    L_HORIZONTAL_EDGES = 0;
    L_VERTICAL_EDGES = 1;
    L_ALL_EDGES = 2;

{-------------------------------------------------------------------------*
 *                         Line orientation flags                          *
 *------------------------------------------------------------------------- }
{! Line Orientation  }
{!< horizontal line                           }
{!< 45 degree line with positive slope        }
{!< vertical line                             }
{!< 45 degree line with negative slope        }
{!< neither horizontal nor vertical  }
type
  Txxxxxxxxxx =  Longint;
  Const
    L_HORIZONTAL_LINE = 0;
    L_POS_SLOPE_LINE = 1;
    L_VERTICAL_LINE = 2;
    L_NEG_SLOPE_LINE = 3;
    L_OBLIQUE_LINE = 4;

{-------------------------------------------------------------------------*
 *                         Image orientation flags                         *
 *------------------------------------------------------------------------- }
{! Image Orientation  }
{!< typical: page is viewed with height > width   }
{!< page is viewed at 90 deg to portrait mode     }
type
  Txxxxxxxxxx =  Longint;
  Const
    L_PORTRAIT_MODE = 0;
    L_LANDSCAPE_MODE = 1;

{-------------------------------------------------------------------------*
 *                           Scan direction flags                          *
 *------------------------------------------------------------------------- }
{! Scan Direction  }
{!< scan from left                            }
{!< scan from right                           }
{!< scan from top                             }
{!< scan from bottom                          }
{!< scan in negative direction                }
{!< scan in positive direction                }
{!< scan in both directions                   }
{!< horizontal scan (direction unimportant)   }
{!< vertical scan (direction unimportant)     }
type
  Txxxxxxxxxx =  Longint;
  Const
    L_FROM_LEFT = 0;
    L_FROM_RIGHT = 1;
    L_FROM_TOP = 2;
    L_FROM_BOT = 3;
    L_SCAN_NEGATIVE = 4;
    L_SCAN_POSITIVE = 5;
    L_SCAN_BOTH = 6;
    L_SCAN_HORIZONTAL = 7;
    L_SCAN_VERTICAL = 8;

{-------------------------------------------------------------------------*
 *                Box size adjustment and location flags                   *
 *------------------------------------------------------------------------- }
{! Box Adjustment  }
{!< do not adjust                         }
{!< adjust left edge                      }
{!< adjust right edge                     }
{!< adjust both left and right edges      }
{!< adjust top edge                       }
{!< adjust bottom edge                    }
{!< adjust both top and bottom edges      }
{!< choose the min median value           }
{!< choose the max median value           }
{!< set left side to a given value        }
{!< set right side to a given value       }
{!< set top side to a given value         }
{!< set bottom side to a given value      }
{!< get left side location                }
{!< get right side location               }
{!< get top side location                 }
{!< get bottom side location              }
type
  Txxxxxxxxxx =  Longint;
  Const
    L_ADJUST_SKIP = 0;
    L_ADJUST_LEFT = 1;
    L_ADJUST_RIGHT = 2;
    L_ADJUST_LEFT_AND_RIGHT = 3;
    L_ADJUST_TOP = 4;
    L_ADJUST_BOT = 5;
    L_ADJUST_TOP_AND_BOT = 6;
    L_ADJUST_CHOOSE_MIN = 7;
    L_ADJUST_CHOOSE_MAX = 8;
    L_SET_LEFT = 9;
    L_SET_RIGHT = 10;
    L_SET_TOP = 11;
    L_SET_BOT = 12;
    L_GET_LEFT = 13;
    L_GET_RIGHT = 14;
    L_GET_TOP = 15;
    L_GET_BOT = 16;

{-------------------------------------------------------------------------*
 *          Flags for modifying box boundaries using a second box          *
 *------------------------------------------------------------------------- }
{! Box Boundary Mod  }
{!< use boundaries giving min size        }
{!< use boundaries giving max size        }
{!< modify boundary if big location diff  }
{!< modify boundary if big size diff      }
{!< modify boundary with capped min       }
{!< modify boundary with capped max       }
type
  Txxxxxxxxxx =  Longint;
  Const
    L_USE_MINSIZE = 1;
    L_USE_MAXSIZE = 2;
    L_SUB_ON_LOC_DIFF = 3;
    L_SUB_ON_SIZE_DIFF = 4;
    L_USE_CAPPED_MIN = 5;
    L_USE_CAPPED_MAX = 6;

{-------------------------------------------------------------------------*
 *              Handling overlapping bounding boxes in boxa                *
 *------------------------------------------------------------------------- }
{! Box Overlap Mod  }
{!< resize to bounding region; remove smaller   }
{!< only remove smaller                         }
type
  Txxxxxxxxxx =  Longint;
  Const
    L_COMBINE = 1;
    L_REMOVE_SMALL = 2;

{-------------------------------------------------------------------------*
 *        Selecting or making a box from two (intersecting) boxes          *
 *------------------------------------------------------------------------- }
{! Box Combine or Select  }
{!< use union of two boxes              }
{!< use intersection of two boxes       }
{!< use box with largest area           }
{!< use box with smallest area          }
type
  Txxxxxxxxxx =  Longint;
  Const
    L_GEOMETRIC_UNION = 1;
    L_GEOMETRIC_INTERSECTION = 2;
    L_LARGEST_AREA = 3;
    L_SMALLEST_AREA = 4;

{-------------------------------------------------------------------------*
 *                    Flags for replacing invalid boxes                    *
 *------------------------------------------------------------------------- }
{! Box Replacement  }
{!< consider all boxes in the sequence    }
{!< consider boxes with the same parity   }
type
  Txxxxxxxxxx =  Longint;
  Const
    L_USE_ALL_BOXES = 1;
    L_USE_SAME_PARITY_BOXES = 2;

{-------------------------------------------------------------------------*
 *                    Flags for box corners and center                     *
 *------------------------------------------------------------------------- }
{! Box Corners and Center  }
{!< UL corner                                }
{!< UR corner                                }
{!< LL corner                                }
{!< LR corner                                }
{!< center                                   }
type
  Txxxxxxxxxx =  Longint;
  Const
    L_UPPER_LEFT = 1;
    L_UPPER_RIGHT = 2;
    L_LOWER_LEFT = 3;
    L_LOWER_RIGHT = 4;
    L_BOX_CENTER = 5;

{-------------------------------------------------------------------------*
 *                            Horizontal warp                              *
 *------------------------------------------------------------------------- }
{! Horiz Warp Stretch  }
{!< increasing stretch or contraction to left   }
{!< increasing stretch or contraction to right  }
type
  Txxxxxxxxxx =  Longint;
  Const
    L_WARP_TO_LEFT = 1;
    L_WARP_TO_RIGHT = 2;

{! Horiz Warp Mode  }
{!< stretch or contraction grows linearly       }
{!< stretch or contraction grows quadratically  }
type
  Txxxxxxxxxx =  Longint;
  Const
    L_LINEAR_WARP = 1;
    L_QUADRATIC_WARP = 2;

{-------------------------------------------------------------------------*
 *                      Pixel selection for resampling                     *
 *------------------------------------------------------------------------- }
{! Pixel Selection  }
{!< linear interpolation from src pixels        }
{!< nearest src pixel sampling only             }
type
  Txxxxxxxxxx =  Longint;
  Const
    L_INTERPOLATED = 1;
    L_SAMPLED = 2;

{-------------------------------------------------------------------------*
 *                             Thinning flags                              *
 *------------------------------------------------------------------------- }
{! Thinning Polarity  }
{!< thin foreground of 1 bpp image          }
{!< thin background of 1 bpp image          }
type
  Txxxxxxxxxx =  Longint;
  Const
    L_THIN_FG = 1;
    L_THIN_BG = 2;

{-------------------------------------------------------------------------*
 *                            Runlength flags                              *
 *------------------------------------------------------------------------- }
{! Runlength Direction  }
{!< determine runlengths of horizontal runs   }
{!< determine runlengths of vertical runs     }
type
  Txxxxxxxxxx =  Longint;
  Const
    L_HORIZONTAL_RUNS = 0;
    L_VERTICAL_RUNS = 1;

{-------------------------------------------------------------------------*
 *                          Edge filter flags                              *
 *------------------------------------------------------------------------- }
{! Edge Filter  }
{!< Sobel edge filter                         }
{!< Two-sided edge filter                     }
type
  Txxxxxxxxxx =  Longint;
  Const
    L_SOBEL_EDGE = 1;
    L_TWO_SIDED_EDGE = 2;

{-------------------------------------------------------------------------*
 *             Subpixel color component ordering in LCD display            *
 *------------------------------------------------------------------------- }
{! Subpixel Color Order  }
{!< sensor order left-to-right RGB         }
{!< sensor order left-to-right BGR         }
{!< sensor order top-to-bottom RGB         }
{!< sensor order top-to-bottom BGR         }
type
  Txxxxxxxxxx =  Longint;
  Const
    L_SUBPIXEL_ORDER_RGB = 1;
    L_SUBPIXEL_ORDER_BGR = 2;
    L_SUBPIXEL_ORDER_VRGB = 3;
    L_SUBPIXEL_ORDER_VBGR = 4;

{-------------------------------------------------------------------------*
 *                          HSV histogram flags                            *
 *------------------------------------------------------------------------- }
{! HSV Histogram  }
{!< Use hue-saturation histogram            }
{!< Use hue-value histogram                 }
{!< Use saturation-value histogram          }
type
  Txxxxxxxxxx =  Longint;
  Const
    L_HS_HISTO = 1;
    L_HV_HISTO = 2;
    L_SV_HISTO = 3;

{-------------------------------------------------------------------------*
 *                HSV Region flags (inclusion, exclusion)                  *
 *------------------------------------------------------------------------- }
{! HSV Region  }
{!< Use pixels with specified HSV region    }
{!< Use pixels outside HSV region           }
type
  Txxxxxxxxxx =  Longint;
  Const
    L_INCLUDE_REGION = 1;
    L_EXCLUDE_REGION = 2;

{-------------------------------------------------------------------------*
 *                Location flags for adding text to a pix                  *
 *------------------------------------------------------------------------- }
{! Add Text Location  }
{!< Add text above the image                }
{!< Add text below the image                }
{!< Add text to the left of the image       }
{!< Add text to the right of the image      }
{!< Add text over the top of the image      }
{!< Add text over the bottom of the image   }
{!< Add text over left side of the image    }
{!< Add text over right side of the image   }
type
  Txxxxxxxxxx =  Longint;
  Const
    L_ADD_ABOVE = 1;
    L_ADD_BELOW = 2;
    L_ADD_LEFT = 3;
    L_ADD_RIGHT = 4;
    L_ADD_AT_TOP = 5;
    L_ADD_AT_BOT = 6;
    L_ADD_AT_LEFT = 7;
    L_ADD_AT_RIGHT = 8;

{-------------------------------------------------------------------------*
 *                       Flags for plotting on a pix                       *
 *------------------------------------------------------------------------- }
{! Pix Plot  }
{!< Plot horizontally at top                }
{!< Plot horizontally at middle             }
{!< Plot horizontally at bottom             }
{!< Plot vertically at left                 }
{!< Plot vertically at middle               }
{!< Plot vertically at right                }
type
  Txxxxxxxxxx =  Longint;
  Const
    L_PLOT_AT_TOP = 1;
    L_PLOT_AT_MID_HORIZ = 2;
    L_PLOT_AT_BOT = 3;
    L_PLOT_AT_LEFT = 4;
    L_PLOT_AT_MID_VERT = 5;
    L_PLOT_AT_RIGHT = 6;

{-------------------------------------------------------------------------*
 *                    Flags for making simple masks                        *
 *------------------------------------------------------------------------- }
{! Mask Generation  }
{!< Select the interior part                }
{!< Select the outer part (e.g., a frame)   }
type
  Txxxxxxxxxx =  Longint;
  Const
    L_USE_INNER = 1;
    L_USE_OUTER = 2;

{-------------------------------------------------------------------------*
 *                   Flags for selecting display program                   *
 *------------------------------------------------------------------------- }
{! Display Program  }
{!< Use xzgv with pixDisplay()               }
{!< Use xli with pixDisplay()                }
{!< Use xv with pixDisplay()                 }
{!< Use irfvanview (win) with pixDisplay()   }
{!< Use open (apple) with pixDisplay()       }
type
  Txxxxxxxxxx =  Longint;
  Const
    L_DISPLAY_WITH_XZGV = 1;
    L_DISPLAY_WITH_XLI = 2;
    L_DISPLAY_WITH_XV = 3;
    L_DISPLAY_WITH_IV = 4;
    L_DISPLAY_WITH_OPEN = 5;

{-------------------------------------------------------------------------*
 *    Flag(s) used in the 'special' pix field for non-default operations   *
 *      - 0 is default for chroma sampling in jpeg                         *
 *      - 10-19 are used for zlib compression in png write                 *
 *      - 4 and 8 are used for specifying connectivity in labelling        *
 *------------------------------------------------------------------------- }
{! Flags used in Pix::special  }
{!< Write full resolution chroma       }
type
  Txxxxxxxxxx =  Longint;
  Const
    L_NO_CHROMA_SAMPLING_JPEG = 1;

{-------------------------------------------------------------------------*
 *          Handling negative values in conversion to unsigned int         *
 *------------------------------------------------------------------------- }
{! Negative Value  }
{!< Clip negative values to 0                 }
{!< Convert to positive using L_ABS()         }
type
  Txxxxxxxxxx =  Longint;
  Const
    L_CLIP_TO_ZERO = 1;
    L_TAKE_ABSVAL = 2;

{-------------------------------------------------------------------------*
 *                        Relative to zero flags                           *
 *------------------------------------------------------------------------- }
{! Relative To Zero  }
{!< Choose values less than zero              }
{!< Choose values equal to zero               }
{!< Choose values greater than zero           }
type
  Txxxxxxxxxx =  Longint;
  Const
    L_LESS_THAN_ZERO = 1;
    L_EQUAL_TO_ZERO = 2;
    L_GREATER_THAN_ZERO = 3;

{-------------------------------------------------------------------------*
 *         Flags for adding or removing trailing slash from string         *
 *------------------------------------------------------------------------- }
{! Trailing Slash  }
{!< Add trailing slash to string            }
{!< Remove trailing slash from string       }
type
  Txxxxxxxxxx =  Longint;
  Const
    L_ADD_TRAIL_SLASH = 1;
    L_REMOVE_TRAIL_SLASH = 2;

{-------------------------------------------------------------------------*
 *               Pix allocator and deallocator function types              *
 *------------------------------------------------------------------------- }
{! Allocator function type  }
type
  Palloc_fn = ^Talloc_fn;
  Talloc_fn = function (para1:Tsize_t):pointer;cdecl;
{! Deallocator function type  }

  Tdealloc_fn = procedure (para1:pointer);cdecl;
{$endif}
{ LEPTONICA_PIX_H  }

implementation

{ was #define dname def_expr }
function PIX_SUBTRACT : longint; { return type might be wrong }
  begin
    PIX_SUBTRACT:=PIX_DST and (PIX_NOT(PIX_SRC));
  end;


end.
