
unit adap_avatar;
interface

{
  Automatically converted by H2Pas 1.0.0 from adap_avatar.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    adap_avatar.h
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
PAdapAvatar  = ^AdapAvatar;
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
{$if !defined(_ADAPTA_INSIDE) && !defined(ADAPTA_COMPILATION)}
{$error "Only <adapta.h> can be included directly."}
{$endif}
{$include "adap-version.h"}
{$include <gtk/gtk.h>}

{ was #define dname def_expr }
function ADAP_TYPE_AVATAR : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (AdapAvatar, adap_avatar, ADAP, AVATAR, GtkWidget) }
(* Const before type ignored *)
function adap_avatar_new(size:longint; text:Pchar; show_initials:Tgboolean):PGtkWidget;cdecl;external;
(* Const before type ignored *)
function adap_avatar_get_icon_name(self:PAdapAvatar):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adap_avatar_set_icon_name(self:PAdapAvatar; icon_name:Pchar);cdecl;external;
(* Const before type ignored *)
function adap_avatar_get_text(self:PAdapAvatar):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adap_avatar_set_text(self:PAdapAvatar; text:Pchar);cdecl;external;
function adap_avatar_get_show_initials(self:PAdapAvatar):Tgboolean;cdecl;external;
procedure adap_avatar_set_show_initials(self:PAdapAvatar; show_initials:Tgboolean);cdecl;external;
function adap_avatar_get_custom_image(self:PAdapAvatar):PGdkPaintable;cdecl;external;
procedure adap_avatar_set_custom_image(self:PAdapAvatar; custom_image:PGdkPaintable);cdecl;external;
function adap_avatar_get_size(self:PAdapAvatar):longint;cdecl;external;
procedure adap_avatar_set_size(self:PAdapAvatar; size:longint);cdecl;external;
function adap_avatar_draw_to_texture(self:PAdapAvatar; scale_factor:longint):PGdkTexture;cdecl;external;

implementation

{ was #define dname def_expr }
function ADAP_TYPE_AVATAR : longint; { return type might be wrong }
  begin
    ADAP_TYPE_AVATAR:=adap_avatar_get_type;
  end;


end.
