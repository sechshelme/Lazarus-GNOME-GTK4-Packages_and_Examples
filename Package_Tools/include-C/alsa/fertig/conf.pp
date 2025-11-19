
unit conf;
interface

{
  Automatically converted by H2Pas 1.0.0 from conf.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    conf.h
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
Pdouble  = ^double;
Pint64  = ^int64;
Plongint  = ^longint;
Psnd_config_iterator  = ^snd_config_iterator;
Psnd_config_iterator_t  = ^snd_config_iterator_t;
Psnd_config_t  = ^snd_config_t;
Psnd_config_type  = ^snd_config_type;
Psnd_config_type_t  = ^snd_config_type_t;
Psnd_config_update_t  = ^snd_config_update_t;
Psnd_devname  = ^snd_devname;
Psnd_devname_t  = ^snd_devname_t;
Psnd_input_t  = ^snd_input_t;
Psnd_output_t  = ^snd_output_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*
 * \file include/conf.h
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
{$ifndef __ALSA_CONF_H}
{$define __ALSA_CONF_H}
{ C++ extern C conditionnal removed }
{*
 *  \defgroup Configuration Configuration Interface
 *  The configuration functions and types allow you to read, enumerate,
 *  modify and write the contents of ALSA configuration files.
 *  \
  }
{* \brief \c dlsym version for the config evaluate callback.  }

const
  SND_CONFIG_DLSYM_VERSION_EVALUATE = _dlsym_config_evaluate_001;  
{* \brief \c dlsym version for the config hook callback.  }
  SND_CONFIG_DLSYM_VERSION_HOOK = _dlsym_config_hook_001;  
{* \brief Configuration node type.  }
{* Integer number.  }
{* 64-bit integer number.  }
{* Real number.  }
{* Character string.  }
{* Pointer (runtime only, cannot be saved).  }
{* Compound node.  }
type
  Psnd_config_type = ^Tsnd_config_type;
  Tsnd_config_type =  Longint;
  Const
    SND_CONFIG_TYPE_INTEGER = 0;
    SND_CONFIG_TYPE_INTEGER64 = 1;
    SND_CONFIG_TYPE_REAL = 2;
    SND_CONFIG_TYPE_STRING = 3;
    SND_CONFIG_TYPE_POINTER = 4;
    SND_CONFIG_TYPE_COMPOUND = 1024;
;
  Tsnd_config_type_t = Tsnd_config_type;
  Psnd_config_type_t = ^Tsnd_config_type_t;
{*
 * \brief Internal structure for a configuration node object.
 *
 * The ALSA library uses a pointer to this structure as a handle to a
 * configuration node. Applications don't access its contents directly.
  }
type
  Tsnd_config = Tsnd_config_t;
{*
 * \brief Type for a configuration compound iterator.
 *
 * The ALSA library uses this pointer type as a handle to a configuration
 * compound iterator. Applications don't directly access the contents of
 * the structure pointed to by this type.
  }

  Psnd_config_iterator_t = ^Tsnd_config_iterator_t;
  Tsnd_config_iterator_t = Psnd_config_iterator;
{*
 * \brief Internal structure for a configuration private update object.
 *
 * The ALSA library uses this structure to save private update information.
  }
  Tsnd_config_update = Tsnd_config_update_t;
  var
    snd_config : Psnd_config_t;cvar;external;
(* Const before type ignored *)

function snd_config_topdir:Pchar;cdecl;external;
function snd_config_top(config:PPsnd_config_t):longint;cdecl;external;
function snd_config_load(config:Psnd_config_t; in:Psnd_input_t):longint;cdecl;external;
(* Const before type ignored *)
function snd_config_load_string(config:PPsnd_config_t; s:Pchar; size:Tsize_t):longint;cdecl;external;
function snd_config_load_override(config:Psnd_config_t; in:Psnd_input_t):longint;cdecl;external;
function snd_config_save(config:Psnd_config_t; out:Psnd_output_t):longint;cdecl;external;
function snd_config_update:longint;cdecl;external;
(* Const before type ignored *)
function snd_config_update_r(top:PPsnd_config_t; update:PPsnd_config_update_t; path:Pchar):longint;cdecl;external;
function snd_config_update_free(update:Psnd_config_update_t):longint;cdecl;external;
function snd_config_update_free_global:longint;cdecl;external;
function snd_config_update_ref(top:PPsnd_config_t):longint;cdecl;external;
procedure snd_config_ref(top:Psnd_config_t);cdecl;external;
procedure snd_config_unref(top:Psnd_config_t);cdecl;external;
(* Const before type ignored *)
function snd_config_search(config:Psnd_config_t; key:Pchar; result:PPsnd_config_t):longint;cdecl;external;
function snd_config_searchv(config:Psnd_config_t; result:PPsnd_config_t; args:array of const):longint;cdecl;external;
function snd_config_searchv(config:Psnd_config_t; result:PPsnd_config_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function snd_config_search_definition(config:Psnd_config_t; base:Pchar; key:Pchar; result:PPsnd_config_t):longint;cdecl;external;
{*
 * \brief custom expansion callback
 * \param[out] dst The function puts the handle to the new configuration
 *                 node at the address specified by \a dst.
 * \param[in] s string the string to be expanded
 * \param[in] private_data Handle to the \c private_data node.
 * \return A non-negative value if successful, otherwise a negative error code.
 *
 * Use a function of this type to define a custom expansion 
  }
(* Const before type ignored *)
type

  Tsnd_config_expand_fcn_t = function (dst:PPsnd_config_t; s:Pchar; private_data:pointer):longint;cdecl;

function snd_config_expand_custom(config:Psnd_config_t; root:Psnd_config_t; fcn:Tsnd_config_expand_fcn_t; private_data:pointer; result:PPsnd_config_t):longint;cdecl;external;
(* Const before type ignored *)
function snd_config_expand(config:Psnd_config_t; root:Psnd_config_t; args:Pchar; private_data:Psnd_config_t; result:PPsnd_config_t):longint;cdecl;external;
function snd_config_evaluate(config:Psnd_config_t; root:Psnd_config_t; private_data:Psnd_config_t; result:PPsnd_config_t):longint;cdecl;external;
(* Const before type ignored *)
function snd_config_evaluate_string(dst:PPsnd_config_t; s:Pchar; fcn:Tsnd_config_expand_fcn_t; private_data:pointer):longint;cdecl;external;
function snd_config_add(config:Psnd_config_t; child:Psnd_config_t):longint;cdecl;external;
function snd_config_add_before(before:Psnd_config_t; child:Psnd_config_t):longint;cdecl;external;
function snd_config_add_after(after:Psnd_config_t; child:Psnd_config_t):longint;cdecl;external;
function snd_config_remove(config:Psnd_config_t):longint;cdecl;external;
function snd_config_delete(config:Psnd_config_t):longint;cdecl;external;
(* Const before type ignored *)
function snd_config_delete_compound_members(config:Psnd_config_t):longint;cdecl;external;
function snd_config_copy(dst:PPsnd_config_t; src:Psnd_config_t):longint;cdecl;external;
function snd_config_substitute(dst:Psnd_config_t; src:Psnd_config_t):longint;cdecl;external;
function snd_config_merge(dst:Psnd_config_t; src:Psnd_config_t; override:longint):longint;cdecl;external;
(* Const before type ignored *)
function snd_config_make(config:PPsnd_config_t; key:Pchar; _type:Tsnd_config_type_t):longint;cdecl;external;
(* Const before type ignored *)
function snd_config_make_integer(config:PPsnd_config_t; key:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function snd_config_make_integer64(config:PPsnd_config_t; key:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function snd_config_make_real(config:PPsnd_config_t; key:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function snd_config_make_string(config:PPsnd_config_t; key:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function snd_config_make_pointer(config:PPsnd_config_t; key:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function snd_config_make_compound(config:PPsnd_config_t; key:Pchar; join:longint):longint;cdecl;external;
(* Const before type ignored *)
function snd_config_make_path(config:PPsnd_config_t; root:Psnd_config_t; key:Pchar; join:longint; override:longint):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function snd_config_imake_integer(config:PPsnd_config_t; key:Pchar; value:longint):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function snd_config_imake_integer64(config:PPsnd_config_t; key:Pchar; value:int64):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function snd_config_imake_real(config:PPsnd_config_t; key:Pchar; value:Tdouble):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function snd_config_imake_string(config:PPsnd_config_t; key:Pchar; ascii:Pchar):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function snd_config_imake_safe_string(config:PPsnd_config_t; key:Pchar; ascii:Pchar):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function snd_config_imake_pointer(config:PPsnd_config_t; key:Pchar; ptr:pointer):longint;cdecl;external;
(* Const before type ignored *)
function snd_config_get_type(config:Psnd_config_t):Tsnd_config_type_t;cdecl;external;
(* Const before type ignored *)
function snd_config_is_array(config:Psnd_config_t):longint;cdecl;external;
(* Const before type ignored *)
function snd_config_is_empty(config:Psnd_config_t):longint;cdecl;external;
(* Const before type ignored *)
function snd_config_set_id(config:Psnd_config_t; id:Pchar):longint;cdecl;external;
function snd_config_set_integer(config:Psnd_config_t; value:longint):longint;cdecl;external;
function snd_config_set_integer64(config:Psnd_config_t; value:int64):longint;cdecl;external;
function snd_config_set_real(config:Psnd_config_t; value:Tdouble):longint;cdecl;external;
(* Const before type ignored *)
function snd_config_set_string(config:Psnd_config_t; value:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function snd_config_set_ascii(config:Psnd_config_t; ascii:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function snd_config_set_pointer(config:Psnd_config_t; ptr:pointer):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function snd_config_get_id(config:Psnd_config_t; value:PPchar):longint;cdecl;external;
(* Const before type ignored *)
function snd_config_get_integer(config:Psnd_config_t; value:Plongint):longint;cdecl;external;
(* Const before type ignored *)
function snd_config_get_integer64(config:Psnd_config_t; value:Pint64):longint;cdecl;external;
(* Const before type ignored *)
function snd_config_get_real(config:Psnd_config_t; value:Pdouble):longint;cdecl;external;
(* Const before type ignored *)
function snd_config_get_ireal(config:Psnd_config_t; value:Pdouble):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function snd_config_get_string(config:Psnd_config_t; value:PPchar):longint;cdecl;external;
(* Const before type ignored *)
function snd_config_get_ascii(config:Psnd_config_t; value:PPchar):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function snd_config_get_pointer(config:Psnd_config_t; value:Ppointer):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function snd_config_test_id(config:Psnd_config_t; id:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function snd_config_iterator_first(node:Psnd_config_t):Tsnd_config_iterator_t;cdecl;external;
(* Const before type ignored *)
function snd_config_iterator_next(iterator:Tsnd_config_iterator_t):Tsnd_config_iterator_t;cdecl;external;
(* Const before type ignored *)
function snd_config_iterator_end(node:Psnd_config_t):Tsnd_config_iterator_t;cdecl;external;
(* Const before type ignored *)
function snd_config_iterator_entry(iterator:Tsnd_config_iterator_t):Psnd_config_t;cdecl;external;
{*
 * \brief Helper macro to iterate over the children of a compound node.
 * \param[in,out] pos Iterator variable for the current node.
 * \param[in,out] next Temporary iterator variable for the next node.
 * \param[in] node Handle to the compound configuration node to iterate over.
 *
 * Use this macro like a \c for statement, e.g.:
 * \code
 * snd_config_iterator_t pos, next;
 * snd_config_for_each(pos, next, node) 
 *     snd_config_t *entry = snd_config_iterator_entry(pos);
 *     ...
 * 
 * \endcode
 *
 * This macro allows deleting or removing the current node.
  }
{xxxxxxxxxxx
#define snd_config_for_each(pos, next, node) \
	for (pos = snd_config_iterator_first(node), next = snd_config_iterator_next(pos); pos != snd_config_iterator_end(node); pos = next, next = snd_config_iterator_next(pos))
 }
{ Misc functions  }
(* Const before type ignored *)
function snd_config_get_bool_ascii(ascii:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function snd_config_get_bool(conf:Psnd_config_t):longint;cdecl;external;
(* Const before type ignored *)
function snd_config_get_card(conf:Psnd_config_t):longint;cdecl;external;
(* Const before type ignored *)
function snd_config_get_ctl_iface_ascii(ascii:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function snd_config_get_ctl_iface(conf:Psnd_config_t):longint;cdecl;external;
{ Names functions  }
{*
 * Device-name list element
  }
type
  Tsnd_devname = Tsnd_devname_t;
{*
 * Device-name list element (definition)
  }
{*< Device name string  }
{*< Comments  }
{*< Next pointer  }
  Psnd_devname = ^Tsnd_devname;
  Tsnd_devname = record
      name : Pchar;cdecl;
      comment : Pchar;
      next : Psnd_devname_t;
    end;

(* Const before type ignored *)

function snd_names_list(iface:Pchar; list:PPsnd_devname_t):longint;cdecl;external;
procedure snd_names_list_free(list:Psnd_devname_t);cdecl;external;
{* \  }
{ C++ end of extern C conditionnal removed }
{$endif}
{ __ALSA_CONF_H  }

implementation


end.
