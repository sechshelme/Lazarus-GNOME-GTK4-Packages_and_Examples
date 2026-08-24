{$IFDEF read_interface}


function H5DOappend(dset_id: Thid_t; dxpl_id: Thid_t; axis: dword; extension: Tsize_t; memtype: Thid_t;
  buf: pointer): Therr_t; cdecl; external libhdf5_serial;
function H5DOwrite_chunk(dset_id: Thid_t; dxpl_id: Thid_t; filters: Tuint32_t; offset: Phsize_t; data_size: Tsize_t;
  buf: pointer): Therr_t; cdecl; external libhdf5_serial;
function H5DOread_chunk(dset_id: Thid_t; dxpl_id: Thid_t; offset: Phsize_t; filters: Puint32_t; buf: pointer): Therr_t; cdecl; external libhdf5_serial;

// === Konventiert am: 20-8-26 19:37:28 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
