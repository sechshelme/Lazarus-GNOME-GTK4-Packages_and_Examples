unit H5FDhdfs;

interface

uses
  fp_hdf5, H5public, H5Ipublic;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  H5FD__CURR_HDFS_FAPL_T_VERSION = 1;
  H5FD__HDFS_NODE_NAME_SPACE = 128;
  H5FD__HDFS_USER_NAME_SPACE = 128;
  H5FD__HDFS_KERB_CACHE_PATH_SPACE = 128;

type
  PH5FD_hdfs_fapl_t = ^TH5FD_hdfs_fapl_t;
  TH5FD_hdfs_fapl_t = record
    version: Tint32_t;
    namenode_name: array[0..(H5FD__HDFS_NODE_NAME_SPACE + 1) - 1] of char;
    namenode_port: Tint32_t;
    user_name: array[0..(H5FD__HDFS_USER_NAME_SPACE + 1) - 1] of char;
    kerberos_ticket_cache: array[0..(H5FD__HDFS_KERB_CACHE_PATH_SPACE + 1) - 1] of char;
    stream_buffer_size: Tint32_t;
  end;

function H5FD_hdfs_init: Thid_t; cdecl; external libhdf5;
function H5Pget_fapl_hdfs(fapl_id: Thid_t; fa_out: PH5FD_hdfs_fapl_t): Therr_t; cdecl; external libhdf5;
function H5Pset_fapl_hdfs(fapl_id: Thid_t; fa: PH5FD_hdfs_fapl_t): Therr_t; cdecl; external libhdf5;

function H5FD_HDFS: Thid_t;

// === Konventiert am: 20-8-26 19:43:48 ===


implementation

function H5FD_HDFS: Thid_t;
begin
  H5FD_HDFS := H5FD_hdfs_init;
end;

end.
