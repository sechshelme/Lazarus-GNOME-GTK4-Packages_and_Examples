
unit adw_swipeable;
interface

{
  Automatically converted by H2Pas 1.0.0 from adw_swipeable.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    adw_swipeable.h
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
PAdwSwipeable  = ^AdwSwipeable;
PAdwSwipeableInterface  = ^AdwSwipeableInterface;
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
{$if !defined(_ADWAITA_INSIDE) && !defined(ADWAITA_COMPILATION)}
{$error "Only <adwaita.h> can be included directly."}
{$endif}
{$include "adw-version.h"}
{$include <gtk/gtk.h>}
{$include "adw-navigation-direction.h"}

{ was #define dname def_expr }
function ADW_TYPE_SWIPEABLE : longint; { return type might be wrong }

{G_DECLARE_INTERFACE (AdwSwipeable, adw_swipeable, ADW, SWIPEABLE, GtkWidget) }
{*
 * AdwSwipeableInterface:
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
  PAdwSwipeableInterface = ^TAdwSwipeableInterface;
  TAdwSwipeableInterface = record
      parent : TGTypeInterface;
      get_distance : function (self:PAdwSwipeable):Tdouble;cdecl;
      get_snap_points : function (self:PAdwSwipeable; n_snap_points:Plongint):Pdouble;cdecl;
      get_progress : function (self:PAdwSwipeable):Tdouble;cdecl;
      get_cancel_progress : function (self:PAdwSwipeable):Tdouble;cdecl;
      get_swipe_area : procedure (self:PAdwSwipeable; navigation_direction:TAdwNavigationDirection; is_drag:Tgboolean; rect:PGdkRectangle);cdecl;
      padding : array[0..3] of Tgpointer;
    end;


function adw_swipeable_get_distance(self:PAdwSwipeable):Tdouble;cdecl;external;
function adw_swipeable_get_snap_points(self:PAdwSwipeable; n_snap_points:Plongint):Pdouble;cdecl;external;
function adw_swipeable_get_progress(self:PAdwSwipeable):Tdouble;cdecl;external;
function adw_swipeable_get_cancel_progress(self:PAdwSwipeable):Tdouble;cdecl;external;
procedure adw_swipeable_get_swipe_area(self:PAdwSwipeable; navigation_direction:TAdwNavigationDirection; is_drag:Tgboolean; rect:PGdkRectangle);cdecl;external;

implementation

{ was #define dname def_expr }
function ADW_TYPE_SWIPEABLE : longint; { return type might be wrong }
  begin
    ADW_TYPE_SWIPEABLE:=adw_swipeable_get_type;
  end;


end.
