unit ga_entry_group;

interface

uses
  fp_avahi_common;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * ga-entry-group.h - Header for GaEntryGroup
 * Copyright (C) 2006-2007 Collabora Ltd.
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
  }
{$ifndef __GA_ENTRY_GROUP_H__}
{$define __GA_ENTRY_GROUP_H__}
{$include <glib-object.h>}
{$include <avahi-client/publish.h>}
{$include <avahi-client/client.h>}
{$include "ga-client.h"}
type
  PGaEntryGroupState = ^TGaEntryGroupState;
  TGaEntryGroupState =  Longint;
  Const
    GA_ENTRY_GROUP_STATE_UNCOMMITED = AVAHI_ENTRY_GROUP_UNCOMMITED;
    GA_ENTRY_GROUP_STATE_REGISTERING = AVAHI_ENTRY_GROUP_REGISTERING;
    GA_ENTRY_GROUP_STATE_ESTABLISHED = AVAHI_ENTRY_GROUP_ESTABLISHED;
    GA_ENTRY_GROUP_STATE_COLLISTION = AVAHI_ENTRY_GROUP_COLLISION;
    GA_ENTRY_GROUP_STATE_FAILURE = AVAHI_ENTRY_GROUP_FAILURE;
;
type
  PGaEntryGroupService = ^TGaEntryGroupService;
  TGaEntryGroupService = record
      interface : TAvahiIfIndex;
      protocol : TAvahiProtocol;
      flags : TAvahiPublishFlags;
      name : Pgchar;
      _type : Pgchar;
      domain : Pgchar;
      host : Pgchar;
      port : Tguint16;
    end;

  PGaEntryGroupClass = ^TGaEntryGroupClass;
  TGaEntryGroupClass = record
      parent_class : TGObjectClass;
    end;

  PGaEntryGroup = ^TGaEntryGroup;
  TGaEntryGroup = record
      parent : TGObject;
    end;


function ga_entry_group_get_type:TGType;cdecl;external libavahi_gobject;
{ TYPE MACROS  }
function ga_entry_group_new:PGaEntryGroup;cdecl;external libavahi_gobject;
function ga_entry_group_attach(group:PGaEntryGroup; client:PGaClient; error:PPGError):Tgboolean;cdecl;external libavahi_gobject;
function ga_entry_group_add_service_strlist(group:PGaEntryGroup; name:Pgchar; _type:Pgchar; port:Tguint16; error:PPGError; 
           txt:PAvahiStringList):PGaEntryGroupService;cdecl;external libavahi_gobject;
function ga_entry_group_add_service_full_strlist(group:PGaEntryGroup; interface:TAvahiIfIndex; protocol:TAvahiProtocol; flags:TAvahiPublishFlags; name:Pgchar; 
           _type:Pgchar; domain:Pgchar; host:Pgchar; port:Tguint16; error:PPGError; 
           txt:PAvahiStringList):PGaEntryGroupService;cdecl;external libavahi_gobject;
function ga_entry_group_add_service(group:PGaEntryGroup; name:Pgchar; _type:Pgchar; port:Tguint16; error:PPGError; 
           args:array of const):PGaEntryGroupService;cdecl;external libavahi_gobject;
function ga_entry_group_add_service(group:PGaEntryGroup; name:Pgchar; _type:Pgchar; port:Tguint16; error:PPGError):PGaEntryGroupService;cdecl;external libavahi_gobject;
function ga_entry_group_add_service_full(group:PGaEntryGroup; interface:TAvahiIfIndex; protocol:TAvahiProtocol; flags:TAvahiPublishFlags; name:Pgchar; 
           _type:Pgchar; domain:Pgchar; host:Pgchar; port:Tguint16; error:PPGError; 
           args:array of const):PGaEntryGroupService;cdecl;external libavahi_gobject;
function ga_entry_group_add_service_full(group:PGaEntryGroup; interface:TAvahiIfIndex; protocol:TAvahiProtocol; flags:TAvahiPublishFlags; name:Pgchar; 
           _type:Pgchar; domain:Pgchar; host:Pgchar; port:Tguint16; error:PPGError):PGaEntryGroupService;cdecl;external libavahi_gobject;
{ Add raw record  }
function ga_entry_group_add_record(group:PGaEntryGroup; flags:TAvahiPublishFlags; name:Pgchar; _type:Tguint16; ttl:Tguint32; 
           rdata:pointer; size:Tgsize; error:PPGError):Tgboolean;cdecl;external libavahi_gobject;
function ga_entry_group_add_record_full(group:PGaEntryGroup; interface:TAvahiIfIndex; protocol:TAvahiProtocol; flags:TAvahiPublishFlags; name:Pgchar; 
           clazz:Tguint16; _type:Tguint16; ttl:Tguint32; rdata:pointer; size:Tgsize; 
           error:PPGError):Tgboolean;cdecl;external libavahi_gobject;
procedure ga_entry_group_service_freeze(service:PGaEntryGroupService);cdecl;external libavahi_gobject;
{ Set a key in the service record. If the service isn't frozen it's committed
 * immediately  }
function ga_entry_group_service_set(service:PGaEntryGroupService; key:Pgchar; value:Pgchar; error:PPGError):Tgboolean;cdecl;external libavahi_gobject;
function ga_entry_group_service_set_arbitrary(service:PGaEntryGroupService; key:Pgchar; value:Pguint8; size:Tgsize; error:PPGError):Tgboolean;cdecl;external libavahi_gobject;
{ Remove one key from the service record  }
function ga_entry_group_service_remove_key(service:PGaEntryGroupService; key:Pgchar; error:PPGError):Tgboolean;cdecl;external libavahi_gobject;
{ Update the txt record of the frozen service  }
function ga_entry_group_service_thaw(service:PGaEntryGroupService; error:PPGError):Tgboolean;cdecl;external libavahi_gobject;
{ Commit all newly added services  }
function ga_entry_group_commit(group:PGaEntryGroup; error:PPGError):Tgboolean;cdecl;external libavahi_gobject;
{ Invalidated all GaEntryGroupServices  }
function ga_entry_group_reset(group:PGaEntryGroup; error:PPGError):Tgboolean;cdecl;external libavahi_gobject;
{$endif}
{ #ifndef __GA_ENTRY_GROUP_H__  }

// === Konventiert am: 25-12-25 15:56:35 ===

function GA_TYPE_ENTRY_GROUP : TGType;
function GA_ENTRY_GROUP(obj : Pointer) : PGaEntryGroup;
function GA_ENTRY_GROUP_CLASS(klass : Pointer) : PGaEntryGroupClass;
function IS_GA_ENTRY_GROUP(obj : Pointer) : Tgboolean;
function IS_GA_ENTRY_GROUP_CLASS(klass : Pointer) : Tgboolean;
function GA_ENTRY_GROUP_GET_CLASS(obj : Pointer) : PGaEntryGroupClass;

implementation

function GA_TYPE_ENTRY_GROUP : TGType;
  begin
    GA_TYPE_ENTRY_GROUP:=ga_entry_group_get_type;
  end;

function GA_ENTRY_GROUP(obj : Pointer) : PGaEntryGroup;
begin
  Result := PGaEntryGroup(g_type_check_instance_cast(obj, GA_TYPE_ENTRY_GROUP));
end;

function GA_ENTRY_GROUP_CLASS(klass : Pointer) : PGaEntryGroupClass;
begin
  Result := PGaEntryGroupClass(g_type_check_class_cast(klass, GA_TYPE_ENTRY_GROUP));
end;

function IS_GA_ENTRY_GROUP(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GA_TYPE_ENTRY_GROUP);
end;

function IS_GA_ENTRY_GROUP_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GA_TYPE_ENTRY_GROUP);
end;

function GA_ENTRY_GROUP_GET_CLASS(obj : Pointer) : PGaEntryGroupClass;
begin
  Result := PGaEntryGroupClass(PGTypeInstance(obj)^.g_class);
end;



end.
