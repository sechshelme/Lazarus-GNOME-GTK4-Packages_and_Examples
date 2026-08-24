{$IFDEF read_interface}


const
  H5D_CHUNK_CACHE_NSLOTS_DEFAULT: Tsize_t = -1;
  H5D_CHUNK_CACHE_NBYTES_DEFAULT: Tsize_t = -1;

  H5D_CHUNK_CACHE_W0_DEFAULT = -(1.0);
  H5D_CHUNK_DONT_FILTER_PARTIAL_CHUNKS = $0002;

type
  PH5D_layout_t = ^TH5D_layout_t;
  TH5D_layout_t = longint;
const
  H5D_LAYOUT_ERROR = -(1);
  H5D_COMPACT = 0;
  H5D_CONTIGUOUS = 1;
  H5D_CHUNKED = 2;
  H5D_VIRTUAL = 3;
  H5D_NLAYOUTS = 4;

type
  PH5D_chunk_index_t = ^TH5D_chunk_index_t;
  TH5D_chunk_index_t = longint;
const
  H5D_CHUNK_IDX_BTREE = 0;
  H5D_CHUNK_IDX_SINGLE = 1;
  H5D_CHUNK_IDX_NONE = 2;
  H5D_CHUNK_IDX_FARRAY = 3;
  H5D_CHUNK_IDX_EARRAY = 4;
  H5D_CHUNK_IDX_BT2 = 5;
  H5D_CHUNK_IDX_NTYPES = 6;

type
  PH5D_alloc_time_t = ^TH5D_alloc_time_t;
  TH5D_alloc_time_t = longint;
const
  H5D_ALLOC_TIME_ERROR = -(1);
  H5D_ALLOC_TIME_DEFAULT = 0;
  H5D_ALLOC_TIME_EARLY = 1;
  H5D_ALLOC_TIME_LATE = 2;
  H5D_ALLOC_TIME_INCR = 3;

type
  PH5D_space_status_t = ^TH5D_space_status_t;
  TH5D_space_status_t = longint;
const
  H5D_SPACE_STATUS_ERROR = -(1);
  H5D_SPACE_STATUS_NOT_ALLOCATED = 0;
  H5D_SPACE_STATUS_PART_ALLOCATED = 1;
  H5D_SPACE_STATUS_ALLOCATED = 2;

type
  PH5D_fill_time_t = ^TH5D_fill_time_t;
  TH5D_fill_time_t = longint;
const
  H5D_FILL_TIME_ERROR = -(1);
  H5D_FILL_TIME_ALLOC = 0;
  H5D_FILL_TIME_NEVER = 1;
  H5D_FILL_TIME_IFSET = 2;

type
  PH5D_fill_value_t = ^TH5D_fill_value_t;
  TH5D_fill_value_t = longint;
const
  H5D_FILL_VALUE_ERROR = -(1);
  H5D_FILL_VALUE_UNDEFINED = 0;
  H5D_FILL_VALUE_DEFAULT = 1;
  H5D_FILL_VALUE_USER_DEFINED = 2;

type
  PH5D_vds_view_t = ^TH5D_vds_view_t;
  TH5D_vds_view_t = longint;
const
  H5D_VDS_ERROR = -(1);
  H5D_VDS_FIRST_MISSING = 0;
  H5D_VDS_LAST_AVAILABLE = 1;

type
  TH5D_append_cb_t = function(dataset_id: Thid_t; cur_dims: Phsize_t; op_data: pointer): Therr_t; cdecl;
  PH5D_append_cb_t = ^TH5D_append_cb_t;
  TH5D_operator_t = function(elem: pointer; type_id: Thid_t; ndim: dword; point: Phsize_t; operator_data: pointer): Therr_t; cdecl;
  TH5D_scatter_func_t = function(src_buf: Ppointer; src_buf_bytes_used: Psize_t; op_data: pointer): Therr_t; cdecl;
  TH5D_gather_func_t = function(dst_buf: pointer; dst_buf_bytes_used: Tsize_t; op_data: pointer): Therr_t; cdecl;
  TH5D_chunk_iter_op_t = function(offset: Phsize_t; filter_mask: dword; addr: Thaddr_t; size: Thsize_t; op_data: pointer): longint; cdecl;

function H5Dcreate2(loc_id: Thid_t; name: pchar; type_id: Thid_t; space_id: Thid_t; lcpl_id: Thid_t;
  dcpl_id: Thid_t; dapl_id: Thid_t): Thid_t; cdecl; external libhdf5_serial;
function H5Dcreate_anon(loc_id: Thid_t; type_id: Thid_t; space_id: Thid_t; dcpl_id: Thid_t; dapl_id: Thid_t): Thid_t; cdecl; external libhdf5_serial;
function H5Dopen2(loc_id: Thid_t; name: pchar; dapl_id: Thid_t): Thid_t; cdecl; external libhdf5_serial;
function H5Dget_space(dset_id: Thid_t): Thid_t; cdecl; external libhdf5_serial;
function H5Dget_space_status(dset_id: Thid_t; allocation: PH5D_space_status_t): Therr_t; cdecl; external libhdf5_serial;
function H5Dget_type(dset_id: Thid_t): Thid_t; cdecl; external libhdf5_serial;
function H5Dget_create_plist(dset_id: Thid_t): Thid_t; cdecl; external libhdf5_serial;
function H5Dget_access_plist(dset_id: Thid_t): Thid_t; cdecl; external libhdf5_serial;
function H5Dget_storage_size(dset_id: Thid_t): Thsize_t; cdecl; external libhdf5_serial;
function H5Dget_chunk_storage_size(dset_id: Thid_t; offset: Phsize_t; chunk_bytes: Phsize_t): Therr_t; cdecl; external libhdf5_serial;
function H5Dget_num_chunks(dset_id: Thid_t; fspace_id: Thid_t; nchunks: Phsize_t): Therr_t; cdecl; external libhdf5_serial;
function H5Dget_chunk_info_by_coord(dset_id: Thid_t; offset: Phsize_t; filter_mask: Pdword; addr: Phaddr_t; size: Phsize_t): Therr_t; cdecl; external libhdf5_serial;
function H5Dchunk_iter(dset_id: Thid_t; dxpl_id: Thid_t; cb: TH5D_chunk_iter_op_t; op_data: pointer): Therr_t; cdecl; external libhdf5_serial;
function H5Dget_chunk_info(dset_id: Thid_t; fspace_id: Thid_t; chk_idx: Thsize_t; offset: Phsize_t; filter_mask: Pdword;
  addr: Phaddr_t; size: Phsize_t): Therr_t; cdecl; external libhdf5_serial;
function H5Dget_offset(dset_id: Thid_t): Thaddr_t; cdecl; external libhdf5_serial;
function H5Dread(dset_id: Thid_t; mem_type_id: Thid_t; mem_space_id: Thid_t; file_space_id: Thid_t; dxpl_id: Thid_t;
  buf: pointer): Therr_t; cdecl; external libhdf5_serial;
function H5Dwrite(dset_id: Thid_t; mem_type_id: Thid_t; mem_space_id: Thid_t; file_space_id: Thid_t; dxpl_id: Thid_t;
  buf: pointer): Therr_t; cdecl; external libhdf5_serial;
function H5Dwrite_chunk(dset_id: Thid_t; dxpl_id: Thid_t; filters: Tuint32_t; offset: Phsize_t; data_size: Tsize_t;
  buf: pointer): Therr_t; cdecl; external libhdf5_serial;
function H5Dread_chunk(dset_id: Thid_t; dxpl_id: Thid_t; offset: Phsize_t; filters: Puint32_t; buf: pointer): Therr_t; cdecl; external libhdf5_serial;
function H5Diterate(buf: pointer; type_id: Thid_t; space_id: Thid_t; op: TH5D_operator_t; operator_data: pointer): Therr_t; cdecl; external libhdf5_serial;
function H5Dvlen_reclaim(type_id: Thid_t; space_id: Thid_t; dxpl_id: Thid_t; buf: pointer): Therr_t; cdecl; external libhdf5_serial;
function H5Dvlen_get_buf_size(dset_id: Thid_t; type_id: Thid_t; space_id: Thid_t; size: Phsize_t): Therr_t; cdecl; external libhdf5_serial;
function H5Dfill(fill: pointer; fill_type_id: Thid_t; buf: pointer; buf_type_id: Thid_t; space_id: Thid_t): Therr_t; cdecl; external libhdf5_serial;
function H5Dset_extent(dset_id: Thid_t; size: Phsize_t): Therr_t; cdecl; external libhdf5_serial;
function H5Dflush(dset_id: Thid_t): Therr_t; cdecl; external libhdf5_serial;
function H5Drefresh(dset_id: Thid_t): Therr_t; cdecl; external libhdf5_serial;
function H5Dscatter(op: TH5D_scatter_func_t; op_data: pointer; type_id: Thid_t; dst_space_id: Thid_t; dst_buf: pointer): Therr_t; cdecl; external libhdf5_serial;
function H5Dgather(src_space_id: Thid_t; src_buf: pointer; type_id: Thid_t; dst_buf_size: Tsize_t; dst_buf: pointer;
  op: TH5D_gather_func_t; op_data: pointer): Therr_t; cdecl; external libhdf5_serial;
function H5Dclose(dset_id: Thid_t): Therr_t; cdecl; external libhdf5_serial;
function H5Ddebug(dset_id: Thid_t): Therr_t; cdecl; external libhdf5_serial;
function H5Dformat_convert(dset_id: Thid_t): Therr_t; cdecl; external libhdf5_serial;
function H5Dget_chunk_index_type(did: Thid_t; idx_type: PH5D_chunk_index_t): Therr_t; cdecl; external libhdf5_serial;

const
  H5D_CHUNK_BTREE = H5D_CHUNK_IDX_BTREE;

  H5D_XFER_DIRECT_CHUNK_WRITE_FLAG_NAME = 'direct_chunk_flag';
  H5D_XFER_DIRECT_CHUNK_WRITE_FILTERS_NAME = 'direct_chunk_filters';
  H5D_XFER_DIRECT_CHUNK_WRITE_OFFSET_NAME = 'direct_chunk_offset';
  H5D_XFER_DIRECT_CHUNK_WRITE_DATASIZE_NAME = 'direct_chunk_datasize';

  H5D_XFER_DIRECT_CHUNK_READ_FLAG_NAME = 'direct_chunk_read_flag';
  H5D_XFER_DIRECT_CHUNK_READ_OFFSET_NAME = 'direct_chunk_read_offset';
  H5D_XFER_DIRECT_CHUNK_READ_FILTERS_NAME = 'direct_chunk_read_filters';

function H5Dcreate1(loc_id: Thid_t; name: pchar; type_id: Thid_t; space_id: Thid_t; dcpl_id: Thid_t): Thid_t; cdecl; external libhdf5_serial;
function H5Dopen1(loc_id: Thid_t; name: pchar): Thid_t; cdecl; external libhdf5_serial;
function H5Dextend(dset_id: Thid_t; size: Phsize_t): Therr_t; cdecl; external libhdf5_serial;

// === Konventiert am: 20-8-26 19:37:25 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}

{$ENDIF read_implementation}
