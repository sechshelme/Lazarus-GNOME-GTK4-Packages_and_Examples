{$IFDEF read_interface}


type
  PH5I_type_t = ^TH5I_type_t;
  TH5I_type_t = longint;
const
  H5I_UNINIT = -(2);
  H5I_BADID = -(1);
  H5I_FILE = 1;
  H5I_GROUP = 2;
  H5I_DATATYPE = 3;
  H5I_DATASPACE = 4;
  H5I_DATASET = 5;
  H5I_ATTR = 6;
  H5I_REFERENCE = 7;
  H5I_VFL = 8;
  H5I_GENPROP_CLS = 9;
  H5I_GENPROP_LST = 10;
  H5I_ERROR_CLASS = 11;
  H5I_ERROR_MSG = 12;
  H5I_ERROR_STACK = 13;
  H5I_NTYPES = 14;

type
  Phid_t = ^Thid_t;
  Thid_t = Tint64_t;

const
  H5I_INVALID_HID = -(1);

type
  TH5I_free_t = function(para1: pointer): Therr_t; cdecl;
  TH5I_search_func_t = function(obj: pointer; id: Thid_t; key: pointer): longint; cdecl;

function H5Iregister(_type: TH5I_type_t; obj: pointer): Thid_t; cdecl; external libhdf5_serial;
function H5Iobject_verify(id: Thid_t; _type: TH5I_type_t): pointer; cdecl; external libhdf5_serial;
function H5Iremove_verify(id: Thid_t; _type: TH5I_type_t): pointer; cdecl; external libhdf5_serial;
function H5Iget_type(id: Thid_t): TH5I_type_t; cdecl; external libhdf5_serial;
function H5Iget_file_id(id: Thid_t): Thid_t; cdecl; external libhdf5_serial;
function H5Iget_name(id: Thid_t; name: pchar; size: Tsize_t): Tssize_t; cdecl; external libhdf5_serial;
function H5Iinc_ref(id: Thid_t): longint; cdecl; external libhdf5_serial;
function H5Idec_ref(id: Thid_t): longint; cdecl; external libhdf5_serial;
function H5Iget_ref(id: Thid_t): longint; cdecl; external libhdf5_serial;
function H5Iregister_type(hash_size: Tsize_t; reserved: dword; free_func: TH5I_free_t): TH5I_type_t; cdecl; external libhdf5_serial;
function H5Iclear_type(_type: TH5I_type_t; force: Thbool_t): Therr_t; cdecl; external libhdf5_serial;
function H5Idestroy_type(_type: TH5I_type_t): Therr_t; cdecl; external libhdf5_serial;
function H5Iinc_type_ref(_type: TH5I_type_t): longint; cdecl; external libhdf5_serial;
function H5Idec_type_ref(_type: TH5I_type_t): longint; cdecl; external libhdf5_serial;
function H5Iget_type_ref(_type: TH5I_type_t): longint; cdecl; external libhdf5_serial;
function H5Isearch(_type: TH5I_type_t; func: TH5I_search_func_t; key: pointer): pointer; cdecl; external libhdf5_serial;
function H5Inmembers(_type: TH5I_type_t; num_members: Phsize_t): Therr_t; cdecl; external libhdf5_serial;
function H5Itype_exists(_type: TH5I_type_t): Thtri_t; cdecl; external libhdf5_serial;
function H5Iis_valid(id: Thid_t): Thtri_t; cdecl; external libhdf5_serial;

// === Konventiert am: 21-8-26 14:24:03 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
