{$IFDEF read_interface}


type
  PH5Z_filter_t = ^TH5Z_filter_t;
  TH5Z_filter_t = longint;

const
  H5Z_FILTER_ERROR = -(1);
  H5Z_FILTER_NONE = 0;
  H5Z_FILTER_DEFLATE = 1;
  H5Z_FILTER_SHUFFLE = 2;
  H5Z_FILTER_FLETCHER32 = 3;
  H5Z_FILTER_SZIP = 4;
  H5Z_FILTER_NBIT = 5;
  H5Z_FILTER_SCALEOFFSET = 6;
  H5Z_FILTER_RESERVED = 256;
  H5Z_FILTER_MAX = 65535;
  H5Z_FILTER_ALL = 0;
  H5Z_MAX_NFILTERS = 32;
  H5Z_FLAG_DEFMASK = $00ff;
  H5Z_FLAG_MANDATORY = $0000;
  H5Z_FLAG_OPTIONAL = $0001;
  H5Z_FLAG_INVMASK = $ff00;
  H5Z_FLAG_REVERSE = $0100;
  H5Z_FLAG_SKIP_EDC = $0200;
  H5_SZIP_ALLOW_K13_OPTION_MASK = 1;
  H5_SZIP_CHIP_OPTION_MASK = 2;
  H5_SZIP_EC_OPTION_MASK = 4;
  H5_SZIP_NN_OPTION_MASK = 32;
  H5_SZIP_MAX_PIXELS_PER_BLOCK = 32;
  H5Z_SHUFFLE_USER_NPARMS = 0;
  H5Z_SHUFFLE_TOTAL_NPARMS = 1;
  H5Z_SZIP_USER_NPARMS = 2;
  H5Z_SZIP_TOTAL_NPARMS = 4;
  H5Z_SZIP_PARM_MASK = 0;
  H5Z_SZIP_PARM_PPB = 1;
  H5Z_SZIP_PARM_BPP = 2;
  H5Z_SZIP_PARM_PPS = 3;
  H5Z_NBIT_USER_NPARMS = 0;
  H5Z_SCALEOFFSET_USER_NPARMS = 2;
  H5Z_SO_INT_MINBITS_DEFAULT = 0;

type
  PH5Z_SO_scale_type_t = ^TH5Z_SO_scale_type_t;
  TH5Z_SO_scale_type_t = longint;
const
  H5Z_SO_FLOAT_DSCALE = 0;
  H5Z_SO_FLOAT_ESCALE = 1;
  H5Z_SO_INT = 2;

const
  H5Z_CLASS_T_VERS = 1;

type
  PH5Z_EDC_t = ^TH5Z_EDC_t;
  TH5Z_EDC_t = longint;
const
  H5Z_ERROR_EDC = -(1);
  H5Z_DISABLE_EDC = 0;
  H5Z_ENABLE_EDC = 1;
  H5Z_NO_EDC = 2;

const
  H5Z_FILTER_CONFIG_ENCODE_ENABLED = $0001;
  H5Z_FILTER_CONFIG_DECODE_ENABLED = $0002;

type
  PH5Z_cb_return_t = ^TH5Z_cb_return_t;
  TH5Z_cb_return_t = longint;
const
  H5Z_CB_ERROR = -(1);
  H5Z_CB_FAIL = 0;
  H5Z_CB_CONT = 1;
  H5Z_CB_NO = 2;

type
  TH5Z_filter_func_t = function(filter: TH5Z_filter_t; buf: pointer; buf_size: Tsize_t; op_data: pointer): TH5Z_cb_return_t; cdecl;

  PH5Z_cb_t = ^TH5Z_cb_t;
  TH5Z_cb_t = record
    func: TH5Z_filter_func_t;
    op_data: pointer;
  end;

  TH5Z_can_apply_func_t = function(dcpl_id: Thid_t; type_id: Thid_t; space_id: Thid_t): Thtri_t; cdecl;
  TH5Z_set_local_func_t = function(dcpl_id: Thid_t; type_id: Thid_t; space_id: Thid_t): Therr_t; cdecl;
  TH5Z_func_t = function(flags: dword; cd_nelmts: Tsize_t; cd_values: Pdword; nbytes: Tsize_t; buf_size: Psize_t; buf: Ppointer): Tsize_t; cdecl;

  PH5Z_class2_t = ^TH5Z_class2_t;
  TH5Z_class2_t = record
    version: longint;
    id: TH5Z_filter_t;
    encoder_present: dword;
    decoder_present: dword;
    name: pchar;
    can_apply: TH5Z_can_apply_func_t;
    set_local: TH5Z_set_local_func_t;
    filter: TH5Z_func_t;
  end;

function H5Zregister(cls: pointer): Therr_t; cdecl; external libhdf5_serial;
function H5Zunregister(id: TH5Z_filter_t): Therr_t; cdecl; external libhdf5_serial;
function H5Zfilter_avail(id: TH5Z_filter_t): Thtri_t; cdecl; external libhdf5_serial;
function H5Zget_filter_info(filter: TH5Z_filter_t; filter_config_flags: Pdword): Therr_t; cdecl; external libhdf5_serial;

type
  PH5Z_class1_t = ^TH5Z_class1_t;
  TH5Z_class1_t = record
    id: TH5Z_filter_t;
    name: pchar;
    can_apply: TH5Z_can_apply_func_t;
    set_local: TH5Z_set_local_func_t;
    filter: TH5Z_func_t;
  end;

  // === Konventiert am: 21-8-26 14:40:01 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
