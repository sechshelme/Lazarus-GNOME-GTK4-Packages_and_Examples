unit fp_zfp;

interface

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
** Copyright (c) 2014-2023, Lawrence Livermore National Security, LLC and
** other zfp project contributors. See the top-level LICENSE file for details.
** SPDX-License-Identifier: BSD-3-Clause
 }
{$ifndef ZFP_H}
{$define ZFP_H}
{$include "zfp/bitstream.h"}
{$include "zfp/version.h"}
{$include "zfp/internal/zfp/system.h"}
{$include "zfp/internal/zfp/types.h"}
{ macros ------------------------------------------------------------------  }
{ default compression parameters  }
{ minimum number of bits per block  }

const
  ZFP_MIN_BITS = 1;  
{ maximum number of bits per block  }
  ZFP_MAX_BITS = 16658;  
{ maximum precision supported  }
  ZFP_MAX_PREC = 64;  
{ minimum floating-point base-2 exponent  }
  ZFP_MIN_EXP = -(1074);  
{ header masks (enable via bitwise or; reader must use same mask)  }
{ no header  }
  ZFP_HEADER_NONE = $0;  
{ embed 64-bit magic  }
  ZFP_HEADER_MAGIC = $1;  
{ embed 52-bit field metadata  }
  ZFP_HEADER_META = $2;  
{ embed 12- or 64-bit compression mode  }
  ZFP_HEADER_MODE = $4;  
{ embed all of the above  }
  ZFP_HEADER_FULL = $7;  
{ bit masks for specifying storage class  }
{ allocated but unused storage  }
  ZFP_DATA_UNUSED = $01;  
{ padding for alignment purposes  }
  ZFP_DATA_PADDING = $02;  
{ class members and other fixed-size storage  }
  ZFP_DATA_META = $04;  
{ miscellaneous uncategorized storage  }
  ZFP_DATA_MISC = $08;  
{ compressed data  }
  ZFP_DATA_PAYLOAD = $10;  
{ variable-rate block index information  }
  ZFP_DATA_INDEX = $20;  
{ uncompressed cached data  }
  ZFP_DATA_CACHE = $40;  
{ header information  }
  ZFP_DATA_HEADER = $80;  
{ all storage  }
  ZFP_DATA_ALL = $ff;  
{ field metadata indeterminate state and error code  }

{ was #define dname def_expr }
function ZFP_META_NULL : longint; { return type might be wrong }

{ number of bits per header entry  }
{ number of magic word bits  }
const
  ZFP_MAGIC_BITS = 32;  
{ number of field metadata bits  }
  ZFP_META_BITS = 52;  
{ number of mode bits in short format  }
  ZFP_MODE_SHORT_BITS = 12;  
{ number of mode bits in long format  }
  ZFP_MODE_LONG_BITS = 64;  
{ max number of header bits  }
  ZFP_HEADER_MAX_BITS = 148;  
  ZFP_MODE_SHORT_MAX = (1 shl ZFP_MODE_SHORT_BITS)-2;  
{ rounding mode for reducing bias; see build option ZFP_ROUNDING_MODE  }
{ round during compression  }
  ZFP_ROUND_FIRST = -(1);  
{ never round  }
  ZFP_ROUND_NEVER = 0;  
{ round during decompression  }
  ZFP_ROUND_LAST = 1;  
{ types -------------------------------------------------------------------  }
{ Boolean constants  }
{ false  }
{ true  }
type
  Txxxxxx =  Longint;
  Const
    zfp_false = 0;
    zfp_true =  not (zfp_false);

type
  Pzfp_bool = ^Tzfp_bool;
  Tzfp_bool = longint;
{ Boolean type  }
{ execution policy  }
{ serial execution (default)  }
{ OpenMP multi-threaded execution  }
{ CUDA parallel execution  }

  Pzfp_exec_policy = ^Tzfp_exec_policy;
  Tzfp_exec_policy =  Longint;
  Const
    zfp_exec_serial = 0;
    zfp_exec_omp = 1;
    zfp_exec_cuda = 2;
;
{ OpenMP execution parameters  }
{ number of requested threads  }
{ number of blocks per chunk (1D only)  }
type
  Pzfp_exec_params_omp = ^Tzfp_exec_params_omp;
  Tzfp_exec_params_omp = record
      threads : Tuint;
      chunk_size : Tuint;
    end;
{ execution policy (serial, omp, ...)  }
{ execution parameters  }

  Pzfp_execution = ^Tzfp_execution;
  Tzfp_execution = record
      policy : Tzfp_exec_policy;
      params : pointer;
    end;
{ compressed stream; use accessors to get/set members  }
{ minimum number of bits to store per block  }
{ maximum number of bits to store per block  }
{ maximum number of bit planes to store  }
{ minimum floating point bit plane number to store  }
{ compressed bit stream  }
{ execution policy and parameters  }

  Pzfp_stream = ^Tzfp_stream;
  Tzfp_stream = record
      minbits : Tuint;
      maxbits : Tuint;
      maxprec : Tuint;
      minexp : longint;
      stream : Pbitstream;
      exec : Tzfp_execution;
    end;
{ compression mode  }
{ an invalid configuration of the 4 params  }
{ expert mode (4 params set manually)  }
{ fixed rate mode  }
{ fixed precision mode  }
{ fixed accuracy mode  }
{ reversible (lossless) mode  }

  Pzfp_mode = ^Tzfp_mode;
  Tzfp_mode =  Longint;
  Const
    zfp_mode_null = 0;
    zfp_mode_expert = 1;
    zfp_mode_fixed_rate = 2;
    zfp_mode_fixed_precision = 3;
    zfp_mode_fixed_accuracy = 4;
    zfp_mode_reversible = 5;
;
{ compression mode and parameter settings  }
{ compression mode  }
{ compressed bits/value (negative for word alignment)  }
{ uncompressed bits/value  }
{ absolute error tolerance  }
{ min number of compressed bits/block  }
{ max number of compressed bits/block  }
{ max number of uncompressed bits/value  }
{ min floating point bit plane number to store  }
{ expert mode arguments  }
{ arguments corresponding to compression mode  }
type
  Pzfp_config = ^Tzfp_config;
  Tzfp_config = record
      mode : Tzfp_mode;
      arg : record
          case longint of
            0 : ( rate : Tdouble );
            1 : ( precision : Tuint );
            2 : ( tolerance : Tdouble );
            3 : ( expert : record
                minbits : Tuint;
                maxbits : Tuint;
                maxprec : Tuint;
                minexp : longint;
              end );
          end;
    end;
{ scalar type  }
{ unspecified type  }
{ 32-bit signed integer  }
{ 64-bit signed integer  }
{ single precision floating point  }
{ double precision floating point  }

  Pzfp_type = ^Tzfp_type;
  Tzfp_type =  Longint;
  Const
    zfp_type_none = 0;
    zfp_type_int32 = 1;
    zfp_type_int64 = 2;
    zfp_type_float = 3;
    zfp_type_double = 4;
;
{ uncompressed array; use accessors to get/set members  }
{ scalar type (e.g. int32, double)  }
{ sizes (zero for unused dimensions)  }
{ strides (zero for contiguous array a[nw][nz][ny][nx])  }
{ pointer to array data  }
type
  Pzfp_field = ^Tzfp_field;
  Tzfp_field = record
      _type : Tzfp_type;
      nx : Tsize_t;
      ny : Tsize_t;
      nz : Tsize_t;
      nw : Tsize_t;
      sx : Tptrdiff_t;
      sy : Tptrdiff_t;
      sz : Tptrdiff_t;
      sw : Tptrdiff_t;
      data : pointer;
    end;
{ C++ extern C conditionnal removed }
{ public data -------------------------------------------------------------  }
  var
    zfp_codec_version : Tuint;cvar;external libzfp;
{ codec version ZFP_CODEC  }
    zfp_library_version : Tuint;cvar;external libzfp;
{ library version ZFP_VERSION  }
    zfp_version_string : Pchar;cvar;external libzfp;
{ verbose version string  }
{ high-level API: utility functions ---------------------------------------  }
{ byte size of scalar type  }
{ scalar type  }

function zfp_type_size(_type:Tzfp_type):Tsize_t;cdecl;external libzfp;
{ high-level API: compressed stream construction/destruction --------------  }
{ open compressed stream and associate with bit stream  }
{ allocated compressed stream  }
{ bit stream to read from and write to (may be NULL)  }
function zfp_stream_open(stream:Pbitstream):Pzfp_stream;cdecl;external libzfp;
{ close and deallocate compressed stream (does not affect bit stream)  }
{ compressed stream  }
procedure zfp_stream_close(stream:Pzfp_stream);cdecl;external libzfp;
{ high-level API: compressed stream inspectors ----------------------------  }
{ bit stream associated with compressed stream  }
{ bit stream associated with compressed stream  }
{ compressed stream  }
function zfp_stream_bit_stream(stream:Pzfp_stream):Pbitstream;cdecl;external libzfp;
{ enumerated compression mode  }
{ compression mode or zfp_mode_null if not set  }
{ compressed stream  }
function zfp_stream_compression_mode(stream:Pzfp_stream):Tzfp_mode;cdecl;external libzfp;
{ rate in compressed bits/scalar (when in fixed-rate mode)  }
{ rate or zero upon failure  }
{ compressed stream  }
{ array dimensionality (1, 2, 3, or 4)  }
function zfp_stream_rate(stream:Pzfp_stream; dims:Tuint):Tdouble;cdecl;external libzfp;
{ precision in uncompressed bits/scalar (when in fixed-precision mode)  }
{ precision or zero upon failure  }
{ compressed stream  }
function zfp_stream_precision(stream:Pzfp_stream):Tuint;cdecl;external libzfp;
{ accuracy as absolute error tolerance (when in fixed-accuracy mode)  }
{ tolerance or zero upon failure  }
{ compressed stream  }
function zfp_stream_accuracy(stream:Pzfp_stream):Tdouble;cdecl;external libzfp;
{ get all compression parameters in a compact representation  }
{ 12- or 64-bit encoding of parameters  }
{ compressed stream  }
function zfp_stream_mode(stream:Pzfp_stream):Tuint64;cdecl;external libzfp;
{ get all compression parameters (pointers may be NULL)  }
{ compressed stream  }
{ minimum number of bits per 4^d block  }
{ maximum number of bits per 4^d block  }
{ maximum precision (# bit planes coded)  }
{ minimum base-2 exponent; error <= 2^minexp  }
procedure zfp_stream_params(stream:Pzfp_stream; minbits:Puint; maxbits:Puint; maxprec:Puint; minexp:Plongint);cdecl;external libzfp;
{ byte size of sequentially compressed stream (call after compression)  }
{ actual number of bytes of compressed storage  }
{ compressed stream  }
function zfp_stream_compressed_size(stream:Pzfp_stream):Tsize_t;cdecl;external libzfp;
{ conservative estimate of compressed size in bytes  }
{ maximum number of bytes of compressed storage  }
{ compressed stream  }
{ array to compress  }
function zfp_stream_maximum_size(stream:Pzfp_stream; field:Pzfp_field):Tsize_t;cdecl;external libzfp;
{ high-level API: initialization of compressed stream parameters ----------  }
{ rewind bit stream to beginning for compression or decompression  }
{ compressed bit stream  }
procedure zfp_stream_rewind(stream:Pzfp_stream);cdecl;external libzfp;
{ associate bit stream with compressed stream  }
{ compressed stream  }
{ bit stream to read from and write to  }
procedure zfp_stream_set_bit_stream(stream:Pzfp_stream; bs:Pbitstream);cdecl;external libzfp;
{ enable reversible (lossless) compression  }
{ compressed stream  }
procedure zfp_stream_set_reversible(stream:Pzfp_stream);cdecl;external libzfp;
{ set size in compressed bits/scalar (fixed-rate mode)  }
{ actual rate in compressed bits/scalar  }
{ compressed stream  }
{ desired rate in compressed bits/scalar  }
{ scalar type to compress  }
{ array dimensionality (1, 2, 3, or 4)  }
{ word-aligned blocks, e.g., for write random access  }
function zfp_stream_set_rate(stream:Pzfp_stream; rate:Tdouble; _type:Tzfp_type; dims:Tuint; align:Tzfp_bool):Tdouble;cdecl;external libzfp;
{ set precision in uncompressed bits/scalar (fixed-precision mode)  }
{ actual precision  }
{ compressed stream  }
{ desired precision in uncompressed bits/scalar  }
function zfp_stream_set_precision(stream:Pzfp_stream; precision:Tuint):Tuint;cdecl;external libzfp;
{ set accuracy as absolute error tolerance (fixed-accuracy mode)  }
{ actual error tolerance  }
{ compressed stream  }
{ desired error tolerance  }
function zfp_stream_set_accuracy(stream:Pzfp_stream; tolerance:Tdouble):Tdouble;cdecl;external libzfp;
{ set parameters from compact encoding; leaves stream intact on failure  }
{ compression mode or zfp_mode_null upon failure  }
{ compressed stream  }
{ 12- or 64-bit encoding of parameters  }
function zfp_stream_set_mode(stream:Pzfp_stream; mode:Tuint64):Tzfp_mode;cdecl;external libzfp;
{ set all parameters (expert mode); leaves stream intact on failure  }
{ true upon success  }
{ compressed stream  }
{ minimum number of bits per 4^d block  }
{ maximum number of bits per 4^d block  }
{ maximum precision (# bit planes coded)  }
{ minimum base-2 exponent; error <= 2^minexp  }
function zfp_stream_set_params(stream:Pzfp_stream; minbits:Tuint; maxbits:Tuint; maxprec:Tuint; minexp:longint):Tzfp_bool;cdecl;external libzfp;
{ high-level API: execution policy ----------------------------------------  }
{ current execution policy  }
{ compressed stream  }
function zfp_stream_execution(stream:Pzfp_stream):Tzfp_exec_policy;cdecl;external libzfp;
{ number of OpenMP threads to use  }
{ number of threads (0 for default)  }
{ compressed stream  }
function zfp_stream_omp_threads(stream:Pzfp_stream):Tuint;cdecl;external libzfp;
{ number of blocks per OpenMP chunk (1D only)  }
{ number of blocks per chunk (0 for default)  }
{ compressed stream  }
function zfp_stream_omp_chunk_size(stream:Pzfp_stream):Tuint;cdecl;external libzfp;
{ set execution policy  }
{ true upon success  }
{ compressed stream  }
{ execution policy  }
function zfp_stream_set_execution(stream:Pzfp_stream; policy:Tzfp_exec_policy):Tzfp_bool;cdecl;external libzfp;
{ set OpenMP execution policy and number of threads  }
{ true upon success  }
{ compressed stream  }
{ number of OpenMP threads to use (0 for default)  }
function zfp_stream_set_omp_threads(stream:Pzfp_stream; threads:Tuint):Tzfp_bool;cdecl;external libzfp;
{ set OpenMP execution policy and number of blocks per chunk (1D only)  }
{ true upon success  }
{ compressed stream  }
{ number of blocks per chunk (0 for default)  }
function zfp_stream_set_omp_chunk_size(stream:Pzfp_stream; chunk_size:Tuint):Tzfp_bool;cdecl;external libzfp;
{ high-level API: compression mode and parameter settings -----------------  }
{ unspecified configuration  }
{ compression mode and parameter settings  }
function zfp_config_none:Tzfp_config;cdecl;external libzfp;
{ fixed-rate configuration  }
{ compression mode and parameter settings  }
{ desired rate in compressed bits/scalar  }
{ word-aligned blocks, e.g., for write random access  }
function zfp_config_rate(rate:Tdouble; align:Tzfp_bool):Tzfp_config;cdecl;external libzfp;
{ fixed-precision configuration  }
{ compression mode and parameter settings  }
{ desired precision in uncompressed bits/scalar  }
function zfp_config_precision(precision:Tuint):Tzfp_config;cdecl;external libzfp;
{ fixed-accuracy configuration  }
{ compression mode and parameter settings  }
{ desired error tolerance  }
function zfp_config_accuracy(tolerance:Tdouble):Tzfp_config;cdecl;external libzfp;
{ reversible (lossless) configuration  }
{ compression mode and parameter settings  }
function zfp_config_reversible:Tzfp_config;cdecl;external libzfp;
{ expert configuration  }
{ compression mode and parameter settings  }
{ minimum number of bits per 4^d block  }
{ maximum number of bits per 4^d block  }
{ maximum precision (# bit planes coded)  }
{ minimum base-2 exponent; error <= 2^minexp  }
function zfp_config_expert(minbits:Tuint; maxbits:Tuint; maxprec:Tuint; minexp:longint):Tzfp_config;cdecl;external libzfp;
{ high-level API: uncompressed array construction/destruction -------------  }
{ allocate field struct  }
{ pointer to default initialized field  }
function zfp_field_alloc:Pzfp_field;cdecl;external libzfp;
{ allocate metadata for 1D field f[nx]  }
{ allocated field metadata  }
{ pointer to uncompressed scalars (may be NULL)  }
{ scalar type  }
{ number of scalars  }
function zfp_field_1d(pointer:pointer; _type:Tzfp_type; nx:Tsize_t):Pzfp_field;cdecl;external libzfp;
{ allocate metadata for 2D field f[ny][nx]  }
{ allocated field metadata  }
{ pointer to uncompressed scalars (may be NULL)  }
{ scalar type  }
{ number of scalars in x dimension  }
{ number of scalars in y dimension  }
function zfp_field_2d(pointer:pointer; _type:Tzfp_type; nx:Tsize_t; ny:Tsize_t):Pzfp_field;cdecl;external libzfp;
{ allocate metadata for 3D field f[nz][ny][nx]  }
{ allocated field metadata  }
{ pointer to uncompressed scalars (may be NULL)  }
{ scalar type  }
{ number of scalars in x dimension  }
{ number of scalars in y dimension  }
{ number of scalars in z dimension  }
function zfp_field_3d(pointer:pointer; _type:Tzfp_type; nx:Tsize_t; ny:Tsize_t; nz:Tsize_t):Pzfp_field;cdecl;external libzfp;
{ allocate metadata for 4D field f[nw][nz][ny][nx]  }
{ allocated field metadata  }
{ pointer to uncompressed scalars (may be NULL)  }
{ scalar type  }
{ number of scalars in x dimension  }
{ number of scalars in y dimension  }
{ number of scalars in z dimension  }
{ number of scalars in w dimension  }
function zfp_field_4d(pointer:pointer; _type:Tzfp_type; nx:Tsize_t; ny:Tsize_t; nz:Tsize_t; 
           nw:Tsize_t):Pzfp_field;cdecl;external libzfp;
{ deallocate field metadata  }
{ field metadata  }
procedure zfp_field_free(field:Pzfp_field);cdecl;external libzfp;
{ high-level API: uncompressed array inspectors ---------------------------  }
{ pointer to first scalar in field  }
{ array pointer  }
{ field metadata  }
function zfp_field_pointer(field:Pzfp_field):pointer;cdecl;external libzfp;
{ pointer to lowest memory address spanned by field  }
{ field metadata  }
function zfp_field_begin(field:Pzfp_field):pointer;cdecl;external libzfp;
{ field scalar type  }
{ scalar type  }
{ field metadata  }
function zfp_field_type(field:Pzfp_field):Tzfp_type;cdecl;external libzfp;
{ precision of field scalar type  }
{ scalar type precision in number of bits  }
{ field metadata  }
function zfp_field_precision(field:Pzfp_field):Tuint;cdecl;external libzfp;
{ field dimensionality (1, 2, 3, or 4)  }
{ number of dimensions  }
{ field metadata  }
function zfp_field_dimensionality(field:Pzfp_field):Tuint;cdecl;external libzfp;
{ field size in number of scalars  }
{ total number of scalars  }
{ field metadata  }
{ number of scalars per dimension (may be NULL)  }
function zfp_field_size(field:Pzfp_field; size:Psize_t):Tsize_t;cdecl;external libzfp;
{ number of bytes spanned by field data including gaps (if any)  }
{ field metadata  }
function zfp_field_size_bytes(field:Pzfp_field):Tsize_t;cdecl;external libzfp;
{ field size in number of blocks  }
{ total number of blocks  }
{ field metadata  }
function zfp_field_blocks(field:Pzfp_field):Tsize_t;cdecl;external libzfp;
{ field strides per dimension  }
{ true if array is not contiguous  }
{ field metadata  }
{ stride in scalars per dimension (may be NULL)  }
function zfp_field_stride(field:Pzfp_field; stride:Pptrdiff_t):Tzfp_bool;cdecl;external libzfp;
{ field contiguity test  }
{ true if field layout is contiguous  }
{ field metadata  }
function zfp_field_is_contiguous(field:Pzfp_field):Tzfp_bool;cdecl;external libzfp;
{ field scalar type and dimensions  }
{ compact 52-bit encoding of metadata  }
{ field metadata  }
function zfp_field_metadata(field:Pzfp_field):Tuint64;cdecl;external libzfp;
{ high-level API: uncompressed array specification ------------------------  }
{ set pointer to first scalar in field  }
{ field metadata  }
{ pointer to first scalar  }
procedure zfp_field_set_pointer(field:Pzfp_field; pointer:pointer);cdecl;external libzfp;
{ set field scalar type  }
{ actual scalar type  }
{ field metadata  }
{ desired scalar type  }
function zfp_field_set_type(field:Pzfp_field; _type:Tzfp_type):Tzfp_type;cdecl;external libzfp;
{ set 1D field size  }
{ field metadata  }
{ number of scalars  }
procedure zfp_field_set_size_1d(field:Pzfp_field; nx:Tsize_t);cdecl;external libzfp;
{ set 2D field size  }
{ field metadata  }
{ number of scalars in x dimension  }
{ number of scalars in y dimension  }
procedure zfp_field_set_size_2d(field:Pzfp_field; nx:Tsize_t; ny:Tsize_t);cdecl;external libzfp;
{ set 3D field size  }
{ field metadata  }
{ number of scalars in x dimension  }
{ number of scalars in y dimension  }
{ number of scalars in z dimension  }
procedure zfp_field_set_size_3d(field:Pzfp_field; nx:Tsize_t; ny:Tsize_t; nz:Tsize_t);cdecl;external libzfp;
{ set 4D field size  }
{ field metadata  }
{ number of scalars in x dimension  }
{ number of scalars in y dimension  }
{ number of scalars in z dimension  }
{ number of scalars in w dimension  }
procedure zfp_field_set_size_4d(field:Pzfp_field; nx:Tsize_t; ny:Tsize_t; nz:Tsize_t; nw:Tsize_t);cdecl;external libzfp;
{ set 1D field stride in number of scalars  }
{ field metadata  }
{ stride in number of scalars: &f[1] - &f[0]  }
procedure zfp_field_set_stride_1d(field:Pzfp_field; sx:Tptrdiff_t);cdecl;external libzfp;
{ set 2D field strides in number of scalars  }
{ field metadata  }
{ stride in x dimension: &f[0][1] - &f[0][0]  }
{ stride in y dimension: &f[1][0] - &f[0][0]  }
procedure zfp_field_set_stride_2d(field:Pzfp_field; sx:Tptrdiff_t; sy:Tptrdiff_t);cdecl;external libzfp;
{ set 3D field strides in number of scalars  }
{ field metadata  }
{ stride in x dimension: &f[0][0][1] - &f[0][0][0]  }
{ stride in y dimension: &f[0][1][0] - &f[0][0][0]  }
{ stride in z dimension: &f[1][0][0] - &f[0][0][0]  }
procedure zfp_field_set_stride_3d(field:Pzfp_field; sx:Tptrdiff_t; sy:Tptrdiff_t; sz:Tptrdiff_t);cdecl;external libzfp;
{ set 4D field strides in number of scalars  }
{ field metadata  }
{ stride in x dimension: &f[0][0][0][1] - &f[0][0][0][0]  }
{ stride in y dimension: &f[0][0][1][0] - &f[0][0][0][0]  }
{ stride in z dimension: &f[0][1][0][0] - &f[0][0][0][0]  }
{ stride in w dimension: &f[1][0][0][0] - &f[0][0][0][0]  }
procedure zfp_field_set_stride_4d(field:Pzfp_field; sx:Tptrdiff_t; sy:Tptrdiff_t; sz:Tptrdiff_t; sw:Tptrdiff_t);cdecl;external libzfp;
{ set field scalar type and dimensions  }
{ true upon success  }
{ field metadata  }
{ compact 52-bit encoding of metadata  }
function zfp_field_set_metadata(field:Pzfp_field; meta:Tuint64):Tzfp_bool;cdecl;external libzfp;
{ high-level API: compression and decompression ---------------------------  }
{ compress entire field (nonzero return value upon success)  }
{ cumulative number of bytes of compressed storage  }
{ compressed stream  }
{ field metadata  }
function zfp_compress(stream:Pzfp_stream; field:Pzfp_field):Tsize_t;cdecl;external libzfp;
{ decompress entire field (nonzero return value upon success)  }
{ cumulative number of bytes of compressed storage  }
{ compressed stream  }
{ field metadata  }
function zfp_decompress(stream:Pzfp_stream; field:Pzfp_field):Tsize_t;cdecl;external libzfp;
{ write compression parameters and field metadata (optional)  }
{ number of bits written or zero upon failure  }
{ compressed stream  }
{ field metadata  }
{ information to write  }
function zfp_write_header(stream:Pzfp_stream; field:Pzfp_field; mask:Tuint):Tsize_t;cdecl;external libzfp;
{ read compression parameters and field metadata when previously written  }
{ number of bits read or zero upon failure  }
{ compressed stream  }
{ field metadata  }
{ information to read  }
function zfp_read_header(stream:Pzfp_stream; field:Pzfp_field; mask:Tuint):Tsize_t;cdecl;external libzfp;
{ low-level API: stream manipulation --------------------------------------  }
{ flush bit stream--must be called after last encode call or between seeks  }
{ compressed bit stream  }
function zfp_stream_flush(stream:Pzfp_stream):Tsize_t;cdecl;external libzfp;
{ align bit stream on next word boundary (decoding analogy to flush)  }
{ compressed bit stream  }
function zfp_stream_align(stream:Pzfp_stream):Tsize_t;cdecl;external libzfp;
{ low-level API: encoder --------------------------------------------------  }
{
The functions below all compress either a complete contiguous d-dimensional
block of 4^d scalars or a complete or partial block assembled from a strided
array.  In the latter case, p points to the first scalar; (nx, ny, nz) specify
the size of the block, with 1 <= nx, ny, nz <= 4; and (sx, sy, sz) specify the
strides, i.e. the number of scalars to advance to get to the next scalar along
each dimension.  The functions return the number of bits of compressed storage
needed for the compressed block.
 }
{ encode 1D contiguous block of 4 values  }
function zfp_encode_block_int32_1(stream:Pzfp_stream; block:Plongint):Tsize_t;cdecl;external libzfp;
function zfp_encode_block_int64_1(stream:Pzfp_stream; block:Pint64):Tsize_t;cdecl;external libzfp;
function zfp_encode_block_float_1(stream:Pzfp_stream; block:Psingle):Tsize_t;cdecl;external libzfp;
function zfp_encode_block_double_1(stream:Pzfp_stream; block:Pdouble):Tsize_t;cdecl;external libzfp;
{ encode 1D complete or partial block from strided array  }
function zfp_encode_block_strided_int32_1(stream:Pzfp_stream; p:Plongint; sx:Tptrdiff_t):Tsize_t;cdecl;external libzfp;
function zfp_encode_block_strided_int64_1(stream:Pzfp_stream; p:Pint64; sx:Tptrdiff_t):Tsize_t;cdecl;external libzfp;
function zfp_encode_block_strided_float_1(stream:Pzfp_stream; p:Psingle; sx:Tptrdiff_t):Tsize_t;cdecl;external libzfp;
function zfp_encode_block_strided_double_1(stream:Pzfp_stream; p:Pdouble; sx:Tptrdiff_t):Tsize_t;cdecl;external libzfp;
function zfp_encode_partial_block_strided_int32_1(stream:Pzfp_stream; p:Plongint; nx:Tsize_t; sx:Tptrdiff_t):Tsize_t;cdecl;external libzfp;
function zfp_encode_partial_block_strided_int64_1(stream:Pzfp_stream; p:Pint64; nx:Tsize_t; sx:Tptrdiff_t):Tsize_t;cdecl;external libzfp;
function zfp_encode_partial_block_strided_float_1(stream:Pzfp_stream; p:Psingle; nx:Tsize_t; sx:Tptrdiff_t):Tsize_t;cdecl;external libzfp;
function zfp_encode_partial_block_strided_double_1(stream:Pzfp_stream; p:Pdouble; nx:Tsize_t; sx:Tptrdiff_t):Tsize_t;cdecl;external libzfp;
{ encode 2D contiguous block of 4x4 values  }
function zfp_encode_block_int32_2(stream:Pzfp_stream; block:Plongint):Tsize_t;cdecl;external libzfp;
function zfp_encode_block_int64_2(stream:Pzfp_stream; block:Pint64):Tsize_t;cdecl;external libzfp;
function zfp_encode_block_float_2(stream:Pzfp_stream; block:Psingle):Tsize_t;cdecl;external libzfp;
function zfp_encode_block_double_2(stream:Pzfp_stream; block:Pdouble):Tsize_t;cdecl;external libzfp;
{ encode 2D complete or partial block from strided array  }
function zfp_encode_partial_block_strided_int32_2(stream:Pzfp_stream; p:Plongint; nx:Tsize_t; ny:Tsize_t; sx:Tptrdiff_t; 
           sy:Tptrdiff_t):Tsize_t;cdecl;external libzfp;
function zfp_encode_partial_block_strided_int64_2(stream:Pzfp_stream; p:Pint64; nx:Tsize_t; ny:Tsize_t; sx:Tptrdiff_t; 
           sy:Tptrdiff_t):Tsize_t;cdecl;external libzfp;
function zfp_encode_partial_block_strided_float_2(stream:Pzfp_stream; p:Psingle; nx:Tsize_t; ny:Tsize_t; sx:Tptrdiff_t; 
           sy:Tptrdiff_t):Tsize_t;cdecl;external libzfp;
function zfp_encode_partial_block_strided_double_2(stream:Pzfp_stream; p:Pdouble; nx:Tsize_t; ny:Tsize_t; sx:Tptrdiff_t; 
           sy:Tptrdiff_t):Tsize_t;cdecl;external libzfp;
function zfp_encode_block_strided_int32_2(stream:Pzfp_stream; p:Plongint; sx:Tptrdiff_t; sy:Tptrdiff_t):Tsize_t;cdecl;external libzfp;
function zfp_encode_block_strided_int64_2(stream:Pzfp_stream; p:Pint64; sx:Tptrdiff_t; sy:Tptrdiff_t):Tsize_t;cdecl;external libzfp;
function zfp_encode_block_strided_float_2(stream:Pzfp_stream; p:Psingle; sx:Tptrdiff_t; sy:Tptrdiff_t):Tsize_t;cdecl;external libzfp;
function zfp_encode_block_strided_double_2(stream:Pzfp_stream; p:Pdouble; sx:Tptrdiff_t; sy:Tptrdiff_t):Tsize_t;cdecl;external libzfp;
{ encode 3D contiguous block of 4x4x4 values  }
function zfp_encode_block_int32_3(stream:Pzfp_stream; block:Plongint):Tsize_t;cdecl;external libzfp;
function zfp_encode_block_int64_3(stream:Pzfp_stream; block:Pint64):Tsize_t;cdecl;external libzfp;
function zfp_encode_block_float_3(stream:Pzfp_stream; block:Psingle):Tsize_t;cdecl;external libzfp;
function zfp_encode_block_double_3(stream:Pzfp_stream; block:Pdouble):Tsize_t;cdecl;external libzfp;
{ encode 3D complete or partial block from strided array  }
function zfp_encode_block_strided_int32_3(stream:Pzfp_stream; p:Plongint; sx:Tptrdiff_t; sy:Tptrdiff_t; sz:Tptrdiff_t):Tsize_t;cdecl;external libzfp;
function zfp_encode_block_strided_int64_3(stream:Pzfp_stream; p:Pint64; sx:Tptrdiff_t; sy:Tptrdiff_t; sz:Tptrdiff_t):Tsize_t;cdecl;external libzfp;
function zfp_encode_block_strided_float_3(stream:Pzfp_stream; p:Psingle; sx:Tptrdiff_t; sy:Tptrdiff_t; sz:Tptrdiff_t):Tsize_t;cdecl;external libzfp;
function zfp_encode_block_strided_double_3(stream:Pzfp_stream; p:Pdouble; sx:Tptrdiff_t; sy:Tptrdiff_t; sz:Tptrdiff_t):Tsize_t;cdecl;external libzfp;
function zfp_encode_partial_block_strided_int32_3(stream:Pzfp_stream; p:Plongint; nx:Tsize_t; ny:Tsize_t; nz:Tsize_t; 
           sx:Tptrdiff_t; sy:Tptrdiff_t; sz:Tptrdiff_t):Tsize_t;cdecl;external libzfp;
function zfp_encode_partial_block_strided_int64_3(stream:Pzfp_stream; p:Pint64; nx:Tsize_t; ny:Tsize_t; nz:Tsize_t; 
           sx:Tptrdiff_t; sy:Tptrdiff_t; sz:Tptrdiff_t):Tsize_t;cdecl;external libzfp;
function zfp_encode_partial_block_strided_float_3(stream:Pzfp_stream; p:Psingle; nx:Tsize_t; ny:Tsize_t; nz:Tsize_t; 
           sx:Tptrdiff_t; sy:Tptrdiff_t; sz:Tptrdiff_t):Tsize_t;cdecl;external libzfp;
function zfp_encode_partial_block_strided_double_3(stream:Pzfp_stream; p:Pdouble; nx:Tsize_t; ny:Tsize_t; nz:Tsize_t; 
           sx:Tptrdiff_t; sy:Tptrdiff_t; sz:Tptrdiff_t):Tsize_t;cdecl;external libzfp;
{ encode 4D contiguous block of 4x4x4x4 values  }
function zfp_encode_block_int32_4(stream:Pzfp_stream; block:Plongint):Tsize_t;cdecl;external libzfp;
function zfp_encode_block_int64_4(stream:Pzfp_stream; block:Pint64):Tsize_t;cdecl;external libzfp;
function zfp_encode_block_float_4(stream:Pzfp_stream; block:Psingle):Tsize_t;cdecl;external libzfp;
function zfp_encode_block_double_4(stream:Pzfp_stream; block:Pdouble):Tsize_t;cdecl;external libzfp;
{ encode 4D complete or partial block from strided array  }
function zfp_encode_block_strided_int32_4(stream:Pzfp_stream; p:Plongint; sx:Tptrdiff_t; sy:Tptrdiff_t; sz:Tptrdiff_t; 
           sw:Tptrdiff_t):Tsize_t;cdecl;external libzfp;
function zfp_encode_block_strided_int64_4(stream:Pzfp_stream; p:Pint64; sx:Tptrdiff_t; sy:Tptrdiff_t; sz:Tptrdiff_t; 
           sw:Tptrdiff_t):Tsize_t;cdecl;external libzfp;
function zfp_encode_block_strided_float_4(stream:Pzfp_stream; p:Psingle; sx:Tptrdiff_t; sy:Tptrdiff_t; sz:Tptrdiff_t; 
           sw:Tptrdiff_t):Tsize_t;cdecl;external libzfp;
function zfp_encode_block_strided_double_4(stream:Pzfp_stream; p:Pdouble; sx:Tptrdiff_t; sy:Tptrdiff_t; sz:Tptrdiff_t; 
           sw:Tptrdiff_t):Tsize_t;cdecl;external libzfp;
function zfp_encode_partial_block_strided_int32_4(stream:Pzfp_stream; p:Plongint; nx:Tsize_t; ny:Tsize_t; nz:Tsize_t; 
           nw:Tsize_t; sx:Tptrdiff_t; sy:Tptrdiff_t; sz:Tptrdiff_t; sw:Tptrdiff_t):Tsize_t;cdecl;external libzfp;
function zfp_encode_partial_block_strided_int64_4(stream:Pzfp_stream; p:Pint64; nx:Tsize_t; ny:Tsize_t; nz:Tsize_t; 
           nw:Tsize_t; sx:Tptrdiff_t; sy:Tptrdiff_t; sz:Tptrdiff_t; sw:Tptrdiff_t):Tsize_t;cdecl;external libzfp;
function zfp_encode_partial_block_strided_float_4(stream:Pzfp_stream; p:Psingle; nx:Tsize_t; ny:Tsize_t; nz:Tsize_t; 
           nw:Tsize_t; sx:Tptrdiff_t; sy:Tptrdiff_t; sz:Tptrdiff_t; sw:Tptrdiff_t):Tsize_t;cdecl;external libzfp;
function zfp_encode_partial_block_strided_double_4(stream:Pzfp_stream; p:Pdouble; nx:Tsize_t; ny:Tsize_t; nz:Tsize_t; 
           nw:Tsize_t; sx:Tptrdiff_t; sy:Tptrdiff_t; sz:Tptrdiff_t; sw:Tptrdiff_t):Tsize_t;cdecl;external libzfp;
{ low-level API: decoder --------------------------------------------------  }
{
Each function below decompresses a single block and returns the number of bits
of compressed storage consumed.  See corresponding encoder functions above for
further details.
 }
{ decode 1D contiguous block of 4 values  }
function zfp_decode_block_int32_1(stream:Pzfp_stream; block:Plongint):Tsize_t;cdecl;external libzfp;
function zfp_decode_block_int64_1(stream:Pzfp_stream; block:Pint64):Tsize_t;cdecl;external libzfp;
function zfp_decode_block_float_1(stream:Pzfp_stream; block:Psingle):Tsize_t;cdecl;external libzfp;
function zfp_decode_block_double_1(stream:Pzfp_stream; block:Pdouble):Tsize_t;cdecl;external libzfp;
{ decode 1D complete or partial block from strided array  }
function zfp_decode_block_strided_int32_1(stream:Pzfp_stream; p:Plongint; sx:Tptrdiff_t):Tsize_t;cdecl;external libzfp;
function zfp_decode_block_strided_int64_1(stream:Pzfp_stream; p:Pint64; sx:Tptrdiff_t):Tsize_t;cdecl;external libzfp;
function zfp_decode_block_strided_float_1(stream:Pzfp_stream; p:Psingle; sx:Tptrdiff_t):Tsize_t;cdecl;external libzfp;
function zfp_decode_block_strided_double_1(stream:Pzfp_stream; p:Pdouble; sx:Tptrdiff_t):Tsize_t;cdecl;external libzfp;
function zfp_decode_partial_block_strided_int32_1(stream:Pzfp_stream; p:Plongint; nx:Tsize_t; sx:Tptrdiff_t):Tsize_t;cdecl;external libzfp;
function zfp_decode_partial_block_strided_int64_1(stream:Pzfp_stream; p:Pint64; nx:Tsize_t; sx:Tptrdiff_t):Tsize_t;cdecl;external libzfp;
function zfp_decode_partial_block_strided_float_1(stream:Pzfp_stream; p:Psingle; nx:Tsize_t; sx:Tptrdiff_t):Tsize_t;cdecl;external libzfp;
function zfp_decode_partial_block_strided_double_1(stream:Pzfp_stream; p:Pdouble; nx:Tsize_t; sx:Tptrdiff_t):Tsize_t;cdecl;external libzfp;
{ decode 2D contiguous block of 4x4 values  }
function zfp_decode_block_int32_2(stream:Pzfp_stream; block:Plongint):Tsize_t;cdecl;external libzfp;
function zfp_decode_block_int64_2(stream:Pzfp_stream; block:Pint64):Tsize_t;cdecl;external libzfp;
function zfp_decode_block_float_2(stream:Pzfp_stream; block:Psingle):Tsize_t;cdecl;external libzfp;
function zfp_decode_block_double_2(stream:Pzfp_stream; block:Pdouble):Tsize_t;cdecl;external libzfp;
{ decode 2D complete or partial block from strided array  }
function zfp_decode_block_strided_int32_2(stream:Pzfp_stream; p:Plongint; sx:Tptrdiff_t; sy:Tptrdiff_t):Tsize_t;cdecl;external libzfp;
function zfp_decode_block_strided_int64_2(stream:Pzfp_stream; p:Pint64; sx:Tptrdiff_t; sy:Tptrdiff_t):Tsize_t;cdecl;external libzfp;
function zfp_decode_block_strided_float_2(stream:Pzfp_stream; p:Psingle; sx:Tptrdiff_t; sy:Tptrdiff_t):Tsize_t;cdecl;external libzfp;
function zfp_decode_block_strided_double_2(stream:Pzfp_stream; p:Pdouble; sx:Tptrdiff_t; sy:Tptrdiff_t):Tsize_t;cdecl;external libzfp;
function zfp_decode_partial_block_strided_int32_2(stream:Pzfp_stream; p:Plongint; nx:Tsize_t; ny:Tsize_t; sx:Tptrdiff_t; 
           sy:Tptrdiff_t):Tsize_t;cdecl;external libzfp;
function zfp_decode_partial_block_strided_int64_2(stream:Pzfp_stream; p:Pint64; nx:Tsize_t; ny:Tsize_t; sx:Tptrdiff_t; 
           sy:Tptrdiff_t):Tsize_t;cdecl;external libzfp;
function zfp_decode_partial_block_strided_float_2(stream:Pzfp_stream; p:Psingle; nx:Tsize_t; ny:Tsize_t; sx:Tptrdiff_t; 
           sy:Tptrdiff_t):Tsize_t;cdecl;external libzfp;
function zfp_decode_partial_block_strided_double_2(stream:Pzfp_stream; p:Pdouble; nx:Tsize_t; ny:Tsize_t; sx:Tptrdiff_t; 
           sy:Tptrdiff_t):Tsize_t;cdecl;external libzfp;
{ decode 3D contiguous block of 4x4x4 values  }
function zfp_decode_block_int32_3(stream:Pzfp_stream; block:Plongint):Tsize_t;cdecl;external libzfp;
function zfp_decode_block_int64_3(stream:Pzfp_stream; block:Pint64):Tsize_t;cdecl;external libzfp;
function zfp_decode_block_float_3(stream:Pzfp_stream; block:Psingle):Tsize_t;cdecl;external libzfp;
function zfp_decode_block_double_3(stream:Pzfp_stream; block:Pdouble):Tsize_t;cdecl;external libzfp;
{ decode 3D complete or partial block from strided array  }
function zfp_decode_block_strided_int32_3(stream:Pzfp_stream; p:Plongint; sx:Tptrdiff_t; sy:Tptrdiff_t; sz:Tptrdiff_t):Tsize_t;cdecl;external libzfp;
function zfp_decode_block_strided_int64_3(stream:Pzfp_stream; p:Pint64; sx:Tptrdiff_t; sy:Tptrdiff_t; sz:Tptrdiff_t):Tsize_t;cdecl;external libzfp;
function zfp_decode_block_strided_float_3(stream:Pzfp_stream; p:Psingle; sx:Tptrdiff_t; sy:Tptrdiff_t; sz:Tptrdiff_t):Tsize_t;cdecl;external libzfp;
function zfp_decode_block_strided_double_3(stream:Pzfp_stream; p:Pdouble; sx:Tptrdiff_t; sy:Tptrdiff_t; sz:Tptrdiff_t):Tsize_t;cdecl;external libzfp;
function zfp_decode_partial_block_strided_int32_3(stream:Pzfp_stream; p:Plongint; nx:Tsize_t; ny:Tsize_t; nz:Tsize_t; 
           sx:Tptrdiff_t; sy:Tptrdiff_t; sz:Tptrdiff_t):Tsize_t;cdecl;external libzfp;
function zfp_decode_partial_block_strided_int64_3(stream:Pzfp_stream; p:Pint64; nx:Tsize_t; ny:Tsize_t; nz:Tsize_t; 
           sx:Tptrdiff_t; sy:Tptrdiff_t; sz:Tptrdiff_t):Tsize_t;cdecl;external libzfp;
function zfp_decode_partial_block_strided_float_3(stream:Pzfp_stream; p:Psingle; nx:Tsize_t; ny:Tsize_t; nz:Tsize_t; 
           sx:Tptrdiff_t; sy:Tptrdiff_t; sz:Tptrdiff_t):Tsize_t;cdecl;external libzfp;
function zfp_decode_partial_block_strided_double_3(stream:Pzfp_stream; p:Pdouble; nx:Tsize_t; ny:Tsize_t; nz:Tsize_t; 
           sx:Tptrdiff_t; sy:Tptrdiff_t; sz:Tptrdiff_t):Tsize_t;cdecl;external libzfp;
{ decode 4D contiguous block of 4x4x4x4 values  }
function zfp_decode_block_int32_4(stream:Pzfp_stream; block:Plongint):Tsize_t;cdecl;external libzfp;
function zfp_decode_block_int64_4(stream:Pzfp_stream; block:Pint64):Tsize_t;cdecl;external libzfp;
function zfp_decode_block_float_4(stream:Pzfp_stream; block:Psingle):Tsize_t;cdecl;external libzfp;
function zfp_decode_block_double_4(stream:Pzfp_stream; block:Pdouble):Tsize_t;cdecl;external libzfp;
{ decode 4D complete or partial block from strided array  }
function zfp_decode_block_strided_int32_4(stream:Pzfp_stream; p:Plongint; sx:Tptrdiff_t; sy:Tptrdiff_t; sz:Tptrdiff_t; 
           sw:Tptrdiff_t):Tsize_t;cdecl;external libzfp;
function zfp_decode_block_strided_int64_4(stream:Pzfp_stream; p:Pint64; sx:Tptrdiff_t; sy:Tptrdiff_t; sz:Tptrdiff_t; 
           sw:Tptrdiff_t):Tsize_t;cdecl;external libzfp;
function zfp_decode_block_strided_float_4(stream:Pzfp_stream; p:Psingle; sx:Tptrdiff_t; sy:Tptrdiff_t; sz:Tptrdiff_t; 
           sw:Tptrdiff_t):Tsize_t;cdecl;external libzfp;
function zfp_decode_block_strided_double_4(stream:Pzfp_stream; p:Pdouble; sx:Tptrdiff_t; sy:Tptrdiff_t; sz:Tptrdiff_t; 
           sw:Tptrdiff_t):Tsize_t;cdecl;external libzfp;
function zfp_decode_partial_block_strided_int32_4(stream:Pzfp_stream; p:Plongint; nx:Tsize_t; ny:Tsize_t; nz:Tsize_t; 
           nw:Tsize_t; sx:Tptrdiff_t; sy:Tptrdiff_t; sz:Tptrdiff_t; sw:Tptrdiff_t):Tsize_t;cdecl;external libzfp;
function zfp_decode_partial_block_strided_int64_4(stream:Pzfp_stream; p:Pint64; nx:Tsize_t; ny:Tsize_t; nz:Tsize_t; 
           nw:Tsize_t; sx:Tptrdiff_t; sy:Tptrdiff_t; sz:Tptrdiff_t; sw:Tptrdiff_t):Tsize_t;cdecl;external libzfp;
function zfp_decode_partial_block_strided_float_4(stream:Pzfp_stream; p:Psingle; nx:Tsize_t; ny:Tsize_t; nz:Tsize_t; 
           nw:Tsize_t; sx:Tptrdiff_t; sy:Tptrdiff_t; sz:Tptrdiff_t; sw:Tptrdiff_t):Tsize_t;cdecl;external libzfp;
function zfp_decode_partial_block_strided_double_4(stream:Pzfp_stream; p:Pdouble; nx:Tsize_t; ny:Tsize_t; nz:Tsize_t; 
           nw:Tsize_t; sx:Tptrdiff_t; sy:Tptrdiff_t; sz:Tptrdiff_t; sw:Tptrdiff_t):Tsize_t;cdecl;external libzfp;
{ low-level API: utility functions ----------------------------------------  }
{ convert dims-dimensional contiguous block to 32-bit integer type  }
procedure zfp_promote_int8_to_int32(oblock:Plongint; iblock:Pshortint; dims:Tuint);cdecl;external libzfp;
procedure zfp_promote_uint8_to_int32(oblock:Plongint; iblock:Puint8; dims:Tuint);cdecl;external libzfp;
procedure zfp_promote_int16_to_int32(oblock:Plongint; iblock:Psmallint; dims:Tuint);cdecl;external libzfp;
procedure zfp_promote_uint16_to_int32(oblock:Plongint; iblock:Puint16; dims:Tuint);cdecl;external libzfp;
{ convert dims-dimensional contiguous block from 32-bit integer type  }
procedure zfp_demote_int32_to_int8(oblock:Pshortint; iblock:Plongint; dims:Tuint);cdecl;external libzfp;
procedure zfp_demote_int32_to_uint8(oblock:Puint8; iblock:Plongint; dims:Tuint);cdecl;external libzfp;
procedure zfp_demote_int32_to_int16(oblock:Psmallint; iblock:Plongint; dims:Tuint);cdecl;external libzfp;
procedure zfp_demote_int32_to_uint16(oblock:Puint16; iblock:Plongint; dims:Tuint);cdecl;external libzfp;
{ C++ end of extern C conditionnal removed }
{$endif}

// === Konventiert am: 4-9-26 15:15:49 ===


implementation


{ was #define dname def_expr }
function ZFP_META_NULL : longint; { return type might be wrong }
  begin
    ZFP_META_NULL:=UINT64C(-(1));
  end;


end.
