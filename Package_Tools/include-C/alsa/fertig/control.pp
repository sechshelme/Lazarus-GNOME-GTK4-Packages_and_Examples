
unit control;
interface

{
  Automatically converted by H2Pas 1.0.0 from control.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    control.h
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
Psnd_aes_iec958  = ^snd_aes_iec958;
Psnd_aes_iec958_t  = ^snd_aes_iec958_t;
Psnd_async_handler_t  = ^snd_async_handler_t;
Psnd_config_t  = ^snd_config_t;
Psnd_ctl_card_info_t  = ^snd_ctl_card_info_t;
Psnd_ctl_elem_id_t  = ^snd_ctl_elem_id_t;
Psnd_ctl_elem_iface  = ^snd_ctl_elem_iface;
Psnd_ctl_elem_iface_t  = ^snd_ctl_elem_iface_t;
Psnd_ctl_elem_info_t  = ^snd_ctl_elem_info_t;
Psnd_ctl_elem_list_t  = ^snd_ctl_elem_list_t;
Psnd_ctl_elem_type  = ^snd_ctl_elem_type;
Psnd_ctl_elem_type_t  = ^snd_ctl_elem_type_t;
Psnd_ctl_elem_value_t  = ^snd_ctl_elem_value_t;
Psnd_ctl_event_t  = ^snd_ctl_event_t;
Psnd_ctl_event_type  = ^snd_ctl_event_type;
Psnd_ctl_event_type_t  = ^snd_ctl_event_type_t;
Psnd_ctl_t  = ^snd_ctl_t;
Psnd_ctl_type  = ^snd_ctl_type;
Psnd_ctl_type_t  = ^snd_ctl_type_t;
Psnd_hctl_elem_t  = ^snd_hctl_elem_t;
Psnd_hctl_t  = ^snd_hctl_t;
Psnd_hwdep_info_t  = ^snd_hwdep_info_t;
Psnd_pcm_info_t  = ^snd_pcm_info_t;
Psnd_rawmidi_info_t  = ^snd_rawmidi_info_t;
Psnd_sctl_t  = ^snd_sctl_t;
Psnd_ump_block_info_t  = ^snd_ump_block_info_t;
Psnd_ump_endpoint_info_t  = ^snd_ump_endpoint_info_t;
Pword  = ^word;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*
 * \file include/control.h
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
{$ifndef __ALSA_CONTROL_H}
{$define __ALSA_CONTROL_H}
{ C++ extern C conditionnal removed }
{*
 *  \defgroup Control Control Interface
 *  The control interface.
 *  See \ref control page for more details.
 *  \
  }
{* dlsym version for interface entry callback  }

const
  SND_CONTROL_DLSYM_VERSION = _dlsym_control_001;  
{* IEC958 structure  }
{*< AES/IEC958 channel status bits  }
{*< AES/IEC958 subcode bits  }
{*< nothing  }
{*< AES/IEC958 subframe bits  }
type
  Psnd_aes_iec958 = ^Tsnd_aes_iec958;
  Tsnd_aes_iec958 = record
      status : array[0..23] of byte;
      subcode : array[0..146] of byte;
      pad : byte;
      dig_subframe : array[0..3] of byte;
    end;
  Tsnd_aes_iec958_t = Tsnd_aes_iec958;
  Psnd_aes_iec958_t = ^Tsnd_aes_iec958_t;
{* \brief CTL card info container.
 *
 * This type contains meta information about a sound card, such as the index,
 * name, longname, etc.
 *
 * \par Memory management
 *
 * Before using a snd_ctl_card_info_t object, it must be allocated using
 * snd_ctl_card_info_alloca() or snd_ctl_card_info_malloc(). When using the
 * latter, it must be freed again using snd_ctl_card_info_free().
 *
 * A card info object can be zeroed out using snd_ctl_card_info_clear().
 *
 * A card info object can be copied to another one using
 * snd_ctl_card_info_copy().
 *
 * \par Obtaining the Information
 *
 * To obtain the card information, it must first be opened using
 * snd_ctl_open(), and a snd_ctl_card_info_t container must be
 * allocated. Then, the information can be read using
 * snd_ctl_card_info_get_card().
 *
 * Thereafter, the card properties can be read using the
 * snd_ctl_card_info_get_*() functions.
  }
  Tsnd_ctl_card_info = Tsnd_ctl_card_info_t;
{* CTL element identifier container  }
  Tsnd_ctl_elem_id = Tsnd_ctl_elem_id_t;
{* CTL element list container
 *
 * This is a list of CTL elements. The list contains management
 * information (e.g. how many elements the sound card has) as well as
 * the element identifiers. All functions which operate on the list
 * are named snd_ctl_elem_list_*().
 *
 * \par Memory management
 *
 * There are two memory areas to deal with: The list container itself
 * and the memory for the element identifiers.
 *
 * To manage the area for the list container, the following functions
 * are used:
 *
 * - snd_ctl_elem_list_malloc() / snd_ctl_elem_list_free() to allocate
 *   and free memory on the heap, or
 * - snd_ctl_elem_list_alloca() to allocate the memory on the
 *   stack. This memory is auto-released when the stack is unwound.
 *
 * To manage the space for the element identifiers, the
 * snd_ctl_elem_list_alloc_space() and snd_ctl_elem_list_free_space()
 * are used. Allocating the right amount of space can be achieved by
 * first obtaining the number of elements and then calling
 * snd_ctl_elem_list_alloc_space():
 *
 * \code
 *   snd_ctl_elem_list_t* list;
 *   int count;
 *
 *   // Initialise list
 *   snd_ctl_elem_list_malloc(&list);
 *
 *   // Get number of elements
 *   snd_ctl_elem_list(ctl, list);
 *   count = snd_ctl_elem_list_get_count(list);
 *
 *   // Allocate space for identifiers
 *   snd_ctl_elem_list_alloc_space(list, count);
 *
 *   // Get identifiers
 *   snd_ctl_elem_list(ctl, list); // yes, this is same as above :)
 *
 *   // Do something useful with the list...
 *
 *   // Cleanup
 *   snd_ctl_elem_list_free_space(list);
 *   snd_ctl_elem_list_free(list);
 * \endcode
 *
 *
 * \par The Elements
 *
 * The elements in the list are accessed using an index. This index is
 * the location in the list; Don't confuse it with the 'index' of the
 * element identifier. For example:
 *
 * \code
 *     snd_ctl_elem_list_t list;
 *     unsigned int element_index;
 *
 *     // Allocate space, fill list ...
 *
 *     element_index = snd_ctl_elem_list_get_index(&list, 2);
 * \endcode
 *
 * This will access the 3rd element in the list (index=2) and get the
 * elements index from the driver (which might be 13, for example).
  }
  Tsnd_ctl_elem_list = Tsnd_ctl_elem_list_t;
{* CTL element info container  }
  Tsnd_ctl_elem_info = Tsnd_ctl_elem_info_t;
{* CTL element value container.
 *
 * Contains the value(s) (i.e. members) of a single element. All
 * values of a given element are of the same type.
 *
 * \par Memory management
 *
 * To access a value, a snd_ctl_elem_value_t must be allocated using
 * snd_ctl_elem_value_alloca() or snd_ctl_elem_value_malloc(). When
 * using the latter, it must be freed again using
 * snd_ctl_elem_value_free().
 *
 * A value object can be zeroed out using snd_ctl_elem_value_clear().
 *
 * A value object can be copied to another one using
 * snd_ctl_elem_value_copy().
 *
 * \par Identifier
 *
 * Then, the ID must be filled. It is sufficient to fill only the
 * numid, if known. Otherwise, interface type, device, subdevice,
 * name, index must all be given.  The following functions can be used
 * to fill the ID:
 *
 * - snd_ctl_elem_value_set_id(): Set the ID. Requires an
 *   snd_ctl_elem_id_t object.
 * - snd_ctl_elem_value_set_numid(): Set the numid.
 * - Or use all of the following:
 *
 *   - snd_ctl_elem_value_set_interface()
 *   - snd_ctl_elem_value_set_device()
 *   - snd_ctl_elem_value_set_subdevice()
 *   - snd_ctl_elem_value_set_name()
 *   - snd_ctl_elem_value_set_index()
 *
 * When communicating with the driver (snd_ctl_elem_read(),
 * snd_ctl_elem_write()), and the numid was given, the interface,
 * device, ... are filled (even if you set the before). When the numid
 * is unset (i.e. it is 0), it is filled.
 *
 * \par Communicating with the driver
 *
 * After the value container was created and filled with the ID of the
 * desired element, the value(s) can be fetched from the driver (and
 * thus from the hardware) or written to the driver.
 *
 * To fetch a value, use snd_ctl_elem_read(). Thereafter, use the
 * snd_ctl_elem_value_get_*() functions to obtain the actual value.
 *
 * To write a new value, first use a snd_ctl_elem_value_set_*() to set
 * it, then call snd_ctl_elem_write() to write it to the driver.
  }
  Tsnd_ctl_elem_value = Tsnd_ctl_elem_value_t;
{* CTL event container  }
  Tsnd_ctl_event = Tsnd_ctl_event_t;
{* CTL element type  }
{* Invalid type  }
{* Boolean contents  }
{* Integer contents  }
{* Enumerated contents  }
{* Bytes contents  }
{* IEC958 (S/PDIF) setting content  }
{* 64-bit integer contents  }

  Psnd_ctl_elem_type = ^Tsnd_ctl_elem_type;
  Tsnd_ctl_elem_type =  Longint;
  Const
    SND_CTL_ELEM_TYPE_NONE = 0;
    SND_CTL_ELEM_TYPE_BOOLEAN = 1;
    SND_CTL_ELEM_TYPE_INTEGER = 2;
    SND_CTL_ELEM_TYPE_ENUMERATED = 3;
    SND_CTL_ELEM_TYPE_BYTES = 4;
    SND_CTL_ELEM_TYPE_IEC958 = 5;
    SND_CTL_ELEM_TYPE_INTEGER64 = 6;
    SND_CTL_ELEM_TYPE_LAST = SND_CTL_ELEM_TYPE_INTEGER64;
;
  Tsnd_ctl_elem_type_t = Tsnd_ctl_elem_type;
  Psnd_ctl_elem_type_t = ^Tsnd_ctl_elem_type_t;
{* CTL related interface  }
{* Card level  }
{* Hardware dependent device  }
{* Mixer  }
{* PCM  }
{* RawMidi  }
{* Timer  }
{* Sequencer  }
type
  Psnd_ctl_elem_iface = ^Tsnd_ctl_elem_iface;
  Tsnd_ctl_elem_iface =  Longint;
  Const
    SND_CTL_ELEM_IFACE_CARD = 0;
    SND_CTL_ELEM_IFACE_HWDEP = 1;
    SND_CTL_ELEM_IFACE_MIXER = 2;
    SND_CTL_ELEM_IFACE_PCM = 3;
    SND_CTL_ELEM_IFACE_RAWMIDI = 4;
    SND_CTL_ELEM_IFACE_TIMER = 5;
    SND_CTL_ELEM_IFACE_SEQUENCER = 6;
    SND_CTL_ELEM_IFACE_LAST = SND_CTL_ELEM_IFACE_SEQUENCER;
;
  Tsnd_ctl_elem_iface_t = Tsnd_ctl_elem_iface;
  Psnd_ctl_elem_iface_t = ^Tsnd_ctl_elem_iface_t;
{* Event class  }
{* Elements related event  }
type
  Psnd_ctl_event_type = ^Tsnd_ctl_event_type;
  Tsnd_ctl_event_type =  Longint;
  Const
    SND_CTL_EVENT_ELEM = 0;
    SND_CTL_EVENT_LAST = SND_CTL_EVENT_ELEM;
;
  Tsnd_ctl_event_type_t = Tsnd_ctl_event_type;
  Psnd_ctl_event_type_t = ^Tsnd_ctl_event_type_t;
{* Element has been removed (Warning: test this first and if set don't
  * test the other masks) \hideinitializer  }
  SND_CTL_EVENT_MASK_REMOVE =  not (0);  
{* Element value has been changed \hideinitializer  }
  SND_CTL_EVENT_MASK_VALUE = 1 shl 0;  
{* Element info has been changed \hideinitializer  }
  SND_CTL_EVENT_MASK_INFO = 1 shl 1;  
{* Element has been added \hideinitializer  }
  SND_CTL_EVENT_MASK_ADD = 1 shl 2;  
{* Element's TLV value has been changed \hideinitializer  }
  SND_CTL_EVENT_MASK_TLV = 1 shl 3;  
{* CTL name helper  }
  SND_CTL_NAME_NONE = '';  
{* CTL name helper  }
  SND_CTL_NAME_PLAYBACK = 'Playback ';  
{* CTL name helper  }
  SND_CTL_NAME_CAPTURE = 'Capture ';  
{* CTL name helper  }
  SND_CTL_NAME_IEC958_NONE = '';  
{* CTL name helper  }
  SND_CTL_NAME_IEC958_SWITCH = 'Switch';  
{* CTL name helper  }
  SND_CTL_NAME_IEC958_VOLUME = 'Volume';  
{* CTL name helper  }
  SND_CTL_NAME_IEC958_DEFAULT = 'Default';  
{* CTL name helper  }
  SND_CTL_NAME_IEC958_MASK = 'Mask';  
{* CTL name helper  }
  SND_CTL_NAME_IEC958_CON_MASK = 'Con Mask';  
{* CTL name helper  }
  SND_CTL_NAME_IEC958_PRO_MASK = 'Pro Mask';  
{* CTL name helper  }
  SND_CTL_NAME_IEC958_PCM_STREAM = 'PCM Stream';  
{* Element name for IEC958 (S/PDIF)  }
{#define SND_CTL_NAME_IEC958(expl,direction,what)	"IEC958 " expl SND_CTL_NAME_##direction SND_CTL_NAME_IEC958_##what }
{* Mask for the major Power State identifier  }
  SND_CTL_POWER_MASK = $ff00;  
{* ACPI/PCI Power State D0  }
  SND_CTL_POWER_D0 = $0000;  
{* ACPI/PCI Power State D1  }
  SND_CTL_POWER_D1 = $0100;  
{* ACPI/PCI Power State D2  }
  SND_CTL_POWER_D2 = $0200;  
{* ACPI/PCI Power State D3  }
  SND_CTL_POWER_D3 = $0300;  
{* ACPI/PCI Power State D3hot  }
  SND_CTL_POWER_D3hot = SND_CTL_POWER_D3 or $0000;  
{* ACPI/PCI Power State D3cold  }
  SND_CTL_POWER_D3cold = SND_CTL_POWER_D3 or $0001;  
{* TLV type - Container  }
  SND_CTL_TLVT_CONTAINER = $0000;  
{* TLV type - basic dB scale  }
  SND_CTL_TLVT_DB_SCALE = $0001;  
{* TLV type - linear volume  }
  SND_CTL_TLVT_DB_LINEAR = $0002;  
{* TLV type - dB range container  }
  SND_CTL_TLVT_DB_RANGE = $0003;  
{* TLV type - dB scale specified by min/max values  }
  SND_CTL_TLVT_DB_MINMAX = $0004;  
{* TLV type - dB scale specified by min/max values (with mute)  }
  SND_CTL_TLVT_DB_MINMAX_MUTE = $0005;  
{* Mute state  }
  SND_CTL_TLV_DB_GAIN_MUTE = -(9999999);  
{* TLV type - fixed channel map positions  }
  SND_CTL_TLVT_CHMAP_FIXED = $00101;  
{* TLV type - freely swappable channel map positions  }
  SND_CTL_TLVT_CHMAP_VAR = $00102;  
{* TLV type - pair-wise swappable channel map positions  }
  SND_CTL_TLVT_CHMAP_PAIRED = $00103;  
{* CTL type  }
{* Kernel level CTL  }
{* Shared memory client CTL  }
{* INET client CTL (not yet implemented)  }
{* External control plugin  }
{* Control functionality remapping  }
type
  Psnd_ctl_type = ^Tsnd_ctl_type;
  Tsnd_ctl_type =  Longint;
  Const
    SND_CTL_TYPE_HW = 0;
    SND_CTL_TYPE_SHM = 1;
    SND_CTL_TYPE_INET = 2;
    SND_CTL_TYPE_EXT = 3;
    SND_CTL_TYPE_REMAP = 4;
;
  Tsnd_ctl_type_t = Tsnd_ctl_type;
  Psnd_ctl_type_t = ^Tsnd_ctl_type_t;
{* Non blocking mode (flag for open mode) \hideinitializer  }
  SND_CTL_NONBLOCK = $0001;  
{* Async notification (flag for open mode) \hideinitializer  }
  SND_CTL_ASYNC = $0002;  
{* Read only (flag for open mode) \hideinitializer  }
  SND_CTL_READONLY = $0004;  
{* Return EINTR instead blocking (flag for open mode) \hideinitializer  }
  SND_CTL_EINTR = $0080;  
{* CTL handle  }
type
  Tsnd_ctl = Tsnd_ctl_t;
{* Don't destroy the ctl handle when close  }

const
  SND_SCTL_NOFREE = $0001;  
{* SCTL type  }
type
  Tsnd_sctl = Tsnd_sctl_t;

function snd_card_load(card:longint):longint;cdecl;external;
function snd_card_next(card:Plongint):longint;cdecl;external;
(* Const before type ignored *)
function snd_card_get_index(name:Pchar):longint;cdecl;external;
function snd_card_get_name(card:longint; name:PPchar):longint;cdecl;external;
function snd_card_get_longname(card:longint; name:PPchar):longint;cdecl;external;
(* Const before type ignored *)
function snd_ctl_open(ctl:PPsnd_ctl_t; name:Pchar; mode:longint):longint;cdecl;external;
(* Const before type ignored *)
function snd_ctl_open_lconf(ctl:PPsnd_ctl_t; name:Pchar; mode:longint; lconf:Psnd_config_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function snd_ctl_open_fallback(ctl:PPsnd_ctl_t; root:Psnd_config_t; name:Pchar; orig_name:Pchar; mode:longint):longint;cdecl;external;
function snd_ctl_close(ctl:Psnd_ctl_t):longint;cdecl;external;
function snd_ctl_nonblock(ctl:Psnd_ctl_t; nonblock:longint):longint;cdecl;external;
{xxxxxxxxxxxxxxx static __inline__ int snd_ctl_abort(snd_ctl_t *ctl)  return snd_ctl_nonblock(ctl, 2);  }
function snd_async_add_ctl_handler(handler:PPsnd_async_handler_t; ctl:Psnd_ctl_t; callback:Tsnd_async_callback_t; private_data:pointer):longint;cdecl;external;
function snd_async_handler_get_ctl(handler:Psnd_async_handler_t):Psnd_ctl_t;cdecl;external;
function snd_ctl_poll_descriptors_count(ctl:Psnd_ctl_t):longint;cdecl;external;
function snd_ctl_poll_descriptors(ctl:Psnd_ctl_t; pfds:Ppollfd; space:dword):longint;cdecl;external;
function snd_ctl_poll_descriptors_revents(ctl:Psnd_ctl_t; pfds:Ppollfd; nfds:dword; revents:Pword):longint;cdecl;external;
function snd_ctl_subscribe_events(ctl:Psnd_ctl_t; subscribe:longint):longint;cdecl;external;
function snd_ctl_card_info(ctl:Psnd_ctl_t; info:Psnd_ctl_card_info_t):longint;cdecl;external;
function snd_ctl_elem_list(ctl:Psnd_ctl_t; list:Psnd_ctl_elem_list_t):longint;cdecl;external;
function snd_ctl_elem_info(ctl:Psnd_ctl_t; info:Psnd_ctl_elem_info_t):longint;cdecl;external;
function snd_ctl_elem_read(ctl:Psnd_ctl_t; data:Psnd_ctl_elem_value_t):longint;cdecl;external;
function snd_ctl_elem_write(ctl:Psnd_ctl_t; data:Psnd_ctl_elem_value_t):longint;cdecl;external;
function snd_ctl_elem_lock(ctl:Psnd_ctl_t; id:Psnd_ctl_elem_id_t):longint;cdecl;external;
function snd_ctl_elem_unlock(ctl:Psnd_ctl_t; id:Psnd_ctl_elem_id_t):longint;cdecl;external;
(* Const before type ignored *)
function snd_ctl_elem_tlv_read(ctl:Psnd_ctl_t; id:Psnd_ctl_elem_id_t; tlv:Pdword; tlv_size:dword):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function snd_ctl_elem_tlv_write(ctl:Psnd_ctl_t; id:Psnd_ctl_elem_id_t; tlv:Pdword):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function snd_ctl_elem_tlv_command(ctl:Psnd_ctl_t; id:Psnd_ctl_elem_id_t; tlv:Pdword):longint;cdecl;external;
{$ifdef __ALSA_HWDEP_H}
function snd_ctl_hwdep_next_device(ctl:Psnd_ctl_t; device:Plongint):longint;cdecl;external;
function snd_ctl_hwdep_info(ctl:Psnd_ctl_t; info:Psnd_hwdep_info_t):longint;cdecl;external;
{$endif}
{$ifdef __ALSA_PCM_H}

function snd_ctl_pcm_next_device(ctl:Psnd_ctl_t; device:Plongint):longint;cdecl;external;
function snd_ctl_pcm_info(ctl:Psnd_ctl_t; info:Psnd_pcm_info_t):longint;cdecl;external;
function snd_ctl_pcm_prefer_subdevice(ctl:Psnd_ctl_t; subdev:longint):longint;cdecl;external;
{$endif}
{$ifdef __ALSA_RAWMIDI_H}

function snd_ctl_rawmidi_next_device(ctl:Psnd_ctl_t; device:Plongint):longint;cdecl;external;
function snd_ctl_rawmidi_info(ctl:Psnd_ctl_t; info:Psnd_rawmidi_info_t):longint;cdecl;external;
function snd_ctl_rawmidi_prefer_subdevice(ctl:Psnd_ctl_t; subdev:longint):longint;cdecl;external;
{$endif}
{$ifdef __ALSA_UMP_H}

function snd_ctl_ump_next_device(ctl:Psnd_ctl_t; device:Plongint):longint;cdecl;external;
function snd_ctl_ump_endpoint_info(ctl:Psnd_ctl_t; info:Psnd_ump_endpoint_info_t):longint;cdecl;external;
function snd_ctl_ump_block_info(ctl:Psnd_ctl_t; info:Psnd_ump_block_info_t):longint;cdecl;external;
{$endif}

function snd_ctl_set_power_state(ctl:Psnd_ctl_t; state:dword):longint;cdecl;external;
function snd_ctl_get_power_state(ctl:Psnd_ctl_t; state:Pdword):longint;cdecl;external;
function snd_ctl_read(ctl:Psnd_ctl_t; event:Psnd_ctl_event_t):longint;cdecl;external;
function snd_ctl_wait(ctl:Psnd_ctl_t; timeout:longint):longint;cdecl;external;
(* Const before type ignored *)
function snd_ctl_name(ctl:Psnd_ctl_t):Pchar;cdecl;external;
function snd_ctl_type(ctl:Psnd_ctl_t):Tsnd_ctl_type_t;cdecl;external;
(* Const before type ignored *)
function snd_ctl_elem_type_name(_type:Tsnd_ctl_elem_type_t):Pchar;cdecl;external;
(* Const before type ignored *)
function snd_ctl_elem_iface_name(iface:Tsnd_ctl_elem_iface_t):Pchar;cdecl;external;
(* Const before type ignored *)
function snd_ctl_event_type_name(_type:Tsnd_ctl_event_type_t):Pchar;cdecl;external;
(* Const before type ignored *)
function snd_ctl_event_elem_get_mask(obj:Psnd_ctl_event_t):dword;cdecl;external;
(* Const before type ignored *)
function snd_ctl_event_elem_get_numid(obj:Psnd_ctl_event_t):dword;cdecl;external;
(* Const before type ignored *)
procedure snd_ctl_event_elem_get_id(obj:Psnd_ctl_event_t; ptr:Psnd_ctl_elem_id_t);cdecl;external;
(* Const before type ignored *)
function snd_ctl_event_elem_get_interface(obj:Psnd_ctl_event_t):Tsnd_ctl_elem_iface_t;cdecl;external;
(* Const before type ignored *)
function snd_ctl_event_elem_get_device(obj:Psnd_ctl_event_t):dword;cdecl;external;
(* Const before type ignored *)
function snd_ctl_event_elem_get_subdevice(obj:Psnd_ctl_event_t):dword;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function snd_ctl_event_elem_get_name(obj:Psnd_ctl_event_t):Pchar;cdecl;external;
(* Const before type ignored *)
function snd_ctl_event_elem_get_index(obj:Psnd_ctl_event_t):dword;cdecl;external;
function snd_ctl_elem_list_alloc_space(obj:Psnd_ctl_elem_list_t; entries:dword):longint;cdecl;external;
procedure snd_ctl_elem_list_free_space(obj:Psnd_ctl_elem_list_t);cdecl;external;
function snd_ctl_ascii_elem_id_get(id:Psnd_ctl_elem_id_t):Pchar;cdecl;external;
(* Const before type ignored *)
function snd_ctl_ascii_elem_id_parse(dst:Psnd_ctl_elem_id_t; str:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function snd_ctl_ascii_value_parse(handle:Psnd_ctl_t; dst:Psnd_ctl_elem_value_t; info:Psnd_ctl_elem_info_t; value:Pchar):longint;cdecl;external;
function snd_ctl_elem_id_sizeof:Tsize_t;cdecl;external;
{* \hideinitializer
 * \brief allocate an invalid #snd_ctl_elem_id_t using standard alloca
 * \param ptr returned pointer
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function snd_ctl_elem_id_alloca(ptr : longint) : longint;

function snd_ctl_elem_id_malloc(ptr:PPsnd_ctl_elem_id_t):longint;cdecl;external;
procedure snd_ctl_elem_id_free(obj:Psnd_ctl_elem_id_t);cdecl;external;
procedure snd_ctl_elem_id_clear(obj:Psnd_ctl_elem_id_t);cdecl;external;
(* Const before type ignored *)
procedure snd_ctl_elem_id_copy(dst:Psnd_ctl_elem_id_t; src:Psnd_ctl_elem_id_t);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function snd_ctl_elem_id_compare_numid(id1:Psnd_ctl_elem_id_t; id2:Psnd_ctl_elem_id_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function snd_ctl_elem_id_compare_set(id1:Psnd_ctl_elem_id_t; id2:Psnd_ctl_elem_id_t):longint;cdecl;external;
(* Const before type ignored *)
function snd_ctl_elem_id_get_numid(obj:Psnd_ctl_elem_id_t):dword;cdecl;external;
(* Const before type ignored *)
function snd_ctl_elem_id_get_interface(obj:Psnd_ctl_elem_id_t):Tsnd_ctl_elem_iface_t;cdecl;external;
(* Const before type ignored *)
function snd_ctl_elem_id_get_device(obj:Psnd_ctl_elem_id_t):dword;cdecl;external;
(* Const before type ignored *)
function snd_ctl_elem_id_get_subdevice(obj:Psnd_ctl_elem_id_t):dword;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function snd_ctl_elem_id_get_name(obj:Psnd_ctl_elem_id_t):Pchar;cdecl;external;
(* Const before type ignored *)
function snd_ctl_elem_id_get_index(obj:Psnd_ctl_elem_id_t):dword;cdecl;external;
procedure snd_ctl_elem_id_set_numid(obj:Psnd_ctl_elem_id_t; val:dword);cdecl;external;
procedure snd_ctl_elem_id_set_interface(obj:Psnd_ctl_elem_id_t; val:Tsnd_ctl_elem_iface_t);cdecl;external;
procedure snd_ctl_elem_id_set_device(obj:Psnd_ctl_elem_id_t; val:dword);cdecl;external;
procedure snd_ctl_elem_id_set_subdevice(obj:Psnd_ctl_elem_id_t; val:dword);cdecl;external;
(* Const before type ignored *)
procedure snd_ctl_elem_id_set_name(obj:Psnd_ctl_elem_id_t; val:Pchar);cdecl;external;
procedure snd_ctl_elem_id_set_index(obj:Psnd_ctl_elem_id_t; val:dword);cdecl;external;
function snd_ctl_card_info_sizeof:Tsize_t;cdecl;external;
{* \hideinitializer
 * \brief Allocate an invalid #snd_ctl_card_info_t on the stack.
 *
 * Allocate space for a card info object on the stack. The allocated
 * memory need not be freed, because it is on the stack.
 *
 * See snd_ctl_card_info_t for details.
 *
 * \param ptr Pointer to a snd_ctl_elem_value_t pointer. The address
 *            of the allocated space will returned here.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function snd_ctl_card_info_alloca(ptr : longint) : longint;

function snd_ctl_card_info_malloc(ptr:PPsnd_ctl_card_info_t):longint;cdecl;external;
procedure snd_ctl_card_info_free(obj:Psnd_ctl_card_info_t);cdecl;external;
procedure snd_ctl_card_info_clear(obj:Psnd_ctl_card_info_t);cdecl;external;
(* Const before type ignored *)
procedure snd_ctl_card_info_copy(dst:Psnd_ctl_card_info_t; src:Psnd_ctl_card_info_t);cdecl;external;
(* Const before type ignored *)
function snd_ctl_card_info_get_card(obj:Psnd_ctl_card_info_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function snd_ctl_card_info_get_id(obj:Psnd_ctl_card_info_t):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function snd_ctl_card_info_get_driver(obj:Psnd_ctl_card_info_t):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function snd_ctl_card_info_get_name(obj:Psnd_ctl_card_info_t):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function snd_ctl_card_info_get_longname(obj:Psnd_ctl_card_info_t):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function snd_ctl_card_info_get_mixername(obj:Psnd_ctl_card_info_t):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function snd_ctl_card_info_get_components(obj:Psnd_ctl_card_info_t):Pchar;cdecl;external;
function snd_ctl_event_sizeof:Tsize_t;cdecl;external;
{* \hideinitializer
 * \brief allocate an invalid #snd_ctl_event_t using standard alloca
 * \param ptr returned pointer
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function snd_ctl_event_alloca(ptr : longint) : longint;

function snd_ctl_event_malloc(ptr:PPsnd_ctl_event_t):longint;cdecl;external;
procedure snd_ctl_event_free(obj:Psnd_ctl_event_t);cdecl;external;
procedure snd_ctl_event_clear(obj:Psnd_ctl_event_t);cdecl;external;
(* Const before type ignored *)
procedure snd_ctl_event_copy(dst:Psnd_ctl_event_t; src:Psnd_ctl_event_t);cdecl;external;
(* Const before type ignored *)
function snd_ctl_event_get_type(obj:Psnd_ctl_event_t):Tsnd_ctl_event_type_t;cdecl;external;
function snd_ctl_elem_list_sizeof:Tsize_t;cdecl;external;
{* \hideinitializer
 *
 * \brief Allocate a #snd_ctl_elem_list_t using standard alloca.
 *
 * The memory is allocated on the stack and will automatically be
 * released when the stack unwinds (i.e. no free() is needed).
 *
 * \param ptr Pointer to allocated memory.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function snd_ctl_elem_list_alloca(ptr : longint) : longint;

function snd_ctl_elem_list_malloc(ptr:PPsnd_ctl_elem_list_t):longint;cdecl;external;
procedure snd_ctl_elem_list_free(obj:Psnd_ctl_elem_list_t);cdecl;external;
procedure snd_ctl_elem_list_clear(obj:Psnd_ctl_elem_list_t);cdecl;external;
(* Const before type ignored *)
procedure snd_ctl_elem_list_copy(dst:Psnd_ctl_elem_list_t; src:Psnd_ctl_elem_list_t);cdecl;external;
procedure snd_ctl_elem_list_set_offset(obj:Psnd_ctl_elem_list_t; val:dword);cdecl;external;
(* Const before type ignored *)
function snd_ctl_elem_list_get_used(obj:Psnd_ctl_elem_list_t):dword;cdecl;external;
(* Const before type ignored *)
function snd_ctl_elem_list_get_count(obj:Psnd_ctl_elem_list_t):dword;cdecl;external;
(* Const before type ignored *)
procedure snd_ctl_elem_list_get_id(obj:Psnd_ctl_elem_list_t; idx:dword; ptr:Psnd_ctl_elem_id_t);cdecl;external;
(* Const before type ignored *)
function snd_ctl_elem_list_get_numid(obj:Psnd_ctl_elem_list_t; idx:dword):dword;cdecl;external;
(* Const before type ignored *)
function snd_ctl_elem_list_get_interface(obj:Psnd_ctl_elem_list_t; idx:dword):Tsnd_ctl_elem_iface_t;cdecl;external;
(* Const before type ignored *)
function snd_ctl_elem_list_get_device(obj:Psnd_ctl_elem_list_t; idx:dword):dword;cdecl;external;
(* Const before type ignored *)
function snd_ctl_elem_list_get_subdevice(obj:Psnd_ctl_elem_list_t; idx:dword):dword;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function snd_ctl_elem_list_get_name(obj:Psnd_ctl_elem_list_t; idx:dword):Pchar;cdecl;external;
(* Const before type ignored *)
function snd_ctl_elem_list_get_index(obj:Psnd_ctl_elem_list_t; idx:dword):dword;cdecl;external;
function snd_ctl_elem_info_sizeof:Tsize_t;cdecl;external;
{* \hideinitializer
 * \brief allocate an invalid #snd_ctl_elem_info_t using standard alloca
 * \param ptr returned pointer
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function snd_ctl_elem_info_alloca(ptr : longint) : longint;

function snd_ctl_elem_info_malloc(ptr:PPsnd_ctl_elem_info_t):longint;cdecl;external;
procedure snd_ctl_elem_info_free(obj:Psnd_ctl_elem_info_t);cdecl;external;
procedure snd_ctl_elem_info_clear(obj:Psnd_ctl_elem_info_t);cdecl;external;
(* Const before type ignored *)
procedure snd_ctl_elem_info_copy(dst:Psnd_ctl_elem_info_t; src:Psnd_ctl_elem_info_t);cdecl;external;
(* Const before type ignored *)
function snd_ctl_elem_info_get_type(obj:Psnd_ctl_elem_info_t):Tsnd_ctl_elem_type_t;cdecl;external;
(* Const before type ignored *)
function snd_ctl_elem_info_is_readable(obj:Psnd_ctl_elem_info_t):longint;cdecl;external;
(* Const before type ignored *)
function snd_ctl_elem_info_is_writable(obj:Psnd_ctl_elem_info_t):longint;cdecl;external;
(* Const before type ignored *)
function snd_ctl_elem_info_is_volatile(obj:Psnd_ctl_elem_info_t):longint;cdecl;external;
(* Const before type ignored *)
function snd_ctl_elem_info_is_inactive(obj:Psnd_ctl_elem_info_t):longint;cdecl;external;
(* Const before type ignored *)
function snd_ctl_elem_info_is_locked(obj:Psnd_ctl_elem_info_t):longint;cdecl;external;
(* Const before type ignored *)
function snd_ctl_elem_info_is_tlv_readable(obj:Psnd_ctl_elem_info_t):longint;cdecl;external;
(* Const before type ignored *)
function snd_ctl_elem_info_is_tlv_writable(obj:Psnd_ctl_elem_info_t):longint;cdecl;external;
(* Const before type ignored *)
function snd_ctl_elem_info_is_tlv_commandable(obj:Psnd_ctl_elem_info_t):longint;cdecl;external;
(* Const before type ignored *)
function snd_ctl_elem_info_is_owner(obj:Psnd_ctl_elem_info_t):longint;cdecl;external;
(* Const before type ignored *)
function snd_ctl_elem_info_is_user(obj:Psnd_ctl_elem_info_t):longint;cdecl;external;
(* Const before type ignored *)
function snd_ctl_elem_info_get_owner(obj:Psnd_ctl_elem_info_t):Tpid_t;cdecl;external;
(* Const before type ignored *)
function snd_ctl_elem_info_get_count(obj:Psnd_ctl_elem_info_t):dword;cdecl;external;
(* Const before type ignored *)
function snd_ctl_elem_info_get_min(obj:Psnd_ctl_elem_info_t):longint;cdecl;external;
(* Const before type ignored *)
function snd_ctl_elem_info_get_max(obj:Psnd_ctl_elem_info_t):longint;cdecl;external;
(* Const before type ignored *)
function snd_ctl_elem_info_get_step(obj:Psnd_ctl_elem_info_t):longint;cdecl;external;
(* Const before type ignored *)
function snd_ctl_elem_info_get_min64(obj:Psnd_ctl_elem_info_t):int64;cdecl;external;
(* Const before type ignored *)
function snd_ctl_elem_info_get_max64(obj:Psnd_ctl_elem_info_t):int64;cdecl;external;
(* Const before type ignored *)
function snd_ctl_elem_info_get_step64(obj:Psnd_ctl_elem_info_t):int64;cdecl;external;
(* Const before type ignored *)
function snd_ctl_elem_info_get_items(obj:Psnd_ctl_elem_info_t):dword;cdecl;external;
procedure snd_ctl_elem_info_set_item(obj:Psnd_ctl_elem_info_t; val:dword);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function snd_ctl_elem_info_get_item_name(obj:Psnd_ctl_elem_info_t):Pchar;cdecl;external;
(* Const before type ignored *)
function snd_ctl_elem_info_get_dimensions(obj:Psnd_ctl_elem_info_t):longint;cdecl;external;
(* Const before type ignored *)
function snd_ctl_elem_info_get_dimension(obj:Psnd_ctl_elem_info_t; idx:dword):longint;cdecl;external;
(* Const before type ignored *)
function snd_ctl_elem_info_set_dimension(info:Psnd_ctl_elem_info_t; dimension:array[0..3] of longint):longint;cdecl;external;
(* Const before type ignored *)
procedure snd_ctl_elem_info_get_id(obj:Psnd_ctl_elem_info_t; ptr:Psnd_ctl_elem_id_t);cdecl;external;
(* Const before type ignored *)
function snd_ctl_elem_info_get_numid(obj:Psnd_ctl_elem_info_t):dword;cdecl;external;
(* Const before type ignored *)
function snd_ctl_elem_info_get_interface(obj:Psnd_ctl_elem_info_t):Tsnd_ctl_elem_iface_t;cdecl;external;
(* Const before type ignored *)
function snd_ctl_elem_info_get_device(obj:Psnd_ctl_elem_info_t):dword;cdecl;external;
(* Const before type ignored *)
function snd_ctl_elem_info_get_subdevice(obj:Psnd_ctl_elem_info_t):dword;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function snd_ctl_elem_info_get_name(obj:Psnd_ctl_elem_info_t):Pchar;cdecl;external;
(* Const before type ignored *)
function snd_ctl_elem_info_get_index(obj:Psnd_ctl_elem_info_t):dword;cdecl;external;
(* Const before type ignored *)
procedure snd_ctl_elem_info_set_id(obj:Psnd_ctl_elem_info_t; ptr:Psnd_ctl_elem_id_t);cdecl;external;
procedure snd_ctl_elem_info_set_numid(obj:Psnd_ctl_elem_info_t; val:dword);cdecl;external;
procedure snd_ctl_elem_info_set_interface(obj:Psnd_ctl_elem_info_t; val:Tsnd_ctl_elem_iface_t);cdecl;external;
procedure snd_ctl_elem_info_set_device(obj:Psnd_ctl_elem_info_t; val:dword);cdecl;external;
procedure snd_ctl_elem_info_set_subdevice(obj:Psnd_ctl_elem_info_t; val:dword);cdecl;external;
(* Const before type ignored *)
procedure snd_ctl_elem_info_set_name(obj:Psnd_ctl_elem_info_t; val:Pchar);cdecl;external;
procedure snd_ctl_elem_info_set_index(obj:Psnd_ctl_elem_info_t; val:dword);cdecl;external;
procedure snd_ctl_elem_info_set_read_write(obj:Psnd_ctl_elem_info_t; rval:longint; wval:longint);cdecl;external;
procedure snd_ctl_elem_info_set_tlv_read_write(obj:Psnd_ctl_elem_info_t; rval:longint; wval:longint);cdecl;external;
procedure snd_ctl_elem_info_set_inactive(obj:Psnd_ctl_elem_info_t; val:longint);cdecl;external;
function snd_ctl_add_integer_elem_set(ctl:Psnd_ctl_t; info:Psnd_ctl_elem_info_t; element_count:dword; member_count:dword; min:longint; 
           max:longint; step:longint):longint;cdecl;external;
function snd_ctl_add_integer64_elem_set(ctl:Psnd_ctl_t; info:Psnd_ctl_elem_info_t; element_count:dword; member_count:dword; min:int64; 
           max:int64; step:int64):longint;cdecl;external;
function snd_ctl_add_boolean_elem_set(ctl:Psnd_ctl_t; info:Psnd_ctl_elem_info_t; element_count:dword; member_count:dword):longint;cdecl;external;
(* Const before type ignored *)
(* Const before declarator ignored *)
function snd_ctl_add_enumerated_elem_set(ctl:Psnd_ctl_t; info:Psnd_ctl_elem_info_t; element_count:dword; member_count:dword; items:dword; 
           labels:PPchar):longint;cdecl;external;
function snd_ctl_add_bytes_elem_set(ctl:Psnd_ctl_t; info:Psnd_ctl_elem_info_t; element_count:dword; member_count:dword):longint;cdecl;external;
(* Const before type ignored *)
function snd_ctl_elem_add_integer(ctl:Psnd_ctl_t; id:Psnd_ctl_elem_id_t; count:dword; imin:longint; imax:longint; 
           istep:longint):longint;cdecl;external;
(* Const before type ignored *)
function snd_ctl_elem_add_integer64(ctl:Psnd_ctl_t; id:Psnd_ctl_elem_id_t; count:dword; imin:int64; imax:int64; 
           istep:int64):longint;cdecl;external;
(* Const before type ignored *)
function snd_ctl_elem_add_boolean(ctl:Psnd_ctl_t; id:Psnd_ctl_elem_id_t; count:dword):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before declarator ignored *)
function snd_ctl_elem_add_enumerated(ctl:Psnd_ctl_t; id:Psnd_ctl_elem_id_t; count:dword; items:dword; names:PPchar):longint;cdecl;external;
(* Const before type ignored *)
function snd_ctl_elem_add_iec958(ctl:Psnd_ctl_t; id:Psnd_ctl_elem_id_t):longint;cdecl;external;
function snd_ctl_elem_remove(ctl:Psnd_ctl_t; id:Psnd_ctl_elem_id_t):longint;cdecl;external;
function snd_ctl_elem_value_sizeof:Tsize_t;cdecl;external;
{* \hideinitializer
 * \brief Allocate an invalid #snd_ctl_elem_value_t on the stack.
 *
 * Allocate space for a value object on the stack. The allocated
 * memory need not be freed, because it is on the stack.
 *
 * See snd_ctl_elem_value_t for details.
 *
 * \param ptr Pointer to a snd_ctl_elem_value_t pointer. The address
 *            of the allocated space will returned here.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function snd_ctl_elem_value_alloca(ptr : longint) : longint;

function snd_ctl_elem_value_malloc(ptr:PPsnd_ctl_elem_value_t):longint;cdecl;external;
procedure snd_ctl_elem_value_free(obj:Psnd_ctl_elem_value_t);cdecl;external;
procedure snd_ctl_elem_value_clear(obj:Psnd_ctl_elem_value_t);cdecl;external;
(* Const before type ignored *)
procedure snd_ctl_elem_value_copy(dst:Psnd_ctl_elem_value_t; src:Psnd_ctl_elem_value_t);cdecl;external;
(* Const before type ignored *)
function snd_ctl_elem_value_compare(left:Psnd_ctl_elem_value_t; right:Psnd_ctl_elem_value_t):longint;cdecl;external;
(* Const before type ignored *)
procedure snd_ctl_elem_value_get_id(obj:Psnd_ctl_elem_value_t; ptr:Psnd_ctl_elem_id_t);cdecl;external;
(* Const before type ignored *)
function snd_ctl_elem_value_get_numid(obj:Psnd_ctl_elem_value_t):dword;cdecl;external;
(* Const before type ignored *)
function snd_ctl_elem_value_get_interface(obj:Psnd_ctl_elem_value_t):Tsnd_ctl_elem_iface_t;cdecl;external;
(* Const before type ignored *)
function snd_ctl_elem_value_get_device(obj:Psnd_ctl_elem_value_t):dword;cdecl;external;
(* Const before type ignored *)
function snd_ctl_elem_value_get_subdevice(obj:Psnd_ctl_elem_value_t):dword;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function snd_ctl_elem_value_get_name(obj:Psnd_ctl_elem_value_t):Pchar;cdecl;external;
(* Const before type ignored *)
function snd_ctl_elem_value_get_index(obj:Psnd_ctl_elem_value_t):dword;cdecl;external;
(* Const before type ignored *)
procedure snd_ctl_elem_value_set_id(obj:Psnd_ctl_elem_value_t; ptr:Psnd_ctl_elem_id_t);cdecl;external;
procedure snd_ctl_elem_value_set_numid(obj:Psnd_ctl_elem_value_t; val:dword);cdecl;external;
procedure snd_ctl_elem_value_set_interface(obj:Psnd_ctl_elem_value_t; val:Tsnd_ctl_elem_iface_t);cdecl;external;
procedure snd_ctl_elem_value_set_device(obj:Psnd_ctl_elem_value_t; val:dword);cdecl;external;
procedure snd_ctl_elem_value_set_subdevice(obj:Psnd_ctl_elem_value_t; val:dword);cdecl;external;
(* Const before type ignored *)
procedure snd_ctl_elem_value_set_name(obj:Psnd_ctl_elem_value_t; val:Pchar);cdecl;external;
procedure snd_ctl_elem_value_set_index(obj:Psnd_ctl_elem_value_t; val:dword);cdecl;external;
(* Const before type ignored *)
function snd_ctl_elem_value_get_boolean(obj:Psnd_ctl_elem_value_t; idx:dword):longint;cdecl;external;
(* Const before type ignored *)
function snd_ctl_elem_value_get_integer(obj:Psnd_ctl_elem_value_t; idx:dword):longint;cdecl;external;
(* Const before type ignored *)
function snd_ctl_elem_value_get_integer64(obj:Psnd_ctl_elem_value_t; idx:dword):int64;cdecl;external;
(* Const before type ignored *)
function snd_ctl_elem_value_get_enumerated(obj:Psnd_ctl_elem_value_t; idx:dword):dword;cdecl;external;
(* Const before type ignored *)
function snd_ctl_elem_value_get_byte(obj:Psnd_ctl_elem_value_t; idx:dword):byte;cdecl;external;
procedure snd_ctl_elem_value_set_boolean(obj:Psnd_ctl_elem_value_t; idx:dword; val:longint);cdecl;external;
procedure snd_ctl_elem_value_set_integer(obj:Psnd_ctl_elem_value_t; idx:dword; val:longint);cdecl;external;
procedure snd_ctl_elem_value_set_integer64(obj:Psnd_ctl_elem_value_t; idx:dword; val:int64);cdecl;external;
procedure snd_ctl_elem_value_set_enumerated(obj:Psnd_ctl_elem_value_t; idx:dword; val:dword);cdecl;external;
procedure snd_ctl_elem_value_set_byte(obj:Psnd_ctl_elem_value_t; idx:dword; val:byte);cdecl;external;
procedure snd_ctl_elem_set_bytes(obj:Psnd_ctl_elem_value_t; data:pointer; size:Tsize_t);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function snd_ctl_elem_value_get_bytes(obj:Psnd_ctl_elem_value_t):pointer;cdecl;external;
(* Const before type ignored *)
procedure snd_ctl_elem_value_get_iec958(obj:Psnd_ctl_elem_value_t; ptr:Psnd_aes_iec958_t);cdecl;external;
(* Const before type ignored *)
procedure snd_ctl_elem_value_set_iec958(obj:Psnd_ctl_elem_value_t; ptr:Psnd_aes_iec958_t);cdecl;external;
function snd_tlv_parse_dB_info(tlv:Pdword; tlv_size:dword; db_tlvp:PPdword):longint;cdecl;external;
function snd_tlv_get_dB_range(tlv:Pdword; rangemin:longint; rangemax:longint; min:Plongint; max:Plongint):longint;cdecl;external;
function snd_tlv_convert_to_dB(tlv:Pdword; rangemin:longint; rangemax:longint; volume:longint; db_gain:Plongint):longint;cdecl;external;
function snd_tlv_convert_from_dB(tlv:Pdword; rangemin:longint; rangemax:longint; db_gain:longint; value:Plongint; 
           xdir:longint):longint;cdecl;external;
(* Const before type ignored *)
function snd_ctl_get_dB_range(ctl:Psnd_ctl_t; id:Psnd_ctl_elem_id_t; min:Plongint; max:Plongint):longint;cdecl;external;
(* Const before type ignored *)
function snd_ctl_convert_to_dB(ctl:Psnd_ctl_t; id:Psnd_ctl_elem_id_t; volume:longint; db_gain:Plongint):longint;cdecl;external;
(* Const before type ignored *)
function snd_ctl_convert_from_dB(ctl:Psnd_ctl_t; id:Psnd_ctl_elem_id_t; db_gain:longint; value:Plongint; xdir:longint):longint;cdecl;external;
{*
 *  \defgroup HControl High level Control Interface
 *  \ingroup Control
 *  The high level control interface.
 *  See \ref hcontrol page for more details.
 *  \
  }
{* HCTL element handle  }
type
  Tsnd_hctl_elem = Tsnd_hctl_elem_t;
{* HCTL handle  }
  Tsnd_hctl = Tsnd_hctl_t;
{*
 * \brief Compare function for sorting HCTL elements
 * \param e1 First element
 * \param e2 Second element
 * \return -1 if e1 < e2, 0 if e1 == e2, 1 if e1 > e2
  }
(* Const before type ignored *)
(* Const before type ignored *)

  Tsnd_hctl_compare_t = function (e1:Psnd_hctl_elem_t; e2:Psnd_hctl_elem_t):longint;cdecl;
(* Const before type ignored *)
(* Const before type ignored *)

function snd_hctl_compare_fast(c1:Psnd_hctl_elem_t; c2:Psnd_hctl_elem_t):longint;cdecl;external;
{* 
 * \brief HCTL callback function
 * \param hctl HCTL handle
 * \param mask event mask
 * \param elem related HCTL element (if any)
 * \return 0 on success otherwise a negative error code
  }
type

  Tsnd_hctl_callback_t = function (hctl:Psnd_hctl_t; mask:dword; elem:Psnd_hctl_elem_t):longint;cdecl;
{* 
 * \brief HCTL element callback function
 * \param elem HCTL element
 * \param mask event mask
 * \return 0 on success otherwise a negative error code
  }

  Tsnd_hctl_elem_callback_t = function (elem:Psnd_hctl_elem_t; mask:dword):longint;cdecl;
(* Const before type ignored *)

function snd_hctl_open(hctl:PPsnd_hctl_t; name:Pchar; mode:longint):longint;cdecl;external;
function snd_hctl_open_ctl(hctlp:PPsnd_hctl_t; ctl:Psnd_ctl_t):longint;cdecl;external;
function snd_hctl_close(hctl:Psnd_hctl_t):longint;cdecl;external;
function snd_hctl_nonblock(hctl:Psnd_hctl_t; nonblock:longint):longint;cdecl;external;
{xxxxxxxxxxxxxxx static __inline__ int snd_hctl_abort(snd_hctl_t *hctl)  return snd_hctl_nonblock(hctl, 2);  }
function snd_hctl_poll_descriptors_count(hctl:Psnd_hctl_t):longint;cdecl;external;
function snd_hctl_poll_descriptors(hctl:Psnd_hctl_t; pfds:Ppollfd; space:dword):longint;cdecl;external;
function snd_hctl_poll_descriptors_revents(ctl:Psnd_hctl_t; pfds:Ppollfd; nfds:dword; revents:Pword):longint;cdecl;external;
function snd_hctl_get_count(hctl:Psnd_hctl_t):dword;cdecl;external;
function snd_hctl_set_compare(hctl:Psnd_hctl_t; hsort:Tsnd_hctl_compare_t):longint;cdecl;external;
function snd_hctl_first_elem(hctl:Psnd_hctl_t):Psnd_hctl_elem_t;cdecl;external;
function snd_hctl_last_elem(hctl:Psnd_hctl_t):Psnd_hctl_elem_t;cdecl;external;
(* Const before type ignored *)
function snd_hctl_find_elem(hctl:Psnd_hctl_t; id:Psnd_ctl_elem_id_t):Psnd_hctl_elem_t;cdecl;external;
procedure snd_hctl_set_callback(hctl:Psnd_hctl_t; callback:Tsnd_hctl_callback_t);cdecl;external;
procedure snd_hctl_set_callback_private(hctl:Psnd_hctl_t; data:pointer);cdecl;external;
function snd_hctl_get_callback_private(hctl:Psnd_hctl_t):pointer;cdecl;external;
function snd_hctl_load(hctl:Psnd_hctl_t):longint;cdecl;external;
function snd_hctl_free(hctl:Psnd_hctl_t):longint;cdecl;external;
function snd_hctl_handle_events(hctl:Psnd_hctl_t):longint;cdecl;external;
(* Const before type ignored *)
function snd_hctl_name(hctl:Psnd_hctl_t):Pchar;cdecl;external;
function snd_hctl_wait(hctl:Psnd_hctl_t; timeout:longint):longint;cdecl;external;
function snd_hctl_ctl(hctl:Psnd_hctl_t):Psnd_ctl_t;cdecl;external;
function snd_hctl_elem_next(elem:Psnd_hctl_elem_t):Psnd_hctl_elem_t;cdecl;external;
function snd_hctl_elem_prev(elem:Psnd_hctl_elem_t):Psnd_hctl_elem_t;cdecl;external;
function snd_hctl_elem_info(elem:Psnd_hctl_elem_t; info:Psnd_ctl_elem_info_t):longint;cdecl;external;
function snd_hctl_elem_read(elem:Psnd_hctl_elem_t; value:Psnd_ctl_elem_value_t):longint;cdecl;external;
function snd_hctl_elem_write(elem:Psnd_hctl_elem_t; value:Psnd_ctl_elem_value_t):longint;cdecl;external;
function snd_hctl_elem_tlv_read(elem:Psnd_hctl_elem_t; tlv:Pdword; tlv_size:dword):longint;cdecl;external;
(* Const before type ignored *)
function snd_hctl_elem_tlv_write(elem:Psnd_hctl_elem_t; tlv:Pdword):longint;cdecl;external;
(* Const before type ignored *)
function snd_hctl_elem_tlv_command(elem:Psnd_hctl_elem_t; tlv:Pdword):longint;cdecl;external;
function snd_hctl_elem_get_hctl(elem:Psnd_hctl_elem_t):Psnd_hctl_t;cdecl;external;
(* Const before type ignored *)
procedure snd_hctl_elem_get_id(obj:Psnd_hctl_elem_t; ptr:Psnd_ctl_elem_id_t);cdecl;external;
(* Const before type ignored *)
function snd_hctl_elem_get_numid(obj:Psnd_hctl_elem_t):dword;cdecl;external;
(* Const before type ignored *)
function snd_hctl_elem_get_interface(obj:Psnd_hctl_elem_t):Tsnd_ctl_elem_iface_t;cdecl;external;
(* Const before type ignored *)
function snd_hctl_elem_get_device(obj:Psnd_hctl_elem_t):dword;cdecl;external;
(* Const before type ignored *)
function snd_hctl_elem_get_subdevice(obj:Psnd_hctl_elem_t):dword;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function snd_hctl_elem_get_name(obj:Psnd_hctl_elem_t):Pchar;cdecl;external;
(* Const before type ignored *)
function snd_hctl_elem_get_index(obj:Psnd_hctl_elem_t):dword;cdecl;external;
procedure snd_hctl_elem_set_callback(obj:Psnd_hctl_elem_t; val:Tsnd_hctl_elem_callback_t);cdecl;external;
(* Const before type ignored *)
function snd_hctl_elem_get_callback_private(obj:Psnd_hctl_elem_t):pointer;cdecl;external;
procedure snd_hctl_elem_set_callback_private(obj:Psnd_hctl_elem_t; val:pointer);cdecl;external;
{* \  }
{* \  }
{*
 *  \defgroup SControl Setup Control Interface
 *  \ingroup Control
 *  The setup control interface - set or modify control elements from a configuration file.
 *  \
  }
function snd_sctl_build(ctl:PPsnd_sctl_t; handle:Psnd_ctl_t; config:Psnd_config_t; private_data:Psnd_config_t; mode:longint):longint;cdecl;external;
function snd_sctl_free(handle:Psnd_sctl_t):longint;cdecl;external;
function snd_sctl_install(handle:Psnd_sctl_t):longint;cdecl;external;
function snd_sctl_remove(handle:Psnd_sctl_t):longint;cdecl;external;
{* \  }
{*
 *  \defgroup Hint Name Hint Interface
 *  \ingroup Configuration
 *  The name hint interface - get descriptive information about a device
 *  (name, description, input/output).
 *  \
  }
(* Const before type ignored *)
function snd_device_name_hint(card:longint; iface:Pchar; hints:PPpointer):longint;cdecl;external;
function snd_device_name_free_hint(hints:Ppointer):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function snd_device_name_get_hint(hint:pointer; id:Pchar):Pchar;cdecl;external;
{* \  }
{ C++ end of extern C conditionnal removed }
{$endif}
{ __ALSA_CONTROL_H  }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function snd_ctl_elem_id_alloca(ptr : longint) : longint;
begin
  snd_ctl_elem_id_alloca:=__snd_alloca(ptr,snd_ctl_elem_id);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function snd_ctl_card_info_alloca(ptr : longint) : longint;
begin
  snd_ctl_card_info_alloca:=__snd_alloca(ptr,snd_ctl_card_info);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function snd_ctl_event_alloca(ptr : longint) : longint;
begin
  snd_ctl_event_alloca:=__snd_alloca(ptr,snd_ctl_event);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function snd_ctl_elem_list_alloca(ptr : longint) : longint;
begin
  snd_ctl_elem_list_alloca:=__snd_alloca(ptr,snd_ctl_elem_list);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function snd_ctl_elem_info_alloca(ptr : longint) : longint;
begin
  snd_ctl_elem_info_alloca:=__snd_alloca(ptr,snd_ctl_elem_info);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function snd_ctl_elem_value_alloca(ptr : longint) : longint;
begin
  snd_ctl_elem_value_alloca:=__snd_alloca(ptr,snd_ctl_elem_value);
end;


end.
