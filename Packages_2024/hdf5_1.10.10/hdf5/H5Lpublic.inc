{$IFDEF read_interface}


const
  H5L_SAME_LOC = 0;
  H5L_LINK_CLASS_T_VERS = 1;
  H5L_LINK_CLASS_T_VERS_0 = 0;

type
  PH5L_type_t = ^TH5L_type_t;
  TH5L_type_t = longint;
const
  H5L_TYPE_ERROR = -(1);
  H5L_TYPE_HARD = 0;
  H5L_TYPE_SOFT = 1;
  H5L_TYPE_EXTERNAL = 64;
  H5L_TYPE_MAX = 255;

const
  H5L_TYPE_BUILTIN_MAX = H5L_TYPE_SOFT;
  H5L_TYPE_UD_MIN = H5L_TYPE_EXTERNAL;

type
  PH5L_info_t = ^TH5L_info_t;
  TH5L_info_t = record
    _type: TH5L_type_t;
    corder_valid: Thbool_t;
    corder: Tint64_t;
    cset: TH5T_cset_t;
    u: record
      case longint of
        0: (address: Thaddr_t);
        1: (val_size: Tsize_t);
      end;
  end;

  TH5L_create_func_t = function(link_name: pchar; loc_group: Thid_t; lnkdata: pointer; lnkdata_size: Tsize_t; lcpl_id: Thid_t): Therr_t; cdecl;
  TH5L_move_func_t = function(new_name: pchar; new_loc: Thid_t; lnkdata: pointer; lnkdata_size: Tsize_t): Therr_t; cdecl;
  TH5L_copy_func_t = function(new_name: pchar; new_loc: Thid_t; lnkdata: pointer; lnkdata_size: Tsize_t): Therr_t; cdecl;
  TH5L_traverse_0_func_t = function(link_name: pchar; cur_group: Thid_t; lnkdata: pointer; lnkdata_size: Tsize_t; lapl_id: Thid_t): Thid_t; cdecl;
  TH5L_traverse_func_t = function(link_name: pchar; cur_group: Thid_t; lnkdata: pointer; lnkdata_size: Tsize_t; lapl_id: Thid_t; dxpl_id: Thid_t): Thid_t; cdecl;
  TH5L_delete_func_t = function(link_name: pchar; file_: Thid_t; lnkdata: pointer; lnkdata_size: Tsize_t): Therr_t; cdecl;
  TH5L_query_func_t = function(link_name: pchar; lnkdata: pointer; lnkdata_size: Tsize_t; buf: pointer; buf_size: Tsize_t): Tssize_t; cdecl;

  PH5L_class_0_t = ^TH5L_class_0_t;
  TH5L_class_0_t = record
    version: longint;
    id: TH5L_type_t;
    comment: pchar;
    create_func: TH5L_create_func_t;
    move_func: TH5L_move_func_t;
    copy_func: TH5L_copy_func_t;
    trav_func: TH5L_traverse_0_func_t;
    del_func: TH5L_delete_func_t;
    query_func: TH5L_query_func_t;
  end;

  PH5L_class_t = ^TH5L_class_t;
  TH5L_class_t = record
    version: longint;
    id: TH5L_type_t;
    comment: pchar;
    create_func: TH5L_create_func_t;
    move_func: TH5L_move_func_t;
    copy_func: TH5L_copy_func_t;
    trav_func: TH5L_traverse_func_t;
    del_func: TH5L_delete_func_t;
    query_func: TH5L_query_func_t;
  end;

  TH5L_iterate_t = function(group: Thid_t; name: pchar; info: PH5L_info_t; op_data: pointer): Therr_t; cdecl;
  TH5L_elink_traverse_t = function(parent_file_name: pchar; parent_group_name: pchar; child_file_name: pchar; child_object_name: pchar; acc_flags: Pdword; fapl_id: Thid_t; op_data: pointer): Therr_t; cdecl;
  PH5L_elink_traverse_t = ^TH5L_elink_traverse_t;

function H5Lmove(src_loc: Thid_t; src_name: pchar; dst_loc: Thid_t; dst_name: pchar; lcpl_id: Thid_t;
  lapl_id: Thid_t): Therr_t; cdecl; external libhdf5_serial;
function H5Lcopy(src_loc: Thid_t; src_name: pchar; dst_loc: Thid_t; dst_name: pchar; lcpl_id: Thid_t;
  lapl_id: Thid_t): Therr_t; cdecl; external libhdf5_serial;
function H5Lcreate_hard(cur_loc: Thid_t; cur_name: pchar; dst_loc: Thid_t; dst_name: pchar; lcpl_id: Thid_t;
  lapl_id: Thid_t): Therr_t; cdecl; external libhdf5_serial;
function H5Lcreate_soft(link_target: pchar; link_loc_id: Thid_t; link_name: pchar; lcpl_id: Thid_t; lapl_id: Thid_t): Therr_t; cdecl; external libhdf5_serial;
function H5Ldelete(loc_id: Thid_t; name: pchar; lapl_id: Thid_t): Therr_t; cdecl; external libhdf5_serial;
function H5Ldelete_by_idx(loc_id: Thid_t; group_name: pchar; idx_type: TH5_index_t; order: TH5_iter_order_t; n: Thsize_t;
  lapl_id: Thid_t): Therr_t; cdecl; external libhdf5_serial;
function H5Lget_val(loc_id: Thid_t; name: pchar; buf: pointer; size: Tsize_t; lapl_id: Thid_t): Therr_t; cdecl; external libhdf5_serial;
function H5Lget_val_by_idx(loc_id: Thid_t; group_name: pchar; idx_type: TH5_index_t; order: TH5_iter_order_t; n: Thsize_t;
  buf: pointer; size: Tsize_t; lapl_id: Thid_t): Therr_t; cdecl; external libhdf5_serial;
function H5Lexists(loc_id: Thid_t; name: pchar; lapl_id: Thid_t): Thtri_t; cdecl; external libhdf5_serial;
function H5Lget_info(loc_id: Thid_t; name: pchar; linfo: PH5L_info_t; lapl_id: Thid_t): Therr_t; cdecl; external libhdf5_serial;
function H5Lget_info_by_idx(loc_id: Thid_t; group_name: pchar; idx_type: TH5_index_t; order: TH5_iter_order_t; n: Thsize_t;
  linfo: PH5L_info_t; lapl_id: Thid_t): Therr_t; cdecl; external libhdf5_serial;
function H5Lget_name_by_idx(loc_id: Thid_t; group_name: pchar; idx_type: TH5_index_t; order: TH5_iter_order_t; n: Thsize_t;
  name: pchar; size: Tsize_t; lapl_id: Thid_t): Tssize_t; cdecl; external libhdf5_serial;
function H5Literate(grp_id: Thid_t; idx_type: TH5_index_t; order: TH5_iter_order_t; idx: Phsize_t; op: TH5L_iterate_t;
  op_data: pointer): Therr_t; cdecl; external libhdf5_serial;
function H5Literate_by_name(loc_id: Thid_t; group_name: pchar; idx_type: TH5_index_t; order: TH5_iter_order_t; idx: Phsize_t;
  op: TH5L_iterate_t; op_data: pointer; lapl_id: Thid_t): Therr_t; cdecl; external libhdf5_serial;
function H5Lvisit(grp_id: Thid_t; idx_type: TH5_index_t; order: TH5_iter_order_t; op: TH5L_iterate_t; op_data: pointer): Therr_t; cdecl; external libhdf5_serial;
function H5Lvisit_by_name(loc_id: Thid_t; group_name: pchar; idx_type: TH5_index_t; order: TH5_iter_order_t; op: TH5L_iterate_t;
  op_data: pointer; lapl_id: Thid_t): Therr_t; cdecl; external libhdf5_serial;
function H5Lcreate_ud(link_loc_id: Thid_t; link_name: pchar; link_type: TH5L_type_t; udata: pointer; udata_size: Tsize_t;
  lcpl_id: Thid_t; lapl_id: Thid_t): Therr_t; cdecl; external libhdf5_serial;
function H5Lregister(cls: PH5L_class_t): Therr_t; cdecl; external libhdf5_serial;
function H5Lunregister(id: TH5L_type_t): Therr_t; cdecl; external libhdf5_serial;
function H5Lis_registered(id: TH5L_type_t): Thtri_t; cdecl; external libhdf5_serial;
function H5Lunpack_elink_val(ext_linkval: pointer; link_size: Tsize_t; flags: Pdword; filename: PPchar; obj_path: PPchar): Therr_t; cdecl; external libhdf5_serial;
function H5Lcreate_external(file_name: pchar; obj_name: pchar; link_loc_id: Thid_t; link_name: pchar; lcpl_id: Thid_t;
  lapl_id: Thid_t): Therr_t; cdecl; external libhdf5_serial;

// === Konventiert am: 21-8-26 14:23:57 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
