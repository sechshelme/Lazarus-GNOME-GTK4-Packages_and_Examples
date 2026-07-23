unit missing_plugins;

interface

uses
  fp_glib2, fp_gst;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer base utils library missing plugins support
 * Copyright (C) 2006 Tim-Philipp Müller <tim centricular net>
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
{$ifndef __GST_PB_UTILS_MISSING_PLUGINS_H__}
{$define __GST_PB_UTILS_MISSING_PLUGINS_H__}
{$include <gst/gst.h>}
{$include <gst/pbutils/pbutils-prelude.h>}
{
 * functions to create missing-plugin messages, for use by plugins primarily
  }

function gst_missing_uri_source_message_new(element:PGstElement; protocol:Pgchar):PGstMessage;cdecl;external libgstpbutils;
function gst_missing_uri_sink_message_new(element:PGstElement; protocol:Pgchar):PGstMessage;cdecl;external libgstpbutils;
function gst_missing_element_message_new(element:PGstElement; factory_name:Pgchar):PGstMessage;cdecl;external libgstpbutils;
function gst_missing_decoder_message_new(element:PGstElement; decode_caps:PGstCaps):PGstMessage;cdecl;external libgstpbutils;
function gst_missing_encoder_message_new(element:PGstElement; encode_caps:PGstCaps):PGstMessage;cdecl;external libgstpbutils;
procedure gst_missing_plugin_message_set_stream_id(msg:PGstMessage; stream_id:Pgchar);cdecl;external libgstpbutils;
function gst_missing_plugin_message_get_stream_id(msg:PGstMessage):Pgchar;cdecl;external libgstpbutils;
{
 * functions for use by applications when dealing with missing-plugin messages
  }
function gst_missing_plugin_message_get_installer_detail(msg:PGstMessage):Pgchar;cdecl;external libgstpbutils;
function gst_missing_plugin_message_get_description(msg:PGstMessage):Pgchar;cdecl;external libgstpbutils;
function gst_is_missing_plugin_message(msg:PGstMessage):Tgboolean;cdecl;external libgstpbutils;
{
 * functions for use by applications that know exactly what plugins they are
 * missing and want to request them directly rather than just react to
 * missing-plugin messages posted by elements such as playbin or decodebin
  }
function gst_missing_uri_source_installer_detail_new(protocol:Pgchar):Pgchar;cdecl;external libgstpbutils;
function gst_missing_uri_sink_installer_detail_new(protocol:Pgchar):Pgchar;cdecl;external libgstpbutils;
function gst_missing_element_installer_detail_new(factory_name:Pgchar):Pgchar;cdecl;external libgstpbutils;
function gst_missing_decoder_installer_detail_new(decode_caps:PGstCaps):Pgchar;cdecl;external libgstpbutils;
function gst_missing_encoder_installer_detail_new(encode_caps:PGstCaps):Pgchar;cdecl;external libgstpbutils;
{$endif}
{ __GST_PB_UTILS_MISSING_PLUGINS_H__  }

// === Konventiert am: 23-7-26 19:45:28 ===


implementation



end.
