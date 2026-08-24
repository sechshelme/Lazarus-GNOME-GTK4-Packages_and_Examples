unit H5FDstdio;

interface

uses
  fp_hdf5, H5Ipublic, H5public;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function H5FD_stdio_init: Thid_t; cdecl; external libhdf5_serial;
function H5Pset_fapl_stdio(fapl_id: Thid_t): Therr_t; cdecl; external libhdf5_serial;

function H5FD_STDIO: Thid_t;

// === Konventiert am: 21-8-26 14:14:30 ===


implementation


function H5FD_STDIO: Thid_t;
begin
  H5FD_STDIO := H5FD_stdio_init;
end;


end.
