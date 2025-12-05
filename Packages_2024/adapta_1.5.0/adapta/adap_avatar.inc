{$IFDEF read_interface}


type
  TAdapAvatar = record
  end;
  PAdapAvatar = ^TAdapAvatar;

  TAdapAvatarClass = record
    parent_class: TGtkWidgetClass;
  end;
  PAdapAvatarClass = ^TAdapAvatarClass;

function adap_avatar_get_type: TGType; cdecl; external libadapta;
function adap_avatar_new(size: longint; text: pchar; show_initials: Tgboolean): PGtkWidget; cdecl; external libadapta;
function adap_avatar_get_icon_name(self: PAdapAvatar): pchar; cdecl; external libadapta;
procedure adap_avatar_set_icon_name(self: PAdapAvatar; icon_name: pchar); cdecl; external libadapta;
function adap_avatar_get_text(self: PAdapAvatar): pchar; cdecl; external libadapta;
procedure adap_avatar_set_text(self: PAdapAvatar; text: pchar); cdecl; external libadapta;
function adap_avatar_get_show_initials(self: PAdapAvatar): Tgboolean; cdecl; external libadapta;
procedure adap_avatar_set_show_initials(self: PAdapAvatar; show_initials: Tgboolean); cdecl; external libadapta;
function adap_avatar_get_custom_image(self: PAdapAvatar): PGdkPaintable; cdecl; external libadapta;
procedure adap_avatar_set_custom_image(self: PAdapAvatar; custom_image: PGdkPaintable); cdecl; external libadapta;
function adap_avatar_get_size(self: PAdapAvatar): longint; cdecl; external libadapta;
procedure adap_avatar_set_size(self: PAdapAvatar; size: longint); cdecl; external libadapta;
function adap_avatar_draw_to_texture(self: PAdapAvatar; scale_factor: longint): PGdkTexture; cdecl; external libadapta;

// === Konventiert am: 4-12-25 17:01:05 ===

function ADAP_TYPE_AVATAR: TGType;
function ADAP_AVATAR(obj: Pointer): PAdapAvatar;
function ADAP_IS_AVATAR(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

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


{$ENDIF read_implementation}
