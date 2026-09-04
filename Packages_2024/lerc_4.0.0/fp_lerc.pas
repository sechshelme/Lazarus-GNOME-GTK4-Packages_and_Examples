unit fp_lerc;

interface


const
  {$IFDEF Linux}
  liblerc = 'Lerc';
  {$ENDIF}

  {$IFDEF Windows}
  liblerc = 'Lerc.dll';
  {$ENDIF}


{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}

const
  LERC_VERSION_MAJOR = 4;
  LERC_VERSION_MINOR = 0;
  LERC_VERSION_PATCH = 0;

type
  Plerc_status = ^Tlerc_status;
  Tlerc_status = dword;

function lerc_computeCompressedSize(pData: pointer; dataType: dword; nDepth: longint; nCols: longint; nRows: longint;
  nBands: longint; nMasks: longint; pValidBytes: pbyte; maxZErr: double; numBytes: Pdword): Tlerc_status; cdecl; external liblerc;
function lerc_encode(pData: pointer; dataType: dword; nDepth: longint; nCols: longint; nRows: longint;
  nBands: longint; nMasks: longint; pValidBytes: pbyte; maxZErr: double; pOutBuffer: pbyte;
  outBufferSize: dword; nBytesWritten: Pdword): Tlerc_status; cdecl; external liblerc;
function lerc_computeCompressedSizeForVersion(pData: pointer; codecVersion: longint; dataType: dword; nDepth: longint; nCols: longint;
  nRows: longint; nBands: longint; nMasks: longint; pValidBytes: pbyte; maxZErr: double;
  numBytes: Pdword): Tlerc_status; cdecl; external liblerc;
function lerc_encodeForVersion(pData: pointer; codecVersion: longint; dataType: dword; nDepth: longint; nCols: longint;
  nRows: longint; nBands: longint; nMasks: longint; pValidBytes: pbyte; maxZErr: double;
  pOutBuffer: pbyte; outBufferSize: dword; nBytesWritten: Pdword): Tlerc_status; cdecl; external liblerc;
function lerc_getBlobInfo(pLercBlob: pbyte; blobSize: dword; infoArray: Pdword; dataRangeArray: Pdouble; infoArraySize: longint;
  dataRangeArraySize: longint): Tlerc_status; cdecl; external liblerc;
function lerc_getDataRanges(pLercBlob: pbyte; blobSize: dword; nDepth: longint; nBands: longint; pMins: Pdouble;
  pMaxs: Pdouble): Tlerc_status; cdecl; external liblerc;
function lerc_decode(pLercBlob: pbyte; blobSize: dword; nMasks: longint; pValidBytes: pbyte; nDepth: longint;
  nCols: longint; nRows: longint; nBands: longint; dataType: dword; pData: pointer): Tlerc_status; cdecl; external liblerc;
function lerc_decodeToDouble(pLercBlob: pbyte; blobSize: dword; nMasks: longint; pValidBytes: pbyte; nDepth: longint;
  nCols: longint; nRows: longint; nBands: longint; pData: Pdouble): Tlerc_status; cdecl; external liblerc;
function lerc_computeCompressedSize_4D(pData: pointer; dataType: dword; nDepth: longint; nCols: longint; nRows: longint;
  nBands: longint; nMasks: longint; pValidBytes: pbyte; maxZErr: double; numBytes: Pdword;
  pUsesNoData: pbyte; noDataValues: Pdouble): Tlerc_status; cdecl; external liblerc;
function lerc_encode_4D(pData: pointer; dataType: dword; nDepth: longint; nCols: longint; nRows: longint;
  nBands: longint; nMasks: longint; pValidBytes: pbyte; maxZErr: double; pOutBuffer: pbyte;
  outBufferSize: dword; nBytesWritten: Pdword; pUsesNoData: pbyte; noDataValues: Pdouble): Tlerc_status; cdecl; external liblerc;
function lerc_decode_4D(pLercBlob: pbyte; blobSize: dword; nMasks: longint; pValidBytes: pbyte; nDepth: longint;
  nCols: longint; nRows: longint; nBands: longint; dataType: dword; pData: pointer;
  pUsesNoData: pbyte; noDataValues: Pdouble): Tlerc_status; cdecl; external liblerc;
function lerc_decodeToDouble_4D(pLercBlob: pbyte; blobSize: dword; nMasks: longint; pValidBytes: pbyte; nDepth: longint;
  nCols: longint; nRows: longint; nBands: longint; pData: Pdouble; pUsesNoData: pbyte;
  noDataValues: Pdouble): Tlerc_status; cdecl; external liblerc;

// === Konventiert am: 3-9-26 17:41:21 ===

function LERC_COMPUTE_VERSION(maj, min, patch: longint): longint;
function LERC_VERSION_NUMBER: longint;
function LERC_AT_LEAST_VERSION(maj, min, patch: longint): Boolean;

implementation


function LERC_COMPUTE_VERSION(maj, min, patch: longint): longint;
begin
  LERC_COMPUTE_VERSION := ((maj * 10000) + (min * 100)) + patch;
end;

function LERC_VERSION_NUMBER: longint;
begin
  LERC_VERSION_NUMBER := LERC_COMPUTE_VERSION(LERC_VERSION_MAJOR, LERC_VERSION_MINOR, LERC_VERSION_PATCH);
end;

function LERC_AT_LEAST_VERSION(maj, min, patch: longint): Boolean;
begin
  LERC_AT_LEAST_VERSION := LERC_VERSION_NUMBER >= (LERC_COMPUTE_VERSION(maj, min, patch));
end;


end.
