
unit pciaccess;
interface

{
  Automatically converted by H2Pas 1.0.0 from pciaccess.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    pciaccess.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
Pchar  = ^char;
Plongint  = ^longint;
Ppci_agp_info  = ^pci_agp_info;
Ppci_bridge_info  = ^pci_bridge_info;
Ppci_device  = ^pci_device;
Ppci_device_iterator  = ^pci_device_iterator;
Ppci_id_match  = ^pci_id_match;
Ppci_io_handle  = ^pci_io_handle;
Ppci_mem_region  = ^pci_mem_region;
Ppci_pcmcia_bridge_info  = ^pci_pcmcia_bridge_info;
Ppci_slot_match  = ^pci_slot_match;
Ppciaddr_t  = ^pciaddr_t;
Puint16_t  = ^uint16_t;
Puint32_t  = ^uint32_t;
Puint8_t  = ^uint8_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * (C) Copyright IBM Corporation 2006
 * Copyright 2009 Red Hat, Inc.
 * All Rights Reserved.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation
 * on the rights to use, copy, modify, merge, publish, distribute, sub
 * license, and/or sell copies of the Software, and to permit persons to whom
 * the Software is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice (including the next
 * paragraph) shall be included in all copies or substantial portions of the
 * Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT.  IN NO EVENT SHALL
 * IBM AND/OR THEIR SUPPLIERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 * DEALINGS IN THE SOFTWARE.
  }
{
 * Copyright (c) 2007 Paulo R. Zanoni, Tiago Vignatti
 *
 * Permission is hereby granted, free of charge, to any person
 * obtaining a copy of this software and associated documentation
 * files (the "Software"), to deal in the Software without
 * restriction, including without limitation the rights to use,
 * copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following
 * conditions:
 *
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
 * OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
 * HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
 * WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
 * OTHER DEALINGS IN THE SOFTWARE.
 *
  }
{*
 * \file pciaccess.h
 *
 * \author Ian Romanick <idr@us.ibm.com>
  }
{$ifndef PCIACCESS_H}
{$define PCIACCESS_H}
{$include <inttypes.h>}
type
  Ppciaddr_t = ^Tpciaddr_t;
  Tpciaddr_t = Tuint64_t;
  Ppci_device = ^Tpci_device;
  Tpci_device = record
      {undefined structure}
    end;

  Ppci_device_iterator = ^Tpci_device_iterator;
  Tpci_device_iterator = record
      {undefined structure}
    end;

  Ppci_id_match = ^Tpci_id_match;
  Tpci_id_match = record
      {undefined structure}
    end;

  Ppci_slot_match = ^Tpci_slot_match;
  Tpci_slot_match = record
      {undefined structure}
    end;

{ C++ extern C conditionnal removed }

function pci_device_has_kernel_driver(dev:Ppci_device):longint;cdecl;external;
function pci_device_is_boot_vga(dev:Ppci_device):longint;cdecl;external;
function pci_device_read_rom(dev:Ppci_device; buffer:pointer):longint;cdecl;external;
{__deprecated }function pci_device_map_region(dev:Ppci_device; region:dword; write_enable:longint):longint;cdecl;external;
{__deprecated }function pci_device_unmap_region(dev:Ppci_device; region:dword):longint;cdecl;external;
function pci_device_map_range(dev:Ppci_device; base:Tpciaddr_t; size:Tpciaddr_t; map_flags:dword; addr:Ppointer):longint;cdecl;external;
function pci_device_unmap_range(dev:Ppci_device; memory:pointer; size:Tpciaddr_t):longint;cdecl;external;
{__deprecated }function pci_device_map_memory_range(dev:Ppci_device; base:Tpciaddr_t; size:Tpciaddr_t; write_enable:longint; addr:Ppointer):longint;cdecl;external;
{__deprecated }function pci_device_unmap_memory_range(dev:Ppci_device; memory:pointer; size:Tpciaddr_t):longint;cdecl;external;
function pci_device_probe(dev:Ppci_device):longint;cdecl;external;
(* Const before type ignored *)
function pci_device_get_agp_info(dev:Ppci_device):Ppci_agp_info;cdecl;external;
(* Const before type ignored *)
function pci_device_get_bridge_info(dev:Ppci_device):Ppci_bridge_info;cdecl;external;
(* Const before type ignored *)
function pci_device_get_pcmcia_bridge_info(dev:Ppci_device):Ppci_pcmcia_bridge_info;cdecl;external;
function pci_device_get_bridge_buses(dev:Ppci_device; primary_bus:Plongint; secondary_bus:Plongint; subordinate_bus:Plongint):longint;cdecl;external;
function pci_system_init:longint;cdecl;external;
procedure pci_system_init_dev_mem(fd:longint);cdecl;external;
procedure pci_system_cleanup;cdecl;external;
(* Const before type ignored *)
function pci_slot_match_iterator_create(match:Ppci_slot_match):Ppci_device_iterator;cdecl;external;
(* Const before type ignored *)
function pci_id_match_iterator_create(match:Ppci_id_match):Ppci_device_iterator;cdecl;external;
procedure pci_iterator_destroy(iter:Ppci_device_iterator);cdecl;external;
function pci_device_next(iter:Ppci_device_iterator):Ppci_device;cdecl;external;
function pci_device_find_by_slot(domain:Tuint32_t; bus:Tuint32_t; dev:Tuint32_t; func:Tuint32_t):Ppci_device;cdecl;external;
function pci_device_get_parent_bridge(dev:Ppci_device):Ppci_device;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure pci_get_strings(m:Ppci_id_match; device_name:PPchar; vendor_name:PPchar; subdevice_name:PPchar; subvendor_name:PPchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function pci_device_get_device_name(dev:Ppci_device):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function pci_device_get_subdevice_name(dev:Ppci_device):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function pci_device_get_vendor_name(dev:Ppci_device):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function pci_device_get_subvendor_name(dev:Ppci_device):Pchar;cdecl;external;
procedure pci_device_enable(dev:Ppci_device);cdecl;external;
procedure pci_device_disable(dev:Ppci_device);cdecl;external;
function pci_device_cfg_read(dev:Ppci_device; data:pointer; offset:Tpciaddr_t; size:Tpciaddr_t; bytes_read:Ppciaddr_t):longint;cdecl;external;
function pci_device_cfg_read_u8(dev:Ppci_device; data:Puint8_t; offset:Tpciaddr_t):longint;cdecl;external;
function pci_device_cfg_read_u16(dev:Ppci_device; data:Puint16_t; offset:Tpciaddr_t):longint;cdecl;external;
function pci_device_cfg_read_u32(dev:Ppci_device; data:Puint32_t; offset:Tpciaddr_t):longint;cdecl;external;
(* Const before type ignored *)
function pci_device_cfg_write(dev:Ppci_device; data:pointer; offset:Tpciaddr_t; size:Tpciaddr_t; bytes_written:Ppciaddr_t):longint;cdecl;external;
function pci_device_cfg_write_u8(dev:Ppci_device; data:Tuint8_t; offset:Tpciaddr_t):longint;cdecl;external;
function pci_device_cfg_write_u16(dev:Ppci_device; data:Tuint16_t; offset:Tpciaddr_t):longint;cdecl;external;
function pci_device_cfg_write_u32(dev:Ppci_device; data:Tuint32_t; offset:Tpciaddr_t):longint;cdecl;external;
function pci_device_cfg_write_bits(dev:Ppci_device; mask:Tuint32_t; data:Tuint32_t; offset:Tpciaddr_t):longint;cdecl;external;
{ C++ end of extern C conditionnal removed }
{*
 * \name Mapping flags passed to \c pci_device_map_range
  }
{@ }
const
  PCI_DEV_MAP_FLAG_WRITABLE = 1 shl 0;  
  PCI_DEV_MAP_FLAG_WRITE_COMBINE = 1 shl 1;  
  PCI_DEV_MAP_FLAG_CACHABLE = 1 shl 2;  
{@ }
  PCI_MATCH_ANY =  not (0);  
{*
 * Compare two PCI ID values (either vendor or device).  This is used
 * internally to compare the fields of \c pci_id_match to the fields of
 * \c pci_device.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function PCI_ID_COMPARE(a,b : longint) : longint;

{*
  }
{*
     * \name Device / vendor matching controls
     *
     * Control the search based on the device, vendor, subdevice, or subvendor
     * IDs.  Setting any of these fields to \c PCI_MATCH_ANY will cause the
     * field to not be used in the comparison.
      }
{@ }
{@ }
{*
     * \name Device class matching controls
     *
      }
{@ }
{@ }
type
  Ppci_id_match = ^Tpci_id_match;
  Tpci_id_match = record
      vendor_id : Tuint32_t;
      device_id : Tuint32_t;
      subvendor_id : Tuint32_t;
      subdevice_id : Tuint32_t;
      device_class : Tuint32_t;
      device_class_mask : Tuint32_t;
      match_data : Tintptr_t;
    end;

{*
  }
{*
     * \name Device slot matching controls
     *
     * Control the search based on the domain, bus, slot, and function of
     * the device.  Setting any of these fields to \c PCI_MATCH_ANY will cause
     * the field to not be used in the comparison.
      }
{@ }
{@ }
  Ppci_slot_match = ^Tpci_slot_match;
  Tpci_slot_match = record
      domain : Tuint32_t;
      bus : Tuint32_t;
      dev : Tuint32_t;
      func : Tuint32_t;
      match_data : Tintptr_t;
    end;

{*
 * BAR descriptor for a PCI device.
  }
{*
     * When the region is mapped, this is the pointer to the memory.
     *
     * This field is \b only set when the deprecated \c pci_device_map_region
     * interface is used.  Use \c pci_device_map_range instead.
     *
     * \deprecated
      }
{*
     * Base physical address of the region within its bus / domain.
     *
     * \warning
     * This address is really only useful to other devices in the same
     * domain.  It's probably \b not the address applications will ever
     * use.
     *
     * \warning
     * Most (all?) platform back-ends leave this field unset.
      }
{*
     * Base physical address of the region from the CPU's point of view.
     *
     * This address is typically passed to \c pci_device_map_range to create
     * a mapping of the region to the CPU's virtual address space.
      }
{*
     * Size, in bytes, of the region.
      }
{*
     * Is the region I/O ports or memory?
      }
{*
     * Is the memory region prefetchable?
     *
     * \note
     * This can only be set if \c is_IO is not set.
      }
{*
     * Is the memory at a 64-bit address?
     *
     * \note
     * This can only be set if \c is_IO is not set.
      }
  Ppci_mem_region = ^Tpci_mem_region;
  Tpci_mem_region = record
      memory : pointer;
      bus_addr : Tpciaddr_t;
      base_addr : Tpciaddr_t;
      size : Tpciaddr_t;
      flag0 : word;
    end;


const
  bm_Tpci_mem_region_is_IO = $1;
  bp_Tpci_mem_region_is_IO = 0;
  bm_Tpci_mem_region_is_prefetchable = $2;
  bp_Tpci_mem_region_is_prefetchable = 1;
  bm_Tpci_mem_region_is_64 = $4;
  bp_Tpci_mem_region_is_64 = 2;

function is_IO(var a : Tpci_mem_region) : dword;
procedure set_is_IO(var a : Tpci_mem_region; __is_IO : dword);
function is_prefetchable(var a : Tpci_mem_region) : dword;
procedure set_is_prefetchable(var a : Tpci_mem_region; __is_prefetchable : dword);
function is_64(var a : Tpci_mem_region) : dword;
procedure set_is_64(var a : Tpci_mem_region; __is_64 : dword);
{*
 * PCI device.
 *
 * Contains all of the information about a particular PCI device.
 *
 * This structure - like everything else in libpciaccess - is allocated
 * by the library itself. Do not embed this structure in other structs,
 * or otherwise allocate them yourself.
  }
{*
     * \name Device bus identification.
     *
     * Complete bus identification, including domain, of the device.  On
     * platforms that do not support PCI domains (e.g., 32-bit x86 hardware),
     * the domain will always be zero.
     *
     * The domain_16 field is provided for binary compatibility with older
     * libpciaccess.
      }
{@ }
{@ }
{*
     * \name Vendor / device ID
     *
     * The vendor ID, device ID, and sub-IDs for the device.
      }
{@ }
{@ }
{*
     * Device's class, subclass, and programming interface packed into a
     * single 32-bit value.  The class is at bits [23:16], subclass is at
     * bits [15:8], and programming interface is at [7:0].
      }
{*
     * Device revision number, as read from the configuration header.
      }
{*
     * BAR descriptors for the device.
      }
{*
     * Size, in bytes, of the device's expansion ROM.
      }
{*
     * IRQ associated with the device.  If there is no IRQ, this value will
     * be -1.
      }
{*
     * Storage for user data.  Users of the library can store arbitrary
     * data in this pointer.  The library will not use it for any purpose.
     * It is the user's responsibility to free this memory before destroying
     * the \c pci_device structure.
      }
{*
      * Used by the VGA arbiter. Type of resource decoded by the device and
      * the file descriptor (/dev/vga_arbiter).  }
{*
     * PCI domain value (full 32 bits)
      }
type
  Ppci_device = ^Tpci_device;
  Tpci_device = record
      domain_16 : Tuint16_t;
      bus : Tuint8_t;
      dev : Tuint8_t;
      func : Tuint8_t;
      vendor_id : Tuint16_t;
      device_id : Tuint16_t;
      subvendor_id : Tuint16_t;
      subdevice_id : Tuint16_t;
      device_class : Tuint32_t;
      revision : Tuint8_t;
      regions : array[0..5] of Tpci_mem_region;
      rom_size : Tpciaddr_t;
      irq : longint;
      user_data : Tintptr_t;
      vgaarb_rsrc : longint;
      domain : Tuint32_t;
    end;

{*
 * Description of the AGP capability of the device.
 *
 * \sa pci_device_get_agp_info
  }
{*
     * Offset of the AGP registers in the devices configuration register
     * space.  This is generally used so that the offset of the AGP command
     * register can be determined.
      }
{*
     * \name AGP major / minor version.
      }
{@ }
{@ }
{*
     * Logical OR of the supported AGP rates.  For example, a value of 0x07
     * means that the device can support 1x, 2x, and 4x.  A value of 0x0c
     * means that the device can support 8x and 4x.
      }
{*< Are fast-writes supported?  }
{*< Is side-band addressing supported?  }
  Ppci_agp_info = ^Tpci_agp_info;
  Tpci_agp_info = record
      config_offset : dword;
      major_version : Tuint8_t;
      minor_version : Tuint8_t;
      rates : Tuint8_t;
      flag0 : word;
      async_req_size : Tuint8_t;
      calibration_cycle_timing : Tuint8_t;
      max_requests : Tuint8_t;
    end;


const
  bm_Tpci_agp_info_fast_writes = $1;
  bp_Tpci_agp_info_fast_writes = 0;
  bm_Tpci_agp_info_addr64 = $2;
  bp_Tpci_agp_info_addr64 = 1;
  bm_Tpci_agp_info_htrans = $4;
  bp_Tpci_agp_info_htrans = 2;
  bm_Tpci_agp_info_gart64 = $8;
  bp_Tpci_agp_info_gart64 = 3;
  bm_Tpci_agp_info_coherent = $10;
  bp_Tpci_agp_info_coherent = 4;
  bm_Tpci_agp_info_sideband = $20;
  bp_Tpci_agp_info_sideband = 5;
  bm_Tpci_agp_info_isochronus = $40;
  bp_Tpci_agp_info_isochronus = 6;

function fast_writes(var a : Tpci_agp_info) : dword;
procedure set_fast_writes(var a : Tpci_agp_info; __fast_writes : dword);
function addr64(var a : Tpci_agp_info) : dword;
procedure set_addr64(var a : Tpci_agp_info; __addr64 : dword);
function htrans(var a : Tpci_agp_info) : dword;
procedure set_htrans(var a : Tpci_agp_info; __htrans : dword);
function gart64(var a : Tpci_agp_info) : dword;
procedure set_gart64(var a : Tpci_agp_info; __gart64 : dword);
function coherent(var a : Tpci_agp_info) : dword;
procedure set_coherent(var a : Tpci_agp_info; __coherent : dword);
function sideband(var a : Tpci_agp_info) : dword;
procedure set_sideband(var a : Tpci_agp_info; __sideband : dword);
function isochronus(var a : Tpci_agp_info) : dword;
procedure set_isochronus(var a : Tpci_agp_info; __isochronus : dword);
{*
 * Description of a PCI-to-PCI bridge device.
 *
 * \sa pci_device_get_bridge_info
  }
type
  Ppci_bridge_info = ^Tpci_bridge_info;
  Tpci_bridge_info = record
      primary_bus : Tuint8_t;
      secondary_bus : Tuint8_t;
      subordinate_bus : Tuint8_t;
      secondary_latency_timer : Tuint8_t;
      io_type : Tuint8_t;
      mem_type : Tuint8_t;
      prefetch_mem_type : Tuint8_t;
      secondary_status : Tuint16_t;
      bridge_control : Tuint16_t;
      io_base : Tuint32_t;
      io_limit : Tuint32_t;
      mem_base : Tuint32_t;
      mem_limit : Tuint32_t;
      prefetch_mem_base : Tuint64_t;
      prefetch_mem_limit : Tuint64_t;
    end;

{*
 * Description of a PCI-to-PCMCIA bridge device.
 *
 * \sa pci_device_get_pcmcia_bridge_info
  }
  Ppci_pcmcia_bridge_info = ^Tpci_pcmcia_bridge_info;
  Tpci_pcmcia_bridge_info = record
      primary_bus : Tuint8_t;
      card_bus : Tuint8_t;
      subordinate_bus : Tuint8_t;
      cardbus_latency_timer : Tuint8_t;
      secondary_status : Tuint16_t;
      bridge_control : Tuint16_t;
      io : array[0..1] of record
          base : Tuint32_t;
          limit : Tuint32_t;
        end;
      mem : array[0..1] of record
          base : Tuint32_t;
          limit : Tuint32_t;
        end;
    end;

{*
 * VGA Arbiter definitions, functions and related.
  }
{ Legacy VGA regions  }

const
  VGA_ARB_RSRC_NONE = $00;  
  VGA_ARB_RSRC_LEGACY_IO = $01;  
  VGA_ARB_RSRC_LEGACY_MEM = $02;  
{ Non-legacy access  }
  VGA_ARB_RSRC_NORMAL_IO = $04;  
  VGA_ARB_RSRC_NORMAL_MEM = $08;  

function pci_device_vgaarb_init:longint;cdecl;external;
procedure pci_device_vgaarb_fini;cdecl;external;
function pci_device_vgaarb_set_target(dev:Ppci_device):longint;cdecl;external;
{ use the targeted device  }
function pci_device_vgaarb_decodes(new_vga_rsrc:longint):longint;cdecl;external;
function pci_device_vgaarb_lock:longint;cdecl;external;
function pci_device_vgaarb_trylock:longint;cdecl;external;
function pci_device_vgaarb_unlock:longint;cdecl;external;
{ return the current device count + resource decodes for the device  }
function pci_device_vgaarb_get_info(dev:Ppci_device; vga_count:Plongint; rsrc_decodes:Plongint):longint;cdecl;external;
{
 * I/O space access.
  }
type
  Ppci_io_handle = ^Tpci_io_handle;
  Tpci_io_handle = record
      {undefined structure}
    end;


function pci_device_open_io(dev:Ppci_device; base:Tpciaddr_t; size:Tpciaddr_t):Ppci_io_handle;cdecl;external;
function pci_legacy_open_io(dev:Ppci_device; base:Tpciaddr_t; size:Tpciaddr_t):Ppci_io_handle;cdecl;external;
procedure pci_device_close_io(dev:Ppci_device; handle:Ppci_io_handle);cdecl;external;
function pci_io_read32(handle:Ppci_io_handle; reg:Tuint32_t):Tuint32_t;cdecl;external;
function pci_io_read16(handle:Ppci_io_handle; reg:Tuint32_t):Tuint16_t;cdecl;external;
function pci_io_read8(handle:Ppci_io_handle; reg:Tuint32_t):Tuint8_t;cdecl;external;
procedure pci_io_write32(handle:Ppci_io_handle; reg:Tuint32_t; data:Tuint32_t);cdecl;external;
procedure pci_io_write16(handle:Ppci_io_handle; reg:Tuint32_t; data:Tuint16_t);cdecl;external;
procedure pci_io_write8(handle:Ppci_io_handle; reg:Tuint32_t; data:Tuint8_t);cdecl;external;
{
 * Legacy memory access
  }
function pci_device_map_legacy(dev:Ppci_device; base:Tpciaddr_t; size:Tpciaddr_t; map_flags:dword; addr:Ppointer):longint;cdecl;external;
function pci_device_unmap_legacy(dev:Ppci_device; addr:pointer; size:Tpciaddr_t):longint;cdecl;external;
{$endif}
{ PCIACCESS_H  }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PCI_ID_COMPARE(a,b : longint) : longint;
begin
  PCI_ID_COMPARE:=(a=PCI_MATCH_ANY) or (a=b);
end;

function is_IO(var a : Tpci_mem_region) : dword;
begin
  is_IO:=(a.flag0 and bm_Tpci_mem_region_is_IO) shr bp_Tpci_mem_region_is_IO;
end;

procedure set_is_IO(var a : Tpci_mem_region; __is_IO : dword);
begin
  a.flag0:=a.flag0 or ((__is_IO shl bp_Tpci_mem_region_is_IO) and bm_Tpci_mem_region_is_IO);
end;

function is_prefetchable(var a : Tpci_mem_region) : dword;
begin
  is_prefetchable:=(a.flag0 and bm_Tpci_mem_region_is_prefetchable) shr bp_Tpci_mem_region_is_prefetchable;
end;

procedure set_is_prefetchable(var a : Tpci_mem_region; __is_prefetchable : dword);
begin
  a.flag0:=a.flag0 or ((__is_prefetchable shl bp_Tpci_mem_region_is_prefetchable) and bm_Tpci_mem_region_is_prefetchable);
end;

function is_64(var a : Tpci_mem_region) : dword;
begin
  is_64:=(a.flag0 and bm_Tpci_mem_region_is_64) shr bp_Tpci_mem_region_is_64;
end;

procedure set_is_64(var a : Tpci_mem_region; __is_64 : dword);
begin
  a.flag0:=a.flag0 or ((__is_64 shl bp_Tpci_mem_region_is_64) and bm_Tpci_mem_region_is_64);
end;

function fast_writes(var a : Tpci_agp_info) : dword;
begin
  fast_writes:=(a.flag0 and bm_Tpci_agp_info_fast_writes) shr bp_Tpci_agp_info_fast_writes;
end;

procedure set_fast_writes(var a : Tpci_agp_info; __fast_writes : dword);
begin
  a.flag0:=a.flag0 or ((__fast_writes shl bp_Tpci_agp_info_fast_writes) and bm_Tpci_agp_info_fast_writes);
end;

function addr64(var a : Tpci_agp_info) : dword;
begin
  addr64:=(a.flag0 and bm_Tpci_agp_info_addr64) shr bp_Tpci_agp_info_addr64;
end;

procedure set_addr64(var a : Tpci_agp_info; __addr64 : dword);
begin
  a.flag0:=a.flag0 or ((__addr64 shl bp_Tpci_agp_info_addr64) and bm_Tpci_agp_info_addr64);
end;

function htrans(var a : Tpci_agp_info) : dword;
begin
  htrans:=(a.flag0 and bm_Tpci_agp_info_htrans) shr bp_Tpci_agp_info_htrans;
end;

procedure set_htrans(var a : Tpci_agp_info; __htrans : dword);
begin
  a.flag0:=a.flag0 or ((__htrans shl bp_Tpci_agp_info_htrans) and bm_Tpci_agp_info_htrans);
end;

function gart64(var a : Tpci_agp_info) : dword;
begin
  gart64:=(a.flag0 and bm_Tpci_agp_info_gart64) shr bp_Tpci_agp_info_gart64;
end;

procedure set_gart64(var a : Tpci_agp_info; __gart64 : dword);
begin
  a.flag0:=a.flag0 or ((__gart64 shl bp_Tpci_agp_info_gart64) and bm_Tpci_agp_info_gart64);
end;

function coherent(var a : Tpci_agp_info) : dword;
begin
  coherent:=(a.flag0 and bm_Tpci_agp_info_coherent) shr bp_Tpci_agp_info_coherent;
end;

procedure set_coherent(var a : Tpci_agp_info; __coherent : dword);
begin
  a.flag0:=a.flag0 or ((__coherent shl bp_Tpci_agp_info_coherent) and bm_Tpci_agp_info_coherent);
end;

function sideband(var a : Tpci_agp_info) : dword;
begin
  sideband:=(a.flag0 and bm_Tpci_agp_info_sideband) shr bp_Tpci_agp_info_sideband;
end;

procedure set_sideband(var a : Tpci_agp_info; __sideband : dword);
begin
  a.flag0:=a.flag0 or ((__sideband shl bp_Tpci_agp_info_sideband) and bm_Tpci_agp_info_sideband);
end;

function isochronus(var a : Tpci_agp_info) : dword;
begin
  isochronus:=(a.flag0 and bm_Tpci_agp_info_isochronus) shr bp_Tpci_agp_info_isochronus;
end;

procedure set_isochronus(var a : Tpci_agp_info; __isochronus : dword);
begin
  a.flag0:=a.flag0 or ((__isochronus shl bp_Tpci_agp_info_isochronus) and bm_Tpci_agp_info_isochronus);
end;


end.
