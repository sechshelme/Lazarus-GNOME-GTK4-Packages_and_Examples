unit H5LTpublic;

interface

uses
  fp_hdf5, H5public, H5Ipublic, H5Tpublic;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  H5LT_FILE_IMAGE_OPEN_RW = $0001;
  H5LT_FILE_IMAGE_DONT_COPY = $0002;
  H5LT_FILE_IMAGE_DONT_RELEASE = $0004;
  H5LT_FILE_IMAGE_ALL = $0007;

type
  PH5LT_lang_t = ^TH5LT_lang_t;
  TH5LT_lang_t = longint;
const
  H5LT_LANG_ERR = -(1);
  H5LT_DDL = 0;
  H5LT_C = 1;
  H5LT_FORTRAN = 2;
  H5LT_NO_LANG = 3;

function H5LTmake_dataset(loc_id: Thid_t; dset_name: pchar; rank: longint; dims: Phsize_t; type_id: Thid_t;
  buffer: pointer): Therr_t; cdecl; external libhdf5_serial;
function H5LTmake_dataset_char(loc_id: Thid_t; dset_name: pchar; rank: longint; dims: Phsize_t; buffer: pchar): Therr_t; cdecl; external libhdf5_serial;
function H5LTmake_dataset_short(loc_id: Thid_t; dset_name: pchar; rank: longint; dims: Phsize_t; buffer: Psmallint): Therr_t; cdecl; external libhdf5_serial;
function H5LTmake_dataset_int(loc_id: Thid_t; dset_name: pchar; rank: longint; dims: Phsize_t; buffer: Plongint): Therr_t; cdecl; external libhdf5_serial;
function H5LTmake_dataset_long(loc_id: Thid_t; dset_name: pchar; rank: longint; dims: Phsize_t; buffer: Plongint): Therr_t; cdecl; external libhdf5_serial;
function H5LTmake_dataset_float(loc_id: Thid_t; dset_name: pchar; rank: longint; dims: Phsize_t; buffer: Psingle): Therr_t; cdecl; external libhdf5_serial;
function H5LTmake_dataset_double(loc_id: Thid_t; dset_name: pchar; rank: longint; dims: Phsize_t; buffer: Pdouble): Therr_t; cdecl; external libhdf5_serial;
function H5LTmake_dataset_string(loc_id: Thid_t; dset_name: pchar; buf: pchar): Therr_t; cdecl; external libhdf5_serial;
function H5LTread_dataset(loc_id: Thid_t; dset_name: pchar; type_id: Thid_t; buffer: pointer): Therr_t; cdecl; external libhdf5_serial;
function H5LTread_dataset_char(loc_id: Thid_t; dset_name: pchar; buffer: pchar): Therr_t; cdecl; external libhdf5_serial;
function H5LTread_dataset_short(loc_id: Thid_t; dset_name: pchar; buffer: Psmallint): Therr_t; cdecl; external libhdf5_serial;
function H5LTread_dataset_int(loc_id: Thid_t; dset_name: pchar; buffer: Plongint): Therr_t; cdecl; external libhdf5_serial;
function H5LTread_dataset_long(loc_id: Thid_t; dset_name: pchar; buffer: Plongint): Therr_t; cdecl; external libhdf5_serial;
function H5LTread_dataset_float(loc_id: Thid_t; dset_name: pchar; buffer: Psingle): Therr_t; cdecl; external libhdf5_serial;
function H5LTread_dataset_double(loc_id: Thid_t; dset_name: pchar; buffer: Pdouble): Therr_t; cdecl; external libhdf5_serial;
function H5LTread_dataset_string(loc_id: Thid_t; dset_name: pchar; buf: pchar): Therr_t; cdecl; external libhdf5_serial;
function H5LTget_dataset_ndims(loc_id: Thid_t; dset_name: pchar; rank: Plongint): Therr_t; cdecl; external libhdf5_serial;
function H5LTget_dataset_info(loc_id: Thid_t; dset_name: pchar; dims: Phsize_t; type_class: PH5T_class_t; type_size: Psize_t): Therr_t; cdecl; external libhdf5_serial;
function H5LTfind_dataset(loc_id: Thid_t; name: pchar): Therr_t; cdecl; external libhdf5_serial;
function H5LTset_attribute_string(loc_id: Thid_t; obj_name: pchar; attr_name: pchar; attr_data: pchar): Therr_t; cdecl; external libhdf5_serial;
function H5LTset_attribute_char(loc_id: Thid_t; obj_name: pchar; attr_name: pchar; buffer: pchar; size: Tsize_t): Therr_t; cdecl; external libhdf5_serial;
function H5LTset_attribute_uchar(loc_id: Thid_t; obj_name: pchar; attr_name: pchar; buffer: pbyte; size: Tsize_t): Therr_t; cdecl; external libhdf5_serial;
function H5LTset_attribute_short(loc_id: Thid_t; obj_name: pchar; attr_name: pchar; buffer: Psmallint; size: Tsize_t): Therr_t; cdecl; external libhdf5_serial;
function H5LTset_attribute_ushort(loc_id: Thid_t; obj_name: pchar; attr_name: pchar; buffer: Pword; size: Tsize_t): Therr_t; cdecl; external libhdf5_serial;
function H5LTset_attribute_int(loc_id: Thid_t; obj_name: pchar; attr_name: pchar; buffer: Plongint; size: Tsize_t): Therr_t; cdecl; external libhdf5_serial;
function H5LTset_attribute_uint(loc_id: Thid_t; obj_name: pchar; attr_name: pchar; buffer: Pdword; size: Tsize_t): Therr_t; cdecl; external libhdf5_serial;
function H5LTset_attribute_long(loc_id: Thid_t; obj_name: pchar; attr_name: pchar; buffer: Plongint; size: Tsize_t): Therr_t; cdecl; external libhdf5_serial;
function H5LTset_attribute_long_long(loc_id: Thid_t; obj_name: pchar; attr_name: pchar; buffer: Pint64; size: Tsize_t): Therr_t; cdecl; external libhdf5_serial;
function H5LTset_attribute_ulong(loc_id: Thid_t; obj_name: pchar; attr_name: pchar; buffer: Pdword; size: Tsize_t): Therr_t; cdecl; external libhdf5_serial;
function H5LTset_attribute_float(loc_id: Thid_t; obj_name: pchar; attr_name: pchar; buffer: Psingle; size: Tsize_t): Therr_t; cdecl; external libhdf5_serial;
function H5LTset_attribute_double(loc_id: Thid_t; obj_name: pchar; attr_name: pchar; buffer: Pdouble; size: Tsize_t): Therr_t; cdecl; external libhdf5_serial;
function H5LTget_attribute(loc_id: Thid_t; obj_name: pchar; attr_name: pchar; mem_type_id: Thid_t; data: pointer): Therr_t; cdecl; external libhdf5_serial;
function H5LTget_attribute_string(loc_id: Thid_t; obj_name: pchar; attr_name: pchar; data: pchar): Therr_t; cdecl; external libhdf5_serial;
function H5LTget_attribute_char(loc_id: Thid_t; obj_name: pchar; attr_name: pchar; data: pchar): Therr_t; cdecl; external libhdf5_serial;
function H5LTget_attribute_uchar(loc_id: Thid_t; obj_name: pchar; attr_name: pchar; data: pbyte): Therr_t; cdecl; external libhdf5_serial;
function H5LTget_attribute_short(loc_id: Thid_t; obj_name: pchar; attr_name: pchar; data: Psmallint): Therr_t; cdecl; external libhdf5_serial;
function H5LTget_attribute_ushort(loc_id: Thid_t; obj_name: pchar; attr_name: pchar; data: Pword): Therr_t; cdecl; external libhdf5_serial;
function H5LTget_attribute_int(loc_id: Thid_t; obj_name: pchar; attr_name: pchar; data: Plongint): Therr_t; cdecl; external libhdf5_serial;
function H5LTget_attribute_uint(loc_id: Thid_t; obj_name: pchar; attr_name: pchar; data: Pdword): Therr_t; cdecl; external libhdf5_serial;
function H5LTget_attribute_long(loc_id: Thid_t; obj_name: pchar; attr_name: pchar; data: Plongint): Therr_t; cdecl; external libhdf5_serial;
function H5LTget_attribute_long_long(loc_id: Thid_t; obj_name: pchar; attr_name: pchar; data: Pint64): Therr_t; cdecl; external libhdf5_serial;
function H5LTget_attribute_ulong(loc_id: Thid_t; obj_name: pchar; attr_name: pchar; data: Pdword): Therr_t; cdecl; external libhdf5_serial;
function H5LTget_attribute_float(loc_id: Thid_t; obj_name: pchar; attr_name: pchar; data: Psingle): Therr_t; cdecl; external libhdf5_serial;
function H5LTget_attribute_double(loc_id: Thid_t; obj_name: pchar; attr_name: pchar; data: Pdouble): Therr_t; cdecl; external libhdf5_serial;
function H5LTget_attribute_ndims(loc_id: Thid_t; obj_name: pchar; attr_name: pchar; rank: Plongint): Therr_t; cdecl; external libhdf5_serial;
function H5LTget_attribute_info(loc_id: Thid_t; obj_name: pchar; attr_name: pchar; dims: Phsize_t; type_class: PH5T_class_t;
  type_size: Psize_t): Therr_t; cdecl; external libhdf5_serial;
function H5LTtext_to_dtype(text: pchar; lang_type: TH5LT_lang_t): Thid_t; cdecl; external libhdf5_serial;
function H5LTdtype_to_text(dtype: Thid_t; str: pchar; lang_type: TH5LT_lang_t; len: Psize_t): Therr_t; cdecl; external libhdf5_serial;
function H5LTfind_attribute(loc_id: Thid_t; name: pchar): Therr_t; cdecl; external libhdf5_serial;
function H5LTpath_valid(loc_id: Thid_t; path: pchar; check_object_valid: Thbool_t): Thtri_t; cdecl; external libhdf5_serial;
function H5LTopen_file_image(buf_ptr: pointer; buf_size: Tsize_t; flags: dword): Thid_t; cdecl; external libhdf5_serial;

// === Konventiert am: 21-8-26 14:23:53 ===


implementation



end.
