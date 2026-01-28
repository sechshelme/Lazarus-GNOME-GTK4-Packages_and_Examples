unit hpdf_fontdef;

interface

uses
  fp_hpdf;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * << Haru Free PDF Library >> -- hpdf_fontdef.h
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
{$ifndef _HPDF_FONTDEF_H}
{$define _HPDF_FONTDEF_H}
{$include "hpdf_objects.h"}
{ C++ extern C conditionnal removed }

const
  HPDF_FONTDEF_SIG_BYTES = $464F4E54;  
{------ collection of flags for defining characteristics. --- }
  HPDF_FONT_FIXED_WIDTH = 1;  
  HPDF_FONT_SERIF = 2;  
  HPDF_FONT_SYMBOLIC = 4;  
  HPDF_FONT_SCRIPT = 8;  
{ Reserved                    16  }
  HPDF_FONT_STD_CHARSET = 32;  
  HPDF_FONT_ITALIC = 64;  
{ Reserved                    128
     Reserved                    256
     Reserved                    512
     Reserved                    1024
     Reserved                    2048
     Reserved                    4096
     Reserved                    8192
     Reserved                    16384
     Reserved                    32768  }
  HPDF_FONT_ALL_CAP = 65536;  
  HPDF_FONT_SMALL_CAP = 131072;  
  HPDF_FONT_FOURCE_BOLD = 262144;  
  HPDF_CID_W_TYPE_FROM_TO = 0;  
  HPDF_CID_W_TYPE_FROM_ARRAY = 1;  
{-- HPDF_FontDef --------------------------------------- }
type
  PHPDF_CharData = ^THPDF_CharData;
  THPDF_CharData = record
      char_cd : THPDF_INT16;
      unicode : THPDF_UNICODE;
      width : THPDF_INT16;
    end;

  PHPDF_FontDefType = ^THPDF_FontDefType;
  THPDF_FontDefType =  Longint;
  Const
    HPDF_FONTDEF_TYPE_TYPE1 = 0;
    HPDF_FONTDEF_TYPE_TRUETYPE = 1;
    HPDF_FONTDEF_TYPE_CID = 2;
    HPDF_FONTDEF_TYPE_UNINITIALIZED = 3;
    HPDF_FONTDEF_TYPE_EOF = 4;
;
type
  PHPDF_CID_Width = ^THPDF_CID_Width;
  THPDF_CID_Width = record
      cid : THPDF_UINT16;
      width : THPDF_INT16;
    end;
{---------------------------------------------------------------------------- }
{----- HPDF_FontDef --------------------------------------------------------- }

  PHPDF_FontDef = ^THPDF_FontDef;
  THPDF_FontDef = PHPDF_FontDef_Rec;

  THPDF_FontDef_FreeFunc = procedure (fontdef:THPDF_FontDef);cdecl;

  THPDF_FontDef_CleanFunc = procedure (fontdef:THPDF_FontDef);cdecl;

  THPDF_FontDef_InitFunc = function (fontdef:THPDF_FontDef):THPDF_STATUS;cdecl;
{  the initial value of descriptor entry is NULL.
     *  when first font-object based on the fontdef object is created,
     *  the font-descriptor object is created and descriptor entry is set.
      }

  PHPDF_FontDef_Rec = ^THPDF_FontDef_Rec;
  THPDF_FontDef_Rec = record
      sig_bytes : THPDF_UINT32;
      base_font : array[0..(HPDF_LIMIT_MAX_NAME_LEN+1)-1] of char;
      mmgr : THPDF_MMgr;
      error : THPDF_Error;
      _type : THPDF_FontDefType;
      clean_fn : THPDF_FontDef_CleanFunc;
      free_fn : THPDF_FontDef_FreeFunc;
      init_fn : THPDF_FontDef_InitFunc;
      ascent : THPDF_INT16;
      descent : THPDF_INT16;
      flags : THPDF_UINT;
      font_bbox : THPDF_Box;
      italic_angle : THPDF_INT16;
      stemv : THPDF_UINT16;
      avg_width : THPDF_INT16;
      max_width : THPDF_INT16;
      missing_width : THPDF_INT16;
      stemh : THPDF_UINT16;
      x_height : THPDF_UINT16;
      cap_height : THPDF_UINT16;
      descriptor : THPDF_Dict;
      data : THPDF_Stream;
      valid : THPDF_BOOL;
      attr : pointer;
    end;

procedure HPDF_FontDef_Free(fontdef:THPDF_FontDef);cdecl;external libhpdf;
procedure HPDF_FontDef_Cleanup(fontdef:THPDF_FontDef);cdecl;external libhpdf;
function HPDF_FontDef_Validate(fontdef:THPDF_FontDef):THPDF_BOOL;cdecl;external libhpdf;
{---------------------------------------------------------------------------- }
{----- HPDF_Type1FontDef  --------------------------------------------------- }
type
  PHPDF_Type1FontDefAttr = ^THPDF_Type1FontDefAttr;
  THPDF_Type1FontDefAttr = PHPDF_Type1FontDefAttrRec;
{ Required  }
{ Required  }
{ Required  }

  PHPDF_Type1FontDefAttrRec = ^THPDF_Type1FontDefAttrRec;
  THPDF_Type1FontDefAttrRec = record
      first_char : THPDF_BYTE;
      last_char : THPDF_BYTE;
      widths : PHPDF_CharData;
      widths_count : THPDF_UINT;
      leading : THPDF_INT16;
      char_set : Pchar;
      encoding_scheme : array[0..(HPDF_LIMIT_MAX_NAME_LEN+1)-1] of char;
      length1 : THPDF_UINT;
      length2 : THPDF_UINT;
      length3 : THPDF_UINT;
      is_base14font : THPDF_BOOL;
      is_fixed_pitch : THPDF_BOOL;
      font_data : THPDF_Stream;
    end;
  THPDF_Type1FontDefAttr_Rec = THPDF_Type1FontDefAttrRec;
  PHPDF_Type1FontDefAttr_Rec = ^THPDF_Type1FontDefAttr_Rec;

function HPDF_Type1FontDef_New(mmgr:THPDF_MMgr):THPDF_FontDef;cdecl;external libhpdf;
function HPDF_Type1FontDef_Load(mmgr:THPDF_MMgr; afm:THPDF_Stream; font_data:THPDF_Stream):THPDF_FontDef;cdecl;external libhpdf;
function HPDF_Type1FontDef_Duplicate(mmgr:THPDF_MMgr; src:THPDF_FontDef):THPDF_FontDef;cdecl;external libhpdf;
function HPDF_Type1FontDef_SetWidths(fontdef:THPDF_FontDef; widths:PHPDF_CharData):THPDF_STATUS;cdecl;external libhpdf;
function HPDF_Type1FontDef_GetWidthByName(fontdef:THPDF_FontDef; glyph_name:Pchar):THPDF_INT16;cdecl;external libhpdf;
function HPDF_Type1FontDef_GetWidth(fontdef:THPDF_FontDef; unicode:THPDF_UNICODE):THPDF_INT16;cdecl;external libhpdf;
function HPDF_Base14FontDef_New(mmgr:THPDF_MMgr; font_name:Pchar):THPDF_FontDef;cdecl;external libhpdf;
{---------------------------------------------------------------------------- }
{----- HPDF_TTFontDef  ------------------------------------------------------ }
const
  HPDF_TTF_FONT_TAG_LEN = 6;  
type
  PHPDF_TTF_Table = ^THPDF_TTF_Table;
  THPDF_TTF_Table = record
      tag : array[0..3] of char;
      check_sum : THPDF_UINT32;
      offset : THPDF_UINT32;
      length : THPDF_UINT32;
    end;
  THPDF_TTFTable = THPDF_TTF_Table;
  PHPDF_TTFTable = ^THPDF_TTFTable;

  PHPDF_TTF_OffsetTbl = ^THPDF_TTF_OffsetTbl;
  THPDF_TTF_OffsetTbl = record
      sfnt_version : THPDF_UINT32;
      num_tables : THPDF_UINT16;
      search_range : THPDF_UINT16;
      entry_selector : THPDF_UINT16;
      range_shift : THPDF_UINT16;
      table : PHPDF_TTFTable;
    end;

  PHPDF_TTF_CmapRange = ^THPDF_TTF_CmapRange;
  THPDF_TTF_CmapRange = record
      format : THPDF_UINT16;
      length : THPDF_UINT16;
      language : THPDF_UINT16;
      seg_count_x2 : THPDF_UINT16;
      search_range : THPDF_UINT16;
      entry_selector : THPDF_UINT16;
      range_shift : THPDF_UINT16;
      end_count : PHPDF_UINT16;
      reserved_pad : THPDF_UINT16;
      start_count : PHPDF_UINT16;
      id_delta : PHPDF_INT16;
      id_range_offset : PHPDF_UINT16;
      glyph_id_array : PHPDF_UINT16;
      glyph_id_array_count : THPDF_UINT;
    end;
{ 0: unused, 1: used  }

  PHPDF_TTF_GlyphOffsets = ^THPDF_TTF_GlyphOffsets;
  THPDF_TTF_GlyphOffsets = record
      base_offset : THPDF_UINT32;
      offsets : PHPDF_UINT32;
      flgs : PHPDF_BYTE;
    end;

  PHPDF_TTF_LongHorMetric = ^THPDF_TTF_LongHorMetric;
  THPDF_TTF_LongHorMetric = record
      advance_width : THPDF_UINT16;
      lsb : THPDF_INT16;
    end;

  PHPDF_TTF_FontHeader = ^THPDF_TTF_FontHeader;
  THPDF_TTF_FontHeader = record
      version_number : array[0..3] of THPDF_BYTE;
      font_revision : THPDF_UINT32;
      check_sum_adjustment : THPDF_UINT32;
      magic_number : THPDF_UINT32;
      flags : THPDF_UINT16;
      units_per_em : THPDF_UINT16;
      created : array[0..7] of THPDF_BYTE;
      modified : array[0..7] of THPDF_BYTE;
      x_min : THPDF_INT16;
      y_min : THPDF_INT16;
      x_max : THPDF_INT16;
      y_max : THPDF_INT16;
      mac_style : THPDF_UINT16;
      lowest_rec_ppem : THPDF_UINT16;
      font_direction_hint : THPDF_INT16;
      index_to_loc_format : THPDF_INT16;
      glyph_data_format : THPDF_INT16;
    end;

  PHPDF_TTF_NameRecord = ^THPDF_TTF_NameRecord;
  THPDF_TTF_NameRecord = record
      platform_id : THPDF_UINT16;
      encoding_id : THPDF_UINT16;
      language_id : THPDF_UINT16;
      name_id : THPDF_UINT16;
      length : THPDF_UINT16;
      offset : THPDF_UINT16;
    end;

  PHPDF_TTF_NamingTable = ^THPDF_TTF_NamingTable;
  THPDF_TTF_NamingTable = record
      format : THPDF_UINT16;
      count : THPDF_UINT16;
      string_offset : THPDF_UINT16;
      name_records : PHPDF_TTF_NameRecord;
    end;

  PHPDF_TTFontDefAttr = ^THPDF_TTFontDefAttr;
  THPDF_TTFontDefAttr = PHPDF_TTFontDefAttr_Rec;

  PHPDF_TTFontDefAttr_Rec = ^THPDF_TTFontDefAttr_Rec;
  THPDF_TTFontDefAttr_Rec = record
      base_font : array[0..(HPDF_LIMIT_MAX_NAME_LEN+1)-1] of char;
      first_char : THPDF_BYTE;
      last_char : THPDF_BYTE;
      char_set : Pchar;
      tag_name : array[0..(HPDF_TTF_FONT_TAG_LEN+1)-1] of char;
      tag_name2 : array[0..((HPDF_TTF_FONT_TAG_LEN+1)*2)-1] of char;
      header : THPDF_TTF_FontHeader;
      glyph_tbl : THPDF_TTF_GlyphOffsets;
      num_glyphs : THPDF_UINT16;
      name_tbl : THPDF_TTF_NamingTable;
      h_metric : PHPDF_TTF_LongHorMetric;
      num_h_metric : THPDF_UINT16;
      offset_tbl : THPDF_TTF_OffsetTbl;
      cmap : THPDF_TTF_CmapRange;
      fs_type : THPDF_UINT16;
      sfamilyclass : array[0..1] of THPDF_BYTE;
      panose : array[0..9] of THPDF_BYTE;
      code_page_range1 : THPDF_UINT32;
      code_page_range2 : THPDF_UINT32;
      length1 : THPDF_UINT;
      embedding : THPDF_BOOL;
      is_cidfont : THPDF_BOOL;
      stream : THPDF_Stream;
    end;

function HPDF_TTFontDef_New(mmgr:THPDF_MMgr):THPDF_FontDef;cdecl;external libhpdf;
function HPDF_TTFontDef_Load(mmgr:THPDF_MMgr; stream:THPDF_Stream; embedding:THPDF_BOOL):THPDF_FontDef;cdecl;external libhpdf;
function HPDF_TTFontDef_Load2(mmgr:THPDF_MMgr; stream:THPDF_Stream; index:THPDF_UINT; embedding:THPDF_BOOL):THPDF_FontDef;cdecl;external libhpdf;
function HPDF_TTFontDef_GetGlyphid(fontdef:THPDF_FontDef; unicode:THPDF_UINT16):THPDF_UINT16;cdecl;external libhpdf;
function HPDF_TTFontDef_GetCharWidth(fontdef:THPDF_FontDef; unicode:THPDF_UINT16):THPDF_INT16;cdecl;external libhpdf;
function HPDF_TTFontDef_GetGidWidth(fontdef:THPDF_FontDef; gid:THPDF_UINT16):THPDF_INT16;cdecl;external libhpdf;
function HPDF_TTFontDef_SaveFontData(fontdef:THPDF_FontDef; stream:THPDF_Stream):THPDF_STATUS;cdecl;external libhpdf;
function HPDF_TTFontDef_GetCharBBox(fontdef:THPDF_FontDef; unicode:THPDF_UINT16):THPDF_Box;cdecl;external libhpdf;
procedure HPDF_TTFontDef_SetTagName(fontdef:THPDF_FontDef; tag:Pchar);cdecl;external libhpdf;
{---------------------------------------------------------------------------- }
{----- HPDF_CIDFontDef  ----------------------------------------------------- }
type
  PHPDF_CIDFontDefAttr = ^THPDF_CIDFontDefAttr;
  THPDF_CIDFontDefAttr = PHPDF_CIDFontDefAttrRec;

  PHPDF_CIDFontDefAttrRec = ^THPDF_CIDFontDefAttrRec;
  THPDF_CIDFontDefAttrRec = record
      widths : THPDF_List;
      DW : THPDF_INT16;
      DW2 : array[0..1] of THPDF_INT16;
    end;
  THPDF_CIDFontDefAttr_Rec = THPDF_CIDFontDefAttrRec;
  PHPDF_CIDFontDefAttr_Rec = ^THPDF_CIDFontDefAttr_Rec;

function HPDF_CIDFontDef_New(mmgr:THPDF_MMgr; name:Pchar; init_fn:THPDF_FontDef_InitFunc):THPDF_FontDef;cdecl;external libhpdf;
function HPDF_CIDFontDef_AddWidth(fontdef:THPDF_FontDef; widths:PHPDF_CID_Width):THPDF_STATUS;cdecl;external libhpdf;
function HPDF_CIDFontDef_GetCIDWidth(fontdef:THPDF_FontDef; cid:THPDF_UINT16):THPDF_INT16;cdecl;external libhpdf;
function HPDF_CIDFontDef_ChangeStyle(fontdef:THPDF_FontDef; bold:THPDF_BOOL; italic:THPDF_BOOL):THPDF_STATUS;cdecl;external libhpdf;
{ C++ end of extern C conditionnal removed }
{ __cplusplus  }
{$endif}
{ _HPDF_FONTDEF_H  }

// === Konventiert am: 28-1-26 14:02:31 ===


implementation



end.
