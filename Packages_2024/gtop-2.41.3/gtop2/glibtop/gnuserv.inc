{$IFDEF read_interface}



const
  PATCHLEVEL = 2;

const
  MCOOKIE_NAME = 'MAGIC-1';
  MCOOKIE_X_NAME = 'MIT-MAGIC-COOKIE-1';
  DEFAUTH_NAME = 'GNU-SECURE';
  AUTH_TIMEOUT = 15;
  AUTH_NAMESZ = 15;

const
  TABLE_SIZE = 101;

const
  DEFAULT_PORT = 21490;

const
  HOSTNAMSZ = 255;
  REPLYSIZ = 300;

const
  _NFILE = 20;

const
  EOT_STR = '\004';
  EOT_CHR = '\004';
  CONN_UNIX = 0;
  CONN_INTERNET = 1;
  CONN_IPC = 2;

function glibtop_make_connection(hostarg: pchar; portarg: longint; s: Plongint): longint; cdecl; external libgtop2;
function glibtop_internet_addr(host: pchar): longint; cdecl; external libgtop2;

// === Konventiert am: 26-10-25 12:05:23 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ENDIF read_implementation}
