unit gtkconstraintguide;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ gtkconstraintguide.h: Flexible space for constraints
 * Copyright 2019 Red Hat, Inc.
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
 * License along with this library. If not, see <http://www.gnu.org/licenses/>.
 *
 * Author: Matthias Clasen
  }
(** unsupported pragma#pragma once*)
{$include <gtk/gtktypes.h>}
{$include <gtk/gtkenums.h>}
{$include <gtk/gtktypebuiltins.h>}

{G_DECLARE_FINAL_TYPE (GtkConstraintGuide, gtk_constraint_guide, GTK, CONSTRAINT_GUIDE, GObject) }
function gtk_constraint_guide_new:PGtkConstraintGuide;cdecl;external libgtk4;
procedure gtk_constraint_guide_set_min_size(guide:PGtkConstraintGuide; width:longint; height:longint);cdecl;external libgtk4;
procedure gtk_constraint_guide_get_min_size(guide:PGtkConstraintGuide; width:Plongint; height:Plongint);cdecl;external libgtk4;
procedure gtk_constraint_guide_set_nat_size(guide:PGtkConstraintGuide; width:longint; height:longint);cdecl;external libgtk4;
procedure gtk_constraint_guide_get_nat_size(guide:PGtkConstraintGuide; width:Plongint; height:Plongint);cdecl;external libgtk4;
procedure gtk_constraint_guide_set_max_size(guide:PGtkConstraintGuide; width:longint; height:longint);cdecl;external libgtk4;
procedure gtk_constraint_guide_get_max_size(guide:PGtkConstraintGuide; width:Plongint; height:Plongint);cdecl;external libgtk4;
function gtk_constraint_guide_get_strength(guide:PGtkConstraintGuide):TGtkConstraintStrength;cdecl;external libgtk4;
procedure gtk_constraint_guide_set_strength(guide:PGtkConstraintGuide; strength:TGtkConstraintStrength);cdecl;external libgtk4;
procedure gtk_constraint_guide_set_name(guide:PGtkConstraintGuide; name:Pchar);cdecl;external libgtk4;
function gtk_constraint_guide_get_name(guide:PGtkConstraintGuide):Pchar;cdecl;external libgtk4;

// === Konventiert am: 6-7-26 14:08:52 ===

function GTK_TYPE_CONSTRAINT_GUIDE: TGType;
function GTK_CONSTRAINT_GUIDE(obj: Pointer): PGtkConstraintGuide;
function GTK_IS_CONSTRAINT_GUIDE(obj: Pointer): Tgboolean;

implementation

function GTK_TYPE_CONSTRAINT_GUIDE: TGType;
begin
  Result := gtk_constraint_guide_get_type;
end;

function GTK_CONSTRAINT_GUIDE(obj: Pointer): PGtkConstraintGuide;
begin
  Result := PGtkConstraintGuide(g_type_check_instance_cast(obj, GTK_TYPE_CONSTRAINT_GUIDE));
end;

function GTK_IS_CONSTRAINT_GUIDE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_CONSTRAINT_GUIDE);
end;

type 
  PGtkConstraintGuide = type Pointer;

  TGtkConstraintGuideClass = record
    parent_class: TGObjectClass;
  end;
  PGtkConstraintGuideClass = ^TGtkConstraintGuideClass;

function gtk_constraint_guide_get_type: TGType; cdecl; external libgxxxxxxx;



end.
