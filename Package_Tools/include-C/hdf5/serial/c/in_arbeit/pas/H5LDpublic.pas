unit H5LDpublic;

interface

uses
  fp_hdf5, H5public, H5Ipublic;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function H5LDget_dset_dims(did: Thid_t; cur_dims: Phsize_t): Therr_t; cdecl; external libhdf5_serial;
function H5LDget_dset_type_size(did: Thid_t; fields: pchar): Tsize_t; cdecl; external libhdf5_serial;
function H5LDget_dset_elmts(did: Thid_t; prev_dims: Phsize_t; cur_dims: Phsize_t; fields: pchar; buf: pointer): Therr_t; cdecl; external libhdf5_serial;

// === Konventiert am: 21-8-26 14:24:00 ===


implementation



end.
