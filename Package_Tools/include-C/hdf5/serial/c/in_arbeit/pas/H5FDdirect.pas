unit H5FDdirect;

interface

uses
  fp_hdf5, H5public, H5Ipublic;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  MBOUNDARY_DEF = 4096;
  FBSIZE_DEF = 4096;
  CBSIZE_DEF = 16 * 1024 * 1024;

function H5FD_direct_init: Thid_t; cdecl; external libhdf5;
function H5Pset_fapl_direct(fapl_id: Thid_t; alignment: Tsize_t; block_size: Tsize_t; cbuf_size: Tsize_t): Therr_t; cdecl; external libhdf5;
function H5Pget_fapl_direct(fapl_id: Thid_t; boundary: Psize_t; block_size: Psize_t; cbuf_size: Psize_t): Therr_t; cdecl; external libhdf5;

function H5FD_DIRECT: Thid_t;

// === Konventiert am: 20-8-26 19:43:54 ===


implementation

function H5FD_DIRECT: Thid_t;
begin
  H5FD_DIRECT := H5FD_direct_init;
end;


end.
