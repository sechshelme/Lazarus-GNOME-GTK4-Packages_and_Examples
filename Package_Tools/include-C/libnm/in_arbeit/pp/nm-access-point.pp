
unit nm-access-point;
interface

{
  Automatically converted by H2Pas 1.0.0 from nm-access-point.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    nm-access-point.h
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
PGBytes  = ^GBytes;
PGPtrArray  = ^GPtrArray;
PNMAccessPoint  = ^NMAccessPoint;
PNMConnection  = ^NMConnection;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: LGPL-2.1-or-later  }
{
 * Copyright (C) 2007 - 2008 Novell, Inc.
 * Copyright (C) 2007 - 2011 Red Hat, Inc.
  }
{$ifndef __NM_ACCESS_POINT_H__}
{$define __NM_ACCESS_POINT_H__}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}
{$include "nm-object.h"}

{ was #define dname def_expr }
function NM_TYPE_ACCESS_POINT : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_ACCESS_POINT(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_ACCESS_POINT_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_ACCESS_POINT(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_ACCESS_POINT_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_ACCESS_POINT_GET_CLASS(obj : longint) : longint;

const
  NM_ACCESS_POINT_FLAGS = 'flags';  
  NM_ACCESS_POINT_WPA_FLAGS = 'wpa-flags';  
  NM_ACCESS_POINT_RSN_FLAGS = 'rsn-flags';  
  NM_ACCESS_POINT_SSID = 'ssid';  
  NM_ACCESS_POINT_BSSID = 'bssid';  
  NM_ACCESS_POINT_FREQUENCY = 'frequency';  
  NM_ACCESS_POINT_MODE = 'mode';  
  NM_ACCESS_POINT_MAX_BITRATE = 'max-bitrate';  
  NM_ACCESS_POINT_STRENGTH = 'strength';  
  NM_ACCESS_POINT_LAST_SEEN = 'last-seen';  
  NM_ACCESS_POINT_BANDWIDTH = 'bandwidth';  
{ DEPRECATED  }
  NM_ACCESS_POINT_HW_ADDRESS = 'hw-address';  
{*
 * NMAccessPoint:
  }
type

function nm_access_point_get_type:TGType;cdecl;external;
function nm_access_point_get_flags(ap:PNMAccessPoint):TNM80211ApFlags;cdecl;external;
function nm_access_point_get_wpa_flags(ap:PNMAccessPoint):TNM80211ApSecurityFlags;cdecl;external;
function nm_access_point_get_rsn_flags(ap:PNMAccessPoint):TNM80211ApSecurityFlags;cdecl;external;
function nm_access_point_get_ssid(ap:PNMAccessPoint):PGBytes;cdecl;external;
(* Const before type ignored *)
function nm_access_point_get_bssid(ap:PNMAccessPoint):Pchar;cdecl;external;
function nm_access_point_get_frequency(ap:PNMAccessPoint):Tguint32;cdecl;external;
function nm_access_point_get_mode(ap:PNMAccessPoint):TNM80211Mode;cdecl;external;
function nm_access_point_get_max_bitrate(ap:PNMAccessPoint):Tguint32;cdecl;external;
function nm_access_point_get_strength(ap:PNMAccessPoint):Tguint8;cdecl;external;
function nm_access_point_get_last_seen(ap:PNMAccessPoint):longint;cdecl;external;
function nm_access_point_get_bandwidth(ap:PNMAccessPoint):Tguint32;cdecl;external;
(* Const before type ignored *)
function nm_access_point_filter_connections(ap:PNMAccessPoint; connections:PGPtrArray):PGPtrArray;cdecl;external;
function nm_access_point_connection_valid(ap:PNMAccessPoint; connection:PNMConnection):Tgboolean;cdecl;external;
{$endif}
{ __NM_ACCESS_POINT_H__  }

implementation

{ was #define dname def_expr }
function NM_TYPE_ACCESS_POINT : longint; { return type might be wrong }
  begin
    NM_TYPE_ACCESS_POINT:=nm_access_point_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_ACCESS_POINT(obj : longint) : longint;
begin
  NM_ACCESS_POINT:=G_TYPE_CHECK_INSTANCE_CAST(obj,NM_TYPE_ACCESS_POINT,NMAccessPoint);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_ACCESS_POINT_CLASS(klass : longint) : longint;
begin
  NM_ACCESS_POINT_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,NM_TYPE_ACCESS_POINT,NMAccessPointClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_ACCESS_POINT(obj : longint) : longint;
begin
  NM_IS_ACCESS_POINT:=G_TYPE_CHECK_INSTANCE_TYPE(obj,NM_TYPE_ACCESS_POINT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_ACCESS_POINT_CLASS(klass : longint) : longint;
begin
  NM_IS_ACCESS_POINT_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,NM_TYPE_ACCESS_POINT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_ACCESS_POINT_GET_CLASS(obj : longint) : longint;
begin
  NM_ACCESS_POINT_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,NM_TYPE_ACCESS_POINT,NMAccessPointClass);
end;


end.
