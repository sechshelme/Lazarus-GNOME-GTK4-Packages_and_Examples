unit gstlcevcmeta;

interface

uses
  fp_glib2, fp_gst;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer LCEVC meta
 *  Copyright (C) <2024> V-Nova International Limited
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Library General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Library General Public License for more details.
 *
 * You should have received a copy of the GNU Library General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 51 Franklin St, Fifth Floor,
 * Boston, MA 02110-1301, USA.
  }
{$ifndef __GST_LCEVC_META_H__}
{$define __GST_LCEVC_META_H__}
{$include <gst/gst.h>}
{$include <gst/codecparsers/codecparsers-prelude.h>}

{ was #define dname def_expr }
function GST_LCEVC_META_INFO : longint; { return type might be wrong }

type

const
  GST_CAPS_FEATURE_META_GST_LCEVC_META = 'meta:GstLcevcMeta';  
{*
 * GstLcevcMeta:
 * @meta: parent #GstMeta
 * @id: the id of the LCEVC meta
 * @enhancement_data: the parsed LCEVC enhancement data
 *
 * LCEVC data for LCEVC codecs
 *
 * Since: 1.26
  }
type
  PGstLcevcMeta = ^TGstLcevcMeta;
  TGstLcevcMeta = record
      meta : TGstMeta;
      id : Tgint;
      enhancement_data : PGstBuffer;
    end;


function gst_lcevc_meta_api_get_type:TGType;cdecl;external libgstcodecparsers;
function gst_lcevc_meta_get_info:PGstMetaInfo;cdecl;external libgstcodecparsers;
function gst_buffer_get_lcevc_meta(buffer:PGstBuffer):PGstLcevcMeta;cdecl;external libgstcodecparsers;
function gst_buffer_get_lcevc_meta_id(buffer:PGstBuffer; id:Tgint):PGstLcevcMeta;cdecl;external libgstcodecparsers;
function gst_buffer_add_lcevc_meta(buffer:PGstBuffer; enhancement_data:PGstBuffer):PGstLcevcMeta;cdecl;external libgstcodecparsers;
{$endif}
{ __GST_VIDEO_META_H__  }

// === Konventiert am: 21-7-26 17:01:35 ===

function GST_LCEVC_META_API_TYPE : TGType;

implementation

function GST_LCEVC_META_API_TYPE : TGType;
  begin
    GST_LCEVC_META_API_TYPE:=gst_lcevc_meta_api_get_type;
  end;


{ was #define dname def_expr }
function GST_LCEVC_META_INFO : longint; { return type might be wrong }
  begin
    GST_LCEVC_META_INFO:=gst_lcevc_meta_get_info;
  end;


end.
