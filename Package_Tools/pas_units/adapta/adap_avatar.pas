unit adap_avatar;

interface

uses
  fp_adapta;

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

{G_DECLARE_FINAL_TYPE (AdapAvatar, adap_avatar, ADAP, AVATAR, GtkWidget) }
function adap_avatar_new(size:longint; text:Pchar; show_initials:Tgboolean):PGtkWidget;cdecl;external libadapta;
function adap_avatar_get_icon_name(self:PAdapAvatar):Pchar;cdecl;external libadapta;
procedure adap_avatar_set_icon_name(self:PAdapAvatar; icon_name:Pchar);cdecl;external libadapta;
function adap_avatar_get_text(self:PAdapAvatar):Pchar;cdecl;external libadapta;
procedure adap_avatar_set_text(self:PAdapAvatar; text:Pchar);cdecl;external libadapta;
function adap_avatar_get_show_initials(self:PAdapAvatar):Tgboolean;cdecl;external libadapta;
procedure adap_avatar_set_show_initials(self:PAdapAvatar; show_initials:Tgboolean);cdecl;external libadapta;
function adap_avatar_get_custom_image(self:PAdapAvatar):PGdkPaintable;cdecl;external libadapta;
procedure adap_avatar_set_custom_image(self:PAdapAvatar; custom_image:PGdkPaintable);cdecl;external libadapta;
function adap_avatar_get_size(self:PAdapAvatar):longint;cdecl;external libadapta;
procedure adap_avatar_set_size(self:PAdapAvatar; size:longint);cdecl;external libadapta;
function adap_avatar_draw_to_texture(self:PAdapAvatar; scale_factor:longint):PGdkTexture;cdecl;external libadapta;

// === Konventiert am: 4-12-25 17:01:05 ===

function ADAP_TYPE_AVATAR: TGType;
function ADAP_AVATAR(obj: Pointer): PAdapAvatar;
function ADAP_IS_AVATAR(obj: Pointer): Tgboolean;

implementation

function ADAP_TYPE_AVATAR: TGType;
begin
  Result := adap_avatar_get_type;
end;

function ADAP_AVATAR(obj: Pointer): PAdapAvatar;
begin
  Result := PAdapAvatar(g_type_check_instance_cast(obj, ADAP_TYPE_AVATAR));
end;

function ADAP_IS_AVATAR(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADAP_TYPE_AVATAR);
end;

type 
  TAdapAvatar = record
  end;
  PAdapAvatar = ^TAdapAvatar;

  TAdapAvatarClass = record
    parent_class: TGtkWidgetClass;
  end;
  PAdapAvatarClass = ^TAdapAvatarClass;

function adap_avatar_get_type: TGType; cdecl; external libgxxxxxxx;



end.
