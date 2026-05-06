unit shumate_vector_sprite;

interface

uses
  fp_GTK4, fp_glib2, fp_shumate;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TShumateVectorSprite = record
  end;
  PShumateVectorSprite = ^TShumateVectorSprite;

  TShumateVectorSpriteClass = record
    parent_class: TGObjectClass;
  end;
  PShumateVectorSpriteClass = ^TShumateVectorSpriteClass;

function shumate_vector_sprite_get_type: TGType; cdecl; external libshumate;
function shumate_vector_sprite_new(source_paintable: PGdkPaintable): PShumateVectorSprite; cdecl; external libshumate;
function shumate_vector_sprite_new_full(source_paintable: PGdkPaintable; width: longint; height: longint; scale_factor: double; source_rect: PGdkRectangle): PShumateVectorSprite; cdecl; external libshumate;
function shumate_vector_sprite_get_source_paintable(self: PShumateVectorSprite): PGdkPaintable; cdecl; external libshumate;
function shumate_vector_sprite_get_width(self: PShumateVectorSprite): longint; cdecl; external libshumate;
function shumate_vector_sprite_get_height(self: PShumateVectorSprite): longint; cdecl; external libshumate;
function shumate_vector_sprite_get_scale_factor(self: PShumateVectorSprite): double; cdecl; external libshumate;
function shumate_vector_sprite_get_source_rect(self: PShumateVectorSprite): PGdkRectangle; cdecl; external libshumate;

// === Konventiert am: 6-5-26 15:47:56 ===

function SHUMATE_TYPE_VECTOR_SPRITE: TGType;
function SHUMATE_VECTOR_SPRITE(obj: Pointer): PShumateVectorSprite;
function SHUMATE_IS_VECTOR_SPRITE(obj: Pointer): Tgboolean;

implementation

function SHUMATE_TYPE_VECTOR_SPRITE: TGType;
begin
  Result := shumate_vector_sprite_get_type;
end;

function SHUMATE_VECTOR_SPRITE(obj: Pointer): PShumateVectorSprite;
begin
  Result := PShumateVectorSprite(g_type_check_instance_cast(obj, SHUMATE_TYPE_VECTOR_SPRITE));
end;

function SHUMATE_IS_VECTOR_SPRITE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, SHUMATE_TYPE_VECTOR_SPRITE);
end;


end.
