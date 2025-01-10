
unit adw_avatar;
interface

{
  Automatically converted by H2Pas 1.0.0 from adw_avatar.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    adw_avatar.h
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
PAdwAvatar  = ^AdwAvatar;
Pchar  = ^char;
PGdkPaintable  = ^GdkPaintable;
PGdkTexture  = ^GdkTexture;
PGtkWidget  = ^GtkWidget;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2020 Purism SPC
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
  }
(** unsupported pragma#pragma once*)
{$if !defined(_ADWAITA_INSIDE) && !defined(ADWAITA_COMPILATION)}
{$error "Only <adwaita.h> can be included directly."}
{$endif}
{$include "adw-version.h"}
{$include <gtk/gtk.h>}

{ was #define dname def_expr }
function ADW_TYPE_AVATAR : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (AdwAvatar, adw_avatar, ADW, AVATAR, GtkWidget) }
(* Const before type ignored *)
function adw_avatar_new(size:longint; text:Pchar; show_initials:Tgboolean):PGtkWidget;cdecl;external;
(* Const before type ignored *)
function adw_avatar_get_icon_name(self:PAdwAvatar):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adw_avatar_set_icon_name(self:PAdwAvatar; icon_name:Pchar);cdecl;external;
(* Const before type ignored *)
function adw_avatar_get_text(self:PAdwAvatar):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adw_avatar_set_text(self:PAdwAvatar; text:Pchar);cdecl;external;
function adw_avatar_get_show_initials(self:PAdwAvatar):Tgboolean;cdecl;external;
procedure adw_avatar_set_show_initials(self:PAdwAvatar; show_initials:Tgboolean);cdecl;external;
function adw_avatar_get_custom_image(self:PAdwAvatar):PGdkPaintable;cdecl;external;
procedure adw_avatar_set_custom_image(self:PAdwAvatar; custom_image:PGdkPaintable);cdecl;external;
function adw_avatar_get_size(self:PAdwAvatar):longint;cdecl;external;
procedure adw_avatar_set_size(self:PAdwAvatar; size:longint);cdecl;external;
function adw_avatar_draw_to_texture(self:PAdwAvatar; scale_factor:longint):PGdkTexture;cdecl;external;

implementation

{ was #define dname def_expr }
function ADW_TYPE_AVATAR : longint; { return type might be wrong }
  begin
    ADW_TYPE_AVATAR:=adw_avatar_get_type;
  end;


end.
