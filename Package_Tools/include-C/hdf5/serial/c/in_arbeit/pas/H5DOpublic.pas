unit H5DOpublic;

interface

uses
  fp_hdf5, H5public, H5Ipublic;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function H5DOappend(dset_id: Thid_t; dxpl_id: Thid_t; axis: dword; extension: Tsize_t; memtype: Thid_t;
  buf: pointer): Therr_t; cdecl; external libhdf5;
function H5DOwrite_chunk(dset_id: Thid_t; dxpl_id: Thid_t; filters: Tuint32_t; offset: Phsize_t; data_size: Tsize_t;
  buf: pointer): Therr_t; cdecl; external libhdf5;
function H5DOread_chunk(dset_id: Thid_t; dxpl_id: Thid_t; offset: Phsize_t; filters: Puint32_t; buf: pointer): Therr_t; cdecl; external libhdf5;

// === Konventiert am: 20-8-26 19:37:28 ===


implementation



end.
