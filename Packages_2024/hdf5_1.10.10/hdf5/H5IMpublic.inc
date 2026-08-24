{$IFDEF read_interface}



function H5IMmake_image_8bit(loc_id: Thid_t; dset_name: pchar; width: Thsize_t; height: Thsize_t; buffer: pbyte): Therr_t; cdecl; external libhdf5_serial_hl;
function H5IMmake_image_24bit(loc_id: Thid_t; dset_name: pchar; width: Thsize_t; height: Thsize_t; interlace: pchar;
  buffer: pbyte): Therr_t; cdecl; external libhdf5_serial_hl;
function H5IMget_image_info(loc_id: Thid_t; dset_name: pchar; width: Phsize_t; height: Phsize_t; planes: Phsize_t;
  interlace: pchar; npals: Phssize_t): Therr_t; cdecl; external libhdf5_serial_hl;
function H5IMread_image(loc_id: Thid_t; dset_name: pchar; buffer: pbyte): Therr_t; cdecl; external libhdf5_serial_hl;
function H5IMmake_palette(loc_id: Thid_t; pal_name: pchar; pal_dims: Phsize_t; pal_data: pbyte): Therr_t; cdecl; external libhdf5_serial_hl;
function H5IMlink_palette(loc_id: Thid_t; image_name: pchar; pal_name: pchar): Therr_t; cdecl; external libhdf5_serial_hl;
function H5IMunlink_palette(loc_id: Thid_t; image_name: pchar; pal_name: pchar): Therr_t; cdecl; external libhdf5_serial_hl;
function H5IMget_npalettes(loc_id: Thid_t; image_name: pchar; npals: Phssize_t): Therr_t; cdecl; external libhdf5_serial_hl;
function H5IMget_palette_info(loc_id: Thid_t; image_name: pchar; pal_number: longint; pal_dims: Phsize_t): Therr_t; cdecl; external libhdf5_serial_hl;
function H5IMget_palette(loc_id: Thid_t; image_name: pchar; pal_number: longint; pal_data: pbyte): Therr_t; cdecl; external libhdf5_serial_hl;
function H5IMis_image(loc_id: Thid_t; dset_name: pchar): Therr_t; cdecl; external libhdf5_serial_hl;
function H5IMis_palette(loc_id: Thid_t; dset_name: pchar): Therr_t; cdecl; external libhdf5_serial_hl;

// === Konventiert am: 21-8-26 14:14:21 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
