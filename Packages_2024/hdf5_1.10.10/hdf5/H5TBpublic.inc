{$IFDEF read_interface}



function H5TBmake_table(table_title: pchar; loc_id: Thid_t; dset_name: pchar; nfields: Thsize_t; nrecords: Thsize_t;
  type_size: Tsize_t; field_names: PPchar; field_offset: Psize_t; field_types: Phid_t; chunk_size: Thsize_t;
  fill_data: pointer; compress: longint; buf: pointer): Therr_t; cdecl; external libhdf5_serial_hl;
function H5TBappend_records(loc_id: Thid_t; dset_name: pchar; nrecords: Thsize_t; type_size: Tsize_t; field_offset: Psize_t;
  dst_sizes: Psize_t; buf: pointer): Therr_t; cdecl; external libhdf5_serial_hl;
function H5TBwrite_records(loc_id: Thid_t; dset_name: pchar; start: Thsize_t; nrecords: Thsize_t; type_size: Tsize_t;
  field_offset: Psize_t; dst_sizes: Psize_t; buf: pointer): Therr_t; cdecl; external libhdf5_serial_hl;
function H5TBwrite_fields_name(loc_id: Thid_t; dset_name: pchar; field_names: pchar; start: Thsize_t; nrecords: Thsize_t;
  type_size: Tsize_t; field_offset: Psize_t; dst_sizes: Psize_t; buf: pointer): Therr_t; cdecl; external libhdf5_serial_hl;
function H5TBwrite_fields_index(loc_id: Thid_t; dset_name: pchar; nfields: Thsize_t; field_index: Plongint; start: Thsize_t;
  nrecords: Thsize_t; type_size: Tsize_t; field_offset: Psize_t; dst_sizes: Psize_t; buf: pointer): Therr_t; cdecl; external libhdf5_serial_hl;
function H5TBread_table(loc_id: Thid_t; dset_name: pchar; dst_size: Tsize_t; dst_offset: Psize_t; dst_sizes: Psize_t;
  dst_buf: pointer): Therr_t; cdecl; external libhdf5_serial_hl;
function H5TBread_fields_name(loc_id: Thid_t; dset_name: pchar; field_names: pchar; start: Thsize_t; nrecords: Thsize_t;
  type_size: Tsize_t; field_offset: Psize_t; dst_sizes: Psize_t; buf: pointer): Therr_t; cdecl; external libhdf5_serial_hl;
function H5TBread_fields_index(loc_id: Thid_t; dset_name: pchar; nfields: Thsize_t; field_index: Plongint; start: Thsize_t;
  nrecords: Thsize_t; type_size: Tsize_t; field_offset: Psize_t; dst_sizes: Psize_t; buf: pointer): Therr_t; cdecl; external libhdf5_serial_hl;
function H5TBread_records(loc_id: Thid_t; dset_name: pchar; start: Thsize_t; nrecords: Thsize_t; type_size: Tsize_t;
  dst_offset: Psize_t; dst_sizes: Psize_t; buf: pointer): Therr_t; cdecl; external libhdf5_serial_hl;
function H5TBget_table_info(loc_id: Thid_t; dset_name: pchar; nfields: Phsize_t; nrecords: Phsize_t): Therr_t; cdecl; external libhdf5_serial_hl;
function H5TBget_field_info(loc_id: Thid_t; dset_name: pchar; field_names: PPchar; field_sizes: Psize_t; field_offsets: Psize_t;
  type_size: Psize_t): Therr_t; cdecl; external libhdf5_serial_hl;
function H5TBdelete_record(loc_id: Thid_t; dset_name: pchar; start: Thsize_t; nrecords: Thsize_t): Therr_t; cdecl; external libhdf5_serial_hl;
function H5TBinsert_record(loc_id: Thid_t; dset_name: pchar; start: Thsize_t; nrecords: Thsize_t; dst_size: Tsize_t;
  dst_offset: Psize_t; dst_sizes: Psize_t; buf: pointer): Therr_t; cdecl; external libhdf5_serial_hl;
function H5TBadd_records_from(loc_id: Thid_t; dset_name1: pchar; start1: Thsize_t; nrecords: Thsize_t; dset_name2: pchar;
  start2: Thsize_t): Therr_t; cdecl; external libhdf5_serial_hl;
function H5TBcombine_tables(loc_id1: Thid_t; dset_name1: pchar; loc_id2: Thid_t; dset_name2: pchar; dset_name3: pchar): Therr_t; cdecl; external libhdf5_serial_hl;
function H5TBinsert_field(loc_id: Thid_t; dset_name: pchar; field_name: pchar; field_type: Thid_t; position: Thsize_t;
  fill_data: pointer; buf: pointer): Therr_t; cdecl; external libhdf5_serial_hl;
function H5TBdelete_field(loc_id: Thid_t; dset_name: pchar; field_name: pchar): Therr_t; cdecl; external libhdf5_serial_hl;
function H5TBAget_title(loc_id: Thid_t; table_title: pchar): Therr_t; cdecl; external libhdf5_serial_hl;
function H5TBAget_fill(loc_id: Thid_t; dset_name: pchar; dset_id: Thid_t; dst_buf: pbyte): Thtri_t; cdecl; external libhdf5_serial_hl;

// === Konventiert am: 21-8-26 14:40:07 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
