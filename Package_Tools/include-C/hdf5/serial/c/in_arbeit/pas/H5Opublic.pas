unit H5Opublic;

interface

uses
  fp_hdf5, H5public, H5Ipublic;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  H5O_COPY_SHALLOW_HIERARCHY_FLAG = $0001;
  H5O_COPY_EXPAND_SOFT_LINK_FLAG = $0002;
  H5O_COPY_EXPAND_EXT_LINK_FLAG = $0004;
  H5O_COPY_EXPAND_REFERENCE_FLAG = $0008;
  H5O_COPY_WITHOUT_ATTR_FLAG = $0010;
  H5O_COPY_PRESERVE_NULL_FLAG = $0020;
  H5O_COPY_MERGE_COMMITTED_DTYPE_FLAG = $0040;
  H5O_COPY_ALL = $007F;
  H5O_SHMESG_NONE_FLAG = $0000;

const
  H5O_SHMESG_SDSPACE_FLAG = 1 shl $0001;
  H5O_SHMESG_DTYPE_FLAG = 1 shl $0003;
  H5O_SHMESG_FILL_FLAG = 1 shl $0005;
  H5O_SHMESG_PLINE_FLAG = 1 shl $000b;
  H5O_SHMESG_ATTR_FLAG = 1 shl $000c;

const
  H5O_SHMESG_ALL_FLAG = (((H5O_SHMESG_SDSPACE_FLAG or H5O_SHMESG_DTYPE_FLAG) or H5O_SHMESG_FILL_FLAG) or H5O_SHMESG_PLINE_FLAG) or H5O_SHMESG_ATTR_FLAG;
  H5O_HDR_CHUNK0_SIZE = $03;
  H5O_HDR_ATTR_CRT_ORDER_TRACKED = $04;
  H5O_HDR_ATTR_CRT_ORDER_INDEXED = $08;
  H5O_HDR_ATTR_STORE_PHASE_CHANGE = $10;
  H5O_HDR_STORE_TIMES = $20;
  H5O_HDR_ALL_FLAGS = (((H5O_HDR_CHUNK0_SIZE or H5O_HDR_ATTR_CRT_ORDER_TRACKED) or H5O_HDR_ATTR_CRT_ORDER_INDEXED) or H5O_HDR_ATTR_STORE_PHASE_CHANGE) or H5O_HDR_STORE_TIMES;
  H5O_SHMESG_MAX_NINDEXES = 8;
  H5O_SHMESG_MAX_LIST_SIZE = 5000;
  H5O_INFO_BASIC = $0001;
  H5O_INFO_TIME = $0002;
  H5O_INFO_NUM_ATTRS = $0004;
  H5O_INFO_HDR = $0008;
  H5O_INFO_META_SIZE = $0010;
  H5O_INFO_ALL = (((H5O_INFO_BASIC or H5O_INFO_TIME) or H5O_INFO_NUM_ATTRS) or H5O_INFO_HDR) or H5O_INFO_META_SIZE;

type
  PH5O_type_t = ^TH5O_type_t;
  TH5O_type_t = longint;
const
  H5O_TYPE_UNKNOWN = -(1);
  H5O_TYPE_GROUP = (-(1)) + 1;
  H5O_TYPE_DATASET = (-(1)) + 2;
  H5O_TYPE_NAMED_DATATYPE = (-(1)) + 3;
  H5O_TYPE_NTYPES = (-(1)) + 4;

type
  PH5O_hdr_info_t = ^TH5O_hdr_info_t;
  TH5O_hdr_info_t = record
    version: dword;
    nmesgs: dword;
    nchunks: dword;
    flags: dword;
    space: record
      total: Thsize_t;
      meta: Thsize_t;
      mesg: Thsize_t;
      free: Thsize_t;
      end;
    mesg: record
      present: Tuint64_t;
      shared: Tuint64_t;
      end;
  end;

  PH5O_info_t = ^TH5O_info_t;
  TH5O_info_t = record
    fileno: dword;
    addr: Thaddr_t;
    _type: TH5O_type_t;
    rc: dword;
    atime: Ttime_t;
    mtime: Ttime_t;
    ctime: Ttime_t;
    btime: Ttime_t;
    num_attrs: Thsize_t;
    hdr: TH5O_hdr_info_t;
    meta_size: record
      obj: TH5_ih_info_t;
      attr: TH5_ih_info_t;
      end;
  end;

  PH5O_msg_crt_idx_t = ^TH5O_msg_crt_idx_t;
  TH5O_msg_crt_idx_t = Tuint32_t;

  TH5O_iterate_t = function(obj: Thid_t; name: pchar; info: PH5O_info_t; op_data: pointer): Therr_t; cdecl;

type
  PH5O_mcdt_search_ret_t = ^TH5O_mcdt_search_ret_t;
  TH5O_mcdt_search_ret_t = longint;
const
  H5O_MCDT_SEARCH_ERROR = -(1);
  H5O_MCDT_SEARCH_CONT = (-(1)) + 1;
  H5O_MCDT_SEARCH_STOP = (-(1)) + 2;

type
  TH5O_mcdt_search_cb_t = function(op_data: pointer): TH5O_mcdt_search_ret_t; cdecl;
  PH5O_mcdt_search_cb_t = ^TH5O_mcdt_search_cb_t;

function H5Oopen(loc_id: Thid_t; name: pchar; lapl_id: Thid_t): Thid_t; cdecl; external libhdf5;
function H5Oopen_by_addr(loc_id: Thid_t; addr: Thaddr_t): Thid_t; cdecl; external libhdf5;
function H5Oopen_by_idx(loc_id: Thid_t; group_name: pchar; idx_type: TH5_index_t; order: TH5_iter_order_t; n: Thsize_t;
  lapl_id: Thid_t): Thid_t; cdecl; external libhdf5;
function H5Oexists_by_name(loc_id: Thid_t; name: pchar; lapl_id: Thid_t): Thtri_t; cdecl; external libhdf5;
function H5Oget_info2(loc_id: Thid_t; oinfo: PH5O_info_t; fields: dword): Therr_t; cdecl; external libhdf5;
function H5Oget_info_by_name2(loc_id: Thid_t; name: pchar; oinfo: PH5O_info_t; fields: dword; lapl_id: Thid_t): Therr_t; cdecl; external libhdf5;
function H5Oget_info_by_idx2(loc_id: Thid_t; group_name: pchar; idx_type: TH5_index_t; order: TH5_iter_order_t; n: Thsize_t;
  oinfo: PH5O_info_t; fields: dword; lapl_id: Thid_t): Therr_t; cdecl; external libhdf5;
function H5Olink(obj_id: Thid_t; new_loc_id: Thid_t; new_name: pchar; lcpl_id: Thid_t; lapl_id: Thid_t): Therr_t; cdecl; external libhdf5;
function H5Oincr_refcount(object_id: Thid_t): Therr_t; cdecl; external libhdf5;
function H5Odecr_refcount(object_id: Thid_t): Therr_t; cdecl; external libhdf5;
function H5Ocopy(src_loc_id: Thid_t; src_name: pchar; dst_loc_id: Thid_t; dst_name: pchar; ocpypl_id: Thid_t;
  lcpl_id: Thid_t): Therr_t; cdecl; external libhdf5;
function H5Oset_comment(obj_id: Thid_t; comment: pchar): Therr_t; cdecl; external libhdf5;
function H5Oset_comment_by_name(loc_id: Thid_t; name: pchar; comment: pchar; lapl_id: Thid_t): Therr_t; cdecl; external libhdf5;
function H5Oget_comment(obj_id: Thid_t; comment: pchar; bufsize: Tsize_t): Tssize_t; cdecl; external libhdf5;
function H5Oget_comment_by_name(loc_id: Thid_t; name: pchar; comment: pchar; bufsize: Tsize_t; lapl_id: Thid_t): Tssize_t; cdecl; external libhdf5;
function H5Ovisit2(obj_id: Thid_t; idx_type: TH5_index_t; order: TH5_iter_order_t; op: TH5O_iterate_t; op_data: pointer;
  fields: dword): Therr_t; cdecl; external libhdf5;
function H5Ovisit_by_name2(loc_id: Thid_t; obj_name: pchar; idx_type: TH5_index_t; order: TH5_iter_order_t; op: TH5O_iterate_t;
  op_data: pointer; fields: dword; lapl_id: Thid_t): Therr_t; cdecl; external libhdf5;
function H5Oclose(object_id: Thid_t): Therr_t; cdecl; external libhdf5;
function H5Oflush(obj_id: Thid_t): Therr_t; cdecl; external libhdf5;
function H5Orefresh(oid: Thid_t): Therr_t; cdecl; external libhdf5;
function H5Odisable_mdc_flushes(object_id: Thid_t): Therr_t; cdecl; external libhdf5;
function H5Oenable_mdc_flushes(object_id: Thid_t): Therr_t; cdecl; external libhdf5;
function H5Oare_mdc_flushes_disabled(object_id: Thid_t; are_disabled: Phbool_t): Therr_t; cdecl; external libhdf5;
function H5Oget_info(loc_id: Thid_t; oinfo: PH5O_info_t): Therr_t; cdecl; external libhdf5;
function H5Oget_info_by_name(loc_id: Thid_t; name: pchar; oinfo: PH5O_info_t; lapl_id: Thid_t): Therr_t; cdecl; external libhdf5;
function H5Oget_info_by_idx(loc_id: Thid_t; group_name: pchar; idx_type: TH5_index_t; order: TH5_iter_order_t; n: Thsize_t;
  oinfo: PH5O_info_t; lapl_id: Thid_t): Therr_t; cdecl; external libhdf5;
function H5Ovisit(obj_id: Thid_t; idx_type: TH5_index_t; order: TH5_iter_order_t; op: TH5O_iterate_t; op_data: pointer): Therr_t; cdecl; external libhdf5;
function H5Ovisit_by_name(loc_id: Thid_t; obj_name: pchar; idx_type: TH5_index_t; order: TH5_iter_order_t; op: TH5O_iterate_t;
  op_data: pointer; lapl_id: Thid_t): Therr_t; cdecl; external libhdf5;
function H5Oget_info1(loc_id: Thid_t; oinfo: PH5O_info_t): Therr_t; cdecl; external libhdf5;
function H5Oget_info_by_name1(loc_id: Thid_t; name: pchar; oinfo: PH5O_info_t; lapl_id: Thid_t): Therr_t; cdecl; external libhdf5;
function H5Oget_info_by_idx1(loc_id: Thid_t; group_name: pchar; idx_type: TH5_index_t; order: TH5_iter_order_t; n: Thsize_t;
  oinfo: PH5O_info_t; lapl_id: Thid_t): Therr_t; cdecl; external libhdf5;
function H5Ovisit1(obj_id: Thid_t; idx_type: TH5_index_t; order: TH5_iter_order_t; op: TH5O_iterate_t; op_data: pointer): Therr_t; cdecl; external libhdf5;
function H5Ovisit_by_name1(loc_id: Thid_t; obj_name: pchar; idx_type: TH5_index_t; order: TH5_iter_order_t; op: TH5O_iterate_t;
  op_data: pointer; lapl_id: Thid_t): Therr_t; cdecl; external libhdf5;

type
  PH5O_stat_t = ^TH5O_stat_t;
  TH5O_stat_t = record
    size: Thsize_t;
    free: Thsize_t;
    nmesgs: dword;
    nchunks: dword;
  end;

  // === Konventiert am: 21-8-26 14:23:49 ===


implementation

end.
