
unit control_external;
interface

{
  Automatically converted by H2Pas 1.0.0 from control_external.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    control_external.h
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
Pbyte  = ^byte;
Pchar  = ^char;
Pdword  = ^dword;
Pint64_t  = ^int64_t;
Plongint  = ^longint;
Ppollfd  = ^pollfd;
Psnd_aes_iec958_t  = ^snd_aes_iec958_t;
Psnd_ctl_elem_id_t  = ^snd_ctl_elem_id_t;
Psnd_ctl_ext  = ^snd_ctl_ext;
Psnd_ctl_ext_access  = ^snd_ctl_ext_access;
Psnd_ctl_ext_access_t  = ^snd_ctl_ext_access_t;
Psnd_ctl_ext_callback  = ^snd_ctl_ext_callback;
Psnd_ctl_ext_callback_t  = ^snd_ctl_ext_callback_t;
Psnd_ctl_ext_key_t  = ^snd_ctl_ext_key_t;
Psnd_ctl_ext_t  = ^snd_ctl_ext_t;
Psnd_ctl_ext_tlv_rw_t  = ^snd_ctl_ext_tlv_rw_t;
Psnd_ctl_t  = ^snd_ctl_t;
Pword  = ^word;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*
 * \file include/control_external.h
 * \brief External control plugin SDK
 * \author Takashi Iwai <tiwai@suse.de>
 * \date 2005
 *
 * External control plugin SDK.
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
{$ifndef __ALSA_CONTROL_EXTERNAL_H}
{$define __ALSA_CONTROL_EXTERNAL_H}
{$include "control.h"}
{ C++ extern C conditionnal removed }
{*
 *  \defgroup CtlPlugin_SDK External Control Plugin SDK
 *  \
  }
{*
 * Define the object entry for external control plugins
  }
{#define SND_CTL_PLUGIN_ENTRY(name) _snd_ctl_##name##_open }
{*
 * Define the symbols of the given control plugin with versions
  }
{xxxxxxxxx #define SND_CTL_PLUGIN_SYMBOL(name) SND_DLSYM_BUILD_VERSION(SND_CTL_PLUGIN_ENTRY(name), SND_CONTROL_DLSYM_VERSION); }
{*
 * Define the control plugin
  }
{* External control plugin handle  }
type
  Tsnd_ctl_ext = Tsnd_ctl_ext_t;
{* Callback table of control ext  }
  Tsnd_ctl_ext_callback = Tsnd_ctl_ext_callback_t;
{* Key to access a control pointer  }

  Psnd_ctl_ext_key_t = ^Tsnd_ctl_ext_key_t;
  Tsnd_ctl_ext_key_t = dword;
{$ifdef DOC_HIDDEN}
{ redefine typedef's for stupid doxygen  }

  Psnd_ctl_ext_t = ^Tsnd_ctl_ext_t;
  Tsnd_ctl_ext_t = Tsnd_ctl_ext;

  Psnd_ctl_ext_callback_t = ^Tsnd_ctl_ext_callback_t;
  Tsnd_ctl_ext_callback_t = Tsnd_ctl_ext_callback;
{$endif}
{* Callback to handle TLV commands.  }
type
{
 * Protocol version
  }
{*< Protocol major version  }

const
  SND_CTL_EXT_VERSION_MAJOR = 1;  
{*< Protocol minor version  }
  SND_CTL_EXT_VERSION_MINOR = 0;  
{*< Protocol tiny version  }
  SND_CTL_EXT_VERSION_TINY = 1;  
{*
 * external plugin protocol version
  }
  SND_CTL_EXT_VERSION = ((SND_CTL_EXT_VERSION_MAJOR shl 16) or (SND_CTL_EXT_VERSION_MINOR shl 8)) or SND_CTL_EXT_VERSION_TINY;  
{* Handle of control ext  }
{*
	 * protocol version; #SND_CTL_EXT_VERSION must be filled here
	 * before calling #snd_ctl_ext_create()
	  }
{*
	 * Index of this card; must be filled before calling #snd_ctl_ext_create()
	  }
{*
	 * ID string of this card; must be filled before calling #snd_ctl_ext_create()
	  }
{*
	 * Driver name of this card; must be filled before calling #snd_ctl_ext_create()
	  }
{*
	 * short name of this card; must be filled before calling #snd_ctl_ext_create()
	  }
{*
	 * Long name of this card; must be filled before calling #snd_ctl_ext_create()
	  }
{*
	 * Mixer name of this card; must be filled before calling #snd_ctl_ext_create()
	  }
{*
	 * poll descriptor
	  }
{*
	 * callbacks of this plugin; must be filled before calling #snd_pcm_ioplug_create()
	  }
(* Const before type ignored *)
{*
	 * private data, which can be used freely in the driver callbacks
	  }
{*
	 * control handle filled by #snd_ctl_ext_create()
	  }
{*< non-block mode; read-only  }
{*< events subscribed; read-only  }
{*
	 * optional TLV data for the control (since protocol 1.0.1)
	  }
(* Const before type ignored *)
type
  Psnd_ctl_ext = ^Tsnd_ctl_ext;
  Tsnd_ctl_ext = record
      version : dword;
      card_idx : longint;
      id : array[0..15] of char;
      driver : array[0..15] of char;
      name : array[0..31] of char;
      longname : array[0..79] of char;
      mixername : array[0..79] of char;
      poll_fd : longint;
      callback : Psnd_ctl_ext_callback_t;
      private_data : pointer;
      handle : Psnd_ctl_t;
      nonblock : longint;
      subscribed : longint;
      tlv : record
          case longint of
            0 : ( c : Psnd_ctl_ext_tlv_rw_t );
            1 : ( p : Pdword );
          end;
    end;

{* Callback table of ext.  }
{*
	 * close the control handle; optional
	  }
{*
	 * return the total number of elements; required
	  }
{*
	 * return the element id of the given offset (array index); required
	  }
{*
	 * convert the element id to a search key; required
	  }
(* Const before type ignored *)
{*
	 * the destructor of the key; optional
	  }
{*
	 * get the attribute of the element; required
	  }
{*
	 * get the element information of integer type
	  }
{*
	 * get the element information of integer64 type
	  }
{*
	 * get the element information of enumerated type
	  }
{*
	 * get the name of the enumerated item
	  }
{*
	 * read the current values of integer type
	  }
{*
	 * read the current values of integer64 type
	  }
{*
	 * read the current values of enumerated type
	  }
{*
	 * read the current values of bytes type
	  }
{*
	 * read the current values of iec958 type
	  }
{*
	 * update the current values of integer type with the given values
	  }
{*
	 * update the current values of integer64 type with the given values
	  }
{*
	 * update the current values of enumerated type with the given values
	  }
{*
	 * update the current values of bytes type with the given values
	  }
{*
	 * update the current values of iec958 type with the given values
	  }
{*
	 * subscribe/unsubscribe the event notification; optional
	  }
{*
	 * read a pending notification event; optional
	  }
{*
	 * return the number of poll descriptors; optional
	  }
{*
	 * fill the poll descriptors; optional
	  }
{*
	 * mangle the revents of poll descriptors
	  }
  Psnd_ctl_ext_callback = ^Tsnd_ctl_ext_callback;
  Tsnd_ctl_ext_callback = record
      close : procedure (ext:Psnd_ctl_ext_t);cdecl;
      elem_count : function (ext:Psnd_ctl_ext_t):longint;cdecl;
      elem_list : function (ext:Psnd_ctl_ext_t; offset:dword; id:Psnd_ctl_elem_id_t):longint;cdecl;
      find_elem : function (ext:Psnd_ctl_ext_t; id:Psnd_ctl_elem_id_t):Tsnd_ctl_ext_key_t;cdecl;
      free_key : procedure (ext:Psnd_ctl_ext_t; key:Tsnd_ctl_ext_key_t);cdecl;
      get_attribute : function (ext:Psnd_ctl_ext_t; key:Tsnd_ctl_ext_key_t; _type:Plongint; acc:Pdword; count:Pdword):longint;cdecl;
      get_integer_info : function (ext:Psnd_ctl_ext_t; key:Tsnd_ctl_ext_key_t; imin:Plongint; imax:Plongint; istep:Plongint):longint;cdecl;
      get_integer64_info : function (ext:Psnd_ctl_ext_t; key:Tsnd_ctl_ext_key_t; imin:Pint64_t; imax:Pint64_t; istep:Pint64_t):longint;cdecl;
      get_enumerated_info : function (ext:Psnd_ctl_ext_t; key:Tsnd_ctl_ext_key_t; items:Pdword):longint;cdecl;
      get_enumerated_name : function (ext:Psnd_ctl_ext_t; key:Tsnd_ctl_ext_key_t; item:dword; name:Pchar; name_max_len:Tsize_t):longint;cdecl;
      read_integer : function (ext:Psnd_ctl_ext_t; key:Tsnd_ctl_ext_key_t; value:Plongint):longint;cdecl;
      read_integer64 : function (ext:Psnd_ctl_ext_t; key:Tsnd_ctl_ext_key_t; value:Pint64_t):longint;cdecl;
      read_enumerated : function (ext:Psnd_ctl_ext_t; key:Tsnd_ctl_ext_key_t; items:Pdword):longint;cdecl;
      read_bytes : function (ext:Psnd_ctl_ext_t; key:Tsnd_ctl_ext_key_t; data:Pbyte; max_bytes:Tsize_t):longint;cdecl;
      read_iec958 : function (ext:Psnd_ctl_ext_t; key:Tsnd_ctl_ext_key_t; iec958:Psnd_aes_iec958_t):longint;cdecl;
      write_integer : function (ext:Psnd_ctl_ext_t; key:Tsnd_ctl_ext_key_t; value:Plongint):longint;cdecl;
      write_integer64 : function (ext:Psnd_ctl_ext_t; key:Tsnd_ctl_ext_key_t; value:Pint64_t):longint;cdecl;
      write_enumerated : function (ext:Psnd_ctl_ext_t; key:Tsnd_ctl_ext_key_t; items:Pdword):longint;cdecl;
      write_bytes : function (ext:Psnd_ctl_ext_t; key:Tsnd_ctl_ext_key_t; data:Pbyte; max_bytes:Tsize_t):longint;cdecl;
      write_iec958 : function (ext:Psnd_ctl_ext_t; key:Tsnd_ctl_ext_key_t; iec958:Psnd_aes_iec958_t):longint;cdecl;
      subscribe_events : procedure (ext:Psnd_ctl_ext_t; subscribe:longint);cdecl;
      read_event : function (ext:Psnd_ctl_ext_t; id:Psnd_ctl_elem_id_t; event_mask:Pdword):longint;cdecl;
      poll_descriptors_count : function (ext:Psnd_ctl_ext_t):longint;cdecl;
      poll_descriptors : function (ext:Psnd_ctl_ext_t; pfds:Ppollfd; space:dword):longint;cdecl;
      poll_revents : function (ext:Psnd_ctl_ext_t; pfds:Ppollfd; nfds:dword; revents:Pword):longint;cdecl;
    end;

{*
 * The access type bits stored in get_attribute callback
  }

  Psnd_ctl_ext_access = ^Tsnd_ctl_ext_access;
  Tsnd_ctl_ext_access =  Longint;
  Const
    SND_CTL_EXT_ACCESS_READ = 1 shl 0;
    SND_CTL_EXT_ACCESS_WRITE = 1 shl 1;
    SND_CTL_EXT_ACCESS_READWRITE = 3 shl 0;
    SND_CTL_EXT_ACCESS_VOLATILE = 1 shl 2;
    SND_CTL_EXT_ACCESS_TLV_READ = 1 shl 4;
    SND_CTL_EXT_ACCESS_TLV_WRITE = 1 shl 5;
    SND_CTL_EXT_ACCESS_TLV_READWRITE = 3 shl 4;
    SND_CTL_EXT_ACCESS_TLV_COMMAND = 1 shl 6;
    SND_CTL_EXT_ACCESS_INACTIVE = 1 shl 8;
    SND_CTL_EXT_ACCESS_TLV_CALLBACK = 1 shl 28;
;
  Tsnd_ctl_ext_access_t = Tsnd_ctl_ext_access;
  Psnd_ctl_ext_access_t = ^Tsnd_ctl_ext_access_t;
{*
 * find_elem callback returns this if no matching control element is found
  }

{ was #define dname def_expr }
function SND_CTL_EXT_KEY_NOT_FOUND : Tsnd_ctl_ext_key_t;  

(* Const before type ignored *)
function snd_ctl_ext_create(ext:Psnd_ctl_ext_t; name:Pchar; mode:longint):longint;cdecl;external;
function snd_ctl_ext_delete(ext:Psnd_ctl_ext_t):longint;cdecl;external;
{* \  }
{ C++ end of extern C conditionnal removed }
{$endif}
{ __ALSA_CONTROL_EXTERNAL_H  }

implementation

{ was #define dname def_expr }
function SND_CTL_EXT_KEY_NOT_FOUND : Tsnd_ctl_ext_key_t;
  begin
    SND_CTL_EXT_KEY_NOT_FOUND:=Tsnd_ctl_ext_key_t(-(1));
  end;


end.
