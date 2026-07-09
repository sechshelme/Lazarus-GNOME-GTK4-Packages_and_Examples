unit gtkpagesetup;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GTK - The GIMP Toolkit
 * gtkpagesetup.h: Page Setup
 * Copyright (C) 2006, Red Hat, Inc.
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library. If not, see <http://www.gnu.org/licenses/>.
  }
(** unsupported pragma#pragma once*)
{$if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gtk/gtk.h> can be included directly."}
{$endif}
{$include <gtk/print/gtkpapersize.h>}
type

function gtk_page_setup_get_type:TGType;cdecl;external libgtk4;
function gtk_page_setup_new:PGtkPageSetup;cdecl;external libgtk4;
function gtk_page_setup_copy(other:PGtkPageSetup):PGtkPageSetup;cdecl;external libgtk4;
function gtk_page_setup_get_orientation(setup:PGtkPageSetup):TGtkPageOrientation;cdecl;external libgtk4;
procedure gtk_page_setup_set_orientation(setup:PGtkPageSetup; orientation:TGtkPageOrientation);cdecl;external libgtk4;
function gtk_page_setup_get_paper_size(setup:PGtkPageSetup):PGtkPaperSize;cdecl;external libgtk4;
procedure gtk_page_setup_set_paper_size(setup:PGtkPageSetup; size:PGtkPaperSize);cdecl;external libgtk4;
function gtk_page_setup_get_top_margin(setup:PGtkPageSetup; unit:TGtkUnit):Tdouble;cdecl;external libgtk4;
procedure gtk_page_setup_set_top_margin(setup:PGtkPageSetup; margin:Tdouble; unit:TGtkUnit);cdecl;external libgtk4;
function gtk_page_setup_get_bottom_margin(setup:PGtkPageSetup; unit:TGtkUnit):Tdouble;cdecl;external libgtk4;
procedure gtk_page_setup_set_bottom_margin(setup:PGtkPageSetup; margin:Tdouble; unit:TGtkUnit);cdecl;external libgtk4;
function gtk_page_setup_get_left_margin(setup:PGtkPageSetup; unit:TGtkUnit):Tdouble;cdecl;external libgtk4;
procedure gtk_page_setup_set_left_margin(setup:PGtkPageSetup; margin:Tdouble; unit:TGtkUnit);cdecl;external libgtk4;
function gtk_page_setup_get_right_margin(setup:PGtkPageSetup; unit:TGtkUnit):Tdouble;cdecl;external libgtk4;
procedure gtk_page_setup_set_right_margin(setup:PGtkPageSetup; margin:Tdouble; unit:TGtkUnit);cdecl;external libgtk4;
procedure gtk_page_setup_set_paper_size_and_default_margins(setup:PGtkPageSetup; size:PGtkPaperSize);cdecl;external libgtk4;
{ These take orientation, but not margins into consideration  }
function gtk_page_setup_get_paper_width(setup:PGtkPageSetup; unit:TGtkUnit):Tdouble;cdecl;external libgtk4;
function gtk_page_setup_get_paper_height(setup:PGtkPageSetup; unit:TGtkUnit):Tdouble;cdecl;external libgtk4;
{ These take orientation, and margins into consideration  }
function gtk_page_setup_get_page_width(setup:PGtkPageSetup; unit:TGtkUnit):Tdouble;cdecl;external libgtk4;
function gtk_page_setup_get_page_height(setup:PGtkPageSetup; unit:TGtkUnit):Tdouble;cdecl;external libgtk4;
{ Saving and restoring page setup  }
function gtk_page_setup_new_from_file(file_name:Pchar; error:PPGError):PGtkPageSetup;cdecl;external libgtk4;
function gtk_page_setup_load_file(setup:PGtkPageSetup; file_name:Pchar; error:PPGError):Tgboolean;cdecl;external libgtk4;
function gtk_page_setup_to_file(setup:PGtkPageSetup; file_name:Pchar; error:PPGError):Tgboolean;cdecl;external libgtk4;
function gtk_page_setup_new_from_key_file(key_file:PGKeyFile; group_name:Pchar; error:PPGError):PGtkPageSetup;cdecl;external libgtk4;
function gtk_page_setup_load_key_file(setup:PGtkPageSetup; key_file:PGKeyFile; group_name:Pchar; error:PPGError):Tgboolean;cdecl;external libgtk4;
procedure gtk_page_setup_to_key_file(setup:PGtkPageSetup; key_file:PGKeyFile; group_name:Pchar);cdecl;external libgtk4;
function gtk_page_setup_to_gvariant(setup:PGtkPageSetup):PGVariant;cdecl;external libgtk4;
function gtk_page_setup_new_from_gvariant(variant:PGVariant):PGtkPageSetup;cdecl;external libgtk4;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkPageSetup, g_object_unref) }

// === Konventiert am: 9-7-26 17:18:50 ===

function GTK_TYPE_PAGE_SETUP : TGType;
function GTK_PAGE_SETUP(obj : Pointer) : PGtkPageSetup;
function GTK_IS_PAGE_SETUP(obj : Pointer) : Tgboolean;

implementation

function GTK_TYPE_PAGE_SETUP : TGType;
  begin
    GTK_TYPE_PAGE_SETUP:=gtk_page_setup_get_type;
  end;

function GTK_PAGE_SETUP(obj : Pointer) : PGtkPageSetup;
begin
  Result := PGtkPageSetup(g_type_check_instance_cast(obj, GTK_TYPE_PAGE_SETUP));
end;

function GTK_IS_PAGE_SETUP(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GTK_TYPE_PAGE_SETUP);
end;



end.
