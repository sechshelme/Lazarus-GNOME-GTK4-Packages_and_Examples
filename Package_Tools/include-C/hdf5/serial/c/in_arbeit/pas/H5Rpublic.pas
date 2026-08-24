unit H5Rpublic;

interface

uses
  fp_hdf5, H5public, H5Ipublic, H5Opublic, H5Gpublic;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  H5R_OBJ_REF_BUF_SIZE = sizeof(Thaddr_t);
  H5R_DSET_REG_REF_BUF_SIZE = sizeof(Thaddr_t) + 4;

type
  PH5R_type_t = ^TH5R_type_t;
  TH5R_type_t = longint;
const
  H5R_BADTYPE = -(1);
  H5R_OBJECT = (-(1)) + 1;
  H5R_DATASET_REGION = (-(1)) + 2;
  H5R_MAXTYPE = (-(1)) + 3;

type
  Phobj_ref_t = ^Thobj_ref_t;
  Thobj_ref_t = Thaddr_t;

  Phdset_reg_ref_t = ^Thdset_reg_ref_t;
  Thdset_reg_ref_t = array[0..(H5R_DSET_REG_REF_BUF_SIZE) - 1] of byte;

function H5Rcreate(ref: pointer; loc_id: Thid_t; name: pchar; ref_type: TH5R_type_t; space_id: Thid_t): Therr_t; cdecl; external libhdf5_serial;
function H5Rdereference2(obj_id: Thid_t; oapl_id: Thid_t; ref_type: TH5R_type_t; ref: pointer): Thid_t; cdecl; external libhdf5_serial;
function H5Rget_region(dataset: Thid_t; ref_type: TH5R_type_t; ref: pointer): Thid_t; cdecl; external libhdf5_serial;
function H5Rget_obj_type2(id: Thid_t; ref_type: TH5R_type_t; _ref: pointer; obj_type: PH5O_type_t): Therr_t; cdecl; external libhdf5_serial;
function H5Rget_name(loc_id: Thid_t; ref_type: TH5R_type_t; ref: pointer; name: pchar; size: Tsize_t): Tssize_t; cdecl; external libhdf5_serial;
function H5Rget_obj_type1(id: Thid_t; ref_type: TH5R_type_t; ref: pointer): TH5G_obj_t; cdecl; external libhdf5_serial;
function H5Rdereference1(obj_id: Thid_t; ref_type: TH5R_type_t; ref: pointer): Thid_t; cdecl; external libhdf5_serial;

// === Konventiert am: 21-8-26 14:40:14 ===


implementation

end.
