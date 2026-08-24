{$IFDEF read_interface}


const
  MPICH_SKIP_MPICXX = 1;
  OMPI_SKIP_MPICXX = 1;

const
  H5_VERS_MAJOR = 1;
  H5_VERS_MINOR = 10;
  H5_VERS_RELEASE = 10;
  H5_VERS_SUBRELEASE = '';
  H5_VERS_INFO = 'HDF5 library version: 1.10.10';

type
  Pherr_t = ^Therr_t;
  Therr_t = longint;

type
  Phbool_t = ^Thbool_t;
  Thbool_t = boolean;

  Phtri_t = ^Thtri_t;
  Thtri_t = longint;

type
  Phaddr_t = ^Thaddr_t;
  Thaddr_t = uint64;

type
  PH5_iter_order_t = ^TH5_iter_order_t;
  TH5_iter_order_t = longint;
const
  H5_ITER_UNKNOWN = -(1);
  H5_ITER_INC = (-(1)) + 1;
  H5_ITER_DEC = (-(1)) + 2;
  H5_ITER_NATIVE = (-(1)) + 3;
  H5_ITER_N = (-(1)) + 4;

const
  H5_ITER_ERROR = -(1);
  H5_ITER_CONT = 0;
  H5_ITER_STOP = 1;

type
  PH5_index_t = ^TH5_index_t;
  TH5_index_t = longint;
const
  H5_INDEX_UNKNOWN = -(1);
  H5_INDEX_NAME = (-(1)) + 1;
  H5_INDEX_CRT_ORDER = (-(1)) + 2;
  H5_INDEX_N = (-(1)) + 3;

type
  PH5_ih_info_t = ^TH5_ih_info_t;
  TH5_ih_info_t = record
    index_size: Thsize_t;
    heap_size: Thsize_t;
  end;

  PH5_alloc_stats_t = ^TH5_alloc_stats_t;
  TH5_alloc_stats_t = record
    total_alloc_bytes: qword;
    curr_alloc_bytes: Tsize_t;
    peak_alloc_bytes: Tsize_t;
    max_block_size: Tsize_t;
    total_alloc_blocks_count: Tsize_t;
    curr_alloc_blocks_count: Tsize_t;
    peak_alloc_blocks_count: Tsize_t;
  end;

function H5open: Therr_t; cdecl; external libhdf5_serial;
function H5close: Therr_t; cdecl; external libhdf5_serial;
function H5dont_atexit: Therr_t; cdecl; external libhdf5_serial;
function H5garbage_collect: Therr_t; cdecl; external libhdf5_serial;
function H5set_free_list_limits(reg_global_lim: longint; reg_list_lim: longint; arr_global_lim: longint; arr_list_lim: longint; blk_global_lim: longint;
  blk_list_lim: longint): Therr_t; cdecl; external libhdf5_serial;
function H5get_free_list_sizes(reg_size: Psize_t; arr_size: Psize_t; blk_size: Psize_t; fac_size: Psize_t): Therr_t; cdecl; external libhdf5_serial;
function H5get_alloc_stats(stats: PH5_alloc_stats_t): Therr_t; cdecl; external libhdf5_serial;
function H5get_libversion(majnum: Pdword; minnum: Pdword; relnum: Pdword): Therr_t; cdecl; external libhdf5_serial;
function H5check_version(majnum: dword; minnum: dword; relnum: dword): Therr_t; cdecl; external libhdf5_serial;
function H5is_library_threadsafe(is_ts: Phbool_t): Therr_t; cdecl; external libhdf5_serial;
function H5free_memory(mem: pointer): Therr_t; cdecl; external libhdf5_serial;
function H5allocate_memory(size: Tsize_t; clear: Thbool_t): pointer; cdecl; external libhdf5_serial;
function H5resize_memory(mem: pointer; size: Tsize_t): pointer; cdecl; external libhdf5_serial;

// === Konventiert am: 21-8-26 14:40:17 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}

{$ENDIF read_implementation}
