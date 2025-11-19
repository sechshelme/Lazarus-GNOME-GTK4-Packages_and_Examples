
unit control_plugin;
interface

{
  Automatically converted by H2Pas 1.0.0 from control_plugin.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    control_plugin.h
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
Psnd_config_t  = ^snd_config_t;
Psnd_ctl_t  = ^snd_ctl_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*
 * \file include/control_plugin.h
 * \brief Common control plugin code
 * \author Jaroslav Kysela <perex@perex.cz>
 * \date 2021
 *
 * Application interface library for the ALSA driver.
 * See the \ref control_plugins page for more details.
 *
 * \warning Using of contents of this header file might be dangerous
 *	    in the sense of compatibility reasons. The contents might be
 *	    freely changed in future.
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
{$ifndef __ALSA_CONTROL_PLUGIN_H}
{$define __ALSA_CONTROL_PLUGIN_H}
{*
 * \defgroup Control_Plugins Primitive Control Plugins
 * \ingroup Control
 * See the \ref control_plugins page for more details.
 * \
  }
{
 * Control HW
  }
(* Const before type ignored *)

function snd_ctl_hw_open(handle:PPsnd_ctl_t; name:Pchar; card:longint; mode:longint):longint;cdecl;external;
function _snd_ctl_hw_open(handlep:PPsnd_ctl_t; name:Pchar; root:Psnd_config_t; conf:Psnd_config_t; mode:longint):longint;cdecl;external;
{
 * Control Remap & Map
  }
(* Const before type ignored *)
function snd_ctl_remap_open(handlep:PPsnd_ctl_t; name:Pchar; remap:Psnd_config_t; map:Psnd_config_t; child:Psnd_ctl_t; 
           mode:longint):longint;cdecl;external;
function _snd_ctl_remap_open(handlep:PPsnd_ctl_t; name:Pchar; root:Psnd_config_t; conf:Psnd_config_t; mode:longint):longint;cdecl;external;
{* \  }
{$endif}
{ __ALSA_CONTROL_PLUGIN_H  }

implementation


end.
