unit adw_avatar;

interface

uses
  fp_glib2, fp_GDK4, fp_GTK4;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {G_DECLARE_FINAL_TYPE (AdwAvatar, adw_avatar, ADW, AVATAR, GtkWidget) }
type
  TAdwAvatar = record
  end;
  PAdwAvatar = ^TAdwAvatar;

  TAdwAvatarClass = record
    parent_class: TGtkWidgetClass;
  end;
  PAdwAvatarClass = ^TAdwAvatarClass;

function adw_avatar_get_type: TGType; cdecl; external libadwaita;
function adw_avatar_new(size: longint; Text: pchar; show_initials: Tgboolean): PGtkWidget; cdecl; external libadwaita;
function adw_avatar_get_icon_name(self: PAdwAvatar): pchar; cdecl; external libadwaita;
procedure adw_avatar_set_icon_name(self: PAdwAvatar; icon_name: pchar); cdecl; external libadwaita;
function adw_avatar_get_text(self: PAdwAvatar): pchar; cdecl; external libadwaita;
procedure adw_avatar_set_text(self: PAdwAvatar; Text: pchar); cdecl; external libadwaita;
function adw_avatar_get_show_initials(self: PAdwAvatar): Tgboolean; cdecl; external libadwaita;
procedure adw_avatar_set_show_initials(self: PAdwAvatar; show_initials: Tgboolean); cdecl; external libadwaita;
function adw_avatar_get_custom_image(self: PAdwAvatar): PGdkPaintable; cdecl; external libadwaita;
procedure adw_avatar_set_custom_image(self: PAdwAvatar; custom_image: PGdkPaintable); cdecl; external libadwaita;
function adw_avatar_get_size(self: PAdwAvatar): longint; cdecl; external libadwaita;
procedure adw_avatar_set_size(self: PAdwAvatar; size: longint); cdecl; external libadwaita;
function adw_avatar_draw_to_texture(self: PAdwAvatar; scale_factor: longint): PGdkTexture; cdecl; external libadwaita;

// === Konventiert am: 10-1-25 13:55:23 ===

function ADW_TYPE_AVATAR: TGType;
function ADW_AVATAR(obj: Pointer): PAdwAvatar;
function ADW_IS_AVATAR(obj: Pointer): Tgboolean;

implementation

function ADW_TYPE_AVATAR: TGType;
begin
  Result := adw_avatar_get_type;
end;

function ADW_AVATAR(obj: Pointer): PAdwAvatar;
begin
  Result := PAdwAvatar(g_type_check_instance_cast(obj, ADW_TYPE_AVATAR));
end;

function ADW_IS_AVATAR(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADW_TYPE_AVATAR);
end;


end.
