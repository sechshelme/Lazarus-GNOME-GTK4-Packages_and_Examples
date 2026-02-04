unit fp_zstd;

interface

const
  {$IFDEF Linux}
  libzstd = 'zstd';
  {$ENDIF}

  {$IFDEF Windows}
  libzstd = 'libzstd.dll';
  {$ENDIF}

type
  Tsize_t = SizeUInt;
  Psize_t = ^Tsize_t;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  ZSTD_VERSION_MAJOR = 1;
  ZSTD_VERSION_MINOR = 5;
  ZSTD_VERSION_RELEASE = 5;
  ZSTD_VERSION_NUMBER = ZSTD_VERSION_MAJOR * 100 * 100 + ZSTD_VERSION_MINOR * 100 + ZSTD_VERSION_RELEASE;

function ZSTD_versionNumber: dword; cdecl; external libzstd;
function ZSTD_versionString: pchar; cdecl; external libzstd;

const
  ZSTD_CLEVEL_DEFAULT = 3;

const
  ZSTD_MAGICNUMBER = $FD2FB528;
  ZSTD_MAGIC_DICTIONARY = $EC30A437;
  ZSTD_MAGIC_SKIPPABLE_START = $184D2A50;
  ZSTD_MAGIC_SKIPPABLE_MASK = $FFFFFFF0;
  ZSTD_BLOCKSIZELOG_MAX = 17;
  ZSTD_BLOCKSIZE_MAX = 1 shl ZSTD_BLOCKSIZELOG_MAX;

function ZSTD_compress(dst: pointer; dstCapacity: Tsize_t; src: pointer; srcSize: Tsize_t; compressionLevel: longint): Tsize_t; cdecl; external libzstd;
function ZSTD_decompress(dst: pointer; dstCapacity: Tsize_t; src: pointer; compressedSize: Tsize_t): Tsize_t; cdecl; external libzstd;

const
  ZSTD_CONTENTSIZE_UNKNOWN = 0 - 1;
  ZSTD_CONTENTSIZE_ERROR = 0 - 2;

function ZSTD_getFrameContentSize(src: pointer; srcSize: Tsize_t): qword; cdecl; external libzstd;
function ZSTD_getDecompressedSize(src: pointer; srcSize: Tsize_t): qword; cdecl; external libzstd; deprecated'Replaced by ZSTD_getFrameContentSize';
function ZSTD_findFrameCompressedSize(src: pointer; srcSize: Tsize_t): Tsize_t; cdecl; external libzstd;

const
  ZSTD_MAX_INPUT_SIZE = $FF00FF00FF00FF00;

function ZSTD_compressBound(srcSize: Tsize_t): Tsize_t; cdecl; external libzstd;
function ZSTD_isError(code: Tsize_t): dword; cdecl; external libzstd;
function ZSTD_getErrorName(code: Tsize_t): pchar; cdecl; external libzstd;
function ZSTD_minCLevel: longint; cdecl; external libzstd;
function ZSTD_maxCLevel: longint; cdecl; external libzstd;
function ZSTD_defaultCLevel: longint; cdecl; external libzstd;

type
  PZSTD_CCtx = type Pointer;

function ZSTD_createCCtx: PZSTD_CCtx; cdecl; external libzstd;
function ZSTD_freeCCtx(cctx: PZSTD_CCtx): Tsize_t; cdecl; external libzstd;
function ZSTD_compressCCtx(cctx: PZSTD_CCtx; dst: pointer; dstCapacity: Tsize_t; src: pointer; srcSize: Tsize_t;
  compressionLevel: longint): Tsize_t; cdecl; external libzstd;

type
  PZSTD_DCtx = type Pointer;

function ZSTD_createDCtx: PZSTD_DCtx; cdecl; external libzstd;
function ZSTD_freeDCtx(dctx: PZSTD_DCtx): Tsize_t; cdecl; external libzstd;
function ZSTD_decompressDCtx(dctx: PZSTD_DCtx; dst: pointer; dstCapacity: Tsize_t; src: pointer; srcSize: Tsize_t): Tsize_t; cdecl; external libzstd;

type
  PZSTD_strategy = ^TZSTD_strategy;
  TZSTD_strategy = longint;

const
  ZSTD_fast = 1;
  ZSTD_dfast = 2;
  ZSTD_greedy = 3;
  ZSTD_lazy = 4;
  ZSTD_lazy2 = 5;
  ZSTD_btlazy2 = 6;
  ZSTD_btopt = 7;
  ZSTD_btultra = 8;
  ZSTD_btultra2 = 9;

type
  PZSTD_cParameter = ^TZSTD_cParameter;
  TZSTD_cParameter = longint;

const
  ZSTD_c_compressionLevel = 100;
  ZSTD_c_windowLog = 101;
  ZSTD_c_hashLog = 102;
  ZSTD_c_chainLog = 103;
  ZSTD_c_searchLog = 104;
  ZSTD_c_minMatch = 105;
  ZSTD_c_targetLength = 106;
  ZSTD_c_strategy = 107;
  ZSTD_c_enableLongDistanceMatching = 160;
  ZSTD_c_ldmHashLog = 161;
  ZSTD_c_ldmMinMatch = 162;
  ZSTD_c_ldmBucketSizeLog = 163;
  ZSTD_c_ldmHashRateLog = 164;
  ZSTD_c_contentSizeFlag = 200;
  ZSTD_c_checksumFlag = 201;
  ZSTD_c_dictIDFlag = 202;
  ZSTD_c_nbWorkers = 400;
  ZSTD_c_jobSize = 401;
  ZSTD_c_overlapLog = 402;
  ZSTD_c_experimentalParam1 = 500;
  ZSTD_c_experimentalParam2 = 10;
  ZSTD_c_experimentalParam3 = 1000;
  ZSTD_c_experimentalParam4 = 1001;
  ZSTD_c_experimentalParam5 = 1002;
  ZSTD_c_experimentalParam6 = 1003;
  ZSTD_c_experimentalParam7 = 1004;
  ZSTD_c_experimentalParam8 = 1005;
  ZSTD_c_experimentalParam9 = 1006;
  ZSTD_c_experimentalParam10 = 1007;
  ZSTD_c_experimentalParam11 = 1008;
  ZSTD_c_experimentalParam12 = 1009;
  ZSTD_c_experimentalParam13 = 1010;
  ZSTD_c_experimentalParam14 = 1011;
  ZSTD_c_experimentalParam15 = 1012;
  ZSTD_c_experimentalParam16 = 1013;
  ZSTD_c_experimentalParam17 = 1014;
  ZSTD_c_experimentalParam18 = 1015;
  ZSTD_c_experimentalParam19 = 1016;

type
  TZSTD_bounds = record
    error: Tsize_t;
    lowerBound: longint;
    upperBound: longint;
  end;
  PZSTD_bounds = ^TZSTD_bounds;

function ZSTD_cParam_getBounds(cParam: TZSTD_cParameter): TZSTD_bounds; cdecl; external libzstd;
function ZSTD_CCtx_setParameter(cctx: PZSTD_CCtx; param: TZSTD_cParameter; value: longint): Tsize_t; cdecl; external libzstd;
function ZSTD_CCtx_setPledgedSrcSize(cctx: PZSTD_CCtx; pledgedSrcSize: qword): Tsize_t; cdecl; external libzstd;

type
  PZSTD_ResetDirective = ^TZSTD_ResetDirective;
  TZSTD_ResetDirective = longint;

const
  ZSTD_reset_session_only = 1;
  ZSTD_reset_parameters = 2;
  ZSTD_reset_session_and_parameters = 3;

function ZSTD_CCtx_reset(cctx: PZSTD_CCtx; reset: TZSTD_ResetDirective): Tsize_t; cdecl; external libzstd;
function ZSTD_compress2(cctx: PZSTD_CCtx; dst: pointer; dstCapacity: Tsize_t; src: pointer; srcSize: Tsize_t): Tsize_t; cdecl; external libzstd;

type
  PZSTD_dParameter = ^TZSTD_dParameter;
  TZSTD_dParameter = longint;

const
  ZSTD_d_windowLogMax = 100;
  ZSTD_d_experimentalParam1 = 1000;
  ZSTD_d_experimentalParam2 = 1001;
  ZSTD_d_experimentalParam3 = 1002;
  ZSTD_d_experimentalParam4 = 1003;
  ZSTD_d_experimentalParam5 = 1004;

function ZSTD_dParam_getBounds(dParam: TZSTD_dParameter): TZSTD_bounds; cdecl; external libzstd;
function ZSTD_DCtx_setParameter(dctx: PZSTD_DCtx; param: TZSTD_dParameter; value: longint): Tsize_t; cdecl; external libzstd;
function ZSTD_DCtx_reset(dctx: PZSTD_DCtx; reset: TZSTD_ResetDirective): Tsize_t; cdecl; external libzstd;

type
  TZSTD_inBuffer = record
    src: pointer;
    size: Tsize_t;
    pos: Tsize_t;
  end;
  PZSTD_inBuffer = ^TZSTD_inBuffer;

  TZSTD_outBuffer = record
    dst: pointer;
    size: Tsize_t;
    pos: Tsize_t;
  end;
  PZSTD_outBuffer = ^TZSTD_outBuffer;

  PZSTD_CStream = PZSTD_CCtx;

function ZSTD_createCStream: PZSTD_CStream; cdecl; external libzstd;
function ZSTD_freeCStream(zcs: PZSTD_CStream): Tsize_t; cdecl; external libzstd;

type
  PZSTD_EndDirective = ^TZSTD_EndDirective;
  TZSTD_EndDirective = longint;

const
  ZSTD_e_continue = 0;
  ZSTD_e_flush = 1;
  ZSTD_e_end = 2;

function ZSTD_compressStream2(cctx: PZSTD_CCtx; output: PZSTD_outBuffer; input: PZSTD_inBuffer; endOp: TZSTD_EndDirective): Tsize_t; cdecl; external libzstd;
function ZSTD_CStreamInSize: Tsize_t; cdecl; external libzstd;
function ZSTD_CStreamOutSize: Tsize_t; cdecl; external libzstd;
function ZSTD_initCStream(zcs: PZSTD_CStream; compressionLevel: longint): Tsize_t; cdecl; external libzstd;
function ZSTD_compressStream(zcs: PZSTD_CStream; output: PZSTD_outBuffer; input: PZSTD_inBuffer): Tsize_t; cdecl; external libzstd;
function ZSTD_flushStream(zcs: PZSTD_CStream; output: PZSTD_outBuffer): Tsize_t; cdecl; external libzstd;
function ZSTD_endStream(zcs: PZSTD_CStream; output: PZSTD_outBuffer): Tsize_t; cdecl; external libzstd;

type
  PZSTD_DStream = PZSTD_DCtx;

function ZSTD_createDStream: PZSTD_DStream; cdecl; external libzstd;
function ZSTD_freeDStream(zds: PZSTD_DStream): Tsize_t; cdecl; external libzstd;
function ZSTD_initDStream(zds: PZSTD_DStream): Tsize_t; cdecl; external libzstd;
function ZSTD_decompressStream(zds: PZSTD_DStream; output: PZSTD_outBuffer; input: PZSTD_inBuffer): Tsize_t; cdecl; external libzstd;
function ZSTD_DStreamInSize: Tsize_t; cdecl; external libzstd;
function ZSTD_DStreamOutSize: Tsize_t; cdecl; external libzstd;
function ZSTD_compress_usingDict(ctx: PZSTD_CCtx; dst: pointer; dstCapacity: Tsize_t; src: pointer; srcSize: Tsize_t;
  dict: pointer; dictSize: Tsize_t; compressionLevel: longint): Tsize_t; cdecl; external libzstd;
function ZSTD_decompress_usingDict(dctx: PZSTD_DCtx; dst: pointer; dstCapacity: Tsize_t; src: pointer; srcSize: Tsize_t;
  dict: pointer; dictSize: Tsize_t): Tsize_t; cdecl; external libzstd;

type
  PZSTD_CDict = type Pointer;

function ZSTD_createCDict(dictBuffer: pointer; dictSize: Tsize_t; compressionLevel: longint): PZSTD_CDict; cdecl; external libzstd;
function ZSTD_freeCDict(CDict: PZSTD_CDict): Tsize_t; cdecl; external libzstd;
function ZSTD_compress_usingCDict(cctx: PZSTD_CCtx; dst: pointer; dstCapacity: Tsize_t; src: pointer; srcSize: Tsize_t; cdict: PZSTD_CDict): Tsize_t; cdecl; external libzstd;

type
  PZSTD_DDict = type Pointer;

function ZSTD_createDDict(dictBuffer: pointer; dictSize: Tsize_t): PZSTD_DDict; cdecl; external libzstd;
function ZSTD_freeDDict(ddict: PZSTD_DDict): Tsize_t; cdecl; external libzstd;
function ZSTD_decompress_usingDDict(dctx: PZSTD_DCtx; dst: pointer; dstCapacity: Tsize_t; src: pointer; srcSize: Tsize_t; ddict: PZSTD_DDict): Tsize_t; cdecl; external libzstd;
function ZSTD_getDictID_fromDict(dict: pointer; dictSize: Tsize_t): dword; cdecl; external libzstd;
function ZSTD_getDictID_fromCDict(cdict: PZSTD_CDict): dword; cdecl; external libzstd;
function ZSTD_getDictID_fromDDict(ddict: PZSTD_DDict): dword; cdecl; external libzstd;
function ZSTD_getDictID_fromFrame(src: pointer; srcSize: Tsize_t): dword; cdecl; external libzstd;
function ZSTD_CCtx_loadDictionary(cctx: PZSTD_CCtx; dict: pointer; dictSize: Tsize_t): Tsize_t; cdecl; external libzstd;
function ZSTD_CCtx_refCDict(cctx: PZSTD_CCtx; cdict: PZSTD_CDict): Tsize_t; cdecl; external libzstd;
function ZSTD_CCtx_refPrefix(cctx: PZSTD_CCtx; prefix: pointer; prefixSize: Tsize_t): Tsize_t; cdecl; external libzstd;
function ZSTD_DCtx_loadDictionary(dctx: PZSTD_DCtx; dict: pointer; dictSize: Tsize_t): Tsize_t; cdecl; external libzstd;
function ZSTD_DCtx_refDDict(dctx: PZSTD_DCtx; ddict: PZSTD_DDict): Tsize_t; cdecl; external libzstd;
function ZSTD_DCtx_refPrefix(dctx: PZSTD_DCtx; prefix: pointer; prefixSize: Tsize_t): Tsize_t; cdecl; external libzstd;
function ZSTD_sizeof_CCtx(cctx: PZSTD_CCtx): Tsize_t; cdecl; external libzstd;
function ZSTD_sizeof_DCtx(dctx: PZSTD_DCtx): Tsize_t; cdecl; external libzstd;
function ZSTD_sizeof_CStream(zcs: PZSTD_CStream): Tsize_t; cdecl; external libzstd;
function ZSTD_sizeof_DStream(zds: PZSTD_DStream): Tsize_t; cdecl; external libzstd;
function ZSTD_sizeof_CDict(cdict: PZSTD_CDict): Tsize_t; cdecl; external libzstd;
function ZSTD_sizeof_DDict(ddict: PZSTD_DDict): Tsize_t; cdecl; external libzstd;

function ZSTD_FRAMEHEADERSIZE_PREFIX(format: longint): longint;
function ZSTD_FRAMEHEADERSIZE_MIN(format: longint): longint;

const
  ZSTD_FRAMEHEADERSIZE_MAX = 18;
  ZSTD_SKIPPABLEHEADERSIZE = 8;
  ZSTD_WINDOWLOG_MAX_32 = 30;
  ZSTD_WINDOWLOG_MAX_64 = 31;
  ZSTD_WINDOWLOG_MAX = ZSTD_WINDOWLOG_MAX_64;
  ZSTD_WINDOWLOG_MIN = 10;
  ZSTD_HASHLOG_MAX = 30;
  ZSTD_HASHLOG_MIN = 6;
  ZSTD_CHAINLOG_MAX_32 = 29;
  ZSTD_CHAINLOG_MAX_64 = 30;
  ZSTD_CHAINLOG_MAX = ZSTD_CHAINLOG_MAX_64;
  ZSTD_CHAINLOG_MIN = ZSTD_HASHLOG_MIN;
  ZSTD_SEARCHLOG_MAX = ZSTD_WINDOWLOG_MAX - 1;
  ZSTD_SEARCHLOG_MIN = 1;
  ZSTD_MINMATCH_MAX = 7;
  ZSTD_MINMATCH_MIN = 3;
  ZSTD_TARGETLENGTH_MAX = ZSTD_BLOCKSIZE_MAX;
  ZSTD_TARGETLENGTH_MIN = 0;
  ZSTD_STRATEGY_MIN = ZSTD_fast;
  ZSTD_STRATEGY_MAX = ZSTD_btultra2;
  ZSTD_BLOCKSIZE_MAX_MIN = 1 shl 10;
  ZSTD_OVERLAPLOG_MIN = 0;
  ZSTD_OVERLAPLOG_MAX = 9;
  ZSTD_WINDOWLOG_LIMIT_DEFAULT = 27;
  ZSTD_LDM_HASHLOG_MIN = ZSTD_HASHLOG_MIN;
  ZSTD_LDM_HASHLOG_MAX = ZSTD_HASHLOG_MAX;
  ZSTD_LDM_MINMATCH_MIN = 4;
  ZSTD_LDM_MINMATCH_MAX = 4096;
  ZSTD_LDM_BUCKETSIZELOG_MIN = 1;
  ZSTD_LDM_BUCKETSIZELOG_MAX = 8;
  ZSTD_LDM_HASHRATELOG_MIN = 0;
  ZSTD_LDM_HASHRATELOG_MAX = ZSTD_WINDOWLOG_MAX - ZSTD_HASHLOG_MIN;
  ZSTD_TARGETCBLOCKSIZE_MIN = 64;
  ZSTD_TARGETCBLOCKSIZE_MAX = ZSTD_BLOCKSIZE_MAX;
  ZSTD_SRCSIZEHINT_MIN = 0;
  ZSTD_SRCSIZEHINT_MAX = MaxInt;

type
  PZSTD_CCtx_params = type Pointer;

  TZSTD_Sequence = record
    offset: dword;
    litLength: dword;
    matchLength: dword;
    rep: dword;
  end;
  PZSTD_Sequence = ^TZSTD_Sequence;

  TZSTD_compressionParameters = record
    windowLog: dword;
    chainLog: dword;
    hashLog: dword;
    searchLog: dword;
    minMatch: dword;
    targetLength: dword;
    strategy: TZSTD_strategy;
  end;
  PZSTD_compressionParameters = ^TZSTD_compressionParameters;

  TZSTD_frameParameters = record
    contentSizeFlag: longint;
    checksumFlag: longint;
    noDictIDFlag: longint;
  end;
  PZSTD_frameParameters = ^TZSTD_frameParameters;

  TZSTD_parameters = record
    cParams: TZSTD_compressionParameters;
    fParams: TZSTD_frameParameters;
  end;
  PZSTD_parameters = ^TZSTD_parameters;

type
  PZSTD_dictContentType_e = ^TZSTD_dictContentType_e;
  TZSTD_dictContentType_e = longint;

const
  ZSTD_dct_auto = 0;
  ZSTD_dct_rawContent = 1;
  ZSTD_dct_fullDict = 2;

type
  PZSTD_dictLoadMethod_e = ^TZSTD_dictLoadMethod_e;
  TZSTD_dictLoadMethod_e = longint;

const
  ZSTD_dlm_byCopy = 0;
  ZSTD_dlm_byRef = 1;

type
  PZSTD_format_e = ^TZSTD_format_e;
  TZSTD_format_e = longint;

const
  ZSTD_f_zstd1 = 0;
  ZSTD_f_zstd1_magicless = 1;

type
  PZSTD_forceIgnoreChecksum_e = ^TZSTD_forceIgnoreChecksum_e;
  TZSTD_forceIgnoreChecksum_e = longint;

const
  ZSTD_d_validateChecksum = 0;
  ZSTD_d_ignoreChecksum = 1;

type
  PZSTD_refMultipleDDicts_e = ^TZSTD_refMultipleDDicts_e;
  TZSTD_refMultipleDDicts_e = longint;

const
  ZSTD_rmd_refSingleDDict = 0;
  ZSTD_rmd_refMultipleDDicts = 1;

type
  PZSTD_dictAttachPref_e = ^TZSTD_dictAttachPref_e;
  TZSTD_dictAttachPref_e = longint;

const
  ZSTD_dictDefaultAttach = 0;
  ZSTD_dictForceAttach = 1;
  ZSTD_dictForceCopy = 2;
  ZSTD_dictForceLoad = 3;

type
  PZSTD_literalCompressionMode_e = ^TZSTD_literalCompressionMode_e;
  TZSTD_literalCompressionMode_e = longint;

const
  ZSTD_lcm_auto = 0;
  ZSTD_lcm_huffman = 1;
  ZSTD_lcm_uncompressed = 2;

type
  PZSTD_paramSwitch_e = ^TZSTD_paramSwitch_e;
  TZSTD_paramSwitch_e = longint;

const
  ZSTD_ps_auto = 0;
  ZSTD_ps_enable = 1;
  ZSTD_ps_disable = 2;

function ZSTD_findDecompressedSize(src: pointer; srcSize: Tsize_t): qword; cdecl; external libzstd;
function ZSTD_decompressBound(src: pointer; srcSize: Tsize_t): qword; cdecl; external libzstd;
function ZSTD_frameHeaderSize(src: pointer; srcSize: Tsize_t): Tsize_t; cdecl; external libzstd;

type
  PZSTD_frameType_e = ^TZSTD_frameType_e;
  TZSTD_frameType_e = longint;

const
  ZSTD_frame = 0;
  ZSTD_skippableFrame = 1;

type
  TZSTD_frameHeader = record
    frameContentSize: qword;
    windowSize: qword;
    blockSizeMax: dword;
    frameType: TZSTD_frameType_e;
    headerSize: dword;
    dictID: dword;
    checksumFlag: dword;
    _reserved1: dword;
    _reserved2: dword;
  end;
  PZSTD_frameHeader = ^TZSTD_frameHeader;

function ZSTD_getFrameHeader(zfhPtr: PZSTD_frameHeader; src: pointer; srcSize: Tsize_t): Tsize_t; cdecl; external libzstd;
function ZSTD_getFrameHeader_advanced(zfhPtr: PZSTD_frameHeader; src: pointer; srcSize: Tsize_t; format: TZSTD_format_e): Tsize_t; cdecl; external libzstd;
function ZSTD_decompressionMargin(src: pointer; srcSize: Tsize_t): Tsize_t; cdecl; external libzstd;
function ZSTD_DECOMPRESSION_MARGIN(originalSize, blockSize: Tsize_t): Tsize_t;

type
  PZSTD_sequenceFormat_e = ^TZSTD_sequenceFormat_e;
  TZSTD_sequenceFormat_e = longint;

const
  ZSTD_sf_noBlockDelimiters = 0;
  ZSTD_sf_explicitBlockDelimiters = 1;

function ZSTD_sequenceBound(srcSize: Tsize_t): Tsize_t; cdecl; external libzstd;
function ZSTD_generateSequences(zc: PZSTD_CCtx; outSeqs: PZSTD_Sequence; outSeqsSize: Tsize_t; src: pointer; srcSize: Tsize_t): Tsize_t; cdecl; external libzstd;
function ZSTD_mergeBlockDelimiters(sequences: PZSTD_Sequence; seqsSize: Tsize_t): Tsize_t; cdecl; external libzstd;
function ZSTD_compressSequences(cctx: PZSTD_CCtx; dst: pointer; dstSize: Tsize_t; inSeqs: PZSTD_Sequence; inSeqsSize: Tsize_t;
  src: pointer; srcSize: Tsize_t): Tsize_t; cdecl; external libzstd;
function ZSTD_writeSkippableFrame(dst: pointer; dstCapacity: Tsize_t; src: pointer; srcSize: Tsize_t; magicVariant: dword): Tsize_t; cdecl; external libzstd;
function ZSTD_readSkippableFrame(dst: pointer; dstCapacity: Tsize_t; magicVariant: Pdword; src: pointer; srcSize: Tsize_t): Tsize_t; cdecl; external libzstd;
function ZSTD_isSkippableFrame(buffer: pointer; size: Tsize_t): dword; cdecl; external libzstd;

function ZSTD_estimateCCtxSize(compressionLevel: longint): Tsize_t; cdecl; external libzstd;
function ZSTD_estimateCCtxSize_usingCParams(cParams: TZSTD_compressionParameters): Tsize_t; cdecl; external libzstd;
function ZSTD_estimateCCtxSize_usingCCtxParams(params: PZSTD_CCtx_params): Tsize_t; cdecl; external libzstd;
function ZSTD_estimateDCtxSize: Tsize_t; cdecl; external libzstd;
function ZSTD_estimateCStreamSize(compressionLevel: longint): Tsize_t; cdecl; external libzstd;
function ZSTD_estimateCStreamSize_usingCParams(cParams: TZSTD_compressionParameters): Tsize_t; cdecl; external libzstd;
function ZSTD_estimateCStreamSize_usingCCtxParams(params: PZSTD_CCtx_params): Tsize_t; cdecl; external libzstd;
function ZSTD_estimateDStreamSize(windowSize: Tsize_t): Tsize_t; cdecl; external libzstd;
function ZSTD_estimateDStreamSize_fromFrame(src: pointer; srcSize: Tsize_t): Tsize_t; cdecl; external libzstd;
function ZSTD_estimateCDictSize(dictSize: Tsize_t; compressionLevel: longint): Tsize_t; cdecl; external libzstd;
function ZSTD_estimateCDictSize_advanced(dictSize: Tsize_t; cParams: TZSTD_compressionParameters; dictLoadMethod: TZSTD_dictLoadMethod_e): Tsize_t; cdecl; external libzstd;
function ZSTD_estimateDDictSize(dictSize: Tsize_t; dictLoadMethod: TZSTD_dictLoadMethod_e): Tsize_t; cdecl; external libzstd;
function ZSTD_initStaticCCtx(workspace: pointer; workspaceSize: Tsize_t): PZSTD_CCtx; cdecl; external libzstd;
function ZSTD_initStaticCStream(workspace: pointer; workspaceSize: Tsize_t): PZSTD_CStream; cdecl; external libzstd;
function ZSTD_initStaticDCtx(workspace: pointer; workspaceSize: Tsize_t): PZSTD_DCtx; cdecl; external libzstd;
function ZSTD_initStaticDStream(workspace: pointer; workspaceSize: Tsize_t): PZSTD_DStream; cdecl; external libzstd;
function ZSTD_initStaticCDict(workspace: pointer; workspaceSize: Tsize_t; dict: pointer; dictSize: Tsize_t; dictLoadMethod: TZSTD_dictLoadMethod_e;
  dictContentType: TZSTD_dictContentType_e; cParams: TZSTD_compressionParameters): PZSTD_CDict; cdecl; external libzstd;
function ZSTD_initStaticDDict(workspace: pointer; workspaceSize: Tsize_t; dict: pointer; dictSize: Tsize_t; dictLoadMethod: TZSTD_dictLoadMethod_e;
  dictContentType: TZSTD_dictContentType_e): PZSTD_DDict; cdecl; external libzstd;

type
  TZSTD_allocFunction = function(opaque: pointer; size: Tsize_t): pointer; cdecl;
  TZSTD_freeFunction = procedure(opaque: pointer; address: pointer); cdecl;

  TZSTD_customMem = record
    customAlloc: TZSTD_allocFunction;
    customFree: TZSTD_freeFunction;
    opaque: pointer;
  end;
  PZSTD_customMem = ^TZSTD_customMem;

const
  ZSTD_defaultCMem: TZSTD_customMem = (customAlloc: nil; customFree: nil; opaque: nil);

function ZSTD_createCCtx_advanced(customMem: TZSTD_customMem): PZSTD_CCtx; cdecl; external libzstd;
function ZSTD_createCStream_advanced(customMem: TZSTD_customMem): PZSTD_CStream; cdecl; external libzstd;
function ZSTD_createDCtx_advanced(customMem: TZSTD_customMem): PZSTD_DCtx; cdecl; external libzstd;
function ZSTD_createDStream_advanced(customMem: TZSTD_customMem): PZSTD_DStream; cdecl; external libzstd;
function ZSTD_createCDict_advanced(dict: pointer; dictSize: Tsize_t; dictLoadMethod: TZSTD_dictLoadMethod_e; dictContentType: TZSTD_dictContentType_e; cParams: TZSTD_compressionParameters; customMem: TZSTD_customMem): PZSTD_CDict; cdecl; external libzstd;

type
  PZSTD_threadPool = type Pointer;

function ZSTD_createThreadPool(numThreads: Tsize_t): PZSTD_threadPool; cdecl; external libzstd;
procedure ZSTD_freeThreadPool(pool: PZSTD_threadPool); cdecl; external libzstd;
function ZSTD_CCtx_refThreadPool(cctx: PZSTD_CCtx; pool: PZSTD_threadPool): Tsize_t; cdecl; external libzstd;
function ZSTD_createCDict_advanced2(dict: pointer; dictSize: Tsize_t; dictLoadMethod: TZSTD_dictLoadMethod_e; dictContentType: TZSTD_dictContentType_e; cctxParams: PZSTD_CCtx_params;
  customMem: TZSTD_customMem): PZSTD_CDict; cdecl; external libzstd;
function ZSTD_createDDict_advanced(dict: pointer; dictSize: Tsize_t; dictLoadMethod: TZSTD_dictLoadMethod_e; dictContentType: TZSTD_dictContentType_e; customMem: TZSTD_customMem): PZSTD_DDict; cdecl; external libzstd;

function ZSTD_createCDict_byReference(dictBuffer: pointer; dictSize: Tsize_t; compressionLevel: longint): PZSTD_CDict; cdecl; external libzstd;
function ZSTD_getCParams(compressionLevel: longint; estimatedSrcSize: qword; dictSize: Tsize_t): TZSTD_compressionParameters; cdecl; external libzstd;
function ZSTD_getParams(compressionLevel: longint; estimatedSrcSize: qword; dictSize: Tsize_t): TZSTD_parameters; cdecl; external libzstd;
function ZSTD_checkCParams(params: TZSTD_compressionParameters): Tsize_t; cdecl; external libzstd;
function ZSTD_adjustCParams(cPar: TZSTD_compressionParameters; srcSize: qword; dictSize: Tsize_t): TZSTD_compressionParameters; cdecl; external libzstd;
function ZSTD_CCtx_setCParams(cctx: PZSTD_CCtx; cparams: TZSTD_compressionParameters): Tsize_t; cdecl; external libzstd;
function ZSTD_CCtx_setFParams(cctx: PZSTD_CCtx; fparams: TZSTD_frameParameters): Tsize_t; cdecl; external libzstd;
function ZSTD_CCtx_setParams(cctx: PZSTD_CCtx; params: TZSTD_parameters): Tsize_t; cdecl; external libzstd;
function ZSTD_compress_advanced(cctx: PZSTD_CCtx; dst: pointer; dstCapacity: Tsize_t; src: pointer; srcSize: Tsize_t;
  dict: pointer; dictSize: Tsize_t; params: TZSTD_parameters): Tsize_t; cdecl; external libzstd; deprecated'use ZSTD_compress2';

function ZSTD_compress_usingCDict_advanced(cctx: PZSTD_CCtx; dst: pointer; dstCapacity: Tsize_t; src: pointer; srcSize: Tsize_t;
  cdict: PZSTD_CDict; fParams: TZSTD_frameParameters): Tsize_t; cdecl; external libzstd; deprecated'use ZSTD_compress2 with ZSTD_CCtx_loadDictionary';
function ZSTD_CCtx_loadDictionary_byReference(cctx: PZSTD_CCtx; dict: pointer; dictSize: Tsize_t): Tsize_t; cdecl; external libzstd;
function ZSTD_CCtx_loadDictionary_advanced(cctx: PZSTD_CCtx; dict: pointer; dictSize: Tsize_t; dictLoadMethod: TZSTD_dictLoadMethod_e; dictContentType: TZSTD_dictContentType_e): Tsize_t; cdecl; external libzstd;
function ZSTD_CCtx_refPrefix_advanced(cctx: PZSTD_CCtx; prefix: pointer; prefixSize: Tsize_t; dictContentType: TZSTD_dictContentType_e): Tsize_t; cdecl; external libzstd;

const
  ZSTD_c_rsyncable = ZSTD_c_experimentalParam1;
  ZSTD_c_format = ZSTD_c_experimentalParam2;
  ZSTD_c_forceMaxWindow = ZSTD_c_experimentalParam3;
  ZSTD_c_forceAttachDict = ZSTD_c_experimentalParam4;
  ZSTD_c_literalCompressionMode = ZSTD_c_experimentalParam5;
  ZSTD_c_targetCBlockSize = ZSTD_c_experimentalParam6;
  ZSTD_c_srcSizeHint = ZSTD_c_experimentalParam7;
  ZSTD_c_enableDedicatedDictSearch = ZSTD_c_experimentalParam8;
  ZSTD_c_stableInBuffer = ZSTD_c_experimentalParam9;
  ZSTD_c_stableOutBuffer = ZSTD_c_experimentalParam10;
  ZSTD_c_blockDelimiters = ZSTD_c_experimentalParam11;
  ZSTD_c_validateSequences = ZSTD_c_experimentalParam12;
  ZSTD_c_useBlockSplitter = ZSTD_c_experimentalParam13;
  ZSTD_c_useRowMatchFinder = ZSTD_c_experimentalParam14;
  ZSTD_c_deterministicRefPrefix = ZSTD_c_experimentalParam15;
  ZSTD_c_prefetchCDictTables = ZSTD_c_experimentalParam16;
  ZSTD_c_enableSeqProducerFallback = ZSTD_c_experimentalParam17;
  ZSTD_c_maxBlockSize = ZSTD_c_experimentalParam18;
  ZSTD_c_searchForExternalRepcodes = ZSTD_c_experimentalParam19;

function ZSTD_CCtx_getParameter(cctx: PZSTD_CCtx; param: TZSTD_cParameter; value: Plongint): Tsize_t; cdecl; external libzstd;
function ZSTD_createCCtxParams: PZSTD_CCtx_params; cdecl; external libzstd;
function ZSTD_freeCCtxParams(params: PZSTD_CCtx_params): Tsize_t; cdecl; external libzstd;
function ZSTD_CCtxParams_reset(params: PZSTD_CCtx_params): Tsize_t; cdecl; external libzstd;
function ZSTD_CCtxParams_init(cctxParams: PZSTD_CCtx_params; compressionLevel: longint): Tsize_t; cdecl; external libzstd;
function ZSTD_CCtxParams_init_advanced(cctxParams: PZSTD_CCtx_params; params: TZSTD_parameters): Tsize_t; cdecl; external libzstd;
function ZSTD_CCtxParams_setParameter(params: PZSTD_CCtx_params; param: TZSTD_cParameter; value: longint): Tsize_t; cdecl; external libzstd;
function ZSTD_CCtxParams_getParameter(params: PZSTD_CCtx_params; param: TZSTD_cParameter; value: Plongint): Tsize_t; cdecl; external libzstd;
function ZSTD_CCtx_setParametersUsingCCtxParams(cctx: PZSTD_CCtx; params: PZSTD_CCtx_params): Tsize_t; cdecl; external libzstd;
function ZSTD_compressStream2_simpleArgs(cctx: PZSTD_CCtx; dst: pointer; dstCapacity: Tsize_t; dstPos: Psize_t; src: pointer;
  srcSize: Tsize_t; srcPos: Psize_t; endOp: TZSTD_EndDirective): Tsize_t; cdecl; external libzstd;

function ZSTD_isFrame(buffer: pointer; size: Tsize_t): dword; cdecl; external libzstd;
function ZSTD_createDDict_byReference(dictBuffer: pointer; dictSize: Tsize_t): PZSTD_DDict; cdecl; external libzstd;
function ZSTD_DCtx_loadDictionary_byReference(dctx: PZSTD_DCtx; dict: pointer; dictSize: Tsize_t): Tsize_t; cdecl; external libzstd;
function ZSTD_DCtx_loadDictionary_advanced(dctx: PZSTD_DCtx; dict: pointer; dictSize: Tsize_t; dictLoadMethod: TZSTD_dictLoadMethod_e; dictContentType: TZSTD_dictContentType_e): Tsize_t; cdecl; external libzstd;
function ZSTD_DCtx_refPrefix_advanced(dctx: PZSTD_DCtx; prefix: pointer; prefixSize: Tsize_t; dictContentType: TZSTD_dictContentType_e): Tsize_t; cdecl; external libzstd;
function ZSTD_DCtx_setMaxWindowSize(dctx: PZSTD_DCtx; maxWindowSize: Tsize_t): Tsize_t; cdecl; external libzstd;
function ZSTD_DCtx_getParameter(dctx: PZSTD_DCtx; param: TZSTD_dParameter; value: Plongint): Tsize_t; cdecl; external libzstd;

const
  ZSTD_d_format = ZSTD_d_experimentalParam1;
  ZSTD_d_stableOutBuffer = ZSTD_d_experimentalParam2;
  ZSTD_d_forceIgnoreChecksum = ZSTD_d_experimentalParam3;
  ZSTD_d_refMultipleDDicts = ZSTD_d_experimentalParam4;
  ZSTD_d_disableHuffmanAssembly = ZSTD_d_experimentalParam5;

function ZSTD_DCtx_setFormat(dctx: PZSTD_DCtx; format: TZSTD_format_e): Tsize_t; cdecl; external libzstd; deprecated'use ZSTD_DCtx_setParameter() instead';
function ZSTD_decompressStream_simpleArgs(dctx: PZSTD_DCtx; dst: pointer; dstCapacity: Tsize_t; dstPos: Psize_t; src: pointer;
  srcSize: Tsize_t; srcPos: Psize_t): Tsize_t; cdecl; external libzstd;

function ZSTD_initCStream_srcSize(zcs: PZSTD_CStream; compressionLevel: longint; pledgedSrcSize: qword): Tsize_t; cdecl; external libzstd; deprecated'use ZSTD_CCtx_reset, see zstd.h for detailed instructions';
function ZSTD_initCStream_usingDict(zcs: PZSTD_CStream; dict: pointer; dictSize: Tsize_t; compressionLevel: longint): Tsize_t; cdecl; external libzstd; deprecated'use ZSTD_CCtx_reset, see zstd.h for detailed instructions';
function ZSTD_initCStream_advanced(zcs: PZSTD_CStream; dict: pointer; dictSize: Tsize_t; params: TZSTD_parameters; pledgedSrcSize: qword): Tsize_t; cdecl; external libzstd; deprecated'use ZSTD_CCtx_reset, see zstd.h for detailed instructions';
function ZSTD_initCStream_usingCDict(zcs: PZSTD_CStream; cdict: PZSTD_CDict): Tsize_t; cdecl; external libzstd; deprecated'use ZSTD_CCtx_reset and ZSTD_CCtx_refCDict, see zstd.h for detailed instructions';
function ZSTD_initCStream_usingCDict_advanced(zcs: PZSTD_CStream; cdict: PZSTD_CDict; fParams: TZSTD_frameParameters; pledgedSrcSize: qword): Tsize_t; cdecl; external libzstd; deprecated'use ZSTD_CCtx_reset and ZSTD_CCtx_refCDict, see zstd.h for detailed instructions';
function ZSTD_resetCStream(zcs: PZSTD_CStream; pledgedSrcSize: qword): Tsize_t; cdecl; external libzstd; deprecated'use ZSTD_CCtx_reset, see zstd.h for detailed instructions';

type
  TZSTD_frameProgression = record
    ingested: qword;
    consumed: qword;
    produced: qword;
    flushed: qword;
    currentJobID: dword;
    nbActiveWorkers: dword;
  end;
  PZSTD_frameProgression = ^TZSTD_frameProgression;

function ZSTD_getFrameProgression(cctx: PZSTD_CCtx): TZSTD_frameProgression; cdecl; external libzstd;
function ZSTD_toFlushNow(cctx: PZSTD_CCtx): Tsize_t; cdecl; external libzstd;

function ZSTD_initDStream_usingDict(zds: PZSTD_DStream; dict: pointer; dictSize: Tsize_t): Tsize_t; cdecl; external libzstd; deprecated'use ZSTD_DCtx_reset + ZSTD_DCtx_loadDictionary, see zstd.h for detailed instructions';
function ZSTD_initDStream_usingDDict(zds: PZSTD_DStream; ddict: PZSTD_DDict): Tsize_t; cdecl; external libzstd; deprecated'use ZSTD_DCtx_reset + ZSTD_DCtx_refDDict, see zstd.h for detailed instructions';
function ZSTD_resetDStream(zds: PZSTD_DStream): Tsize_t; cdecl; external libzstd; deprecated'use ZSTD_DCtx_reset, see zstd.h for detailed instructions';

const
  ZSTD_SEQUENCE_PRODUCER_ERROR = Tsize_t(-1);

type
  TZSTD_sequenceProducer_F = function(sequenceProducerState: pointer; outSeqs: PZSTD_Sequence; outSeqsCapacity: Tsize_t; src: pointer; srcSize: Tsize_t;
    dict: pointer; dictSize: Tsize_t; compressionLevel: longint; windowSize: Tsize_t): Tsize_t; cdecl;

procedure ZSTD_registerSequenceProducer(cctx: PZSTD_CCtx; sequenceProducerState: pointer; sequenceProducer: TZSTD_sequenceProducer_F); cdecl; external libzstd;

function ZSTD_compressBegin(cctx: PZSTD_CCtx; compressionLevel: longint): Tsize_t; cdecl; external libzstd; deprecated'The buffer-less API is deprecated in favor of the normal streaming API. See docs.';
function ZSTD_compressBegin_usingDict(cctx: PZSTD_CCtx; dict: pointer; dictSize: Tsize_t; compressionLevel: longint): Tsize_t; cdecl; external libzstd; deprecated'The buffer-less API is deprecated in favor of the normal streaming API. See docs.';
function ZSTD_compressBegin_usingCDict(cctx: PZSTD_CCtx; cdict: PZSTD_CDict): Tsize_t; cdecl; external libzstd; deprecated'The buffer-less API is deprecated in favor of the normal streaming API. See docs.';
function ZSTD_copyCCtx(cctx: PZSTD_CCtx; preparedCCtx: PZSTD_CCtx; pledgedSrcSize: qword): Tsize_t; cdecl; external libzstd; deprecated'This function will likely be removed in a future release. It is misleading and has very limited utility.';
function ZSTD_compressContinue(cctx: PZSTD_CCtx; dst: pointer; dstCapacity: Tsize_t; src: pointer; srcSize: Tsize_t): Tsize_t; cdecl; external libzstd; deprecated'The buffer-less API is deprecated in favor of the normal streaming API. See docs.';
function ZSTD_compressEnd(cctx: PZSTD_CCtx; dst: pointer; dstCapacity: Tsize_t; src: pointer; srcSize: Tsize_t): Tsize_t; cdecl; external libzstd; deprecated'The buffer-less API is deprecated in favor of the normal streaming API. See docs.';
function ZSTD_compressBegin_advanced(cctx: PZSTD_CCtx; dict: pointer; dictSize: Tsize_t; params: TZSTD_parameters; pledgedSrcSize: qword): Tsize_t; cdecl; external libzstd; deprecated'use advanced API to access custom parameters';
function ZSTD_compressBegin_usingCDict_advanced(cctx: PZSTD_CCtx; cdict: PZSTD_CDict; fParams: TZSTD_frameParameters; pledgedSrcSize: qword): Tsize_t; cdecl; external libzstd; deprecated'use advanced API to access custom parameters';

function ZSTD_decodingBufferSize_min(windowSize: qword; frameContentSize: qword): Tsize_t; cdecl; external libzstd;
function ZSTD_decompressBegin(dctx: PZSTD_DCtx): Tsize_t; cdecl; external libzstd;
function ZSTD_decompressBegin_usingDict(dctx: PZSTD_DCtx; dict: pointer; dictSize: Tsize_t): Tsize_t; cdecl; external libzstd;
function ZSTD_decompressBegin_usingDDict(dctx: PZSTD_DCtx; ddict: PZSTD_DDict): Tsize_t; cdecl; external libzstd;
function ZSTD_nextSrcSizeToDecompress(dctx: PZSTD_DCtx): Tsize_t; cdecl; external libzstd;
function ZSTD_decompressContinue(dctx: PZSTD_DCtx; dst: pointer; dstCapacity: Tsize_t; src: pointer; srcSize: Tsize_t): Tsize_t; cdecl; external libzstd;
procedure ZSTD_copyDCtx(dctx: PZSTD_DCtx; preparedDCtx: PZSTD_DCtx); cdecl; external libzstd; deprecated'This function will likely be removed in the next minor release. It is misleading and has very limited utility.';

type
  PZSTD_nextInputType_e = ^TZSTD_nextInputType_e;
  TZSTD_nextInputType_e = longint;

const
  ZSTDnit_frameHeader = 0;
  ZSTDnit_blockHeader = 1;
  ZSTDnit_block = 2;
  ZSTDnit_lastBlock = 3;
  ZSTDnit_checksum = 4;
  ZSTDnit_skippableFrame = 5;

function ZSTD_nextInputType(dctx: PZSTD_DCtx): TZSTD_nextInputType_e; cdecl; external libzstd;

function ZSTD_getBlockSize(cctx: PZSTD_CCtx): Tsize_t; cdecl; external libzstd; deprecated'The block API is deprecated in favor of the normal compression API. See docs.';
function ZSTD_compressBlock(cctx: PZSTD_CCtx; dst: pointer; dstCapacity: Tsize_t; src: pointer; srcSize: Tsize_t): Tsize_t; cdecl; external libzstd; deprecated'The block API is deprecated in favor of the normal compression API. See docs.';
function ZSTD_decompressBlock(dctx: PZSTD_DCtx; dst: pointer; dstCapacity: Tsize_t; src: pointer; srcSize: Tsize_t): Tsize_t; cdecl; external libzstd; deprecated'The block API is deprecated in favor of the normal compression API. See docs.';
function ZSTD_insertBlock(dctx: PZSTD_DCtx; blockStart: pointer; blockSize: Tsize_t): Tsize_t; cdecl; external libzstd; deprecated'The block API is deprecated in favor of the normal compression API. See docs.';

// ==== zstd_errors.h

type
  PZSTD_ErrorCode = ^TZSTD_ErrorCode;
  TZSTD_ErrorCode = longint;

const
  ZSTD_error_no_error = 0;
  ZSTD_error_GENERIC = 1;
  ZSTD_error_prefix_unknown = 10;
  ZSTD_error_version_unsupported = 12;
  ZSTD_error_frameParameter_unsupported = 14;
  ZSTD_error_frameParameter_windowTooLarge = 16;
  ZSTD_error_corruption_detected = 20;
  ZSTD_error_checksum_wrong = 22;
  ZSTD_error_literals_headerWrong = 24;
  ZSTD_error_dictionary_corrupted = 30;
  ZSTD_error_dictionary_wrong = 32;
  ZSTD_error_dictionaryCreation_failed = 34;
  ZSTD_error_parameter_unsupported = 40;
  ZSTD_error_parameter_combination_unsupported = 41;
  ZSTD_error_parameter_outOfBound = 42;
  ZSTD_error_tableLog_tooLarge = 44;
  ZSTD_error_maxSymbolValue_tooLarge = 46;
  ZSTD_error_maxSymbolValue_tooSmall = 48;
  ZSTD_error_stabilityCondition_notRespected = 50;
  ZSTD_error_stage_wrong = 60;
  ZSTD_error_init_missing = 62;
  ZSTD_error_memory_allocation = 64;
  ZSTD_error_workSpace_tooSmall = 66;
  ZSTD_error_dstSize_tooSmall = 70;
  ZSTD_error_srcSize_wrong = 72;
  ZSTD_error_dstBuffer_null = 74;
  ZSTD_error_noForwardProgress_destFull = 80;
  ZSTD_error_noForwardProgress_inputEmpty = 82;
  ZSTD_error_frameIndex_tooLarge = 100;
  ZSTD_error_seekableIO = 102;
  ZSTD_error_dstBuffer_wrong = 104;
  ZSTD_error_srcBuffer_wrong = 105;
  ZSTD_error_sequenceProducer_failed = 106;
  ZSTD_error_externalSequences_invalid = 107;
  ZSTD_error_maxCode = 120;

function ZSTD_getErrorCode(functionResult: Tsize_t): TZSTD_ErrorCode; cdecl; external libzstd;
function ZSTD_getErrorString(code: TZSTD_ErrorCode): pchar; cdecl; external libzstd;


implementation


function ZSTD_FRAMEHEADERSIZE_PREFIX(format: longint): longint;
begin
  if format = ZSTD_f_zstd1 then begin
    Result := 5;
  end else begin
    Result := 1;
  end;
end;

function ZSTD_FRAMEHEADERSIZE_MIN(format: longint): longint;
begin
  if format = ZSTD_f_zstd1 then begin
    Result := 6;
  end else begin
    Result := 2;
  end;
end;

function ZSTD_DECOMPRESSION_MARGIN(originalSize, blockSize: Tsize_t): Tsize_t;
var
  numBlocks: Tsize_t;
begin
  if originalSize = 0 then begin
    numBlocks := 0;
  end else begin
    numBlocks := 3 * ((originalSize + blockSize - 1) div blockSize);
  end;

  Result := ZSTD_FRAMEHEADERSIZE_MAX + 4 + numBlocks + blockSize;
end;

end.
