
unit types;
interface

{
  Automatically converted by H2Pas 1.0.0 from types.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    types.h
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
PJxlBoxType  = ^JxlBoxType;
PJxlDataType  = ^JxlDataType;
PJxlEndianness  = ^JxlEndianness;
PJxlPixelFormat  = ^JxlPixelFormat;
PJxlProgressiveDetail  = ^JxlProgressiveDetail;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Copyright (c) the JPEG XL Project Authors. All rights reserved.
 *
 * Use of this source code is governed by a BSD-style
 * license that can be found in the LICENSE file.
  }
{* @addtogroup libjxl_common
 * @
 * @file types.h
 * @brief Data types for the JPEG XL API, for both encoding and decoding.
  }
{$ifndef JXL_TYPES_H_}
{$define JXL_TYPES_H_}
{$include <stddef.h>}
{$include <stdint.h>}
{$include "jxl/jxl_export.h"}
{*
 * A portable @c bool replacement.
 *
 * ::JXL_BOOL is a "documentation" type: actually it is @c int, but in API it
 * denotes a type, whose only values are ::JXL_TRUE and ::JXL_FALSE.
  }

const
  JXL_BOOL = longint;  
{* Portable @c true replacement.  }
  JXL_TRUE = 1;  
{* Portable @c false replacement.  }
  JXL_FALSE = 0;  
{* Data type for the sample values per channel per pixel.
  }
{* Use 32-bit single-precision floating point values, with range 0.0-1.0
   * (within gamut, may go outside this range for wide color gamut). Floating
   * point output, either JXL_TYPE_FLOAT or JXL_TYPE_FLOAT16, is recommended
   * for HDR and wide gamut images when color profile conversion is required.  }
{* Use type uint8_t. May clip wide color gamut data.
    }
{* Use type uint16_t. May clip wide color gamut data.
    }
{* Use 16-bit IEEE 754 half-precision floating point values  }
type
  PJxlDataType = ^TJxlDataType;
  TJxlDataType =  Longint;
  Const
    JXL_TYPE_FLOAT = 0;
    JXL_TYPE_UINT8 = 2;
    JXL_TYPE_UINT16 = 3;
    JXL_TYPE_FLOAT16 = 5;
;
{* Use the endianness of the system, either little endian or big endian,
   * without forcing either specific endianness. Do not use if pixel data
   * should be exported to a well defined format.
    }
{* Force little endian  }
{* Force big endian  }
type
  PJxlEndianness = ^TJxlEndianness;
  TJxlEndianness =  Longint;
  Const
    JXL_NATIVE_ENDIAN = 0;
    JXL_LITTLE_ENDIAN = 1;
    JXL_BIG_ENDIAN = 2;
;
{* Data type for the sample values per channel per pixel for the output buffer
 * for pixels. This is not necessarily the same as the data type encoded in the
 * codestream. The channels are interleaved per pixel. The pixels are
 * organized row by row, left to right, top to bottom.
 * TODO(lode): implement padding / alignment (row stride)
 * TODO(lode): support different channel orders if needed (RGB, BGR, ...)
  }
{* Amount of channels available in a pixel buffer.
   * 1: single-channel data, e.g. grayscale or a single extra channel
   * 2: single-channel + alpha
   * 3: trichromatic, e.g. RGB
   * 4: trichromatic + alpha
   * TODO(lode): this needs finetuning. It is not yet defined how the user
   * chooses output color space. CMYK+alpha needs 5 channels.
    }
{* Data type of each channel.
    }
{* Whether multi-byte data types are represented in big endian or little
   * endian format. This applies to JXL_TYPE_UINT16, JXL_TYPE_UINT32
   * and JXL_TYPE_FLOAT.
    }
{* Align scanlines to a multiple of align bytes, or 0 to require no
   * alignment at all (which has the same effect as value 1)
    }
type
  PJxlPixelFormat = ^TJxlPixelFormat;
  TJxlPixelFormat = record
      num_channels : Tuint32_t;
      data_type : TJxlDataType;
      endianness : TJxlEndianness;
      align : Tsize_t;
    end;
{* Data type holding the 4-character type name of an ISOBMFF box.
  }

  PJxlBoxType = ^TJxlBoxType;
  TJxlBoxType = array[0..3] of char;
{* Types of progressive detail.
 * Setting a progressive detail with value N implies all progressive details
 * with smaller or equal value. Currently only the following level of
 * progressive detail is implemented:
 *  - kDC (which implies kFrames)
 *  - kLastPasses (which implies kDC and kFrames)
 *  - kPasses (which implies kLastPasses, kDC and kFrames)
  }
{ after completed kRegularFrames }
{ after completed DC (1:8) }
{ after completed AC passes that are the last pass for their resolution }
{ target. }
{ after completed AC passes that are not the last pass for their resolution }
{ target. }
{ during DC frame when lower resolution are completed (1:32, 1:16) }
{ after completed groups }
{ after completed groups }

  PJxlProgressiveDetail = ^TJxlProgressiveDetail;
  TJxlProgressiveDetail =  Longint;
  Const
    kFrames = 0;
    kDC = 1;
    kLastPasses = 2;
    kPasses = 3;
    kDCProgressive = 4;
    kDCGroups = 5;
    kGroups = 6;
;
{* @ }

implementation


end.
