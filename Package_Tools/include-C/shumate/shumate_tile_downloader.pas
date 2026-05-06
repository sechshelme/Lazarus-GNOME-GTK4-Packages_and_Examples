unit shumate_tile_downloader;

interface

uses
  fp_GTK4, fp_glib2, fp_shumate, shumate_data_source;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TShumateTileDownloader = record
  end;
  PShumateTileDownloader = ^TShumateTileDownloader;

  TShumateTileDownloaderClass = record
    parent_class: TShumateDataSourceClass;
  end;
  PShumateTileDownloaderClass = ^TShumateTileDownloaderClass;

function shumate_tile_downloader_get_type: TGType; cdecl; external libshumate;
function shumate_tile_downloader_new(url_template: pchar): PShumateTileDownloader; cdecl; external libshumate;
function shumate_tile_downloader_error_quark: TGQuark; cdecl; external libshumate;

type
  PShumateTileDownloaderError = ^TShumateTileDownloaderError;
  TShumateTileDownloaderError = longint;

const
  SHUMATE_TILE_DOWNLOADER_ERROR_FAILED = 0;
  SHUMATE_TILE_DOWNLOADER_ERROR_BAD_RESPONSE = 1;
  SHUMATE_TILE_DOWNLOADER_ERROR_COULD_NOT_CONNECT = 2;
  SHUMATE_TILE_DOWNLOADER_ERROR_MALFORMED_URL = 3;
  SHUMATE_TILE_DOWNLOADER_ERROR_OFFLINE = 4;

  // === Konventiert am: 6-5-26 15:48:20 ===

function SHUMATE_TILE_DOWNLOADER_ERROR: TGQuark;

function SHUMATE_TYPE_TILE_DOWNLOADER: TGType;
function SHUMATE_TILE_DOWNLOADER(obj: Pointer): PShumateTileDownloader;
function SHUMATE_IS_TILE_DOWNLOADER(obj: Pointer): Tgboolean;

implementation

function SHUMATE_TYPE_TILE_DOWNLOADER: TGType;
begin
  Result := shumate_tile_downloader_get_type;
end;

function SHUMATE_TILE_DOWNLOADER(obj: Pointer): PShumateTileDownloader;
begin
  Result := PShumateTileDownloader(g_type_check_instance_cast(obj, SHUMATE_TYPE_TILE_DOWNLOADER));
end;

function SHUMATE_IS_TILE_DOWNLOADER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, SHUMATE_TYPE_TILE_DOWNLOADER);
end;


function SHUMATE_TILE_DOWNLOADER_ERROR: TGQuark;
begin
  SHUMATE_TILE_DOWNLOADER_ERROR := shumate_tile_downloader_error_quark;
end;


end.
