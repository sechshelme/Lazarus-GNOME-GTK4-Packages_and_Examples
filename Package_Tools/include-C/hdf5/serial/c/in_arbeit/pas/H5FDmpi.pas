unit H5FDmpi;

interface

uses
  fp_hdf5;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  H5D_ONE_LINK_CHUNK_IO_THRESHOLD = 0;
  H5D_MULTI_CHUNK_IO_COL_THRESHOLD = 60;

type
  PH5FD_mpio_xfer_t = ^TH5FD_mpio_xfer_t;
  TH5FD_mpio_xfer_t = longint;
const
  H5FD_MPIO_INDEPENDENT = 0;
  H5FD_MPIO_COLLECTIVE = 1;

type
  PH5FD_mpio_chunk_opt_t = ^TH5FD_mpio_chunk_opt_t;
  TH5FD_mpio_chunk_opt_t = longint;
const
  H5FD_MPIO_CHUNK_DEFAULT = 0;
  H5FD_MPIO_CHUNK_ONE_IO = 1;
  H5FD_MPIO_CHUNK_MULTI_IO = 2;

type
  PH5FD_mpio_collective_opt_t = ^TH5FD_mpio_collective_opt_t;
  TH5FD_mpio_collective_opt_t = longint;
const
  H5FD_MPIO_COLLECTIVE_IO = 0;
  H5FD_MPIO_INDIVIDUAL_IO = 1;

  // === Konventiert am: 20-8-26 19:43:41 ===


implementation



end.
