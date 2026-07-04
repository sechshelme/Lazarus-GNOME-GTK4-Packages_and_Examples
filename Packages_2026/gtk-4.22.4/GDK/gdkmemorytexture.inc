{$IFDEF read_interface}

type
  PGdkMemoryTexture = type Pointer;

const
  {$IFDEF ENDIAN_LITTLE}
  GDK_MEMORY_DEFAULT = GDK_MEMORY_B8G8R8A8_PREMULTIPLIED;
  {$ELSE}
  GDK_MEMORY_DEFAULT = GDK_MEMORY_A8R8G8B8_PREMULTIPLIED;
  {$ENDIF}

function gdk_memory_texture_get_type: TGType; cdecl; external libgtk4;
function gdk_memory_texture_new(width: longint; height: longint; format: TGdkMemoryFormat; bytes: PGBytes; stride: Tgsize): PGdkTexture; cdecl; external libgtk4;

// === Konventiert am: 2-7-26 19:24:19 ===

function GDK_TYPE_MEMORY_TEXTURE: TGType;
function GDK_MEMORY_TEXTURE(obj: Pointer): PGdkMemoryTexture;
function GDK_IS_MEMORY_TEXTURE(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GDK_TYPE_MEMORY_TEXTURE: TGType;
begin
  GDK_TYPE_MEMORY_TEXTURE := gdk_memory_texture_get_type;
end;

function GDK_MEMORY_TEXTURE(obj: Pointer): PGdkMemoryTexture;
begin
  Result := PGdkMemoryTexture(g_type_check_instance_cast(obj, GDK_TYPE_MEMORY_TEXTURE));
end;

function GDK_IS_MEMORY_TEXTURE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GDK_TYPE_MEMORY_TEXTURE);
end;



{$ENDIF read_implementation}
