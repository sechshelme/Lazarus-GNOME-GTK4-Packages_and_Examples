
unit mixer;
interface

{
  Automatically converted by H2Pas 1.0.0 from mixer.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    mixer.h
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
Pchar  = ^char;
Pdword  = ^dword;
Plongint  = ^longint;
Ppollfd  = ^pollfd;
Psnd_hctl_elem_t  = ^snd_hctl_elem_t;
Psnd_hctl_t  = ^snd_hctl_t;
Psnd_mixer_class_t  = ^snd_mixer_class_t;
Psnd_mixer_elem_t  = ^snd_mixer_elem_t;
Psnd_mixer_elem_type  = ^snd_mixer_elem_type;
Psnd_mixer_elem_type_t  = ^snd_mixer_elem_type_t;
Psnd_mixer_selem_channel_id  = ^snd_mixer_selem_channel_id;
Psnd_mixer_selem_channel_id_t  = ^snd_mixer_selem_channel_id_t;
Psnd_mixer_selem_id_t  = ^snd_mixer_selem_id_t;
Psnd_mixer_selem_regopt  = ^snd_mixer_selem_regopt;
Psnd_mixer_selem_regopt_abstract  = ^snd_mixer_selem_regopt_abstract;
Psnd_mixer_t  = ^snd_mixer_t;
Psnd_pcm_t  = ^snd_pcm_t;
Pword  = ^word;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*
 * \file include/mixer.h
 * \brief Application interface library for the ALSA driver
 * \author Jaroslav Kysela <perex@perex.cz>
 * \author Abramo Bagnara <abramo@alsa-project.org>
 * \author Takashi Iwai <tiwai@suse.de>
 * \date 1998-2001
 *
 * Application interface library for the ALSA driver
  }
{
 *   This library is free software; you can redistribute it and/or modify
 *   it under the terms of the GNU Lesser General Public License as
 *   published by the Free Software Foundation; either version 2.1 of
 *   the License, or (at your option) any later version.
 *
 *   This program is distributed in the hope that it will be useful,
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *   GNU Lesser General Public License for more details.
 *
 *   You should have received a copy of the GNU Lesser General Public
 *   License along with this library; if not, write to the Free Software
 *   Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
 *
  }
{$ifndef __ALSA_MIXER_H}
{$define __ALSA_MIXER_H}
{ C++ extern C conditionnal removed }
{*
 *  \defgroup Mixer Mixer Interface
 *  The mixer interface.
 *  \
  }
{* Mixer handle  }
type
  Tsnd_mixer = Tsnd_mixer_t;
{* Mixer elements class handle  }
  Tsnd_mixer_class = Tsnd_mixer_class_t;
{* Mixer element handle  }
  Tsnd_mixer_elem = Tsnd_mixer_elem_t;
{* 
 * \brief Mixer callback function
 * \param ctl Mixer handle
 * \param mask event mask
 * \param elem related mixer element (if any)
 * \return 0 on success otherwise a negative error code
  }

  Tsnd_mixer_callback_t = function (ctl:Psnd_mixer_t; mask:dword; elem:Psnd_mixer_elem_t):longint;cdecl;
{* 
 * \brief Mixer element callback function
 * \param elem Mixer element
 * \param mask event mask
 * \return 0 on success otherwise a negative error code
  }

  Tsnd_mixer_elem_callback_t = function (elem:Psnd_mixer_elem_t; mask:dword):longint;cdecl;
{*
 * \brief Compare function for sorting mixer elements
 * \param e1 First element
 * \param e2 Second element
 * \return -1 if e1 < e2, 0 if e1 == e2, 1 if e1 > e2
  }
(* Const before type ignored *)
(* Const before type ignored *)

  Tsnd_mixer_compare_t = function (e1:Psnd_mixer_elem_t; e2:Psnd_mixer_elem_t):longint;cdecl;
{*
 * \brief Event callback for the mixer class
 * \param class_ Mixer class
 * \param mask Event mask (SND_CTL_EVENT_*)
 * \param helem HCTL element which invoked the event
 * \param melem Mixer element associated to HCTL element
 * \return zero if success, otherwise a negative error value
  }

  Tsnd_mixer_event_t = function (class_:Psnd_mixer_class_t; mask:dword; helem:Psnd_hctl_elem_t; melem:Psnd_mixer_elem_t):longint;cdecl;
{* Mixer element type  }
{ Simple mixer elements  }

  Psnd_mixer_elem_type = ^Tsnd_mixer_elem_type;
  Tsnd_mixer_elem_type =  Longint;
  Const
    SND_MIXER_ELEM_SIMPLE = 0;
    SND_MIXER_ELEM_LAST = SND_MIXER_ELEM_SIMPLE;
;
  Tsnd_mixer_elem_type_t = Tsnd_mixer_elem_type;
  Psnd_mixer_elem_type_t = ^Tsnd_mixer_elem_type_t;

function snd_mixer_open(mixer:PPsnd_mixer_t; mode:longint):longint;cdecl;external;
function snd_mixer_close(mixer:Psnd_mixer_t):longint;cdecl;external;
function snd_mixer_first_elem(mixer:Psnd_mixer_t):Psnd_mixer_elem_t;cdecl;external;
function snd_mixer_last_elem(mixer:Psnd_mixer_t):Psnd_mixer_elem_t;cdecl;external;
function snd_mixer_handle_events(mixer:Psnd_mixer_t):longint;cdecl;external;
(* Const before type ignored *)
function snd_mixer_attach(mixer:Psnd_mixer_t; name:Pchar):longint;cdecl;external;
function snd_mixer_attach_hctl(mixer:Psnd_mixer_t; hctl:Psnd_hctl_t):longint;cdecl;external;
(* Const before type ignored *)
function snd_mixer_detach(mixer:Psnd_mixer_t; name:Pchar):longint;cdecl;external;
function snd_mixer_detach_hctl(mixer:Psnd_mixer_t; hctl:Psnd_hctl_t):longint;cdecl;external;
(* Const before type ignored *)
function snd_mixer_get_hctl(mixer:Psnd_mixer_t; name:Pchar; hctl:PPsnd_hctl_t):longint;cdecl;external;
function snd_mixer_poll_descriptors_count(mixer:Psnd_mixer_t):longint;cdecl;external;
function snd_mixer_poll_descriptors(mixer:Psnd_mixer_t; pfds:Ppollfd; space:dword):longint;cdecl;external;
function snd_mixer_poll_descriptors_revents(mixer:Psnd_mixer_t; pfds:Ppollfd; nfds:dword; revents:Pword):longint;cdecl;external;
function snd_mixer_load(mixer:Psnd_mixer_t):longint;cdecl;external;
procedure snd_mixer_free(mixer:Psnd_mixer_t);cdecl;external;
function snd_mixer_wait(mixer:Psnd_mixer_t; timeout:longint):longint;cdecl;external;
function snd_mixer_set_compare(mixer:Psnd_mixer_t; msort:Tsnd_mixer_compare_t):longint;cdecl;external;
procedure snd_mixer_set_callback(obj:Psnd_mixer_t; val:Tsnd_mixer_callback_t);cdecl;external;
(* Const before type ignored *)
function snd_mixer_get_callback_private(obj:Psnd_mixer_t):pointer;cdecl;external;
procedure snd_mixer_set_callback_private(obj:Psnd_mixer_t; val:pointer);cdecl;external;
(* Const before type ignored *)
function snd_mixer_get_count(obj:Psnd_mixer_t):dword;cdecl;external;
function snd_mixer_class_unregister(clss:Psnd_mixer_class_t):longint;cdecl;external;
function snd_mixer_elem_next(elem:Psnd_mixer_elem_t):Psnd_mixer_elem_t;cdecl;external;
function snd_mixer_elem_prev(elem:Psnd_mixer_elem_t):Psnd_mixer_elem_t;cdecl;external;
procedure snd_mixer_elem_set_callback(obj:Psnd_mixer_elem_t; val:Tsnd_mixer_elem_callback_t);cdecl;external;
(* Const before type ignored *)
function snd_mixer_elem_get_callback_private(obj:Psnd_mixer_elem_t):pointer;cdecl;external;
procedure snd_mixer_elem_set_callback_private(obj:Psnd_mixer_elem_t; val:pointer);cdecl;external;
(* Const before type ignored *)
function snd_mixer_elem_get_type(obj:Psnd_mixer_elem_t):Tsnd_mixer_elem_type_t;cdecl;external;
function snd_mixer_class_register(class_:Psnd_mixer_class_t; mixer:Psnd_mixer_t):longint;cdecl;external;
function snd_mixer_elem_new(elem:PPsnd_mixer_elem_t; _type:Tsnd_mixer_elem_type_t; compare_weight:longint; private_data:pointer; private_free:procedure (elem:Psnd_mixer_elem_t)):longint;cdecl;external;
function snd_mixer_elem_add(elem:Psnd_mixer_elem_t; class_:Psnd_mixer_class_t):longint;cdecl;external;
function snd_mixer_elem_remove(elem:Psnd_mixer_elem_t):longint;cdecl;external;
procedure snd_mixer_elem_free(elem:Psnd_mixer_elem_t);cdecl;external;
function snd_mixer_elem_info(elem:Psnd_mixer_elem_t):longint;cdecl;external;
function snd_mixer_elem_value(elem:Psnd_mixer_elem_t):longint;cdecl;external;
function snd_mixer_elem_attach(melem:Psnd_mixer_elem_t; helem:Psnd_hctl_elem_t):longint;cdecl;external;
function snd_mixer_elem_detach(melem:Psnd_mixer_elem_t; helem:Psnd_hctl_elem_t):longint;cdecl;external;
function snd_mixer_elem_empty(melem:Psnd_mixer_elem_t):longint;cdecl;external;
(* Const before type ignored *)
function snd_mixer_elem_get_private(melem:Psnd_mixer_elem_t):pointer;cdecl;external;
function snd_mixer_class_sizeof:Tsize_t;cdecl;external;
{* \hideinitializer
 * \brief allocate an invalid #snd_mixer_class_t using standard alloca
 * \param ptr returned pointer
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function snd_mixer_class_alloca(ptr : longint) : longint;

function snd_mixer_class_malloc(ptr:PPsnd_mixer_class_t):longint;cdecl;external;
procedure snd_mixer_class_free(obj:Psnd_mixer_class_t);cdecl;external;
(* Const before type ignored *)
procedure snd_mixer_class_copy(dst:Psnd_mixer_class_t; src:Psnd_mixer_class_t);cdecl;external;
(* Const before type ignored *)
function snd_mixer_class_get_mixer(class_:Psnd_mixer_class_t):Psnd_mixer_t;cdecl;external;
(* Const before type ignored *)
function snd_mixer_class_get_event(class_:Psnd_mixer_class_t):Tsnd_mixer_event_t;cdecl;external;
(* Const before type ignored *)
function snd_mixer_class_get_private(class_:Psnd_mixer_class_t):pointer;cdecl;external;
(* Const before type ignored *)
function snd_mixer_class_get_compare(class_:Psnd_mixer_class_t):Tsnd_mixer_compare_t;cdecl;external;
function snd_mixer_class_set_event(class_:Psnd_mixer_class_t; event:Tsnd_mixer_event_t):longint;cdecl;external;
function snd_mixer_class_set_private(class_:Psnd_mixer_class_t; private_data:pointer):longint;cdecl;external;
function snd_mixer_class_set_private_free(class_:Psnd_mixer_class_t; private_free:procedure (para1:Psnd_mixer_class_t)):longint;cdecl;external;
function snd_mixer_class_set_compare(class_:Psnd_mixer_class_t; compare:Tsnd_mixer_compare_t):longint;cdecl;external;
{*
 *  \defgroup SimpleMixer Simple Mixer Interface
 *  \ingroup Mixer
 *  The simple mixer interface.
 *  \
  }
{ Simple mixer elements API  }
{* Mixer simple element channel identifier  }
{* Unknown  }
{* Front left  }
{* Front right  }
{* Rear left  }
{* Rear right  }
{* Front center  }
{* Woofer  }
{* Side Left  }
{* Side Right  }
{* Rear Center  }
{* Mono (Front left alias)  }
type
  Psnd_mixer_selem_channel_id = ^Tsnd_mixer_selem_channel_id;
  Tsnd_mixer_selem_channel_id =  Longint;
  Const
    SND_MIXER_SCHN_UNKNOWN = -(1);
    SND_MIXER_SCHN_FRONT_LEFT = 0;
    SND_MIXER_SCHN_FRONT_RIGHT = 1;
    SND_MIXER_SCHN_REAR_LEFT = 2;
    SND_MIXER_SCHN_REAR_RIGHT = 3;
    SND_MIXER_SCHN_FRONT_CENTER = 4;
    SND_MIXER_SCHN_WOOFER = 5;
    SND_MIXER_SCHN_SIDE_LEFT = 6;
    SND_MIXER_SCHN_SIDE_RIGHT = 7;
    SND_MIXER_SCHN_REAR_CENTER = 8;
    SND_MIXER_SCHN_LAST = 31;
    SND_MIXER_SCHN_MONO = SND_MIXER_SCHN_FRONT_LEFT;
;
  Tsnd_mixer_selem_channel_id_t = Tsnd_mixer_selem_channel_id;
  Psnd_mixer_selem_channel_id_t = ^Tsnd_mixer_selem_channel_id_t;
{* Mixer simple element - register options - abstraction level  }
{* no abstraction - try use all universal controls from driver  }
{* basic abstraction - Master,PCM,CD,Aux,Record-Gain etc.  }
type
  Tsnd_mixer_selem_regopt_abstract =  Longint;
  Const
    SND_MIXER_SABSTRACT_NONE = 0;
    SND_MIXER_SABSTRACT_BASIC = 1;

{* Mixer simple element - register options  }
{* structure version  }
{* v1: abstract layer selection  }
{* v1: device name (must be NULL when playback_pcm or capture_pcm != NULL)  }
(* Const before type ignored *)
{* v1: playback PCM connected to mixer device (NULL == none)  }
{* v1: capture PCM connected to mixer device (NULL == none)  }
type
  Psnd_mixer_selem_regopt = ^Tsnd_mixer_selem_regopt;
  Tsnd_mixer_selem_regopt = record
      ver : longint;
      abstract : Tsnd_mixer_selem_regopt_abstract;
      device : Pchar;
      playback_pcm : Psnd_pcm_t;
      capture_pcm : Psnd_pcm_t;
    end;

{* Mixer simple element identifier  }
  Tsnd_mixer_selem_id = Tsnd_mixer_selem_id_t;
(* Const before type ignored *)

function snd_mixer_selem_channel_name(channel:Tsnd_mixer_selem_channel_id_t):Pchar;cdecl;external;
function snd_mixer_selem_register(mixer:Psnd_mixer_t; options:Psnd_mixer_selem_regopt; classp:PPsnd_mixer_class_t):longint;cdecl;external;
procedure snd_mixer_selem_get_id(element:Psnd_mixer_elem_t; id:Psnd_mixer_selem_id_t);cdecl;external;
(* Const before type ignored *)
function snd_mixer_selem_get_name(elem:Psnd_mixer_elem_t):Pchar;cdecl;external;
function snd_mixer_selem_get_index(elem:Psnd_mixer_elem_t):dword;cdecl;external;
(* Const before type ignored *)
function snd_mixer_find_selem(mixer:Psnd_mixer_t; id:Psnd_mixer_selem_id_t):Psnd_mixer_elem_t;cdecl;external;
function snd_mixer_selem_is_active(elem:Psnd_mixer_elem_t):longint;cdecl;external;
function snd_mixer_selem_is_playback_mono(elem:Psnd_mixer_elem_t):longint;cdecl;external;
function snd_mixer_selem_has_playback_channel(obj:Psnd_mixer_elem_t; channel:Tsnd_mixer_selem_channel_id_t):longint;cdecl;external;
function snd_mixer_selem_is_capture_mono(elem:Psnd_mixer_elem_t):longint;cdecl;external;
function snd_mixer_selem_has_capture_channel(obj:Psnd_mixer_elem_t; channel:Tsnd_mixer_selem_channel_id_t):longint;cdecl;external;
function snd_mixer_selem_get_capture_group(elem:Psnd_mixer_elem_t):longint;cdecl;external;
function snd_mixer_selem_has_common_volume(elem:Psnd_mixer_elem_t):longint;cdecl;external;
function snd_mixer_selem_has_playback_volume(elem:Psnd_mixer_elem_t):longint;cdecl;external;
function snd_mixer_selem_has_playback_volume_joined(elem:Psnd_mixer_elem_t):longint;cdecl;external;
function snd_mixer_selem_has_capture_volume(elem:Psnd_mixer_elem_t):longint;cdecl;external;
function snd_mixer_selem_has_capture_volume_joined(elem:Psnd_mixer_elem_t):longint;cdecl;external;
function snd_mixer_selem_has_common_switch(elem:Psnd_mixer_elem_t):longint;cdecl;external;
function snd_mixer_selem_has_playback_switch(elem:Psnd_mixer_elem_t):longint;cdecl;external;
function snd_mixer_selem_has_playback_switch_joined(elem:Psnd_mixer_elem_t):longint;cdecl;external;
function snd_mixer_selem_has_capture_switch(elem:Psnd_mixer_elem_t):longint;cdecl;external;
function snd_mixer_selem_has_capture_switch_joined(elem:Psnd_mixer_elem_t):longint;cdecl;external;
function snd_mixer_selem_has_capture_switch_exclusive(elem:Psnd_mixer_elem_t):longint;cdecl;external;
function snd_mixer_selem_ask_playback_vol_dB(elem:Psnd_mixer_elem_t; value:longint; dBvalue:Plongint):longint;cdecl;external;
function snd_mixer_selem_ask_capture_vol_dB(elem:Psnd_mixer_elem_t; value:longint; dBvalue:Plongint):longint;cdecl;external;
function snd_mixer_selem_ask_playback_dB_vol(elem:Psnd_mixer_elem_t; dBvalue:longint; dir:longint; value:Plongint):longint;cdecl;external;
function snd_mixer_selem_ask_capture_dB_vol(elem:Psnd_mixer_elem_t; dBvalue:longint; dir:longint; value:Plongint):longint;cdecl;external;
function snd_mixer_selem_get_playback_volume(elem:Psnd_mixer_elem_t; channel:Tsnd_mixer_selem_channel_id_t; value:Plongint):longint;cdecl;external;
function snd_mixer_selem_get_capture_volume(elem:Psnd_mixer_elem_t; channel:Tsnd_mixer_selem_channel_id_t; value:Plongint):longint;cdecl;external;
function snd_mixer_selem_get_playback_dB(elem:Psnd_mixer_elem_t; channel:Tsnd_mixer_selem_channel_id_t; value:Plongint):longint;cdecl;external;
function snd_mixer_selem_get_capture_dB(elem:Psnd_mixer_elem_t; channel:Tsnd_mixer_selem_channel_id_t; value:Plongint):longint;cdecl;external;
function snd_mixer_selem_get_playback_switch(elem:Psnd_mixer_elem_t; channel:Tsnd_mixer_selem_channel_id_t; value:Plongint):longint;cdecl;external;
function snd_mixer_selem_get_capture_switch(elem:Psnd_mixer_elem_t; channel:Tsnd_mixer_selem_channel_id_t; value:Plongint):longint;cdecl;external;
function snd_mixer_selem_set_playback_volume(elem:Psnd_mixer_elem_t; channel:Tsnd_mixer_selem_channel_id_t; value:longint):longint;cdecl;external;
function snd_mixer_selem_set_capture_volume(elem:Psnd_mixer_elem_t; channel:Tsnd_mixer_selem_channel_id_t; value:longint):longint;cdecl;external;
function snd_mixer_selem_set_playback_dB(elem:Psnd_mixer_elem_t; channel:Tsnd_mixer_selem_channel_id_t; value:longint; dir:longint):longint;cdecl;external;
function snd_mixer_selem_set_capture_dB(elem:Psnd_mixer_elem_t; channel:Tsnd_mixer_selem_channel_id_t; value:longint; dir:longint):longint;cdecl;external;
function snd_mixer_selem_set_playback_volume_all(elem:Psnd_mixer_elem_t; value:longint):longint;cdecl;external;
function snd_mixer_selem_set_capture_volume_all(elem:Psnd_mixer_elem_t; value:longint):longint;cdecl;external;
function snd_mixer_selem_set_playback_dB_all(elem:Psnd_mixer_elem_t; value:longint; dir:longint):longint;cdecl;external;
function snd_mixer_selem_set_capture_dB_all(elem:Psnd_mixer_elem_t; value:longint; dir:longint):longint;cdecl;external;
function snd_mixer_selem_set_playback_switch(elem:Psnd_mixer_elem_t; channel:Tsnd_mixer_selem_channel_id_t; value:longint):longint;cdecl;external;
function snd_mixer_selem_set_capture_switch(elem:Psnd_mixer_elem_t; channel:Tsnd_mixer_selem_channel_id_t; value:longint):longint;cdecl;external;
function snd_mixer_selem_set_playback_switch_all(elem:Psnd_mixer_elem_t; value:longint):longint;cdecl;external;
function snd_mixer_selem_set_capture_switch_all(elem:Psnd_mixer_elem_t; value:longint):longint;cdecl;external;
function snd_mixer_selem_get_playback_volume_range(elem:Psnd_mixer_elem_t; min:Plongint; max:Plongint):longint;cdecl;external;
function snd_mixer_selem_get_playback_dB_range(elem:Psnd_mixer_elem_t; min:Plongint; max:Plongint):longint;cdecl;external;
function snd_mixer_selem_set_playback_volume_range(elem:Psnd_mixer_elem_t; min:longint; max:longint):longint;cdecl;external;
function snd_mixer_selem_get_capture_volume_range(elem:Psnd_mixer_elem_t; min:Plongint; max:Plongint):longint;cdecl;external;
function snd_mixer_selem_get_capture_dB_range(elem:Psnd_mixer_elem_t; min:Plongint; max:Plongint):longint;cdecl;external;
function snd_mixer_selem_set_capture_volume_range(elem:Psnd_mixer_elem_t; min:longint; max:longint):longint;cdecl;external;
function snd_mixer_selem_is_enumerated(elem:Psnd_mixer_elem_t):longint;cdecl;external;
function snd_mixer_selem_is_enum_playback(elem:Psnd_mixer_elem_t):longint;cdecl;external;
function snd_mixer_selem_is_enum_capture(elem:Psnd_mixer_elem_t):longint;cdecl;external;
function snd_mixer_selem_get_enum_items(elem:Psnd_mixer_elem_t):longint;cdecl;external;
function snd_mixer_selem_get_enum_item_name(elem:Psnd_mixer_elem_t; idx:dword; maxlen:Tsize_t; str:Pchar):longint;cdecl;external;
function snd_mixer_selem_get_enum_item(elem:Psnd_mixer_elem_t; channel:Tsnd_mixer_selem_channel_id_t; idxp:Pdword):longint;cdecl;external;
function snd_mixer_selem_set_enum_item(elem:Psnd_mixer_elem_t; channel:Tsnd_mixer_selem_channel_id_t; idx:dword):longint;cdecl;external;
function snd_mixer_selem_id_sizeof:Tsize_t;cdecl;external;
{* \hideinitializer
 * \brief allocate an invalid #snd_mixer_selem_id_t using standard alloca
 * \param ptr returned pointer
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function snd_mixer_selem_id_alloca(ptr : longint) : longint;

function snd_mixer_selem_id_malloc(ptr:PPsnd_mixer_selem_id_t):longint;cdecl;external;
procedure snd_mixer_selem_id_free(obj:Psnd_mixer_selem_id_t);cdecl;external;
(* Const before type ignored *)
procedure snd_mixer_selem_id_copy(dst:Psnd_mixer_selem_id_t; src:Psnd_mixer_selem_id_t);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function snd_mixer_selem_id_get_name(obj:Psnd_mixer_selem_id_t):Pchar;cdecl;external;
(* Const before type ignored *)
function snd_mixer_selem_id_get_index(obj:Psnd_mixer_selem_id_t):dword;cdecl;external;
(* Const before type ignored *)
procedure snd_mixer_selem_id_set_name(obj:Psnd_mixer_selem_id_t; val:Pchar);cdecl;external;
procedure snd_mixer_selem_id_set_index(obj:Psnd_mixer_selem_id_t; val:dword);cdecl;external;
(* Const before type ignored *)
function snd_mixer_selem_id_parse(dst:Psnd_mixer_selem_id_t; str:Pchar):longint;cdecl;external;
{* \  }
{* \  }
{ C++ end of extern C conditionnal removed }
{$endif}
{ __ALSA_MIXER_H  }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function snd_mixer_class_alloca(ptr : longint) : longint;
begin
  snd_mixer_class_alloca:=__snd_alloca(ptr,snd_mixer_class);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function snd_mixer_selem_id_alloca(ptr : longint) : longint;
begin
  snd_mixer_selem_id_alloca:=__snd_alloca(ptr,snd_mixer_selem_id);
end;


end.
