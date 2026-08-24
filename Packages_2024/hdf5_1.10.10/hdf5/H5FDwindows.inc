{$IFDEF read_interface}


function H5Pset_fapl_windows(fapl_id: Thid_t): Therr_t; cdecl; external libhdf5_serial;

function H5FD_WINDOWS: Thid_t;

// === Konventiert am: 21-8-26 14:14:27 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}

function H5FD_WINDOWS: Thid_t;
begin
  H5FD_WINDOWS := H5FD_sec2_init;
end;


{$ENDIF read_implementation}
