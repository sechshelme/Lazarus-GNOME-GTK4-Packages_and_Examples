
unit gstmpegvideometa;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstmpegvideometa.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstmpegvideometa.h
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
PGstBuffer  = ^GstBuffer;
PGstMetaInfo  = ^GstMetaInfo;
PGstMpegVideoMeta  = ^GstMpegVideoMeta;
PGstMpegVideoPictureExt  = ^GstMpegVideoPictureExt;
PGstMpegVideoPictureHdr  = ^GstMpegVideoPictureHdr;
PGstMpegVideoQuantMatrixExt  = ^GstMpegVideoQuantMatrixExt;
PGstMpegVideoSequenceDisplayExt  = ^GstMpegVideoSequenceDisplayExt;
PGstMpegVideoSequenceExt  = ^GstMpegVideoSequenceExt;
PGstMpegVideoSequenceHdr  = ^GstMpegVideoSequenceHdr;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Gstreamer
 * Copyright (C) <2012> Edward Hervey <edward@collabora.com>
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
 * Free Software Foundation, Inc., 59 Temple Place - Suite 330,
 * Boston, MA 02111-1307, USA.
  }
{$ifndef __GST_MPEG_VIDEO_META_H__}
{$define __GST_MPEG_VIDEO_META_H__}
{$include <gst/gst.h>}
{$include <gst/codecparsers/gstmpegvideoparser.h>}
type

function gst_mpeg_video_meta_api_get_type:TGType;cdecl;external;
{ was #define dname def_expr }
function GST_MPEG_VIDEO_META_API_TYPE : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_MPEG_VIDEO_META_INFO : longint; { return type might be wrong }

(* Const before type ignored *)
function gst_mpeg_video_meta_get_info:PGstMetaInfo;cdecl;external;
{*
 * GstMpegVideoMeta:
 * @meta: parent #GstMeta
 * @sequencehdr: the #GstMpegVideoSequenceHdr if present in the buffer
 * @sequenceext: the #GstMpegVideoSequenceExt if present in the buffer
 * @sequencedispext: the #GstMpegVideoSequenceDisplayExt if present in the
 * buffer.
 * @pichdr: the #GstMpegVideoPictureHdr if present in the buffer.
 * @picext: the #GstMpegVideoPictureExt if present in the buffer.
 * @quantext: the #GstMpegVideoQuantMatrixExt if present in the buffer
 *
 * Extra buffer metadata describing the contents of a MPEG1/2 Video frame
 *
 * Can be used by elements (mainly decoders) to avoid having to parse
 * Mpeg video 1/2 packets if it can be done upstream.
 *
 * The various fields are only valid during the lifetime of the #GstMpegVideoMeta.
 * If elements wish to use those for longer, they are required to make a copy.
 *
 * Since: 1.2
  }
type
  PGstMpegVideoMeta = ^TGstMpegVideoMeta;
  TGstMpegVideoMeta = record
      meta : TGstMeta;
      sequencehdr : PGstMpegVideoSequenceHdr;
      sequenceext : PGstMpegVideoSequenceExt;
      sequencedispext : PGstMpegVideoSequenceDisplayExt;
      pichdr : PGstMpegVideoPictureHdr;
      picext : PGstMpegVideoPictureExt;
      quantext : PGstMpegVideoQuantMatrixExt;
      num_slices : Tguint;
      slice_offset : Tgsize;
    end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }

function gst_buffer_get_mpeg_video_meta(b : longint) : PGstMpegVideoMeta;

(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gst_buffer_add_mpeg_video_meta(buffer:PGstBuffer; seq_hdr:PGstMpegVideoSequenceHdr; seq_ext:PGstMpegVideoSequenceExt; disp_ext:PGstMpegVideoSequenceDisplayExt; pic_hdr:PGstMpegVideoPictureHdr; 
           pic_ext:PGstMpegVideoPictureExt; quant_ext:PGstMpegVideoQuantMatrixExt):PGstMpegVideoMeta;cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function GST_MPEG_VIDEO_META_API_TYPE : longint; { return type might be wrong }
  begin
    GST_MPEG_VIDEO_META_API_TYPE:=gst_mpeg_video_meta_api_get_type;
  end;

{ was #define dname def_expr }
function GST_MPEG_VIDEO_META_INFO : longint; { return type might be wrong }
  begin
    GST_MPEG_VIDEO_META_INFO:=gst_mpeg_video_meta_get_info;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function gst_buffer_get_mpeg_video_meta(b : longint) : PGstMpegVideoMeta;
begin
  gst_buffer_get_mpeg_video_meta:=PGstMpegVideoMeta(gst_buffer_get_meta(b,GST_MPEG_VIDEO_META_API_TYPE));
end;


end.
