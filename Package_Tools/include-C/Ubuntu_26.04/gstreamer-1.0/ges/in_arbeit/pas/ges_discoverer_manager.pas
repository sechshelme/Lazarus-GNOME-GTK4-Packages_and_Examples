unit ges_discoverer_manager;

interface

uses
  fp_glib2, fp_gst, ges_enums;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


(** unsupported pragma#pragma once*)
{$include <ges/ges-types.h>}
{$include <gst/gst.h>}
{$include <gst/pbutils/pbutils.h>}
{$include <glib-object.h>}
{*
 * GES_TYPE_DISCOVERER_MANAGER:
 *
 * Since: 1.24
  }

type
  PGESDiscovererManagerClass = ^TGESDiscovererManagerClass;
  TGESDiscovererManagerClass = record
      parent_class : TGObjectClass;
    end;

{GES_DECLARE_TYPE(DiscovererManager, discoverer_manager, DISCOVERER_MANAGER); }

function ges_discoverer_manager_get_timeout(self:PGESDiscovererManager):TGstClockTime;cdecl;external libges;
procedure ges_discoverer_manager_set_timeout(self:PGESDiscovererManager; timeout:TGstClockTime);cdecl;external libges;
function ges_discoverer_manager_get_default:PGESDiscovererManager;cdecl;external libges;
procedure ges_discoverer_manager_set_use_cache(self:PGESDiscovererManager; use_cache:Tgboolean);cdecl;external libges;
function ges_discoverer_manager_get_use_cache(self:PGESDiscovererManager):Tgboolean;cdecl;external libges;

// === Konventiert am: 27-7-26 19:55:02 ===

function GES_TYPE_DISCOVERER_MANAGER: TGType;
function GES_DISCOVERER_MANAGER(obj: Pointer): PGESDiscovererManager;
function GES_IS_DISCOVERER_MANAGER(obj: Pointer): Tgboolean;
function GES_DISCOVERER_MANAGER_CLASS(klass: Pointer): PGESDiscovererManagerClass;
function GES_IS_DISCOVERER_MANAGER_CLASS(klass: Pointer): Tgboolean;
function GES_DISCOVERER_MANAGER_GET_CLASS(obj: Pointer): PGESDiscovererManagerClass;

implementation

function GES_TYPE_DISCOVERER_MANAGER: TGType;
begin
  Result := ges_discoverer_manager_get_type;
end;

function GES_DISCOVERER_MANAGER(obj: Pointer): PGESDiscovererManager;
begin
  Result := PGESDiscovererManager(g_type_check_instance_cast(obj, GES_TYPE_DISCOVERER_MANAGER));
end;

function GES_IS_DISCOVERER_MANAGER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GES_TYPE_DISCOVERER_MANAGER);
end;

function GES_DISCOVERER_MANAGER_CLASS(klass: Pointer): PGESDiscovererManagerClass;
begin
  Result := PGESDiscovererManagerClass(g_type_check_class_cast(klass, GES_TYPE_DISCOVERER_MANAGER));
end;

function GES_IS_DISCOVERER_MANAGER_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GES_TYPE_DISCOVERER_MANAGER);
end;

function GES_DISCOVERER_MANAGER_GET_CLASS(obj: Pointer): PGESDiscovererManagerClass;
begin
  Result := PGESDiscovererManagerClass(PGTypeInstance(obj)^.g_class);
end;

type 
  PGESDiscovererManagerPrivate = type Pointer

function ges_discoverer_manager_get_type: TGType; cdecl; external libgxxxxxxx;



end.
