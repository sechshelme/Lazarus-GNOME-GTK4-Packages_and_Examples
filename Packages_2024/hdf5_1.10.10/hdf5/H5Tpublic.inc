{$IFDEF read_interface}


type
  PH5T_class_t = ^TH5T_class_t;
  TH5T_class_t = longint;
const
  H5T_NO_CLASS = -(1);
  H5T_INTEGER = 0;
  H5T_FLOAT = 1;
  H5T_TIME = 2;
  H5T_STRING = 3;
  H5T_BITFIELD = 4;
  H5T_OPAQUE = 5;
  H5T_COMPOUND = 6;
  H5T_REFERENCE = 7;
  H5T_ENUM = 8;
  H5T_VLEN = 9;
  H5T_ARRAY = 10;
  H5T_NCLASSES = 11;

type
  PH5T_order_t = ^TH5T_order_t;
  TH5T_order_t = longint;
const
  H5T_ORDER_ERROR = -(1);
  H5T_ORDER_LE = 0;
  H5T_ORDER_BE = 1;
  H5T_ORDER_VAX = 2;
  H5T_ORDER_MIXED = 3;
  H5T_ORDER_NONE = 4;

type
  PH5T_sign_t = ^TH5T_sign_t;
  TH5T_sign_t = longint;
const
  H5T_SGN_ERROR = -(1);
  H5T_SGN_NONE = 0;
  H5T_SGN_2 = 1;
  H5T_NSGN = 2;

type
  PH5T_norm_t = ^TH5T_norm_t;
  TH5T_norm_t = longint;
const
  H5T_NORM_ERROR = -(1);
  H5T_NORM_IMPLIED = 0;
  H5T_NORM_MSBSET = 1;
  H5T_NORM_NONE = 2;

type
  PH5T_cset_t = ^TH5T_cset_t;
  TH5T_cset_t = longint;
const
  H5T_CSET_ERROR = -(1);
  H5T_CSET_ASCII = 0;
  H5T_CSET_UTF8 = 1;
  H5T_CSET_RESERVED_2 = 2;
  H5T_CSET_RESERVED_3 = 3;
  H5T_CSET_RESERVED_4 = 4;
  H5T_CSET_RESERVED_5 = 5;
  H5T_CSET_RESERVED_6 = 6;
  H5T_CSET_RESERVED_7 = 7;
  H5T_CSET_RESERVED_8 = 8;
  H5T_CSET_RESERVED_9 = 9;
  H5T_CSET_RESERVED_10 = 10;
  H5T_CSET_RESERVED_11 = 11;
  H5T_CSET_RESERVED_12 = 12;
  H5T_CSET_RESERVED_13 = 13;
  H5T_CSET_RESERVED_14 = 14;
  H5T_CSET_RESERVED_15 = 15;

const
  H5T_NCSET = H5T_CSET_RESERVED_2;

type
  PH5T_str_t = ^TH5T_str_t;
  TH5T_str_t = longint;
const
  H5T_STR_ERROR = -(1);
  H5T_STR_NULLTERM = 0;
  H5T_STR_NULLPAD = 1;
  H5T_STR_SPACEPAD = 2;
  H5T_STR_RESERVED_3 = 3;
  H5T_STR_RESERVED_4 = 4;
  H5T_STR_RESERVED_5 = 5;
  H5T_STR_RESERVED_6 = 6;
  H5T_STR_RESERVED_7 = 7;
  H5T_STR_RESERVED_8 = 8;
  H5T_STR_RESERVED_9 = 9;
  H5T_STR_RESERVED_10 = 10;
  H5T_STR_RESERVED_11 = 11;
  H5T_STR_RESERVED_12 = 12;
  H5T_STR_RESERVED_13 = 13;
  H5T_STR_RESERVED_14 = 14;
  H5T_STR_RESERVED_15 = 15;

const
  H5T_NSTR = H5T_STR_RESERVED_3;

type
  PH5T_pad_t = ^TH5T_pad_t;
  TH5T_pad_t = longint;
const
  H5T_PAD_ERROR = -(1);
  H5T_PAD_ZERO = 0;
  H5T_PAD_ONE = 1;
  H5T_PAD_BACKGROUND = 2;
  H5T_NPAD = 3;

type
  PH5T_cmd_t = ^TH5T_cmd_t;
  TH5T_cmd_t = longint;
const
  H5T_CONV_INIT = 0;
  H5T_CONV_CONV = 1;
  H5T_CONV_FREE = 2;

type
  PH5T_bkg_t = ^TH5T_bkg_t;
  TH5T_bkg_t = longint;
const
  H5T_BKG_NO = 0;
  H5T_BKG_TEMP = 1;
  H5T_BKG_YES = 2;

type
  PPH5T_cdata_t = ^PH5T_cdata_t;
  PH5T_cdata_t = ^TH5T_cdata_t;
  TH5T_cdata_t = record
    command: TH5T_cmd_t;
    need_bkg: TH5T_bkg_t;
    recalc: Thbool_t;
    priv: pointer;
  end;

type
  PH5T_pers_t = ^TH5T_pers_t;
  TH5T_pers_t = longint;
const
  H5T_PERS_DONTCARE = -(1);
  H5T_PERS_HARD = 0;
  H5T_PERS_SOFT = 1;

type
  PH5T_direction_t = ^TH5T_direction_t;
  TH5T_direction_t = longint;
const
  H5T_DIR_DEFAULT = 0;
  H5T_DIR_ASCEND = 1;
  H5T_DIR_DESCEND = 2;

type
  PH5T_conv_except_t = ^TH5T_conv_except_t;
  TH5T_conv_except_t = longint;
const
  H5T_CONV_EXCEPT_RANGE_HI = 0;
  H5T_CONV_EXCEPT_RANGE_LOW = 1;
  H5T_CONV_EXCEPT_PRECISION = 2;
  H5T_CONV_EXCEPT_TRUNCATE = 3;
  H5T_CONV_EXCEPT_PINF = 4;
  H5T_CONV_EXCEPT_NINF = 5;
  H5T_CONV_EXCEPT_NAN = 6;

type
  PH5T_conv_ret_t = ^TH5T_conv_ret_t;
  TH5T_conv_ret_t = longint;
const
  H5T_CONV_ABORT = -(1);
  H5T_CONV_UNHANDLED = 0;
  H5T_CONV_HANDLED = 1;

type
  Phvl_t = ^Thvl_t;
  Thvl_t = record
    len: Tsize_t;
    p: pointer;
  end;

const
  H5T_VARIABLE : Tsize_t  =-1;
  H5T_OPAQUE_TAG_MAX = 256;

type
  TH5T_conv_t = function(src_id: Thid_t; dst_id: Thid_t; cdata: PH5T_cdata_t; nelmts: Tsize_t; buf_stride: Tsize_t; bkg_stride: Tsize_t; buf: pointer; bkg: pointer; dset_xfer_plist: Thid_t): Therr_t; cdecl;
  TH5T_conv_except_func_t = function(except_type: TH5T_conv_except_t; src_id: Thid_t; dst_id: Thid_t; src_buf: pointer; dst_buf: pointer; user_data: pointer): TH5T_conv_ret_t; cdecl;
  PH5T_conv_except_func_t = ^TH5T_conv_except_func_t;

var
  H5T_IEEE_F32BE_g: Thid_t; cvar;external libhdf5_serial;
  H5T_IEEE_F32LE_g: Thid_t; cvar;external libhdf5_serial;
  H5T_IEEE_F64BE_g: Thid_t; cvar;external libhdf5_serial;
  H5T_IEEE_F64LE_g: Thid_t; cvar;external libhdf5_serial;
  H5T_STD_I8BE_g: Thid_t; cvar;external libhdf5_serial;
  H5T_STD_I8LE_g: Thid_t; cvar;external libhdf5_serial;
  H5T_STD_I16BE_g: Thid_t; cvar;external libhdf5_serial;
  H5T_STD_I16LE_g: Thid_t; cvar;external libhdf5_serial;
  H5T_STD_I32BE_g: Thid_t; cvar;external libhdf5_serial;
  H5T_STD_I32LE_g: Thid_t; cvar;external libhdf5_serial;
  H5T_STD_I64BE_g: Thid_t; cvar;external libhdf5_serial;
  H5T_STD_I64LE_g: Thid_t; cvar;external libhdf5_serial;
  H5T_STD_U8BE_g: Thid_t; cvar;external libhdf5_serial;
  H5T_STD_U8LE_g: Thid_t; cvar;external libhdf5_serial;
  H5T_STD_U16BE_g: Thid_t; cvar;external libhdf5_serial;
  H5T_STD_U16LE_g: Thid_t; cvar;external libhdf5_serial;
  H5T_STD_U32BE_g: Thid_t; cvar;external libhdf5_serial;
  H5T_STD_U32LE_g: Thid_t; cvar;external libhdf5_serial;
  H5T_STD_U64BE_g: Thid_t; cvar;external libhdf5_serial;
  H5T_STD_U64LE_g: Thid_t; cvar;external libhdf5_serial;
  H5T_STD_B8BE_g: Thid_t; cvar;external libhdf5_serial;
  H5T_STD_B8LE_g: Thid_t; cvar;external libhdf5_serial;
  H5T_STD_B16BE_g: Thid_t; cvar;external libhdf5_serial;
  H5T_STD_B16LE_g: Thid_t; cvar;external libhdf5_serial;
  H5T_STD_B32BE_g: Thid_t; cvar;external libhdf5_serial;
  H5T_STD_B32LE_g: Thid_t; cvar;external libhdf5_serial;
  H5T_STD_B64BE_g: Thid_t; cvar;external libhdf5_serial;
  H5T_STD_B64LE_g: Thid_t; cvar;external libhdf5_serial;
  H5T_STD_REF_OBJ_g: Thid_t; cvar;external libhdf5_serial;
  H5T_STD_REF_DSETREG_g: Thid_t; cvar;external libhdf5_serial;
  H5T_UNIX_D32BE_g: Thid_t; cvar;external libhdf5_serial;
  H5T_UNIX_D32LE_g: Thid_t; cvar;external libhdf5_serial;
  H5T_UNIX_D64BE_g: Thid_t; cvar;external libhdf5_serial;
  H5T_UNIX_D64LE_g: Thid_t; cvar;external libhdf5_serial;
  H5T_C_S1_g: Thid_t; cvar;external libhdf5_serial;
  H5T_FORTRAN_S1_g: Thid_t; cvar;external libhdf5_serial;
  H5T_VAX_F32_g: Thid_t; cvar;external libhdf5_serial;
  H5T_VAX_F64_g: Thid_t; cvar;external libhdf5_serial;

var
  H5T_NATIVE_SCHAR_g: Thid_t; cvar;external libhdf5_serial;
  H5T_NATIVE_UCHAR_g: Thid_t; cvar;external libhdf5_serial;
  H5T_NATIVE_SHORT_g: Thid_t; cvar;external libhdf5_serial;
  H5T_NATIVE_USHORT_g: Thid_t; cvar;external libhdf5_serial;
  H5T_NATIVE_INT_g: Thid_t; cvar;external libhdf5_serial;
  H5T_NATIVE_UINT_g: Thid_t; cvar;external libhdf5_serial;
  H5T_NATIVE_LONG_g: Thid_t; cvar;external libhdf5_serial;
  H5T_NATIVE_ULONG_g: Thid_t; cvar;external libhdf5_serial;
  H5T_NATIVE_LLONG_g: Thid_t; cvar;external libhdf5_serial;
  H5T_NATIVE_ULLONG_g: Thid_t; cvar;external libhdf5_serial;
  H5T_NATIVE_FLOAT_g: Thid_t; cvar;external libhdf5_serial;
  H5T_NATIVE_DOUBLE_g: Thid_t; cvar;external libhdf5_serial;

  H5T_NATIVE_LDOUBLE_g: Thid_t; cvar;external libhdf5_serial;
  H5T_NATIVE_B8_g: Thid_t; cvar;external libhdf5_serial;
  H5T_NATIVE_B16_g: Thid_t; cvar;external libhdf5_serial;
  H5T_NATIVE_B32_g: Thid_t; cvar;external libhdf5_serial;
  H5T_NATIVE_B64_g: Thid_t; cvar;external libhdf5_serial;
  H5T_NATIVE_OPAQUE_g: Thid_t; cvar;external libhdf5_serial;
  H5T_NATIVE_HADDR_g: Thid_t; cvar;external libhdf5_serial;
  H5T_NATIVE_HSIZE_g: Thid_t; cvar;external libhdf5_serial;
  H5T_NATIVE_HSSIZE_g: Thid_t; cvar;external libhdf5_serial;
  H5T_NATIVE_HERR_g: Thid_t; cvar;external libhdf5_serial;
  H5T_NATIVE_HBOOL_g: Thid_t; cvar;external libhdf5_serial;

  H5T_NATIVE_INT8_g: Thid_t; cvar;external libhdf5_serial;
  H5T_NATIVE_UINT8_g: Thid_t; cvar;external libhdf5_serial;
  H5T_NATIVE_INT_LEAST8_g: Thid_t; cvar;external libhdf5_serial;
  H5T_NATIVE_UINT_LEAST8_g: Thid_t; cvar;external libhdf5_serial;
  H5T_NATIVE_INT_FAST8_g: Thid_t; cvar;external libhdf5_serial;
  H5T_NATIVE_UINT_FAST8_g: Thid_t; cvar;external libhdf5_serial;
  H5T_NATIVE_INT16_g: Thid_t; cvar;external libhdf5_serial;
  H5T_NATIVE_UINT16_g: Thid_t; cvar;external libhdf5_serial;
  H5T_NATIVE_INT_LEAST16_g: Thid_t; cvar;external libhdf5_serial;
  H5T_NATIVE_UINT_LEAST16_g: Thid_t; cvar;external libhdf5_serial;
  H5T_NATIVE_INT_FAST16_g: Thid_t; cvar;external libhdf5_serial;
  H5T_NATIVE_UINT_FAST16_g: Thid_t; cvar;external libhdf5_serial;
  H5T_NATIVE_INT32_g: Thid_t; cvar;external libhdf5_serial;
  H5T_NATIVE_UINT32_g: Thid_t; cvar;external libhdf5_serial;
  H5T_NATIVE_INT_LEAST32_g: Thid_t; cvar;external libhdf5_serial;
  H5T_NATIVE_UINT_LEAST32_g: Thid_t; cvar;external libhdf5_serial;
  H5T_NATIVE_INT_FAST32_g: Thid_t; cvar;external libhdf5_serial;
  H5T_NATIVE_UINT_FAST32_g: Thid_t; cvar;external libhdf5_serial;
  H5T_NATIVE_INT64_g: Thid_t; cvar;external libhdf5_serial;
  H5T_NATIVE_UINT64_g: Thid_t; cvar;external libhdf5_serial;
  H5T_NATIVE_INT_LEAST64_g: Thid_t; cvar;external libhdf5_serial;
  H5T_NATIVE_UINT_LEAST64_g: Thid_t; cvar;external libhdf5_serial;
  H5T_NATIVE_INT_FAST64_g: Thid_t; cvar;external libhdf5_serial;
  H5T_NATIVE_UINT_FAST64_g: Thid_t; cvar;external libhdf5_serial;

function H5Tcreate(_type: TH5T_class_t; size: Tsize_t): Thid_t; cdecl; external libhdf5_serial;
function H5Tcopy(type_id: Thid_t): Thid_t; cdecl; external libhdf5_serial;
function H5Tclose(type_id: Thid_t): Therr_t; cdecl; external libhdf5_serial;
function H5Tequal(type1_id: Thid_t; type2_id: Thid_t): Thtri_t; cdecl; external libhdf5_serial;
function H5Tlock(type_id: Thid_t): Therr_t; cdecl; external libhdf5_serial;
function H5Tcommit2(loc_id: Thid_t; name: pchar; type_id: Thid_t; lcpl_id: Thid_t; tcpl_id: Thid_t;
  tapl_id: Thid_t): Therr_t; cdecl; external libhdf5_serial;
function H5Topen2(loc_id: Thid_t; name: pchar; tapl_id: Thid_t): Thid_t; cdecl; external libhdf5_serial;
function H5Tcommit_anon(loc_id: Thid_t; type_id: Thid_t; tcpl_id: Thid_t; tapl_id: Thid_t): Therr_t; cdecl; external libhdf5_serial;
function H5Tget_create_plist(type_id: Thid_t): Thid_t; cdecl; external libhdf5_serial;
function H5Tcommitted(type_id: Thid_t): Thtri_t; cdecl; external libhdf5_serial;
function H5Tencode(obj_id: Thid_t; buf: pointer; nalloc: Psize_t): Therr_t; cdecl; external libhdf5_serial;
function H5Tdecode(buf: pointer): Thid_t; cdecl; external libhdf5_serial;
function H5Tflush(type_id: Thid_t): Therr_t; cdecl; external libhdf5_serial;
function H5Trefresh(type_id: Thid_t): Therr_t; cdecl; external libhdf5_serial;
function H5Tinsert(parent_id: Thid_t; name: pchar; offset: Tsize_t; member_id: Thid_t): Therr_t; cdecl; external libhdf5_serial;
function H5Tpack(type_id: Thid_t): Therr_t; cdecl; external libhdf5_serial;
function H5Tenum_create(base_id: Thid_t): Thid_t; cdecl; external libhdf5_serial;
function H5Tenum_insert(_type: Thid_t; name: pchar; value: pointer): Therr_t; cdecl; external libhdf5_serial;
function H5Tenum_nameof(_type: Thid_t; value: pointer; name: pchar; size: Tsize_t): Therr_t; cdecl; external libhdf5_serial;
function H5Tenum_valueof(_type: Thid_t; name: pchar; value: pointer): Therr_t; cdecl; external libhdf5_serial;
function H5Tvlen_create(base_id: Thid_t): Thid_t; cdecl; external libhdf5_serial;
function H5Tarray_create2(base_id: Thid_t; ndims: dword; dim: Phsize_t): Thid_t; cdecl; external libhdf5_serial;
function H5Tget_array_ndims(type_id: Thid_t): longint; cdecl; external libhdf5_serial;
function H5Tget_array_dims2(type_id: Thid_t; dims: Phsize_t): longint; cdecl; external libhdf5_serial;
function H5Tset_tag(_type: Thid_t; tag: pchar): Therr_t; cdecl; external libhdf5_serial;
function H5Tget_tag(_type: Thid_t): pchar; cdecl; external libhdf5_serial;
function H5Tget_super(_type: Thid_t): Thid_t; cdecl; external libhdf5_serial;
function H5Tget_class(type_id: Thid_t): TH5T_class_t; cdecl; external libhdf5_serial;
function H5Tdetect_class(type_id: Thid_t; cls: TH5T_class_t): Thtri_t; cdecl; external libhdf5_serial;
function H5Tget_size(type_id: Thid_t): Tsize_t; cdecl; external libhdf5_serial;
function H5Tget_order(type_id: Thid_t): TH5T_order_t; cdecl; external libhdf5_serial;
function H5Tget_precision(type_id: Thid_t): Tsize_t; cdecl; external libhdf5_serial;
function H5Tget_offset(type_id: Thid_t): longint; cdecl; external libhdf5_serial;
function H5Tget_pad(type_id: Thid_t; lsb: PH5T_pad_t; msb: PH5T_pad_t): Therr_t; cdecl; external libhdf5_serial;
function H5Tget_sign(type_id: Thid_t): TH5T_sign_t; cdecl; external libhdf5_serial;
function H5Tget_fields(type_id: Thid_t; spos: Psize_t; epos: Psize_t; esize: Psize_t; mpos: Psize_t; msize: Psize_t): Therr_t; cdecl; external libhdf5_serial;
function H5Tget_ebias(type_id: Thid_t): Tsize_t; cdecl; external libhdf5_serial;
function H5Tget_norm(type_id: Thid_t): TH5T_norm_t; cdecl; external libhdf5_serial;
function H5Tget_inpad(type_id: Thid_t): TH5T_pad_t; cdecl; external libhdf5_serial;
function H5Tget_strpad(type_id: Thid_t): TH5T_str_t; cdecl; external libhdf5_serial;
function H5Tget_nmembers(type_id: Thid_t): longint; cdecl; external libhdf5_serial;
function H5Tget_member_name(type_id: Thid_t; membno: dword): pchar; cdecl; external libhdf5_serial;
function H5Tget_member_index(type_id: Thid_t; name: pchar): longint; cdecl; external libhdf5_serial;
function H5Tget_member_offset(type_id: Thid_t; membno: dword): Tsize_t; cdecl; external libhdf5_serial;
function H5Tget_member_class(type_id: Thid_t; membno: dword): TH5T_class_t; cdecl; external libhdf5_serial;
function H5Tget_member_type(type_id: Thid_t; membno: dword): Thid_t; cdecl; external libhdf5_serial;
function H5Tget_member_value(type_id: Thid_t; membno: dword; value: pointer): Therr_t; cdecl; external libhdf5_serial;
function H5Tget_cset(type_id: Thid_t): TH5T_cset_t; cdecl; external libhdf5_serial;
function H5Tis_variable_str(type_id: Thid_t): Thtri_t; cdecl; external libhdf5_serial;
function H5Tget_native_type(type_id: Thid_t; direction: TH5T_direction_t): Thid_t; cdecl; external libhdf5_serial;
function H5Tset_size(type_id: Thid_t; size: Tsize_t): Therr_t; cdecl; external libhdf5_serial;
function H5Tset_order(type_id: Thid_t; order: TH5T_order_t): Therr_t; cdecl; external libhdf5_serial;
function H5Tset_precision(type_id: Thid_t; prec: Tsize_t): Therr_t; cdecl; external libhdf5_serial;
function H5Tset_offset(type_id: Thid_t; offset: Tsize_t): Therr_t; cdecl; external libhdf5_serial;
function H5Tset_pad(type_id: Thid_t; lsb: TH5T_pad_t; msb: TH5T_pad_t): Therr_t; cdecl; external libhdf5_serial;
function H5Tset_sign(type_id: Thid_t; sign: TH5T_sign_t): Therr_t; cdecl; external libhdf5_serial;
function H5Tset_fields(type_id: Thid_t; spos: Tsize_t; epos: Tsize_t; esize: Tsize_t; mpos: Tsize_t;
  msize: Tsize_t): Therr_t; cdecl; external libhdf5_serial;
function H5Tset_ebias(type_id: Thid_t; ebias: Tsize_t): Therr_t; cdecl; external libhdf5_serial;
function H5Tset_norm(type_id: Thid_t; norm: TH5T_norm_t): Therr_t; cdecl; external libhdf5_serial;
function H5Tset_inpad(type_id: Thid_t; pad: TH5T_pad_t): Therr_t; cdecl; external libhdf5_serial;
function H5Tset_cset(type_id: Thid_t; cset: TH5T_cset_t): Therr_t; cdecl; external libhdf5_serial;
function H5Tset_strpad(type_id: Thid_t; strpad: TH5T_str_t): Therr_t; cdecl; external libhdf5_serial;
function H5Tregister(pers: TH5T_pers_t; name: pchar; src_id: Thid_t; dst_id: Thid_t; func: TH5T_conv_t): Therr_t; cdecl; external libhdf5_serial;
function H5Tunregister(pers: TH5T_pers_t; name: pchar; src_id: Thid_t; dst_id: Thid_t; func: TH5T_conv_t): Therr_t; cdecl; external libhdf5_serial;
function H5Tfind(src_id: Thid_t; dst_id: Thid_t; pcdata: PPH5T_cdata_t): TH5T_conv_t; cdecl; external libhdf5_serial;
function H5Tcompiler_conv(src_id: Thid_t; dst_id: Thid_t): Thtri_t; cdecl; external libhdf5_serial;
function H5Tconvert(src_id: Thid_t; dst_id: Thid_t; nelmts: Tsize_t; buf: pointer; background: pointer;
  plist_id: Thid_t): Therr_t; cdecl; external libhdf5_serial;
function H5Tcommit1(loc_id: Thid_t; name: pchar; type_id: Thid_t): Therr_t; cdecl; external libhdf5_serial;
function H5Topen1(loc_id: Thid_t; name: pchar): Thid_t; cdecl; external libhdf5_serial;
function H5Tarray_create1(base_id: Thid_t; ndims: longint; dim: Phsize_t; perm: Plongint): Thid_t; cdecl; external libhdf5_serial;
function H5Tget_array_dims1(type_id: Thid_t; dims: Phsize_t; perm: Plongint): longint; cdecl; external libhdf5_serial;

// === Konventiert am: 21-8-26 14:40:04 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}

{$ENDIF read_implementation}
