unit fp_ethumb_client;

interface

uses
  efl, fp_eina, fp_ethumb;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  __ETHUMB_CLIENT_H__ = 1;

type
  TEthumb_Client = record
  end;
  PEthumb_Client = ^TEthumb_Client;

  TEthumb_Exists = record
  end;
  PEthumb_Exists = ^TEthumb_Exists;

  TEthumb_Client_Connect_Cb = procedure(data: pointer; client: PEthumb_Client; success: TEina_Bool); cdecl;
  TEthumb_Client_Die_Cb = procedure(data: pointer; client: PEthumb_Client); cdecl;
  TEthumb_Client_Generate_Cb = procedure(data: pointer; client: PEthumb_Client; id: longint; file_: pchar; key: pchar; thumb_path: pchar; thumb_key: pchar; success: TEina_Bool); cdecl;
  TEthumb_Client_Thumb_Exists_Cb = procedure(data: pointer; client: PEthumb_Client; thread: PEthumb_Exists; exists: TEina_Bool); cdecl;
  TEthumb_Client_Generate_Cancel_Cb = procedure(data: pointer; success: TEina_Bool); cdecl;

function ethumb_client_init: longint; cdecl; external libethumb_client;
function ethumb_client_shutdown: longint; cdecl; external libethumb_client;
function ethumb_client_connect(connect_cb: TEthumb_Client_Connect_Cb; data: pointer; free_data: TEina_Free_Cb): PEthumb_Client; cdecl; external libethumb_client;
procedure ethumb_client_disconnect(client: PEthumb_Client); cdecl; external libethumb_client;
procedure ethumb_client_on_server_die_callback_set(client: PEthumb_Client; server_die_cb: TEthumb_Client_Die_Cb; data: pointer; free_data: TEina_Free_Cb); cdecl; external libethumb_client;
procedure ethumb_client_fdo_set(client: PEthumb_Client; s: TEthumb_Thumb_FDO_Size); cdecl; external libethumb_client;
procedure ethumb_client_size_set(client: PEthumb_Client; tw: longint; th: longint); cdecl; external libethumb_client;
procedure ethumb_client_size_get(client: PEthumb_Client; tw: Plongint; th: Plongint); cdecl; external libethumb_client;
procedure ethumb_client_format_set(client: PEthumb_Client; f: TEthumb_Thumb_Format); cdecl; external libethumb_client;
function ethumb_client_format_get(client: PEthumb_Client): TEthumb_Thumb_Format; cdecl; external libethumb_client;
procedure ethumb_client_aspect_set(client: PEthumb_Client; a: TEthumb_Thumb_Aspect); cdecl; external libethumb_client;
function ethumb_client_aspect_get(client: PEthumb_Client): TEthumb_Thumb_Aspect; cdecl; external libethumb_client;
procedure ethumb_client_orientation_set(client: PEthumb_Client; o: TEthumb_Thumb_Orientation); cdecl; external libethumb_client;
function ethumb_client_orientation_get(client: PEthumb_Client): TEthumb_Thumb_Orientation; cdecl; external libethumb_client;
procedure ethumb_client_crop_align_set(client: PEthumb_Client; x: single; y: single); cdecl; external libethumb_client;
procedure ethumb_client_crop_align_get(client: PEthumb_Client; x: Psingle; y: Psingle); cdecl; external libethumb_client;
procedure ethumb_client_quality_set(client: PEthumb_Client; quality: longint); cdecl; external libethumb_client;
function ethumb_client_quality_get(client: PEthumb_Client): longint; cdecl; external libethumb_client;
procedure ethumb_client_compress_set(client: PEthumb_Client; compress: longint); cdecl; external libethumb_client;
function ethumb_client_compress_get(client: PEthumb_Client): longint; cdecl; external libethumb_client;
function ethumb_client_frame_set(client: PEthumb_Client; file_: pchar; group: pchar; swallow: pchar): TEina_Bool; cdecl; external libethumb_client;
procedure ethumb_client_dir_path_set(client: PEthumb_Client; path: pchar); cdecl; external libethumb_client;
function ethumb_client_dir_path_get(client: PEthumb_Client): pchar; cdecl; external libethumb_client;
procedure ethumb_client_category_set(client: PEthumb_Client; category: pchar); cdecl; external libethumb_client;
function ethumb_client_category_get(client: PEthumb_Client): pchar; cdecl; external libethumb_client;
procedure ethumb_client_video_time_set(client: PEthumb_Client; time: single); cdecl; external libethumb_client;
procedure ethumb_client_video_start_set(client: PEthumb_Client; start: single); cdecl; external libethumb_client;
procedure ethumb_client_video_interval_set(client: PEthumb_Client; interval: single); cdecl; external libethumb_client;
procedure ethumb_client_video_ntimes_set(client: PEthumb_Client; ntimes: dword); cdecl; external libethumb_client;
procedure ethumb_client_video_fps_set(client: PEthumb_Client; fps: dword); cdecl; external libethumb_client;
procedure ethumb_client_document_page_set(client: PEthumb_Client; page: dword); cdecl; external libethumb_client;
procedure ethumb_client_ethumb_setup(client: PEthumb_Client); cdecl; external libethumb_client;
procedure ethumb_client_thumb_path_set(client: PEthumb_Client; path: pchar; key: pchar); cdecl; external libethumb_client;
procedure ethumb_client_thumb_path_get(client: PEthumb_Client; path: PPchar; key: PPchar); cdecl; external libethumb_client;
function ethumb_client_file_set(client: PEthumb_Client; path: pchar; key: pchar): TEina_Bool; cdecl; external libethumb_client;
procedure ethumb_client_file_get(client: PEthumb_Client; path: PPchar; key: PPchar); cdecl; external libethumb_client;
procedure ethumb_client_file_free(client: PEthumb_Client); cdecl; external libethumb_client;
function ethumb_client_thumb_exists(client: PEthumb_Client; exists_cb: TEthumb_Client_Thumb_Exists_Cb; data: pointer): PEthumb_Exists; cdecl; external libethumb_client;
procedure ethumb_client_thumb_exists_cancel(exists: PEthumb_Exists); cdecl; external libethumb_client;
function ethumb_client_thumb_exists_check(exists: PEthumb_Exists): TEina_Bool; cdecl; external libethumb_client;
function ethumb_client_generate(client: PEthumb_Client; generated_cb: TEthumb_Client_Generate_Cb; data: pointer; free_data: TEina_Free_Cb): longint; cdecl; external libethumb_client;
procedure ethumb_client_generate_cancel(client: PEthumb_Client; id: longint; cancel_cb: TEthumb_Client_Generate_Cancel_Cb; data: pointer; free_data: TEina_Free_Cb); cdecl; external libethumb_client;
procedure ethumb_client_generate_cancel_all(client: PEthumb_Client); cdecl; external libethumb_client;

type
  TEthumb_Client_Async_Done_Cb = procedure(ethumbd: PEthumb_Client; thumb_path: pchar; thumb_key: pchar; data: pointer); cdecl;
  TEthumb_Client_Async_Error_Cb = procedure(ethumbd: PEthumb_Client; data: pointer); cdecl;

  TEthumb_Client_Async = record
  end;
  PEthumb_Client_Async = ^TEthumb_Client_Async;

function ethumb_client_thumb_async_get(client: PEthumb_Client; done: TEthumb_Client_Async_Done_Cb; error: TEthumb_Client_Async_Error_Cb; data: pointer): PEthumb_Client_Async; cdecl; external libethumb_client;
procedure ethumb_client_thumb_async_cancel(client: PEthumb_Client; request: PEthumb_Client_Async); cdecl; external libethumb_client;

// === Konventiert am: 15-6-25 13:26:14 ===


implementation



end.
