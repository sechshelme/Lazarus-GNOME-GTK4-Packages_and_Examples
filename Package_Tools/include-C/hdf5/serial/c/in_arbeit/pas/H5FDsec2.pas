unit H5FDsec2;

interface

uses
  fp_hdf5, H5Ipublic, H5public;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function H5FD_SEC2: Thid_t;

function H5FD_sec2_init: Thid_t; cdecl; external libhdf5_serial;
function H5Pset_fapl_sec2(fapl_id: Thid_t): Therr_t; cdecl; external libhdf5_serial;

// === Konventiert am: 21-8-26 14:14:34 ===


implementation


function H5FD_SEC2: Thid_t;
begin
  H5FD_SEC2 := H5FD_sec2_init;
end;


end.
