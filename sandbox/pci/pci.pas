unit pci;

interface

uses
  ctypes;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


const
  PCI_LIB_VERSION = $030a00;  

type
  Ppci_methods = ^Tpci_methods;
  Tpci_methods = record
    end;

  Tpci_access_type =  Longint;
  Const
    PCI_ACCESS_AUTO = 0;
    PCI_ACCESS_SYS_BUS_PCI = 1;
    PCI_ACCESS_PROC_BUS_PCI = 2;
    PCI_ACCESS_I386_TYPE1 = 3;
    PCI_ACCESS_I386_TYPE2 = 4;
    PCI_ACCESS_FBSD_DEVICE = 5;
    PCI_ACCESS_AIX_DEVICE = 6;
    PCI_ACCESS_NBSD_LIBPCI = 7;
    PCI_ACCESS_OBSD_DEVICE = 8;
    PCI_ACCESS_DUMP = 9;
    PCI_ACCESS_DARWIN = 10;
    PCI_ACCESS_SYLIXOS_DEVICE = 11;
    PCI_ACCESS_HURD = 12;
    PCI_ACCESS_WIN32_CFGMGR32 = 13;
    PCI_ACCESS_WIN32_KLDBG = 14;
    PCI_ACCESS_WIN32_SYSDBG = 15;
    PCI_ACCESS_MMIO_TYPE1 = 16;
    PCI_ACCESS_MMIO_TYPE1_EXT = 17;
    PCI_ACCESS_ECAM = 18;
    PCI_ACCESS_MAX = 19;

type
  Tpci_access = record
      method : dword;
      writeable : longint;
      buscentric : longint;
      id_file_name : Pchar;
      free_id_name : longint;
      numeric_ids : longint;
      id_lookup_mode : dword;
      debugging : longint;
      error : procedure (msg:Pchar; args:array of const);cdecl;
      warning : procedure (msg:Pchar; args:array of const);cdecl;
      debug : procedure (msg:Pchar; args:array of const);cdecl;
      devices : Ppci_dev;
      methods : Ppci_methods;
      params : Ppci_param;
      id_hash : ^Pid_entry;
      current_id_bucket : Pid_bucket;
      id_load_failed : longint;
      id_cache_status : longint;
      id_udev : Pudev;
      id_udev_hwdb : Pudev_hwdb;
      fd : longint;
      fd_rw : longint;
      fd_pos : longint;
      fd_vpd : longint;
      cached_dev : Ppci_dev;
      aux : pointer;
    end;
  Ppci_access = ^Tpci_access;


function pci_alloc: ppci_access; cdecl; external libpci;
procedure pci_init(para1:Ppci_access);cdecl;external libpci;
procedure pci_cleanup(para1:Ppci_access);cdecl;external libpci;
procedure pci_scan_bus(acc:Ppci_access);cdecl;external libpci;
function pci_get_dev(acc:Ppci_access; domain:longint; bus:longint; dev:longint; func:longint):Ppci_dev;cdecl;external libpci;
procedure pci_free_dev(para1:Ppci_dev);cdecl;external libpci;
function pci_lookup_method(name:Pchar):longint;cdecl;external libpci;
function pci_get_method_name(index:longint):Pchar;cdecl;external libpci;

type
  Tpci_param = record
      next : Ppci_param;
      param : Pchar;
      value : Pchar;
      value_malloced : longint;
      help : Pchar;
    end;
  Ppci_param = ^Tpci_param;


function pci_get_param(acc:Ppci_access; param:Pchar):Pchar;cdecl;external libpci;
function pci_set_param(acc:Ppci_access; param:Pchar; value:Pchar):longint;cdecl;external libpci;
function pci_walk_params(acc:Ppci_access; prev:Ppci_param):Ppci_param;cdecl;external libpci;
type
  Tpci_dev = record
      next : Ppci_dev;
      domain_16 : Tu16;
      bus : Tu8;
      dev : Tu8;
      func : Tu8;
      known_fields : dword;
      vendor_id : Tu16;
      device_id : Tu16;
      device_class : Tu16;
      irq : longint;
      base_addr : array[0..5] of Tpciaddr_t;
      size : array[0..5] of Tpciaddr_t;
      rom_base_addr : Tpciaddr_t;
      rom_size : Tpciaddr_t;
      first_cap : Ppci_cap;
      phy_slot : Pchar;
      module_alias : Pchar;
      _label : Pchar;
      numa_node : longint;
      flags : array[0..5] of Tpciaddr_t;
      rom_flags : Tpciaddr_t;
      domain : longint;
      bridge_base_addr : array[0..3] of Tpciaddr_t;
      bridge_size : array[0..3] of Tpciaddr_t;
      bridge_flags : array[0..3] of Tpciaddr_t;
      prog_if : Tu8;
      rev_id : Tu8;
      subsys_vendor_id : Tu16;
      subsys_id : Tu16;
      parent : Ppci_dev;
      no_config_access : longint;
      access : Ppci_access;
      methods : Ppci_methods;
      cache : Pu8;
      cache_len : longint;
      hdrtype : longint;
      aux : pointer;
      properties : Ppci_property;
      last_cap : Ppci_cap;
    end;
  Ppci_dev = ^Tpci_dev;


const
  PCI_ADDR_FLAG_MASK = $f;  

function pci_read_byte(para1:Ppci_dev; pos:longint):Tu8;cdecl;external libpci;
function pci_read_word(para1:Ppci_dev; pos:longint):Tu16;cdecl;external libpci;
function pci_read_long(para1:Ppci_dev; pos:longint):Tu32;cdecl;external libpci;
function pci_read_vpd(d:Ppci_dev; pos:longint; buf:Pu8; len:longint):longint;cdecl;external libpci;
function pci_write_byte(para1:Ppci_dev; pos:longint; data:Tu8):longint;cdecl;external libpci;
function pci_write_word(para1:Ppci_dev; pos:longint; data:Tu16):longint;cdecl;external libpci;
function pci_write_long(para1:Ppci_dev; pos:longint; data:Tu32):longint;cdecl;external libpci;
function pci_read_block(para1:Ppci_dev; pos:longint; buf:Pu8; len:longint):longint;cdecl;external libpci;
function pci_write_block(para1:Ppci_dev; pos:longint; buf:Pu8; len:longint):longint;cdecl;external libpci;
function pci_fill_info(para1:Ppci_dev; flags:longint):longint;cdecl;external libpci;
function pci_get_string_property(d:Ppci_dev; prop:Tu32):Pchar;cdecl;external libpci;
const
  PCI_FILL_IDENT = $0001;  
  PCI_FILL_IRQ = $0002;  
  PCI_FILL_BASES = $0004;  
  PCI_FILL_ROM_BASE = $0008;  
  PCI_FILL_SIZES = $0010;  
  PCI_FILL_CLASS = $0020;  
  PCI_FILL_CAPS = $0040;  
  PCI_FILL_EXT_CAPS = $0080;  
  PCI_FILL_PHYS_SLOT = $0100;  
  PCI_FILL_MODULE_ALIAS = $0200;  
  PCI_FILL_LABEL = $0400;  
  PCI_FILL_NUMA_NODE = $0800;  
  PCI_FILL_IO_FLAGS = $1000;  
  PCI_FILL_DT_NODE = $2000;
  PCI_FILL_IOMMU_GROUP = $4000;  
  PCI_FILL_BRIDGE_BASES = $8000;  
  PCI_FILL_RESCAN = $00010000;  
  PCI_FILL_CLASS_EXT = $00020000;
  PCI_FILL_SUBSYS = $00040000;
  PCI_FILL_PARENT = $00080000;  
  PCI_FILL_DRIVER = $00100000;

procedure pci_setup_cache(para1:Ppci_dev; cache:Pu8; len:longint);cdecl;external libpci;
type
  Tpci_cap = record
      next : Ppci_cap;
      id : Tu16;
      _type : Tu16;
      addr : dword;
    end;
  Ppci_cap = ^Tpci_cap;


const
  PCI_CAP_NORMAL = 1;  
  PCI_CAP_EXTENDED = 2;

function pci_find_cap(para1:Ppci_dev; id:dword; _type:dword):Ppci_cap;cdecl;external libpci;
function pci_find_cap_nr(para1:Ppci_dev; id:dword; _type:dword; cap_number:Pdword):Ppci_cap;cdecl;external libpci;
type
  Tpci_filter = record
      domain : longint;
      bus : longint;
      slot : longint;
      func : longint;
      vendor : longint;
      device : longint;
      device_class : longint;
      device_class_mask : dword;
      prog_if : longint;
      rfu : array[0..0] of longint;
    end;
  Ppci_filter = ^Tpci_filter;

procedure pci_filter_init(para1:Ppci_access; para2:Ppci_filter);cdecl;external libpci;
function pci_filter_parse_slot(para1:Ppci_filter; para2:Pchar):Pchar;cdecl;external libpci;
function pci_filter_parse_id(para1:Ppci_filter; para2:Pchar):Pchar;cdecl;external libpci;
function pci_filter_match(para1:Ppci_filter; para2:Ppci_dev):longint;cdecl;external libpci;
function pci_lookup_name(a:Ppci_access; buf:Pchar; size:longint; flags:longint; args:array of const):Pchar;cdecl;external libpci;
function pci_lookup_name(a:Ppci_access; buf:Pchar; size:longint; flags:longint):Pchar;cdecl;external libpci;
function pci_load_name_list(a:Ppci_access):longint;cdecl;external libpci;
procedure pci_free_name_list(a:Ppci_access);cdecl;external libpci;
procedure pci_set_name_list_path(a:Ppci_access; name:Pchar; to_be_freed:longint);cdecl;external libpci;
procedure pci_id_cache_flush(a:Ppci_access);cdecl;external libpci;
type
  Tpci_lookup_mode =  Longint;
  Const
    PCI_LOOKUP_VENDOR = 1;
    PCI_LOOKUP_DEVICE = 2;
    PCI_LOOKUP_CLASS = 4;
    PCI_LOOKUP_SUBSYSTEM = 8;
    PCI_LOOKUP_PROGIF = 16;
    PCI_LOOKUP_NUMERIC = $10000;
    PCI_LOOKUP_NO_NUMBERS = $20000;
    PCI_LOOKUP_MIXED = $40000;
    PCI_LOOKUP_NETWORK = $80000;
    PCI_LOOKUP_SKIP_LOCAL = $100000;
    PCI_LOOKUP_CACHE = $200000;
    PCI_LOOKUP_REFRESH_CACHE = $400000;
    PCI_LOOKUP_NO_HWDB = $800000;

{$endif}

function PCI_ADDR_IO_MASK : longint; { return type might be wrong }
function PCI_ADDR_MEM_MASK : longint; { return type might be wrong }



// === Konventiert am: 28-6-25 19:49:16 ===


implementation


{ was #define dname def_expr }
function PCI_ADDR_IO_MASK : longint; { return type might be wrong }
  begin
    PCI_ADDR_IO_MASK:= not (Tpciaddr_t($3));
  end;

{ was #define dname def_expr }
function PCI_ADDR_MEM_MASK : longint; { return type might be wrong }
  begin
    PCI_ADDR_MEM_MASK:= not (Tpciaddr_t($f));
  end;


end.
