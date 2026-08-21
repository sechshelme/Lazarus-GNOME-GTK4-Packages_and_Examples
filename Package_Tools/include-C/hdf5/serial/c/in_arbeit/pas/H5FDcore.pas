unit H5FDcore;

interface

uses
  fp_hdf5, H5public, H5Ipublic;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function H5FD_CORE: Thid_t;

function H5Pset_fapl_core(fapl_id: Thid_t; increment: Tsize_t; backing_store: Thbool_t): Therr_t; cdecl; external libhdf5;
function H5Pget_fapl_core(fapl_id: Thid_t; increment: Psize_t; backing_store: Phbool_t): Therr_t; cdecl; external libhdf5;

function H5FD_core_init: Thid_t; cdecl; external libhdf5;

// === Konventiert am: 20-8-26 19:43:56 ===


implementation


function H5FD_CORE: Thid_t;
begin
  H5FD_CORE := H5FD_core_init;
end;


end.
