unit adap_swipeable;

interface

uses
  fp_adapta;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2019 Alice Mikhaylenko <alicem@gnome.org>
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
  }
(** unsupported pragma#pragma once*)
{$if !defined(_ADAPTA_INSIDE) && !defined(ADAPTA_COMPILATION)}
{$error "Only <adapta.h> can be included directly."}
{$endif}
{$include "adap-version.h"}
{$include <gtk/gtk.h>}
{$include "adap-navigation-direction.h"}

{G_DECLARE_INTERFACE (AdapSwipeable, adap_swipeable, ADAP, SWIPEABLE, GtkWidget) }
{*
 * AdapSwipeableInterface:
 * @parent: The parent interface.
 * @get_distance: Gets the swipe distance.
 * @get_snap_points: Gets the snap points.
 * @get_progress: Gets the current progress.
 * @get_cancel_progress: Gets the cancel progress.
 * @get_swipe_area: Gets the swipeable rectangle.
 *
 * An interface for swipeable widgets.
 * }
{< private > }
type
  PAdapSwipeableInterface = ^TAdapSwipeableInterface;
  TAdapSwipeableInterface = record
      parent : TGTypeInterface;
      get_distance : function (self:PAdapSwipeable):Tdouble;cdecl;
      get_snap_points : function (self:PAdapSwipeable; n_snap_points:Plongint):Pdouble;cdecl;
      get_progress : function (self:PAdapSwipeable):Tdouble;cdecl;
      get_cancel_progress : function (self:PAdapSwipeable):Tdouble;cdecl;
      get_swipe_area : procedure (self:PAdapSwipeable; navigation_direction:TAdapNavigationDirection; is_drag:Tgboolean; rect:PGdkRectangle);cdecl;
      padding : array[0..3] of Tgpointer;
    end;


function adap_swipeable_get_distance(self:PAdapSwipeable):Tdouble;cdecl;external libadapta;
function adap_swipeable_get_snap_points(self:PAdapSwipeable; n_snap_points:Plongint):Pdouble;cdecl;external libadapta;
function adap_swipeable_get_progress(self:PAdapSwipeable):Tdouble;cdecl;external libadapta;
function adap_swipeable_get_cancel_progress(self:PAdapSwipeable):Tdouble;cdecl;external libadapta;
procedure adap_swipeable_get_swipe_area(self:PAdapSwipeable; navigation_direction:TAdapNavigationDirection; is_drag:Tgboolean; rect:PGdkRectangle);cdecl;external libadapta;

// === Konventiert am: 4-12-25 17:18:53 ===

function ADAP_TYPE_SWIPEABLE: TGType;
function ADAP_SWIPEABLE(obj: Pointer): PAdapSwipeable;
function ADAP_IS_SWIPEABLE(obj: Pointer): Tgboolean;
function ADAP_SWIPEABLE_GET_IFACE(obj: Pointer): PAdapSwipeableInterface;

implementation

function ADAP_TYPE_SWIPEABLE: TGType;
begin
  Result := adap_swipeable_get_type;
end;

function ADAP_SWIPEABLE(obj: Pointer): PAdapSwipeable;
begin
  Result := PAdapSwipeable(g_type_check_instance_cast(obj, ADAP_TYPE_SWIPEABLE));
end;

function ADAP_IS_SWIPEABLE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADAP_TYPE_SWIPEABLE);
end;

function ADAP_SWIPEABLE_GET_IFACE(obj: Pointer): PAdapSwipeableInterface;
begin
  Result := g_type_interface_peek(obj, ADAP_TYPE_SWIPEABLE);
end;

type 
  TAdapSwipeable = record
  end;
  PAdapSwipeable = ^TAdapSwipeable;

  TAdapSwipeableInterface = record
  end;
  PAdapSwipeableInterface = ^TAdapSwipeableInterface;

function adap_swipeable_get_type: TGType; cdecl; external libgxxxxxxx;



end.
