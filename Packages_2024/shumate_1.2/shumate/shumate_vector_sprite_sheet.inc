{$IFDEF read_interface}


type
  TShumateVectorSpriteSheet = record
  end;
  PShumateVectorSpriteSheet = ^TShumateVectorSpriteSheet;

  TShumateVectorSpriteSheetClass = record
    parent_class: TGObjectClass;
  end;
  PShumateVectorSpriteSheetClass = ^TShumateVectorSpriteSheetClass;

function shumate_vector_sprite_sheet_get_type: TGType; cdecl; external libshumate;
function shumate_vector_sprite_sheet_new: PShumateVectorSpriteSheet; cdecl; external libshumate;
procedure shumate_vector_sprite_sheet_add_sprite(self: PShumateVectorSpriteSheet; name: pchar; sprite: PShumateVectorSprite); cdecl; external libshumate;
function shumate_vector_sprite_sheet_add_page(self: PShumateVectorSpriteSheet; texture: PGdkTexture; json: pchar; default_scale: double; error: PPGError): Tgboolean; cdecl; external libshumate;
function shumate_vector_sprite_sheet_get_sprite(self: PShumateVectorSpriteSheet; name: pchar; scale: double): PShumateVectorSprite; cdecl; external libshumate;

type
  TShumateVectorSpriteFallbackFunc = function(sprite_sheet: PShumateVectorSpriteSheet; name: pchar; scale: double; user_data: Tgpointer): PShumateVectorSprite; cdecl;

procedure shumate_vector_sprite_sheet_set_fallback(self: PShumateVectorSpriteSheet; fallback: TShumateVectorSpriteFallbackFunc; user_data: Tgpointer; notify: TGDestroyNotify); cdecl; external libshumate;

// === Konventiert am: 6-5-26 15:44:30 ===

function SHUMATE_TYPE_VECTOR_SPRITE_SHEET: TGType;
function SHUMATE_VECTOR_SPRITE_SHEET(obj: Pointer): PShumateVectorSpriteSheet;
function SHUMATE_IS_VECTOR_SPRITE_SHEET(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function SHUMATE_TYPE_VECTOR_SPRITE_SHEET: TGType;
begin
  Result := shumate_vector_sprite_sheet_get_type;
end;

function SHUMATE_VECTOR_SPRITE_SHEET(obj: Pointer): PShumateVectorSpriteSheet;
begin
  Result := PShumateVectorSpriteSheet(g_type_check_instance_cast(obj, SHUMATE_TYPE_VECTOR_SPRITE_SHEET));
end;

function SHUMATE_IS_VECTOR_SPRITE_SHEET(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, SHUMATE_TYPE_VECTOR_SPRITE_SHEET);
end;


{$ENDIF read_implementation}
