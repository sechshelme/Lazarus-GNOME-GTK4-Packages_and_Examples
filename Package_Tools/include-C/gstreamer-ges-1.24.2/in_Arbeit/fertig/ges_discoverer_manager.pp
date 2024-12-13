
unit ges_discoverer_manager;
interface

{
  Automatically converted by H2Pas 1.0.0 from ges_discoverer_manager.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    ges_discoverer_manager.h
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
Pffff  = ^ffff;
PGESDiscovererManager  = ^GESDiscovererManager;
PGESDiscovererManagerClass  = ^GESDiscovererManagerClass;
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

{ was #define dname def_expr }
function GES_TYPE_DISCOVERER_MANAGER : longint; { return type might be wrong }

type
  PGESDiscovererManagerClass = ^TGESDiscovererManagerClass;
  TGESDiscovererManagerClass = record
      parent_class : TGObjectClass;
    end;
  Tffff = TGESDiscovererManagerClass;
  Pffff = ^Tffff;
{GES_DECLARE_TYPE( DiscovererManager, discoverer_manager, DISCOVERER_MANAGER); }

function ges_discoverer_manager_get_timeout(self:PGESDiscovererManager):TGstClockTime;cdecl;external;
procedure ges_discoverer_manager_set_timeout(self:PGESDiscovererManager; timeout:TGstClockTime);cdecl;external;
function ges_discoverer_manager_get_default:PGESDiscovererManager;cdecl;external;
procedure ges_discoverer_manager_set_use_cache(self:PGESDiscovererManager; use_cache:Tgboolean);cdecl;external;
function ges_discoverer_manager_get_use_cache(self:PGESDiscovererManager):Tgboolean;cdecl;external;

implementation

{ was #define dname def_expr }
function GES_TYPE_DISCOVERER_MANAGER : longint; { return type might be wrong }
  begin
    GES_TYPE_DISCOVERER_MANAGER:=ges_discoverer_manager_get_type;
  end;


end.
