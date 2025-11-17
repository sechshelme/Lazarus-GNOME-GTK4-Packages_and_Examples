
unit gphoto2_port_info_list;
interface

{
  Automatically converted by H2Pas 1.0.0 from gphoto2_port_info_list.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gphoto2_port_info_list.h
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
PGPPortInfo  = ^GPPortInfo;
PGPPortInfoList  = ^GPPortInfoList;
PGPPortType  = ^GPPortType;
PStringFlagItem  = ^StringFlagItem;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{* \file
 *
 * \author Copyright 2001 Lutz Mueller <lutz@users.sf.net>
 *
 * \par License
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * \par
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * \par
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
 * Boston, MA  02110-1301  USA
  }
{$ifndef LIBGPHOTO2_GPHOTO2_PORT_INFO_LIST_H}
{$define LIBGPHOTO2_GPHOTO2_PORT_INFO_LIST_H}
{*
 * \brief The gphoto port type.
 *
 * Enumeration specifying the port type.
 * The enum is providing bitmasks, but most code uses it as
 * just the one specific values.
  }
{*< \brief No specific type associated.  }
{*< \brief Serial port.  }
{*< \brief USB port.  }
{*< \brief Disk / local mountpoint port.  }
{*< \brief PTP/IP port.  }
{*< \brief Direct IO to an usb mass storage device.  }
{*< \brief USB Mass Storage raw SCSI port.  }
{*< \brief generic IP address port.  }
type
  PGPPortType = ^TGPPortType;
  TGPPortType =  Longint;
  Const
    GP_PORT_NONE = 0;
    GP_PORT_SERIAL = 1 shl 0;
    GP_PORT_USB = 1 shl 2;
    GP_PORT_DISK = 1 shl 3;
    GP_PORT_PTPIP = 1 shl 4;
    GP_PORT_USB_DISK_DIRECT = 1 shl 5;
    GP_PORT_USB_SCSI = 1 shl 6;
    GP_PORT_IP = 1 shl 7;
;
{*
 * \brief Information about the current port.
 *
 * Specific information about the current port. Usually taken from the
 * "--port=XXXX" setting from the frontend.
 *
 * This is not to be confused with the driver configurable port settings
 * in \ref GPPortSettings.
  }
type
  PGPPortInfo = ^TGPPortInfo;
  TGPPortInfo = record
      {undefined structure}
    end;


  PGPPortInfo = ^TGPPortInfo;
  TGPPortInfo = PGPPortInfo;
{$include <gphoto2/gphoto2-port.h>}
{ C++ extern C conditionnal removed }
{ __cplusplus  }
{$ifdef _GPHOTO2_INTERNAL_CODE}
{$include <gphoto2/gphoto2-port-log.h>}
(* Const before type ignored *)
  var
    gpi_gphoto_port_type_map : PStringFlagItem;cvar;external;
{$endif}

function gp_port_info_new(info:PGPPortInfo):longint;cdecl;external;
function gp_port_info_get_name(info:TGPPortInfo; name:PPchar):longint;cdecl;external;
(* Const before type ignored *)
function gp_port_info_set_name(info:TGPPortInfo; name:Pchar):longint;cdecl;external;
function gp_port_info_get_path(info:TGPPortInfo; path:PPchar):longint;cdecl;external;
(* Const before type ignored *)
function gp_port_info_set_path(info:TGPPortInfo; path:Pchar):longint;cdecl;external;
function gp_port_info_get_type(info:TGPPortInfo; _type:PGPPortType):longint;cdecl;external;
(* Const before type ignored *)
function gp_port_info_set_type(info:TGPPortInfo; _type:TGPPortType):longint;cdecl;external;
function gp_port_info_get_library_filename(info:TGPPortInfo; lib:PPchar):longint;cdecl;external;
function gp_port_info_set_library_filename(info:TGPPortInfo; lib:Pchar):longint;cdecl;external;
{ Internals are private  }
type

function gp_port_info_list_new(list:PPGPPortInfoList):longint;cdecl;external;
function gp_port_info_list_free(list:PGPPortInfoList):longint;cdecl;external;
function gp_port_info_list_append(list:PGPPortInfoList; info:TGPPortInfo):longint;cdecl;external;
function gp_port_info_list_load(list:PGPPortInfoList):longint;cdecl;external;
function gp_port_info_list_count(list:PGPPortInfoList):longint;cdecl;external;
(* Const before type ignored *)
function gp_port_info_list_lookup_path(list:PGPPortInfoList; path:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function gp_port_info_list_lookup_name(list:PGPPortInfoList; name:Pchar):longint;cdecl;external;
function gp_port_info_list_get_info(list:PGPPortInfoList; n:longint; info:PGPPortInfo):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gp_port_message_codeset(para1:Pchar):Pchar;cdecl;external;
(* Const before type ignored *)
function gp_port_init_localedir(localedir:Pchar):longint;cdecl;external;
{*
 * Name of the environment variable which may contain the path where
 * to look for the IO libs. If this environment variable is not defined,
 * use the compiled-in default constant.
 *
 * \internal Internal use only.
  }
{$ifdef _GPHOTO2_INTERNAL_CODE}
const
  IOLIBDIR_ENV = 'IOLIBS';  
{$endif}
{ _GPHOTO2_INTERNAL_CODE  }
{ C++ end of extern C conditionnal removed }
{ __cplusplus  }
{$endif}
{ !defined(LIBGPHOTO2_GPHOTO2_PORT_INFO_LIST_H)  }

implementation


end.
