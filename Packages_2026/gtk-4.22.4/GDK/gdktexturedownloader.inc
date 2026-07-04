{$IFDEF read_interface}


function gdk_texture_downloader_get_type: TGType; cdecl; external libgtk4;
function gdk_texture_downloader_new(texture: PGdkTexture): PGdkTextureDownloader; cdecl; external libgtk4;
function gdk_texture_downloader_copy(self: PGdkTextureDownloader): PGdkTextureDownloader; cdecl; external libgtk4;
procedure gdk_texture_downloader_free(self: PGdkTextureDownloader); cdecl; external libgtk4;
procedure gdk_texture_downloader_set_texture(self: PGdkTextureDownloader; texture: PGdkTexture); cdecl; external libgtk4;
function gdk_texture_downloader_get_texture(self: PGdkTextureDownloader): PGdkTexture; cdecl; external libgtk4;
procedure gdk_texture_downloader_set_format(self: PGdkTextureDownloader; format: TGdkMemoryFormat); cdecl; external libgtk4;
function gdk_texture_downloader_get_format(self: PGdkTextureDownloader): TGdkMemoryFormat; cdecl; external libgtk4;
procedure gdk_texture_downloader_set_color_state(self: PGdkTextureDownloader; color_state: PGdkColorState); cdecl; external libgtk4;
function gdk_texture_downloader_get_color_state(self: PGdkTextureDownloader): PGdkColorState; cdecl; external libgtk4;
procedure gdk_texture_downloader_download_into(self: PGdkTextureDownloader; data: Pguchar; stride: Tgsize); cdecl; external libgtk4;
function gdk_texture_downloader_download_bytes(self: PGdkTextureDownloader; out_stride: Pgsize): PGBytes; cdecl; external libgtk4;
function gdk_texture_downloader_download_bytes_with_planes(self: PGdkTextureDownloader; out_offsets: Pgsize; out_strides: Pgsize): PGBytes; cdecl; external libgtk4;

// === Konventiert am: 2-7-26 19:29:41 ===

function GDK_TYPE_TEXTURE_DOWNLOADER: TGType;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GDK_TYPE_TEXTURE_DOWNLOADER: TGType;
begin
  GDK_TYPE_TEXTURE_DOWNLOADER := gdk_texture_downloader_get_type;
end;



{$ENDIF read_implementation}
