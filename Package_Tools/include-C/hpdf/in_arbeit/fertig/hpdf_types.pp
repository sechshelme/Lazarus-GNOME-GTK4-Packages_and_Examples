
unit hpdf_types;
interface

{
  Automatically converted by H2Pas 1.0.0 from hpdf_types.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    hpdf_types.h
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
PHPDF_3DMatrix  = ^HPDF_3DMatrix;
PHPDF_AFRelationship  = ^HPDF_AFRelationship;
PHPDF_Alloc_Func  = ^HPDF_Alloc_Func;
PHPDF_AnnotFlgs  = ^HPDF_AnnotFlgs;
PHPDF_AnnotHighlightMode  = ^HPDF_AnnotHighlightMode;
PHPDF_AnnotIcon  = ^HPDF_AnnotIcon;
PHPDF_AnnotIntent  = ^HPDF_AnnotIntent;
PHPDF_AnnotType  = ^HPDF_AnnotType;
PHPDF_BlendMode  = ^HPDF_BlendMode;
PHPDF_BOOL  = ^HPDF_BOOL;
PHPDF_BSSubtype  = ^HPDF_BSSubtype;
PHPDF_BYTE  = ^HPDF_BYTE;
PHPDF_ByteType  = ^HPDF_ByteType;
PHPDF_CID  = ^HPDF_CID;
PHPDF_CMYKColor  = ^HPDF_CMYKColor;
PHPDF_ColorSpace  = ^HPDF_ColorSpace;
PHPDF_DashMode  = ^HPDF_DashMode;
PHPDF_Date  = ^HPDF_Date;
PHPDF_DestinationType  = ^HPDF_DestinationType;
PHPDF_DOUBLE  = ^HPDF_DOUBLE;
PHPDF_EncoderType  = ^HPDF_EncoderType;
PHPDF_EncryptMode  = ^HPDF_EncryptMode;
PHPDF_InfoType  = ^HPDF_InfoType;
PHPDF_INT  = ^HPDF_INT;
PHPDF_INT16  = ^HPDF_INT16;
PHPDF_INT32  = ^HPDF_INT32;
PHPDF_INT64  = ^HPDF_INT64;
PHPDF_INT8  = ^HPDF_INT8;
PHPDF_LineAnnotCapPosition  = ^HPDF_LineAnnotCapPosition;
PHPDF_LineAnnotEndingStyle  = ^HPDF_LineAnnotEndingStyle;
PHPDF_LineCap  = ^HPDF_LineCap;
PHPDF_LineJoin  = ^HPDF_LineJoin;
PHPDF_NameDictKey  = ^HPDF_NameDictKey;
PHPDF_PageBoundary  = ^HPDF_PageBoundary;
PHPDF_PageDirection  = ^HPDF_PageDirection;
PHPDF_PageLayout  = ^HPDF_PageLayout;
PHPDF_PageMode  = ^HPDF_PageMode;
PHPDF_PageNumStyle  = ^HPDF_PageNumStyle;
PHPDF_PageSizes  = ^HPDF_PageSizes;
PHPDF_PDFA_TYPE  = ^HPDF_PDFA_TYPE;
PHPDF_PDFAType  = ^HPDF_PDFAType;
PHPDF_PdfVer  = ^HPDF_PdfVer;
PHPDF_Point  = ^HPDF_Point;
PHPDF_Point3D  = ^HPDF_Point3D;
PHPDF_REAL  = ^HPDF_REAL;
PHPDF_Rect  = ^HPDF_Rect;
PHPDF_RGBColor  = ^HPDF_RGBColor;
PHPDF_Shading_FreeFormTriangleMeshEdgeFlag  = ^HPDF_Shading_FreeFormTriangleMeshEdgeFlag;
PHPDF_ShadingType  = ^HPDF_ShadingType;
PHPDF_StampAnnotName  = ^HPDF_StampAnnotName;
PHPDF_STATUS  = ^HPDF_STATUS;
PHPDF_TextAlignment  = ^HPDF_TextAlignment;
PHPDF_TextRenderingMode  = ^HPDF_TextRenderingMode;
PHPDF_TextWidth  = ^HPDF_TextWidth;
PHPDF_TransitionStyle  = ^HPDF_TransitionStyle;
PHPDF_TransMatrix  = ^HPDF_TransMatrix;
PHPDF_UINT  = ^HPDF_UINT;
PHPDF_UINT16  = ^HPDF_UINT16;
PHPDF_UINT32  = ^HPDF_UINT32;
PHPDF_UINT64  = ^HPDF_UINT64;
PHPDF_UINT8  = ^HPDF_UINT8;
PHPDF_UNICODE  = ^HPDF_UNICODE;
PHPDF_WritingMode  = ^HPDF_WritingMode;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * << Haru Free PDF Library >> -- hpdf_types.h
 *
 * URL: http://libharu.org
 *
 * Copyright (c) 1999-2006 Takeshi Kanno <takeshi_kanno@est.hi-ho.ne.jp>
 * Copyright (c) 2007-2009 Antony Dovgal <tony@daylessday.org>
 *
 * Permission to use, copy, modify, distribute and sell this software
 * and its documentation for any purpose is hereby granted without fee,
 * provided that the above copyright notice appear in all copies and
 * that both that copyright notice and this permission notice appear
 * in supporting documentation.
 * It is provided "as is" without express or implied warranty.
 *
  }
{$ifndef _HPDF_TYPES_H}
{$define _HPDF_TYPES_H}
{$include <stdlib.h>}
{ C++ extern C conditionnal removed }
{---------------------------------------------------------------------------- }
{----- type definition ------------------------------------------------------ }
{  native OS integer types  }
type
  PHPDF_INT = ^THPDF_INT;
  THPDF_INT = longint;

  PHPDF_UINT = ^THPDF_UINT;
  THPDF_UINT = dword;
{  64bit integer types
  }

  PHPDF_INT64 = ^THPDF_INT64;
  THPDF_INT64 = int64;

  PHPDF_UINT64 = ^THPDF_UINT64;
  THPDF_UINT64 = qword;
{  32bit integer types
  }

  PHPDF_INT32 = ^THPDF_INT32;
  THPDF_INT32 = longint;

  PHPDF_UINT32 = ^THPDF_UINT32;
  THPDF_UINT32 = dword;
{  16bit integer types
  }

  PHPDF_INT16 = ^THPDF_INT16;
  THPDF_INT16 = smallint;

  PHPDF_UINT16 = ^THPDF_UINT16;
  THPDF_UINT16 = word;
{  8bit integer types
  }

  PHPDF_INT8 = ^THPDF_INT8;
  THPDF_INT8 = char;

  PHPDF_UINT8 = ^THPDF_UINT8;
  THPDF_UINT8 = byte;
{  8bit binary types
  }

  PHPDF_BYTE = ^THPDF_BYTE;
  THPDF_BYTE = byte;
{  float type (32bit IEEE754)
  }

  PHPDF_REAL = ^THPDF_REAL;
  THPDF_REAL = single;
{  double type (64bit IEEE754)
  }

  PHPDF_DOUBLE = ^THPDF_DOUBLE;
  THPDF_DOUBLE = Tdouble;
{  boolean type (0: False, !0: True)
  }

  PHPDF_BOOL = ^THPDF_BOOL;
  THPDF_BOOL = longint;
{  error-no type (32bit unsigned integer)
  }

  PHPDF_STATUS = ^THPDF_STATUS;
  THPDF_STATUS = dword;
{  character-code type (16bit)
  }

  PHPDF_CID = ^THPDF_CID;
  THPDF_CID = THPDF_UINT16;

  PHPDF_UNICODE = ^THPDF_UNICODE;
  THPDF_UNICODE = THPDF_UINT16;
{  HPDF_Point struct
  }

  PHPDF_Point = ^THPDF_Point;
  THPDF_Point = record
      x : THPDF_REAL;
      y : THPDF_REAL;
    end;

  PHPDF_Rect = ^THPDF_Rect;
  THPDF_Rect = record
      left : THPDF_REAL;
      bottom : THPDF_REAL;
      right : THPDF_REAL;
      top : THPDF_REAL;
    end;
{  HPDF_Point3D struct
 }

  PHPDF_Point3D = ^THPDF_Point3D;
  THPDF_Point3D = record
      x : THPDF_REAL;
      y : THPDF_REAL;
      z : THPDF_REAL;
    end;
  THPDF_Rect = THPDF_Box;
{ HPDF_Date struct
  }

  PHPDF_Date = ^THPDF_Date;
  THPDF_Date = record
      year : THPDF_INT;
      month : THPDF_INT;
      day : THPDF_INT;
      hour : THPDF_INT;
      minutes : THPDF_INT;
      seconds : THPDF_INT;
      ind : char;
      off_hour : THPDF_INT;
      off_minutes : THPDF_INT;
    end;
{ date-time type parameters  }
{ string type parameters  }

  PHPDF_InfoType = ^THPDF_InfoType;
  THPDF_InfoType =  Longint;
  Const
    HPDF_INFO_CREATION_DATE = 0;
    HPDF_INFO_MOD_DATE = 1;
    HPDF_INFO_AUTHOR = 2;
    HPDF_INFO_CREATOR = 3;
    HPDF_INFO_PRODUCER = 4;
    HPDF_INFO_TITLE = 5;
    HPDF_INFO_SUBJECT = 6;
    HPDF_INFO_KEYWORDS = 7;
    HPDF_INFO_TRAPPED = 8;
    HPDF_INFO_GTS_PDFX = 9;
    HPDF_INFO_EOF = 10;
;
{ PDF-A Types  }
type
  PHPDF_PDFA_TYPE = ^THPDF_PDFA_TYPE;
  THPDF_PDFA_TYPE =  Longint;
  Const
    HPDF_PDFA_NON_PDFA = -(1);
    HPDF_PDFA_1A = 0;
    HPDF_PDFA_1B = 1;
    HPDF_PDFA_2A = 2;
    HPDF_PDFA_2B = 3;
    HPDF_PDFA_2U = 4;
    HPDF_PDFA_3A = 5;
    HPDF_PDFA_3B = 6;
    HPDF_PDFA_3U = 7;
    HPDF_PDFA_4 = 8;
    HPDF_PDFA_4E = 9;
    HPDF_PDFA_4F = 10;
;
  THPDF_PDFAType = THPDF_PDFA_TYPE;
  PHPDF_PDFAType = ^THPDF_PDFAType;
type
  PHPDF_PdfVer = ^THPDF_PdfVer;
  THPDF_PdfVer =  Longint;
  Const
    HPDF_VER_12 = 0;
    HPDF_VER_13 = 1;
    HPDF_VER_14 = 2;
    HPDF_VER_15 = 3;
    HPDF_VER_16 = 4;
    HPDF_VER_17 = 5;
    HPDF_VER_20 = 6;
    HPDF_VER_EOF = 7;
;
type
  PHPDF_EncryptMode = ^THPDF_EncryptMode;
  THPDF_EncryptMode =  Longint;
  Const
    HPDF_ENCRYPT_R2 = 2;
    HPDF_ENCRYPT_R3 = 3;
;
type

  THPDF_Error_Handler = procedure (error_no:THPDF_STATUS; detail_no:THPDF_STATUS; user_data:pointer);cdecl;

  PHPDF_Alloc_Func = ^THPDF_Alloc_Func;
  THPDF_Alloc_Func = function (size:THPDF_UINT):pointer;cdecl;

  THPDF_Free_Func = procedure (aptr:pointer);cdecl;
{--------------------------------------------------------------------------- }
{------ text width struct -------------------------------------------------- }
{ don't use this value (it may be change in the feature).
       use numspace as alternated.  }

  PHPDF_TextWidth = ^THPDF_TextWidth;
  THPDF_TextWidth = record
      numchars : THPDF_UINT;
      numwords : THPDF_UINT;
      width : THPDF_UINT;
      numspace : THPDF_UINT;
    end;
{--------------------------------------------------------------------------- }
{------ dash mode ---------------------------------------------------------- }

  PHPDF_DashMode = ^THPDF_DashMode;
  THPDF_DashMode = record
      ptn : array[0..7] of THPDF_REAL;
      num_ptn : THPDF_UINT;
      phase : THPDF_REAL;
    end;
{--------------------------------------------------------------------------- }
{----- HPDF_TransMatrix struct --------------------------------------------- }

  PHPDF_TransMatrix = ^THPDF_TransMatrix;
  THPDF_TransMatrix = record
      a : THPDF_REAL;
      b : THPDF_REAL;
      c : THPDF_REAL;
      d : THPDF_REAL;
      x : THPDF_REAL;
      y : THPDF_REAL;
    end;
{--------------------------------------------------------------------------- }
{----- HPDF_3DMatrix struct ------------------------------------------------ }

  PHPDF_3DMatrix = ^THPDF_3DMatrix;
  THPDF_3DMatrix = record
      a : THPDF_REAL;
      b : THPDF_REAL;
      c : THPDF_REAL;
      d : THPDF_REAL;
      e : THPDF_REAL;
      f : THPDF_REAL;
      g : THPDF_REAL;
      h : THPDF_REAL;
      i : THPDF_REAL;
      tx : THPDF_REAL;
      ty : THPDF_REAL;
      tz : THPDF_REAL;
    end;
{--------------------------------------------------------------------------- }

  PHPDF_ColorSpace = ^THPDF_ColorSpace;
  THPDF_ColorSpace =  Longint;
  Const
    HPDF_CS_DEVICE_GRAY = 0;
    HPDF_CS_DEVICE_RGB = 1;
    HPDF_CS_DEVICE_CMYK = 2;
    HPDF_CS_CAL_GRAY = 3;
    HPDF_CS_CAL_RGB = 4;
    HPDF_CS_LAB = 5;
    HPDF_CS_ICC_BASED = 6;
    HPDF_CS_SEPARATION = 7;
    HPDF_CS_DEVICE_N = 8;
    HPDF_CS_INDEXED = 9;
    HPDF_CS_PATTERN = 10;
    HPDF_CS_EOF = 11;
;
{--------------------------------------------------------------------------- }
{----- HPDF_RGBColor struct ------------------------------------------------ }
type
  PHPDF_RGBColor = ^THPDF_RGBColor;
  THPDF_RGBColor = record
      r : THPDF_REAL;
      g : THPDF_REAL;
      b : THPDF_REAL;
    end;
{--------------------------------------------------------------------------- }
{----- HPDF_CMYKColor struct ----------------------------------------------- }

  PHPDF_CMYKColor = ^THPDF_CMYKColor;
  THPDF_CMYKColor = record
      c : THPDF_REAL;
      m : THPDF_REAL;
      y : THPDF_REAL;
      k : THPDF_REAL;
    end;
{--------------------------------------------------------------------------- }
{------ The line cap style ------------------------------------------------- }

  PHPDF_LineCap = ^THPDF_LineCap;
  THPDF_LineCap =  Longint;
  Const
    HPDF_BUTT_END = 0;
    HPDF_ROUND_END = 1;
    HPDF_PROJECTING_SQUARE_END = 2;
    HPDF_LINECAP_EOF = 3;
;
{---------------------------------------------------------------------------- }
{------ The line join style ------------------------------------------------- }
type
  PHPDF_LineJoin = ^THPDF_LineJoin;
  THPDF_LineJoin =  Longint;
  Const
    HPDF_MITER_JOIN = 0;
    HPDF_ROUND_JOIN = 1;
    HPDF_BEVEL_JOIN = 2;
    HPDF_LINEJOIN_EOF = 3;
;
{---------------------------------------------------------------------------- }
{------ The text rendering mode --------------------------------------------- }
type
  PHPDF_TextRenderingMode = ^THPDF_TextRenderingMode;
  THPDF_TextRenderingMode =  Longint;
  Const
    HPDF_FILL = 0;
    HPDF_STROKE = 1;
    HPDF_FILL_THEN_STROKE = 2;
    HPDF_INVISIBLE = 3;
    HPDF_FILL_CLIPPING = 4;
    HPDF_STROKE_CLIPPING = 5;
    HPDF_FILL_STROKE_CLIPPING = 6;
    HPDF_CLIPPING = 7;
    HPDF_RENDERING_MODE_EOF = 8;
;
type
  PHPDF_WritingMode = ^THPDF_WritingMode;
  THPDF_WritingMode =  Longint;
  Const
    HPDF_WMODE_HORIZONTAL = 0;
    HPDF_WMODE_VERTICAL = 1;
    HPDF_WMODE_EOF = 2;
;
type
  PHPDF_PageLayout = ^THPDF_PageLayout;
  THPDF_PageLayout =  Longint;
  Const
    HPDF_PAGE_LAYOUT_SINGLE = 0;
    HPDF_PAGE_LAYOUT_ONE_COLUMN = 1;
    HPDF_PAGE_LAYOUT_TWO_COLUMN_LEFT = 2;
    HPDF_PAGE_LAYOUT_TWO_COLUMN_RIGHT = 3;
    HPDF_PAGE_LAYOUT_TWO_PAGE_LEFT = 4;
    HPDF_PAGE_LAYOUT_TWO_PAGE_RIGHT = 5;
    HPDF_PAGE_LAYOUT_EOF = 6;
;
{  HPDF_PAGE_MODE_USE_OC,
    HPDF_PAGE_MODE_USE_ATTACHMENTS,
  }
type
  PHPDF_PageMode = ^THPDF_PageMode;
  THPDF_PageMode =  Longint;
  Const
    HPDF_PAGE_MODE_USE_NONE = 0;
    HPDF_PAGE_MODE_USE_OUTLINE = 1;
    HPDF_PAGE_MODE_USE_THUMBS = 2;
    HPDF_PAGE_MODE_FULL_SCREEN = 3;
    HPDF_PAGE_MODE_EOF = 4;
;
type
  PHPDF_PageNumStyle = ^THPDF_PageNumStyle;
  THPDF_PageNumStyle =  Longint;
  Const
    HPDF_PAGE_NUM_STYLE_DECIMAL = 0;
    HPDF_PAGE_NUM_STYLE_UPPER_ROMAN = 1;
    HPDF_PAGE_NUM_STYLE_LOWER_ROMAN = 2;
    HPDF_PAGE_NUM_STYLE_UPPER_LETTERS = 3;
    HPDF_PAGE_NUM_STYLE_LOWER_LETTERS = 4;
    HPDF_PAGE_NUM_STYLE_EOF = 5;
;
type
  PHPDF_DestinationType = ^THPDF_DestinationType;
  THPDF_DestinationType =  Longint;
  Const
    HPDF_XYZ = 0;
    HPDF_FIT = 1;
    HPDF_FIT_H = 2;
    HPDF_FIT_V = 3;
    HPDF_FIT_R = 4;
    HPDF_FIT_B = 5;
    HPDF_FIT_BH = 6;
    HPDF_FIT_BV = 7;
    HPDF_DST_EOF = 8;
;
type
  PHPDF_AnnotType = ^THPDF_AnnotType;
  THPDF_AnnotType =  Longint;
  Const
    HPDF_ANNOT_TEXT_NOTES = 0;
    HPDF_ANNOT_LINK = 1;
    HPDF_ANNOT_SOUND = 2;
    HPDF_ANNOT_FREE_TEXT = 3;
    HPDF_ANNOT_STAMP = 4;
    HPDF_ANNOT_SQUARE = 5;
    HPDF_ANNOT_CIRCLE = 6;
    HPDF_ANNOT_STRIKE_OUT = 7;
    HPDF_ANNOT_HIGHTLIGHT = 8;
    HPDF_ANNOT_UNDERLINE = 9;
    HPDF_ANNOT_INK = 10;
    HPDF_ANNOT_FILE_ATTACHMENT = 11;
    HPDF_ANNOT_POPUP = 12;
    HPDF_ANNOT_3D = 13;
    HPDF_ANNOT_SQUIGGLY = 14;
    HPDF_ANNOT_LINE = 15;
    HPDF_ANNOT_PROJECTION = 16;
    HPDF_ANNOT_WIDGET = 17;
;
type
  PHPDF_AnnotFlgs = ^THPDF_AnnotFlgs;
  THPDF_AnnotFlgs =  Longint;
  Const
    HPDF_ANNOT_INVISIBLE = 0;
    HPDF_ANNOT_HIDDEN = 1;
    HPDF_ANNOT_PRINT = 2;
    HPDF_ANNOT_NOZOOM = 3;
    HPDF_ANNOT_NOROTATE = 4;
    HPDF_ANNOT_NOVIEW = 5;
    HPDF_ANNOT_READONLY = 6;
;
type
  PHPDF_AnnotHighlightMode = ^THPDF_AnnotHighlightMode;
  THPDF_AnnotHighlightMode =  Longint;
  Const
    HPDF_ANNOT_NO_HIGHTLIGHT = 0;
    HPDF_ANNOT_INVERT_BOX = 1;
    HPDF_ANNOT_INVERT_BORDER = 2;
    HPDF_ANNOT_DOWN_APPEARANCE = 3;
    HPDF_ANNOT_HIGHTLIGHT_MODE_EOF = 4;
;
type
  PHPDF_AnnotIcon = ^THPDF_AnnotIcon;
  THPDF_AnnotIcon =  Longint;
  Const
    HPDF_ANNOT_ICON_COMMENT = 0;
    HPDF_ANNOT_ICON_KEY = 1;
    HPDF_ANNOT_ICON_NOTE = 2;
    HPDF_ANNOT_ICON_HELP = 3;
    HPDF_ANNOT_ICON_NEW_PARAGRAPH = 4;
    HPDF_ANNOT_ICON_PARAGRAPH = 5;
    HPDF_ANNOT_ICON_INSERT = 6;
    HPDF_ANNOT_ICON_EOF = 7;
;
type
  PHPDF_AnnotIntent = ^THPDF_AnnotIntent;
  THPDF_AnnotIntent =  Longint;
  Const
    HPDF_ANNOT_INTENT_FREETEXTCALLOUT = 0;
    HPDF_ANNOT_INTENT_FREETEXTTYPEWRITER = 1;
    HPDF_ANNOT_INTENT_LINEARROW = 2;
    HPDF_ANNOT_INTENT_LINEDIMENSION = 3;
    HPDF_ANNOT_INTENT_POLYGONCLOUD = 4;
    HPDF_ANNOT_INTENT_POLYLINEDIMENSION = 5;
    HPDF_ANNOT_INTENT_POLYGONDIMENSION = 6;
;
type
  PHPDF_LineAnnotEndingStyle = ^THPDF_LineAnnotEndingStyle;
  THPDF_LineAnnotEndingStyle =  Longint;
  Const
    HPDF_LINE_ANNOT_NONE = 0;
    HPDF_LINE_ANNOT_SQUARE = 1;
    HPDF_LINE_ANNOT_CIRCLE = 2;
    HPDF_LINE_ANNOT_DIAMOND = 3;
    HPDF_LINE_ANNOT_OPENARROW = 4;
    HPDF_LINE_ANNOT_CLOSEDARROW = 5;
    HPDF_LINE_ANNOT_BUTT = 6;
    HPDF_LINE_ANNOT_ROPENARROW = 7;
    HPDF_LINE_ANNOT_RCLOSEDARROW = 8;
    HPDF_LINE_ANNOT_SLASH = 9;
;
type
  PHPDF_LineAnnotCapPosition = ^THPDF_LineAnnotCapPosition;
  THPDF_LineAnnotCapPosition =  Longint;
  Const
    HPDF_LINE_ANNOT_CAP_INLINE = 0;
    HPDF_LINE_ANNOT_CAP_TOP = 1;
;
type
  PHPDF_StampAnnotName = ^THPDF_StampAnnotName;
  THPDF_StampAnnotName =  Longint;
  Const
    HPDF_STAMP_ANNOT_APPROVED = 0;
    HPDF_STAMP_ANNOT_EXPERIMENTAL = 1;
    HPDF_STAMP_ANNOT_NOTAPPROVED = 2;
    HPDF_STAMP_ANNOT_ASIS = 3;
    HPDF_STAMP_ANNOT_EXPIRED = 4;
    HPDF_STAMP_ANNOT_NOTFORPUBLICRELEASE = 5;
    HPDF_STAMP_ANNOT_CONFIDENTIAL = 6;
    HPDF_STAMP_ANNOT_FINAL = 7;
    HPDF_STAMP_ANNOT_SOLD = 8;
    HPDF_STAMP_ANNOT_DEPARTMENTAL = 9;
    HPDF_STAMP_ANNOT_FORCOMMENT = 10;
    HPDF_STAMP_ANNOT_TOPSECRET = 11;
    HPDF_STAMP_ANNOT_DRAFT = 12;
    HPDF_STAMP_ANNOT_FORPUBLICRELEASE = 13;
;
{---------------------------------------------------------------------------- }
{------ border stype -------------------------------------------------------- }
type
  PHPDF_BSSubtype = ^THPDF_BSSubtype;
  THPDF_BSSubtype =  Longint;
  Const
    HPDF_BS_SOLID = 0;
    HPDF_BS_DASHED = 1;
    HPDF_BS_BEVELED = 2;
    HPDF_BS_INSET = 3;
    HPDF_BS_UNDERLINED = 4;
;
{----- blend modes ---------------------------------------------------------- }
type
  PHPDF_BlendMode = ^THPDF_BlendMode;
  THPDF_BlendMode =  Longint;
  Const
    HPDF_BM_NORMAL = 0;
    HPDF_BM_MULTIPLY = 1;
    HPDF_BM_SCREEN = 2;
    HPDF_BM_OVERLAY = 3;
    HPDF_BM_DARKEN = 4;
    HPDF_BM_LIGHTEN = 5;
    HPDF_BM_COLOR_DODGE = 6;
    HPDF_BM_COLOR_BUM = 7;
    HPDF_BM_HARD_LIGHT = 8;
    HPDF_BM_SOFT_LIGHT = 9;
    HPDF_BM_DIFFERENCE = 10;
    HPDF_BM_EXCLUSHON = 11;
    HPDF_BM_EOF = 12;
;
{----- slide show ----------------------------------------------------------- }
type
  PHPDF_TransitionStyle = ^THPDF_TransitionStyle;
  THPDF_TransitionStyle =  Longint;
  Const
    HPDF_TS_WIPE_RIGHT = 0;
    HPDF_TS_WIPE_UP = 1;
    HPDF_TS_WIPE_LEFT = 2;
    HPDF_TS_WIPE_DOWN = 3;
    HPDF_TS_BARN_DOORS_HORIZONTAL_OUT = 4;
    HPDF_TS_BARN_DOORS_HORIZONTAL_IN = 5;
    HPDF_TS_BARN_DOORS_VERTICAL_OUT = 6;
    HPDF_TS_BARN_DOORS_VERTICAL_IN = 7;
    HPDF_TS_BOX_OUT = 8;
    HPDF_TS_BOX_IN = 9;
    HPDF_TS_BLINDS_HORIZONTAL = 10;
    HPDF_TS_BLINDS_VERTICAL = 11;
    HPDF_TS_DISSOLVE = 12;
    HPDF_TS_GLITTER_RIGHT = 13;
    HPDF_TS_GLITTER_DOWN = 14;
    HPDF_TS_GLITTER_TOP_LEFT_TO_BOTTOM_RIGHT = 15;
    HPDF_TS_REPLACE = 16;
    HPDF_TS_EOF = 17;
;
{---------------------------------------------------------------------------- }
type
  PHPDF_PageSizes = ^THPDF_PageSizes;
  THPDF_PageSizes =  Longint;
  Const
    HPDF_PAGE_SIZE_LETTER = 0;
    HPDF_PAGE_SIZE_LEGAL = 1;
    HPDF_PAGE_SIZE_A3 = 2;
    HPDF_PAGE_SIZE_A4 = 3;
    HPDF_PAGE_SIZE_A5 = 4;
    HPDF_PAGE_SIZE_B4 = 5;
    HPDF_PAGE_SIZE_B5 = 6;
    HPDF_PAGE_SIZE_EXECUTIVE = 7;
    HPDF_PAGE_SIZE_US4x6 = 8;
    HPDF_PAGE_SIZE_US4x8 = 9;
    HPDF_PAGE_SIZE_US5x7 = 10;
    HPDF_PAGE_SIZE_COMM10 = 11;
    HPDF_PAGE_SIZE_EOF = 12;
;
type
  PHPDF_PageDirection = ^THPDF_PageDirection;
  THPDF_PageDirection =  Longint;
  Const
    HPDF_PAGE_PORTRAIT = 0;
    HPDF_PAGE_LANDSCAPE = 1;
;
type
  PHPDF_EncoderType = ^THPDF_EncoderType;
  THPDF_EncoderType =  Longint;
  Const
    HPDF_ENCODER_TYPE_SINGLE_BYTE = 0;
    HPDF_ENCODER_TYPE_DOUBLE_BYTE = 1;
    HPDF_ENCODER_TYPE_UNINITIALIZED = 2;
    HPDF_ENCODER_UNKNOWN = 3;
;
type
  PHPDF_ByteType = ^THPDF_ByteType;
  THPDF_ByteType =  Longint;
  Const
    HPDF_BYTE_TYPE_SINGLE = 0;
    HPDF_BYTE_TYPE_LEAD = 1;
    HPDF_BYTE_TYPE_TRAIL = 2;
    HPDF_BYTE_TYPE_UNKNOWN = 3;
;
type
  PHPDF_TextAlignment = ^THPDF_TextAlignment;
  THPDF_TextAlignment =  Longint;
  Const
    HPDF_TALIGN_LEFT = 0;
    HPDF_TALIGN_RIGHT = 1;
    HPDF_TALIGN_CENTER = 2;
    HPDF_TALIGN_JUSTIFY = 3;
;
{---------------------------------------------------------------------------- }
{ Name Dictionary values -- see PDF reference section 7.7.4  }
{ TODO the rest  }
type
  PHPDF_NameDictKey = ^THPDF_NameDictKey;
  THPDF_NameDictKey =  Longint;
  Const
    HPDF_NAME_EMBEDDED_FILES = 0;
    HPDF_NAME_EOF = 1;
;
type
  PHPDF_AFRelationship = ^THPDF_AFRelationship;
  THPDF_AFRelationship =  Longint;
  Const
    HPDF_AFRELATIONSHIP_SOURCE = 0;
    HPDF_AFRELATIONSHIP_DATA = 1;
    HPDF_AFRELATIONSHIP_ALTERNATIVE = 2;
    HPDF_AFRELATIONSHIP_SUPPLEMENT = 3;
    HPDF_AFRELATIONSHIP_ENCRYPTEDPAYLOAD = 4;
    HPDF_AFRELATIONSHIP_FORMDATA = 5;
    HPDF_AFRELATIONSHIP_SCHEMA = 6;
    HPDF_AFRELATIONSHIP_UNSPECIFIED = 7;
;
{---------------------------------------------------------------------------- }
type
  PHPDF_PageBoundary = ^THPDF_PageBoundary;
  THPDF_PageBoundary =  Longint;
  Const
    HPDF_PAGE_MEDIABOX = 0;
    HPDF_PAGE_CROPBOX = 1;
    HPDF_PAGE_BLEEDBOX = 2;
    HPDF_PAGE_TRIMBOX = 3;
    HPDF_PAGE_ARTBOX = 4;
;
{---------------------------------------------------------------------------- }
{ TODO the rest  }
type
  PHPDF_ShadingType = ^THPDF_ShadingType;
  THPDF_ShadingType =  Longint;
  Const
    HPDF_SHADING_FREE_FORM_TRIANGLE_MESH = 4;
;
type
  PHPDF_Shading_FreeFormTriangleMeshEdgeFlag = ^THPDF_Shading_FreeFormTriangleMeshEdgeFlag;
  THPDF_Shading_FreeFormTriangleMeshEdgeFlag =  Longint;
  Const
    HPDF_FREE_FORM_TRI_MESH_EDGEFLAG_NO_CONNECTION = 0;
    HPDF_FREE_FORM_TRI_MESH_EDGEFLAG_BC = 1;
    HPDF_FREE_FORM_TRI_MESH_EDGEFLAG_AC = 2;
;
{---------------------------------------------------------------------------- }
{ C++ end of extern C conditionnal removed }
{ __cplusplus  }
{$endif}
{ _HPDF_TYPES_H  }

implementation


end.
