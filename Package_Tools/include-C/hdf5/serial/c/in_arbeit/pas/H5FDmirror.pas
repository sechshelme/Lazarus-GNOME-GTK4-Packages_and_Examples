unit H5FDmirror;

interface

uses
  fp_hdf5, H5Ipublic, H5public;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function H5FD_MIRROR: Thid_t;

const
  H5FD_MIRROR_FAPL_MAGIC = $F8DD514C;
  H5FD_MIRROR_CURR_FAPL_T_VERSION = 1;
  H5FD_MIRROR_MAX_IP_LEN = 32;
type
  PH5FD_mirror_fapl_t = ^TH5FD_mirror_fapl_t;
  TH5FD_mirror_fapl_t = record
    magic: Tuint32_t;
    version: Tuint32_t;
    handshake_port: longint;
    remote_ip: array[0..(H5FD_MIRROR_MAX_IP_LEN + 1) - 1] of char;
  end;

function H5FD_mirror_init: Thid_t; cdecl; external libhdf5;

function H5Pget_fapl_mirror(fapl_id: Thid_t; fa_out: PH5FD_mirror_fapl_t): Therr_t; cdecl; external libhdf5;
function H5Pset_fapl_mirror(fapl_id: Thid_t; fa: PH5FD_mirror_fapl_t): Therr_t; cdecl; external libhdf5;


// === Konventiert am: 20-8-26 19:43:43 ===


implementation


function H5FD_MIRROR: Thid_t;
begin
  H5FD_MIRROR := H5FD_mirror_init;
end;


end.
