
unit Ethumb_Client;
interface

{
  Automatically converted by H2Pas 1.0.0 from Ethumb_Client.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    Ethumb_Client.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
Pchar  = ^char;
PEthumb_Client  = ^Ethumb_Client;
PEthumb_Client_Async  = ^Ethumb_Client_Async;
PEthumb_Exists  = ^Ethumb_Exists;
Plongint  = ^longint;
Psingle  = ^single;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef __ETHUMB_CLIENT_H__}

const
  __ETHUMB_CLIENT_H__ = 1;  
{$include <Ethumb.h>}
{$ifdef extern}
{$undef extern}
{$endif}
{ C++ extern C conditionnal removed }
{*
 * @defgroup Ethumb_Client Ethumb Client
 * @ingroup Ethumb
 *
 * @
  }
{*
 * @defgroup Ethumb_Client_Basics Ethumb Client Basics
 *
 * Functions that all users must know of to use Ethumb_Client.
 *
 * @
  }
{*
 * @brief client handle.
 *
 * The client handle is created by ethumb_client_connect() and
 * destroyed by ethumb_client_disconnect(). The connection and
 * requests are asynchronous and callbacks should be used to report
 * both success and failure of calls.
  }
type
{*
 * @brief client exists request handle.
 *
 * The exists request handle is created by ethumb_client_thumb_exists(),
 * automatically destroyed when it end and cancelled when requested by
 * ethumb_client_thumb_exists_cancel().
  }
{*
 * @brief reports results of ethumb_client_connect()
 *
 * @param data extra context given to ethumb_client_connect().
 * @param client handle of the current connection to server.
 * @param success @c EINA_TRUE if connected or @c EINA_FALSE if it was
 *        not possible.
  }

  TEthumb_Client_Connect_Cb = procedure (data:pointer; client:PEthumb_Client; success:TEina_Bool);cdecl;
{*
 * @brief reports server connection ended.
 *
 * Functions of this type may be called if they are set with
 * ethumb_client_on_server_die_callback_set().
 *
 * @param data extra context given to ethumb_client_on_server_die_callback_set().
 * @param client handle of the current connection to server.
  }

  TEthumb_Client_Die_Cb = procedure (data:pointer; client:PEthumb_Client);cdecl;
{*
 * @brief reports results of ethumb_client_generate().
 *
 * @param data extra context given to ethumb_client_generate().
 * @param client handle of the current connection to server.
 * @param id identifier returned by ethumb_client_generate().
 * @param file path set with ethumb_client_file_set().
 * @param key value set with ethumb_client_file_set() or @c NULL.
 * @param thumb_path where thumbnail was stored, either set with
 *        ethumb_client_thumb_path_set() or automatically calculated
 *        using parameters.
 * @param thumb_key key inside thumb_path where thumbnail was stored or @c NULL.
 * @param success @c EINA_TRUE if generated or @c EINA_FALSE on errors.
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)

  TEthumb_Client_Generate_Cb = procedure (data:pointer; client:PEthumb_Client; id:longint; file:Pchar; key:Pchar; 
                thumb_path:Pchar; thumb_key:Pchar; success:TEina_Bool);cdecl;
{*
 * @brief report results of ethumb_client_thumb_exists().
 *
 * @param client handle of the current connection to server.
 * @param exists EINA_TRUE if the thumbnail exists.
 * @param data extra context given to ethumb_client_thumb_exists().
 *
 * During the execution of the callback the state of the @p client is
 * temporarily really restored to what it was when the call to
 * ethumb_client_thumb_exists() was done.
  }

  TEthumb_Client_Thumb_Exists_Cb = procedure (data:pointer; client:PEthumb_Client; thread:PEthumb_Exists; exists:TEina_Bool);cdecl;
{*
 * @brief reports results of ethumb_client_generate_cancel()
 *
 * @param data extra context given to ethumb_client_generate_cancel()
 * @param client handle of the current connection to server.
  }

  TEthumb_Client_Generate_Cancel_Cb = procedure (data:pointer; success:TEina_Bool);cdecl;

function ethumb_client_init:longint;cdecl;external;
function ethumb_client_shutdown:longint;cdecl;external;
(* Const before type ignored *)
function ethumb_client_connect(connect_cb:TEthumb_Client_Connect_Cb; data:pointer; free_data:TEina_Free_Cb):PEthumb_Client;cdecl;external;
procedure ethumb_client_disconnect(client:PEthumb_Client);cdecl;external;
(* Const before type ignored *)
procedure ethumb_client_on_server_die_callback_set(client:PEthumb_Client; server_die_cb:TEthumb_Client_Die_Cb; data:pointer; free_data:TEina_Free_Cb);cdecl;external;
{*
 * @
  }
{*
 * @defgroup Ethumb_Client_Setup Ethumb Client Fine Tune Setup
 *
 * How to fine tune thumbnail generation, setting size, aspect, orientation,
 * frames, quality and so on.
 *
 * @
  }
procedure ethumb_client_fdo_set(client:PEthumb_Client; s:TEthumb_Thumb_FDO_Size);cdecl;external;
procedure ethumb_client_size_set(client:PEthumb_Client; tw:longint; th:longint);cdecl;external;
(* Const before type ignored *)
procedure ethumb_client_size_get(client:PEthumb_Client; tw:Plongint; th:Plongint);cdecl;external;
procedure ethumb_client_format_set(client:PEthumb_Client; f:TEthumb_Thumb_Format);cdecl;external;
(* Const before type ignored *)
function ethumb_client_format_get(client:PEthumb_Client):TEthumb_Thumb_Format;cdecl;external;
procedure ethumb_client_aspect_set(client:PEthumb_Client; a:TEthumb_Thumb_Aspect);cdecl;external;
(* Const before type ignored *)
function ethumb_client_aspect_get(client:PEthumb_Client):TEthumb_Thumb_Aspect;cdecl;external;
procedure ethumb_client_orientation_set(client:PEthumb_Client; o:TEthumb_Thumb_Orientation);cdecl;external;
(* Const before type ignored *)
function ethumb_client_orientation_get(client:PEthumb_Client):TEthumb_Thumb_Orientation;cdecl;external;
procedure ethumb_client_crop_align_set(client:PEthumb_Client; x:single; y:single);cdecl;external;
(* Const before type ignored *)
procedure ethumb_client_crop_align_get(client:PEthumb_Client; x:Psingle; y:Psingle);cdecl;external;
procedure ethumb_client_quality_set(client:PEthumb_Client; quality:longint);cdecl;external;
(* Const before type ignored *)
function ethumb_client_quality_get(client:PEthumb_Client):longint;cdecl;external;
procedure ethumb_client_compress_set(client:PEthumb_Client; compress:longint);cdecl;external;
(* Const before type ignored *)
function ethumb_client_compress_get(client:PEthumb_Client):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function ethumb_client_frame_set(client:PEthumb_Client; file:Pchar; group:Pchar; swallow:Pchar):TEina_Bool;cdecl;external;
(* Const before type ignored *)
procedure ethumb_client_dir_path_set(client:PEthumb_Client; path:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function ethumb_client_dir_path_get(client:PEthumb_Client):Pchar;cdecl;external;
(* Const before type ignored *)
procedure ethumb_client_category_set(client:PEthumb_Client; category:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function ethumb_client_category_get(client:PEthumb_Client):Pchar;cdecl;external;
procedure ethumb_client_video_time_set(client:PEthumb_Client; time:single);cdecl;external;
procedure ethumb_client_video_start_set(client:PEthumb_Client; start:single);cdecl;external;
procedure ethumb_client_video_interval_set(client:PEthumb_Client; interval:single);cdecl;external;
procedure ethumb_client_video_ntimes_set(client:PEthumb_Client; ntimes:dword);cdecl;external;
procedure ethumb_client_video_fps_set(client:PEthumb_Client; fps:dword);cdecl;external;
procedure ethumb_client_document_page_set(client:PEthumb_Client; page:dword);cdecl;external;
procedure ethumb_client_ethumb_setup(client:PEthumb_Client);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure ethumb_client_thumb_path_set(client:PEthumb_Client; path:Pchar; key:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure ethumb_client_thumb_path_get(client:PEthumb_Client; path:PPchar; key:PPchar);cdecl;external;
{*
 * @
  }
{*
 * @addtogroup Ethumb_Client_Basics Ethumb Client Basics
 * @
  }
(* Const before type ignored *)
(* Const before type ignored *)
function ethumb_client_file_set(client:PEthumb_Client; path:Pchar; key:Pchar):TEina_Bool;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure ethumb_client_file_get(client:PEthumb_Client; path:PPchar; key:PPchar);cdecl;external;
procedure ethumb_client_file_free(client:PEthumb_Client);cdecl;external;
(* Const before type ignored *)
function ethumb_client_thumb_exists(client:PEthumb_Client; exists_cb:TEthumb_Client_Thumb_Exists_Cb; data:pointer):PEthumb_Exists;cdecl;external;
procedure ethumb_client_thumb_exists_cancel(exists:PEthumb_Exists);cdecl;external;
function ethumb_client_thumb_exists_check(exists:PEthumb_Exists):TEina_Bool;cdecl;external;
(* Const before type ignored *)
function ethumb_client_generate(client:PEthumb_Client; generated_cb:TEthumb_Client_Generate_Cb; data:pointer; free_data:TEina_Free_Cb):longint;cdecl;external;
(* Const before type ignored *)
procedure ethumb_client_generate_cancel(client:PEthumb_Client; id:longint; cancel_cb:TEthumb_Client_Generate_Cancel_Cb; data:pointer; free_data:TEina_Free_Cb);cdecl;external;
procedure ethumb_client_generate_cancel_all(client:PEthumb_Client);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
type

  TEthumb_Client_Async_Done_Cb = procedure (ethumbd:PEthumb_Client; thumb_path:Pchar; thumb_key:Pchar; data:pointer);cdecl;

  TEthumb_Client_Async_Error_Cb = procedure (ethumbd:PEthumb_Client; data:pointer);cdecl;
(* Const before type ignored *)

function ethumb_client_thumb_async_get(client:PEthumb_Client; done:TEthumb_Client_Async_Done_Cb; error:TEthumb_Client_Async_Error_Cb; data:pointer):PEthumb_Client_Async;cdecl;external;
procedure ethumb_client_thumb_async_cancel(client:PEthumb_Client; request:PEthumb_Client_Async);cdecl;external;

implementation


end.
