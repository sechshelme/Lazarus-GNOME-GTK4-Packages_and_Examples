{$IFDEF read_interface}



function H5PTcreate(loc_id: Thid_t; dset_name: pchar; dtype_id: Thid_t; chunk_size: Thsize_t; plist_id: Thid_t): Thid_t; cdecl; external libhdf5_serial_hl;
function H5PTopen(loc_id: Thid_t; dset_name: pchar): Thid_t; cdecl; external libhdf5_serial_hl;
function H5PTclose(table_id: Thid_t): Therr_t; cdecl; external libhdf5_serial_hl;
function H5PTcreate_fl(loc_id: Thid_t; dset_name: pchar; dtype_id: Thid_t; chunk_size: Thsize_t; compression: longint): Thid_t; cdecl; external libhdf5_serial_hl;
function H5PTappend(table_id: Thid_t; nrecords: Tsize_t; data: pointer): Therr_t; cdecl; external libhdf5_serial_hl;
function H5PTget_next(table_id: Thid_t; nrecords: Tsize_t; data: pointer): Therr_t; cdecl; external libhdf5_serial_hl;
function H5PTread_packets(table_id: Thid_t; start: Thsize_t; nrecords: Tsize_t; data: pointer): Therr_t; cdecl; external libhdf5_serial_hl;
function H5PTget_num_packets(table_id: Thid_t; nrecords: Phsize_t): Therr_t; cdecl; external libhdf5_serial_hl;
function H5PTis_valid(table_id: Thid_t): Therr_t; cdecl; external libhdf5_serial_hl;
function H5PTis_varlen(table_id: Thid_t): Therr_t; cdecl; external libhdf5_serial_hl;
function H5PTget_dataset(table_id: Thid_t): Thid_t; cdecl; external libhdf5_serial_hl;
function H5PTget_type(table_id: Thid_t): Thid_t; cdecl; external libhdf5_serial_hl;
function H5PTcreate_index(table_id: Thid_t): Therr_t; cdecl; external libhdf5_serial_hl;
function H5PTset_index(table_id: Thid_t; pt_index: Thsize_t): Therr_t; cdecl; external libhdf5_serial_hl;
function H5PTget_index(table_id: Thid_t; pt_index: Phsize_t): Therr_t; cdecl; external libhdf5_serial_hl;
function H5PTfree_vlen_buff(table_id: Thid_t; bufflen: Tsize_t; buff: pointer): Therr_t; cdecl; external libhdf5_serial_hl;

// === Konventiert am: 21-8-26 14:40:22 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
