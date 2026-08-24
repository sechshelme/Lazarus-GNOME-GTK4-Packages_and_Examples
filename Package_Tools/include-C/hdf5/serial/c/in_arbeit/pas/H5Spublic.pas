unit H5Spublic;

interface

uses
  fp_hdf5, H5public, H5Ipublic;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  H5S_ALL = 0;

type
  PH5S_class_t = ^TH5S_class_t;
  TH5S_class_t = longint;
const
  H5S_NO_CLASS = -(1);
  H5S_SCALAR = 0;
  H5S_SIMPLE = 1;
  H5S_NULL = 2;

type
  PH5S_seloper_t = ^TH5S_seloper_t;
  TH5S_seloper_t = longint;
const
  H5S_SELECT_NOOP = -(1);
  H5S_SELECT_SET = 0;
  H5S_SELECT_OR = 1;
  H5S_SELECT_AND = 2;
  H5S_SELECT_XOR = 3;
  H5S_SELECT_NOTB = 4;
  H5S_SELECT_NOTA = 5;
  H5S_SELECT_APPEND = 6;
  H5S_SELECT_PREPEND = 7;
  H5S_SELECT_INVALID = 8;

type
  PH5S_sel_type = ^TH5S_sel_type;
  TH5S_sel_type = longint;
const
  H5S_SEL_ERROR = -(1);
  H5S_SEL_NONE = 0;
  H5S_SEL_POINTS = 1;
  H5S_SEL_HYPERSLABS = 2;
  H5S_SEL_ALL = 3;
  H5S_SEL_N = 4;

function H5Sclose(space_id: Thid_t): Therr_t; cdecl; external libhdf5_serial;
function H5Scopy(space_id: Thid_t): Thid_t; cdecl; external libhdf5_serial;
function H5Screate(_type: TH5S_class_t): Thid_t; cdecl; external libhdf5_serial;
function H5Screate_simple(rank: longint; dims: Phsize_t; maxdims: Phsize_t): Thid_t; cdecl; external libhdf5_serial;
function H5Sdecode(buf: pointer): Thid_t; cdecl; external libhdf5_serial;
function H5Sencode(obj_id: Thid_t; buf: pointer; nalloc: Psize_t): Therr_t; cdecl; external libhdf5_serial;
function H5Sextent_copy(dst_id: Thid_t; src_id: Thid_t): Therr_t; cdecl; external libhdf5_serial;
function H5Sextent_equal(space1_id: Thid_t; space2_id: Thid_t): Thtri_t; cdecl; external libhdf5_serial;
function H5Sget_simple_extent_dims(space_id: Thid_t; dims: Phsize_t; maxdims: Phsize_t): longint; cdecl; external libhdf5_serial;
function H5Sget_simple_extent_ndims(space_id: Thid_t): longint; cdecl; external libhdf5_serial;
function H5Sget_simple_extent_npoints(space_id: Thid_t): Thssize_t; cdecl; external libhdf5_serial;
function H5Sget_simple_extent_type(space_id: Thid_t): TH5S_class_t; cdecl; external libhdf5_serial;
function H5Sis_simple(space_id: Thid_t): Thtri_t; cdecl; external libhdf5_serial;
function H5Sset_extent_none(space_id: Thid_t): Therr_t; cdecl; external libhdf5_serial;
function H5Sset_extent_simple(space_id: Thid_t; rank: longint; dims: Phsize_t; max: Phsize_t): Therr_t; cdecl; external libhdf5_serial;
function H5Scombine_hyperslab(space_id: Thid_t; op: TH5S_seloper_t; start: Phsize_t; stride: Phsize_t; count: Phsize_t;
  block: Phsize_t): Thid_t; cdecl; external libhdf5_serial;
function H5Scombine_select(space1_id: Thid_t; op: TH5S_seloper_t; space2_id: Thid_t): Thid_t; cdecl; external libhdf5_serial;
function H5Sget_regular_hyperslab(spaceid: Thid_t; start: Phsize_t; stride: Phsize_t; count: Phsize_t; block: Phsize_t): Thtri_t; cdecl; external libhdf5_serial;
function H5Sget_select_bounds(spaceid: Thid_t; start: Phsize_t; end_: Phsize_t): Therr_t; cdecl; external libhdf5_serial;
function H5Sget_select_elem_npoints(spaceid: Thid_t): Thssize_t; cdecl; external libhdf5_serial;
function H5Sget_select_elem_pointlist(spaceid: Thid_t; startpoint: Thsize_t; numpoints: Thsize_t; buf: Phsize_t): Therr_t; cdecl; external libhdf5_serial;
function H5Sget_select_hyper_blocklist(spaceid: Thid_t; startblock: Thsize_t; numblocks: Thsize_t; buf: Phsize_t): Therr_t; cdecl; external libhdf5_serial;
function H5Sget_select_hyper_nblocks(spaceid: Thid_t): Thssize_t; cdecl; external libhdf5_serial;
function H5Sget_select_npoints(spaceid: Thid_t): Thssize_t; cdecl; external libhdf5_serial;
function H5Sget_select_type(spaceid: Thid_t): TH5S_sel_type; cdecl; external libhdf5_serial;
function H5Sis_regular_hyperslab(spaceid: Thid_t): Thtri_t; cdecl; external libhdf5_serial;
function H5Smodify_select(space1_id: Thid_t; op: TH5S_seloper_t; space2_id: Thid_t): Therr_t; cdecl; external libhdf5_serial;
function H5Soffset_simple(space_id: Thid_t; offset: Phssize_t): Therr_t; cdecl; external libhdf5_serial;
function H5Sselect_adjust(spaceid: Thid_t; offset: Phssize_t): Therr_t; cdecl; external libhdf5_serial;
function H5Sselect_all(spaceid: Thid_t): Therr_t; cdecl; external libhdf5_serial;
function H5Sselect_copy(dst_id: Thid_t; src_id: Thid_t): Therr_t; cdecl; external libhdf5_serial;
function H5Sselect_elements(space_id: Thid_t; op: TH5S_seloper_t; num_elem: Tsize_t; coord: Phsize_t): Therr_t; cdecl; external libhdf5_serial;
function H5Sselect_hyperslab(space_id: Thid_t; op: TH5S_seloper_t; start: Phsize_t; stride: Phsize_t; count: Phsize_t;
  block: Phsize_t): Therr_t; cdecl; external libhdf5_serial;
function H5Sselect_intersect_block(space_id: Thid_t; start: Phsize_t; end_: Phsize_t): Thtri_t; cdecl; external libhdf5_serial;
function H5Sselect_none(spaceid: Thid_t): Therr_t; cdecl; external libhdf5_serial;
function H5Sselect_project_intersection(src_space_id: Thid_t; dst_space_id: Thid_t; src_intersect_space_id: Thid_t): Thid_t; cdecl; external libhdf5_serial;
function H5Sselect_shape_same(space1_id: Thid_t; space2_id: Thid_t): Thtri_t; cdecl; external libhdf5_serial;
function H5Sselect_valid(spaceid: Thid_t): Thtri_t; cdecl; external libhdf5_serial;

// === Konventiert am: 21-8-26 14:40:09 ===


implementation

end.
