unit gstprotection;

interface

uses
  fp_glib2, fp_gst;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) <2015> YouView TV Ltd.
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
{$ifndef __GST_PROTECTION_H__}
{$define __GST_PROTECTION_H__}
{$include <gst/gst.h>}
{*
 * GST_PROTECTION_SYSTEM_ID_CAPS_FIELD:
 *
 * The field name in a GstCaps that is used to signal the UUID of the protection
 * system.
 *
 * Since: 1.6
  }

const
  GST_PROTECTION_SYSTEM_ID_CAPS_FIELD = 'protection-system';  
{*
 * GST_PROTECTION_UNSPECIFIED_SYSTEM_ID:
 *
 * The protection system value of the unspecified UUID.
 * In some cases the system protection ID is not present in the contents or in their
 * metadata, as encrypted WebM.
 * This define is used to set the value of the "system_id" field in GstProtectionEvent,
 * with this value, the application will use an external information to choose which
 * protection system to use.
 *
 * Example: The matroskademux uses this value in the case of encrypted WebM,
 * the application will choose the appropriate protection system based on the information
 * received through EME API.
 *
 * Since: 1.16
  }
  GST_PROTECTION_UNSPECIFIED_SYSTEM_ID = 'unspecified-system-id';  
type
{*
 * GstProtectionMeta:
 * @meta: the parent #GstMeta.
 * @info: the cryptographic information needed to decrypt the sample.
 *
 * Metadata type that holds information about a sample from a protection-protected
 * track, including the information needed to decrypt it (if it is encrypted).
 *
 * Since: 1.6
  }
  PGstProtectionMeta = ^TGstProtectionMeta;
  TGstProtectionMeta = record
      meta : TGstMeta;
      info : PGstStructure;
    end;

{*
 * gst_protection_meta_api_get_type: (attributes doc.skip=true)
  }

function gst_protection_meta_api_get_type:TGType;cdecl;external libgstreamer;
{ was #define dname def_expr }
function GST_PROTECTION_META_API_TYPE : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function gst_buffer_get_protection_meta(b : longint) : PGstProtectionMeta;

{ was #define dname def_expr }
function GST_PROTECTION_META_INFO : longint; { return type might be wrong }

function gst_protection_meta_get_info:PGstMetaInfo;cdecl;external libgstreamer;
function gst_buffer_add_protection_meta(buffer:PGstBuffer; info:PGstStructure):PGstProtectionMeta;cdecl;external libgstreamer;
function gst_protection_select_system(system_identifiers:PPgchar):Pgchar;cdecl;external libgstreamer;
function gst_protection_filter_systems_by_available_decryptors(system_identifiers:PPgchar):^Pgchar;cdecl;external libgstreamer;
{$endif}
{ __GST_PROTECTION_META_H__  }

// === Konventiert am: 11-7-26 15:24:58 ===


implementation


{ was #define dname def_expr }
function GST_PROTECTION_META_API_TYPE : longint; { return type might be wrong }
  begin
    GST_PROTECTION_META_API_TYPE:=gst_protection_meta_api_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function gst_buffer_get_protection_meta(b : longint) : PGstProtectionMeta;
begin
  gst_buffer_get_protection_meta:=PGstProtectionMeta(gst_buffer_get_meta(b,GST_PROTECTION_META_API_TYPE));
end;

{ was #define dname def_expr }
function GST_PROTECTION_META_INFO : longint; { return type might be wrong }
  begin
    GST_PROTECTION_META_INFO:=gst_protection_meta_get_info;
  end;


end.
