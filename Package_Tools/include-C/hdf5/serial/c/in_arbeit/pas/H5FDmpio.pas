unit H5FDmpio;

interface

uses
  fp_hdf5, H5public, H5Ipublic;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


var
  H5FD_mpi_opt_types_g: Thbool_t; cvar;external libhdf5;

function H5FD_mpio_init: Thid_t; cdecl; external libhdf5;
function H5Pset_fapl_mpio(fapl_id: Thid_t; comm: TMPI_Comm; info: TMPI_Info): Therr_t; cdecl; external libhdf5;
function H5Pget_fapl_mpio(fapl_id: Thid_t; comm: PMPI_Comm; info: PMPI_Info): Therr_t; cdecl; external libhdf5;
function H5Pset_dxpl_mpio(dxpl_id: Thid_t; xfer_mode: TH5FD_mpio_xfer_t): Therr_t; cdecl; external libhdf5;
function H5Pget_dxpl_mpio(dxpl_id: Thid_t; xfer_mode: PH5FD_mpio_xfer_t): Therr_t; cdecl; external libhdf5;
function H5Pset_dxpl_mpio_collective_opt(dxpl_id: Thid_t; opt_mode: TH5FD_mpio_collective_opt_t): Therr_t; cdecl; external libhdf5;
function H5Pset_dxpl_mpio_chunk_opt(dxpl_id: Thid_t; opt_mode: TH5FD_mpio_chunk_opt_t): Therr_t; cdecl; external libhdf5;
function H5Pset_dxpl_mpio_chunk_opt_num(dxpl_id: Thid_t; num_chunk_per_proc: dword): Therr_t; cdecl; external libhdf5;
function H5Pset_dxpl_mpio_chunk_opt_ratio(dxpl_id: Thid_t; percent_num_proc_per_chunk: dword): Therr_t; cdecl; external libhdf5;

function H5FD_MPIO: Thid_t;

// === Konventiert am: 20-8-26 19:43:38 ===


implementation


function H5FD_MPIO: Thid_t;
begin
  H5FD_MPIO := H5FD_mpio_init;
end;


end.
