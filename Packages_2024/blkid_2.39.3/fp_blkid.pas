unit fp_blkid;

interface

const
  {$IFDEF Linux}
  libblkid = 'libblkid';
  {$ENDIF}

  {$IFDEF windows}
// not supported
  {$ENDIF}


type
  Tsize_t = SizeUInt;
  Psize_t = ^Tsize_t;

  Tdev_t = uint32;
  Pdev_t = ^Tdev_t;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  Tculong = uint64;
  Tclong = int64;

const
  BLKID_VERSION = '2.39.3';
  BLKID_DATE = '04-Dec-2023';

type
  PPblkid_dev = ^Pblkid_dev;
  Pblkid_dev = type Pointer;

  PPblkid_cache = ^Pblkid_cache;
  Pblkid_cache = type Pointer;

  PPblkid_probe = ^Pblkid_probe;
  Pblkid_probe = type Pointer;

  PPblkid_topology = ^Pblkid_topology;
  Pblkid_topology = type Pointer;

  PPblkid_partlist = ^PTblkid_partlist;
  PTblkid_partlist = type Pointer;

  PPblkid_partition = ^Pblkid_partition;
  Pblkid_partition = type Pointer;

  PPblkid_parttable = ^Pblkid_parttable;
  Pblkid_parttable = type Pointer;

  Pblkid_loff_t = ^Tblkid_loff_t;
  Tblkid_loff_t = int64;

  PPblkid_tag_iterate = ^Pblkid_tag_iterate;
  Pblkid_tag_iterate = type Pointer;

  PPblkid_dev_iterate = ^Pblkid_dev_iterate;
  Pblkid_dev_iterate = type Pointer;

const
  BLKID_DEV_FIND = $0000;
  BLKID_DEV_CREATE = $0001;
  BLKID_DEV_VERIFY = $0002;
  BLKID_DEV_NORMAL = BLKID_DEV_CREATE or BLKID_DEV_VERIFY;

procedure blkid_init_debug(mask: longint); cdecl; external libblkid;

procedure blkid_put_cache(cache: Pblkid_cache); cdecl; external libblkid;
function blkid_get_cache(cache: PPblkid_cache; filename: pchar): longint; cdecl; external libblkid;
procedure blkid_gc_cache(cache: Pblkid_cache); cdecl; external libblkid;

function blkid_dev_devname(dev: Pblkid_dev): pchar; cdecl; external libblkid;
function blkid_dev_iterate_begin(cache: Pblkid_cache): Pblkid_dev_iterate; cdecl; external libblkid;
function blkid_dev_set_search(iter: Pblkid_dev_iterate; search_type: pchar; search_value: pchar): longint; cdecl; external libblkid;
function blkid_dev_next(iterate: Pblkid_dev_iterate; dev: PPblkid_dev): longint; cdecl; external libblkid;
procedure blkid_dev_iterate_end(iterate: Pblkid_dev_iterate); cdecl; external libblkid;

function blkid_devno_to_devname(devno: Tdev_t): pchar; cdecl; external libblkid;
function blkid_devno_to_wholedisk(dev: Tdev_t; diskname: pchar; len: Tsize_t; diskdevno: Pdev_t): longint; cdecl; external libblkid;

function blkid_probe_all(cache: Pblkid_cache): longint; cdecl; external libblkid;
function blkid_probe_all_new(cache: Pblkid_cache): longint; cdecl; external libblkid;
function blkid_probe_all_removable(cache: Pblkid_cache): longint; cdecl; external libblkid;
function blkid_get_dev(cache: Pblkid_cache; devname: pchar; flags: longint): Pblkid_dev; cdecl; external libblkid;

function blkid_get_dev_size(fd: longint): Tblkid_loff_t; cdecl; external libblkid;

function blkid_verify(cache: Pblkid_cache; dev: Pblkid_dev): Pblkid_dev; cdecl; external libblkid;

function blkid_get_tag_value(cache: Pblkid_cache; tagname: pchar; devname: pchar): pchar; cdecl; external libblkid;
function blkid_get_devname(cache: Pblkid_cache; token: pchar; value: pchar): pchar; cdecl; external libblkid;

function blkid_tag_iterate_begin(dev: Pblkid_dev): Pblkid_tag_iterate; cdecl; external libblkid;
function blkid_tag_next(iterate: Pblkid_tag_iterate; _type: PPchar; value: PPchar): longint; cdecl; external libblkid;
procedure blkid_tag_iterate_end(iterate: Pblkid_tag_iterate); cdecl; external libblkid;
function blkid_dev_has_tag(dev: Pblkid_dev; _type: pchar; value: pchar): longint; cdecl; external libblkid;
function blkid_find_dev_with_tag(cache: Pblkid_cache; _type: pchar; value: pchar): Pblkid_dev; cdecl; external libblkid;
function blkid_parse_tag_string(token: pchar; ret_type: PPchar; ret_val: PPchar): longint; cdecl; external libblkid;

function blkid_parse_version_string(ver_string: pchar): longint; cdecl; external libblkid;
function blkid_get_library_version(ver_string: PPchar; date_string: PPchar): longint; cdecl; external libblkid;

function blkid_encode_string(str: pchar; str_enc: pchar; len: Tsize_t): longint; cdecl; external libblkid;
function blkid_safe_string(str: pchar; str_safe: pchar; len: Tsize_t): longint; cdecl; external libblkid;

function blkid_send_uevent(devname: pchar; action: pchar): longint; cdecl; external libblkid;
function blkid_evaluate_tag(token: pchar; value: pchar; cache: PPblkid_cache): pchar; cdecl; external libblkid;
function blkid_evaluate_spec(spec: pchar; cache: PPblkid_cache): pchar; cdecl; external libblkid;

function blkid_new_probe: Pblkid_probe; cdecl; external libblkid;
function blkid_new_probe_from_filename(filename: pchar): Pblkid_probe; cdecl; external libblkid;
procedure blkid_free_probe(pr: Pblkid_probe); cdecl; external libblkid;
procedure blkid_reset_probe(pr: Pblkid_probe); cdecl; external libblkid;
function blkid_probe_reset_buffers(pr: Pblkid_probe): longint; cdecl; external libblkid;
function blkid_probe_hide_range(pr: Pblkid_probe; off: uint64; len: uint64): longint; cdecl; external libblkid;
function blkid_probe_set_device(pr: Pblkid_probe; fd: longint; off: Tblkid_loff_t; size: Tblkid_loff_t): longint; cdecl; external libblkid;
function blkid_probe_get_devno(pr: Pblkid_probe): Tdev_t; cdecl; external libblkid;
function blkid_probe_get_wholedisk_devno(pr: Pblkid_probe): Tdev_t; cdecl; external libblkid;
function blkid_probe_is_wholedisk(pr: Pblkid_probe): longint; cdecl; external libblkid;
function blkid_probe_get_size(pr: Pblkid_probe): Tblkid_loff_t; cdecl; external libblkid;
function blkid_probe_get_offset(pr: Pblkid_probe): Tblkid_loff_t; cdecl; external libblkid;
function blkid_probe_get_sectorsize(pr: Pblkid_probe): dword; cdecl; external libblkid;
function blkid_probe_set_sectorsize(pr: Pblkid_probe; sz: dword): longint; cdecl; external libblkid;
function blkid_probe_get_sectors(pr: Pblkid_probe): Tblkid_loff_t; cdecl; external libblkid;
function blkid_probe_get_fd(pr: Pblkid_probe): longint; cdecl; external libblkid;
function blkid_probe_set_hint(pr: Pblkid_probe; name: pchar; value: uint64): longint; cdecl; external libblkid;
procedure blkid_probe_reset_hints(pr: Pblkid_probe); cdecl; external libblkid;

function blkid_known_fstype(fstype: pchar): longint; cdecl; external libblkid;
function blkid_superblocks_get_name(idx: Tsize_t; name: PPchar; usage: Plongint): longint; cdecl; external libblkid;
function blkid_probe_enable_superblocks(pr: Pblkid_probe; enable: longint): longint; cdecl; external libblkid;

const
  BLKID_SUBLKS_LABEL = 1 shl 1;
  BLKID_SUBLKS_LABELRAW = 1 shl 2;
  BLKID_SUBLKS_UUID = 1 shl 3;
  BLKID_SUBLKS_UUIDRAW = 1 shl 4;
  BLKID_SUBLKS_TYPE = 1 shl 5;
  BLKID_SUBLKS_SECTYPE = 1 shl 6;
  BLKID_SUBLKS_USAGE = 1 shl 7;
  BLKID_SUBLKS_VERSION = 1 shl 8;
  BLKID_SUBLKS_MAGIC = 1 shl 9;
  BLKID_SUBLKS_BADCSUM = 1 shl 10;
  BLKID_SUBLKS_FSINFO = 1 shl 11;
  BLKID_SUBLKS_DEFAULT = ((BLKID_SUBLKS_LABEL or BLKID_SUBLKS_UUID) or BLKID_SUBLKS_TYPE) or BLKID_SUBLKS_SECTYPE;

function blkid_probe_set_superblocks_flags(pr: Pblkid_probe; flags: longint): longint; cdecl; external libblkid;
function blkid_probe_reset_superblocks_filter(pr: Pblkid_probe): longint; cdecl; external libblkid;
function blkid_probe_invert_superblocks_filter(pr: Pblkid_probe): longint; cdecl; external libblkid;

const
  BLKID_FLTR_NOTIN = 1;
  BLKID_FLTR_ONLYIN = 2;

function blkid_probe_filter_superblocks_type(pr: Pblkid_probe; flag: longint; names: PPchar): longint; cdecl; external libblkid;

const
  BLKID_USAGE_FILESYSTEM = 1 shl 1;
  BLKID_USAGE_RAID = 1 shl 2;
  BLKID_USAGE_CRYPTO = 1 shl 3;
  BLKID_USAGE_OTHER = 1 shl 4;

function blkid_probe_filter_superblocks_usage(pr: Pblkid_probe; flag: longint; usage: longint): longint; cdecl; external libblkid;
function blkid_probe_enable_topology(pr: Pblkid_probe; enable: longint): longint; cdecl; external libblkid;
function blkid_probe_get_topology(pr: Pblkid_probe): Pblkid_topology; cdecl; external libblkid;
function blkid_topology_get_alignment_offset(tp: Pblkid_topology): Tculong; cdecl; external libblkid;
function blkid_topology_get_minimum_io_size(tp: Pblkid_topology): Tculong; cdecl; external libblkid;
function blkid_topology_get_optimal_io_size(tp: Pblkid_topology): Tculong; cdecl; external libblkid;
function blkid_topology_get_logical_sector_size(tp: Pblkid_topology): Tculong; cdecl; external libblkid;
function blkid_topology_get_physical_sector_size(tp: Pblkid_topology): Tculong; cdecl; external libblkid;
function blkid_topology_get_dax(tp: Pblkid_topology): Tculong; cdecl; external libblkid;
function blkid_topology_get_diskseq(tp: Pblkid_topology): uint64; cdecl; external libblkid;
function blkid_known_pttype(pttype: pchar): longint; cdecl; external libblkid;
function blkid_partitions_get_name(idx: Tsize_t; name: PPchar): longint; cdecl; external libblkid;
function blkid_probe_enable_partitions(pr: Pblkid_probe; enable: longint): longint; cdecl; external libblkid;
function blkid_probe_reset_partitions_filter(pr: Pblkid_probe): longint; cdecl; external libblkid;
function blkid_probe_invert_partitions_filter(pr: Pblkid_probe): longint; cdecl; external libblkid;
function blkid_probe_filter_partitions_type(pr: Pblkid_probe; flag: longint; names: PPchar): longint; cdecl; external libblkid;

const
  BLKID_PARTS_FORCE_GPT = 1 shl 1;
  BLKID_PARTS_ENTRY_DETAILS = 1 shl 2;
  BLKID_PARTS_MAGIC = 1 shl 3;

function blkid_probe_set_partitions_flags(pr: Pblkid_probe; flags: longint): longint; cdecl; external libblkid;
function blkid_probe_get_partitions(pr: Pblkid_probe): PTblkid_partlist; cdecl; external libblkid;
function blkid_partlist_numof_partitions(ls: PTblkid_partlist): longint; cdecl; external libblkid;
function blkid_partlist_get_table(ls: PTblkid_partlist): Pblkid_parttable; cdecl; external libblkid;
function blkid_partlist_get_partition(ls: PTblkid_partlist; n: longint): Pblkid_partition; cdecl; external libblkid;
function blkid_partlist_get_partition_by_partno(ls: PTblkid_partlist; n: longint): Pblkid_partition; cdecl; external libblkid;
function blkid_partlist_devno_to_partition(ls: PTblkid_partlist; devno: Tdev_t): Pblkid_partition; cdecl; external libblkid;
function blkid_partition_get_table(par: Pblkid_partition): Pblkid_parttable; cdecl; external libblkid;
function blkid_partition_get_name(par: Pblkid_partition): pchar; cdecl; external libblkid;
function blkid_partition_get_uuid(par: Pblkid_partition): pchar; cdecl; external libblkid;
function blkid_partition_get_partno(par: Pblkid_partition): longint; cdecl; external libblkid;
function blkid_partition_get_start(par: Pblkid_partition): Tblkid_loff_t; cdecl; external libblkid;
function blkid_partition_get_size(par: Pblkid_partition): Tblkid_loff_t; cdecl; external libblkid;
function blkid_partition_get_type(par: Pblkid_partition): longint; cdecl; external libblkid;
function blkid_partition_get_type_string(par: Pblkid_partition): pchar; cdecl; external libblkid;
function blkid_partition_get_flags(par: Pblkid_partition): UInt64; cdecl; external libblkid;
function blkid_partition_is_logical(par: Pblkid_partition): longint; cdecl; external libblkid;
function blkid_partition_is_extended(par: Pblkid_partition): longint; cdecl; external libblkid;
function blkid_partition_is_primary(par: Pblkid_partition): longint; cdecl; external libblkid;
function blkid_parttable_get_type(tab: Pblkid_parttable): pchar; cdecl; external libblkid;
function blkid_parttable_get_id(tab: Pblkid_parttable): pchar; cdecl; external libblkid;
function blkid_parttable_get_offset(tab: Pblkid_parttable): Tblkid_loff_t; cdecl; external libblkid;
function blkid_parttable_get_parent(tab: Pblkid_parttable): Pblkid_partition; cdecl; external libblkid;
function blkid_do_probe(pr: Pblkid_probe): longint; cdecl; external libblkid;
function blkid_do_safeprobe(pr: Pblkid_probe): longint; cdecl; external libblkid;
function blkid_do_fullprobe(pr: Pblkid_probe): longint; cdecl; external libblkid;

const
  BLKID_PROBE_OK = 0;
  BLKID_PROBE_NONE = 1;
  BLKID_PROBE_ERROR = -(1);
  BLKID_PROBE_AMBIGUOUS = -(2);

function blkid_probe_numof_values(pr: Pblkid_probe): longint; cdecl; external libblkid;
function blkid_probe_get_value(pr: Pblkid_probe; num: longint; name: PPchar; data: PPchar; len: Psize_t): longint; cdecl; external libblkid;
function blkid_probe_lookup_value(pr: Pblkid_probe; name: pchar; data: PPchar; len: Psize_t): longint; cdecl; external libblkid;
function blkid_probe_has_value(pr: Pblkid_probe; name: pchar): longint; cdecl; external libblkid;
function blkid_do_wipe(pr: Pblkid_probe; dryrun: longint): longint; cdecl; external libblkid;
function blkid_probe_step_back(pr: Pblkid_probe): longint; cdecl; external libblkid;

const
  BLKID_PROBREQ_LABEL = BLKID_SUBLKS_LABEL;
  BLKID_PROBREQ_LABELRAW = BLKID_SUBLKS_LABELRAW;
  BLKID_PROBREQ_UUID = BLKID_SUBLKS_UUID;
  BLKID_PROBREQ_UUIDRAW = BLKID_SUBLKS_UUIDRAW;
  BLKID_PROBREQ_TYPE = BLKID_SUBLKS_TYPE;
  BLKID_PROBREQ_SECTYPE = BLKID_SUBLKS_SECTYPE;
  BLKID_PROBREQ_USAGE = BLKID_SUBLKS_USAGE;
  BLKID_PROBREQ_VERSION = BLKID_SUBLKS_VERSION;

function blkid_probe_set_request(pr: Pblkid_probe; flags: longint): longint; cdecl; external libblkid; deprecated;
function blkid_probe_filter_usage(pr: Pblkid_probe; flag: longint; usage: longint): longint; cdecl; external libblkid; deprecated;
function blkid_probe_filter_types(pr: Pblkid_probe; flag: longint; names: PPchar): longint; cdecl; external libblkid; deprecated;
function blkid_probe_invert_filter(pr: Pblkid_probe): longint; cdecl; external libblkid; deprecated;
function blkid_probe_reset_filter(pr: Pblkid_probe): longint; cdecl; external libblkid; deprecated;

// === Konventiert am: 3-8-25 15:45:57 ===


implementation



end.
