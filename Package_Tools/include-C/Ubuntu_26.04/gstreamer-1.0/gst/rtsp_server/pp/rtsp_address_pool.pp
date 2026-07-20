
unit rtsp_address_pool;
interface

{
  Automatically converted by H2Pas 1.0.0 from rtsp_address_pool.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    rtsp_address_pool.h
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
PGstRTSPAddress  = ^GstRTSPAddress;
PGstRTSPAddressFlags  = ^GstRTSPAddressFlags;
PGstRTSPAddressPool  = ^GstRTSPAddressPool;
PGstRTSPAddressPoolClass  = ^GstRTSPAddressPoolClass;
PGstRTSPAddressPoolPrivate  = ^GstRTSPAddressPoolPrivate;
PGstRTSPAddressPoolResult  = ^GstRTSPAddressPoolResult;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) 2012 Wim Taymans <wim.taymans at gmail.com>
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
{$ifndef __GST_RTSP_ADDRESS_POOL_H__}
{$define __GST_RTSP_ADDRESS_POOL_H__}
{$include <gst/gst.h>}
{$include "rtsp-server-prelude.h"}

{ was #define dname def_expr }
function GST_TYPE_RTSP_ADDRESS_POOL : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_RTSP_ADDRESS_POOL(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_RTSP_ADDRESS_POOL_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_RTSP_ADDRESS_POOL_GET_CLASS(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_RTSP_ADDRESS_POOL(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_RTSP_ADDRESS_POOL_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_RTSP_ADDRESS_POOL_CAST(obj : longint) : PGstRTSPAddressPool;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_RTSP_ADDRESS_POOL_CLASS_CAST(klass : longint) : PGstRTSPAddressPoolClass;

{*
 * GstRTSPAddressPoolResult:
 * @GST_RTSP_ADDRESS_POOL_OK: no error
 * @GST_RTSP_ADDRESS_POOL_EINVAL:invalid arguments were provided to a function
 * @GST_RTSP_ADDRESS_POOL_ERESERVED: the addres has already been reserved
 * @GST_RTSP_ADDRESS_POOL_ERANGE: the address is not in the pool
 * @GST_RTSP_ADDRESS_POOL_ELAST: last error
 *
 * Result codes from RTSP address pool functions.
  }
{ errors  }
type
  PGstRTSPAddressPoolResult = ^TGstRTSPAddressPoolResult;
  TGstRTSPAddressPoolResult =  Longint;
  Const
    GST_RTSP_ADDRESS_POOL_OK = 0;
    GST_RTSP_ADDRESS_POOL_EINVAL = -(1);
    GST_RTSP_ADDRESS_POOL_ERESERVED = -(2);
    GST_RTSP_ADDRESS_POOL_ERANGE = -(3);
    GST_RTSP_ADDRESS_POOL_ELAST = -(4);
;
type
{*
 * GstRTSPAddress:
 * @pool: the #GstRTSPAddressPool owner of this address
 * @address: the address
 * @port: the port number
 * @n_ports: number of ports
 * @ttl: TTL or 0 for unicast addresses
 *
 * An address
  }
{<private > }
  PGstRTSPAddress = ^TGstRTSPAddress;
  TGstRTSPAddress = record
      pool : PGstRTSPAddressPool;
      address : Pgchar;
      port : Tguint16;
      n_ports : Tgint;
      ttl : Tguint8;
      priv : Tgpointer;
    end;


function gst_rtsp_address_get_type:TGType;cdecl;external;
function gst_rtsp_address_copy(addr:PGstRTSPAddress):PGstRTSPAddress;cdecl;external;
procedure gst_rtsp_address_free(addr:PGstRTSPAddress);cdecl;external;
{*
 * GstRTSPAddressFlags:
 * @GST_RTSP_ADDRESS_FLAG_NONE: no flags
 * @GST_RTSP_ADDRESS_FLAG_IPV4: an IPv4 address
 * @GST_RTSP_ADDRESS_FLAG_IPV6: and IPv6 address
 * @GST_RTSP_ADDRESS_FLAG_EVEN_PORT: address with an even port
 * @GST_RTSP_ADDRESS_FLAG_MULTICAST: a multicast address
 * @GST_RTSP_ADDRESS_FLAG_UNICAST: a unicast address
 *
 * Flags used to control allocation of addresses
  }
type
  PGstRTSPAddressFlags = ^TGstRTSPAddressFlags;
  TGstRTSPAddressFlags =  Longint;
  Const
    GST_RTSP_ADDRESS_FLAG_NONE = 0;
    GST_RTSP_ADDRESS_FLAG_IPV4 = 1 shl 0;
    GST_RTSP_ADDRESS_FLAG_IPV6 = 1 shl 1;
    GST_RTSP_ADDRESS_FLAG_EVEN_PORT = 1 shl 2;
    GST_RTSP_ADDRESS_FLAG_MULTICAST = 1 shl 3;
    GST_RTSP_ADDRESS_FLAG_UNICAST = 1 shl 4;
;
{*
 * GST_RTSP_ADDRESS_POOL_ANY_IPV4:
 *
 * Used with gst_rtsp_address_pool_add_range() to bind to all
 * IPv4 addresses
  }
  GST_RTSP_ADDRESS_POOL_ANY_IPV4 = '0.0.0.0';  
{*
 * GST_RTSP_ADDRESS_POOL_ANY_IPV6:
 *
 * Used with gst_rtsp_address_pool_add_range() to bind to all
 * IPv6 addresses
  }
  GST_RTSP_ADDRESS_POOL_ANY_IPV6 = '::';  
{*
 * GstRTSPAddressPool:
 * @parent: the parent GObject
 *
 * An address pool, all member are private
  }
{< private > }
type
  PGstRTSPAddressPool = ^TGstRTSPAddressPool;
  TGstRTSPAddressPool = record
      parent : TGObject;
      priv : PGstRTSPAddressPoolPrivate;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{*
 * GstRTSPAddressPoolClass:
 *
 * Opaque Address pool class.
  }
{< private > }
  PGstRTSPAddressPoolClass = ^TGstRTSPAddressPoolClass;
  TGstRTSPAddressPoolClass = record
      parent_class : TGObjectClass;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;


function gst_rtsp_address_pool_get_type:TGType;cdecl;external;
{ create a new address pool  }
function gst_rtsp_address_pool_new:PGstRTSPAddressPool;cdecl;external;
procedure gst_rtsp_address_pool_clear(pool:PGstRTSPAddressPool);cdecl;external;
procedure gst_rtsp_address_pool_dump(pool:PGstRTSPAddressPool);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_rtsp_address_pool_add_range(pool:PGstRTSPAddressPool; min_address:Pgchar; max_address:Pgchar; min_port:Tguint16; max_port:Tguint16; 
           ttl:Tguint8):Tgboolean;cdecl;external;
function gst_rtsp_address_pool_acquire_address(pool:PGstRTSPAddressPool; flags:TGstRTSPAddressFlags; n_ports:Tgint):PGstRTSPAddress;cdecl;external;
(* Const before type ignored *)
function gst_rtsp_address_pool_reserve_address(pool:PGstRTSPAddressPool; ip_address:Pgchar; port:Tguint; n_ports:Tguint; ttl:Tguint; 
           address:PPGstRTSPAddress):TGstRTSPAddressPoolResult;cdecl;external;
function gst_rtsp_address_pool_has_unicast_addresses(pool:PGstRTSPAddressPool):Tgboolean;cdecl;external;
{$ifdef //////////////////////G_DEFINE_AUTOPTR_CLEANUP_FUNC           }
{////////////////////G_DEFINE_AUTOPTR_CLEANUP_FUNC           (GstRTSPAddress, gst_rtsp_address_free) }
{$endif}
{$ifdef //////////////////////G_DEFINE_AUTOPTR_CLEANUP_FUNC           }
{////////////////////G_DEFINE_AUTOPTR_CLEANUP_FUNC           (GstRTSPAddressPool, gst_object_unref) }
{$endif}
{$endif}
{ __GST_RTSP_ADDRESS_POOL_H__  }

implementation

{ was #define dname def_expr }
function GST_TYPE_RTSP_ADDRESS_POOL : longint; { return type might be wrong }
  begin
    GST_TYPE_RTSP_ADDRESS_POOL:=gst_rtsp_address_pool_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_RTSP_ADDRESS_POOL(obj : longint) : longint;
begin
  GST_IS_RTSP_ADDRESS_POOL:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_RTSP_ADDRESS_POOL);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_RTSP_ADDRESS_POOL_CLASS(klass : longint) : longint;
begin
  GST_IS_RTSP_ADDRESS_POOL_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_RTSP_ADDRESS_POOL);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_RTSP_ADDRESS_POOL_GET_CLASS(obj : longint) : longint;
begin
  GST_RTSP_ADDRESS_POOL_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GST_TYPE_RTSP_ADDRESS_POOL,GstRTSPAddressPoolClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_RTSP_ADDRESS_POOL(obj : longint) : longint;
begin
  GST_RTSP_ADDRESS_POOL:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_RTSP_ADDRESS_POOL,GstRTSPAddressPool);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_RTSP_ADDRESS_POOL_CLASS(klass : longint) : longint;
begin
  GST_RTSP_ADDRESS_POOL_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_RTSP_ADDRESS_POOL,GstRTSPAddressPoolClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_RTSP_ADDRESS_POOL_CAST(obj : longint) : PGstRTSPAddressPool;
begin
  GST_RTSP_ADDRESS_POOL_CAST:=PGstRTSPAddressPool(obj);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_RTSP_ADDRESS_POOL_CLASS_CAST(klass : longint) : PGstRTSPAddressPoolClass;
begin
  GST_RTSP_ADDRESS_POOL_CLASS_CAST:=PGstRTSPAddressPoolClass(klass);
end;


end.
