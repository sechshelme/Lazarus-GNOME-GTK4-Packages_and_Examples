{$IFDEF read_interface}


{
 * Copyright (c) 2015, Collabora Ltd.
 *
 * Redistribution and use in source and binary forms, with or without modification,
 * are permitted provided that the following conditions are met:
 *
 * 1. Redistributions of source code must retain the above copyright notice, this
 * list of conditions and the following disclaimer.
 *
 * 2. Redistributions in binary form must reproduce the above copyright notice, this
 * list of conditions and the following disclaimer in the documentation and/or other
 * materials provided with the distribution.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
 * IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT,
 * INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
 * NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
 * PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
 * WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY
 * OF SUCH DAMAGE.
  }
{$ifndef __GST_SCTP_RECEIVE_META_H__}
{$define __GST_SCTP_RECEIVE_META_H__}
{$include <gst/gst.h>}
{$include <gst/sctp/sctp-prelude.h>}

{ was #define dname def_expr }
function GST_SCTP_RECEIVE_META_INFO : longint; { return type might be wrong }

type
  PGstSctpReceiveMeta = ^TGstSctpReceiveMeta;
  TGstSctpReceiveMeta = record
      meta : TGstMeta;
      ppid : Tguint32;
    end;


function gst_sctp_receive_meta_api_get_type:TGType;cdecl;external libgstsctp;
function gst_sctp_receive_meta_get_info:PGstMetaInfo;cdecl;external libgstsctp;
function gst_sctp_buffer_add_receive_meta(buffer:PGstBuffer; ppid:Tguint32):PGstSctpReceiveMeta;cdecl;external libgstsctp;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function gst_sctp_buffer_get_receive_meta(b : longint) : PGstSctpReceiveMeta;

{$endif}
{ __GST_SCTP_RECEIVE_META_H__  }

// === Konventiert am: 27-7-26 13:27:28 ===

function GST_SCTP_RECEIVE_META_API_TYPE : TGType;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_SCTP_RECEIVE_META_API_TYPE : TGType;
  begin
    GST_SCTP_RECEIVE_META_API_TYPE:=gst_sctp_receive_meta_api_get_type;
  end;


{ was #define dname def_expr }
function GST_SCTP_RECEIVE_META_INFO : longint; { return type might be wrong }
  begin
    GST_SCTP_RECEIVE_META_INFO:=gst_sctp_receive_meta_get_info;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function gst_sctp_buffer_get_receive_meta(b : longint) : PGstSctpReceiveMeta;
begin
  gst_sctp_buffer_get_receive_meta:=PGstSctpReceiveMeta(gst_buffer_get_meta(b,GST_SCTP_RECEIVE_META_API_TYPE));
end;


{$ENDIF read_implementation}
