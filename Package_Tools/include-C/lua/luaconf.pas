unit luaconf;

interface

uses
  fp_lua;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  LUA_PATH = 'LUA_PATH';
  LUA_CPATH = 'LUA_CPATH';
  LUA_INIT = 'LUA_INIT';

  {$ifdef windows}
  LUA_DIRSEP = '\\';
  {$else}
  LUA_DIRSEP = '/';
  {$endif}

  LUA_PATHSEP = ';';
  LUA_PATH_MARK = '?';
  LUA_EXECDIR = '!';
  LUA_IGMARK = '-';

type
  TLUA_INTEGER_ = Tptrdiff_t;

const
  LUA_IDSIZE = 60;

  LUA_PROMPT = '> ';
  LUA_PROMPT2 = '>> ';
  LUA_PROGNAME = 'lua';
  LUA_MAXINPUT = 512;
  LUAI_GCPAUSE = 200;
  LUAI_GCMUL = 200;
  LUA_COMPAT_LSTR = 1;

const
  LUAI_BITSINT = 32;

type
  TLUAI_UINT32 = uint32;
  TLUAI_INT32 = int32;

const
  LUAI_MAXINT32 = MaxInt;

type
  TLUAI_UMEM = Tsize_t;
  TLUAI_MEM = Tptrdiff_t;

const
  LUAI_MAXCALLS = 20000;
  LUAI_MAXCSTACK = 8000;
  LUAI_MAXCCALLS = 200;
  LUAI_MAXVARS = 200;
  LUAI_MAXUPVALUES = 60;
  LUAL_BUFFERSIZE = 8192;

type
  TLUA_NUMBER_ = double;
  TLUAI_UACNUMBER = double;

const
  LUA_NUMBER_SCAN = '%lf';
  LUA_NUMBER_FMT = '%.14g';

type
  Tluai_Cast = record
    case longint of
      0: (l_d: double);
      1: (l_l: longint);
  end;
  Pluai_Cast = ^Tluai_Cast;

const
  LUA_MAXCAPTURES = 32;
  LUAI_EXTRASPACE = 0;
  LUA_INTFRMLEN = 'll';

type
  TLUA_INTFRM_T = int64;

implementation


end.
