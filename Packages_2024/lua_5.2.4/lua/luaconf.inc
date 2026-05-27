{$IFDEF read_interface}


const
  {$ifdef windows}
  LUA_DIRSEP = '\\';
  {$else}
  LUA_DIRSEP = '/';
  {$endif}

  LUA_ENV = '_ENV';
  LUA_IDSIZE = 60;
  LUAI_MAXSHORTLEN = 40;

  LUAI_BITSINT = 32;

type
  TLUA_INT32 = int32;
  TLUAI_UMEM = Tsize_t;
  TLUAI_MEM = Tptrdiff_t;

const
  LUAI_MAXSTACK = 1000000;

const
  LUAI_FIRSTPSEUDOIDX = (-(LUAI_MAXSTACK)) - 1000;
  LUAL_BUFFERSIZE = 8192;

type
  TLUA_NUMBER_ = double;
  TLUAI_UACNUMBER = double;

const
  LUA_NUMBER_SCAN = '%lf';
  LUA_NUMBER_FMT = '%.14g';
  LUAI_MAXNUMBER2STR = 32;

type
  TLUA_INTEGER_ = Tptrdiff_t;


  // === Konventiert am: 27-5-26 19:27:02 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ENDIF read_implementation}
