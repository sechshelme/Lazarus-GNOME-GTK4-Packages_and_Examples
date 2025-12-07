unit fp_pciaccess;

interface

const
  {$IFDEF Linux}
  libpciaccess = 'libpciaccess';
  {$ENDIF}

  {$IFDEF Windows}
  libpciaccess = 'libpciaccess.dll'; // ????
  {$ENDIF}

type
  Tuint8_t = uint8;
  Tuint16_t = uint16;
  Tuint32_t = uint32;
  Tuint64_t = uint64;

  Puint8_t = PUInt8;
  Puint16_t = PUInt16;
  Puint32_t = PUInt32;
  Puint64_t = PUInt64;

  Tintptr_t = PtrInt;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Ppciaddr_t = ^Tpciaddr_t;
  Tpciaddr_t = Tuint64_t;

  Ppci_device_iterator = type Pointer;

  Tpci_mem_region = bitpacked record
    memory: pointer;
    bus_addr: Tpciaddr_t;
    base_addr: Tpciaddr_t;
    size: Tpciaddr_t;
    is_IO: 0..1;
    is_prefetchable: 0..1;
    is_64: 0..1;
  end;
  Ppci_mem_region = ^Tpci_mem_region;

  Tpci_device = record
    domain_16: Tuint16_t;
    bus: Tuint8_t;
    dev: Tuint8_t;
    func: Tuint8_t;
    vendor_id: Tuint16_t;
    device_id: Tuint16_t;
    subvendor_id: Tuint16_t;
    subdevice_id: Tuint16_t;
    device_class: Tuint32_t;
    revision: Tuint8_t;
    regions: array[0..5] of Tpci_mem_region;
    rom_size: Tpciaddr_t;
    irq: longint;
    user_data: Tintptr_t;
    vgaarb_rsrc: longint;
    domain: Tuint32_t;
  end;
  Ppci_device = ^Tpci_device;

  Tpci_agp_info = bitpacked record
    config_offset: dword;
    major_version: Tuint8_t;
    minor_version: Tuint8_t;
    rates: Tuint8_t;
    fast_writes: 0..1;
    addr64: 0..1;
    htrans: 0..1;
    gart64: 0..1;
    coherent: 0..1;
    sideband: 0..1;
    isochronus: 0..1;
    async_req_size: Tuint8_t;
    calibration_cycle_timing: Tuint8_t;
    max_requests: Tuint8_t;
  end;
  Ppci_agp_info = ^Tpci_agp_info;

  Tpci_bridge_info = record
    primary_bus: Tuint8_t;
    secondary_bus: Tuint8_t;
    subordinate_bus: Tuint8_t;
    secondary_latency_timer: Tuint8_t;
    io_type: Tuint8_t;
    mem_type: Tuint8_t;
    prefetch_mem_type: Tuint8_t;
    secondary_status: Tuint16_t;
    bridge_control: Tuint16_t;
    io_base: Tuint32_t;
    io_limit: Tuint32_t;
    mem_base: Tuint32_t;
    mem_limit: Tuint32_t;
    prefetch_mem_base: Tuint64_t;
    prefetch_mem_limit: Tuint64_t;
  end;
  Ppci_bridge_info = ^Tpci_bridge_info;

  Tpci_pcmcia_bridge_info = record
    primary_bus: Tuint8_t;
    card_bus: Tuint8_t;
    subordinate_bus: Tuint8_t;
    cardbus_latency_timer: Tuint8_t;
    secondary_status: Tuint16_t;
    bridge_control: Tuint16_t;
    io: array[0..1] of record
      base: Tuint32_t;
      limit: Tuint32_t;
      end;
    mem: array[0..1] of record
      base: Tuint32_t;
      limit: Tuint32_t;
      end;
  end;
  Ppci_pcmcia_bridge_info = ^Tpci_pcmcia_bridge_info;

  Tpci_id_match = record
    vendor_id: Tuint32_t;
    device_id: Tuint32_t;
    subvendor_id: Tuint32_t;
    subdevice_id: Tuint32_t;
    device_class: Tuint32_t;
    device_class_mask: Tuint32_t;
    match_data: Tintptr_t;
  end;
  Ppci_id_match = ^Tpci_id_match;

  Tpci_slot_match = record
    domain: Tuint32_t;
    bus: Tuint32_t;
    dev: Tuint32_t;
    func: Tuint32_t;
    match_data: Tintptr_t;
  end;
  Ppci_slot_match = ^Tpci_slot_match;


function pci_device_has_kernel_driver(dev: Ppci_device): longint; cdecl; external libpciaccess;
function pci_device_is_boot_vga(dev: Ppci_device): longint; cdecl; external libpciaccess;
function pci_device_read_rom(dev: Ppci_device; buffer: pointer): longint; cdecl; external libpciaccess;
function pci_device_map_region(dev: Ppci_device; region: dword; write_enable: longint): longint; cdecl; external libpciaccess; deprecated;
function pci_device_unmap_region(dev: Ppci_device; region: dword): longint; cdecl; external libpciaccess; deprecated;
function pci_device_map_range(dev: Ppci_device; base: Tpciaddr_t; size: Tpciaddr_t; map_flags: dword; addr: Ppointer): longint; cdecl; external libpciaccess;
function pci_device_unmap_range(dev: Ppci_device; memory: pointer; size: Tpciaddr_t): longint; cdecl; external libpciaccess;
function pci_device_map_memory_range(dev: Ppci_device; base: Tpciaddr_t; size: Tpciaddr_t; write_enable: longint; addr: Ppointer): longint; cdecl; external libpciaccess; deprecated;
function pci_device_unmap_memory_range(dev: Ppci_device; memory: pointer; size: Tpciaddr_t): longint; cdecl; external libpciaccess; deprecated;
function pci_device_probe(dev: Ppci_device): longint; cdecl; external libpciaccess;
function pci_device_get_agp_info(dev: Ppci_device): Ppci_agp_info; cdecl; external libpciaccess;
function pci_device_get_bridge_info(dev: Ppci_device): Ppci_bridge_info; cdecl; external libpciaccess;
function pci_device_get_pcmcia_bridge_info(dev: Ppci_device): Ppci_pcmcia_bridge_info; cdecl; external libpciaccess;
function pci_device_get_bridge_buses(dev: Ppci_device; primary_bus: Plongint; secondary_bus: Plongint; subordinate_bus: Plongint): longint; cdecl; external libpciaccess;
function pci_system_init: longint; cdecl; external libpciaccess;
procedure pci_system_init_dev_mem(fd: longint); cdecl; external libpciaccess;
procedure pci_system_cleanup; cdecl; external libpciaccess;
function pci_slot_match_iterator_create(match: Ppci_slot_match): Ppci_device_iterator; cdecl; external libpciaccess;
function pci_id_match_iterator_create(match: Ppci_id_match): Ppci_device_iterator; cdecl; external libpciaccess;
procedure pci_iterator_destroy(iter: Ppci_device_iterator); cdecl; external libpciaccess;
function pci_device_next(iter: Ppci_device_iterator): Ppci_device; cdecl; external libpciaccess;
function pci_device_find_by_slot(domain: Tuint32_t; bus: Tuint32_t; dev: Tuint32_t; func: Tuint32_t): Ppci_device; cdecl; external libpciaccess;
function pci_device_get_parent_bridge(dev: Ppci_device): Ppci_device; cdecl; external libpciaccess;
procedure pci_get_strings(m: Ppci_id_match; device_name: PPchar; vendor_name: PPchar; subdevice_name: PPchar; subvendor_name: PPchar); cdecl; external libpciaccess;
function pci_device_get_device_name(dev: Ppci_device): pchar; cdecl; external libpciaccess;
function pci_device_get_subdevice_name(dev: Ppci_device): pchar; cdecl; external libpciaccess;
function pci_device_get_vendor_name(dev: Ppci_device): pchar; cdecl; external libpciaccess;
function pci_device_get_subvendor_name(dev: Ppci_device): pchar; cdecl; external libpciaccess;
procedure pci_device_enable(dev: Ppci_device); cdecl; external libpciaccess;
procedure pci_device_disable(dev: Ppci_device); cdecl; external libpciaccess;
function pci_device_cfg_read(dev: Ppci_device; data: pointer; offset: Tpciaddr_t; size: Tpciaddr_t; bytes_read: Ppciaddr_t): longint; cdecl; external libpciaccess;
function pci_device_cfg_read_u8(dev: Ppci_device; data: Puint8_t; offset: Tpciaddr_t): longint; cdecl; external libpciaccess;
function pci_device_cfg_read_u16(dev: Ppci_device; data: Puint16_t; offset: Tpciaddr_t): longint; cdecl; external libpciaccess;
function pci_device_cfg_read_u32(dev: Ppci_device; data: Puint32_t; offset: Tpciaddr_t): longint; cdecl; external libpciaccess;
function pci_device_cfg_write(dev: Ppci_device; data: pointer; offset: Tpciaddr_t; size: Tpciaddr_t; bytes_written: Ppciaddr_t): longint; cdecl; external libpciaccess;
function pci_device_cfg_write_u8(dev: Ppci_device; data: Tuint8_t; offset: Tpciaddr_t): longint; cdecl; external libpciaccess;
function pci_device_cfg_write_u16(dev: Ppci_device; data: Tuint16_t; offset: Tpciaddr_t): longint; cdecl; external libpciaccess;
function pci_device_cfg_write_u32(dev: Ppci_device; data: Tuint32_t; offset: Tpciaddr_t): longint; cdecl; external libpciaccess;
function pci_device_cfg_write_bits(dev: Ppci_device; mask: Tuint32_t; data: Tuint32_t; offset: Tpciaddr_t): longint; cdecl; external libpciaccess;

const
  PCI_DEV_MAP_FLAG_WRITABLE = 1 shl 0;
  PCI_DEV_MAP_FLAG_WRITE_COMBINE = 1 shl 1;
  PCI_DEV_MAP_FLAG_CACHABLE = 1 shl 2;

  PCI_MATCH_ANY = not (0);

function PCI_ID_COMPARE(a, b: longint): boolean;

const
  VGA_ARB_RSRC_NONE = $00;
  VGA_ARB_RSRC_LEGACY_IO = $01;
  VGA_ARB_RSRC_LEGACY_MEM = $02;

  VGA_ARB_RSRC_NORMAL_IO = $04;
  VGA_ARB_RSRC_NORMAL_MEM = $08;

function pci_device_vgaarb_init: longint; cdecl; external libpciaccess;
procedure pci_device_vgaarb_fini; cdecl; external libpciaccess;
function pci_device_vgaarb_set_target(dev: Ppci_device): longint; cdecl; external libpciaccess;
function pci_device_vgaarb_decodes(new_vga_rsrc: longint): longint; cdecl; external libpciaccess;
function pci_device_vgaarb_lock: longint; cdecl; external libpciaccess;
function pci_device_vgaarb_trylock: longint; cdecl; external libpciaccess;
function pci_device_vgaarb_unlock: longint; cdecl; external libpciaccess;
function pci_device_vgaarb_get_info(dev: Ppci_device; vga_count: Plongint; rsrc_decodes: Plongint): longint; cdecl; external libpciaccess;

type
  Ppci_io_handle = type Pointer;

function pci_device_open_io(dev: Ppci_device; base: Tpciaddr_t; size: Tpciaddr_t): Ppci_io_handle; cdecl; external libpciaccess;
function pci_legacy_open_io(dev: Ppci_device; base: Tpciaddr_t; size: Tpciaddr_t): Ppci_io_handle; cdecl; external libpciaccess;
procedure pci_device_close_io(dev: Ppci_device; handle: Ppci_io_handle); cdecl; external libpciaccess;
function pci_io_read32(handle: Ppci_io_handle; reg: Tuint32_t): Tuint32_t; cdecl; external libpciaccess;
function pci_io_read16(handle: Ppci_io_handle; reg: Tuint32_t): Tuint16_t; cdecl; external libpciaccess;
function pci_io_read8(handle: Ppci_io_handle; reg: Tuint32_t): Tuint8_t; cdecl; external libpciaccess;
procedure pci_io_write32(handle: Ppci_io_handle; reg: Tuint32_t; data: Tuint32_t); cdecl; external libpciaccess;
procedure pci_io_write16(handle: Ppci_io_handle; reg: Tuint32_t; data: Tuint16_t); cdecl; external libpciaccess;
procedure pci_io_write8(handle: Ppci_io_handle; reg: Tuint32_t; data: Tuint8_t); cdecl; external libpciaccess;

function pci_device_map_legacy(dev: Ppci_device; base: Tpciaddr_t; size: Tpciaddr_t; map_flags: dword; addr: Ppointer): longint; cdecl; external libpciaccess;
function pci_device_unmap_legacy(dev: Ppci_device; addr: pointer; size: Tpciaddr_t): longint; cdecl; external libpciaccess;

// === Konventiert am: 28-6-25 17:39:06 ===


implementation


function PCI_ID_COMPARE(a, b: longint): boolean;
begin
  PCI_ID_COMPARE := (a = PCI_MATCH_ANY) or (a = b);
end;

end.
