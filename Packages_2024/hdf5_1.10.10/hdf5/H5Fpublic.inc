{$IFDEF read_interface}


const
  H5F_ACC_RDONLY = $0000;
  H5F_ACC_RDWR = $0001;
  H5F_ACC_TRUNC = $0002;
  H5F_ACC_EXCL = $0004;
  H5F_ACC_CREAT = $0010;
  H5F_ACC_SWMR_WRITE = $0020;
  H5F_ACC_SWMR_READ = $0040;
  H5F_ACC_DEFAULT = $ffff;
  H5F_OBJ_FILE = $0001;
  H5F_OBJ_DATASET = $0002;
  H5F_OBJ_GROUP = $0004;
  H5F_OBJ_DATATYPE = $0008;
  H5F_OBJ_ATTR = $0010;
  H5F_OBJ_ALL = (((H5F_OBJ_FILE or H5F_OBJ_DATASET) or H5F_OBJ_GROUP) or H5F_OBJ_DATATYPE) or H5F_OBJ_ATTR;
  H5F_OBJ_LOCAL = $0020;

type
  PH5F_scope_t = ^TH5F_scope_t;
  TH5F_scope_t = longint;
const
  H5F_SCOPE_LOCAL = 0;
  H5F_SCOPE_GLOBAL = 1;

type
  PH5F_close_degree_t = ^TH5F_close_degree_t;
  TH5F_close_degree_t = longint;
const
  H5F_CLOSE_DEFAULT = 0;
  H5F_CLOSE_WEAK = 1;
  H5F_CLOSE_SEMI = 2;
  H5F_CLOSE_STRONG = 3;

type
  PH5F_info2_t = ^TH5F_info2_t;
  TH5F_info2_t = record
    super: record
      version: dword;
      super_size: Thsize_t;
      super_ext_size: Thsize_t;
      end;
    free: record
      version: dword;
      meta_size: Thsize_t;
      tot_space: Thsize_t;
      end;
    sohm: record
      version: dword;
      hdr_size: Thsize_t;
      msgs_info: TH5_ih_info_t;
      end;
  end;

type
  PH5F_mem_t = ^TH5F_mem_t;
  TH5F_mem_t = longint;
const
  H5FD_MEM_NOLIST = -(1);
  H5FD_MEM_DEFAULT = 0;
  H5FD_MEM_SUPER = 1;
  H5FD_MEM_BTREE = 2;
  H5FD_MEM_DRAW = 3;
  H5FD_MEM_GHEAP = 4;
  H5FD_MEM_LHEAP = 5;
  H5FD_MEM_OHDR = 6;
  H5FD_MEM_NTYPES = 7;

type
  PH5F_sect_info_t = ^TH5F_sect_info_t;
  TH5F_sect_info_t = record
    addr: Thaddr_t;
    size: Thsize_t;
  end;

type
  PH5F_libver_t = ^TH5F_libver_t;
  TH5F_libver_t = longint;
const
  H5F_LIBVER_ERROR = -(1);
  H5F_LIBVER_EARLIEST = 0;
  H5F_LIBVER_V18 = 1;
  H5F_LIBVER_V110 = 2;
  H5F_LIBVER_NBOUNDS = 3;

  H5F_LIBVER_LATEST = H5F_LIBVER_V110;

type
  PH5F_fspace_strategy_t = ^TH5F_fspace_strategy_t;
  TH5F_fspace_strategy_t = longint;
const
  H5F_FSPACE_STRATEGY_FSM_AGGR = 0;
  H5F_FSPACE_STRATEGY_PAGE = 1;
  H5F_FSPACE_STRATEGY_AGGR = 2;
  H5F_FSPACE_STRATEGY_NONE = 3;
  H5F_FSPACE_STRATEGY_NTYPES = 4;

type
  PH5F_file_space_type_t = ^TH5F_file_space_type_t;
  TH5F_file_space_type_t = longint;
const
  H5F_FILE_SPACE_DEFAULT = 0;
  H5F_FILE_SPACE_ALL_PERSIST = 1;
  H5F_FILE_SPACE_ALL = 2;
  H5F_FILE_SPACE_AGGR_VFD = 3;
  H5F_FILE_SPACE_VFD = 4;
  H5F_FILE_SPACE_NTYPES = 5;

const
  H5F_NUM_METADATA_READ_RETRY_TYPES = 21;

type
  PH5F_retry_info_t = ^TH5F_retry_info_t;
  TH5F_retry_info_t = record
    nbins: dword;
    retries: array[0..(H5F_NUM_METADATA_READ_RETRY_TYPES) - 1] of Puint32_t;
  end;

  TH5F_flush_cb_t = function(object_id: Thid_t; udata: pointer): Therr_t; cdecl;
  PH5F_flush_cb_t = ^TH5F_flush_cb_t;

function H5Fis_hdf5(filename: pchar): Thtri_t; cdecl; external libhdf5_serial;
function H5Fcreate(filename: pchar; flags: dword; fcpl_id: Thid_t; fapl_id: Thid_t): Thid_t; cdecl; external libhdf5_serial;
function H5Fopen(filename: pchar; flags: dword; fapl_id: Thid_t): Thid_t; cdecl; external libhdf5_serial;
function H5Freopen(file_id: Thid_t): Thid_t; cdecl; external libhdf5_serial;
function H5Fflush(object_id: Thid_t; scope: TH5F_scope_t): Therr_t; cdecl; external libhdf5_serial;
function H5Fclose(file_id: Thid_t): Therr_t; cdecl; external libhdf5_serial;
function H5Fget_create_plist(file_id: Thid_t): Thid_t; cdecl; external libhdf5_serial;
function H5Fget_access_plist(file_id: Thid_t): Thid_t; cdecl; external libhdf5_serial;
function H5Fget_intent(file_id: Thid_t; intent: Pdword): Therr_t; cdecl; external libhdf5_serial;
function H5Fget_obj_count(file_id: Thid_t; types: dword): Tssize_t; cdecl; external libhdf5_serial;
function H5Fget_obj_ids(file_id: Thid_t; types: dword; max_objs: Tsize_t; obj_id_list: Phid_t): Tssize_t; cdecl; external libhdf5_serial;
function H5Fget_vfd_handle(file_id: Thid_t; fapl: Thid_t; file_handle: Ppointer): Therr_t; cdecl; external libhdf5_serial;
function H5Fmount(loc: Thid_t; name: pchar; child: Thid_t; plist: Thid_t): Therr_t; cdecl; external libhdf5_serial;
function H5Funmount(loc: Thid_t; name: pchar): Therr_t; cdecl; external libhdf5_serial;
function H5Fget_freespace(file_id: Thid_t): Thssize_t; cdecl; external libhdf5_serial;
function H5Fget_filesize(file_id: Thid_t; size: Phsize_t): Therr_t; cdecl; external libhdf5_serial;
function H5Fget_eoa(file_id: Thid_t; eoa: Phaddr_t): Therr_t; cdecl; external libhdf5_serial;
function H5Fincrement_filesize(file_id: Thid_t; increment: Thsize_t): Therr_t; cdecl; external libhdf5_serial;
function H5Fget_file_image(file_id: Thid_t; buf_ptr: pointer; buf_len: Tsize_t): Tssize_t; cdecl; external libhdf5_serial;
function H5Fget_mdc_config(file_id: Thid_t; config_ptr: PH5AC_cache_config_t): Therr_t; cdecl; external libhdf5_serial;
function H5Fset_mdc_config(file_id: Thid_t; config_ptr: PH5AC_cache_config_t): Therr_t; cdecl; external libhdf5_serial;
function H5Fget_mdc_hit_rate(file_id: Thid_t; hit_rate_ptr: Pdouble): Therr_t; cdecl; external libhdf5_serial;
function H5Fget_mdc_size(file_id: Thid_t; max_size_ptr: Psize_t; min_clean_size_ptr: Psize_t; cur_size_ptr: Psize_t; cur_num_entries_ptr: Plongint): Therr_t; cdecl; external libhdf5_serial;
function H5Freset_mdc_hit_rate_stats(file_id: Thid_t): Therr_t; cdecl; external libhdf5_serial;
function H5Fget_name(obj_id: Thid_t; name: pchar; size: Tsize_t): Tssize_t; cdecl; external libhdf5_serial;
function H5Fget_info2(obj_id: Thid_t; file_info: PH5F_info2_t): Therr_t; cdecl; external libhdf5_serial;
function H5Fget_metadata_read_retry_info(file_id: Thid_t; info: PH5F_retry_info_t): Therr_t; cdecl; external libhdf5_serial;
function H5Fstart_swmr_write(file_id: Thid_t): Therr_t; cdecl; external libhdf5_serial;
function H5Fget_free_sections(file_id: Thid_t; _type: TH5F_mem_t; nsects: Tsize_t; sect_info: PH5F_sect_info_t): Tssize_t; cdecl; external libhdf5_serial;
function H5Fclear_elink_file_cache(file_id: Thid_t): Therr_t; cdecl; external libhdf5_serial;
function H5Fset_libver_bounds(file_id: Thid_t; low: TH5F_libver_t; high: TH5F_libver_t): Therr_t; cdecl; external libhdf5_serial;
function H5Fstart_mdc_logging(file_id: Thid_t): Therr_t; cdecl; external libhdf5_serial;
function H5Fstop_mdc_logging(file_id: Thid_t): Therr_t; cdecl; external libhdf5_serial;
function H5Fget_mdc_logging_status(file_id: Thid_t; is_enabled: Phbool_t; is_currently_logging: Phbool_t): Therr_t; cdecl; external libhdf5_serial;
function H5Fformat_convert(fid: Thid_t): Therr_t; cdecl; external libhdf5_serial;
function H5Freset_page_buffering_stats(file_id: Thid_t): Therr_t; cdecl; external libhdf5_serial;
function H5Fget_page_buffering_stats(file_id: Thid_t; accesses: Pdword; hits: Pdword; misses: Pdword; evictions: Pdword; bypasses: Pdword): Therr_t; cdecl; external libhdf5_serial;
function H5Fget_mdc_image_info(file_id: Thid_t; image_addr: Phaddr_t; image_size: Phsize_t): Therr_t; cdecl; external libhdf5_serial;
function H5Fget_dset_no_attrs_hint(file_id: Thid_t; minimize: Phbool_t): Therr_t; cdecl; external libhdf5_serial;
function H5Fset_dset_no_attrs_hint(file_id: Thid_t; minimize: Thbool_t): Therr_t; cdecl; external libhdf5_serial;

function H5Fset_mpi_atomicity(file_id: Thid_t; flag: Thbool_t): Therr_t; cdecl; external libhdf5_serial;
function H5Fget_mpi_atomicity(file_id: Thid_t; flag: Phbool_t): Therr_t; cdecl; external libhdf5_serial;

const
  H5F_ACC_DEBUG = $0000;

type
  PH5F_info1_t = ^TH5F_info1_t;
  TH5F_info1_t = record
    super_ext_size: Thsize_t;
    sohm: record
      hdr_size: Thsize_t;
      msgs_info: TH5_ih_info_t;
      end;
  end;

function H5Fget_info1(obj_id: Thid_t; file_info: PH5F_info1_t): Therr_t; cdecl; external libhdf5_serial;
function H5Fset_latest_format(file_id: Thid_t; latest_format: Thbool_t): Therr_t; cdecl; external libhdf5_serial;

// === Konventiert am: 21-8-26 14:14:25 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}

{$ENDIF read_implementation}
