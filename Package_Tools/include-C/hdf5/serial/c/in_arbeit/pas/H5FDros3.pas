unit H5FDros3;

interface

uses
  fp_hdf5, H5public, H5Ipublic;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  H5FD_CURR_ROS3_FAPL_T_VERSION = 1;
  H5FD_ROS3_MAX_REGION_LEN = 32;
  H5FD_ROS3_MAX_SECRET_ID_LEN = 128;
  H5FD_ROS3_MAX_SECRET_KEY_LEN = 128;

type
  PH5FD_ros3_fapl_t = ^TH5FD_ros3_fapl_t;
  TH5FD_ros3_fapl_t = record
    version: Tint32_t;
    authenticate: Thbool_t;
    aws_region: array[0..(H5FD_ROS3_MAX_REGION_LEN + 1) - 1] of char;
    secret_id: array[0..(H5FD_ROS3_MAX_SECRET_ID_LEN + 1) - 1] of char;
    secret_key: array[0..(H5FD_ROS3_MAX_SECRET_KEY_LEN + 1) - 1] of char;
  end;

function H5FD_ros3_init: Thid_t; cdecl; external libhdf5_serial;
function H5Pget_fapl_ros3(fapl_id: Thid_t; fa_out: PH5FD_ros3_fapl_t): Therr_t; cdecl; external libhdf5_serial;
function H5Pset_fapl_ros3(fapl_id: Thid_t; fa: PH5FD_ros3_fapl_t): Therr_t; cdecl; external libhdf5_serial;

function H5FD_ROS3: Thid_t;

// === Konventiert am: 21-8-26 14:14:37 ===


implementation


function H5FD_ROS3: Thid_t;
begin
  H5FD_ROS3 := H5FD_ros3_init;
end;


end.
