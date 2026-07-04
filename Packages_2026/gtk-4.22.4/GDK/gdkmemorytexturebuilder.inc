{$IFDEF read_interface}


type
  PGdkMemoryTextureBuilder = type Pointer;
  PGdkMemoryTextureBuilderClass = type Pointer;

function gdk_memory_texture_builder_get_type: TGType; cdecl; external libgtk4;
function gdk_memory_texture_builder_new: PGdkMemoryTextureBuilder; cdecl; external libgtk4;
function gdk_memory_texture_builder_get_bytes(self: PGdkMemoryTextureBuilder): PGBytes; cdecl; external libgtk4;
procedure gdk_memory_texture_builder_set_bytes(self: PGdkMemoryTextureBuilder; bytes: PGBytes); cdecl; external libgtk4;
function gdk_memory_texture_builder_get_stride(self: PGdkMemoryTextureBuilder): Tgsize; cdecl; external libgtk4;
procedure gdk_memory_texture_builder_set_stride(self: PGdkMemoryTextureBuilder; stride: Tgsize); cdecl; external libgtk4;
function gdk_memory_texture_builder_get_stride_for_plane(self: PGdkMemoryTextureBuilder; plane: dword): Tgsize; cdecl; external libgtk4;
procedure gdk_memory_texture_builder_set_stride_for_plane(self: PGdkMemoryTextureBuilder; plane: dword; stride: Tgsize); cdecl; external libgtk4;
function gdk_memory_texture_builder_get_offset(self: PGdkMemoryTextureBuilder; plane: dword): Tgsize; cdecl; external libgtk4;
procedure gdk_memory_texture_builder_set_offset(self: PGdkMemoryTextureBuilder; plane: dword; offset: Tgsize); cdecl; external libgtk4;
function gdk_memory_texture_builder_get_width(self: PGdkMemoryTextureBuilder): longint; cdecl; external libgtk4;
procedure gdk_memory_texture_builder_set_width(self: PGdkMemoryTextureBuilder; width: longint); cdecl; external libgtk4;
function gdk_memory_texture_builder_get_height(self: PGdkMemoryTextureBuilder): longint; cdecl; external libgtk4;
procedure gdk_memory_texture_builder_set_height(self: PGdkMemoryTextureBuilder; height: longint); cdecl; external libgtk4;
function gdk_memory_texture_builder_get_format(self: PGdkMemoryTextureBuilder): TGdkMemoryFormat; cdecl; external libgtk4;
procedure gdk_memory_texture_builder_set_format(self: PGdkMemoryTextureBuilder; format: TGdkMemoryFormat); cdecl; external libgtk4;
function gdk_memory_texture_builder_get_color_state(self: PGdkMemoryTextureBuilder): PGdkColorState; cdecl; external libgtk4;
procedure gdk_memory_texture_builder_set_color_state(self: PGdkMemoryTextureBuilder; color_state: PGdkColorState); cdecl; external libgtk4;
function gdk_memory_texture_builder_get_update_texture(self: PGdkMemoryTextureBuilder): PGdkTexture; cdecl; external libgtk4;
procedure gdk_memory_texture_builder_set_update_texture(self: PGdkMemoryTextureBuilder; texture: PGdkTexture); cdecl; external libgtk4;
function gdk_memory_texture_builder_get_update_region(self: PGdkMemoryTextureBuilder): Pcairo_region_t; cdecl; external libgtk4;
procedure gdk_memory_texture_builder_set_update_region(self: PGdkMemoryTextureBuilder; region: Pcairo_region_t); cdecl; external libgtk4;
function gdk_memory_texture_builder_build(self: PGdkMemoryTextureBuilder): PGdkTexture; cdecl; external libgtk4;

// === Konventiert am: 2-7-26 19:23:54 ===

function GDK_TYPE_MEMORY_TEXTURE_BUILDER: TGType;
function GDK_MEMORY_TEXTURE_BUILDER(obj: Pointer): PGdkMemoryTextureBuilder;
function GDK_IS_MEMORY_TEXTURE_BUILDER(obj: Pointer): Tgboolean;
function GDK_MEMORY_TEXTURE_BUILDER_CLASS(klass: Pointer): PGdkMemoryTextureBuilderClass;
function GDK_IS_MEMORY_TEXTURE_BUILDER_CLASS(klass: Pointer): Tgboolean;
function GDK_MEMORY_TEXTURE_BUILDER_GET_CLASS(obj: Pointer): PGdkMemoryTextureBuilderClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GDK_TYPE_MEMORY_TEXTURE_BUILDER: TGType;
begin
  Result := gdk_memory_texture_builder_get_type;
end;

function GDK_MEMORY_TEXTURE_BUILDER(obj: Pointer): PGdkMemoryTextureBuilder;
begin
  Result := PGdkMemoryTextureBuilder(g_type_check_instance_cast(obj, GDK_TYPE_MEMORY_TEXTURE_BUILDER));
end;

function GDK_IS_MEMORY_TEXTURE_BUILDER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GDK_TYPE_MEMORY_TEXTURE_BUILDER);
end;

function GDK_MEMORY_TEXTURE_BUILDER_CLASS(klass: Pointer): PGdkMemoryTextureBuilderClass;
begin
  Result := PGdkMemoryTextureBuilderClass(g_type_check_class_cast(klass, GDK_TYPE_MEMORY_TEXTURE_BUILDER));
end;

function GDK_IS_MEMORY_TEXTURE_BUILDER_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GDK_TYPE_MEMORY_TEXTURE_BUILDER);
end;

function GDK_MEMORY_TEXTURE_BUILDER_GET_CLASS(obj: Pointer): PGdkMemoryTextureBuilderClass;
begin
  Result := PGdkMemoryTextureBuilderClass(PGTypeInstance(obj)^.g_class);
end;

{$ENDIF read_implementation}
