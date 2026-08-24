{$IFDEF read_interface}


const
  H5P_CRT_ORDER_TRACKED = $0001;
  H5P_CRT_ORDER_INDEXED = $0002;

  H5P_DEFAULT = 0;
type
  TH5P_cls_create_func_t = function(prop_id: Thid_t; create_data: pointer): Therr_t; cdecl;
  TH5P_cls_copy_func_t = function(new_prop_id: Thid_t; old_prop_id: Thid_t; copy_data: pointer): Therr_t; cdecl;
  TH5P_cls_close_func_t = function(prop_id: Thid_t; close_data: pointer): Therr_t; cdecl;
  TH5P_prp_cb1_t = function(name: pchar; size: Tsize_t; value: pointer): Therr_t; cdecl;
  TH5P_prp_cb2_t = function(prop_id: Thid_t; name: pchar; size: Tsize_t; value: pointer): Therr_t; cdecl;

  TH5P_prp_create_func_t = TH5P_prp_cb1_t;
  TH5P_prp_set_func_t = TH5P_prp_cb2_t;
  TH5P_prp_get_func_t = TH5P_prp_cb2_t;
  TH5P_prp_delete_func_t = TH5P_prp_cb2_t;
  TH5P_prp_copy_func_t = TH5P_prp_cb1_t;

  TH5P_prp_compare_func_t = function(value1: pointer; value2: pointer; size: Tsize_t): longint; cdecl;

  TH5P_prp_close_func_t = TH5P_prp_cb1_t;

  TH5P_iterate_t = function(id: Thid_t; name: pchar; iter_data: pointer): Therr_t; cdecl;

type
  PH5D_mpio_actual_chunk_opt_mode_t = ^TH5D_mpio_actual_chunk_opt_mode_t;
  TH5D_mpio_actual_chunk_opt_mode_t = longint;
const
  H5D_MPIO_NO_CHUNK_OPTIMIZATION = 0;
  H5D_MPIO_LINK_CHUNK = 1;
  H5D_MPIO_MULTI_CHUNK = 2;

type
  PH5D_mpio_actual_io_mode_t = ^TH5D_mpio_actual_io_mode_t;
  TH5D_mpio_actual_io_mode_t = longint;
const
  H5D_MPIO_NO_COLLECTIVE = $0;
  H5D_MPIO_CHUNK_INDEPENDENT = $1;
  H5D_MPIO_CHUNK_COLLECTIVE = $2;
  H5D_MPIO_CHUNK_MIXED = $1 or $2;
  H5D_MPIO_CONTIGUOUS_COLLECTIVE = $4;

type
  PH5D_mpio_no_collective_cause_t = ^TH5D_mpio_no_collective_cause_t;
  TH5D_mpio_no_collective_cause_t = longint;
const
  H5D_MPIO_COLLECTIVE = $00;
  H5D_MPIO_SET_INDEPENDENT = $01;
  H5D_MPIO_DATATYPE_CONVERSION = $02;
  H5D_MPIO_DATA_TRANSFORMS = $04;
  H5D_MPIO_MPI_OPT_TYPES_ENV_VAR_DISABLED = $08;
  H5D_MPIO_NOT_SIMPLE_OR_SCALAR_DATASPACES = $10;
  H5D_MPIO_NOT_CONTIGUOUS_OR_CHUNKED_DATASET = $20;
  H5D_MPIO_PARALLEL_FILTERED_WRITES_DISABLED = $40;
  H5D_MPIO_ERROR_WHILE_CHECKING_COLLECTIVE_POSSIBLE = $80;
  H5D_MPIO_NO_COLLECTIVE_MAX_CAUSE = $100;

var
  H5P_CLS_ROOT_ID_g: Thid_t; cvar;external libhdf5_serial;
  H5P_CLS_OBJECT_CREATE_ID_g: Thid_t; cvar;external libhdf5_serial;
  H5P_CLS_FILE_CREATE_ID_g: Thid_t; cvar;external libhdf5_serial;
  H5P_CLS_FILE_ACCESS_ID_g: Thid_t; cvar;external libhdf5_serial;
  H5P_CLS_DATASET_CREATE_ID_g: Thid_t; cvar;external libhdf5_serial;
  H5P_CLS_DATASET_ACCESS_ID_g: Thid_t; cvar;external libhdf5_serial;
  H5P_CLS_DATASET_XFER_ID_g: Thid_t; cvar;external libhdf5_serial;
  H5P_CLS_FILE_MOUNT_ID_g: Thid_t; cvar;external libhdf5_serial;
  H5P_CLS_GROUP_CREATE_ID_g: Thid_t; cvar;external libhdf5_serial;
  H5P_CLS_GROUP_ACCESS_ID_g: Thid_t; cvar;external libhdf5_serial;
  H5P_CLS_DATATYPE_CREATE_ID_g: Thid_t; cvar;external libhdf5_serial;
  H5P_CLS_DATATYPE_ACCESS_ID_g: Thid_t; cvar;external libhdf5_serial;
  H5P_CLS_STRING_CREATE_ID_g: Thid_t; cvar;external libhdf5_serial;
  H5P_CLS_ATTRIBUTE_CREATE_ID_g: Thid_t; cvar;external libhdf5_serial;
  H5P_CLS_ATTRIBUTE_ACCESS_ID_g: Thid_t; cvar;external libhdf5_serial;
  H5P_CLS_OBJECT_COPY_ID_g: Thid_t; cvar;external libhdf5_serial;
  H5P_CLS_LINK_CREATE_ID_g: Thid_t; cvar;external libhdf5_serial;
  H5P_CLS_LINK_ACCESS_ID_g: Thid_t; cvar;external libhdf5_serial;
  H5P_LST_FILE_CREATE_ID_g: Thid_t; cvar;external libhdf5_serial;
  H5P_LST_FILE_ACCESS_ID_g: Thid_t; cvar;external libhdf5_serial;
  H5P_LST_DATASET_CREATE_ID_g: Thid_t; cvar;external libhdf5_serial;
  H5P_LST_DATASET_ACCESS_ID_g: Thid_t; cvar;external libhdf5_serial;
  H5P_LST_DATASET_XFER_ID_g: Thid_t; cvar;external libhdf5_serial;
  H5P_LST_FILE_MOUNT_ID_g: Thid_t; cvar;external libhdf5_serial;
  H5P_LST_GROUP_CREATE_ID_g: Thid_t; cvar;external libhdf5_serial;
  H5P_LST_GROUP_ACCESS_ID_g: Thid_t; cvar;external libhdf5_serial;
  H5P_LST_DATATYPE_CREATE_ID_g: Thid_t; cvar;external libhdf5_serial;
  H5P_LST_DATATYPE_ACCESS_ID_g: Thid_t; cvar;external libhdf5_serial;
  H5P_LST_ATTRIBUTE_CREATE_ID_g: Thid_t; cvar;external libhdf5_serial;
  H5P_LST_ATTRIBUTE_ACCESS_ID_g: Thid_t; cvar;external libhdf5_serial;
  H5P_LST_OBJECT_COPY_ID_g: Thid_t; cvar;external libhdf5_serial;
  H5P_LST_LINK_CREATE_ID_g: Thid_t; cvar;external libhdf5_serial;
  H5P_LST_LINK_ACCESS_ID_g: Thid_t; cvar;external libhdf5_serial;

function H5Pclose(plist_id: Thid_t): Therr_t; cdecl; external libhdf5_serial;
function H5Pclose_class(plist_id: Thid_t): Therr_t; cdecl; external libhdf5_serial;
function H5Pcopy(plist_id: Thid_t): Thid_t; cdecl; external libhdf5_serial;
function H5Pcopy_prop(dst_id: Thid_t; src_id: Thid_t; name: pchar): Therr_t; cdecl; external libhdf5_serial;
function H5Pcreate(cls_id: Thid_t): Thid_t; cdecl; external libhdf5_serial;
function H5Pcreate_class(parent: Thid_t; name: pchar; create: TH5P_cls_create_func_t; create_data: pointer; copy: TH5P_cls_copy_func_t;
  copy_data: pointer; close: TH5P_cls_close_func_t; close_data: pointer): Thid_t; cdecl; external libhdf5_serial;
function H5Pdecode(buf: pointer): Thid_t; cdecl; external libhdf5_serial;
function H5Pencode(plist_id: Thid_t; buf: pointer; nalloc: Psize_t): Therr_t; cdecl; external libhdf5_serial;
function H5Pequal(id1: Thid_t; id2: Thid_t): Thtri_t; cdecl; external libhdf5_serial;
function H5Pexist(plist_id: Thid_t; name: pchar): Thtri_t; cdecl; external libhdf5_serial;
function H5Pget(plist_id: Thid_t; name: pchar; value: pointer): Therr_t; cdecl; external libhdf5_serial;
function H5Pget_class(plist_id: Thid_t): Thid_t; cdecl; external libhdf5_serial;
function H5Pget_class_name(pclass_id: Thid_t): pchar; cdecl; external libhdf5_serial;
function H5Pget_class_parent(pclass_id: Thid_t): Thid_t; cdecl; external libhdf5_serial;
function H5Pget_nprops(id: Thid_t; nprops: Psize_t): Therr_t; cdecl; external libhdf5_serial;
function H5Pget_size(id: Thid_t; name: pchar; size: Psize_t): Therr_t; cdecl; external libhdf5_serial;
function H5Pinsert2(plist_id: Thid_t; name: pchar; size: Tsize_t; value: pointer; set_: TH5P_prp_set_func_t;
  get: TH5P_prp_get_func_t; prp_del: TH5P_prp_delete_func_t; copy: TH5P_prp_copy_func_t; compare: TH5P_prp_compare_func_t; close: TH5P_prp_close_func_t): Therr_t; cdecl; external libhdf5_serial;
function H5Pisa_class(plist_id: Thid_t; pclass_id: Thid_t): Thtri_t; cdecl; external libhdf5_serial;
function H5Piterate(id: Thid_t; idx: Plongint; iter_func: TH5P_iterate_t; iter_data: pointer): longint; cdecl; external libhdf5_serial;
function H5Pregister2(cls_id: Thid_t; name: pchar; size: Tsize_t; def_value: pointer; create: TH5P_prp_create_func_t;
  set_: TH5P_prp_set_func_t; get: TH5P_prp_get_func_t; prp_del: TH5P_prp_delete_func_t; copy: TH5P_prp_copy_func_t; compare: TH5P_prp_compare_func_t;
  close: TH5P_prp_close_func_t): Therr_t; cdecl; external libhdf5_serial;
function H5Premove(plist_id: Thid_t; name: pchar): Therr_t; cdecl; external libhdf5_serial;
function H5Pset(plist_id: Thid_t; name: pchar; value: pointer): Therr_t; cdecl; external libhdf5_serial;
function H5Punregister(pclass_id: Thid_t; name: pchar): Therr_t; cdecl; external libhdf5_serial;
function H5Pall_filters_avail(plist_id: Thid_t): Thtri_t; cdecl; external libhdf5_serial;
function H5Pget_attr_creation_order(plist_id: Thid_t; crt_order_flags: Pdword): Therr_t; cdecl; external libhdf5_serial;
function H5Pget_attr_phase_change(plist_id: Thid_t; max_compact: Pdword; min_dense: Pdword): Therr_t; cdecl; external libhdf5_serial;
function H5Pget_filter2(plist_id: Thid_t; idx: dword; flags: Pdword; cd_nelmts: Psize_t; cd_values: Pdword;
  namelen: Tsize_t; name: pchar; filter_config: Pdword): TH5Z_filter_t; cdecl; external libhdf5_serial;
function H5Pget_filter_by_id2(plist_id: Thid_t; filter_id: TH5Z_filter_t; flags: Pdword; cd_nelmts: Psize_t; cd_values: Pdword;
  namelen: Tsize_t; name: pchar; filter_config: Pdword): Therr_t; cdecl; external libhdf5_serial;
function H5Pget_nfilters(plist_id: Thid_t): longint; cdecl; external libhdf5_serial;
function H5Pget_obj_track_times(plist_id: Thid_t; track_times: Phbool_t): Therr_t; cdecl; external libhdf5_serial;
function H5Pmodify_filter(plist_id: Thid_t; filter: TH5Z_filter_t; flags: dword; cd_nelmts: Tsize_t; cd_values: Pdword): Therr_t; cdecl; external libhdf5_serial;
function H5Premove_filter(plist_id: Thid_t; filter: TH5Z_filter_t): Therr_t; cdecl; external libhdf5_serial;
function H5Pset_attr_creation_order(plist_id: Thid_t; crt_order_flags: dword): Therr_t; cdecl; external libhdf5_serial;
function H5Pset_attr_phase_change(plist_id: Thid_t; max_compact: dword; min_dense: dword): Therr_t; cdecl; external libhdf5_serial;
function H5Pset_deflate(plist_id: Thid_t; level: dword): Therr_t; cdecl; external libhdf5_serial;
function H5Pset_filter(plist_id: Thid_t; filter: TH5Z_filter_t; flags: dword; cd_nelmts: Tsize_t; c_values: Pdword): Therr_t; cdecl; external libhdf5_serial;
function H5Pset_fletcher32(plist_id: Thid_t): Therr_t; cdecl; external libhdf5_serial;
function H5Pset_obj_track_times(plist_id: Thid_t; track_times: Thbool_t): Therr_t; cdecl; external libhdf5_serial;
function H5Pget_file_space_page_size(plist_id: Thid_t; fsp_size: Phsize_t): Therr_t; cdecl; external libhdf5_serial;
function H5Pget_file_space_strategy(plist_id: Thid_t; strategy: PH5F_fspace_strategy_t; persist: Phbool_t; threshold: Phsize_t): Therr_t; cdecl; external libhdf5_serial;
function H5Pget_istore_k(plist_id: Thid_t; ik: Pdword): Therr_t; cdecl; external libhdf5_serial;
function H5Pget_shared_mesg_index(plist_id: Thid_t; index_num: dword; mesg_type_flags: Pdword; min_mesg_size: Pdword): Therr_t; cdecl; external libhdf5_serial;
function H5Pget_shared_mesg_nindexes(plist_id: Thid_t; nindexes: Pdword): Therr_t; cdecl; external libhdf5_serial;
function H5Pget_shared_mesg_phase_change(plist_id: Thid_t; max_list: Pdword; min_btree: Pdword): Therr_t; cdecl; external libhdf5_serial;
function H5Pget_sizes(plist_id: Thid_t; sizeof_addr: Psize_t; sizeof_size: Psize_t): Therr_t; cdecl; external libhdf5_serial;
function H5Pget_sym_k(plist_id: Thid_t; ik: Pdword; lk: Pdword): Therr_t; cdecl; external libhdf5_serial;
function H5Pget_userblock(plist_id: Thid_t; size: Phsize_t): Therr_t; cdecl; external libhdf5_serial;
function H5Pset_file_space_page_size(plist_id: Thid_t; fsp_size: Thsize_t): Therr_t; cdecl; external libhdf5_serial;
function H5Pset_file_space_strategy(plist_id: Thid_t; strategy: TH5F_fspace_strategy_t; persist: Thbool_t; threshold: Thsize_t): Therr_t; cdecl; external libhdf5_serial;
function H5Pset_istore_k(plist_id: Thid_t; ik: dword): Therr_t; cdecl; external libhdf5_serial;
function H5Pset_shared_mesg_index(plist_id: Thid_t; index_num: dword; mesg_type_flags: dword; min_mesg_size: dword): Therr_t; cdecl; external libhdf5_serial;
function H5Pset_shared_mesg_nindexes(plist_id: Thid_t; nindexes: dword): Therr_t; cdecl; external libhdf5_serial;
function H5Pset_shared_mesg_phase_change(plist_id: Thid_t; max_list: dword; min_btree: dword): Therr_t; cdecl; external libhdf5_serial;
function H5Pset_sizes(plist_id: Thid_t; sizeof_addr: Tsize_t; sizeof_size: Tsize_t): Therr_t; cdecl; external libhdf5_serial;
function H5Pset_sym_k(plist_id: Thid_t; ik: dword; lk: dword): Therr_t; cdecl; external libhdf5_serial;
function H5Pset_userblock(plist_id: Thid_t; size: Thsize_t): Therr_t; cdecl; external libhdf5_serial;
function H5Pget_alignment(fapl_id: Thid_t; threshold: Phsize_t; alignment: Phsize_t): Therr_t; cdecl; external libhdf5_serial;
function H5Pget_cache(plist_id: Thid_t; mdc_nelmts: Plongint; rdcc_nslots: Psize_t; rdcc_nbytes: Psize_t; rdcc_w0: Pdouble): Therr_t; cdecl; external libhdf5_serial;
function H5Pget_core_write_tracking(fapl_id: Thid_t; is_enabled: Phbool_t; page_size: Psize_t): Therr_t; cdecl; external libhdf5_serial;
function H5Pget_driver(plist_id: Thid_t): Thid_t; cdecl; external libhdf5_serial;
function H5Pget_driver_info(plist_id: Thid_t): pointer; cdecl; external libhdf5_serial;
function H5Pget_elink_file_cache_size(plist_id: Thid_t; efc_size: Pdword): Therr_t; cdecl; external libhdf5_serial;
function H5Pget_evict_on_close(fapl_id: Thid_t; evict_on_close: Phbool_t): Therr_t; cdecl; external libhdf5_serial;
function H5Pget_family_offset(fapl_id: Thid_t; offset: Phsize_t): Therr_t; cdecl; external libhdf5_serial;
function H5Pget_fclose_degree(fapl_id: Thid_t; degree: PH5F_close_degree_t): Therr_t; cdecl; external libhdf5_serial;
function H5Pget_file_image(fapl_id: Thid_t; buf_ptr_ptr: Ppointer; buf_len_ptr: Psize_t): Therr_t; cdecl; external libhdf5_serial;
function H5Pget_file_image_callbacks(fapl_id: Thid_t; callbacks_ptr: PH5FD_file_image_callbacks_t): Therr_t; cdecl; external libhdf5_serial;
function H5Pget_file_locking(fapl_id: Thid_t; use_file_locking: Phbool_t; ignore_when_disabled: Phbool_t): Therr_t; cdecl; external libhdf5_serial;
function H5Pget_gc_references(fapl_id: Thid_t; gc_ref: Pdword): Therr_t; cdecl; external libhdf5_serial;
function H5Pget_libver_bounds(plist_id: Thid_t; low: PH5F_libver_t; high: PH5F_libver_t): Therr_t; cdecl; external libhdf5_serial;
function H5Pget_mdc_config(plist_id: Thid_t; config_ptr: PH5AC_cache_config_t): Therr_t; cdecl; external libhdf5_serial;
function H5Pget_mdc_image_config(plist_id: Thid_t; config_ptr: PH5AC_cache_image_config_t): Therr_t; cdecl; external libhdf5_serial;
function H5Pget_mdc_log_options(plist_id: Thid_t; is_enabled: Phbool_t; location: pchar; location_size: Psize_t; start_on_access: Phbool_t): Therr_t; cdecl; external libhdf5_serial;
function H5Pget_meta_block_size(fapl_id: Thid_t; size: Phsize_t): Therr_t; cdecl; external libhdf5_serial;
function H5Pget_metadata_read_attempts(plist_id: Thid_t; attempts: Pdword): Therr_t; cdecl; external libhdf5_serial;
function H5Pget_multi_type(fapl_id: Thid_t; _type: PH5FD_mem_t): Therr_t; cdecl; external libhdf5_serial;
function H5Pget_object_flush_cb(plist_id: Thid_t; func: PH5F_flush_cb_t; udata: Ppointer): Therr_t; cdecl; external libhdf5_serial;
function H5Pget_page_buffer_size(plist_id: Thid_t; buf_size: Psize_t; min_meta_perc: Pdword; min_raw_perc: Pdword): Therr_t; cdecl; external libhdf5_serial;
function H5Pget_sieve_buf_size(fapl_id: Thid_t; size: Psize_t): Therr_t; cdecl; external libhdf5_serial;
function H5Pget_small_data_block_size(fapl_id: Thid_t; size: Phsize_t): Therr_t; cdecl; external libhdf5_serial;
function H5Pset_alignment(fapl_id: Thid_t; threshold: Thsize_t; alignment: Thsize_t): Therr_t; cdecl; external libhdf5_serial;
function H5Pset_cache(plist_id: Thid_t; mdc_nelmts: longint; rdcc_nslots: Tsize_t; rdcc_nbytes: Tsize_t; rdcc_w0: Tdouble): Therr_t; cdecl; external libhdf5_serial;
function H5Pset_core_write_tracking(fapl_id: Thid_t; is_enabled: Thbool_t; page_size: Tsize_t): Therr_t; cdecl; external libhdf5_serial;
function H5Pset_driver(plist_id: Thid_t; driver_id: Thid_t; driver_info: pointer): Therr_t; cdecl; external libhdf5_serial;
function H5Pset_elink_file_cache_size(plist_id: Thid_t; efc_size: dword): Therr_t; cdecl; external libhdf5_serial;
function H5Pset_evict_on_close(fapl_id: Thid_t; evict_on_close: Thbool_t): Therr_t; cdecl; external libhdf5_serial;
function H5Pset_family_offset(fapl_id: Thid_t; offset: Thsize_t): Therr_t; cdecl; external libhdf5_serial;
function H5Pset_fclose_degree(fapl_id: Thid_t; degree: TH5F_close_degree_t): Therr_t; cdecl; external libhdf5_serial;
function H5Pset_file_image(fapl_id: Thid_t; buf_ptr: pointer; buf_len: Tsize_t): Therr_t; cdecl; external libhdf5_serial;
function H5Pset_file_image_callbacks(fapl_id: Thid_t; callbacks_ptr: PH5FD_file_image_callbacks_t): Therr_t; cdecl; external libhdf5_serial;
function H5Pset_file_locking(fapl_id: Thid_t; use_file_locking: Thbool_t; ignore_when_disabled: Thbool_t): Therr_t; cdecl; external libhdf5_serial;
function H5Pset_gc_references(fapl_id: Thid_t; gc_ref: dword): Therr_t; cdecl; external libhdf5_serial;
function H5Pset_libver_bounds(plist_id: Thid_t; low: TH5F_libver_t; high: TH5F_libver_t): Therr_t; cdecl; external libhdf5_serial;
function H5Pset_mdc_config(plist_id: Thid_t; config_ptr: PH5AC_cache_config_t): Therr_t; cdecl; external libhdf5_serial;
function H5Pset_mdc_log_options(plist_id: Thid_t; is_enabled: Thbool_t; location: pchar; start_on_access: Thbool_t): Therr_t; cdecl; external libhdf5_serial;
function H5Pset_meta_block_size(fapl_id: Thid_t; size: Thsize_t): Therr_t; cdecl; external libhdf5_serial;
function H5Pset_metadata_read_attempts(plist_id: Thid_t; attempts: dword): Therr_t; cdecl; external libhdf5_serial;
function H5Pset_multi_type(fapl_id: Thid_t; _type: TH5FD_mem_t): Therr_t; cdecl; external libhdf5_serial;
function H5Pset_object_flush_cb(plist_id: Thid_t; func: TH5F_flush_cb_t; udata: pointer): Therr_t; cdecl; external libhdf5_serial;
function H5Pset_sieve_buf_size(fapl_id: Thid_t; size: Tsize_t): Therr_t; cdecl; external libhdf5_serial;
function H5Pset_small_data_block_size(fapl_id: Thid_t; size: Thsize_t): Therr_t; cdecl; external libhdf5_serial;
function H5Pset_all_coll_metadata_ops(plist_id: Thid_t; is_collective: Thbool_t): Therr_t; cdecl; external libhdf5_serial;
function H5Pget_all_coll_metadata_ops(plist_id: Thid_t; is_collective: Phbool_t): Therr_t; cdecl; external libhdf5_serial;
function H5Pset_coll_metadata_write(plist_id: Thid_t; is_collective: Thbool_t): Therr_t; cdecl; external libhdf5_serial;
function H5Pget_coll_metadata_write(plist_id: Thid_t; is_collective: Phbool_t): Therr_t; cdecl; external libhdf5_serial;
function H5Pset_mdc_image_config(plist_id: Thid_t; config_ptr: PH5AC_cache_image_config_t): Therr_t; cdecl; external libhdf5_serial;
function H5Pset_page_buffer_size(plist_id: Thid_t; buf_size: Tsize_t; min_meta_per: dword; min_raw_per: dword): Therr_t; cdecl; external libhdf5_serial;
function H5Pfill_value_defined(plist: Thid_t; status: PH5D_fill_value_t): Therr_t; cdecl; external libhdf5_serial;
function H5Pget_alloc_time(plist_id: Thid_t; alloc_time: PH5D_alloc_time_t): Therr_t; cdecl; external libhdf5_serial;
function H5Pget_chunk(plist_id: Thid_t; max_ndims: longint; dim: Phsize_t): longint; cdecl; external libhdf5_serial;
function H5Pget_chunk_opts(plist_id: Thid_t; opts: Pdword): Therr_t; cdecl; external libhdf5_serial;
function H5Pget_dset_no_attrs_hint(dcpl_id: Thid_t; minimize: Phbool_t): Therr_t; cdecl; external libhdf5_serial;
function H5Pget_external(plist_id: Thid_t; idx: dword; name_size: Tsize_t; name: pchar; offset: Poff_t; size: Phsize_t): Therr_t; cdecl; external libhdf5_serial;
function H5Pget_external_count(plist_id: Thid_t): longint; cdecl; external libhdf5_serial;
function H5Pget_fill_time(plist_id: Thid_t; fill_time: PH5D_fill_time_t): Therr_t; cdecl; external libhdf5_serial;
function H5Pget_fill_value(plist_id: Thid_t; type_id: Thid_t; value: pointer): Therr_t; cdecl; external libhdf5_serial;
function H5Pget_layout(plist_id: Thid_t): TH5D_layout_t; cdecl; external libhdf5_serial;
function H5Pget_virtual_count(dcpl_id: Thid_t; count: Psize_t): Therr_t; cdecl; external libhdf5_serial;
function H5Pget_virtual_dsetname(dcpl_id: Thid_t; index: Tsize_t; name: pchar; size: Tsize_t): Tssize_t; cdecl; external libhdf5_serial;
function H5Pget_virtual_filename(dcpl_id: Thid_t; index: Tsize_t; name: pchar; size: Tsize_t): Tssize_t; cdecl; external libhdf5_serial;
function H5Pget_virtual_srcspace(dcpl_id: Thid_t; index: Tsize_t): Thid_t; cdecl; external libhdf5_serial;
function H5Pget_virtual_vspace(dcpl_id: Thid_t; index: Tsize_t): Thid_t; cdecl; external libhdf5_serial;
function H5Pset_alloc_time(plist_id: Thid_t; alloc_time: TH5D_alloc_time_t): Therr_t; cdecl; external libhdf5_serial;
function H5Pset_chunk(plist_id: Thid_t; ndims: longint; dim: Phsize_t): Therr_t; cdecl; external libhdf5_serial;
function H5Pset_chunk_opts(plist_id: Thid_t; opts: dword): Therr_t; cdecl; external libhdf5_serial;
function H5Pset_dset_no_attrs_hint(dcpl_id: Thid_t; minimize: Thbool_t): Therr_t; cdecl; external libhdf5_serial;
function H5Pset_external(plist_id: Thid_t; name: pchar; offset: Toff_t; size: Thsize_t): Therr_t; cdecl; external libhdf5_serial;
function H5Pset_fill_time(plist_id: Thid_t; fill_time: TH5D_fill_time_t): Therr_t; cdecl; external libhdf5_serial;
function H5Pset_fill_value(plist_id: Thid_t; type_id: Thid_t; value: pointer): Therr_t; cdecl; external libhdf5_serial;
function H5Pset_shuffle(plist_id: Thid_t): Therr_t; cdecl; external libhdf5_serial;
function H5Pset_layout(plist_id: Thid_t; layout: TH5D_layout_t): Therr_t; cdecl; external libhdf5_serial;
function H5Pset_nbit(plist_id: Thid_t): Therr_t; cdecl; external libhdf5_serial;
function H5Pset_scaleoffset(plist_id: Thid_t; scale_type: TH5Z_SO_scale_type_t; scale_factor: longint): Therr_t; cdecl; external libhdf5_serial;
function H5Pset_szip(plist_id: Thid_t; options_mask: dword; pixels_per_block: dword): Therr_t; cdecl; external libhdf5_serial;
function H5Pset_virtual(dcpl_id: Thid_t; vspace_id: Thid_t; src_file_name: pchar; src_dset_name: pchar; src_space_id: Thid_t): Therr_t; cdecl; external libhdf5_serial;
function H5Pget_append_flush(dapl_id: Thid_t; dims: dword; boundary: Phsize_t; func: PH5D_append_cb_t; udata: Ppointer): Therr_t; cdecl; external libhdf5_serial;
function H5Pget_chunk_cache(dapl_id: Thid_t; rdcc_nslots: Psize_t; rdcc_nbytes: Psize_t; rdcc_w0: Pdouble): Therr_t; cdecl; external libhdf5_serial;
function H5Pget_efile_prefix(dapl_id: Thid_t; prefix: pchar; size: Tsize_t): Tssize_t; cdecl; external libhdf5_serial;
function H5Pget_virtual_prefix(dapl_id: Thid_t; prefix: pchar; size: Tsize_t): Tssize_t; cdecl; external libhdf5_serial;
function H5Pget_virtual_printf_gap(dapl_id: Thid_t; gap_size: Phsize_t): Therr_t; cdecl; external libhdf5_serial;
function H5Pget_virtual_view(dapl_id: Thid_t; view: PH5D_vds_view_t): Therr_t; cdecl; external libhdf5_serial;
function H5Pset_append_flush(dapl_id: Thid_t; ndims: dword; boundary: Phsize_t; func: TH5D_append_cb_t; udata: pointer): Therr_t; cdecl; external libhdf5_serial;
function H5Pset_chunk_cache(dapl_id: Thid_t; rdcc_nslots: Tsize_t; rdcc_nbytes: Tsize_t; rdcc_w0: Tdouble): Therr_t; cdecl; external libhdf5_serial;
function H5Pset_efile_prefix(dapl_id: Thid_t; prefix: pchar): Therr_t; cdecl; external libhdf5_serial;
function H5Pset_virtual_prefix(dapl_id: Thid_t; prefix: pchar): Therr_t; cdecl; external libhdf5_serial;
function H5Pset_virtual_printf_gap(dapl_id: Thid_t; gap_size: Thsize_t): Therr_t; cdecl; external libhdf5_serial;
function H5Pset_virtual_view(dapl_id: Thid_t; view: TH5D_vds_view_t): Therr_t; cdecl; external libhdf5_serial;
function H5Pget_btree_ratios(plist_id: Thid_t; left: Pdouble; middle: Pdouble; right: Pdouble): Therr_t; cdecl; external libhdf5_serial;
function H5Pget_buffer(plist_id: Thid_t; tconv: Ppointer; bkg: Ppointer): Tsize_t; cdecl; external libhdf5_serial;
function H5Pget_data_transform(plist_id: Thid_t; expression: pchar; size: Tsize_t): Tssize_t; cdecl; external libhdf5_serial;
function H5Pget_edc_check(plist_id: Thid_t): TH5Z_EDC_t; cdecl; external libhdf5_serial;
function H5Pget_hyper_vector_size(fapl_id: Thid_t; size: Psize_t): Therr_t; cdecl; external libhdf5_serial;
function H5Pget_preserve(plist_id: Thid_t): longint; cdecl; external libhdf5_serial;
function H5Pget_type_conv_cb(dxpl_id: Thid_t; op: PH5T_conv_except_func_t; operate_data: Ppointer): Therr_t; cdecl; external libhdf5_serial;
function H5Pget_vlen_mem_manager(plist_id: Thid_t; alloc_func: PH5MM_allocate_t; alloc_info: Ppointer; free_func: PH5MM_free_t; free_info: Ppointer): Therr_t; cdecl; external libhdf5_serial;
function H5Pset_btree_ratios(plist_id: Thid_t; left: Tdouble; middle: Tdouble; right: Tdouble): Therr_t; cdecl; external libhdf5_serial;
function H5Pset_buffer(plist_id: Thid_t; size: Tsize_t; tconv: pointer; bkg: pointer): Therr_t; cdecl; external libhdf5_serial;
function H5Pset_data_transform(plist_id: Thid_t; expression: pchar): Therr_t; cdecl; external libhdf5_serial;
function H5Pset_edc_check(plist_id: Thid_t; check: TH5Z_EDC_t): Therr_t; cdecl; external libhdf5_serial;
function H5Pset_filter_callback(plist_id: Thid_t; func: TH5Z_filter_func_t; op_data: pointer): Therr_t; cdecl; external libhdf5_serial;
function H5Pset_hyper_vector_size(plist_id: Thid_t; size: Tsize_t): Therr_t; cdecl; external libhdf5_serial;
function H5Pset_preserve(plist_id: Thid_t; status: Thbool_t): Therr_t; cdecl; external libhdf5_serial;
function H5Pset_type_conv_cb(dxpl_id: Thid_t; op: TH5T_conv_except_func_t; operate_data: pointer): Therr_t; cdecl; external libhdf5_serial;
function H5Pset_vlen_mem_manager(plist_id: Thid_t; alloc_func: TH5MM_allocate_t; alloc_info: pointer; free_func: TH5MM_free_t; free_info: pointer): Therr_t; cdecl; external libhdf5_serial;
function H5Pget_mpio_actual_chunk_opt_mode(plist_id: Thid_t; actual_chunk_opt_mode: PH5D_mpio_actual_chunk_opt_mode_t): Therr_t; cdecl; external libhdf5_serial;
function H5Pget_mpio_actual_io_mode(plist_id: Thid_t; actual_io_mode: PH5D_mpio_actual_io_mode_t): Therr_t; cdecl; external libhdf5_serial;
function H5Pget_mpio_no_collective_cause(plist_id: Thid_t; local_no_collective_cause: Puint32_t; global_no_collective_cause: Puint32_t): Therr_t; cdecl; external libhdf5_serial;
function H5Pget_create_intermediate_group(plist_id: Thid_t; crt_intmd: Pdword): Therr_t; cdecl; external libhdf5_serial;
function H5Pset_create_intermediate_group(plist_id: Thid_t; crt_intmd: dword): Therr_t; cdecl; external libhdf5_serial;
function H5Pget_est_link_info(plist_id: Thid_t; est_num_entries: Pdword; est_name_len: Pdword): Therr_t; cdecl; external libhdf5_serial;
function H5Pget_link_creation_order(plist_id: Thid_t; crt_order_flags: Pdword): Therr_t; cdecl; external libhdf5_serial;
function H5Pget_link_phase_change(plist_id: Thid_t; max_compact: Pdword; min_dense: Pdword): Therr_t; cdecl; external libhdf5_serial;
function H5Pget_local_heap_size_hint(plist_id: Thid_t; size_hint: Psize_t): Therr_t; cdecl; external libhdf5_serial;
function H5Pset_est_link_info(plist_id: Thid_t; est_num_entries: dword; est_name_len: dword): Therr_t; cdecl; external libhdf5_serial;
function H5Pset_link_creation_order(plist_id: Thid_t; crt_order_flags: dword): Therr_t; cdecl; external libhdf5_serial;
function H5Pset_link_phase_change(plist_id: Thid_t; max_compact: dword; min_dense: dword): Therr_t; cdecl; external libhdf5_serial;
function H5Pset_local_heap_size_hint(plist_id: Thid_t; size_hint: Tsize_t): Therr_t; cdecl; external libhdf5_serial;
function H5Pget_char_encoding(plist_id: Thid_t; encoding: PH5T_cset_t): Therr_t; cdecl; external libhdf5_serial;
function H5Pset_char_encoding(plist_id: Thid_t; encoding: TH5T_cset_t): Therr_t; cdecl; external libhdf5_serial;
function H5Pget_elink_acc_flags(lapl_id: Thid_t; flags: Pdword): Therr_t; cdecl; external libhdf5_serial;
function H5Pget_elink_cb(lapl_id: Thid_t; func: PH5L_elink_traverse_t; op_data: Ppointer): Therr_t; cdecl; external libhdf5_serial;
function H5Pget_elink_fapl(lapl_id: Thid_t): Thid_t; cdecl; external libhdf5_serial;
function H5Pget_elink_prefix(plist_id: Thid_t; prefix: pchar; size: Tsize_t): Tssize_t; cdecl; external libhdf5_serial;
function H5Pget_nlinks(plist_id: Thid_t; nlinks: Psize_t): Therr_t; cdecl; external libhdf5_serial;
function H5Pset_elink_acc_flags(lapl_id: Thid_t; flags: dword): Therr_t; cdecl; external libhdf5_serial;
function H5Pset_elink_cb(lapl_id: Thid_t; func: TH5L_elink_traverse_t; op_data: pointer): Therr_t; cdecl; external libhdf5_serial;
function H5Pset_elink_fapl(lapl_id: Thid_t; fapl_id: Thid_t): Therr_t; cdecl; external libhdf5_serial;
function H5Pset_elink_prefix(plist_id: Thid_t; prefix: pchar): Therr_t; cdecl; external libhdf5_serial;
function H5Pset_nlinks(plist_id: Thid_t; nlinks: Tsize_t): Therr_t; cdecl; external libhdf5_serial;
function H5Padd_merge_committed_dtype_path(plist_id: Thid_t; path: pchar): Therr_t; cdecl; external libhdf5_serial;
function H5Pfree_merge_committed_dtype_paths(plist_id: Thid_t): Therr_t; cdecl; external libhdf5_serial;
function H5Pget_copy_object(plist_id: Thid_t; copy_options: Pdword): Therr_t; cdecl; external libhdf5_serial;
function H5Pget_mcdt_search_cb(plist_id: Thid_t; func: PH5O_mcdt_search_cb_t; op_data: Ppointer): Therr_t; cdecl; external libhdf5_serial;
function H5Pset_copy_object(plist_id: Thid_t; copy_options: dword): Therr_t; cdecl; external libhdf5_serial;
function H5Pset_mcdt_search_cb(plist_id: Thid_t; func: TH5O_mcdt_search_cb_t; op_data: pointer): Therr_t; cdecl; external libhdf5_serial;

function H5Pregister1(cls_id: Thid_t; name: pchar; size: Tsize_t; def_value: pointer; prp_create: TH5P_prp_create_func_t;
  prp_set: TH5P_prp_set_func_t; prp_get: TH5P_prp_get_func_t; prp_del: TH5P_prp_delete_func_t; prp_copy: TH5P_prp_copy_func_t; prp_close: TH5P_prp_close_func_t): Therr_t; cdecl; external libhdf5_serial;
function H5Pinsert1(plist_id: Thid_t; name: pchar; size: Tsize_t; value: pointer; prp_set: TH5P_prp_set_func_t;
  prp_get: TH5P_prp_get_func_t; prp_delete: TH5P_prp_delete_func_t; prp_copy: TH5P_prp_copy_func_t; prp_close: TH5P_prp_close_func_t): Therr_t; cdecl; external libhdf5_serial;
function H5Pget_filter1(plist_id: Thid_t; filter: dword; flags: Pdword; cd_nelmts: Psize_t; cd_values: Pdword;
  namelen: Tsize_t; name: pchar): TH5Z_filter_t; cdecl; external libhdf5_serial;
function H5Pget_filter_by_id1(plist_id: Thid_t; id: TH5Z_filter_t; flags: Pdword; cd_nelmts: Psize_t; cd_values: Pdword;
  namelen: Tsize_t; name: pchar): Therr_t; cdecl; external libhdf5_serial;
function H5Pget_version(plist_id: Thid_t; boot: Pdword; freelist: Pdword; stab: Pdword; shhdr: Pdword): Therr_t; cdecl; external libhdf5_serial;
function H5Pset_file_space(plist_id: Thid_t; strategy: TH5F_file_space_type_t; threshold: Thsize_t): Therr_t; cdecl; external libhdf5_serial;
function H5Pget_file_space(plist_id: Thid_t; strategy: PH5F_file_space_type_t; threshold: Phsize_t): Therr_t; cdecl; external libhdf5_serial;

// === Konventiert am: 21-8-26 14:40:24 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
