unit H5FDfamily;

interface

uses
  fp_hdf5, H5public, H5Ipublic;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



function H5FD_family_init: Thid_t; cdecl; external libhdf5;
function H5Pset_fapl_family(fapl_id: Thid_t; memb_size: Thsize_t; memb_fapl_id: Thid_t): Therr_t; cdecl; external libhdf5;
function H5Pget_fapl_family(fapl_id: Thid_t; memb_size: Phsize_t; memb_fapl_id: Phid_t): Therr_t; cdecl; external libhdf5;

function H5FD_FAMILY: Thid_t;

// === Konventiert am: 20-8-26 19:43:51 ===


implementation

function H5FD_FAMILY: Thid_t;
begin
  H5FD_FAMILY := H5FD_family_init;
end;


end.
