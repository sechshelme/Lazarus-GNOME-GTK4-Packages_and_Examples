unit fp_crypt;

interface

const
  {$IFDEF Linux}
  libcrypt = 'crypt';
  {$ENDIF}

  {$IFDEF Windows}
  libcrypt = 'libcrypt.dll';  // ?????????
  {$ENDIF}

type
  {$IFDEF Linux}
  Tculong = uint64;
  Tclong = int64;
  {$ENDIF}
  {$IFDEF windows}
  Tculong = uint32;
  Tclong = int64;
  {$ENDIF}
  Pculong = ^Tculong;
  Pclong = ^Tclong;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  CRYPT_OUTPUT_SIZE = 384;
  CRYPT_MAX_PASSPHRASE_SIZE = 512;
  CRYPT_GENSALT_OUTPUT_SIZE = 192;

function crypt(__phrase: pchar; __setting: pchar): pchar; cdecl; external libcrypt;

const
  CRYPT_DATA_RESERVED_SIZE = 767;
  CRYPT_DATA_INTERNAL_SIZE = 30720;

type
  Tcrypt_data = record
    output: array[0..(CRYPT_OUTPUT_SIZE) - 1] of char;
    setting: array[0..(CRYPT_OUTPUT_SIZE) - 1] of char;
    input: array[0..(CRYPT_MAX_PASSPHRASE_SIZE) - 1] of char;
    reserved: array[0..(CRYPT_DATA_RESERVED_SIZE) - 1] of char;
    initialized: char;
    internal: array[0..(CRYPT_DATA_INTERNAL_SIZE) - 1] of char;
  end;
  Pcrypt_data = ^Tcrypt_data;

function crypt_r(phrase: pchar; setting: pchar; data: Pcrypt_data): pchar; cdecl; external libcrypt;
function crypt_rn(phrase: pchar; setting: pchar; data: pointer; size: longint): pchar; cdecl; external libcrypt;
function crypt_ra(phrase: pchar; setting: pchar; data: Ppointer; size: Plongint): pchar; cdecl; external libcrypt;
function crypt_gensalt(prefix: pchar; count: Tculong; rbytes: pchar; nrbytes: longint): pchar; cdecl; external libcrypt;
function crypt_gensalt_rn(prefix: pchar; count: Tculong; rbytes: pchar; nrbytes: longint; output: pchar; output_size: longint): pchar; cdecl; external libcrypt;
function crypt_gensalt_r(prefix: pchar; count: Tculong; rbytes: pchar; nrbytes: longint; output: pchar; output_size: longint): pchar; cdecl; external libcrypt name 'crypt_gensalt_rn';

function crypt_gensalt_ra(prefix: pchar; count: Tculong; rbytes: pchar; nrbytes: longint): pchar; cdecl; external libcrypt;
function crypt_checksalt(setting: pchar): longint; cdecl; external libcrypt;

const
  CRYPT_SALT_OK = 0;
  CRYPT_SALT_INVALID = 1;
  CRYPT_SALT_METHOD_DISABLED = 2;
  CRYPT_SALT_METHOD_LEGACY = 3;
  CRYPT_SALT_TOO_CHEAP = 4;

function crypt_preferred_method: pchar; cdecl; external libcrypt;

const
  CRYPT_GENSALT_IMPLEMENTS_DEFAULT_PREFIX = 1;
  CRYPT_GENSALT_IMPLEMENTS_AUTO_ENTROPY = 1;
  CRYPT_CHECKSALT_AVAILABLE = 1;
  CRYPT_PREFERRED_METHOD_AVAILABLE = 1;
  XCRYPT_VERSION_MAJOR = 4;
  XCRYPT_VERSION_MINOR = 4;
  XCRYPT_VERSION_NUM = (XCRYPT_VERSION_MAJOR shl 16) or XCRYPT_VERSION_MINOR;
  XCRYPT_VERSION_STR = '4.4.36';

  // === Konventiert am: 18-11-25 17:14:08 ===


implementation



end.
