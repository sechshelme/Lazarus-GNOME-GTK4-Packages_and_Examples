unit fp_canberra;

interface


const
  {$IFDEF linux}
  libcanberra = 'libcanberra';
  {$ENDIF}

  {$IFDEF windows}
  {$ENDIF}

type
  Tsize_t = SizeUInt;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



const
  CA_MAJOR = 0;
  CA_MINOR = 30;

function CA_CHECK_VERSION(major, minor: integer): boolean; inline;

const
  CA_PROP_MEDIA_NAME = 'media.name';
  CA_PROP_MEDIA_TITLE = 'media.title';
  CA_PROP_MEDIA_ARTIST = 'media.artist';
  CA_PROP_MEDIA_LANGUAGE = 'media.language';
  CA_PROP_MEDIA_FILENAME = 'media.filename';
  CA_PROP_MEDIA_ICON = 'media.icon';
  CA_PROP_MEDIA_ICON_NAME = 'media.icon_name';
  CA_PROP_MEDIA_ROLE = 'media.role';
  CA_PROP_EVENT_ID = 'event.id';
  CA_PROP_EVENT_DESCRIPTION = 'event.description';
  CA_PROP_EVENT_MOUSE_X = 'event.mouse.x';
  CA_PROP_EVENT_MOUSE_Y = 'event.mouse.y';
  CA_PROP_EVENT_MOUSE_HPOS = 'event.mouse.hpos';
  CA_PROP_EVENT_MOUSE_VPOS = 'event.mouse.vpos';
  CA_PROP_EVENT_MOUSE_BUTTON = 'event.mouse.button';
  CA_PROP_WINDOW_NAME = 'window.name';
  CA_PROP_WINDOW_ID = 'window.id';
  CA_PROP_WINDOW_ICON = 'window.icon';
  CA_PROP_WINDOW_ICON_NAME = 'window.icon_name';
  CA_PROP_WINDOW_X = 'window.x';
  CA_PROP_WINDOW_Y = 'window.y';
  CA_PROP_WINDOW_WIDTH = 'window.width';
  CA_PROP_WINDOW_HEIGHT = 'window.height';
  CA_PROP_WINDOW_HPOS = 'window.hpos';
  CA_PROP_WINDOW_VPOS = 'window.vpos';
  CA_PROP_WINDOW_DESKTOP = 'window.desktop';
  CA_PROP_WINDOW_X11_DISPLAY = 'window.x11.display';
  CA_PROP_WINDOW_X11_SCREEN = 'window.x11.screen';
  CA_PROP_WINDOW_X11_MONITOR = 'window.x11.monitor';
  CA_PROP_WINDOW_X11_XID = 'window.x11.xid';
  CA_PROP_APPLICATION_NAME = 'application.name';
  CA_PROP_APPLICATION_ID = 'application.id';
  CA_PROP_APPLICATION_VERSION = 'application.version';
  CA_PROP_APPLICATION_ICON = 'application.icon';
  CA_PROP_APPLICATION_ICON_NAME = 'application.icon_name';
  CA_PROP_APPLICATION_LANGUAGE = 'application.language';
  CA_PROP_APPLICATION_PROCESS_ID = 'application.process.id';
  CA_PROP_APPLICATION_PROCESS_BINARY = 'application.process.binary';
  CA_PROP_APPLICATION_PROCESS_USER = 'application.process.user';
  CA_PROP_APPLICATION_PROCESS_HOST = 'application.process.host';
  CA_PROP_CANBERRA_CACHE_CONTROL = 'canberra.cache-control';
  CA_PROP_CANBERRA_VOLUME = 'canberra.volume';
  CA_PROP_CANBERRA_XDG_THEME_NAME = 'canberra.xdg-theme.name';
  CA_PROP_CANBERRA_XDG_THEME_OUTPUT_PROFILE = 'canberra.xdg-theme.output-profile';
  CA_PROP_CANBERRA_ENABLE = 'canberra.enable';
  CA_PROP_CANBERRA_FORCE_CHANNEL = 'canberra.force_channel';

type
  Pca_proplist = type Pointer;
  PPca_proplist = ^Pca_proplist;
  Pca_context = type Pointer;
  PPca_context = ^Pca_context;

  Tca_finish_callback_t = procedure(c: Pca_context; id: uint32; error_code: longint; userdata: pointer); cdecl;

const
  CA_SUCCESS = 0;
  CA_ERROR_NOTSUPPORTED = -(1);
  CA_ERROR_INVALID = -(2);
  CA_ERROR_STATE = -(3);
  CA_ERROR_OOM = -(4);
  CA_ERROR_NODRIVER = -(5);
  CA_ERROR_SYSTEM = -(6);
  CA_ERROR_CORRUPT = -(7);
  CA_ERROR_TOOBIG = -(8);
  CA_ERROR_NOTFOUND = -(9);
  CA_ERROR_DESTROYED = -(10);
  CA_ERROR_CANCELED = -(11);
  CA_ERROR_NOTAVAILABLE = -(12);
  CA_ERROR_ACCESS = -(13);
  CA_ERROR_IO = -(14);
  CA_ERROR_INTERNAL = -(15);
  CA_ERROR_DISABLED = -(16);
  CA_ERROR_FORKED = -(17);
  CA_ERROR_DISCONNECTED = -(18);
  _CA_ERROR_MAX = -(19);

function ca_proplist_create(p: PPca_proplist): longint; cdecl; external libcanberra;
function ca_proplist_destroy(p: Pca_proplist): longint; cdecl; external libcanberra;
function ca_proplist_sets(p: Pca_proplist; key: pchar; value: pchar): longint; cdecl; external libcanberra;
function ca_proplist_setf(p: Pca_proplist; key: pchar; format: pchar): longint; cdecl; varargs; external libcanberra;
function ca_proplist_set(p: Pca_proplist; key: pchar; data: pointer; nbytes: Tsize_t): longint; cdecl; external libcanberra;
function ca_context_create(c: PPca_context): longint; cdecl; external libcanberra;
function ca_context_set_driver(c: Pca_context; driver: pchar): longint; cdecl; external libcanberra;
function ca_context_change_device(c: Pca_context; device: pchar): longint; cdecl; external libcanberra;
function ca_context_open(c: Pca_context): longint; cdecl; external libcanberra;
function ca_context_destroy(c: Pca_context): longint; cdecl; external libcanberra;
function ca_context_change_props(c: Pca_context): longint; cdecl; varargs; external libcanberra;
function ca_context_change_props_full(c: Pca_context; p: Pca_proplist): longint; cdecl; external libcanberra;
function ca_context_play_full(c: Pca_context; id: uint32; p: Pca_proplist; cb: Tca_finish_callback_t; userdata: pointer): longint; cdecl; external libcanberra;
function ca_context_play(c: Pca_context; id: uint32): longint; cdecl; varargs; external libcanberra;
function ca_context_cache_full(c: Pca_context; p: Pca_proplist): longint; cdecl; external libcanberra;
function ca_context_cache(c: Pca_context): longint; cdecl; varargs; external libcanberra;
function ca_context_cancel(c: Pca_context; id: uint32): longint; cdecl; external libcanberra;
function ca_context_playing(c: Pca_context; id: uint32; playing: Plongint): longint; cdecl; external libcanberra;
function ca_strerror(code: longint): pchar; cdecl; external libcanberra;

// === Konventiert am: 27-9-25 17:16:56 ===


implementation

function CA_CHECK_VERSION(major, minor: integer): boolean; inline;
begin
  Result := (CA_MAJOR > major) or ((CA_MAJOR = major) and (CA_MINOR >= minor));
end;



end.
