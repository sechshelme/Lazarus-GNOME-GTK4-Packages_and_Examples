unit fp_lerc_c;

interface

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}



const
  LERC_VERSION_MAJOR = 4;  
  LERC_VERSION_MINOR = 0;  
  LERC_VERSION_PATCH = 0;  
{ Macro to compute a LERC version number from its components  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function LERC_COMPUTE_VERSION(maj,min,patch : longint) : longint;

{ Current LERC version from the above version numbers  }
{ was #define dname def_expr }
function LERC_VERSION_NUMBER : longint; { return type might be wrong }

{ Macro that returns true if the current LERC version is at least the version specified by (maj,min,patch)  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LERC_AT_LEAST_VERSION(maj,min,patch : longint) : longint;

type
  Plerc_status = ^Tlerc_status;
  Tlerc_status = dword;
{ raw image data, row by row, band by band }
{ char = 0, uchar = 1, short = 2, ushort = 3, int = 4, uint = 5, float = 6, double = 7 }
{ number of values per pixel (e.g., 3 for RGB, data is stored as [RGB, RGB, ...]) }
{ number of columns }
{ number of rows }
{ number of bands (e.g., 3 for [RRRR ..., GGGG ..., BBBB ...]) }
{ 0 - all valid, 1 - same mask for all bands, nBands - masks can differ between bands }
{ nullptr if all pixels are valid; otherwise 1 byte per pixel (1 = valid, 0 = invalid) }
{ max coding error per pixel, defines the precision }

function lerc_computeCompressedSize(pData:pointer; dataType:dword; nDepth:longint; nCols:longint; nRows:longint; 
           nBands:longint; nMasks:longint; pValidBytes:Pbyte; maxZErr:Tdouble; numBytes:Pdword):Tlerc_status;cdecl;external liblerc;
{ size of outgoing Lerc blob }
{! Encode the input data into a compressed Lerc blob. }
{ raw image data, row by row, band by band }
{ char = 0, uchar = 1, short = 2, ushort = 3, int = 4, uint = 5, float = 6, double = 7 }
{ number of values per pixel (e.g., 3 for RGB, data is stored as [RGB, RGB, ...]) }
{ number of columns }
{ number of rows }
{ number of bands (e.g., 3 for [RRRR ..., GGGG ..., BBBB ...]) }
{ 0 - all valid, 1 - same mask for all bands, nBands - masks can differ between bands }
{ nullptr if all pixels are valid; otherwise 1 byte per pixel (1 = valid, 0 = invalid) }
{ max coding error per pixel, defines the precision }
{ buffer to write to, function fails if buffer too small }
{ size of output buffer }
function lerc_encode(pData:pointer; dataType:dword; nDepth:longint; nCols:longint; nRows:longint; 
           nBands:longint; nMasks:longint; pValidBytes:Pbyte; maxZErr:Tdouble; pOutBuffer:Pbyte; 
           outBufferSize:dword; nBytesWritten:Pdword):Tlerc_status;cdecl;external liblerc;
{ number of bytes written to output buffer }
{! Use the 2 functions below to encode to an older codec version }
{ raw image data, row by row, band by band }
{ [2 .. 6] for [v2.2 .. v2.6], or -1 for latest codec v2.6 }
{ char = 0, uchar = 1, short = 2, ushort = 3, int = 4, uint = 5, float = 6, double = 7 }
{ number of values per pixel (e.g., 3 for RGB, data is stored as [RGB, RGB, ...]) }
{ number of columns }
{ number of rows }
{ number of bands (e.g., 3 for [RRRR ..., GGGG ..., BBBB ...]) }
{ 0 - all valid, 1 - same mask for all bands, nBands - masks can differ between bands }
{ nullptr if all pixels are valid; otherwise 1 byte per pixel (1 = valid, 0 = invalid) }
{ max coding error per pixel, defines the precision }
function lerc_computeCompressedSizeForVersion(pData:pointer; codecVersion:longint; dataType:dword; nDepth:longint; nCols:longint; 
           nRows:longint; nBands:longint; nMasks:longint; pValidBytes:Pbyte; maxZErr:Tdouble; 
           numBytes:Pdword):Tlerc_status;cdecl;external liblerc;
{ size of outgoing Lerc blob }
{ raw image data, row by row, band by band }
{ [2 .. 6] for [v2.2 .. v2.6], or -1 for latest codec v2.6 }
{ char = 0, uchar = 1, short = 2, ushort = 3, int = 4, uint = 5, float = 6, double = 7 }
{ number of values per pixel (e.g., 3 for RGB, data is stored as [RGB, RGB, ...]) }
{ number of columns }
{ number of rows }
{ number of bands (e.g., 3 for [RRRR ..., GGGG ..., BBBB ...]) }
{ 0 - all valid, 1 - same mask for all bands, nBands - masks can differ between bands }
{ nullptr if all pixels are valid; otherwise 1 byte per pixel (1 = valid, 0 = invalid) }
{ max coding error per pixel, defines the precision }
{ buffer to write to, function fails if buffer too small }
{ size of output buffer }
function lerc_encodeForVersion(pData:pointer; codecVersion:longint; dataType:dword; nDepth:longint; nCols:longint; 
           nRows:longint; nBands:longint; nMasks:longint; pValidBytes:Pbyte; maxZErr:Tdouble; 
           pOutBuffer:Pbyte; outBufferSize:dword; nBytesWritten:Pdword):Tlerc_status;cdecl;external liblerc;
{ number of bytes written to output buffer }
{! Call this to get info about the compressed Lerc blob. Optional. }
{! Info returned in infoArray is }
{!  version, dataType, nDepth, nCols, nRows, nBands, nValidPixels, blobSize, nMasks, nDepth, nUsesNoDataValue , see Lerc_types.h . }
{! Info returned in dataRangeArray is  zMin, zMax, maxZErrorUsed , see Lerc_types.h . }
{! If nDepth > 1 or nBands > 1 the data range [zMin, zMax] is over all values. }
{ Remark on function signature. The arrays to be filled may grow in future versions. In order not to break }
{ existing code, the function fills these arrays only up to their allocated size. }
{ Remark on param blobSize. Usually it is known, either the file size of the blob written to disk, }
{ or the size of the blob transmitted. It should be passed accurately for 2 reasons: }
{ _ function finds out how many single band Lerc blobs are concatenated, if any }
{ _ function checks for truncated file or blob }
{ It is OK to pass blobSize too large as long as there is no other (valid) Lerc blob following next. }
{ If in doubt, check the code in Lerc::GetLercInfo(...) for the exact logic. }
{ Lerc blob to decode }
{ blob size in bytes }
{ info array with all info needed to allocate the outgoing arrays for calling decode }
{ quick access to overall data range [zMin, zMax] without having to decode the data }
{ number of elements of infoArray }
function lerc_getBlobInfo(pLercBlob:Pbyte; blobSize:dword; infoArray:Pdword; dataRangeArray:Pdouble; infoArraySize:longint; 
           dataRangeArraySize:longint):Tlerc_status;cdecl;external liblerc;
{ number of elements of dataRangeArray }
{! Call this to quickly get the data ranges [min, max] per dimension and band without having to decode the pixels. Optional. }
{! The 2 output data arrays must have been allocated to the same size (nDepth * nBands). }
{! The output data array's layout is an image with nDepth columns and nBands rows. }
{ Lerc blob to decode }
{ blob size in bytes }
{ number of values per pixel (e.g., 3 for RGB, data is stored as [RGB, RGB, ...]) }
{ number of bands (e.g., 3 for [RRRR ..., GGGG ..., BBBB ...]) }
{ outgoing minima per dimension and band }
function lerc_getDataRanges(pLercBlob:Pbyte; blobSize:dword; nDepth:longint; nBands:longint; pMins:Pdouble; 
           pMaxs:Pdouble):Tlerc_status;cdecl;external liblerc;
{ outgoing maxima per dimension and band }
{! Decode the compressed Lerc blob into a raw data array. }
{! The data array must have been allocated to size (nDepth * nCols * nRows * nBands * sizeof(dataType)). }
{! The valid pixels array, if not all pixels valid, must have been allocated to size (nCols * nRows * nMasks). }
{ Lerc blob to decode }
{ blob size in bytes }
{ 0, 1, or nBands; return as many masks in the next array }
{ gets filled if not nullptr, even if all valid }
{ number of values per pixel (e.g., 3 for RGB, data is stored as [RGB, RGB, ...]) }
{ number of columns }
{ number of rows }
{ number of bands (e.g., 3 for [RRRR ..., GGGG ..., BBBB ...]) }
{ char = 0, uchar = 1, short = 2, ushort = 3, int = 4, uint = 5, float = 6, double = 7 }
function lerc_decode(pLercBlob:Pbyte; blobSize:dword; nMasks:longint; pValidBytes:Pbyte; nDepth:longint; 
           nCols:longint; nRows:longint; nBands:longint; dataType:dword; pData:pointer):Tlerc_status;cdecl;external liblerc;
{ outgoing data array }
{! Same as above, but decode into double array independent of compressed data type. }
{! Wasteful in memory, but convenient if a caller from Python or C# does not want to deal with }
{! data type conversion, templating, or casting. }
{! Should this api be extended to new data types that don't fit into a double such as int64, }
{! then this function will fail for such compressed data types. }
{ Lerc blob to decode }
{ blob size in bytes }
{ 0, 1, or nBands; return as many masks in the next array }
{ gets filled if not nullptr, even if all valid }
{ number of values per pixel (e.g., 3 for RGB, data is stored as [RGB, RGB, ...]) }
{ number of columns }
{ number of rows }
{ number of bands (e.g., 3 for [RRRR ..., GGGG ..., BBBB ...]) }
function lerc_decodeToDouble(pLercBlob:Pbyte; blobSize:dword; nMasks:longint; pValidBytes:Pbyte; nDepth:longint; 
           nCols:longint; nRows:longint; nBands:longint; pData:Pdouble):Tlerc_status;cdecl;external liblerc;
{ outgoing data array }
{! Added in version 4.0: }
{! }
{! The 4 functions below are new. The main purpose (and difference to the functions above) is to support, for 3D and 4D data,  }
{! the special case of a mix of valid and invalid values at the same pixel.  }
{!  }
{! Main idea: Lerc has the property that for each 8x8 pixel block the minimum value is always encoded lossless in the block header.  }
{! To enable lossy encoding in the presence of noData values, the original noData value is mapped below the range of the valid values, }
{! if possible. If not possible, it switches to lossless. On decode, that temporary noData value gets mapped back to the original }
{! noData value.  }
{!  }
{! To minimize the occurence of noData values (and for better compression), Lerc tries to move noData values to the byte mask  }
{! wherever possible (e.g., all values at some pixel are invalid). So for a given band the noData values may disappear and get }
{! all moved to the byte mask. Decode only returns a noData value if it is really used. In that case the caller needs to filter }
{! the decoded arrays using both the byte mask returned and the noData value returned.  }
{!  }
{! In addition to the noData support, the new functions can also take integer values > 32 bit (but < 53 bit) as a double array,  }
{! and if all integer, use that for compression.  }
{! }
{! If floating point data contains NaN, Lerc tries to move it to the byte mask or replace it by a passed noData value.  }
{! Note, if not all NaN values can be moved to the mask (mixed case), and no noData value was passed, Lerc will fail.  }
{! It would be wrong to invent a noData value on the tile level.  }
{! Encode functions: }
{! }
{! If you don't use a noData value, are fine with the byte masks, just pass nullptr for the last 2 arguments.  }
{!  }
{! If you do have noData values at pixels that are marked as valid pixels by the byte mask,  }
{! pass 2 arrays of size nBands each, one value per band.  }
{! In pUsesNoData array, for each band, pass 1 for noData value is used, 0 if not. }
{! In noDataValues array, for each band, pass the noData value if there is one.  }
{ raw image data, row by row, band by band }
{ char = 0, uchar = 1, short = 2, ushort = 3, int = 4, uint = 5, float = 6, double = 7 }
{ number of values per pixel (e.g., 3 for RGB, data is stored as [RGB, RGB, ...]) }
{ number of columns }
{ number of rows }
{ number of bands (e.g., 3 for [RRRR ..., GGGG ..., BBBB ...]) }
{ 0 - all valid, 1 - same mask for all bands, nBands - masks can differ between bands }
{ nullptr if all pixels are valid; otherwise 1 byte per pixel (1 = valid, 0 = invalid) }
{ max coding error per pixel, defines the precision }
{ size of outgoing Lerc blob }
{ if there are invalid values not marked by the mask, pass an array of size nBands, 1 - uses noData, 0 - not }
function lerc_computeCompressedSize_4D(pData:pointer; dataType:dword; nDepth:longint; nCols:longint; nRows:longint; 
           nBands:longint; nMasks:longint; pValidBytes:Pbyte; maxZErr:Tdouble; numBytes:Pdword; 
           pUsesNoData:Pbyte; noDataValues:Pdouble):Tlerc_status;cdecl;external liblerc;
{ same, pass an array of size nBands with noData value per band, or pass nullptr }
{ raw image data, row by row, band by band }
{ char = 0, uchar = 1, short = 2, ushort = 3, int = 4, uint = 5, float = 6, double = 7 }
{ number of values per pixel (e.g., 3 for RGB, data is stored as [RGB, RGB, ...]) }
{ number of columns }
{ number of rows }
{ number of bands (e.g., 3 for [RRRR ..., GGGG ..., BBBB ...]) }
{ 0 - all valid, 1 - same mask for all bands, nBands - masks can differ between bands }
{ nullptr if all pixels are valid; otherwise 1 byte per pixel (1 = valid, 0 = invalid) }
{ max coding error per pixel, defines the precision }
{ buffer to write to, function fails if buffer too small }
{ size of output buffer }
{ number of bytes written to output buffer }
{ if there are invalid values not marked by the mask, pass an array of size nBands, 1 - uses noData, 0 - not }
function lerc_encode_4D(pData:pointer; dataType:dword; nDepth:longint; nCols:longint; nRows:longint; 
           nBands:longint; nMasks:longint; pValidBytes:Pbyte; maxZErr:Tdouble; pOutBuffer:Pbyte; 
           outBufferSize:dword; nBytesWritten:Pdword; pUsesNoData:Pbyte; noDataValues:Pdouble):Tlerc_status;cdecl;external liblerc;
{ same, pass an array of size nBands with noData value per band, or pass nullptr }
{! Decode functions: }
{! }
{! Same as for regular decode, first call lerc_getBlobInfo() to get all info needed from the blob header.  }
{! Check the property (InfoArray::nUsesNoDataValue) to check if there is any noData value used.  }
{! }
{! If not, just pass nullptr for the last 2 arguments.  }
{!  }
{! If yes, pass 2 arrays of size nBands each, one value per band.  }
{! In pUsesNoData array, for each band, 1 means a noData value is used, 0 means not. }
{! In noDataValues array, for each band, it has the noData value if there is one.  }
{! This is the same noData value as passed for encode.  }
{ Lerc blob to decode }
{ blob size in bytes }
{ 0, 1, or nBands; return as many masks in the next array }
{ gets filled if not nullptr, even if all valid }
{ number of values per pixel (e.g., 3 for RGB, data is stored as [RGB, RGB, ...]) }
{ number of columns }
{ number of rows }
{ number of bands (e.g., 3 for [RRRR ..., GGGG ..., BBBB ...]) }
{ char = 0, uchar = 1, short = 2, ushort = 3, int = 4, uint = 5, float = 6, double = 7 }
{ outgoing data array }
{ pass an array of size nBands, 1 - band uses noData, 0 - not }
function lerc_decode_4D(pLercBlob:Pbyte; blobSize:dword; nMasks:longint; pValidBytes:Pbyte; nDepth:longint; 
           nCols:longint; nRows:longint; nBands:longint; dataType:dword; pData:pointer; 
           pUsesNoData:Pbyte; noDataValues:Pdouble):Tlerc_status;cdecl;external liblerc;
{ same, pass an array of size nBands to get the noData value per band, if any }
{ Lerc blob to decode }
{ blob size in bytes }
{ 0, 1, or nBands; return as many masks in the next array }
{ gets filled if not nullptr, even if all valid }
{ number of values per pixel (e.g., 3 for RGB, data is stored as [RGB, RGB, ...]) }
{ number of columns }
{ number of rows }
{ number of bands (e.g., 3 for [RRRR ..., GGGG ..., BBBB ...]) }
{ outgoing data array }
{ pass an array of size nBands, 1 - band uses noData, 0 - not }
function lerc_decodeToDouble_4D(pLercBlob:Pbyte; blobSize:dword; nMasks:longint; pValidBytes:Pbyte; nDepth:longint; 
           nCols:longint; nRows:longint; nBands:longint; pData:Pdouble; pUsesNoData:Pbyte; 
           noDataValues:Pdouble):Tlerc_status;cdecl;external liblerc;
{ same, pass an array of size nBands to get the noData value per band, if any }
{ C++ end of extern C conditionnal removed }
{$endif}
{ LERC_API_INCLUDE_GUARD }

// === Konventiert am: 3-9-26 17:41:21 ===


implementation


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LERC_COMPUTE_VERSION(maj,min,patch : longint) : longint;
begin
  LERC_COMPUTE_VERSION:=((maj*10000)+(min*100))+patch;
end;

{ was #define dname def_expr }
function LERC_VERSION_NUMBER : longint; { return type might be wrong }
  begin
    LERC_VERSION_NUMBER:=LERC_COMPUTE_VERSION(LERC_VERSION_MAJOR,LERC_VERSION_MINOR,LERC_VERSION_PATCH);
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LERC_AT_LEAST_VERSION(maj,min,patch : longint) : longint;
begin
  LERC_AT_LEAST_VERSION:=LERC_VERSION_NUMBER>=(LERC_COMPUTE_VERSION(maj,min,patch));
end;


end.
