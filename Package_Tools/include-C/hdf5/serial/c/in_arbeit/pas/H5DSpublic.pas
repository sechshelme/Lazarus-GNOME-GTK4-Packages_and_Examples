unit H5DSpublic;

interface

uses
  fp_hdf5, H5public, H5Ipublic;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  DIMENSION_SCALE_CLASS = 'DIMENSION_SCALE';
  DIMENSION_LIST = 'DIMENSION_LIST';
  REFERENCE_LIST = 'REFERENCE_LIST';
  DIMENSION_LABELS = 'DIMENSION_LABELS';

type
  TH5DS_iterate_t = function(dset: Thid_t; dim: dword; scale: Thid_t; visitor_data: pointer): Therr_t; cdecl;

function H5DSattach_scale(did: Thid_t; dsid: Thid_t; idx: dword): Therr_t; cdecl; external libhdf5_serial_hl;
function H5DSdetach_scale(did: Thid_t; dsid: Thid_t; idx: dword): Therr_t; cdecl; external libhdf5_serial_hl;
function H5DSset_scale(dsid: Thid_t; dimname: pchar): Therr_t; cdecl; external libhdf5_serial_hl;
function H5DSget_num_scales(did: Thid_t; idx: dword): longint; cdecl; external libhdf5_serial_hl;
function H5DSset_label(did: Thid_t; idx: dword; _label: pchar): Therr_t; cdecl; external libhdf5_serial_hl;
function H5DSget_label(did: Thid_t; idx: dword; _label: pchar; size: Tsize_t): Tssize_t; cdecl; external libhdf5_serial_hl;
function H5DSget_scale_name(did: Thid_t; name: pchar; size: Tsize_t): Tssize_t; cdecl; external libhdf5_serial_hl;
function H5DSis_scale(did: Thid_t): Thtri_t; cdecl; external libhdf5_serial_hl;
function H5DSiterate_scales(did: Thid_t; dim: dword; idx: Plongint; visitor: TH5DS_iterate_t; visitor_data: pointer): Therr_t; cdecl; external libhdf5_serial_hl;
function H5DSis_attached(did: Thid_t; dsid: Thid_t; idx: dword): Thtri_t; cdecl; external libhdf5_serial_hl;

// === Konventiert am: 20-8-26 19:37:21 ===


implementation



end.
