
unit gstaudiocdsrc;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstaudiocdsrc.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstaudiocdsrc.h
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
Pgchar  = ^gchar;
PGstAudioCdSrc  = ^GstAudioCdSrc;
PGstAudioCdSrcClass  = ^GstAudioCdSrcClass;
PGstAudioCdSrcMode  = ^GstAudioCdSrcMode;
PGstAudioCdSrcPrivate  = ^GstAudioCdSrcPrivate;
PGstAudioCdSrcTrack  = ^GstAudioCdSrcTrack;
PGstBuffer  = ^GstBuffer;
PGstTagList  = ^GstTagList;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer Audio CD Source Base Class
 * Copyright (C) 2005 Tim-Philipp Müller <tim centricular net>
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
{$ifndef __GST_AUDIO_AUDIO_H__}
{$include <gst/audio/audio.h>}
{$endif}
{$ifndef __GST_AUDIO_CD_SRC_H__}
{$define __GST_AUDIO_CD_SRC_H__}
{$include <gst/gst.h>}
{$include <gst/base/gstpushsrc.h>}

{ was #define dname def_expr }
function GST_TYPE_AUDIO_CD_SRC : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_CD_SRC(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_CD_SRC_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_AUDIO_CD_SRC(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_AUDIO_CD_SRC_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_CD_SRC_GET_CLASS(obj : longint) : longint;

type
{*
 * GstAudioCdSrcMode:
 * @GST_AUDIO_CD_SRC_MODE_NORMAL     : each single track is a stream
 * @GST_AUDIO_CD_SRC_MODE_CONTINUOUS : the entire disc is a single stream
 *
 * Mode in which the CD audio source operates. Influences timestamping,
 * EOS handling and seeking.
  }
{ stream = one track   }
{ stream = whole disc  }

  PGstAudioCdSrcMode = ^TGstAudioCdSrcMode;
  TGstAudioCdSrcMode =  Longint;
  Const
    GST_AUDIO_CD_SRC_MODE_NORMAL = 0;
    GST_AUDIO_CD_SRC_MODE_CONTINUOUS = 1;
;
{*
 * GstAudioCdSrcTrack:
 * @is_audio: Whether this is an audio track
 * @num: Track number in TOC (usually starts from 1, but not always)
 * @start: The first sector of this track (LBA)
 * @end: The last sector of this track (LBA)
 * @tags: Track-specific tags (e.g. from cd-text information), or NULL
 *
 * CD track abstraction to communicate TOC entries to the base class.
 *
 * This structure is only for use by sub-classed in connection with
 * gst_audio_cd_src_add_track().
 *
 * Applications will be informed of the available tracks via a TOC message
 * on the pipeline's #GstBus instead.
  }
{ FIXME 2.0: remove this struct and pass values directly to _add_track()  }
{ TRUE if this is an audio track              }
{ real track number (usually starts from 1)   }
{ first sector of track (LBA, not LSN!)       }
{ last sector of track  (LBA, not LSN!)       }
{ NULL or tags for track (e.g. from cd-text)  }
{< private > }
type
  PGstAudioCdSrcTrack = ^TGstAudioCdSrcTrack;
  TGstAudioCdSrcTrack = record
      is_audio : Tgboolean;
      num : Tguint;
      start : Tguint;
      end : Tguint;
      tags : PGstTagList;
      _gst_reserved1 : array[0..(GST_PADDING/2)-1] of Tguint;
      _gst_reserved2 : array[0..(GST_PADDING/2)-1] of Tgpointer;
    end;

{< protected > }{ for use by sub-classes only  }
{ tags that apply to all tracks    }
{< private > }
{< private > }
  PGstAudioCdSrc = ^TGstAudioCdSrc;
  TGstAudioCdSrc = record
      pushsrc : TGstPushSrc;
      tags : PGstTagList;
      priv : PGstAudioCdSrcPrivate;
      _gst_reserved1 : array[0..(GST_PADDING/2)-1] of Tguint;
      _gst_reserved2 : array[0..(GST_PADDING/2)-1] of Tgpointer;
    end;

{*
 * GstAudioCdSrcClass:
 * @pushsrc_class: the parent class
 * @open: opening the device
 * @close: closing the device
 * @read_sector: reading a sector
 * @get_default_device: getting the default device
 * @probe_devices: probing possible devices
 *
 * Audio CD source base class.
  }
{ open/close the CD device  }
(* Const before type ignored *)
{ read one sector (LBA)  }
{$if 0}
{ return default device or NULL (optional)  }
{ return NULL-terminated string array of CD devices, or NULL (optional)  }
{ FIXME 0.11: reconsider for new probing/device discovery API, remove if in doubt  }
{$endif}
{< private > }
type
  PGstAudioCdSrcClass = ^TGstAudioCdSrcClass;
  TGstAudioCdSrcClass = record
      pushsrc_class : TGstPushSrcClass;
      open : function (src:PGstAudioCdSrc; device:Pgchar):Tgboolean;cdecl;
      close : procedure (src:PGstAudioCdSrc);cdecl;
      read_sector : function (src:PGstAudioCdSrc; sector:Tgint):PGstBuffer;cdecl;
      get_default_device : function (src:PGstAudioCdSrc):Pgchar;cdecl;
      probe_devices : function (src:PGstAudioCdSrc):PPgchar;cdecl;
      _gst_reserved : array[0..(GST_PADDING_LARGE)-1] of Tgpointer;
    end;


function gst_audio_cd_src_get_type:TGType;cdecl;external;
function gst_audio_cd_src_add_track(src:PGstAudioCdSrc; track:PGstAudioCdSrcTrack):Tgboolean;cdecl;external;
{//////////////G_DEFINE_AUTOPTR_CLEANUP_FUNC        (GstAudioCdSrc, gst_object_unref) }
{$endif}
{ __GST_AUDIO_CD_SRC_H__  }

implementation

{ was #define dname def_expr }
function GST_TYPE_AUDIO_CD_SRC : longint; { return type might be wrong }
  begin
    GST_TYPE_AUDIO_CD_SRC:=gst_audio_cd_src_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_CD_SRC(obj : longint) : longint;
begin
  GST_AUDIO_CD_SRC:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_AUDIO_CD_SRC,GstAudioCdSrc);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_CD_SRC_CLASS(klass : longint) : longint;
begin
  GST_AUDIO_CD_SRC_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_AUDIO_CD_SRC,GstAudioCdSrcClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_AUDIO_CD_SRC(obj : longint) : longint;
begin
  GST_IS_AUDIO_CD_SRC:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_AUDIO_CD_SRC);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_AUDIO_CD_SRC_CLASS(klass : longint) : longint;
begin
  GST_IS_AUDIO_CD_SRC_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_AUDIO_CD_SRC);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_CD_SRC_GET_CLASS(obj : longint) : longint;
begin
  GST_AUDIO_CD_SRC_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GST_TYPE_AUDIO_CD_SRC,GstAudioCdSrcClass);
end;


end.
