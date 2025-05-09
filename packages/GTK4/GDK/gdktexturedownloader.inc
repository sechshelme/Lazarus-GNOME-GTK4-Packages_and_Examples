
{$IFDEF read_interface}

type
  TGdkTextureDownloader = record
  end;
  PGdkTextureDownloader = ^TGdkTextureDownloader;

function gdk_texture_downloader_get_type: TGType; cdecl; external libgtk4;
function gdk_texture_downloader_new(texture: PGdkTexture): PGdkTextureDownloader; cdecl; external libgtk4;
function gdk_texture_downloader_copy(self: PGdkTextureDownloader): PGdkTextureDownloader; cdecl; external libgtk4;
procedure gdk_texture_downloader_free(self: PGdkTextureDownloader); cdecl; external libgtk4;
procedure gdk_texture_downloader_set_texture(self: PGdkTextureDownloader; texture: PGdkTexture); cdecl; external libgtk4;
function gdk_texture_downloader_get_texture(self: PGdkTextureDownloader): PGdkTexture; cdecl; external libgtk4;
procedure gdk_texture_downloader_set_format(self: PGdkTextureDownloader; format: TGdkMemoryFormat); cdecl; external libgtk4;
function gdk_texture_downloader_get_format(self: PGdkTextureDownloader): TGdkMemoryFormat; cdecl; external libgtk4;
procedure gdk_texture_downloader_download_into(self: PGdkTextureDownloader; Data: Pguchar; stride: Tgsize); cdecl; external libgtk4;
function gdk_texture_downloader_download_bytes(self: PGdkTextureDownloader; out_stride: Pgsize): PGBytes; cdecl; external libgtk4;

// === Konventiert am: 2-8-24 14:38:43 ===

function GDK_TYPE_TEXTURE_DOWNLOADER: TGType;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GDK_TYPE_TEXTURE_DOWNLOADER: TGType;
begin
  GDK_TYPE_TEXTURE_DOWNLOADER := gdk_texture_downloader_get_type;
end;



{$ENDIF read_implementation}
