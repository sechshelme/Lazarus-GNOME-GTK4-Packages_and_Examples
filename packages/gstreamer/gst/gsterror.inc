/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 20-09-2024   15:33                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  PGstCoreError = ^TGstCoreError;
  TGstCoreError = longint;

const
  GST_CORE_ERROR_FAILED = 1;
  GST_CORE_ERROR_TOO_LAZY = 2;
  GST_CORE_ERROR_NOT_IMPLEMENTED = 3;
  GST_CORE_ERROR_STATE_CHANGE = 4;
  GST_CORE_ERROR_PAD = 5;
  GST_CORE_ERROR_THREAD = 6;
  GST_CORE_ERROR_NEGOTIATION = 7;
  GST_CORE_ERROR_EVENT = 8;
  GST_CORE_ERROR_SEEK = 9;
  GST_CORE_ERROR_CAPS = 10;
  GST_CORE_ERROR_TAG = 11;
  GST_CORE_ERROR_MISSING_PLUGIN = 12;
  GST_CORE_ERROR_CLOCK = 13;
  GST_CORE_ERROR_DISABLED = 14;
  GST_CORE_ERROR_NUM_ERRORS = 15;

type
  PGstLibraryError = ^TGstLibraryError;
  TGstLibraryError = longint;

const
  GST_LIBRARY_ERROR_FAILED = 1;
  GST_LIBRARY_ERROR_TOO_LAZY = 2;
  GST_LIBRARY_ERROR_INIT = 3;
  GST_LIBRARY_ERROR_SHUTDOWN = 4;
  GST_LIBRARY_ERROR_SETTINGS = 5;
  GST_LIBRARY_ERROR_ENCODE = 6;
  GST_LIBRARY_ERROR_NUM_ERRORS = 7;

type
  PGstResourceError = ^TGstResourceError;
  TGstResourceError = longint;

const
  GST_RESOURCE_ERROR_FAILED = 1;
  GST_RESOURCE_ERROR_TOO_LAZY = 2;
  GST_RESOURCE_ERROR_NOT_FOUND = 3;
  GST_RESOURCE_ERROR_BUSY = 4;
  GST_RESOURCE_ERROR_OPEN_READ = 5;
  GST_RESOURCE_ERROR_OPEN_WRITE = 6;
  GST_RESOURCE_ERROR_OPEN_READ_WRITE = 7;
  GST_RESOURCE_ERROR_CLOSE = 8;
  GST_RESOURCE_ERROR_READ = 9;
  GST_RESOURCE_ERROR_WRITE = 10;
  GST_RESOURCE_ERROR_SEEK = 11;
  GST_RESOURCE_ERROR_SYNC = 12;
  GST_RESOURCE_ERROR_SETTINGS = 13;
  GST_RESOURCE_ERROR_NO_SPACE_LEFT = 14;
  GST_RESOURCE_ERROR_NOT_AUTHORIZED = 15;
  GST_RESOURCE_ERROR_NUM_ERRORS = 16;

type
  PGstStreamError = ^TGstStreamError;
  TGstStreamError = longint;

const
  GST_STREAM_ERROR_FAILED = 1;
  GST_STREAM_ERROR_TOO_LAZY = 2;
  GST_STREAM_ERROR_NOT_IMPLEMENTED = 3;
  GST_STREAM_ERROR_TYPE_NOT_FOUND = 4;
  GST_STREAM_ERROR_WRONG_TYPE = 5;
  GST_STREAM_ERROR_CODEC_NOT_FOUND = 6;
  GST_STREAM_ERROR_DECODE = 7;
  GST_STREAM_ERROR_ENCODE = 8;
  GST_STREAM_ERROR_DEMUX = 9;
  GST_STREAM_ERROR_MUX = 10;
  GST_STREAM_ERROR_FORMAT = 11;
  GST_STREAM_ERROR_DECRYPT = 12;
  GST_STREAM_ERROR_DECRYPT_NOKEY = 13;
  GST_STREAM_ERROR_NUM_ERRORS = 14;

function gst_error_get_message(domain: TGQuark; code: Tgint): Pgchar; cdecl; external libgstreamer;
function gst_stream_error_quark: TGQuark; cdecl; external libgstreamer;
function gst_core_error_quark: TGQuark; cdecl; external libgstreamer;
function gst_resource_error_quark: TGQuark; cdecl; external libgstreamer;
function gst_library_error_quark: TGQuark; cdecl; external libgstreamer;

function GST_LIBRARY_ERROR: TGQuark;
function GST_RESOURCE_ERROR: TGQuark;
function GST_CORE_ERROR: TGQuark;
function GST_STREAM_ERROR: TGQuark;

// === Konventiert am: 16-9-24 17:43:16 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_LIBRARY_ERROR: TGQuark;
begin
  GST_LIBRARY_ERROR := gst_library_error_quark;
end;

function GST_RESOURCE_ERROR: TGQuark;
begin
  GST_RESOURCE_ERROR := gst_resource_error_quark;
end;

function GST_CORE_ERROR: TGQuark;
begin
  GST_CORE_ERROR := gst_core_error_quark;
end;

function GST_STREAM_ERROR: TGQuark;
begin
  GST_STREAM_ERROR := gst_stream_error_quark;
end;


{$ENDIF read_implementation}
