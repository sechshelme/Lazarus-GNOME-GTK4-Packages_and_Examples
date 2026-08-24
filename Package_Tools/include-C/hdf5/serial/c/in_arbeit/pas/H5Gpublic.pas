unit H5Gpublic;

interface

uses
  fp_hdf5, H5public, H5Ipublic, H5Lpublic, H5Opublic;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PH5G_storage_type_t = ^TH5G_storage_type_t;
  TH5G_storage_type_t = longint;
const
  H5G_STORAGE_TYPE_UNKNOWN = -(1);
  H5G_STORAGE_TYPE_SYMBOL_TABLE = (-(1)) + 1;
  H5G_STORAGE_TYPE_COMPACT = (-(1)) + 2;
  H5G_STORAGE_TYPE_DENSE = (-(1)) + 3;

type
  PH5G_info_t = ^TH5G_info_t;
  TH5G_info_t = record
    storage_type: TH5G_storage_type_t;
    nlinks: Thsize_t;
    max_corder: Tint64_t;
    mounted: Thbool_t;
  end;

function H5Gcreate2(loc_id: Thid_t; name: pchar; lcpl_id: Thid_t; gcpl_id: Thid_t; gapl_id: Thid_t): Thid_t; cdecl; external libhdf5_serial;
function H5Gcreate_anon(loc_id: Thid_t; gcpl_id: Thid_t; gapl_id: Thid_t): Thid_t; cdecl; external libhdf5_serial;
function H5Gopen2(loc_id: Thid_t; name: pchar; gapl_id: Thid_t): Thid_t; cdecl; external libhdf5_serial;
function H5Gget_create_plist(group_id: Thid_t): Thid_t; cdecl; external libhdf5_serial;
function H5Gget_info(loc_id: Thid_t; ginfo: PH5G_info_t): Therr_t; cdecl; external libhdf5_serial;
function H5Gget_info_by_name(loc_id: Thid_t; name: pchar; ginfo: PH5G_info_t; lapl_id: Thid_t): Therr_t; cdecl; external libhdf5_serial;
function H5Gget_info_by_idx(loc_id: Thid_t; group_name: pchar; idx_type: TH5_index_t; order: TH5_iter_order_t; n: Thsize_t;
  ginfo: PH5G_info_t; lapl_id: Thid_t): Therr_t; cdecl; external libhdf5_serial;
function H5Gflush(group_id: Thid_t): Therr_t; cdecl; external libhdf5_serial;
function H5Grefresh(group_id: Thid_t): Therr_t; cdecl; external libhdf5_serial;
function H5Gclose(group_id: Thid_t): Therr_t; cdecl; external libhdf5_serial;

const
  H5G_SAME_LOC = H5L_SAME_LOC;
  H5G_LINK_ERROR = H5L_TYPE_ERROR;
  H5G_LINK_HARD = H5L_TYPE_HARD;
  H5G_LINK_SOFT = H5L_TYPE_SOFT;
  H5G_NTYPES = 256;
  H5G_NLIBTYPES = 8;
  H5G_NUSERTYPES = H5G_NTYPES - H5G_NLIBTYPES;
type
  TH5G_link_t = TH5L_type_t;

function H5G_USERTYPE(X: longint): longint;

type
  PH5G_obj_t = ^TH5G_obj_t;
  TH5G_obj_t = longint;
const
  H5G_UNKNOWN = -(1);
  H5G_GROUP = (-(1)) + 1;
  H5G_DATASET = (-(1)) + 2;
  H5G_TYPE = (-(1)) + 3;
  H5G_LINK = (-(1)) + 4;
  H5G_UDLINK = (-(1)) + 5;
  H5G_RESERVED_5 = (-(1)) + 6;
  H5G_RESERVED_6 = (-(1)) + 7;
  H5G_RESERVED_7 = (-(1)) + 8;

type
  TH5G_iterate_t = function(group: Thid_t; name: pchar; op_data: pointer): Therr_t; cdecl;

  PH5G_stat_t = ^TH5G_stat_t;
  TH5G_stat_t = record
    fileno: array[0..1] of dword;
    objno: array[0..1] of dword;
    nlink: dword;
    _type: TH5G_obj_t;
    mtime: Ttime_t;
    linklen: Tsize_t;
    ohdr: TH5O_stat_t;
  end;

function H5Gcreate1(loc_id: Thid_t; name: pchar; size_hint: Tsize_t): Thid_t; cdecl; external libhdf5_serial;
function H5Gopen1(loc_id: Thid_t; name: pchar): Thid_t; cdecl; external libhdf5_serial;
function H5Glink(cur_loc_id: Thid_t; _type: TH5G_link_t; cur_name: pchar; new_name: pchar): Therr_t; cdecl; external libhdf5_serial;
function H5Glink2(cur_loc_id: Thid_t; cur_name: pchar; _type: TH5G_link_t; new_loc_id: Thid_t; new_name: pchar): Therr_t; cdecl; external libhdf5_serial;
function H5Gmove(src_loc_id: Thid_t; src_name: pchar; dst_name: pchar): Therr_t; cdecl; external libhdf5_serial;
function H5Gmove2(src_loc_id: Thid_t; src_name: pchar; dst_loc_id: Thid_t; dst_name: pchar): Therr_t; cdecl; external libhdf5_serial;
function H5Gunlink(loc_id: Thid_t; name: pchar): Therr_t; cdecl; external libhdf5_serial;
function H5Gget_linkval(loc_id: Thid_t; name: pchar; size: Tsize_t; buf: pchar): Therr_t; cdecl; external libhdf5_serial;
function H5Gset_comment(loc_id: Thid_t; name: pchar; comment: pchar): Therr_t; cdecl; external libhdf5_serial;
function H5Gget_comment(loc_id: Thid_t; name: pchar; bufsize: Tsize_t; buf: pchar): longint; cdecl; external libhdf5_serial;
function H5Giterate(loc_id: Thid_t; name: pchar; idx: Plongint; op: TH5G_iterate_t; op_data: pointer): Therr_t; cdecl; external libhdf5_serial;
function H5Gget_num_objs(loc_id: Thid_t; num_objs: Phsize_t): Therr_t; cdecl; external libhdf5_serial;
function H5Gget_objinfo(loc_id: Thid_t; name: pchar; follow_link: Thbool_t; statbuf: PH5G_stat_t): Therr_t; cdecl; external libhdf5_serial;
function H5Gget_objname_by_idx(loc_id: Thid_t; idx: Thsize_t; name: pchar; size: Tsize_t): Tssize_t; cdecl; external libhdf5_serial;
function H5Gget_objtype_by_idx(loc_id: Thid_t; idx: Thsize_t): TH5G_obj_t; cdecl; external libhdf5_serial;

// === Konventiert am: 21-8-26 14:14:16 ===


implementation


function H5G_USERTYPE(X: longint): longint;
begin
  H5G_USERTYPE := 8 + X;
end;


end.
