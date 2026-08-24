unit H5FDpublic;

interface

uses
  fp_hdf5, H5public, H5Fpublic, H5Ipublic;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  H5_HAVE_VFL = 1;
  H5FD_VFD_DEFAULT = 0;

type
  PH5FD_mem_t = ^TH5FD_mem_t;
  TH5FD_mem_t = TH5F_mem_t;
const
  H5FD_MEM_FHEAP_HDR = H5FD_MEM_OHDR;
  H5FD_MEM_FHEAP_IBLOCK = H5FD_MEM_OHDR;
  H5FD_MEM_FHEAP_DBLOCK = H5FD_MEM_LHEAP;
  H5FD_MEM_FHEAP_HUGE_OBJ = H5FD_MEM_DRAW;

  H5FD_MEM_FSPACE_HDR = H5FD_MEM_OHDR;
  H5FD_MEM_FSPACE_SINFO = H5FD_MEM_LHEAP;
  H5FD_MEM_SOHM_TABLE = H5FD_MEM_OHDR;
  H5FD_MEM_SOHM_INDEX = H5FD_MEM_BTREE;

  H5FD_MEM_EARRAY_HDR = H5FD_MEM_OHDR;
  H5FD_MEM_EARRAY_IBLOCK = H5FD_MEM_OHDR;
  H5FD_MEM_EARRAY_SBLOCK = H5FD_MEM_BTREE;
  H5FD_MEM_EARRAY_DBLOCK = H5FD_MEM_LHEAP;
  H5FD_MEM_EARRAY_DBLK_PAGE = H5FD_MEM_LHEAP;

  H5FD_MEM_FARRAY_HDR = H5FD_MEM_OHDR;
  H5FD_MEM_FARRAY_DBLOCK = H5FD_MEM_LHEAP;
  H5FD_MEM_FARRAY_DBLK_PAGE = H5FD_MEM_LHEAP;

const
  H5FD_FEAT_AGGREGATE_METADATA = $00000001;
  H5FD_FEAT_ACCUMULATE_METADATA_WRITE = $00000002;
  H5FD_FEAT_ACCUMULATE_METADATA_READ = $00000004;
  H5FD_FEAT_ACCUMULATE_METADATA = H5FD_FEAT_ACCUMULATE_METADATA_WRITE or H5FD_FEAT_ACCUMULATE_METADATA_READ;
  H5FD_FEAT_DATA_SIEVE = $00000008;
  H5FD_FEAT_AGGREGATE_SMALLDATA = $00000010;
  H5FD_FEAT_IGNORE_DRVRINFO = $00000020;
  H5FD_FEAT_DIRTY_DRVRINFO_LOAD = $00000040;
  H5FD_FEAT_POSIX_COMPAT_HANDLE = $00000080;
  H5FD_FEAT_HAS_MPI = $00000100;
  H5FD_FEAT_ALLOCATE_EARLY = $00000200;
  H5FD_FEAT_ALLOW_FILE_IMAGE = $00000400;
  H5FD_FEAT_CAN_USE_FILE_IMAGE_CALLBACKS = $00000800;
  H5FD_FEAT_SUPPORTS_SWMR_IO = $00001000;
  H5FD_FEAT_USE_ALLOC_SIZE = $00002000;
  H5FD_FEAT_PAGED_AGGR = $00004000;
  H5FD_FEAT_DEFAULT_VFD_COMPATIBLE = $00008000;

type
  PH5FD_t = ^TH5FD_t;

  PH5FD_class_t = ^TH5FD_class_t;
  TH5FD_class_t = record
    name: pchar;
    maxaddr: Thaddr_t;
    fc_degree: TH5F_close_degree_t;
    terminate: function: Therr_t; cdecl;
    sb_size: function(file_: PH5FD_t): Thsize_t; cdecl;
    sb_encode: function(file_: PH5FD_t; name: pchar; p: pbyte): Therr_t; cdecl;
    sb_decode: function(f: PH5FD_t; name: pchar; p: pbyte): Therr_t; cdecl;
    fapl_size: Tsize_t;
    fapl_get: function(file_: PH5FD_t): pointer; cdecl;
    fapl_copy: function(fapl: pointer): pointer; cdecl;
    fapl_free: function(fapl: pointer): Therr_t; cdecl;
    dxpl_size: Tsize_t;
    dxpl_copy: function(dxpl: pointer): pointer; cdecl;
    dxpl_free: function(dxpl: pointer): Therr_t; cdecl;
    open: function(name: pchar; flags: dword; fapl: Thid_t; maxaddr: Thaddr_t): PH5FD_t; cdecl;
    close: function(file_: PH5FD_t): Therr_t; cdecl;
    cmp: function(f1: PH5FD_t; f2: PH5FD_t): longint; cdecl;
    query: function(f1: PH5FD_t; flags: Pdword): Therr_t; cdecl;
    get_type_map: function(file_: PH5FD_t; type_map: PH5FD_mem_t): Therr_t; cdecl;
    alloc: function(file_: PH5FD_t; _type: TH5FD_mem_t; dxpl_id: Thid_t; size: Thsize_t): Thaddr_t; cdecl;
    free: function(file_: PH5FD_t; _type: TH5FD_mem_t; dxpl_id: Thid_t; addr: Thaddr_t; size: Thsize_t): Therr_t; cdecl;
    get_eoa: function(file_: PH5FD_t; _type: TH5FD_mem_t): Thaddr_t; cdecl;
    set_eoa: function(file_: PH5FD_t; _type: TH5FD_mem_t; addr: Thaddr_t): Therr_t; cdecl;
    get_eof: function(file_: PH5FD_t; _type: TH5FD_mem_t): Thaddr_t; cdecl;
    get_handle: function(file_: PH5FD_t; fapl: Thid_t; file_handle: Ppointer): Therr_t; cdecl;
    read: function(file_: PH5FD_t; _type: TH5FD_mem_t; dxpl: Thid_t; addr: Thaddr_t; size: Tsize_t;
      buffer: pointer): Therr_t; cdecl;
    write: function(file_: PH5FD_t; _type: TH5FD_mem_t; dxpl: Thid_t; addr: Thaddr_t; size: Tsize_t;
      buffer: pointer): Therr_t; cdecl;
    flush: function(file_: PH5FD_t; dxpl_id: Thid_t; closing: Thbool_t): Therr_t; cdecl;
    truncate: function(file_: PH5FD_t; dxpl_id: Thid_t; closing: Thbool_t): Therr_t; cdecl;
    lock: function(file_: PH5FD_t; rw: Thbool_t): Therr_t; cdecl;
    unlock: function(file_: PH5FD_t): Therr_t; cdecl;
    fl_map: array[0..(H5FD_MEM_NTYPES) - 1] of TH5FD_mem_t;
  end;

  PH5FD_free_t = ^TH5FD_free_t;
  TH5FD_free_t = record
    addr: Thaddr_t;
    size: Thsize_t;
    next: PH5FD_free_t;
  end;

  TH5FD_t = record
    driver_id: Thid_t;
    cls: PH5FD_class_t;
    fileno: dword;
    access_flags: dword;
    feature_flags: dword;
    maxaddr: Thaddr_t;
    base_addr: Thaddr_t;
    threshold: Thsize_t;
    alignment: Thsize_t;
    paged_aggr: Thbool_t;
  end;

type
  PH5FD_file_image_op_t = ^TH5FD_file_image_op_t;
  TH5FD_file_image_op_t = longint;
const
  H5FD_FILE_IMAGE_OP_NO_OP = 0;
  H5FD_FILE_IMAGE_OP_PROPERTY_LIST_SET = 1;
  H5FD_FILE_IMAGE_OP_PROPERTY_LIST_COPY = 2;
  H5FD_FILE_IMAGE_OP_PROPERTY_LIST_GET = 3;
  H5FD_FILE_IMAGE_OP_PROPERTY_LIST_CLOSE = 4;
  H5FD_FILE_IMAGE_OP_FILE_OPEN = 5;
  H5FD_FILE_IMAGE_OP_FILE_RESIZE = 6;
  H5FD_FILE_IMAGE_OP_FILE_CLOSE = 7;

type
  PH5FD_file_image_callbacks_t = ^TH5FD_file_image_callbacks_t;
  TH5FD_file_image_callbacks_t = record
    image_malloc: function(size: Tsize_t; file_image_op: TH5FD_file_image_op_t; udata: pointer): pointer; cdecl;
    image_memcpy: function(dest: pointer; src: pointer; size: Tsize_t; file_image_op: TH5FD_file_image_op_t; udata: pointer): pointer; cdecl;
    image_realloc: function(ptr: pointer; size: Tsize_t; file_image_op: TH5FD_file_image_op_t; udata: pointer): pointer; cdecl;
    image_free: function(ptr: pointer; file_image_op: TH5FD_file_image_op_t; udata: pointer): Therr_t; cdecl;
    udata_copy: function(udata: pointer): pointer; cdecl;
    udata_free: function(udata: pointer): Therr_t; cdecl;
    udata: pointer;
  end;

function H5FDregister(cls: PH5FD_class_t): Thid_t; cdecl; external libhdf5_serial;
function H5FDunregister(driver_id: Thid_t): Therr_t; cdecl; external libhdf5_serial;
function H5FDopen(name: pchar; flags: dword; fapl_id: Thid_t; maxaddr: Thaddr_t): PH5FD_t; cdecl; external libhdf5_serial;
function H5FDclose(file_: PH5FD_t): Therr_t; cdecl; external libhdf5_serial;
function H5FDcmp(f1: PH5FD_t; f2: PH5FD_t): longint; cdecl; external libhdf5_serial;
function H5FDquery(f: PH5FD_t; flags: Pdword): longint; cdecl; external libhdf5_serial;
function H5FDalloc(file_: PH5FD_t; _type: TH5FD_mem_t; dxpl_id: Thid_t; size: Thsize_t): Thaddr_t; cdecl; external libhdf5_serial;
function H5FDfree(file_: PH5FD_t; _type: TH5FD_mem_t; dxpl_id: Thid_t; addr: Thaddr_t; size: Thsize_t): Therr_t; cdecl; external libhdf5_serial;
function H5FDget_eoa(file_: PH5FD_t; _type: TH5FD_mem_t): Thaddr_t; cdecl; external libhdf5_serial;
function H5FDset_eoa(file_: PH5FD_t; _type: TH5FD_mem_t; eoa: Thaddr_t): Therr_t; cdecl; external libhdf5_serial;
function H5FDget_eof(file_: PH5FD_t; _type: TH5FD_mem_t): Thaddr_t; cdecl; external libhdf5_serial;
function H5FDget_vfd_handle(file_: PH5FD_t; fapl: Thid_t; file_handle: Ppointer): Therr_t; cdecl; external libhdf5_serial;
function H5FDread(file_: PH5FD_t; _type: TH5FD_mem_t; dxpl_id: Thid_t; addr: Thaddr_t; size: Tsize_t;
  buf: pointer): Therr_t; cdecl; external libhdf5_serial;
function H5FDwrite(file_: PH5FD_t; _type: TH5FD_mem_t; dxpl_id: Thid_t; addr: Thaddr_t; size: Tsize_t;
  buf: pointer): Therr_t; cdecl; external libhdf5_serial;
function H5FDflush(file_: PH5FD_t; dxpl_id: Thid_t; closing: Thbool_t): Therr_t; cdecl; external libhdf5_serial;
function H5FDtruncate(file_: PH5FD_t; dxpl_id: Thid_t; closing: Thbool_t): Therr_t; cdecl; external libhdf5_serial;
function H5FDlock(file_: PH5FD_t; rw: Thbool_t): Therr_t; cdecl; external libhdf5_serial;
function H5FDunlock(file_: PH5FD_t): Therr_t; cdecl; external libhdf5_serial;
function H5FDdriver_query(driver_id: Thid_t; flags: Pdword): Therr_t; cdecl; external libhdf5_serial;

// === Konventiert am: 20-8-26 19:43:33 ===


implementation



end.
