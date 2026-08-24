unit H5FDwindows;

interface

uses
  fp_hdf5, H5Ipublic, H5public, H5FDsec2;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function H5Pset_fapl_windows(fapl_id: Thid_t): Therr_t; cdecl; external libhdf5_serial;

function H5FD_WINDOWS: Thid_t;

// === Konventiert am: 21-8-26 14:14:27 ===


implementation

function H5FD_WINDOWS: Thid_t;
begin
  H5FD_WINDOWS := H5FD_sec2_init;
end;


end.
