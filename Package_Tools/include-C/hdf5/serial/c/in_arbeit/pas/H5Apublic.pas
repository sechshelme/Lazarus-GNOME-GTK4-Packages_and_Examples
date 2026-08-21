unit H5Apublic;

interface

uses
  fp_hdf5, H5public;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PH5A_info_t = ^TH5A_info_t;
  TH5A_info_t = record
    corder_valid: Thbool_t;
    corder: TH5O_msg_crt_idx_t;
    cset: TH5T_cset_t;
    data_size: Thsize_t;
  end;

  TH5A_operator2_t = function(location_id: Thid_t; attr_name: pchar; ainfo: PH5A_info_t; op_data: pointer): Therr_t; cdecl;

function H5Aclose(attr_id: Thid_t): Therr_t; cdecl; external libhdf5;
function H5Acreate2(loc_id: Thid_t; attr_name: pchar; type_id: Thid_t; space_id: Thid_t; acpl_id: Thid_t;
  aapl_id: Thid_t): Thid_t; cdecl; external libhdf5;
function H5Acreate_by_name(loc_id: Thid_t; obj_name: pchar; attr_name: pchar; type_id: Thid_t; space_id: Thid_t;
  acpl_id: Thid_t; aapl_id: Thid_t; lapl_id: Thid_t): Thid_t; cdecl; external libhdf5;
function H5Adelete(loc_id: Thid_t; attr_name: pchar): Therr_t; cdecl; external libhdf5;
function H5Adelete_by_idx(loc_id: Thid_t; obj_name: pchar; idx_type: TH5_index_t; order: TH5_iter_order_t; n: Thsize_t;
  lapl_id: Thid_t): Therr_t; cdecl; external libhdf5;
function H5Adelete_by_name(loc_id: Thid_t; obj_name: pchar; attr_name: pchar; lapl_id: Thid_t): Therr_t; cdecl; external libhdf5;
function H5Aexists(obj_id: Thid_t; attr_name: pchar): Thtri_t; cdecl; external libhdf5;
function H5Aexists_by_name(obj_id: Thid_t; obj_name: pchar; attr_name: pchar; lapl_id: Thid_t): Thtri_t; cdecl; external libhdf5;
function H5Aget_create_plist(attr_id: Thid_t): Thid_t; cdecl; external libhdf5;
function H5Aget_info(attr_id: Thid_t; ainfo: PH5A_info_t): Therr_t; cdecl; external libhdf5;
function H5Aget_info_by_idx(loc_id: Thid_t; obj_name: pchar; idx_type: TH5_index_t; order: TH5_iter_order_t; n: Thsize_t;
  ainfo: PH5A_info_t; lapl_id: Thid_t): Therr_t; cdecl; external libhdf5;
function H5Aget_info_by_name(loc_id: Thid_t; obj_name: pchar; attr_name: pchar; ainfo: PH5A_info_t; lapl_id: Thid_t): Therr_t; cdecl; external libhdf5;
function H5Aget_name(attr_id: Thid_t; buf_size: Tsize_t; buf: pchar): Tssize_t; cdecl; external libhdf5;
function H5Aget_name_by_idx(loc_id: Thid_t; obj_name: pchar; idx_type: TH5_index_t; order: TH5_iter_order_t; n: Thsize_t;
  name: pchar; size: Tsize_t; lapl_id: Thid_t): Tssize_t; cdecl; external libhdf5;
function H5Aget_space(attr_id: Thid_t): Thid_t; cdecl; external libhdf5;
function H5Aget_storage_size(attr_id: Thid_t): Thsize_t; cdecl; external libhdf5;
function H5Aget_type(attr_id: Thid_t): Thid_t; cdecl; external libhdf5;
function H5Aiterate2(loc_id: Thid_t; idx_type: TH5_index_t; order: TH5_iter_order_t; idx: Phsize_t; op: TH5A_operator2_t;
  op_data: pointer): Therr_t; cdecl; external libhdf5;
function H5Aiterate_by_name(loc_id: Thid_t; obj_name: pchar; idx_type: TH5_index_t; order: TH5_iter_order_t; idx: Phsize_t;
  op: TH5A_operator2_t; op_data: pointer; lapl_id: Thid_t): Therr_t; cdecl; external libhdf5;
function H5Aopen(obj_id: Thid_t; attr_name: pchar; aapl_id: Thid_t): Thid_t; cdecl; external libhdf5;
function H5Aopen_by_idx(loc_id: Thid_t; obj_name: pchar; idx_type: TH5_index_t; order: TH5_iter_order_t; n: Thsize_t;
  aapl_id: Thid_t; lapl_id: Thid_t): Thid_t; cdecl; external libhdf5;
function H5Aopen_by_name(loc_id: Thid_t; obj_name: pchar; attr_name: pchar; aapl_id: Thid_t; lapl_id: Thid_t): Thid_t; cdecl; external libhdf5;
function H5Aread(attr_id: Thid_t; type_id: Thid_t; buf: pointer): Therr_t; cdecl; external libhdf5;
function H5Arename(loc_id: Thid_t; old_name: pchar; new_name: pchar): Therr_t; cdecl; external libhdf5;
function H5Awrite(attr_id: Thid_t; type_id: Thid_t; buf: pointer): Therr_t; cdecl; external libhdf5;
function H5Arename_by_name(loc_id: Thid_t; obj_name: pchar; old_attr_name: pchar; new_attr_name: pchar; lapl_id: Thid_t): Therr_t; cdecl; external libhdf5;

type
  TH5A_operator1_t = function(location_id: Thid_t; attr_name: pchar; operator_data: pointer): Therr_t; cdecl;

function H5Acreate1(loc_id: Thid_t; name: pchar; type_id: Thid_t; space_id: Thid_t; acpl_id: Thid_t): Thid_t; cdecl; external libhdf5;
function H5Aget_num_attrs(loc_id: Thid_t): longint; cdecl; external libhdf5;
function H5Aiterate1(loc_id: Thid_t; idx: Pdword; op: TH5A_operator1_t; op_data: pointer): Therr_t; cdecl; external libhdf5;
function H5Aopen_idx(loc_id: Thid_t; idx: dword): Thid_t; cdecl; external libhdf5;
function H5Aopen_name(loc_id: Thid_t; name: pchar): Thid_t; cdecl; external libhdf5;

// === Konventiert am: 20-8-26 19:37:33 ===


implementation



end.
