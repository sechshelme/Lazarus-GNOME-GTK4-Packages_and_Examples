{$IFDEF read_interface}


{
 * ISO File Format parsing library
 *
 * gstisoff.h
 *
 * Copyright (C) 2015 Samsung Electronics. All rights reserved.
 *   Author: Thiago Santos <thiagoss@osg.samsung.com>
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Library General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Library General Public License for more details.
 *
 * You should have received a copy of the GNU Library General Public
 * License along with this library (COPYING); if not, write to the
 * Free Software Foundation, Inc., 59 Temple Place - Suite 330,
 * Boston, MA 02111-1307, USA.
  }
{$ifndef __GST_ISOFF_H__}
{$define __GST_ISOFF_H__}
{$include <gst/gst.h>}
{$include <gst/base/base.h>}
type
  PGstIsoffParserResult = ^TGstIsoffParserResult;
  TGstIsoffParserResult =  Longint;
  Const
    GST_ISOFF_PARSER_OK = 0;
    GST_ISOFF_PARSER_DONE = 1;
    GST_ISOFF_PARSER_UNEXPECTED = 2;
    GST_ISOFF_PARSER_ERROR = 3;
;

function gst_isoff_parse_box_header(reader:PGstByteReader; _type:Pguint32; extended_type:array[0..15] of Tguint8; header_size:Pguint; size:Pguint64):Tgboolean;cdecl;external libgstisoff;
{ was #define dname def_expr }
function GST_ISOFF_FOURCC_UUID : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_ISOFF_FOURCC_MOOF : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_ISOFF_FOURCC_MFHD : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_ISOFF_FOURCC_TFHD : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_ISOFF_FOURCC_TRUN : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_ISOFF_FOURCC_TRAF : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_ISOFF_FOURCC_TFDT : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_ISOFF_FOURCC_MDAT : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_ISOFF_FOURCC_MOOV : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_ISOFF_FOURCC_TRAK : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_ISOFF_FOURCC_TKHD : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_ISOFF_FOURCC_MDIA : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_ISOFF_FOURCC_MDHD : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_ISOFF_FOURCC_HDLR : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_ISOFF_FOURCC_SIDX : longint; { return type might be wrong }

{ handler type  }
{ was #define dname def_expr }
function GST_ISOFF_FOURCC_SOUN : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_ISOFF_FOURCC_VIDE : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_ISOFF_SAMPLE_FLAGS_IS_LEADING(flags : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_ISOFF_SAMPLE_FLAGS_SAMPLE_DEPENDS_ON(flags : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_ISOFF_SAMPLE_FLAGS_SAMPLE_IS_DEPENDED_ON(flags : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_ISOFF_SAMPLE_FLAGS_SAMPLE_HAS_REDUNDANCY(flags : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_ISOFF_SAMPLE_FLAGS_SAMPLE_PADDING_VALUE(flags : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_ISOFF_SAMPLE_FLAGS_SAMPLE_IS_NON_SYNC_SAMPLE(flags : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_ISOFF_SAMPLE_FLAGS_SAMPLE_DEGRADATION_PRIORITY(flags : longint) : longint;

{ Smooth-Streaming specific boxes  }
type
  PGstTfxdBox = ^TGstTfxdBox;
  TGstTfxdBox = record
      version : Tguint8;
      flags : Tguint32;
      time : Tguint64;
      duration : Tguint64;
    end;

  PGstTfrfBoxEntry = ^TGstTfrfBoxEntry;
  TGstTfrfBoxEntry = record
      time : Tguint64;
      duration : Tguint64;
    end;

  PGstTfrfBox = ^TGstTfrfBox;
  TGstTfrfBox = record
      version : Tguint8;
      flags : Tguint32;
      entries_count : Tgint;
      entries : PGArray;
    end;
{ Common boxes  }

  PGstMfhdBox = ^TGstMfhdBox;
  TGstMfhdBox = record
      sequence_number : Tguint32;
    end;

  PGstTfhdFlags = ^TGstTfhdFlags;
  TGstTfhdFlags =  Longint;
  Const
    GST_TFHD_FLAGS_BASE_DATA_OFFSET_PRESENT = $000001;
    GST_TFHD_FLAGS_SAMPLE_DESCRIPTION_INDEX_PRESENT = $000002;
    GST_TFHD_FLAGS_DEFAULT_SAMPLE_DURATION_PRESENT = $000008;
    GST_TFHD_FLAGS_DEFAULT_SAMPLE_SIZE_PRESENT = $000010;
    GST_TFHD_FLAGS_DEFAULT_SAMPLE_FLAGS_PRESENT = $000020;
    GST_TFHD_FLAGS_DURATION_IS_EMPTY = $010000;
    GST_TFHD_FLAGS_DEFAULT_BASE_IS_MOOF = $020000;
;
{ optional  }
type
  PGstTfhdBox = ^TGstTfhdBox;
  TGstTfhdBox = record
      version : Tguint8;
      flags : TGstTfhdFlags;
      track_id : Tguint32;
      base_data_offset : Tguint64;
      sample_description_index : Tguint32;
      default_sample_duration : Tguint32;
      default_sample_size : Tguint32;
      default_sample_flags : Tguint32;
    end;

  PGstTrunFlags = ^TGstTrunFlags;
  TGstTrunFlags =  Longint;
  Const
    GST_TRUN_FLAGS_DATA_OFFSET_PRESENT = $000001;
    GST_TRUN_FLAGS_FIRST_SAMPLE_FLAGS_PRESENT = $000004;
    GST_TRUN_FLAGS_SAMPLE_DURATION_PRESENT = $000100;
    GST_TRUN_FLAGS_SAMPLE_SIZE_PRESENT = $000200;
    GST_TRUN_FLAGS_SAMPLE_FLAGS_PRESENT = $000400;
    GST_TRUN_FLAGS_SAMPLE_COMPOSITION_TIME_OFFSETS_PRESENT = $000800;
;
{ optional  }
type
  PGstTrunBox = ^TGstTrunBox;
  TGstTrunBox = record
      version : Tguint8;
      flags : TGstTrunFlags;
      sample_count : Tguint32;
      data_offset : Tgint32;
      first_sample_flags : Tguint32;
      samples : PGArray;
    end;
{ version 0  }
{ others  }

  PGstTrunSample = ^TGstTrunSample;
  TGstTrunSample = record
      sample_duration : Tguint32;
      sample_size : Tguint32;
      sample_flags : Tguint32;
      sample_composition_time_offset : record
          case longint of
            0 : ( u : Tguint32 );
            1 : ( s : Tgint32 );
          end;
    end;

  PGstTdftBox = ^TGstTdftBox;
  TGstTdftBox = record
      decode_time : Tguint64;
    end;
  TGstTfdtBox = TGstTdftBox;
  PGstTfdtBox = ^TGstTfdtBox;
{ smooth-streaming specific  }

  PGstTrafBox = ^TGstTrafBox;
  TGstTrafBox = record
      tfhd : TGstTfhdBox;
      tfdt : TGstTfdtBox;
      trun : PGArray;
      tfrf : PGstTfrfBox;
      tfxd : PGstTfxdBox;
    end;

  PGstMoofBox = ^TGstMoofBox;
  TGstMoofBox = record
      mfhd : TGstMfhdBox;
      traf : PGArray;
    end;

function gst_isoff_moof_box_parse(reader:PGstByteReader):PGstMoofBox;cdecl;external libgstisoff;
procedure gst_isoff_moof_box_free(moof:PGstMoofBox);cdecl;external libgstisoff;
type
  PGstTkhdBox = ^TGstTkhdBox;
  TGstTkhdBox = record
      track_id : Tguint32;
    end;

  PGstMdhdBox = ^TGstMdhdBox;
  TGstMdhdBox = record
      timescale : Tguint32;
    end;

  PGstHdlrBox = ^TGstHdlrBox;
  TGstHdlrBox = record
      handler_type : Tguint32;
    end;

  PGstMdiaBox = ^TGstMdiaBox;
  TGstMdiaBox = record
      mdhd : TGstMdhdBox;
      hdlr : TGstHdlrBox;
    end;

  PGstTrakBox = ^TGstTrakBox;
  TGstTrakBox = record
      tkhd : TGstTkhdBox;
      mdia : TGstMdiaBox;
    end;

  PGstMoovBox = ^TGstMoovBox;
  TGstMoovBox = record
      trak : PGArray;
    end;

function gst_isoff_moov_box_parse(reader:PGstByteReader):PGstMoovBox;cdecl;external libgstisoff;
procedure gst_isoff_moov_box_free(moov:PGstMoovBox);cdecl;external libgstisoff;
type
  PGstSidxBoxEntry = ^TGstSidxBoxEntry;
  TGstSidxBoxEntry = record
      ref_type : Tgboolean;
      size : Tguint32;
      duration : TGstClockTime;
      starts_with_sap : Tgboolean;
      sap_type : Tguint8;
      sap_delta_time : Tguint32;
      offset : Tguint64;
      pts : TGstClockTime;
    end;

  PGstSidxBox = ^TGstSidxBox;
  TGstSidxBox = record
      version : Tguint8;
      flags : Tguint32;
      ref_id : Tguint32;
      timescale : Tguint32;
      earliest_pts : Tguint64;
      first_offset : Tguint64;
      entry_index : Tgint;
      entries_count : Tgint;
      entries : PGstSidxBoxEntry;
    end;

  PGstSidxParserStatus = ^TGstSidxParserStatus;
  TGstSidxParserStatus =  Longint;
  Const
    GST_ISOFF_SIDX_PARSER_INIT = 0;
    GST_ISOFF_SIDX_PARSER_HEADER = 1;
    GST_ISOFF_SIDX_PARSER_DATA = 2;
    GST_ISOFF_SIDX_PARSER_FINISHED = 3;
;
type
  PGstSidxParser = ^TGstSidxParser;
  TGstSidxParser = record
      status : TGstSidxParserStatus;
      size : Tguint64;
      cumulative_entry_size : Tguint64;
      cumulative_pts : Tguint64;
      sidx : TGstSidxBox;
    end;

procedure gst_isoff_sidx_parser_init(parser:PGstSidxParser);cdecl;external libgstisoff;
procedure gst_isoff_sidx_parser_clear(parser:PGstSidxParser);cdecl;external libgstisoff;
function gst_isoff_sidx_parser_parse(parser:PGstSidxParser; reader:PGstByteReader; consumed:Pguint):TGstIsoffParserResult;cdecl;external libgstisoff;
function gst_isoff_sidx_parser_add_buffer(parser:PGstSidxParser; buf:PGstBuffer; consumed:Pguint):TGstIsoffParserResult;cdecl;external libgstisoff;
{$endif}
{ __GST_ISOFF_H__  }

// === Konventiert am: 27-7-26 13:16:26 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{ was #define dname def_expr }
function GST_ISOFF_FOURCC_UUID : longint; { return type might be wrong }
  begin
    GST_ISOFF_FOURCC_UUID:=GST_MAKE_FOURCC('u','u','i','d');
  end;

{ was #define dname def_expr }
function GST_ISOFF_FOURCC_MOOF : longint; { return type might be wrong }
  begin
    GST_ISOFF_FOURCC_MOOF:=GST_MAKE_FOURCC('m','o','o','f');
  end;

{ was #define dname def_expr }
function GST_ISOFF_FOURCC_MFHD : longint; { return type might be wrong }
  begin
    GST_ISOFF_FOURCC_MFHD:=GST_MAKE_FOURCC('m','f','h','d');
  end;

{ was #define dname def_expr }
function GST_ISOFF_FOURCC_TFHD : longint; { return type might be wrong }
  begin
    GST_ISOFF_FOURCC_TFHD:=GST_MAKE_FOURCC('t','f','h','d');
  end;

{ was #define dname def_expr }
function GST_ISOFF_FOURCC_TRUN : longint; { return type might be wrong }
  begin
    GST_ISOFF_FOURCC_TRUN:=GST_MAKE_FOURCC('t','r','u','n');
  end;

{ was #define dname def_expr }
function GST_ISOFF_FOURCC_TRAF : longint; { return type might be wrong }
  begin
    GST_ISOFF_FOURCC_TRAF:=GST_MAKE_FOURCC('t','r','a','f');
  end;

{ was #define dname def_expr }
function GST_ISOFF_FOURCC_TFDT : longint; { return type might be wrong }
  begin
    GST_ISOFF_FOURCC_TFDT:=GST_MAKE_FOURCC('t','f','d','t');
  end;

{ was #define dname def_expr }
function GST_ISOFF_FOURCC_MDAT : longint; { return type might be wrong }
  begin
    GST_ISOFF_FOURCC_MDAT:=GST_MAKE_FOURCC('m','d','a','t');
  end;

{ was #define dname def_expr }
function GST_ISOFF_FOURCC_MOOV : longint; { return type might be wrong }
  begin
    GST_ISOFF_FOURCC_MOOV:=GST_MAKE_FOURCC('m','o','o','v');
  end;

{ was #define dname def_expr }
function GST_ISOFF_FOURCC_TRAK : longint; { return type might be wrong }
  begin
    GST_ISOFF_FOURCC_TRAK:=GST_MAKE_FOURCC('t','r','a','k');
  end;

{ was #define dname def_expr }
function GST_ISOFF_FOURCC_TKHD : longint; { return type might be wrong }
  begin
    GST_ISOFF_FOURCC_TKHD:=GST_MAKE_FOURCC('t','k','h','d');
  end;

{ was #define dname def_expr }
function GST_ISOFF_FOURCC_MDIA : longint; { return type might be wrong }
  begin
    GST_ISOFF_FOURCC_MDIA:=GST_MAKE_FOURCC('m','d','i','a');
  end;

{ was #define dname def_expr }
function GST_ISOFF_FOURCC_MDHD : longint; { return type might be wrong }
  begin
    GST_ISOFF_FOURCC_MDHD:=GST_MAKE_FOURCC('m','d','h','d');
  end;

{ was #define dname def_expr }
function GST_ISOFF_FOURCC_HDLR : longint; { return type might be wrong }
  begin
    GST_ISOFF_FOURCC_HDLR:=GST_MAKE_FOURCC('h','d','l','r');
  end;

{ was #define dname def_expr }
function GST_ISOFF_FOURCC_SIDX : longint; { return type might be wrong }
  begin
    GST_ISOFF_FOURCC_SIDX:=GST_MAKE_FOURCC('s','i','d','x');
  end;

{ was #define dname def_expr }
function GST_ISOFF_FOURCC_SOUN : longint; { return type might be wrong }
  begin
    GST_ISOFF_FOURCC_SOUN:=GST_MAKE_FOURCC('s','o','u','n');
  end;

{ was #define dname def_expr }
function GST_ISOFF_FOURCC_VIDE : longint; { return type might be wrong }
  begin
    GST_ISOFF_FOURCC_VIDE:=GST_MAKE_FOURCC('v','i','d','e');
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_ISOFF_SAMPLE_FLAGS_IS_LEADING(flags : longint) : longint;
begin
  GST_ISOFF_SAMPLE_FLAGS_IS_LEADING:=(flags shr 26) and $03;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_ISOFF_SAMPLE_FLAGS_SAMPLE_DEPENDS_ON(flags : longint) : longint;
begin
  GST_ISOFF_SAMPLE_FLAGS_SAMPLE_DEPENDS_ON:=(flags shr 24) and $03;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_ISOFF_SAMPLE_FLAGS_SAMPLE_IS_DEPENDED_ON(flags : longint) : longint;
begin
  GST_ISOFF_SAMPLE_FLAGS_SAMPLE_IS_DEPENDED_ON:=(flags shr 22) and $03;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_ISOFF_SAMPLE_FLAGS_SAMPLE_HAS_REDUNDANCY(flags : longint) : longint;
begin
  GST_ISOFF_SAMPLE_FLAGS_SAMPLE_HAS_REDUNDANCY:=(flags shr 20) and $03;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_ISOFF_SAMPLE_FLAGS_SAMPLE_PADDING_VALUE(flags : longint) : longint;
begin
  GST_ISOFF_SAMPLE_FLAGS_SAMPLE_PADDING_VALUE:=(flags shr 17) and $07;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_ISOFF_SAMPLE_FLAGS_SAMPLE_IS_NON_SYNC_SAMPLE(flags : longint) : longint;
begin
  GST_ISOFF_SAMPLE_FLAGS_SAMPLE_IS_NON_SYNC_SAMPLE:=(flags shr 16) and $01;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_ISOFF_SAMPLE_FLAGS_SAMPLE_DEGRADATION_PRIORITY(flags : longint) : longint;
begin
  GST_ISOFF_SAMPLE_FLAGS_SAMPLE_DEGRADATION_PRIORITY:=(flags shr 0) and $0f;
end;


{$ENDIF read_implementation}
