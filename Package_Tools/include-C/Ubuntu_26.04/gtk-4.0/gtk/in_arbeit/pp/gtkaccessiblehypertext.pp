
unit gtkaccessiblehypertext;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtkaccessiblehypertext.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtkaccessiblehypertext.h
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
PGtkAccessibleHyperlink  = ^GtkAccessibleHyperlink;
PGtkAccessibleHypertext  = ^GtkAccessibleHypertext;
PGtkAccessibleHypertextInterface  = ^GtkAccessibleHypertextInterface;
PGtkAccessibleTextRange  = ^GtkAccessibleTextRange;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ gtkaccessiblehypertext.h: Interface for accessible objects containing links
 *
 * SPDX-FileCopyrightText: 2025  Red Hat, Inc.
 * SPDX-License-Identifier: LGPL-2.1-or-later
  }
(** unsupported pragma#pragma once*)
{$if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gtk/gtk.h> can be included directly."}
{$endif}
{$include <gtk/gtkaccessible.h>}
{$include <gtk/gtkaccessibletext.h>}
{$include <graphene.h>}

{ was #define dname def_expr }
function GTK_ACCESSIBLE_HYPERLINK_TYPE : longint; { return type might be wrong }

{ G_DECLARE_FINAL_TYPE (GtkAccessibleHyperlink, gtk_accessible_hyperlink, GTK, ACCESSIBLE_HYPERLINK, GObject); }
{ was #define dname def_expr }
function GTK_TYPE_ACCESSIBLE_HYPERTEXT : longint; { return type might be wrong }

{*
 * GtkAccessibleHypertext:
 *
 * An interface for accessible objects containing links.
 *
 * The `GtkAccessibleHypertext` interfaces is meant to be implemented by accessible
 * objects that contain links. Those links don't necessarily have to be part
 * of text, they can be associated with images and other things.
 *
 * Since: 4.22
  }
{ G_DECLARE_INTERFACE (GtkAccessibleHypertext, gtk_accessible_hypertext, GTK, ACCESSIBLE_HYPERTEXT, GtkAccessible) }
{*
 * GtkAccessibleHypertextInterface:
 *
 * The interface vtable for accessible objects containing links.
 *
 * Since: 4.22
  }
{< private > }
{< public > }
{*
   * GtkAccessibleHypertextInterface::get_n_links:
   * @self: the accessible object
   *
   * Retrieve the number of links in the accessible object.
   *
   * Returns: the number of links
   *
   * Since: 4.22
    }
{*
   * GtkAccessibleHypertextInterface::get_link:
   * @self: the accessible object
   * @index: the index of the link
   *
   * Retrieve the n-th link in the accessible object.
   *
   * @index must be smaller than the number of links.
   *
   * Returns: (transfer none): the link
   *
   * Since: 4.22
    }
{*
   * GtkAccessibleTextInterface::get_link_at:
   * @self: the accessible object
   * @offset: the character offset
   *
   * Retrieves the index of the link at the given character offset.
   *
   * Note that this method will return `G_MAXUINT` if the object
   * does not contain text.
   *
   * Returns: index of the link at the given character offset, or
   *   `G_MAXUINT` if there is no link
   *
   * Since: 4.22
    }
type
  PGtkAccessibleHypertextInterface = ^TGtkAccessibleHypertextInterface;
  TGtkAccessibleHypertextInterface = record
      g_iface : TGTypeInterface;
      get_n_links : function (self:PGtkAccessibleHypertext):dword;cdecl;
      get_link : function (self:PGtkAccessibleHypertext; index:dword):PGtkAccessibleHyperlink;cdecl;
      get_link_at : function (self:PGtkAccessibleHypertext; offset:dword):dword;cdecl;
    end;

(* Const before type ignored *)

function gtk_accessible_hyperlink_new(parent:PGtkAccessibleHypertext; index:dword; uri:Pchar; bounds:PGtkAccessibleTextRange):PGtkAccessibleHyperlink;cdecl;external;
procedure gtk_accessible_hyperlink_set_platform_state(self:PGtkAccessibleHyperlink; state:TGtkAccessiblePlatformState; enabled:Tgboolean);cdecl;external;

implementation

{ was #define dname def_expr }
function GTK_ACCESSIBLE_HYPERLINK_TYPE : longint; { return type might be wrong }
  begin
    GTK_ACCESSIBLE_HYPERLINK_TYPE:=gtk_accessible_hyperlink_get_type;
  end;

{ was #define dname def_expr }
function GTK_TYPE_ACCESSIBLE_HYPERTEXT : longint; { return type might be wrong }
  begin
    GTK_TYPE_ACCESSIBLE_HYPERTEXT:=gtk_accessible_hypertext_get_type;
  end;


end.
