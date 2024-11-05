/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 12-10-2024   19:33                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  TGstUriDownloaderPrivate = record
  end;
  PGstUriDownloaderPrivate = ^TGstUriDownloaderPrivate;

  TGstUriDownloader = record
    parent: TGstObject;
    priv: PGstUriDownloaderPrivate;
  end;
  PGstUriDownloader = ^TGstUriDownloader;

  TGstUriDownloaderClass = record
    parent_class: TGstObjectClass;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstUriDownloaderClass = ^TGstUriDownloaderClass;


function gst_uri_downloader_get_type: TGType; cdecl; external libgsturidownloader;
function gst_uri_downloader_new: PGstUriDownloader; cdecl; external libgsturidownloader;
procedure gst_uri_downloader_set_parent(downloader: PGstUriDownloader; parent: PGstElement); cdecl; external libgsturidownloader;
function gst_uri_downloader_fetch_uri(downloader: PGstUriDownloader; uri: Pgchar; referer: Pgchar; compress: Tgboolean; refresh: Tgboolean;
  allow_cache: Tgboolean; err: PPGError): PGstFragment; cdecl; external libgsturidownloader;
function gst_uri_downloader_fetch_uri_with_range(downloader: PGstUriDownloader; uri: Pgchar; referer: Pgchar; compress: Tgboolean; refresh: Tgboolean;
  allow_cache: Tgboolean; range_start: Tgint64; range_end: Tgint64; err: PPGError): PGstFragment; cdecl; external libgsturidownloader;
procedure gst_uri_downloader_reset(downloader: PGstUriDownloader); cdecl; external libgsturidownloader;
procedure gst_uri_downloader_cancel(downloader: PGstUriDownloader); cdecl; external libgsturidownloader;

// === Konventiert am: 12-10-24 19:27:15 ===

function GST_TYPE_URI_DOWNLOADER: TGType;
function GST_URI_DOWNLOADER(obj: Pointer): PGstUriDownloader;
function GST_URI_DOWNLOADER_CLASS(klass: Pointer): PGstUriDownloaderClass;
function GST_IS_URI_DOWNLOADER(obj: Pointer): Tgboolean;
function GST_IS_URI_DOWNLOADER_CLASS(klass: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_URI_DOWNLOADER: TGType;
begin
  GST_TYPE_URI_DOWNLOADER := gst_uri_downloader_get_type;
end;

function GST_URI_DOWNLOADER(obj: Pointer): PGstUriDownloader;
begin
  Result := PGstUriDownloader(g_type_check_instance_cast(obj, GST_TYPE_URI_DOWNLOADER));
end;

function GST_URI_DOWNLOADER_CLASS(klass: Pointer): PGstUriDownloaderClass;
begin
  Result := PGstUriDownloaderClass(g_type_check_class_cast(klass, GST_TYPE_URI_DOWNLOADER));
end;

function GST_IS_URI_DOWNLOADER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_URI_DOWNLOADER);
end;

function GST_IS_URI_DOWNLOADER_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_URI_DOWNLOADER);
end;



{$ENDIF read_implementation}
