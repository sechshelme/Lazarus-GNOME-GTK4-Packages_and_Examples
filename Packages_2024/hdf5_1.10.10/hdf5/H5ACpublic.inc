{$IFDEF read_interface}



const
  H5AC__CURR_CACHE_CONFIG_VERSION = 1;
  H5AC__MAX_TRACE_FILE_NAME_LEN = 1024;
  H5AC_METADATA_WRITE_STRATEGY__PROCESS_0_ONLY = 0;
  H5AC_METADATA_WRITE_STRATEGY__DISTRIBUTED = 1;

type
  PH5AC_cache_config_t = ^TH5AC_cache_config_t;
  TH5AC_cache_config_t = record
    version: longint;
    rpt_fcn_enabled: Thbool_t;
    open_trace_file: Thbool_t;
    close_trace_file: Thbool_t;
    trace_file_name: array[0..(H5AC__MAX_TRACE_FILE_NAME_LEN + 1) - 1] of char;
    evictions_enabled: Thbool_t;
    set_initial_size: Thbool_t;
    initial_size: Tsize_t;
    min_clean_fraction: Tdouble;
    max_size: Tsize_t;
    min_size: Tsize_t;
    epoch_length: longint;
    incr_mode: TH5C_cache_incr_mode;
    lower_hr_threshold: Tdouble;
    increment: Tdouble;
    apply_max_increment: Thbool_t;
    max_increment: Tsize_t;
    flash_incr_mode: TH5C_cache_flash_incr_mode;
    flash_multiple: Tdouble;
    flash_threshold: Tdouble;
    decr_mode: TH5C_cache_decr_mode;
    upper_hr_threshold: Tdouble;
    decrement: Tdouble;
    apply_max_decrement: Thbool_t;
    max_decrement: Tsize_t;
    epochs_before_eviction: longint;
    apply_empty_reserve: Thbool_t;
    empty_reserve: Tdouble;
    dirty_bytes_threshold: Tsize_t;
    metadata_write_strategy: longint;
  end;

const
  H5AC__CURR_CACHE_IMAGE_CONFIG_VERSION = 1;
  H5AC__CACHE_IMAGE__ENTRY_AGEOUT__NONE = -(1);
  H5AC__CACHE_IMAGE__ENTRY_AGEOUT__MAX = 100;

type
  PH5AC_cache_image_config_t = ^TH5AC_cache_image_config_t;
  TH5AC_cache_image_config_t = record
    version: longint;
    generate_image: Thbool_t;
    save_resize_status: Thbool_t;
    entry_ageout: longint;
  end;

  // === Konventiert am: 20-8-26 19:37:36 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
