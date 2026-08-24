{$IFDEF read_interface}


function H5FD_multi_init: Thid_t; cdecl; external libhdf5_serial;
function H5Pset_fapl_multi(fapl_id: Thid_t; memb_map: PH5FD_mem_t; memb_fapl: Phid_t; memb_name: PPchar; memb_addr: Phaddr_t;
  relax: Thbool_t): Therr_t; cdecl; external libhdf5_serial;
function H5Pget_fapl_multi(fapl_id: Thid_t; memb_map: PH5FD_mem_t; memb_fapl: Phid_t; memb_name: PPchar; memb_addr: Phaddr_t;
  relax: Phbool_t): Therr_t; cdecl; external libhdf5_serial;
function H5Pset_fapl_split(fapl: Thid_t; meta_ext: pchar; meta_plist_id: Thid_t; raw_ext: pchar; raw_plist_id: Thid_t): Therr_t; cdecl; external libhdf5_serial;

function H5FD_MULTI: Thid_t;

// === Konventiert am: 20-8-26 19:43:35 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}

function H5FD_MULTI: Thid_t;
begin
  H5FD_MULTI := H5FD_multi_init;
end;


{$ENDIF read_implementation}
