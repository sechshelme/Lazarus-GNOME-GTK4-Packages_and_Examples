{$IFDEF read_interface}


function H5FD_stdio_init: Thid_t; cdecl; external libhdf5_serial;
function H5Pset_fapl_stdio(fapl_id: Thid_t): Therr_t; cdecl; external libhdf5_serial;

function H5FD_STDIO: Thid_t;

// === Konventiert am: 21-8-26 14:14:30 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function H5FD_STDIO: Thid_t;
begin
  H5FD_STDIO := H5FD_stdio_init;
end;


{$ENDIF read_implementation}
