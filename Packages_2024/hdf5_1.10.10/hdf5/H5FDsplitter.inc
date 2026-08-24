{$IFDEF read_interface}


const
  H5FD_CURR_SPLITTER_VFD_CONFIG_VERSION = 1;
  H5FD_SPLITTER_PATH_MAX = 4096;
  H5FD_SPLITTER_MAGIC = $2B916880;

type
  PH5FD_splitter_vfd_config_t = ^TH5FD_splitter_vfd_config_t;
  TH5FD_splitter_vfd_config_t = record
    magic: Tint32_t;
    version: dword;
    rw_fapl_id: Thid_t;
    wo_fapl_id: Thid_t;
    wo_path: array[0..(H5FD_SPLITTER_PATH_MAX + 1) - 1] of char;
    log_file_path: array[0..(H5FD_SPLITTER_PATH_MAX + 1) - 1] of char;
    ignore_wo_errs: Thbool_t;
  end;

function H5FD_splitter_init: Thid_t; cdecl; external libhdf5_serial;
function H5Pset_fapl_splitter(fapl_id: Thid_t; config_ptr: PH5FD_splitter_vfd_config_t): Therr_t; cdecl; external libhdf5_serial;
function H5Pget_fapl_splitter(fapl_id: Thid_t; config_ptr: PH5FD_splitter_vfd_config_t): Therr_t; cdecl; external libhdf5_serial;

function H5FD_SPLITTER: Thid_t;

// === Konventiert am: 21-8-26 14:14:32 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}

function H5FD_SPLITTER: Thid_t;
begin
  H5FD_SPLITTER := H5FD_splitter_init;
end;


{$ENDIF read_implementation}
