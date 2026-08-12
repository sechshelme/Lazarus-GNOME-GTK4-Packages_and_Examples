
unit gegl_audio_fragment;
interface

{
  Automatically converted by H2Pas 1.0.0 from gegl_audio_fragment.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gegl_audio_fragment.h
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
PGeglAudioFragment  = ^GeglAudioFragment;
PGeglAudioFragmentClass  = ^GeglAudioFragmentClass;
PGeglAudioFragmentPrivate  = ^GeglAudioFragmentPrivate;
PGParamSpec  = ^GParamSpec;
Psingle  = ^single;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ This file is part of GEGL
 *
 * GEGL is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 3 of the License, or (at your option) any later version.
 *
 * GEGL is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with GEGL; if not, see <https://www.gnu.org/licenses/>.
 *
 * Copyright   2015 OEyvind Kolaas   <pippin@gimp.org>
  }
{$ifndef __GEGL_AUDIO_FRAGMENT_H__}
{$define __GEGL_AUDIO_FRAGMENT_H__}
{$include <glib-object.h>}

{ was #define dname def_expr }
function GEGL_TYPE_AUDIO_FRAGMENT : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEGL_AUDIO_FRAGMENT(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEGL_AUDIO_FRAGMENT_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEGL_IS_AUDIO(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEGL_IS_AUDIO_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEGL_AUDIO_FRAGMENT_GET_CLASS(obj : longint) : longint;

type

const
  GEGL_MAX_AUDIO_CHANNELS = 8;  
{ the values for channel_layout are designed to match and be compatible with
 * the ones in ffmpegs libavutil
  }
  GEGL_CH_FRONT_LEFT = $00000001;  
  GEGL_CH_FRONT_RIGHT = $00000002;  
  GEGL_CH_FRONT_CENTER = $00000004;  
  GEGL_CH_LOW_FREQUENCY = $00000008;  
  GEGL_CH_BACK_LEFT = $00000010;  
  GEGL_CH_BACK_RIGHT = $00000020;  
  GEGL_CH_FRONT_LEFT_OF_CENTER = $00000040;  
  GEGL_CH_FRONT_RIGHT_OF_CENTER = $00000080;  
  GEGL_CH_BACK_CENTER = $00000100;  
  GEGL_CH_SIDE_LEFT = $00000200;  
  GEGL_CH_SIDE_RIGHT = $00000400;  
  GEGL_CH_TOP_CENTER = $00000800;  
  GEGL_CH_TOP_FRONT_LEFT = $00001000;  
  GEGL_CH_TOP_FRONT_CENTER = $00002000;  
  GEGL_CH_TOP_FRONT_RIGHT = $00004000;  
  GEGL_CH_TOP_BACK_LEFT = $00008000;  
  GEGL_CH_TOP_BACK_CENTER = $00010000;  
  GEGL_CH_TOP_BACK_RIGHT = $00020000;  
  GEGL_CH_STEREO_LEFT = $20000000;  {/< Stereo downmix. }
  GEGL_CH_STEREO_RIGHT = $40000000;  {/< See GEGL_CH_STEREO_LEFT. }
  GEGL_CH_WIDE_LEFT = $0000000080000000;  
  GEGL_CH_WIDE_RIGHT = $0000000100000000;  
  GEGL_CH_SURROUND_DIRECT_LEFT = $0000000200000000;  
  GEGL_CH_SURROUND_DIRECT_RIGHT = $0000000400000000;  
  GEGL_CH_LOW_FREQUENCY_2 = $0000000800000000;  
  GEGL_CH_LAYOUT_NATIVE = $8000000000000000;  
  GEGL_CH_LAYOUT_MONO = GEGL_CH_FRONT_CENTER;  
  GEGL_CH_LAYOUT_STEREO = GEGL_CH_FRONT_LEFT or GEGL_CH_FRONT_RIGHT;  
  GEGL_CH_LAYOUT_2POINT1 = GEGL_CH_LAYOUT_STEREO or GEGL_CH_LOW_FREQUENCY;  
  GEGL_CH_LAYOUT_2_1 = GEGL_CH_LAYOUT_STEREO or GEGL_CH_BACK_CENTER;  
  GEGL_CH_LAYOUT_SURROUND = GEGL_CH_LAYOUT_STEREO or GEGL_CH_FRONT_CENTER;  
  GEGL_CH_LAYOUT_3POINT1 = GEGL_CH_LAYOUT_SURROUND or GEGL_CH_LOW_FREQUENCY;  
  GEGL_CH_LAYOUT_4POINT0 = GEGL_CH_LAYOUT_SURROUND or GEGL_CH_BACK_CENTER;  
  GEGL_CH_LAYOUT_4POINT1 = GEGL_CH_LAYOUT_4POINT0 or GEGL_CH_LOW_FREQUENCY;  
  GEGL_CH_LAYOUT_2_2 = (GEGL_CH_LAYOUT_STEREO or GEGL_CH_SIDE_LEFT) or GEGL_CH_SIDE_RIGHT;  
  GEGL_CH_LAYOUT_QUAD = (GEGL_CH_LAYOUT_STEREO or GEGL_CH_BACK_LEFT) or GEGL_CH_BACK_RIGHT;  
  GEGL_CH_LAYOUT_5POINT0 = (GEGL_CH_LAYOUT_SURROUND or GEGL_CH_SIDE_LEFT) or GEGL_CH_SIDE_RIGHT;  
  GEGL_CH_LAYOUT_5POINT1 = GEGL_CH_LAYOUT_5POINT0 or GEGL_CH_LOW_FREQUENCY;  
  GEGL_CH_LAYOUT_5POINT0_BACK = (GEGL_CH_LAYOUT_SURROUND or GEGL_CH_BACK_LEFT) or GEGL_CH_BACK_RIGHT;  
  GEGL_CH_LAYOUT_5POINT1_BACK = GEGL_CH_LAYOUT_5POINT0_BACK or GEGL_CH_LOW_FREQUENCY;  
  GEGL_CH_LAYOUT_6POINT0 = GEGL_CH_LAYOUT_5POINT0 or GEGL_CH_BACK_CENTER;  
  GEGL_CH_LAYOUT_6POINT0_FRONT = (GEGL_CH_LAYOUT_2_2 or GEGL_CH_FRONT_LEFT_OF_CENTER) or GEGL_CH_FRONT_RIGHT_OF_CENTER;  
  GEGL_CH_LAYOUT_HEXAGONAL = GEGL_CH_LAYOUT_5POINT0_BACK or GEGL_CH_BACK_CENTER;  
  GEGL_CH_LAYOUT_6POINT1 = GEGL_CH_LAYOUT_5POINT1 or GEGL_CH_BACK_CENTER;  
  GEGL_CH_LAYOUT_6POINT1_BACK = GEGL_CH_LAYOUT_5POINT1_BACK or GEGL_CH_BACK_CENTER;  
  GEGL_CH_LAYOUT_6POINT1_FRONT = GEGL_CH_LAYOUT_6POINT0_FRONT or GEGL_CH_LOW_FREQUENCY;  
  GEGL_CH_LAYOUT_7POINT0 = (GEGL_CH_LAYOUT_5POINT0 or GEGL_CH_BACK_LEFT) or GEGL_CH_BACK_RIGHT;  
  GEGL_CH_LAYOUT_7POINT0_FRONT = (GEGL_CH_LAYOUT_5POINT0 or GEGL_CH_FRONT_LEFT_OF_CENTER) or GEGL_CH_FRONT_RIGHT_OF_CENTER;  
  GEGL_CH_LAYOUT_7POINT1 = (GEGL_CH_LAYOUT_5POINT1 or GEGL_CH_BACK_LEFT) or GEGL_CH_BACK_RIGHT;  
  GEGL_CH_LAYOUT_7POINT1_WIDE = (GEGL_CH_LAYOUT_5POINT1 or GEGL_CH_FRONT_LEFT_OF_CENTER) or GEGL_CH_FRONT_RIGHT_OF_CENTER;  
  GEGL_CH_LAYOUT_7POINT1_WIDE_BACK = (GEGL_CH_LAYOUT_5POINT1_BACK or GEGL_CH_FRONT_LEFT_OF_CENTER) or GEGL_CH_FRONT_RIGHT_OF_CENTER;  
  GEGL_CH_LAYOUT_OCTAGONAL = ((GEGL_CH_LAYOUT_5POINT0 or GEGL_CH_BACK_LEFT) or GEGL_CH_BACK_CENTER) or GEGL_CH_BACK_RIGHT;  
  GEGL_CH_LAYOUT_HEXADECAGONAL = (((((((GEGL_CH_LAYOUT_OCTAGONAL or GEGL_CH_WIDE_LEFT) or GEGL_CH_WIDE_RIGHT) or GEGL_CH_TOP_BACK_LEFT) or GEGL_CH_TOP_BACK_RIGHT) or GEGL_CH_TOP_BACK_CENTER) or GEGL_CH_TOP_FRONT_CENTER) or GEGL_CH_TOP_FRONT_LEFT) or GEGL_CH_TOP_FRONT_RIGHT;  
  GEGL_CH_LAYOUT_STEREO_DOWNMIX = GEGL_CH_STEREO_LEFT or GEGL_CH_STEREO_RIGHT;  
type
  PGeglAudioFragment = ^TGeglAudioFragment;
  TGeglAudioFragment = record
      parent_instance : TGObject;
      data : array[0..(GEGL_MAX_AUDIO_CHANNELS)-1] of Psingle;
      priv : PGeglAudioFragmentPrivate;
    end;

  PGeglAudioFragmentClass = ^TGeglAudioFragmentClass;
  TGeglAudioFragmentClass = record
      parent_class : TGObjectClass;
    end;


function gegl_audio_fragment_get_type:TGType;cdecl;external;
function gegl_audio_fragment_new(sample_rate:longint; channels:longint; channel_layout:longint; max_samples:longint):PGeglAudioFragment;cdecl;external;
procedure gegl_audio_fragment_set_max_samples(audio:PGeglAudioFragment; max_samples:longint);cdecl;external;
procedure gegl_audio_fragment_set_sample_rate(audio:PGeglAudioFragment; sample_rate:longint);cdecl;external;
procedure gegl_audio_fragment_set_channels(audio:PGeglAudioFragment; channels:longint);cdecl;external;
procedure gegl_audio_fragment_set_channel_layout(audio:PGeglAudioFragment; channel_layout:longint);cdecl;external;
procedure gegl_audio_fragment_set_sample_count(audio:PGeglAudioFragment; sample_count:longint);cdecl;external;
procedure gegl_audio_fragment_set_pos(audio:PGeglAudioFragment; pos:longint);cdecl;external;
function gegl_audio_fragment_get_max_samples(audio:PGeglAudioFragment):longint;cdecl;external;
function gegl_audio_fragment_get_sample_rate(audio:PGeglAudioFragment):longint;cdecl;external;
function gegl_audio_fragment_get_channels(audio:PGeglAudioFragment):longint;cdecl;external;
function gegl_audio_fragment_get_sample_count(audio:PGeglAudioFragment):longint;cdecl;external;
function gegl_audio_fragment_get_pos(audio:PGeglAudioFragment):longint;cdecl;external;
function gegl_audio_fragment_get_channel_layout(audio:PGeglAudioFragment):longint;cdecl;external;
{ was #define dname def_expr }
function GEGL_TYPE_PARAM_AUDIO_FRAGMENT : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEGL_IS_PARAM_SPEC_AUDIO_FRAGMENT(pspec : longint) : longint;

function gegl_param_audio_fragment_get_type:TGType;cdecl;external;
{*
 * gegl_param_spec_audio_fragment:
 * @name: canonical name of the property specified
 * @nick: nick name for the property specified
 * @blurb: description of the property specified
 * @flags: flags for the property specified
 *
 * Creates a new #GParamSpec instance specifying a #GeglAudioFragment property.
 *
 * Returns: (transfer full): a newly created parameter specification
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gegl_param_spec_audio_fragment(name:Pgchar; nick:Pgchar; blurb:Pgchar; flags:TGParamFlags):PGParamSpec;cdecl;external;
{$endif}
{ __GEGL_AUDIO_FRAGMENT_H__  }

implementation

{ was #define dname def_expr }
function GEGL_TYPE_AUDIO_FRAGMENT : longint; { return type might be wrong }
  begin
    GEGL_TYPE_AUDIO_FRAGMENT:=gegl_audio_fragment_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEGL_AUDIO_FRAGMENT(obj : longint) : longint;
begin
  GEGL_AUDIO_FRAGMENT:=G_TYPE_CHECK_INSTANCE_CAST(obj,GEGL_TYPE_AUDIO_FRAGMENT,GeglAudioFragment);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEGL_AUDIO_FRAGMENT_CLASS(klass : longint) : longint;
begin
  GEGL_AUDIO_FRAGMENT_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GEGL_TYPE_AUDIO_FRAGMENT,GeglAudioFragmentClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEGL_IS_AUDIO(obj : longint) : longint;
begin
  GEGL_IS_AUDIO:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GEGL_TYPE_AUDIO_FRAGMENT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEGL_IS_AUDIO_CLASS(klass : longint) : longint;
begin
  GEGL_IS_AUDIO_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GEGL_TYPE_AUDIO_FRAGMENT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEGL_AUDIO_FRAGMENT_GET_CLASS(obj : longint) : longint;
begin
  GEGL_AUDIO_FRAGMENT_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GEGL_TYPE_AUDIO_FRAGMENT,GeglAudioFragmentClass);
end;

{ was #define dname def_expr }
function GEGL_TYPE_PARAM_AUDIO_FRAGMENT : longint; { return type might be wrong }
  begin
    GEGL_TYPE_PARAM_AUDIO_FRAGMENT:=gegl_param_audio_fragment_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEGL_IS_PARAM_SPEC_AUDIO_FRAGMENT(pspec : longint) : longint;
begin
  GEGL_IS_PARAM_SPEC_AUDIO_FRAGMENT:=G_TYPE_CHECK_INSTANCE_TYPE(pspec,GEGL_TYPE_PARAM_AUDIO_FRAGMENT);
end;


end.
