unit mixer_abst;

interface

uses
  fp_asound;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*
 * \file include/mixer_abst.h
 * \brief Mixer abstract implementation interface library for the ALSA library
 * \author Jaroslav Kysela <perex@perex.cz>
 * \date 2005
 *
 * Mixer abstact implementation interface library for the ALSA library
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
{$ifndef __ALSA_MIXER_ABST_H}
{$define __ALSA_MIXER_ABST_H}
{ C++ extern C conditionnal removed }
{*
 *  \defgroup Mixer_Abstract Mixer Abstact Module Interface
 *  The mixer abstact module interface.
 *  \
  }

const
  SM_PLAY = 0;  
  SM_CAPT = 1;  
  SM_CAP_GVOLUME = 1 shl 1;  
  SM_CAP_GSWITCH = 1 shl 2;  
  SM_CAP_PVOLUME = 1 shl 3;  
  SM_CAP_PVOLUME_JOIN = 1 shl 4;  
  SM_CAP_PSWITCH = 1 shl 5;  
  SM_CAP_PSWITCH_JOIN = 1 shl 6;  
  SM_CAP_CVOLUME = 1 shl 7;  
  SM_CAP_CVOLUME_JOIN = 1 shl 8;  
  SM_CAP_CSWITCH = 1 shl 9;  
  SM_CAP_CSWITCH_JOIN = 1 shl 10;  
  SM_CAP_CSWITCH_EXCL = 1 shl 11;  
  SM_CAP_PENUM = 1 shl 12;  
  SM_CAP_CENUM = 1 shl 13;  
{ SM_CAP_* 24-31 => private for module use  }
  SM_OPS_IS_ACTIVE = 0;  
  SM_OPS_IS_MONO = 1;  
  SM_OPS_IS_CHANNEL = 2;  
  SM_OPS_IS_ENUMERATED = 3;  
  SM_OPS_IS_ENUMCNT = 4;  
{ was #define dname(params) para_def_expr }
{ argument types are unknown }

function sm_selem(x : longint) : Psm_selem_t;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function sm_selem_ops(x : longint) : longint;

type
  Psm_selem = ^Tsm_selem;
  Tsm_selem = record
      id : Psnd_mixer_selem_id_t;
      ops : Psm_elem_ops;
      caps : dword;
      capture_group : dword;
    end;
  Tsm_selem_t = Tsm_selem;
  Psm_selem_t = ^Tsm_selem_t;

  Psm_class_basic = ^Tsm_class_basic;
  Tsm_class_basic = record
      device : Pchar;
      ctl : Psnd_ctl_t;
      hctl : Psnd_hctl_t;
      info : Psnd_ctl_card_info_t;
    end;
  Tsm_class_basic_t = Tsm_class_basic;
  Psm_class_basic_t = ^Tsm_class_basic_t;
  Psm_elem_ops = ^Tsm_elem_ops;
  Tsm_elem_ops = record
      is : function (elem:Psnd_mixer_elem_t; dir:longint; cmd:longint; val:longint):longint;cdecl;
      get_range : function (elem:Psnd_mixer_elem_t; dir:longint; min:Plongint; max:Plongint):longint;cdecl;
      set_range : function (elem:Psnd_mixer_elem_t; dir:longint; min:longint; max:longint):longint;cdecl;
      get_dB_range : function (elem:Psnd_mixer_elem_t; dir:longint; min:Plongint; max:Plongint):longint;cdecl;
      ask_vol_dB : function (elem:Psnd_mixer_elem_t; dir:longint; value:longint; dbValue:Plongint):longint;cdecl;
      ask_dB_vol : function (elem:Psnd_mixer_elem_t; dir:longint; dbValue:longint; value:Plongint; xdir:longint):longint;cdecl;
      get_volume : function (elem:Psnd_mixer_elem_t; dir:longint; channel:Tsnd_mixer_selem_channel_id_t; value:Plongint):longint;cdecl;
      get_dB : function (elem:Psnd_mixer_elem_t; dir:longint; channel:Tsnd_mixer_selem_channel_id_t; value:Plongint):longint;cdecl;
      set_volume : function (elem:Psnd_mixer_elem_t; dir:longint; channel:Tsnd_mixer_selem_channel_id_t; value:longint):longint;cdecl;
      set_dB : function (elem:Psnd_mixer_elem_t; dir:longint; channel:Tsnd_mixer_selem_channel_id_t; value:longint; xdir:longint):longint;cdecl;
      get_switch : function (elem:Psnd_mixer_elem_t; dir:longint; channel:Tsnd_mixer_selem_channel_id_t; value:Plongint):longint;cdecl;
      set_switch : function (elem:Psnd_mixer_elem_t; dir:longint; channel:Tsnd_mixer_selem_channel_id_t; value:longint):longint;cdecl;
      enum_item_name : function (elem:Psnd_mixer_elem_t; item:dword; maxlen:Tsize_t; buf:Pchar):longint;cdecl;
      get_enum_item : function (elem:Psnd_mixer_elem_t; channel:Tsnd_mixer_selem_channel_id_t; itemp:Pdword):longint;cdecl;
      set_enum_item : function (elem:Psnd_mixer_elem_t; channel:Tsnd_mixer_selem_channel_id_t; item:dword):longint;cdecl;
    end;


function snd_mixer_selem_compare(c1:Psnd_mixer_elem_t; c2:Psnd_mixer_elem_t):longint;cdecl;external libasound;
function snd_mixer_sbasic_info(mixer_class:Psnd_mixer_class_t; info:Psm_class_basic_t):longint;cdecl;external libasound;
function snd_mixer_sbasic_get_private(mixer_class:Psnd_mixer_class_t):pointer;cdecl;external libasound;
procedure snd_mixer_sbasic_set_private(mixer_class:Psnd_mixer_class_t; private_data:pointer);cdecl;external libasound;
procedure snd_mixer_sbasic_set_private_free(mixer_class:Psnd_mixer_class_t; private_free:procedure (mixer_class:Psnd_mixer_class_t));cdecl;external libasound;
{* \  }
{ C++ end of extern C conditionnal removed }
{$endif}
{ __ALSA_MIXER_ABST_H  }

// === Konventiert am: 19-11-25 16:12:14 ===


implementation


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function sm_selem(x : longint) : Psm_selem_t;
begin
  sm_selem:=Psm_selem_t(x^.private_data);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function sm_selem_ops(x : longint) : longint;
begin
  sm_selem_ops:=(Psm_selem_t(x^.private_data))^.ops;
end;


end.
