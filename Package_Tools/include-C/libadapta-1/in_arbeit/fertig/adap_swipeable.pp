
unit adap_swipeable;
interface

{
  Automatically converted by H2Pas 1.0.0 from adap_swipeable.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    adap_swipeable.h
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
PAdapSwipeable  = ^AdapSwipeable;
PAdapSwipeableInterface  = ^AdapSwipeableInterface;
Pdouble  = ^double;
PGdkRectangle  = ^GdkRectangle;
Plongint  = ^longint;
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

{ was #define dname def_expr }
function ADAP_TYPE_SWIPEABLE : longint; { return type might be wrong }

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


function adap_swipeable_get_distance(self:PAdapSwipeable):Tdouble;cdecl;external;
function adap_swipeable_get_snap_points(self:PAdapSwipeable; n_snap_points:Plongint):Pdouble;cdecl;external;
function adap_swipeable_get_progress(self:PAdapSwipeable):Tdouble;cdecl;external;
function adap_swipeable_get_cancel_progress(self:PAdapSwipeable):Tdouble;cdecl;external;
procedure adap_swipeable_get_swipe_area(self:PAdapSwipeable; navigation_direction:TAdapNavigationDirection; is_drag:Tgboolean; rect:PGdkRectangle);cdecl;external;

implementation

{ was #define dname def_expr }
function ADAP_TYPE_SWIPEABLE : longint; { return type might be wrong }
  begin
    ADAP_TYPE_SWIPEABLE:=adap_swipeable_get_type;
  end;


end.
