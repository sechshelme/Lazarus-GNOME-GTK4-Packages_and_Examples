unit header;

interface

uses
  ctypes;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 *	The PCI Library -- PCI Header Structure (based on <linux/pci.h>)
 *
 *	Copyright (c) 1997--2010 Martin Mares <mj@ucw.cz>
 *
 *	Can be freely distributed and used under the terms of the GNU GPL.
  }
{
 * Under PCI, each device has 256 bytes of configuration address space,
 * of which the first 64 bytes are standardized as follows:
  }
{ 16 bits  }

const
  PCI_VENDOR_ID = $00;  
{ 16 bits  }
  PCI_DEVICE_ID = $02;  
{ 16 bits  }
  PCI_COMMAND = $04;  
{ Enable response in I/O space  }
  PCI_COMMAND_IO = $1;  
{ Enable response in Memory space  }
  PCI_COMMAND_MEMORY = $2;  
{ Enable bus mastering  }
  PCI_COMMAND_MASTER = $4;  
{ Enable response to special cycles  }
  PCI_COMMAND_SPECIAL = $8;  
{ Use memory write and invalidate  }
  PCI_COMMAND_INVALIDATE = $10;  
{ Enable palette snooping  }
  PCI_COMMAND_VGA_PALETTE = $20;  
{ Enable parity checking  }
  PCI_COMMAND_PARITY = $40;  
{ Enable address/data stepping  }
  PCI_COMMAND_WAIT = $80;  
{ Enable SERR  }
  PCI_COMMAND_SERR = $100;  
{ Enable back-to-back writes  }
  PCI_COMMAND_FAST_BACK = $200;  
{ PCIE: Disable INTx interrupts  }
  PCI_COMMAND_DISABLE_INTx = $400;  
{ 16 bits  }
  PCI_STATUS = $06;  
{ PCIE: INTx interrupt pending  }
  PCI_STATUS_INTx = $08;  
{ Support Capability List  }
  PCI_STATUS_CAP_LIST = $10;  
{ Support 66 Mhz PCI 2.1 bus  }
  PCI_STATUS_66MHZ = $20;  
{ Support User Definable Features [obsolete]  }
  PCI_STATUS_UDF = $40;  
{ Accept fast-back to back  }
  PCI_STATUS_FAST_BACK = $80;  
{ Detected parity error  }
  PCI_STATUS_PARITY = $100;  
{ DEVSEL timing  }
  PCI_STATUS_DEVSEL_MASK = $600;  
  PCI_STATUS_DEVSEL_FAST = $000;  
  PCI_STATUS_DEVSEL_MEDIUM = $200;  
  PCI_STATUS_DEVSEL_SLOW = $400;  
{ Set on target abort  }
  PCI_STATUS_SIG_TARGET_ABORT = $800;  
{ Master ack of "  }
  PCI_STATUS_REC_TARGET_ABORT = $1000;  
{ Set on master abort  }
  PCI_STATUS_REC_MASTER_ABORT = $2000;  
{ Set when we drive SERR  }
  PCI_STATUS_SIG_SYSTEM_ERROR = $4000;  
{ Set on parity error  }
  PCI_STATUS_DETECTED_PARITY = $8000;  
{ High 24 bits are class, low 8
					   revision  }
  PCI_CLASS_REVISION = $08;  
{ Revision ID  }
  PCI_REVISION_ID = $08;  
{ Reg. Level Programming Interface  }
  PCI_CLASS_PROG = $09;  
{ Device class  }
  PCI_CLASS_DEVICE = $0a;  
{ 8 bits  }
  PCI_CACHE_LINE_SIZE = $0c;  
{ 8 bits  }
  PCI_LATENCY_TIMER = $0d;  
{ 8 bits  }
  PCI_HEADER_TYPE = $0e;  
  PCI_HEADER_TYPE_NORMAL = 0;  
  PCI_HEADER_TYPE_BRIDGE = 1;  
  PCI_HEADER_TYPE_CARDBUS = 2;  
{ 8 bits  }
  PCI_BIST = $0f;  
{ Return result  }
  PCI_BIST_CODE_MASK = $0f;  
{ 1 to start BIST, 2 secs or less  }
  PCI_BIST_START = $40;  
{ 1 if BIST capable  }
  PCI_BIST_CAPABLE = $80;  
{
 * Base addresses specify locations in memory or I/O space.
 * Decoded size can be determined by writing a value of
 * 0xffffffff to the register, and reading it back.  Only
 * 1 bits are decoded.
  }
{ 32 bits  }
  PCI_BASE_ADDRESS_0 = $10;  
{ 32 bits [htype 0,1 only]  }
  PCI_BASE_ADDRESS_1 = $14;  
{ 32 bits [htype 0 only]  }
  PCI_BASE_ADDRESS_2 = $18;  
{ 32 bits  }
  PCI_BASE_ADDRESS_3 = $1c;  
{ 32 bits  }
  PCI_BASE_ADDRESS_4 = $20;  
{ 32 bits  }
  PCI_BASE_ADDRESS_5 = $24;  
{ 0 = memory, 1 = I/O  }
  PCI_BASE_ADDRESS_SPACE = $01;  
  PCI_BASE_ADDRESS_SPACE_IO = $01;  
  PCI_BASE_ADDRESS_SPACE_MEMORY = $00;  
  PCI_BASE_ADDRESS_MEM_TYPE_MASK = $06;  
{ 32 bit address  }
  PCI_BASE_ADDRESS_MEM_TYPE_32 = $00;  
{ Below 1M [obsolete]  }
  PCI_BASE_ADDRESS_MEM_TYPE_1M = $02;  
{ 64 bit address  }
  PCI_BASE_ADDRESS_MEM_TYPE_64 = $04;  
{ prefetchable?  }
  PCI_BASE_ADDRESS_MEM_PREFETCH = $08;  

{ was #define dname def_expr }
function PCI_BASE_ADDRESS_MEM_MASK : longint; { return type might be wrong }

{ was #define dname def_expr }
function PCI_BASE_ADDRESS_IO_MASK : longint; { return type might be wrong }

{ bit 1 is reserved if address_space = 1  }
{ Header type 0 (normal devices)  }
const
  PCI_CARDBUS_CIS = $28;  
  PCI_SUBSYSTEM_VENDOR_ID = $2c;  
  PCI_SUBSYSTEM_ID = $2e;  
{ Bits 31..11 are address, 10..1 reserved  }
  PCI_ROM_ADDRESS = $30;  
  PCI_ROM_ADDRESS_ENABLE = $01;  

{ was #define dname def_expr }
function PCI_ROM_ADDRESS_MASK : longint; { return type might be wrong }

{ Offset of first capability list entry  }
const
  PCI_CAPABILITY_LIST = $34;  
{ 0x35-0x3b are reserved  }
{ 8 bits  }
  PCI_INTERRUPT_LINE = $3c;  
{ 8 bits  }
  PCI_INTERRUPT_PIN = $3d;  
{ 8 bits  }
  PCI_MIN_GNT = $3e;  
{ 8 bits  }
  PCI_MAX_LAT = $3f;  
{ Header type 1 (PCI-to-PCI bridges)  }
{ Primary bus number  }
  PCI_PRIMARY_BUS = $18;  
{ Secondary bus number  }
  PCI_SECONDARY_BUS = $19;  
{ Highest bus number behind the bridge  }
  PCI_SUBORDINATE_BUS = $1a;  
{ Latency timer for secondary interface  }
  PCI_SEC_LATENCY_TIMER = $1b;  
{ I/O range behind the bridge  }
  PCI_IO_BASE = $1c;  
  PCI_IO_LIMIT = $1d;  
{ I/O bridging type  }
  PCI_IO_RANGE_TYPE_MASK = $0f;  
  PCI_IO_RANGE_TYPE_16 = $00;  
  PCI_IO_RANGE_TYPE_32 = $01;  
  PCI_IO_RANGE_MASK =  not ($0f);  
{ Secondary status register  }
  PCI_SEC_STATUS = $1e;  
{ Memory range behind  }
  PCI_MEMORY_BASE = $20;  
  PCI_MEMORY_LIMIT = $22;  
  PCI_MEMORY_RANGE_TYPE_MASK = $0f;  
  PCI_MEMORY_RANGE_MASK =  not ($0f);  
{ Prefetchable memory range behind  }
  PCI_PREF_MEMORY_BASE = $24;  
  PCI_PREF_MEMORY_LIMIT = $26;  
  PCI_PREF_RANGE_TYPE_MASK = $0f;  
  PCI_PREF_RANGE_TYPE_32 = $00;  
  PCI_PREF_RANGE_TYPE_64 = $01;  
  PCI_PREF_RANGE_MASK =  not ($0f);  
{ Upper half of prefetchable memory range  }
  PCI_PREF_BASE_UPPER32 = $28;  
  PCI_PREF_LIMIT_UPPER32 = $2c;  
{ Upper half of I/O addresses  }
  PCI_IO_BASE_UPPER16 = $30;  
  PCI_IO_LIMIT_UPPER16 = $32;  
{ 0x34 same as for htype 0  }
{ 0x35-0x3b is reserved  }
{ Same as PCI_ROM_ADDRESS, but for htype 1  }
  PCI_ROM_ADDRESS1 = $38;  
{ 0x3c-0x3d are same as for htype 0  }
  PCI_BRIDGE_CONTROL = $3e;  
{ Enable parity detection on secondary interface  }
  PCI_BRIDGE_CTL_PARITY = $01;  
{ The same for SERR forwarding  }
  PCI_BRIDGE_CTL_SERR = $02;  
{ Disable bridging of ISA ports  }
  PCI_BRIDGE_CTL_NO_ISA = $04;  
{ Forward VGA addresses  }
  PCI_BRIDGE_CTL_VGA = $08;  
{ VGA 16-bit decode  }
  PCI_BRIDGE_CTL_VGA_16BIT = $10;  
{ Report master aborts  }
  PCI_BRIDGE_CTL_MASTER_ABORT = $20;  
{ Secondary bus reset  }
  PCI_BRIDGE_CTL_BUS_RESET = $40;  
{ Fast Back2Back enabled on secondary interface  }
  PCI_BRIDGE_CTL_FAST_BACK = $80;  
{ PCI-X?  }
  PCI_BRIDGE_CTL_PRI_DISCARD_TIMER = $100;  
{ PCI-X?  }
  PCI_BRIDGE_CTL_SEC_DISCARD_TIMER = $200;  
{ PCI-X?  }
  PCI_BRIDGE_CTL_DISCARD_TIMER_STATUS = $400;  
{ PCI-X?  }
  PCI_BRIDGE_CTL_DISCARD_TIMER_SERR_EN = $800;  
{ Header type 2 (CardBus bridges)  }
  PCI_CB_CAPABILITY_LIST = $14;  
{ 0x15 reserved  }
{ Secondary status  }
  PCI_CB_SEC_STATUS = $16;  
{ PCI bus number  }
  PCI_CB_PRIMARY_BUS = $18;  
{ CardBus bus number  }
  PCI_CB_CARD_BUS = $19;  
{ Subordinate bus number  }
  PCI_CB_SUBORDINATE_BUS = $1a;  
{ CardBus latency timer  }
  PCI_CB_LATENCY_TIMER = $1b;  
  PCI_CB_MEMORY_BASE_0 = $1c;  
  PCI_CB_MEMORY_LIMIT_0 = $20;  
  PCI_CB_MEMORY_BASE_1 = $24;  
  PCI_CB_MEMORY_LIMIT_1 = $28;  
  PCI_CB_IO_BASE_0 = $2c;  
  PCI_CB_IO_BASE_0_HI = $2e;  
  PCI_CB_IO_LIMIT_0 = $30;  
  PCI_CB_IO_LIMIT_0_HI = $32;  
  PCI_CB_IO_BASE_1 = $34;  
  PCI_CB_IO_BASE_1_HI = $36;  
  PCI_CB_IO_LIMIT_1 = $38;  
  PCI_CB_IO_LIMIT_1_HI = $3a;  
  PCI_CB_IO_RANGE_MASK =  not ($03);  
{ 0x3c-0x3d are same as for htype 0  }
  PCI_CB_BRIDGE_CONTROL = $3e;  
{ Similar to standard bridge control register  }
  PCI_CB_BRIDGE_CTL_PARITY = $01;  
  PCI_CB_BRIDGE_CTL_SERR = $02;  
  PCI_CB_BRIDGE_CTL_ISA = $04;  
  PCI_CB_BRIDGE_CTL_VGA = $08;  
  PCI_CB_BRIDGE_CTL_MASTER_ABORT = $20;  
{ CardBus reset  }
  PCI_CB_BRIDGE_CTL_CB_RESET = $40;  
{ Enable interrupt for 16-bit cards  }
  PCI_CB_BRIDGE_CTL_16BIT_INT = $80;  
{ Prefetch enable for both memory regions  }
  PCI_CB_BRIDGE_CTL_PREFETCH_MEM0 = $100;  
  PCI_CB_BRIDGE_CTL_PREFETCH_MEM1 = $200;  
  PCI_CB_BRIDGE_CTL_POST_WRITES = $400;  
  PCI_CB_SUBSYSTEM_VENDOR_ID = $40;  
  PCI_CB_SUBSYSTEM_ID = $42;  
{ 16-bit PC Card legacy mode base address (ExCa)  }
  PCI_CB_LEGACY_MODE_BASE = $44;  
{ 0x48-0x7f reserved  }
{ Capability lists  }
{ Capability ID  }
  PCI_CAP_LIST_ID = 0;  
{ Null Capability  }
  PCI_CAP_ID_NULL = $00;  
{ Power Management  }
  PCI_CAP_ID_PM = $01;  
{ Accelerated Graphics Port  }
  PCI_CAP_ID_AGP = $02;  
{ Vital Product Data  }
  PCI_CAP_ID_VPD = $03;  
{ Slot Identification  }
  PCI_CAP_ID_SLOTID = $04;  
{ Message Signaled Interrupts  }
  PCI_CAP_ID_MSI = $05;  
{ CompactPCI HotSwap  }
  PCI_CAP_ID_CHSWP = $06;  
{ PCI-X  }
  PCI_CAP_ID_PCIX = $07;  
{ HyperTransport  }
  PCI_CAP_ID_HT = $08;  
{ Vendor specific  }
  PCI_CAP_ID_VNDR = $09;  
{ Debug port  }
  PCI_CAP_ID_DBG = $0A;  
{ CompactPCI Central Resource Control  }
  PCI_CAP_ID_CCRC = $0B;  
{ PCI hot-plug  }
  PCI_CAP_ID_HOTPLUG = $0C;  
{ Bridge subsystem vendor/device ID  }
  PCI_CAP_ID_SSVID = $0D;  
{ AGP 8x  }
  PCI_CAP_ID_AGP3 = $0E;  
{ Secure device (?)  }
  PCI_CAP_ID_SECURE = $0F;  
{ PCI Express  }
  PCI_CAP_ID_EXP = $10;  
{ MSI-X  }
  PCI_CAP_ID_MSIX = $11;  
{ Serial-ATA HBA  }
  PCI_CAP_ID_SATA = $12;  
{ Advanced features of PCI devices integrated in PCIe root cplx  }
  PCI_CAP_ID_AF = $13;  
{ Enhanced Allocation  }
  PCI_CAP_ID_EA = $14;  
{ Next capability in the list  }
  PCI_CAP_LIST_NEXT = 1;  
{ Capability defined flags (16 bits)  }
  PCI_CAP_FLAGS = 2;  
  PCI_CAP_SIZEOF = 4;  
{ Capabilities residing in the PCI Express extended configuration space  }
{ Null Capability  }
  PCI_EXT_CAP_ID_NULL = $00;  
{ Advanced Error Reporting  }
  PCI_EXT_CAP_ID_AER = $01;  
{ Virtual Channel  }
  PCI_EXT_CAP_ID_VC = $02;  
{ Device Serial Number  }
  PCI_EXT_CAP_ID_DSN = $03;  
{ Power Budgeting  }
  PCI_EXT_CAP_ID_PB = $04;  
{ Root Complex Link Declaration  }
  PCI_EXT_CAP_ID_RCLINK = $05;  
{ Root Complex Internal Link Declaration  }
  PCI_EXT_CAP_ID_RCILINK = $06;  
{ Root Complex Event Collector  }
  PCI_EXT_CAP_ID_RCEC = $07;  
{ Multi-Function Virtual Channel  }
  PCI_EXT_CAP_ID_MFVC = $08;  
{ Virtual Channel (2nd ID)  }
  PCI_EXT_CAP_ID_VC2 = $09;  
{ Root Complex Register Block  }
  PCI_EXT_CAP_ID_RCRB = $0a;  
{ Vendor specific  }
  PCI_EXT_CAP_ID_VNDR = $0b;  
{ Access Controls  }
  PCI_EXT_CAP_ID_ACS = $0d;  
{ Alternative Routing-ID Interpretation  }
  PCI_EXT_CAP_ID_ARI = $0e;  
{ Address Translation Service  }
  PCI_EXT_CAP_ID_ATS = $0f;  
{ Single Root I/O Virtualization  }
  PCI_EXT_CAP_ID_SRIOV = $10;  
{ Multi-Root I/O Virtualization  }
  PCI_EXT_CAP_ID_MRIOV = $11;  
{ Multicast  }
  PCI_EXT_CAP_ID_MCAST = $12;  
{ Page Request Interface  }
  PCI_EXT_CAP_ID_PRI = $13;  
{ Resizable BAR  }
  PCI_EXT_CAP_ID_REBAR = $15;  
{ Dynamic Power Allocation  }
  PCI_EXT_CAP_ID_DPA = $16;  
{ Transaction processing hints  }
  PCI_EXT_CAP_ID_TPH = $17;  
{ Latency Tolerance Reporting  }
  PCI_EXT_CAP_ID_LTR = $18;  
{ Secondary PCI Express  }
  PCI_EXT_CAP_ID_SECPCI = $19;  
{ Protocol Multiplexing  }
  PCI_EXT_CAP_ID_PMUX = $1a;  
{ Process Address Space ID  }
  PCI_EXT_CAP_ID_PASID = $1b;  
{ LN Requester  }
  PCI_EXT_CAP_ID_LNR = $1c;  
{ Downstream Port Containment  }
  PCI_EXT_CAP_ID_DPC = $1d;  
{ L1 PM Substates  }
  PCI_EXT_CAP_ID_L1PM = $1e;  
{ Precision Time Measurement  }
  PCI_EXT_CAP_ID_PTM = $1f;  
{ PCIe over M-PHY  }
  PCI_EXT_CAP_ID_M_PCIE = $20;  
{ FRS Queuing  }
  PCI_EXT_CAP_ID_FRS = $21;  
{ Readiness Time Reporting  }
  PCI_EXT_CAP_ID_RTR = $22;  
{ Designated Vendor-Specific  }
  PCI_EXT_CAP_ID_DVSEC = $23;  
{ VF Resizable BAR  }
  PCI_EXT_CAP_ID_VF_REBAR = $24;  
{ Data Link Feature  }
  PCI_EXT_CAP_ID_DLNK = $25;  
{ Physical Layer 16.0 GT/s  }
  PCI_EXT_CAP_ID_16GT = $26;  
{ Lane Margining at Receiver  }
  PCI_EXT_CAP_ID_LMR = $27;  
{ Hierarchy ID  }
  PCI_EXT_CAP_ID_HIER_ID = $28;  
{ Native PCIe Enclosure Management  }
  PCI_EXT_CAP_ID_NPEM = $29;  
{ Data Object Exchange  }
  PCI_EXT_CAP_ID_DOE = $2e;  
{** Definitions of capabilities ** }
{ Power Management Registers  }
{ Version (2=PM1.1)  }
  PCI_PM_CAP_VER_MASK = $0007;  
{ Clock required for PME generation  }
  PCI_PM_CAP_PME_CLOCK = $0008;  
{ Device specific initialization required  }
  PCI_PM_CAP_DSI = $0020;  
{ Maximum aux current required in D3cold  }
  PCI_PM_CAP_AUX_C_MASK = $01c0;  
{ D1 power state support  }
  PCI_PM_CAP_D1 = $0200;  
{ D2 power state support  }
  PCI_PM_CAP_D2 = $0400;  
{ PME can be asserted from D0  }
  PCI_PM_CAP_PME_D0 = $0800;  
{ PME can be asserted from D1  }
  PCI_PM_CAP_PME_D1 = $1000;  
{ PME can be asserted from D2  }
  PCI_PM_CAP_PME_D2 = $2000;  
{ PME can be asserted from D3hot  }
  PCI_PM_CAP_PME_D3_HOT = $4000;  
{ PME can be asserted from D3cold  }
  PCI_PM_CAP_PME_D3_COLD = $8000;  
{ PM control and status register  }
  PCI_PM_CTRL = 4;  
{ Current power state (D0 to D3)  }
  PCI_PM_CTRL_STATE_MASK = $0003;  
{ No Soft Reset from D3hot to D0  }
  PCI_PM_CTRL_NO_SOFT_RST = $0008;  
{ PME pin enable  }
  PCI_PM_CTRL_PME_ENABLE = $0100;  
{ PM table data index  }
  PCI_PM_CTRL_DATA_SEL_MASK = $1e00;  
{ PM table data scaling factor  }
  PCI_PM_CTRL_DATA_SCALE_MASK = $6000;  
{ PME pin status  }
  PCI_PM_CTRL_PME_STATUS = $8000;  
{ PPB support extensions  }
  PCI_PM_PPB_EXTENSIONS = 6;  
{ If bridge enters D3hot, bus enters: 0=B3, 1=B2  }
  PCI_PM_PPB_B2_B3 = $40;  
{ Secondary bus is power managed  }
  PCI_PM_BPCC_ENABLE = $80;  
{ PM table contents read here  }
  PCI_PM_DATA_REGISTER = 7;  
  PCI_PM_SIZEOF = 8;  
{ AGP registers  }
{ BCD version number  }
  PCI_AGP_VERSION = 2;  
{ Rest of capability flags  }
  PCI_AGP_RFU = 3;  
{ Status register  }
  PCI_AGP_STATUS = 4;  
{ Maximum number of requests - 1  }
  PCI_AGP_STATUS_RQ_MASK = $ff000000;  
{ Isochronous transactions supported  }
  PCI_AGP_STATUS_ISOCH = $10000;  
{ log2(optimum async req size in bytes) - 4  }
  PCI_AGP_STATUS_ARQSZ_MASK = $e000;  
{ Calibration cycle timing  }
  PCI_AGP_STATUS_CAL_MASK = $1c00;  
{ Sideband addressing supported  }
  PCI_AGP_STATUS_SBA = $0200;  
{ In-aperture accesses always coherent  }
  PCI_AGP_STATUS_ITA_COH = $0100;  
{ 64-bit GART entries supported  }
  PCI_AGP_STATUS_GART64 = $0080;  
{ If 0, core logic can xlate host CPU accesses thru aperture  }
  PCI_AGP_STATUS_HTRANS = $0040;  
{ 64-bit addressing cycles supported  }
  PCI_AGP_STATUS_64BIT = $0020;  
{ Fast write transfers supported  }
  PCI_AGP_STATUS_FW = $0010;  
{ AGP3 mode supported  }
  PCI_AGP_STATUS_AGP3 = $0008;  
{ 4x transfer rate supported (RFU in AGP3 mode)  }
  PCI_AGP_STATUS_RATE4 = $0004;  
{ 2x transfer rate supported (8x in AGP3 mode)  }
  PCI_AGP_STATUS_RATE2 = $0002;  
{ 1x transfer rate supported (4x in AGP3 mode)  }
  PCI_AGP_STATUS_RATE1 = $0001;  
{ Control register  }
  PCI_AGP_COMMAND = 8;  
{ Master: Maximum number of requests  }
  PCI_AGP_COMMAND_RQ_MASK = $ff000000;  
{ log2(optimum async req size in bytes) - 4  }
  PCI_AGP_COMMAND_ARQSZ_MASK = $e000;  
{ Calibration cycle timing  }
  PCI_AGP_COMMAND_CAL_MASK = $1c00;  
{ Sideband addressing enabled  }
  PCI_AGP_COMMAND_SBA = $0200;  
{ Allow processing of AGP transactions  }
  PCI_AGP_COMMAND_AGP = $0100;  
{ 64-bit GART entries enabled  }
  PCI_AGP_COMMAND_GART64 = $0080;  
{ Allow generation of 64-bit addr cycles  }
  PCI_AGP_COMMAND_64BIT = $0020;  
{ Enable FW transfers  }
  PCI_AGP_COMMAND_FW = $0010;  
{ Use 4x rate (RFU in AGP3 mode)  }
  PCI_AGP_COMMAND_RATE4 = $0004;  
{ Use 2x rate (8x in AGP3 mode)  }
  PCI_AGP_COMMAND_RATE2 = $0002;  
{ Use 1x rate (4x in AGP3 mode)  }
  PCI_AGP_COMMAND_RATE1 = $0001;  
  PCI_AGP_SIZEOF = 12;  
{ Vital Product Data  }
{ Address to access (15 bits!)  }
  PCI_VPD_ADDR = 2;  
{ Address mask  }
  PCI_VPD_ADDR_MASK = $7fff;  
{ Write 0, 1 indicates completion  }
  PCI_VPD_ADDR_F = $8000;  
{ 32-bits of data returned here  }
  PCI_VPD_DATA = 4;  
{ Slot Identification  }
{ Expansion Slot Register  }
  PCI_SID_ESR = 2;  
{ Number of expansion slots available  }
  PCI_SID_ESR_NSLOTS = $1f;  
{ First In Chassis Flag  }
  PCI_SID_ESR_FIC = $20;  
{ Chassis Number  }
  PCI_SID_CHASSIS_NR = 3;  
{ Message Signaled Interrupts registers  }
{ Various flags  }
  PCI_MSI_FLAGS = 2;  
{ interrupt masking & reporting supported  }
  PCI_MSI_FLAGS_MASK_BIT = $100;  
{ 64-bit addresses allowed  }
  PCI_MSI_FLAGS_64BIT = $080;  
{ Message queue size configured  }
  PCI_MSI_FLAGS_QSIZE = $070;  
{ Maximum queue size available  }
  PCI_MSI_FLAGS_QMASK = $00e;  
{ MSI feature enabled  }
  PCI_MSI_FLAGS_ENABLE = $001;  
{ Rest of capability flags  }
  PCI_MSI_RFU = 3;  
{ Lower 32 bits  }
  PCI_MSI_ADDRESS_LO = 4;  
{ Upper 32 bits (if PCI_MSI_FLAGS_64BIT set)  }
  PCI_MSI_ADDRESS_HI = 8;  
{ 16 bits of data for 32-bit devices  }
  PCI_MSI_DATA_32 = 8;  
{ 16 bits of data for 64-bit devices  }
  PCI_MSI_DATA_64 = 12;  
{ per-vector masking for 32-bit devices  }
  PCI_MSI_MASK_BIT_32 = 12;  
{ per-vector masking for 64-bit devices  }
  PCI_MSI_MASK_BIT_64 = 16;  
{ per-vector interrupt pending for 32-bit devices  }
  PCI_MSI_PENDING_32 = 16;  
{ per-vector interrupt pending for 64-bit devices  }
  PCI_MSI_PENDING_64 = 20;  
{ PCI-X  }
{ Command register offset  }
  PCI_PCIX_COMMAND = 2;  
{ Data Parity Error Recover Enable  }
  PCI_PCIX_COMMAND_DPERE = $0001;  
{ Enable Relaxed Ordering  }
  PCI_PCIX_COMMAND_ERO = $0002;  
{ Maximum Memory Read Byte Count  }
  PCI_PCIX_COMMAND_MAX_MEM_READ_BYTE_COUNT = $000c;  
  PCI_PCIX_COMMAND_MAX_OUTSTANDING_SPLIT_TRANS = $0070;  
  PCI_PCIX_COMMAND_RESERVED = $f80;  
{ Status register offset  }
  PCI_PCIX_STATUS = 4;  
  PCI_PCIX_STATUS_FUNCTION = $00000007;  
  PCI_PCIX_STATUS_DEVICE = $000000f8;  
  PCI_PCIX_STATUS_BUS = $0000ff00;  
  PCI_PCIX_STATUS_64BIT = $00010000;  
  PCI_PCIX_STATUS_133MHZ = $00020000;  
{ Split Completion Discarded  }
  PCI_PCIX_STATUS_SC_DISCARDED = $00040000;  
{ Unexpected Split Completion  }
  PCI_PCIX_STATUS_UNEXPECTED_SC = $00080000;  
{ 0 = simple device, 1 = bridge device  }
  PCI_PCIX_STATUS_DEVICE_COMPLEXITY = $00100000;  
{ 0 = 512 bytes, 1 = 1024, 2 = 2048, 3 = 4096  }
  PCI_PCIX_STATUS_DESIGNED_MAX_MEM_READ_BYTE_COUNT = $00600000;  
  PCI_PCIX_STATUS_DESIGNED_MAX_OUTSTANDING_SPLIT_TRANS = $03800000;  
  PCI_PCIX_STATUS_DESIGNED_MAX_CUMULATIVE_READ_SIZE = $1c000000;  
{ Received Split Completion Error Message  }
  PCI_PCIX_STATUS_RCVD_SC_ERR_MESS = $20000000;  
{ 266 MHz capable  }
  PCI_PCIX_STATUS_266MHZ = $40000000;  
{ 533 MHz capable  }
  PCI_PCIX_STATUS_533MHZ = $80000000;  
  PCI_PCIX_SIZEOF = 4;  
{ PCI-X Bridges  }
{ Secondary bus status register offset  }
  PCI_PCIX_BRIDGE_SEC_STATUS = 2;  
  PCI_PCIX_BRIDGE_SEC_STATUS_64BIT = $0001;  
  PCI_PCIX_BRIDGE_SEC_STATUS_133MHZ = $0002;  
{ Split Completion Discarded on secondary bus  }
  PCI_PCIX_BRIDGE_SEC_STATUS_SC_DISCARDED = $0004;  
{ Unexpected Split Completion on secondary bus  }
  PCI_PCIX_BRIDGE_SEC_STATUS_UNEXPECTED_SC = $0008;  
{ Split Completion Overrun on secondary bus  }
  PCI_PCIX_BRIDGE_SEC_STATUS_SC_OVERRUN = $0010;  
  PCI_PCIX_BRIDGE_SEC_STATUS_SPLIT_REQUEST_DELAYED = $0020;  
  PCI_PCIX_BRIDGE_SEC_STATUS_CLOCK_FREQ = $01c0;  
  PCI_PCIX_BRIDGE_SEC_STATUS_RESERVED = $fe00;  
{ Primary bus status register offset  }
  PCI_PCIX_BRIDGE_STATUS = 4;  
  PCI_PCIX_BRIDGE_STATUS_FUNCTION = $00000007;  
  PCI_PCIX_BRIDGE_STATUS_DEVICE = $000000f8;  
  PCI_PCIX_BRIDGE_STATUS_BUS = $0000ff00;  
  PCI_PCIX_BRIDGE_STATUS_64BIT = $00010000;  
  PCI_PCIX_BRIDGE_STATUS_133MHZ = $00020000;  
{ Split Completion Discarded  }
  PCI_PCIX_BRIDGE_STATUS_SC_DISCARDED = $00040000;  
{ Unexpected Split Completion  }
  PCI_PCIX_BRIDGE_STATUS_UNEXPECTED_SC = $00080000;  
{ Split Completion Overrun  }
  PCI_PCIX_BRIDGE_STATUS_SC_OVERRUN = $00100000;  
  PCI_PCIX_BRIDGE_STATUS_SPLIT_REQUEST_DELAYED = $00200000;  
  PCI_PCIX_BRIDGE_STATUS_RESERVED = $ffc00000;  
{ Upstream Split Transaction Register offset  }
  PCI_PCIX_BRIDGE_UPSTREAM_SPLIT_TRANS_CTRL = 8;  
{ Downstream Split Transaction Register offset  }
  PCI_PCIX_BRIDGE_DOWNSTREAM_SPLIT_TRANS_CTRL = 12;  
  PCI_PCIX_BRIDGE_STR_CAPACITY = $0000ffff;  
  PCI_PCIX_BRIDGE_STR_COMMITMENT_LIMIT = $ffff0000;  
  PCI_PCIX_BRIDGE_SIZEOF = 12;  
{ HyperTransport (as of spec rev. 2.00)  }
{ Command Register  }
  PCI_HT_CMD = 2;  
{ Capability Type high part  }
  PCI_HT_CMD_TYP_HI = $e000;  
{ Slave or Primary Interface  }
  PCI_HT_CMD_TYP_HI_PRI = $0000;  
{ Host or Secondary Interface  }
  PCI_HT_CMD_TYP_HI_SEC = $2000;  
{ Capability Type  }
  PCI_HT_CMD_TYP = $f800;  
{ Switch  }
  PCI_HT_CMD_TYP_SW = $4000;  
{ Interrupt Discovery and Configuration  }
  PCI_HT_CMD_TYP_IDC = $8000;  
{ Revision ID  }
  PCI_HT_CMD_TYP_RID = $8800;  
{ UnitID Clumping  }
  PCI_HT_CMD_TYP_UIDC = $9000;  
{ Extended Configuration Space Access  }
  PCI_HT_CMD_TYP_ECSA = $9800;  
{ Address Mapping  }
  PCI_HT_CMD_TYP_AM = $a000;  
{ MSI Mapping  }
  PCI_HT_CMD_TYP_MSIM = $a800;  
{ DirectRoute  }
  PCI_HT_CMD_TYP_DR = $b000;  
{ VCSet  }
  PCI_HT_CMD_TYP_VCS = $b800;  
{ Retry Mode  }
  PCI_HT_CMD_TYP_RM = $c000;  
{ X86 (reserved)  }
  PCI_HT_CMD_TYP_X86 = $c800;  
{ Link Control Register  }
{ CRC Flood Enable  }
  PCI_HT_LCTR_CFLE = $0002;  
{ CRC Start Test  }
  PCI_HT_LCTR_CST = $0004;  
{ CRC Force Error  }
  PCI_HT_LCTR_CFE = $0008;  
{ Link Failure  }
  PCI_HT_LCTR_LKFAIL = $0010;  
{ Initialization Complete  }
  PCI_HT_LCTR_INIT = $0020;  
{ End of Chain  }
  PCI_HT_LCTR_EOC = $0040;  
{ Transmitter Off  }
  PCI_HT_LCTR_TXO = $0080;  
{ CRC Error  }
  PCI_HT_LCTR_CRCERR = $0f00;  
{ Isochronous Flow Control Enable  }
  PCI_HT_LCTR_ISOCEN = $1000;  
{ LDTSTOP# Tristate Enable  }
  PCI_HT_LCTR_LSEN = $2000;  
{ Extended CTL Time  }
  PCI_HT_LCTR_EXTCTL = $4000;  
{ 64-bit Addressing Enable  }
  PCI_HT_LCTR_64B = $8000;  
{ Link Configuration Register  }
{ Max Link Width In  }
  PCI_HT_LCNF_MLWI = $0007;  
{ Link Width 8 bits  }
  PCI_HT_LCNF_LW_8B = $0;  
{ Link Width 16 bits  }
  PCI_HT_LCNF_LW_16B = $1;  
{ Link Width 32 bits  }
  PCI_HT_LCNF_LW_32B = $3;  
{ Link Width 2 bits  }
  PCI_HT_LCNF_LW_2B = $4;  
{ Link Width 4 bits  }
  PCI_HT_LCNF_LW_4B = $5;  
{ Link physically not connected  }
  PCI_HT_LCNF_LW_NC = $7;  
{ Doubleword Flow Control In  }
  PCI_HT_LCNF_DFI = $0008;  
{ Max Link Width Out  }
  PCI_HT_LCNF_MLWO = $0070;  
{ Doubleword Flow Control Out  }
  PCI_HT_LCNF_DFO = $0080;  
{ Link Width In  }
  PCI_HT_LCNF_LWI = $0700;  
{ Doubleword Flow Control In Enable  }
  PCI_HT_LCNF_DFIE = $0800;  
{ Link Width Out  }
  PCI_HT_LCNF_LWO = $7000;  
{ Doubleword Flow Control Out Enable  }
  PCI_HT_LCNF_DFOE = $8000;  
{ Revision ID Register  }
{ Minor Revision  }
  PCI_HT_RID_MIN = $1f;  
{ Major Revision  }
  PCI_HT_RID_MAJ = $e0;  
{ Link Frequency/Error Register  }
{ Transmitter Clock Frequency  }
  PCI_HT_LFRER_FREQ = $0f;  
{ 200MHz  }
  PCI_HT_LFRER_200 = $00;  
{ 300MHz  }
  PCI_HT_LFRER_300 = $01;  
{ 400MHz  }
  PCI_HT_LFRER_400 = $02;  
{ 500MHz  }
  PCI_HT_LFRER_500 = $03;  
{ 600MHz  }
  PCI_HT_LFRER_600 = $04;  
{ 800MHz  }
  PCI_HT_LFRER_800 = $05;  
{ 1.0GHz  }
  PCI_HT_LFRER_1000 = $06;  
{ 1.2GHz  }
  PCI_HT_LFRER_1200 = $07;  
{ 1.4GHz  }
  PCI_HT_LFRER_1400 = $08;  
{ 1.6GHz  }
  PCI_HT_LFRER_1600 = $09;  
{ Vendor-Specific  }
  PCI_HT_LFRER_VEND = $0f;  
{ Link Error  }
  PCI_HT_LFRER_ERR = $f0;  
{ Protocol Error  }
  PCI_HT_LFRER_PROT = $10;  
{ Overflow Error  }
  PCI_HT_LFRER_OV = $20;  
{ End of Chain Error  }
  PCI_HT_LFRER_EOC = $40;  
{ CTL Timeout  }
  PCI_HT_LFRER_CTLT = $80;  
{ Link Frequency Capability Register  }
{ 200MHz  }
  PCI_HT_LFCAP_200 = $0001;  
{ 300MHz  }
  PCI_HT_LFCAP_300 = $0002;  
{ 400MHz  }
  PCI_HT_LFCAP_400 = $0004;  
{ 500MHz  }
  PCI_HT_LFCAP_500 = $0008;  
{ 600MHz  }
  PCI_HT_LFCAP_600 = $0010;  
{ 800MHz  }
  PCI_HT_LFCAP_800 = $0020;  
{ 1.0GHz  }
  PCI_HT_LFCAP_1000 = $0040;  
{ 1.2GHz  }
  PCI_HT_LFCAP_1200 = $0080;  
{ 1.4GHz  }
  PCI_HT_LFCAP_1400 = $0100;  
{ 1.6GHz  }
  PCI_HT_LFCAP_1600 = $0200;  
{ Vendor-Specific  }
  PCI_HT_LFCAP_VEND = $8000;  
{ Feature Register  }
{ Isochronous Flow Control Mode  }
  PCI_HT_FTR_ISOCFC = $0001;  
{ LDTSTOP# Supported  }
  PCI_HT_FTR_LDTSTOP = $0002;  
{ CRC Test Mode  }
  PCI_HT_FTR_CRCTM = $0004;  
{ Extended CTL Time Required  }
  PCI_HT_FTR_ECTLT = $0008;  
{ 64-bit Addressing  }
  PCI_HT_FTR_64BA = $0010;  
{ UnitID Reorder Disable  }
  PCI_HT_FTR_UIDRD = $0020;  
{ Error Handling Register  }
{ Protocol Error Flood Enable  }
  PCI_HT_EH_PFLE = $0001;  
{ Overflow Error Flood Enable  }
  PCI_HT_EH_OFLE = $0002;  
{ Protocol Error Fatal Enable  }
  PCI_HT_EH_PFE = $0004;  
{ Overflow Error Fatal Enable  }
  PCI_HT_EH_OFE = $0008;  
{ End of Chain Error Fatal Enable  }
  PCI_HT_EH_EOCFE = $0010;  
{ Response Error Fatal Enable  }
  PCI_HT_EH_RFE = $0020;  
{ CRC Error Fatal Enable  }
  PCI_HT_EH_CRCFE = $0040;  
{ System Error Fatal Enable (B  }
  PCI_HT_EH_SERRFE = $0080;  
{ Chain Fail  }
  PCI_HT_EH_CF = $0100;  
{ Response Error  }
  PCI_HT_EH_RE = $0200;  
{ Protocol Error Nonfatal Enable  }
  PCI_HT_EH_PNFE = $0400;  
{ Overflow Error Nonfatal Enable  }
  PCI_HT_EH_ONFE = $0800;  
{ End of Chain Error Nonfatal Enable  }
  PCI_HT_EH_EOCNFE = $1000;  
{ Response Error Nonfatal Enable  }
  PCI_HT_EH_RNFE = $2000;  
{ CRC Error Nonfatal Enable  }
  PCI_HT_EH_CRCNFE = $4000;  
{ System Error Nonfatal Enable  }
  PCI_HT_EH_SERRNFE = $8000;  
{ HyperTransport: Slave or Primary Interface  }
{ Command Register  }
  PCI_HT_PRI_CMD = 2;  
{ Base UnitID  }
  PCI_HT_PRI_CMD_BUID = $001f;  
{ Unit Count  }
  PCI_HT_PRI_CMD_UC = $03e0;  
{ Master Host  }
  PCI_HT_PRI_CMD_MH = $0400;  
{ Default Direction  }
  PCI_HT_PRI_CMD_DD = $0800;  
{ Drop on Uninitialized Link  }
  PCI_HT_PRI_CMD_DUL = $1000;  
{ Link Control 0 Register  }
  PCI_HT_PRI_LCTR0 = 4;  
{ Link Config 0 Register  }
  PCI_HT_PRI_LCNF0 = 6;  
{ Link Control 1 Register  }
  PCI_HT_PRI_LCTR1 = 8;  
{ Link Config 1 Register  }
  PCI_HT_PRI_LCNF1 = 10;  
{ Revision ID Register  }
  PCI_HT_PRI_RID = 12;  
{ Link Frequency/Error 0 Register  }
  PCI_HT_PRI_LFRER0 = 13;  
{ Link Frequency Capability 0 Register  }
  PCI_HT_PRI_LFCAP0 = 14;  
{ Feature Register  }
  PCI_HT_PRI_FTR = 16;  
{ Link Frequency/Error 1 Register  }
  PCI_HT_PRI_LFRER1 = 17;  
{ Link Frequency Capability 1 Register  }
  PCI_HT_PRI_LFCAP1 = 18;  
{ Enumeration Scratchpad Register  }
  PCI_HT_PRI_ES = 20;  
{ Error Handling Register  }
  PCI_HT_PRI_EH = 22;  
{ Memory Base Upper Register  }
  PCI_HT_PRI_MBU = 24;  
{ Memory Limit Upper Register  }
  PCI_HT_PRI_MLU = 25;  
{ Bus Number Register  }
  PCI_HT_PRI_BN = 26;  
  PCI_HT_PRI_SIZEOF = 28;  
{ HyperTransport: Host or Secondary Interface  }
{ Command Register  }
  PCI_HT_SEC_CMD = 2;  
{ Warm Reset  }
  PCI_HT_SEC_CMD_WR = $0001;  
{ Double-Ended  }
  PCI_HT_SEC_CMD_DE = $0002;  
{ Device Number  }
  PCI_HT_SEC_CMD_DN = $007c;  
{ Chain Side  }
  PCI_HT_SEC_CMD_CS = $0080;  
{ Host Hide  }
  PCI_HT_SEC_CMD_HH = $0100;  
{ Act as Slave  }
  PCI_HT_SEC_CMD_AS = $0400;  
{ Host Inbound End of Chain Error  }
  PCI_HT_SEC_CMD_HIECE = $0800;  
{ Drop on Uninitialized Link  }
  PCI_HT_SEC_CMD_DUL = $1000;  
{ Link Control Register  }
  PCI_HT_SEC_LCTR = 4;  
{ Link Config Register  }
  PCI_HT_SEC_LCNF = 6;  
{ Revision ID Register  }
  PCI_HT_SEC_RID = 8;  
{ Link Frequency/Error Register  }
  PCI_HT_SEC_LFRER = 9;  
{ Link Frequency Capability Register  }
  PCI_HT_SEC_LFCAP = 10;  
{ Feature Register  }
  PCI_HT_SEC_FTR = 12;  
{ Extended Register Set  }
  PCI_HT_SEC_FTR_EXTRS = $0100;  
{ Upstream Configuration Enable  }
  PCI_HT_SEC_FTR_UCNFE = $0200;  
{ Enumeration Scratchpad Register  }
  PCI_HT_SEC_ES = 16;  
{ Error Handling Register  }
  PCI_HT_SEC_EH = 18;  
{ Memory Base Upper Register  }
  PCI_HT_SEC_MBU = 20;  
{ Memory Limit Upper Register  }
  PCI_HT_SEC_MLU = 21;  
  PCI_HT_SEC_SIZEOF = 24;  
{ HyperTransport: Switch  }
{ Switch Command Register  }
  PCI_HT_SW_CMD = 2;  
{ VIB Error  }
  PCI_HT_SW_CMD_VIBERR = $0080;  
{ VIB Flood  }
  PCI_HT_SW_CMD_VIBFL = $0100;  
{ VIB Fatal  }
  PCI_HT_SW_CMD_VIBFT = $0200;  
{ VIB Nonfatal  }
  PCI_HT_SW_CMD_VIBNFT = $0400;  
{ Partition Mask Register  }
  PCI_HT_SW_PMASK = 4;  
{ Switch Info Register  }
  PCI_HT_SW_SWINF = 8;  
{ Default Port  }
  PCI_HT_SW_SWINF_DP = $0000001f;  
{ Enable Decode  }
  PCI_HT_SW_SWINF_EN = $00000020;  
{ Cold Reset  }
  PCI_HT_SW_SWINF_CR = $00000040;  
{ Performance Counter Index  }
  PCI_HT_SW_SWINF_PCIDX = $00000f00;  
{ Base/Limit Range Index  }
  PCI_HT_SW_SWINF_BLRIDX = $0003f000;  
{ Secondary Base Range Index  }
  PCI_HT_SW_SWINF_SBIDX = $00002000;  
{ Hot Plug  }
  PCI_HT_SW_SWINF_HP = $00040000;  
{ Hide Port  }
  PCI_HT_SW_SWINF_HIDE = $00080000;  
{ Performance Counter Data Register  }
  PCI_HT_SW_PCD = 12;  
{ Base/Limit Range Data Register  }
  PCI_HT_SW_BLRD = 16;  
{ Secondary Base Data Register  }
  PCI_HT_SW_SBD = 20;  
  PCI_HT_SW_SIZEOF = 24;  
{ Counter indices  }
{ Posted Command Receive  }
  PCI_HT_SW_PC_PCR = $0;  
{ Nonposted Command Receive  }
  PCI_HT_SW_PC_NPCR = $1;  
{ Response Command Receive  }
  PCI_HT_SW_PC_RCR = $2;  
{ Posted DW Receive  }
  PCI_HT_SW_PC_PDWR = $3;  
{ Nonposted DW Receive  }
  PCI_HT_SW_PC_NPDWR = $4;  
{ Response DW Receive  }
  PCI_HT_SW_PC_RDWR = $5;  
{ Posted Command Transmit  }
  PCI_HT_SW_PC_PCT = $6;  
{ Nonposted Command Transmit  }
  PCI_HT_SW_PC_NPCT = $7;  
{ Response Command Transmit  }
  PCI_HT_SW_PC_RCT = $8;  
{ Posted DW Transmit  }
  PCI_HT_SW_PC_PDWT = $9;  
{ Nonposted DW Transmit  }
  PCI_HT_SW_PC_NPDWT = $a;  
{ Response DW Transmit  }
  PCI_HT_SW_PC_RDWT = $b;  
{ Base/Limit Range indices  }
{ Base 0[31:1], Enable  }
  PCI_HT_SW_BLR_BASE0_LO = $0;  
{ Base 0 Upper  }
  PCI_HT_SW_BLR_BASE0_HI = $1;  
{ Limit 0 Lower  }
  PCI_HT_SW_BLR_LIM0_LO = $2;  
{ Limit 0 Upper  }
  PCI_HT_SW_BLR_LIM0_HI = $3;  
{ Secondary Base indices  }
{ Secondary Base[31:1], Enable  }
  PCI_HT_SW_SB_LO = $0;  
{ Secondary Base Upper  }
  PCI_HT_SW_S0_HI = $1;  
{ HyperTransport: Interrupt Discovery and Configuration  }
{ Index Register  }
  PCI_HT_IDC_IDX = 2;  
{ Data Register  }
  PCI_HT_IDC_DATA = 4;  
  PCI_HT_IDC_SIZEOF = 8;  
{ Register indices  }
{ Last Interrupt Register  }
  PCI_HT_IDC_IDX_LINT = $01;  
{ Last interrupt definition  }
  PCI_HT_IDC_LINT = $00ff0000;  
{ Interrupt Definition Registers  }
  PCI_HT_IDC_IDX_IDR = $10;  
{ Low part (at index)  }
{ Mask  }
  PCI_HT_IDC_IDR_MASK = $10000001;  
{ Polarity  }
  PCI_HT_IDC_IDR_POL = $10000002;  
{ IntrInfo[4:2]: Message Type  }
  PCI_HT_IDC_IDR_II_2 = $1000001c;  
{ IntrInfo[5]: Request EOI  }
  PCI_HT_IDC_IDR_II_5 = $10000020;  
{ IntrInfo[23:6]  }
  PCI_HT_IDC_IDR_II_6 = $00ffffc0;  
{ IntrInfo[31:24]  }
  PCI_HT_IDC_IDR_II_24 = $ff000000;  
{ High part (at index + 1)  }
{ IntrInfo[55:32]  }
  PCI_HT_IDC_IDR_II_32 = $00ffffff;  
{ PassPW setting for messages  }
  PCI_HT_IDC_IDR_PASSPW = $40000000;  
{ Waiting for EOI  }
  PCI_HT_IDC_IDR_WEOI = $80000000;  
{ HyperTransport: Revision ID  }
{ Revision Register  }
  PCI_HT_RID_RID = 2;  
  PCI_HT_RID_SIZEOF = 4;  
{ HyperTransport: UnitID Clumping  }
{ Clumping Support Register  }
  PCI_HT_UIDC_CS = 4;  
{ Clumping Enable Register  }
  PCI_HT_UIDC_CE = 8;  
  PCI_HT_UIDC_SIZEOF = 12;  
{ HyperTransport: Extended Configuration Space Access  }
{ Configuration Address Register  }
  PCI_HT_ECSA_ADDR = 4;  
{ Register  }
  PCI_HT_ECSA_ADDR_REG = $00000ffc;  
{ Function  }
  PCI_HT_ECSA_ADDR_FUN = $00007000;  
{ Device  }
  PCI_HT_ECSA_ADDR_DEV = $000f1000;  
{ Bus Number  }
  PCI_HT_ECSA_ADDR_BUS = $0ff00000;  
{ Access Type  }
  PCI_HT_ECSA_ADDR_TYPE = $10000000;  
{ Configuration Data Register  }
  PCI_HT_ECSA_DATA = 8;  
  PCI_HT_ECSA_SIZEOF = 12;  
{ HyperTransport: Address Mapping  }
{ Command Register  }
  PCI_HT_AM_CMD = 2;  
{ Number of DMA Mappings  }
  PCI_HT_AM_CMD_NDMA = $000f;  
{ I/O Size  }
  PCI_HT_AM_CMD_IOSIZ = $01f0;  
{ Map Type  }
  PCI_HT_AM_CMD_MT = $0600;  
{ 40-bit  }
  PCI_HT_AM_CMD_MT_40B = $0000;  
{ 64-bit  }
  PCI_HT_AM_CMD_MT_64B = $0200;  
{ Window Control Register bits  }
{ Compat  }
  PCI_HT_AM_SBW_CTR_COMP = $1;  
{ NonCoherent  }
  PCI_HT_AM_SBW_CTR_NCOH = $2;  
{ Isochronous  }
  PCI_HT_AM_SBW_CTR_ISOC = $4;  
{ Enable  }
  PCI_HT_AM_SBW_CTR_EN = $8;  
{ HyperTransport: 40-bit Address Mapping  }
{ Secondary Bus Non-Prefetchable Window Register  }
  PCI_HT_AM40_SBNPW = 4;  
{ Window Base  }
  PCI_HT_AM40_SBW_BASE = $000fffff;  
{ Window Control  }
  PCI_HT_AM40_SBW_CTR = $f0000000;  
{ Secondary Bus Prefetchable Window Register  }
  PCI_HT_AM40_SBPW = 8;  
{ DMA Window Primary Base 0 Register  }
  PCI_HT_AM40_DMA_PBASE0 = 12;  
{ DMA Window Control 0 Register  }
  PCI_HT_AM40_DMA_CTR0 = 15;  
{ Window Control  }
  PCI_HT_AM40_DMA_CTR_CTR = $f0;  
{ DMA Window Secondary Limit 0 Register  }
  PCI_HT_AM40_DMA_SLIM0 = 16;  
{ DMA Window Secondary Base 0 Register  }
  PCI_HT_AM40_DMA_SBASE0 = 18;  
{ size is variable: 12 + 8 * NDMA  }
  PCI_HT_AM40_SIZEOF = 12;  
{ HyperTransport: 64-bit Address Mapping  }
{ Index Register  }
  PCI_HT_AM64_IDX = 4;  
{ Data Lower Register  }
  PCI_HT_AM64_DATA_LO = 8;  
{ Data Upper Register  }
  PCI_HT_AM64_DATA_HI = 12;  
  PCI_HT_AM64_SIZEOF = 16;  
{ Register indices  }
{ Secondary Bus Non-Prefetchable Window Register  }
  PCI_HT_AM64_IDX_SBNPW = $00;  
{ Window Base Lower  }
  PCI_HT_AM64_W_BASE_LO = $fff00000;  
{ Window Control  }
  PCI_HT_AM64_W_CTR = $0000000f;  
{ Secondary Bus Prefetchable Window Register  }
  PCI_HT_AM64_IDX_SBPW = $01;  
{ Primary Bus Non-Prefetchable Window Register  }
  PCI_HT_AM64_IDX_PBNPW = $02;  
{ DMA Window Primary Base 0 Register  }
  PCI_HT_AM64_IDX_DMAPB0 = $04;  
{ DMA Window Secondary Base 0 Register  }
  PCI_HT_AM64_IDX_DMASB0 = $05;  
{ DMA Window Secondary Limit 0 Register  }
  PCI_HT_AM64_IDX_DMASL0 = $06;  
{ HyperTransport: MSI Mapping  }
{ Command Register  }
  PCI_HT_MSIM_CMD = 2;  
{ Mapping Active  }
  PCI_HT_MSIM_CMD_EN = $0001;  
{ MSI Mapping Address Fixed  }
  PCI_HT_MSIM_CMD_FIXD = $0002;  
{ MSI Mapping Address Lower Register  }
  PCI_HT_MSIM_ADDR_LO = 4;  
{ MSI Mapping Address Upper Register  }
  PCI_HT_MSIM_ADDR_HI = 8;  
  PCI_HT_MSIM_SIZEOF = 12;  
{ HyperTransport: DirectRoute  }
{ Command Register  }
  PCI_HT_DR_CMD = 2;  
{ Number of DirectRoute Spaces  }
  PCI_HT_DR_CMD_NDRS = $000f;  
{ Index  }
  PCI_HT_DR_CMD_IDX = $01f0;  
{ Enable Vector Register  }
  PCI_HT_DR_EN = 4;  
{ Data Register  }
  PCI_HT_DR_DATA = 8;  
  PCI_HT_DR_SIZEOF = 12;  
{ Register indices  }
{ DirectRoute Base Lower Register  }
  PCI_HT_DR_IDX_BASE_LO = $00;  
{ Opposite to Normal Request Direction  }
  PCI_HT_DR_OTNRD = $00000001;  
{ Base/Limit Lower  }
  PCI_HT_DR_BL_LO = $ffffff00;  
{ DirectRoute Base Upper Register  }
  PCI_HT_DR_IDX_BASE_HI = $01;  
{ DirectRoute Limit Lower Register  }
  PCI_HT_DR_IDX_LIMIT_LO = $02;  
{ DirectRoute Limit Upper Register  }
  PCI_HT_DR_IDX_LIMIT_HI = $03;  
{ HyperTransport: VCSet  }
{ VCSets Supported Register  }
  PCI_HT_VCS_SUP = 4;  
{ Link 1 VCSets Enabled Register  }
  PCI_HT_VCS_L1EN = 5;  
{ Link 0 VCSets Enabled Register  }
  PCI_HT_VCS_L0EN = 6;  
{ Stream Bucket Depth Register  }
  PCI_HT_VCS_SBD = 8;  
{ Stream Interval Register  }
  PCI_HT_VCS_SINT = 9;  
{ Number of Streaming VCs Supported Register  }
  PCI_HT_VCS_SSUP = 10;  
{ Streaming VC 0  }
  PCI_HT_VCS_SSUP_0 = $00;  
{ Streaming VCs 0-3  }
  PCI_HT_VCS_SSUP_3 = $01;  
{ Streaming VCs 0-15  }
  PCI_HT_VCS_SSUP_15 = $02;  
{ Non-FC Bucket Depth Register  }
  PCI_HT_VCS_NFCBD = 12;  
{ Non-FC Bucket Interval Register  }
  PCI_HT_VCS_NFCINT = 13;  
  PCI_HT_VCS_SIZEOF = 16;  
{ HyperTransport: Retry Mode  }
{ Control 0 Register  }
  PCI_HT_RM_CTR0 = 4;  
{ Link Retry Enable  }
  PCI_HT_RM_CTR_LRETEN = $01;  
{ Force Single Error  }
  PCI_HT_RM_CTR_FSER = $02;  
{ Rollover Nonfatal Enable  }
  PCI_HT_RM_CTR_ROLNEN = $04;  
{ Force Single Stomp  }
  PCI_HT_RM_CTR_FSS = $08;  
{ Retry Nonfatal Enable  }
  PCI_HT_RM_CTR_RETNEN = $10;  
{ Retry Fatal Enable  }
  PCI_HT_RM_CTR_RETFEN = $20;  
{ Allowed Attempts  }
  PCI_HT_RM_CTR_AA = $c0;  
{ Status 0 Register  }
  PCI_HT_RM_STS0 = 5;  
{ Retry Sent  }
  PCI_HT_RM_STS_RETSNT = $01;  
{ Count Rollover  }
  PCI_HT_RM_STS_CNTROL = $02;  
{ Stomp Received  }
  PCI_HT_RM_STS_SRCV = $04;  
{ Control 1 Register  }
  PCI_HT_RM_CTR1 = 6;  
{ Status 1 Register  }
  PCI_HT_RM_STS1 = 7;  
{ Retry Count 0 Register  }
  PCI_HT_RM_CNT0 = 8;  
{ Retry Count 1 Register  }
  PCI_HT_RM_CNT1 = 10;  
  PCI_HT_RM_SIZEOF = 12;  
{ Vendor-Specific Capability (see PCI_EVNDR_xxx for the PCIe version)  }
{ Length byte  }
  PCI_VNDR_LENGTH = 2;  
{ PCI Express  }
{ Capabilities register  }
  PCI_EXP_FLAGS = $2;  
{ Capability version  }
  PCI_EXP_FLAGS_VERS = $000f;  
{ Device/Port type  }
  PCI_EXP_FLAGS_TYPE = $00f0;  
{ Express Endpoint  }
  PCI_EXP_TYPE_ENDPOINT = $0;  
{ Legacy Endpoint  }
  PCI_EXP_TYPE_LEG_END = $1;  
{ Root Port  }
  PCI_EXP_TYPE_ROOT_PORT = $4;  
{ Upstream Port  }
  PCI_EXP_TYPE_UPSTREAM = $5;  
{ Downstream Port  }
  PCI_EXP_TYPE_DOWNSTREAM = $6;  
{ PCIe to PCI/PCI-X Bridge  }
  PCI_EXP_TYPE_PCI_BRIDGE = $7;  
{ PCI/PCI-X to PCIe Bridge  }
  PCI_EXP_TYPE_PCIE_BRIDGE = $8;  
{ Root Complex Integrated Endpoint  }
  PCI_EXP_TYPE_ROOT_INT_EP = $9;  
{ Root Complex Event Collector  }
  PCI_EXP_TYPE_ROOT_EC = $a;  
{ Slot implemented  }
  PCI_EXP_FLAGS_SLOT = $0100;  
{ Interrupt message number  }
  PCI_EXP_FLAGS_IRQ = $3e00;  
{ Device capabilities  }
  PCI_EXP_DEVCAP = $4;  
{ Max_Payload_Size  }
  PCI_EXP_DEVCAP_PAYLOAD = $07;  
{ Phantom functions  }
  PCI_EXP_DEVCAP_PHANTOM = $18;  
{ Extended tags  }
  PCI_EXP_DEVCAP_EXT_TAG = $20;  
{ L0s Acceptable Latency  }
  PCI_EXP_DEVCAP_L0S = $1c0;  
{ L1 Acceptable Latency  }
  PCI_EXP_DEVCAP_L1 = $e00;  
{ Attention Button Present  }
  PCI_EXP_DEVCAP_ATN_BUT = $1000;  
{ Attention Indicator Present  }
  PCI_EXP_DEVCAP_ATN_IND = $2000;  
{ Power Indicator Present  }
  PCI_EXP_DEVCAP_PWR_IND = $4000;  
{ Role-Based Error Reporting  }
  PCI_EXP_DEVCAP_RBE = $8000;  
{ Slot Power Limit Value  }
  PCI_EXP_DEVCAP_PWR_VAL = $3fc0000;  
{ Slot Power Limit Scale  }
  PCI_EXP_DEVCAP_PWR_SCL = $c000000;  
{ Function-Level Reset  }
  PCI_EXP_DEVCAP_FLRESET = $10000000;  
{ Device Control  }
  PCI_EXP_DEVCTL = $8;  
{ Correctable Error Reporting En.  }
  PCI_EXP_DEVCTL_CERE = $0001;  
{ Non-Fatal Error Reporting Enable  }
  PCI_EXP_DEVCTL_NFERE = $0002;  
{ Fatal Error Reporting Enable  }
  PCI_EXP_DEVCTL_FERE = $0004;  
{ Unsupported Request Reporting En.  }
  PCI_EXP_DEVCTL_URRE = $0008;  
{ Enable Relaxed Ordering  }
  PCI_EXP_DEVCTL_RELAXED = $0010;  
{ Max_Payload_Size  }
  PCI_EXP_DEVCTL_PAYLOAD = $00e0;  
{ Extended Tag Field Enable  }
  PCI_EXP_DEVCTL_EXT_TAG = $0100;  
{ Phantom Functions Enable  }
  PCI_EXP_DEVCTL_PHANTOM = $0200;  
{ Auxiliary Power PM Enable  }
  PCI_EXP_DEVCTL_AUX_PME = $0400;  
{ Enable No Snoop  }
  PCI_EXP_DEVCTL_NOSNOOP = $0800;  
{ Max_Read_Request_Size  }
  PCI_EXP_DEVCTL_READRQ = $7000;  
{ Bridge Configuration Retry Enable  }
  PCI_EXP_DEVCTL_BCRE = $8000;  
{ Function-Level Reset [bit shared with BCRE]  }
  PCI_EXP_DEVCTL_FLRESET = $8000;  
{ Device Status  }
  PCI_EXP_DEVSTA = $a;  
{ Correctable Error Detected  }
  PCI_EXP_DEVSTA_CED = $01;  
{ Non-Fatal Error Detected  }
  PCI_EXP_DEVSTA_NFED = $02;  
{ Fatal Error Detected  }
  PCI_EXP_DEVSTA_FED = $04;  
{ Unsupported Request Detected  }
  PCI_EXP_DEVSTA_URD = $08;  
{ AUX Power Detected  }
  PCI_EXP_DEVSTA_AUXPD = $10;  
{ Transactions Pending  }
  PCI_EXP_DEVSTA_TRPND = $20;  
{ Link Capabilities  }
  PCI_EXP_LNKCAP = $c;  
{ Maximum Link Speed  }
  PCI_EXP_LNKCAP_SPEED = $0000f;  
{ Maximum Link Width  }
  PCI_EXP_LNKCAP_WIDTH = $003f0;  
{ Active State Power Management  }
  PCI_EXP_LNKCAP_ASPM = $00c00;  
{ L0s Exit Latency  }
  PCI_EXP_LNKCAP_L0S = $07000;  
{ L1 Exit Latency  }
  PCI_EXP_LNKCAP_L1 = $38000;  
{ Clock Power Management  }
  PCI_EXP_LNKCAP_CLOCKPM = $40000;  
{ Surprise Down Error Reporting  }
  PCI_EXP_LNKCAP_SURPRISE = $80000;  
{ Data Link Layer Active Reporting  }
  PCI_EXP_LNKCAP_DLLA = $100000;  
{ Link Bandwidth Notification Capability  }
  PCI_EXP_LNKCAP_LBNC = $200000;  
{ ASPM Optionality Compliance  }
  PCI_EXP_LNKCAP_AOC = $400000;  
{ Port Number  }
  PCI_EXP_LNKCAP_PORT = $ff000000;  
{ Link Control  }
  PCI_EXP_LNKCTL = $10;  
{ ASPM Control  }
  PCI_EXP_LNKCTL_ASPM = $0003;  
{ Read Completion Boundary  }
  PCI_EXP_LNKCTL_RCB = $0008;  
{ Link Disable  }
  PCI_EXP_LNKCTL_DISABLE = $0010;  
{ Retrain Link  }
  PCI_EXP_LNKCTL_RETRAIN = $0020;  
{ Common Clock Configuration  }
  PCI_EXP_LNKCTL_CLOCK = $0040;  
{ Extended Synch  }
  PCI_EXP_LNKCTL_XSYNCH = $0080;  
{ Clock Power Management  }
  PCI_EXP_LNKCTL_CLOCKPM = $0100;  
{ Hardware Autonomous Width Disable  }
  PCI_EXP_LNKCTL_HWAUTWD = $0200;  
{ Bandwidth Mgmt Interrupt Enable  }
  PCI_EXP_LNKCTL_BWMIE = $0400;  
{ Autonomous Bandwidth Mgmt Interrupt Enable  }
  PCI_EXP_LNKCTL_AUTBWIE = $0800;  
{ Link Status  }
  PCI_EXP_LNKSTA = $12;  
{ Negotiated Link Speed  }
  PCI_EXP_LNKSTA_SPEED = $000f;  
{ Negotiated Link Width  }
  PCI_EXP_LNKSTA_WIDTH = $03f0;  
{ Training Error (obsolete)  }
  PCI_EXP_LNKSTA_TR_ERR = $0400;  
{ Link Training  }
  PCI_EXP_LNKSTA_TRAIN = $0800;  
{ Slot Clock Configuration  }
  PCI_EXP_LNKSTA_SL_CLK = $1000;  
{ Data Link Layer in DL_Active State  }
  PCI_EXP_LNKSTA_DL_ACT = $2000;  
{ Bandwidth Mgmt Status  }
  PCI_EXP_LNKSTA_BWMGMT = $4000;  
{ Autonomous Bandwidth Mgmt Status  }
  PCI_EXP_LNKSTA_AUTBW = $8000;  
{ Slot Capabilities  }
  PCI_EXP_SLTCAP = $14;  
{ Attention Button Present  }
  PCI_EXP_SLTCAP_ATNB = $0001;  
{ Power Controller Present  }
  PCI_EXP_SLTCAP_PWRC = $0002;  
{ MRL Sensor Present  }
  PCI_EXP_SLTCAP_MRL = $0004;  
{ Attention Indicator Present  }
  PCI_EXP_SLTCAP_ATNI = $0008;  
{ Power Indicator Present  }
  PCI_EXP_SLTCAP_PWRI = $0010;  
{ Hot-Plug Surprise  }
  PCI_EXP_SLTCAP_HPS = $0020;  
{ Hot-Plug Capable  }
  PCI_EXP_SLTCAP_HPC = $0040;  
{ Slot Power Limit Value  }
  PCI_EXP_SLTCAP_PWR_VAL = $00007f80;  
{ Slot Power Limit Scale  }
  PCI_EXP_SLTCAP_PWR_SCL = $00018000;  
{ Electromechanical Interlock Present  }
  PCI_EXP_SLTCAP_INTERLOCK = $020000;  
{ No Command Completed Support  }
  PCI_EXP_SLTCAP_NOCMDCOMP = $040000;  
{ Physical Slot Number  }
  PCI_EXP_SLTCAP_PSN = $fff80000;  
{ Slot Control  }
  PCI_EXP_SLTCTL = $18;  
{ Attention Button Pressed Enable  }
  PCI_EXP_SLTCTL_ATNB = $0001;  
{ Power Fault Detected Enable  }
  PCI_EXP_SLTCTL_PWRF = $0002;  
{ MRL Sensor Changed Enable  }
  PCI_EXP_SLTCTL_MRLS = $0004;  
{ Presence Detect Changed Enable  }
  PCI_EXP_SLTCTL_PRSD = $0008;  
{ Command Completed Interrupt Enable  }
  PCI_EXP_SLTCTL_CMDC = $0010;  
{ Hot-Plug Interrupt Enable  }
  PCI_EXP_SLTCTL_HPIE = $0020;  
{ Attention Indicator Control  }
  PCI_EXP_SLTCTL_ATNI = $00c0;  
{ Power Indicator Control  }
  PCI_EXP_SLTCTL_PWRI = $0300;  
{ Power Controller Control  }
  PCI_EXP_SLTCTL_PWRC = $0400;  
{ Electromechanical Interlock Control  }
  PCI_EXP_SLTCTL_INTERLOCK = $0800;  
{ Data Link Layer State Changed Enable  }
  PCI_EXP_SLTCTL_LLCHG = $1000;  
{ Slot Status  }
  PCI_EXP_SLTSTA = $1a;  
{ Attention Button Pressed  }
  PCI_EXP_SLTSTA_ATNB = $0001;  
{ Power Fault Detected  }
  PCI_EXP_SLTSTA_PWRF = $0002;  
{ MRL Sensor Changed  }
  PCI_EXP_SLTSTA_MRLS = $0004;  
{ Presence Detect Changed  }
  PCI_EXP_SLTSTA_PRSD = $0008;  
{ Command Completed  }
  PCI_EXP_SLTSTA_CMDC = $0010;  
{ MRL Sensor State  }
  PCI_EXP_SLTSTA_MRL_ST = $0020;  
{ Presence Detect State  }
  PCI_EXP_SLTSTA_PRES = $0040;  
{ Electromechanical Interlock Status  }
  PCI_EXP_SLTSTA_INTERLOCK = $0080;  
{ Data Link Layer State Changed  }
  PCI_EXP_SLTSTA_LLCHG = $0100;  
{ Root Control  }
  PCI_EXP_RTCTL = $1c;  
{ System Error on Correctable Error  }
  PCI_EXP_RTCTL_SECEE = $0001;  
{ System Error on Non-Fatal Error  }
  PCI_EXP_RTCTL_SENFEE = $0002;  
{ System Error on Fatal Error  }
  PCI_EXP_RTCTL_SEFEE = $0004;  
{ PME Interrupt Enable  }
  PCI_EXP_RTCTL_PMEIE = $0008;  
{ Configuration Request Retry Status Visible to SW  }
  PCI_EXP_RTCTL_CRSVIS = $0010;  
{ Root Capabilities  }
  PCI_EXP_RTCAP = $1e;  
{ Configuration Request Retry Status Visible to SW  }
  PCI_EXP_RTCAP_CRSVIS = $0001;  
{ Root Status  }
  PCI_EXP_RTSTA = $20;  
{ PME Requester ID  }
  PCI_EXP_RTSTA_PME_REQID = $0000ffff;  
{ PME Status  }
  PCI_EXP_RTSTA_PME_STATUS = $00010000;  
{ PME is Pending  }
  PCI_EXP_RTSTA_PME_PENDING = $00020000;  
{ Device capabilities 2  }
  PCI_EXP_DEVCAP2 = $24;  
{ Completion Timeout Ranges Supported  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }

function PCI_EXP_DEVCAP2_TIMEOUT_RANGE(x : longint) : Tx;

{ Completion Timeout Disable Supported  }
const
  PCI_EXP_DEVCAP2_TIMEOUT_DIS = $0010;  
{ ARI Forwarding Supported  }
  PCI_EXP_DEVCAP2_ARI = $0020;  
{ AtomicOp Routing Supported  }
  PCI_EXP_DEVCAP2_ATOMICOP_ROUTING = $0040;  
{ 32bit AtomicOp Completer Supported  }
  PCI_EXP_DEVCAP2_32BIT_ATOMICOP_COMP = $0080;  
{ 64bit AtomicOp Completer Supported  }
  PCI_EXP_DEVCAP2_64BIT_ATOMICOP_COMP = $0100;  
{ 128bit CAS Completer Supported  }
  PCI_EXP_DEVCAP2_128BIT_CAS_COMP = $0200;  
{ No RO-enabled PR-PR Passing  }
  PCI_EXP_DEVCAP2_NROPRPRP = $0400;  
{ LTR supported  }
  PCI_EXP_DEVCAP2_LTR = $0800;  
{ TPH Completer Supported  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function PCI_EXP_DEVCAP2_TPH_COMP(x : longint) : longint;

{ LN System CLS Supported  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PCI_EXP_DEVCAP2_LN_CLS(x : longint) : longint;

{ 10 Bit Tag Completer  }
const
  PCI_EXP_DEVCAP2_10BIT_TAG_COMP = $00010000;  
{ 10 Bit Tag Requester  }
  PCI_EXP_DEVCAP2_10BIT_TAG_REQ = $00020000;  
{ OBFF supported  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function PCI_EXP_DEVCAP2_OBFF(x : longint) : longint;

{ Extended Fmt Field Supported  }
const
  PCI_EXP_DEVCAP2_EXTFMT = $00100000;  
{ End-End TLP Prefix Supported  }
  PCI_EXP_DEVCAP2_EE_TLP = $00200000;  
{ Max End-End TLP Prefixes  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function PCI_EXP_DEVCAP2_MEE_TLP(x : longint) : longint;

{ Emergency Power Reduction Supported  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PCI_EXP_DEVCAP2_EPR(x : longint) : longint;

{ Emergency Power Reduction Initialization Required  }
const
  PCI_EXP_DEVCAP2_EPR_INIT = $04000000;  
{ FRS supported  }
  PCI_EXP_DEVCAP2_FRS = $80000000;  
{ Device Control  }
  PCI_EXP_DEVCTL2 = $28;  
{ Completion Timeout Value  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }

function PCI_EXP_DEVCTL2_TIMEOUT_VALUE(x : longint) : Tx;

{ Completion Timeout Disable  }
const
  PCI_EXP_DEVCTL2_TIMEOUT_DIS = $0010;  
{ ARI Forwarding  }
  PCI_EXP_DEVCTL2_ARI = $0020;  
{ AtomicOp RequesterEnable  }
  PCI_EXP_DEVCTL2_ATOMICOP_REQUESTER_EN = $0040;  
{ AtomicOp Egress Blocking  }
  PCI_EXP_DEVCTL2_ATOMICOP_EGRESS_BLOCK = $0080;  
{ LTR enabled  }
  PCI_EXP_DEVCTL2_LTR = $0400;  
{ 10 Bit Tag Requester enabled  }
  PCI_EXP_DEVCTL2_10BIT_TAG_REQ = $1000;  
{ OBFF enabled  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function PCI_EXP_DEVCTL2_OBFF(x : longint) : longint;

{ Device Status  }
const
  PCI_EXP_DEVSTA2 = $2a;  
{ Link Capabilities  }
  PCI_EXP_LNKCAP2 = $2c;  
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function PCI_EXP_LNKCAP2_SPEED(x : longint) : longint;

{ Crosslink Supported  }
const
  PCI_EXP_LNKCAP2_CROSSLINK = $00000100;  
{ Retimer Supported  }
  PCI_EXP_LNKCAP2_RETIMER = $00800000;  
{ 2 Retimers Supported  }
  PCI_EXP_LNKCAP2_2RETIMERS = $01000000;  
{ Device Readiness Status  }
  PCI_EXP_LNKCAP2_DRS = $80000000;  
{ Link Control  }
  PCI_EXP_LNKCTL2 = $30;  
{ Target Link Speed  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }

function PCI_EXP_LNKCTL2_SPEED(x : longint) : Tx;

{ Enter Compliance  }
const
  PCI_EXP_LNKCTL2_CMPLNC = $0010;  
{ Hardware Autonomous Speed Disable  }
  PCI_EXP_LNKCTL2_SPEED_DIS = $0020;  
{ Selectable De-emphasis  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function PCI_EXP_LNKCTL2_DEEMPHASIS(x : longint) : longint;

{ Transmit Margin  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PCI_EXP_LNKCTL2_MARGIN(x : longint) : longint;

{ Enter Modified Compliance  }
const
  PCI_EXP_LNKCTL2_MOD_CMPLNC = $0400;  
{ Compliance SOS  }
  PCI_EXP_LNKCTL2_CMPLNC_SOS = $0800;  
{ Compliance Preset/De-emphasis  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function PCI_EXP_LNKCTL2_COM_DEEMPHASIS(x : longint) : longint;

{ Link Status  }
const
  PCI_EXP_LNKSTA2 = $32;  
{ Current De-emphasis Level  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }

function PCI_EXP_LINKSTA2_DEEMPHASIS(x : longint) : Tx;

{ Equalization Complete  }
const
  PCI_EXP_LINKSTA2_EQU_COMP = $02;  
{ Equalization Phase 1 Successful  }
  PCI_EXP_LINKSTA2_EQU_PHASE1 = $04;  
{ Equalization Phase 2 Successful  }
  PCI_EXP_LINKSTA2_EQU_PHASE2 = $08;  
{ Equalization Phase 3 Successful  }
  PCI_EXP_LINKSTA2_EQU_PHASE3 = $10;  
{ Link Equalization Request  }
  PCI_EXP_LINKSTA2_EQU_REQ = $20;  
{ Retimer Detected  }
  PCI_EXP_LINKSTA2_RETIMER = $0040;  
{ 2 Retimers Detected  }
  PCI_EXP_LINKSTA2_2RETIMERS = $0080;  
{ Crosslink Res  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function PCI_EXP_LINKSTA2_CROSSLINK(x : longint) : longint;

{ Presence  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PCI_EXP_LINKSTA2_COMPONENT(x : longint) : longint;

{ DRS Msg Received  }
const
  PCI_EXP_LINKSTA2_DRS_RCVD = $8000;  
{ Slot Capabilities  }
  PCI_EXP_SLTCAP2 = $34;  
{ Slot Control  }
  PCI_EXP_SLTCTL2 = $38;  
{ Slot Status  }
  PCI_EXP_SLTSTA2 = $3a;  
{ MSI-X  }
  PCI_MSIX_ENABLE = $8000;  
  PCI_MSIX_MASK = $4000;  
  PCI_MSIX_TABSIZE = $07ff;  
  PCI_MSIX_TABLE = 4;  
  PCI_MSIX_PBA = 8;  
  PCI_MSIX_BIR = $7;  
{ Subsystem vendor/device ID for PCI bridges  }
  PCI_SSVID_VENDOR = 4;  
  PCI_SSVID_DEVICE = 6;  
{ PCI Advanced Features  }
  PCI_AF_CAP = 3;  
  PCI_AF_CAP_TP = $01;  
  PCI_AF_CAP_FLR = $02;  
  PCI_AF_CTRL = 4;  
  PCI_AF_CTRL_FLR = $01;  
  PCI_AF_STATUS = 5;  
  PCI_AF_STATUS_TP = $01;  
{ SATA Host Bus Adapter  }
  PCI_SATA_HBA_BARS = 4;  
  PCI_SATA_HBA_REG0 = 8;  
{ Enhanced Allocation (EA)  }
  PCI_EA_CAP_TYPE1_SECONDARY = 4;  
  PCI_EA_CAP_TYPE1_SUBORDINATE = 5;  
{ EA Entry header  }
{ Writable: 1 = RW, 0 = HwInit  }
  PCI_EA_CAP_ENT_WRITABLE = $40000000;  
{ Enable for this entry  }
  PCI_EA_CAP_ENT_ENABLE = $80000000;  
{** Definitions of extended capabilities ** }
{ Advanced Error Reporting  }
{ Uncorrectable Error Status  }
  PCI_ERR_UNCOR_STATUS = 4;  
{ Undefined in PCIe rev1.1 & 2.0 spec  }
  PCI_ERR_UNC_TRAIN = $00000001;  
{ Data Link Protocol  }
  PCI_ERR_UNC_DLP = $00000010;  
{ Surprise Down Error  }
  PCI_ERR_UNC_SDES = $00000020;  
{ Poisoned TLP  }
  PCI_ERR_UNC_POISON_TLP = $00001000;  
{ Flow Control Protocol  }
  PCI_ERR_UNC_FCP = $00002000;  
{ Completion Timeout  }
  PCI_ERR_UNC_COMP_TIME = $00004000;  
{ Completer Abort  }
  PCI_ERR_UNC_COMP_ABORT = $00008000;  
{ Unexpected Completion  }
  PCI_ERR_UNC_UNX_COMP = $00010000;  
{ Receiver Overflow  }
  PCI_ERR_UNC_RX_OVER = $00020000;  
{ Malformed TLP  }
  PCI_ERR_UNC_MALF_TLP = $00040000;  
{ ECRC Error Status  }
  PCI_ERR_UNC_ECRC = $00080000;  
{ Unsupported Request  }
  PCI_ERR_UNC_UNSUP = $00100000;  
{ ACS Violation  }
  PCI_ERR_UNC_ACS_VIOL = $00200000;  
{ Uncorrectable Error Mask  }
  PCI_ERR_UNCOR_MASK = 8;  
{ Same bits as above  }
{ Uncorrectable Error Severity  }
  PCI_ERR_UNCOR_SEVER = 12;  
{ Same bits as above  }
{ Correctable Error Status  }
  PCI_ERR_COR_STATUS = 16;  
{ Receiver Error Status  }
  PCI_ERR_COR_RCVR = $00000001;  
{ Bad TLP Status  }
  PCI_ERR_COR_BAD_TLP = $00000040;  
{ Bad DLLP Status  }
  PCI_ERR_COR_BAD_DLLP = $00000080;  
{ REPLAY_NUM Rollover  }
  PCI_ERR_COR_REP_ROLL = $00000100;  
{ Replay Timer Timeout  }
  PCI_ERR_COR_REP_TIMER = $00001000;  
{ Advisory Non-Fatal Error  }
  PCI_ERR_COR_REP_ANFE = $00002000;  
{ Correctable Error Mask  }
  PCI_ERR_COR_MASK = 20;  
{ Same bits as above  }
{ Advanced Error Capabilities  }
  PCI_ERR_CAP = 24;  
{ First Error Pointer  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }

function PCI_ERR_CAP_FEP(x : longint) : Tx;

{ ECRC Generation Capable  }
const
  PCI_ERR_CAP_ECRC_GENC = $00000020;  
{ ECRC Generation Enable  }
  PCI_ERR_CAP_ECRC_GENE = $00000040;  
{ ECRC Check Capable  }
  PCI_ERR_CAP_ECRC_CHKC = $00000080;  
{ ECRC Check Enable  }
  PCI_ERR_CAP_ECRC_CHKE = $00000100;  
{ Multiple Header Capable  }
  PCI_ERR_CAP_MULT_HDRC = $00000200;  
{ Multiple Header Enable  }
  PCI_ERR_CAP_MULT_HDRE = $00000400;  
{ TLP Prefix Log Present  }
  PCI_ERR_CAP_TLP_PFX = $00000800;  
{ Completion Timeout Prefix/Header Log Capable  }
  PCI_ERR_CAP_HDR_LOG = $00001000;  
{ Header Log Register (16 bytes)  }
  PCI_ERR_HEADER_LOG = 28;  
{ Root Error Command  }
  PCI_ERR_ROOT_COMMAND = 44;  
{ Correctable Error Reporting Enable  }
  PCI_ERR_ROOT_CMD_COR_EN = $00000001;  
{ Non-Fatal Error Reporting Enable }
  PCI_ERR_ROOT_CMD_NONFATAL_EN = $00000002;  
{ Fatal Error Reporting Enable  }
  PCI_ERR_ROOT_CMD_FATAL_EN = $00000004;  
{ Root Error Status  }
  PCI_ERR_ROOT_STATUS = 48;  
{ ERR_COR Received  }
  PCI_ERR_ROOT_COR_RCV = $00000001;  
{ Multiple ERR_COR Received  }
  PCI_ERR_ROOT_MULTI_COR_RCV = $00000002;  
{ ERR_FATAL/NONFATAL Received  }
  PCI_ERR_ROOT_UNCOR_RCV = $00000004;  
{ Multiple ERR_FATAL/NONFATAL Received  }
  PCI_ERR_ROOT_MULTI_UNCOR_RCV = $00000008;  
{ First Uncorrectable Fatal  }
  PCI_ERR_ROOT_FIRST_FATAL = $00000010;  
{ Non-Fatal Error Messages Received  }
  PCI_ERR_ROOT_NONFATAL_RCV = $00000020;  
{ Fatal Error Messages Received  }
  PCI_ERR_ROOT_FATAL_RCV = $00000040;  
{ MSI/MSI-X vector  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function PCI_ERR_MSG_NUM(x : longint) : longint;

const
  PCI_ERR_ROOT_COR_SRC = 52;  
  PCI_ERR_ROOT_SRC = 54;  
{ Virtual Channel  }
  PCI_VC_PORT_REG1 = 4;  
  PCI_VC_PORT_REG2 = 8;  
  PCI_VC_PORT_CTRL = 12;  
  PCI_VC_PORT_STATUS = 14;  
  PCI_VC_RES_CAP = 16;  
  PCI_VC_RES_CTRL = 20;  
  PCI_VC_RES_STATUS = 26;  
{ Power Budgeting  }
{ Data Select Register  }
  PCI_PWR_DSR = 4;  
{ Data Register  }
  PCI_PWR_DATA = 8;  
{ Base Power  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }

function PCI_PWR_DATA_BASE(x : longint) : Tx;

{ Data Scale  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PCI_PWR_DATA_SCALE(x : longint) : longint;

{ PM Sub State  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PCI_PWR_DATA_PM_SUB(x : longint) : longint;

{ PM State  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PCI_PWR_DATA_PM_STATE(x : longint) : longint;

{ Type  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PCI_PWR_DATA_TYPE(x : longint) : longint;

{ Power Rail  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PCI_PWR_DATA_RAIL(x : longint) : longint;

{ Capability  }
const
  PCI_PWR_CAP = 12;  
{ Included in system budget  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }

function PCI_PWR_CAP_BUDGET(x : longint) : Tx;

{ Root Complex Link  }
{ Element Self Description  }
const
  PCI_RCLINK_ESD = 4;  
{ First Link Entry  }
  PCI_RCLINK_LINK1 = 16;  
{ Link Entry: Description  }
  PCI_RCLINK_LINK_DESC = 0;  
{ Link Entry: Address (64-bit)  }
  PCI_RCLINK_LINK_ADDR = 8;  
{ Link Entry: sizeof  }
  PCI_RCLINK_LINK_SIZE = 16;  
{ Root Complex Event Collector Endpoint Association  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function PCI_RCEC_EP_CAP_VER(reg : longint) : longint;

{ as per PCIe sec 7.9.10.1  }
const
  PCI_RCEC_BUSN_REG_VER = $02;  
{ as per PCIe sec 7.9.10.2  }
  PCI_RCEC_RCIEP_BMAP = $0004;  
{ as per PCIe sec 7.9.10.3  }
  PCI_RCEC_BUSN_REG = $0008;  
{ PCIe Vendor-Specific Capability  }
{ Vendor-Specific Header  }
  PCI_EVNDR_HEADER = 4;  
{ Vendor-Specific Registers  }
  PCI_EVNDR_REGISTERS = 8;  
{ PCIe Designated Vendor-Specific Capability  }
{ Designated Vendor-Specific Header 1  }
  PCI_DVSEC_HEADER1 = 4;  
{ Designated Vendor-Specific Header 2  }
  PCI_DVSEC_HEADER2 = 8;  
{ Designated Vendor-Specific Vendor ID for CXL  }
  PCI_DVSEC_VENDOR_ID_CXL = $1e98;  
{ Designated Vendor-Specific ID for Intel CXL  }
  PCI_DVSEC_ID_CXL = 0;  
{ PCIe CXL Designated Vendor-Specific Capabilities for Devices: Control, Status  }
{ CXL Device DVSEC Length  }
  PCI_CXL_DEV_LEN = $38;  
{ CXL Capability Register  }
  PCI_CXL_DEV_CAP = $0a;  
{ CXL.cache Protocol Support  }
  PCI_CXL_DEV_CAP_CACHE = $0001;  
{ CXL.io Protocol Support  }
  PCI_CXL_DEV_CAP_IO = $0002;  
{ CXL.mem Protocol Support  }
  PCI_CXL_DEV_CAP_MEM = $0004;  
{ CXL.mem Initializes with HW/FW Support  }
  PCI_CXL_DEV_CAP_MEM_HWINIT = $0008;  
{ CXL Number of HDM ranges  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function PCI_CXL_DEV_CAP_HDM_CNT(x : longint) : longint;

{ CXL Viral Handling Support  }
const
  PCI_CXL_DEV_CAP_VIRAL = $4000;  
{ CXL Control Register  }
  PCI_CXL_DEV_CTRL = $0c;  
{ CXL.cache Protocol Enable  }
  PCI_CXL_DEV_CTRL_CACHE = $0001;  
{ CXL.io Protocol Enable  }
  PCI_CXL_DEV_CTRL_IO = $0002;  
{ CXL.mem Protocol Enable  }
  PCI_CXL_DEV_CTRL_MEM = $0004;  
{ Snoop Filter Coverage  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function PCI_CXL_DEV_CTRL_CACHE_SF_COV(x : longint) : longint;

{ Snoop Filter Granularity  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PCI_CXL_DEV_CTRL_CACHE_SF_GRAN(x : longint) : longint;

{ CXL.cache Performance Hint on Clean Evictions  }
const
  PCI_CXL_DEV_CTRL_CACHE_CLN = $0800;  
{ CXL Viral Handling Enable  }
  PCI_CXL_DEV_CTRL_VIRAL = $4000;  
{ CXL Status Register  }
  PCI_CXL_DEV_STATUS = $0e;  
{ CXL Viral Handling Status  }
  PCI_CXL_DEV_STATUS_VIRAL = $4000;  
  PCI_CXL_DEV_STATUS2 = $12;  
  PCI_CXL_DEV_STATUS_CACHE_INV = $0001;  
{ Device Reset Complete  }
  PCI_CXL_DEV_STATUS_RC = $0002;  
{ Device Reset Error  }
  PCI_CXL_DEV_STATUS_RE = $0004;  
{ Power Management Init Complete  }
  PCI_CXL_DEV_STATUS_PMC = $8000;  
  PCI_CXL_DEV_CAP2 = $16;  
{ Cache Size Isn't Reported  }
  PCI_CXL_DEV_CAP2_CACHE_UNK = $0000;  
{ Unit Size 64K  }
  PCI_CXL_DEV_CAP2_CACHE_64K = $0001;  
{ Unit Size 1M  }
  PCI_CXL_DEV_CAP2_CACHE_1M = $0002;  
  PCI_CXL_DEV_RANGE1_SIZE_HI = $18;  
  PCI_CXL_DEV_RANGE1_SIZE_LO = $1c;  
  PCI_CXL_RANGE_VALID = $0001;  
  PCI_CXL_RANGE_ACTIVE = $0002;  
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function PCI_CXL_RANGE_TYPE(x : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PCI_CXL_RANGE_CLASS(x : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PCI_CXL_RANGE_INTERLEAVE(x : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PCI_CXL_RANGE_TIMEOUT(x : longint) : longint;

const
  PCI_CXL_DEV_RANGE1_BASE_HI = $20;  
  PCI_CXL_DEV_RANGE1_BASE_LO = $24;  
  PCI_CXL_DEV_RANGE2_SIZE_HI = $28;  
  PCI_CXL_DEV_RANGE2_SIZE_LO = $2c;  
  PCI_CXL_DEV_RANGE2_BASE_HI = $30;  
  PCI_CXL_DEV_RANGE2_BASE_LO = $34;  
{ PCIe CXL 2.0 Designated Vendor-Specific Capabilities for Ports  }
{ CXL Extensions DVSEC for Ports Length  }
  PCI_CXL_PORT_EXT_LEN = $28;  
{ Port Extension Status  }
  PCI_CXL_PORT_EXT_STATUS = $0a;  
{ Port Power Management Initialization Complete  }
  PCI_CXL_PORT_PM_INIT_COMPLETE = $1;  
{ Port Control Override  }
  PCI_CXL_PORT_CTRL = $0c;  
{ Unmask SBR  }
  PCI_CXL_PORT_UNMASK_SBR = $0001;  
{ Unmask Link Disable  }
  PCI_CXL_PORT_UNMASK_LINK = $0002;  
{ Alt Memory and ID Space Enable  }
  PCI_CXL_PORT_ALT_MEMORY = $0004;  
{ Alt BME  }
  PCI_CXL_PORT_ALT_BME = $0008;  
{ Viral Enable  }
  PCI_CXL_PORT_VIRAL_EN = $4000;  
  PCI_CXL_PORT_ALT_BUS_BASE = $e;  
  PCI_CXL_PORT_ALT_BUS_LIMIT = $f;  
  PCI_CXL_PORT_ALT_MEM_BASE = $10;  
  PCI_CXL_PORT_ALT_MEM_LIMIT = $12;  
{ PCIe CXL 2.0 Designated Vendor-Specific Capabilities for Register Locator  }
  PCI_CXL_RL_BLOCK1_LO = $0c;  
{ PCIe CXL Designated Vendor-Specific Capabilities for Global Persistent Flush  }
  PCI_CXL_GPF_DEV_LEN = $10;  
{ GPF Phase 2 Duration Register  }
  PCI_CXL_GPF_DEV_PHASE2_DUR = $0a;  
{ GPF Phase 2 Power Register  }
  PCI_CXL_GPF_DEV_PHASE2_POW = $0c;  
  PCI_CXL_GPF_DEV_1US = $0;  
  PCI_CXL_GPF_DEV_10US = $1;  
  PCI_CXL_GPF_DEV_100US = $2;  
  PCI_CXL_GPF_DEV_1MS = $3;  
  PCI_CXL_GPF_DEV_10MS = $4;  
  PCI_CXL_GPF_DEV_100MS = $5;  
  PCI_CXL_GPF_DEV_1S = $6;  
  PCI_CXL_GPF_DEV_10S = $7;  
  PCI_CXL_GPF_PORT_LEN = $10;  
{ GPF Phase 1 Control Register  }
  PCI_CXL_GPF_PORT_PHASE1_CTRL = $0c;  
{ GPF Phase 2 Control Register  }
  PCI_CXL_GPF_PORT_PHASE2_CTRL = $0e;  
  PCI_CXL_GPF_PORT_1US = $0;  
  PCI_CXL_GPF_PORT_10US = $1;  
  PCI_CXL_GPF_PORT_100US = $2;  
  PCI_CXL_GPF_PORT_1MS = $3;  
  PCI_CXL_GPF_PORT_10MS = $4;  
  PCI_CXL_GPF_PORT_100MS = $5;  
  PCI_CXL_GPF_PORT_1S = $6;  
  PCI_CXL_GPF_PORT_10S = $7;  
{ PCIe CXL Designated Vendor-Specific Capabilities for Flex Bus Port  }
  PCI_CXL_FB_LEN = $20;  
{ CXL Flex Bus Port Capability Register  }
  PCI_CXL_FB_PORT_CAP = $0a;  
{ CXL.cache Capable  }
  PCI_CXL_FB_CAP_CACHE = $0001;  
{ CXL.io Capable  }
  PCI_CXL_FB_CAP_IO = $0002;  
{ CXL.mem Capable  }
  PCI_CXL_FB_CAP_MEM = $0004;  
{ CXL 68B Flit and VH Capable  }
  PCI_CXL_FB_CAP_68B_FLIT = $0020;  
{ CXL Multi-Logical Device Capable  }
  PCI_CXL_FB_CAP_MULT_LOG_DEV = $0040;  
{ CXL Latency Optimized 256B Flit Capable  }
  PCI_CXL_FB_CAP_256B_FLIT = $2000;  
{ CXL PBR Flit Capable  }
  PCI_CXL_FB_CAP_PBR_FLIT = $4000;  
{ CXL Flex Bus Port Control Register  }
  PCI_CXL_FB_PORT_CTRL = $0c;  
{ CXL.cache Enable  }
  PCI_CXL_FB_CTRL_CACHE = $0001;  
{ CXL.io Enable  }
  PCI_CXL_FB_CTRL_IO = $0002;  
{ CXL.mem Enable  }
  PCI_CXL_FB_CTRL_MEM = $0004;  
{ CXL Sync Header Bypass Enable  }
  PCI_CXL_FB_CTRL_SYNC_HDR_BYP = $0008;  
{ Drift Buffer Enable  }
  PCI_CXL_FB_CTRL_DRFT_BUF = $0010;  
{ CXL 68B Flit and VH Enable  }
  PCI_CXL_FB_CTRL_68B_FLIT = $0020;  
{ CXL Multi Logical Device Enable  }
  PCI_CXL_FB_CTRL_MULT_LOG_DEV = $0040;  
{ Disable RCD Training  }
  PCI_CXL_FB_CTRL_RCD = $0080;  
{ Retimer1 Present  }
  PCI_CXL_FB_CTRL_RETIMER1 = $0100;  
{ Retimer2 Present  }
  PCI_CXL_FB_CTRL_RETIMER2 = $0200;  
{ CXL Latency Optimized 256B Flit Enable  }
  PCI_CXL_FB_CTRL_256B_FLIT = $2000;  
{ CXL PBR Flit Enable  }
  PCI_CXL_FB_CTRL_PBR_FLIT = $4000;  
{ CXL Flex Bus Port Status Register  }
  PCI_CXL_FB_PORT_STATUS = $0e;  
{ CXL.cache Enabled  }
  PCI_CXL_FB_STAT_CACHE = $0001;  
{ CXL.io Enabled  }
  PCI_CXL_FB_STAT_IO = $0002;  
{ CXL.mem Enabled  }
  PCI_CXL_FB_STAT_MEM = $0004;  
{ CXL Sync Header Bypass Enabled  }
  PCI_CXL_FB_STAT_SYNC_HDR_BYP = $0008;  
{ Drift Buffer Enabled  }
  PCI_CXL_FB_STAT_DRFT_BUF = $0010;  
{ CXL 68B Flit and VH Enabled  }
  PCI_CXL_FB_STAT_68B_FLIT = $0020;  
{ CXL Multi Logical Device Enabled  }
  PCI_CXL_FB_STAT_MULT_LOG_DEV = $0040;  
{ CXL Latency Optimized 256B Flit Enabled  }
  PCI_CXL_FB_STAT_256B_FLIT = $2000;  
{ CXL PBR Flit Enabled  }
  PCI_CXL_FB_STAT_PBR_FLIT = $4000;  
{ CXL Flex Bus Port Received Modified TS Data Phase1 Register  }
  PCI_CXL_FB_MOD_TS_DATA = $10;  
{ CXL Flex Bus Port Capability2 Register  }
  PCI_CXL_FB_PORT_CAP2 = $14;  
{ NOP Hint Capable  }
  PCI_CXL_FB_CAP2_NOP_HINT = $01;  
{ CXL Flex Bus Port Control2 Register  }
  PCI_CXL_FB_PORT_CTRL2 = $18;  
{ NOP Hint Enable  }
  PCI_CXL_FB_CTRL2_NOP_HINT = $01;  
{ CXL Flex Bus Port Status2 Register  }
  PCI_CXL_FB_PORT_STATUS2 = $1c;  
{ PCIe CXL Designated Vendor-Specific Capabilities for Multi-Logical Device  }
  PCI_CXL_MLD_LEN = $10;  
  PCI_CXL_MLD_NUM_LD = $a;  
  PCI_CXL_MLD_MAX_LD = $10;  
{ PCIe CXL Designated Vendor-Specific Capabilities for Non-CXL Function Map  }
  PCI_CXL_FUN_MAP_LEN = $2c;  
  PCI_CXL_FUN_MAP_REG_0 = $0c;  
  PCI_CXL_FUN_MAP_REG_1 = $10;  
  PCI_CXL_FUN_MAP_REG_2 = $14;  
  PCI_CXL_FUN_MAP_REG_3 = $18;  
  PCI_CXL_FUN_MAP_REG_4 = $1c;  
  PCI_CXL_FUN_MAP_REG_5 = $20;  
  PCI_CXL_FUN_MAP_REG_6 = $24;  
  PCI_CXL_FUN_MAP_REG_7 = $28;  
{ Access Control Services  }
{ ACS Capability Register  }
  PCI_ACS_CAP = $04;  
{ ACS Source Validation  }
  PCI_ACS_CAP_VALID = $0001;  
{ ACS Translation Blocking  }
  PCI_ACS_CAP_BLOCK = $0002;  
{ ACS P2P Request Redirect  }
  PCI_ACS_CAP_REQ_RED = $0004;  
{ ACS P2P Completion Redirect  }
  PCI_ACS_CAP_CMPLT_RED = $0008;  
{ ACS Upstream Forwarding  }
  PCI_ACS_CAP_FORWARD = $0010;  
{ ACS P2P Egress Control  }
  PCI_ACS_CAP_EGRESS = $0020;  
{ ACS Direct Translated P2P  }
  PCI_ACS_CAP_TRANS = $0040;  
{ Egress Control Vector Size  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function PCI_ACS_CAP_VECTOR(x : longint) : longint;

{ ACS Control Register  }
const
  PCI_ACS_CTRL = $06;  
{ ACS Source Validation Enable  }
  PCI_ACS_CTRL_VALID = $0001;  
{ ACS Translation Blocking Enable  }
  PCI_ACS_CTRL_BLOCK = $0002;  
{ ACS P2P Request Redirect Enable  }
  PCI_ACS_CTRL_REQ_RED = $0004;  
{ ACS P2P Completion Redirect Enable  }
  PCI_ACS_CTRL_CMPLT_RED = $0008;  
{ ACS Upstream Forwarding Enable  }
  PCI_ACS_CTRL_FORWARD = $0010;  
{ ACS P2P Egress Control Enable  }
  PCI_ACS_CTRL_EGRESS = $0020;  
{ ACS Direct Translated P2P Enable  }
  PCI_ACS_CTRL_TRANS = $0040;  
{ Egress Control Vector  }
  PCI_ACS_EGRESS_CTRL = $08;  
{ Alternative Routing-ID Interpretation  }
{ ARI Capability Register  }
  PCI_ARI_CAP = $04;  
{ MFVC Function Groups Capability  }
  PCI_ARI_CAP_MFVC = $0001;  
{ ACS Function Groups Capability  }
  PCI_ARI_CAP_ACS = $0002;  
{ Next Function Number  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function PCI_ARI_CAP_NFN(x : longint) : longint;

{ ARI Control Register  }
const
  PCI_ARI_CTRL = $06;  
{ MFVC Function Groups Enable  }
  PCI_ARI_CTRL_MFVC = $0001;  
{ ACS Function Groups Enable  }
  PCI_ARI_CTRL_ACS = $0002;  
{ Function Group  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function PCI_ARI_CTRL_FG(x : longint) : longint;

{ Address Translation Service  }
{ ATS Capability Register  }
const
  PCI_ATS_CAP = $04;  
{ Invalidate Queue Depth  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }

function PCI_ATS_CAP_IQD(x : longint) : Tx;

{ ATS Control Register  }
const
  PCI_ATS_CTRL = $06;  
{ Smallest Translation Unit  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }

function PCI_ATS_CTRL_STU(x : longint) : Tx;

{ ATS Enable  }
const
  PCI_ATS_CTRL_ENABLE = $8000;  
{ Single Root I/O Virtualization  }
{ SR-IOV Capability Register  }
  PCI_IOV_CAP = $04;  
{ VF Migration Capable  }
  PCI_IOV_CAP_VFM = $00000001;  
{ VF 10-Bit Tag Requester Supported  }
  PCI_IOV_CAP_VF_10BIT_TAG_REQ = $00000004;  
{ VF Migration Interrupt Message Number  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function PCI_IOV_CAP_IMN(x : longint) : longint;

{ SR-IOV Control Register  }
const
  PCI_IOV_CTRL = $08;  
{ VF Enable  }
  PCI_IOV_CTRL_VFE = $0001;  
{ VF Migration Enable  }
  PCI_IOV_CTRL_VFME = $0002;  
{ VF Migration Interrupt Enable  }
  PCI_IOV_CTRL_VFMIE = $0004;  
{ VF MSE  }
  PCI_IOV_CTRL_MSE = $0008;  
{ ARI Capable Hierarchy  }
  PCI_IOV_CTRL_ARI = $0010;  
{ VF 10-Bit Tag Requester Enable  }
  PCI_IOV_CTRL_VF_10BIT_TAG_REQ_EN = $0020;  
{ SR-IOV Status Register  }
  PCI_IOV_STATUS = $0a;  
{ VF Migration Status  }
  PCI_IOV_STATUS_MS = $0001;  
{ Number of VFs that are initially associated  }
  PCI_IOV_INITIALVF = $0c;  
{ Maximum number of VFs that could be associated  }
  PCI_IOV_TOTALVF = $0e;  
{ Number of VFs that are available  }
  PCI_IOV_NUMVF = $10;  
{ Function Dependency Link  }
  PCI_IOV_FDL = $12;  
{ First VF Offset  }
  PCI_IOV_OFFSET = $14;  
{ Routing ID offset from one VF to the next one  }
  PCI_IOV_STRIDE = $16;  
{ VF Device ID  }
  PCI_IOV_DID = $1a;  
{ Supported Page Sizes  }
  PCI_IOV_SUPPS = $1c;  
{ System Page Size  }
  PCI_IOV_SYSPS = $20;  
{ VF BAR0, VF BAR1, ... VF BAR5  }
  PCI_IOV_BAR_BASE = $24;  
{ Number of VF BARs  }
  PCI_IOV_NUM_BAR = 6;  
{ VF Migration State Array Offset  }
  PCI_IOV_MSAO = $3c;  
{ VF Migration State BIR  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }

function PCI_IOV_MSA_BIR(x : longint) : Tx;

{ VF Migration State Offset  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function PCI_IOV_MSA_OFFSET(x : longint) : Tx;

{ Multicast  }
{ Multicast Capability  }
const
  PCI_MCAST_CAP = $04;  
{ was #define dname(params) para_def_expr }
{ argument types are unknown }

function PCI_MCAST_CAP_MAX_GROUP(x : longint) : Tx;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PCI_MCAST_CAP_WIN_SIZE(x : longint) : longint;

{ ECRC Regeneration Supported  }
const
  PCI_MCAST_CAP_ECRC = $8000;  
{ Multicast Control  }
  PCI_MCAST_CTRL = $06;  
{ was #define dname(params) para_def_expr }
{ argument types are unknown }

function PCI_MCAST_CTRL_NUM_GROUP(x : longint) : Tx;

{ MC Enabled  }
const
  PCI_MCAST_CTRL_ENABLE = $8000;  
{ Base Address  }
  PCI_MCAST_BAR = $08;  
{ was #define dname(params) para_def_expr }
{ argument types are unknown }

function PCI_MCAST_BAR_INDEX_POS(x : longint) : Tu32;

const
  PCI_MCAST_BAR_MASK =  not ($fff);  
{ Receive  }
  PCI_MCAST_RCV = $10;  
{ Block All  }
  PCI_MCAST_BLOCK = $18;  
{ Block Untranslated  }
  PCI_MCAST_BLOCK_UNTRANS = $20;  
{ Overlay BAR  }
  PCI_MCAST_OVL_BAR = $28;  
{ was #define dname(params) para_def_expr }
{ argument types are unknown }

function PCI_MCAST_OVL_SIZE(x : longint) : Tu32;

const
  PCI_MCAST_OVL_MASK =  not ($3f);  
{ Page Request Interface  }
{ PRI Control Register  }
  PCI_PRI_CTRL = $04;  
{ Enable  }
  PCI_PRI_CTRL_ENABLE = $01;  
{ Reset  }
  PCI_PRI_CTRL_RESET = $02;  
{ PRI status register  }
  PCI_PRI_STATUS = $06;  
{ Response Failure  }
  PCI_PRI_STATUS_RF = $001;  
{ Unexpected PRG index  }
  PCI_PRI_STATUS_UPRGI = $002;  
{ PRI Stopped  }
  PCI_PRI_STATUS_STOPPED = $100;  
{ PRI max reqs supported  }
  PCI_PRI_MAX_REQ = $08;  
{ PRI max reqs allowed  }
  PCI_PRI_ALLOC_REQ = $0c;  
{ Transaction Processing Hints  }
  PCI_TPH_CAPABILITIES = 4;  
{ Supports interrupt vector mode  }
  PCI_TPH_INTVEC_SUP = 1 shl 1;  
{ Device specific mode supported  }
  PCI_TPH_DEV_SUP = 1 shl 2;  
{ Supports extended requests  }
  PCI_TPH_EXT_REQ_SUP = 1 shl 8;  
{ Steering table location bits  }
  PCI_TPH_ST_LOC_MASK = 3 shl 9;  
{ No steering table  }
  PCI_TPH_ST_NONE = 0 shl 9;  
{ Steering table in TPH cap  }
  PCI_TPH_ST_CAP = 1 shl 9;  
{ Steering table in MSI-X table  }
  PCI_TPH_ST_MSIX = 2 shl 9;  
{ Encoded as size - 1  }
  PCI_TPH_ST_SIZE_SHIFT = 16;  
{ Latency Tolerance Reporting  }
{ 16 bit value  }
  PCI_LTR_MAX_SNOOP = 4;  
  PCI_LTR_VALUE_MASK = $3ff;  
  PCI_LTR_SCALE_SHIFT = 10;  
  PCI_LTR_SCALE_MASK = 7;  
{ 16 bit value  }
  PCI_LTR_MAX_NOSNOOP = 6;  
{ Secondary PCI Express Extended Capability  }
{ Link Control 3 register  }
  PCI_SEC_LNKCTL3 = 4;  
  PCI_SEC_LNKCTL3_PERFORM_LINK_EQU = $01;  
  PCI_SEC_LNKCTL3_LNK_EQU_REQ_INTR_EN = $02;  
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function PCI_SEC_LNKCTL3_ENBL_LOWER_SKP_OS_GEN_VEC(x : longint) : longint;

{ Lane Error status register  }
const
  PCI_SEC_LANE_ERR = 8;  
{ Lane Equalization control register  }
  PCI_SEC_LANE_EQU_CTRL = 12;  
{ Process Address Space ID  }
{ PASID feature register  }
  PCI_PASID_CAP = $04;  
{ Exec permissions Supported  }
  PCI_PASID_CAP_EXEC = $02;  
{ Privilege Mode Supported  }
  PCI_PASID_CAP_PRIV = $04;  
{ Max PASID Width  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function PCI_PASID_CAP_WIDTH(x : longint) : longint;

{ PASID control register  }
const
  PCI_PASID_CTRL = $06;  
{ Enable bit  }
  PCI_PASID_CTRL_ENABLE = $01;  
{ Exec permissions Enable  }
  PCI_PASID_CTRL_EXEC = $02;  
{ Privilege Mode Enable  }
  PCI_PASID_CTRL_PRIV = $04;  
{ DPC Capability  }
  PCI_DPC_CAP = 4;  
{ DPC Interrupt Message Number  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }

function PCI_DPC_CAP_INT_MSG(x : longint) : Tx;

{ DPC Root Port Extensions  }
const
  PCI_DPC_CAP_RP_EXT = $20;  
{ DPC Poisoned TLP Egress Blocking  }
  PCI_DPC_CAP_TLP_BLOCK = $40;  
{ DPC Software Trigger  }
  PCI_DPC_CAP_SW_TRIGGER = $80;  
{ DPC RP PIO Log Size  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function PCI_DPC_CAP_RP_LOG(x : longint) : longint;

{ DPC DL_Active ERR_COR Signal  }
const
  PCI_DPC_CAP_DL_ACT_ERR = $1000;  
{ DPC Control  }
  PCI_DPC_CTL = 6;  
{ DPC Trigger Enable  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }

function PCI_DPC_CTL_TRIGGER(x : longint) : Tx;

{ DPC Completion Control  }
const
  PCI_DPC_CTL_CMPL = $4;  
{ DPC Interrupt Enabled  }
  PCI_DPC_CTL_INT = $8;  
{ DPC ERR_COR Enabled  }
  PCI_DPC_CTL_ERR_COR = $10;  
{ DPC Poisoned TLP Egress Blocking Enabled  }
  PCI_DPC_CTL_TLP = $20;  
{ DPC Software Trigger  }
  PCI_DPC_CTL_SW_TRIGGER = $40;  
{ DPC DL_Active ERR_COR Enable  }
  PCI_DPC_CTL_DL_ACTIVE = $80;  
{ DPC STATUS  }
  PCI_DPC_STATUS = 8;  
{ DPC Trigger Status  }
  PCI_DPC_STS_TRIGGER = $01;  
{ DPC Trigger Reason  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function PCI_DPC_STS_REASON(x : longint) : longint;

{ DPC Interrupt Status  }
const
  PCI_DPC_STS_INT = $08;  
{ DPC Root Port Busy  }
  PCI_DPC_STS_RP_BUSY = $10;  
{ Trigger Reason Extension  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function PCI_DPC_STS_TRIGGER_EXT(x : longint) : longint;

{ DPC PIO First Error Pointer  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PCI_DPC_STS_PIO_FEP(x : longint) : longint;

{ DPC Source ID  }
const
  PCI_DPC_SOURCE = 10;  
{ L1 PM Substates Extended Capability  }
{ L1 PM Substate Capability  }
  PCI_L1PM_SUBSTAT_CAP = $4;  
{ PCI-PM L1.2 Supported  }
  PCI_L1PM_SUBSTAT_CAP_PM_L12 = $1;  
{ PCI-PM L1.1 Supported  }
  PCI_L1PM_SUBSTAT_CAP_PM_L11 = $2;  
{ ASPM L1.2 Supported  }
  PCI_L1PM_SUBSTAT_CAP_ASPM_L12 = $4;  
{ ASPM L1.1 Supported  }
  PCI_L1PM_SUBSTAT_CAP_ASPM_L11 = $8;  
{ L1 PM Substates supported  }
  PCI_L1PM_SUBSTAT_CAP_L1PM_SUPP = $10;  
{ L1 PM Substate Control 1  }
  PCI_L1PM_SUBSTAT_CTL1 = $8;  
{ PCI-PM L1.2 Enable  }
  PCI_L1PM_SUBSTAT_CTL1_PM_L12 = $1;  
{ PCI-PM L1.1 Enable  }
  PCI_L1PM_SUBSTAT_CTL1_PM_L11 = $2;  
{ ASPM L1.2 Enable  }
  PCI_L1PM_SUBSTAT_CTL1_ASPM_L12 = $4;  
{ ASPM L1.1 Enable  }
  PCI_L1PM_SUBSTAT_CTL1_ASPM_L11 = $8;  
{ L1 PM Substate Control 2  }
  PCI_L1PM_SUBSTAT_CTL2 = $C;  
{ Data Object Exchange Extended Capability  }
{ DOE Capabilities Register  }
  PCI_DOE_CAP = $4;  
{ Interrupt Support  }
  PCI_DOE_CAP_INT_SUPP = $1;  
{ DOE Interrupt Message Number  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function PCI_DOE_CAP_INT_MSG(x : longint) : longint;

{ DOE Control Register  }
const
  PCI_DOE_CTL = $8;  
{ DOE Abort  }
  PCI_DOE_CTL_ABORT = $1;  
{ DOE Interrupt Enable  }
  PCI_DOE_CTL_INT = $2;  
{ DOE Go  }
  PCI_DOE_CTL_GO = $80000000;  
{ DOE Status Register  }
  PCI_DOE_STS = $C;  
{ DOE Busy  }
  PCI_DOE_STS_BUSY = $1;  
{ DOE Interrupt Status  }
  PCI_DOE_STS_INT = $2;  
{ DOE Error  }
  PCI_DOE_STS_ERROR = $3;  
{ Data Object Ready  }
  PCI_DOE_STS_OBJECT_READY = $80000000;  
{
 * The PCI interface treats multi-function devices as independent
 * devices.  The slot/function address of each device is encoded
 * in a single byte as follows:
 *
 *	7:3 = slot
 *	2:0 = function
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function PCI_DEVFN(slot,func : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PCI_SLOT(devfn : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function PCI_FUNC(devfn : longint) : Tdevfn;

{ Device classes and subclasses  }
const
  PCI_CLASS_NOT_DEFINED = $0000;  
  PCI_CLASS_NOT_DEFINED_VGA = $0001;  
  PCI_BASE_CLASS_STORAGE = $01;  
  PCI_CLASS_STORAGE_SCSI = $0100;  
  PCI_CLASS_STORAGE_IDE = $0101;  
  PCI_CLASS_STORAGE_FLOPPY = $0102;  
  PCI_CLASS_STORAGE_IPI = $0103;  
  PCI_CLASS_STORAGE_RAID = $0104;  
  PCI_CLASS_STORAGE_ATA = $0105;  
  PCI_CLASS_STORAGE_SATA = $0106;  
  PCI_CLASS_STORAGE_SAS = $0107;  
  PCI_CLASS_STORAGE_OTHER = $0180;  
  PCI_BASE_CLASS_NETWORK = $02;  
  PCI_CLASS_NETWORK_ETHERNET = $0200;  
  PCI_CLASS_NETWORK_TOKEN_RING = $0201;  
  PCI_CLASS_NETWORK_FDDI = $0202;  
  PCI_CLASS_NETWORK_ATM = $0203;  
  PCI_CLASS_NETWORK_ISDN = $0204;  
  PCI_CLASS_NETWORK_OTHER = $0280;  
  PCI_BASE_CLASS_DISPLAY = $03;  
  PCI_CLASS_DISPLAY_VGA = $0300;  
  PCI_CLASS_DISPLAY_XGA = $0301;  
  PCI_CLASS_DISPLAY_3D = $0302;  
  PCI_CLASS_DISPLAY_OTHER = $0380;  
  PCI_BASE_CLASS_MULTIMEDIA = $04;  
  PCI_CLASS_MULTIMEDIA_VIDEO = $0400;  
  PCI_CLASS_MULTIMEDIA_AUDIO = $0401;  
  PCI_CLASS_MULTIMEDIA_PHONE = $0402;  
  PCI_CLASS_MULTIMEDIA_AUDIO_DEV = $0403;  
  PCI_CLASS_MULTIMEDIA_OTHER = $0480;  
  PCI_BASE_CLASS_MEMORY = $05;  
  PCI_CLASS_MEMORY_RAM = $0500;  
  PCI_CLASS_MEMORY_FLASH = $0501;  
  PCI_CLASS_MEMORY_OTHER = $0580;  
  PCI_BASE_CLASS_BRIDGE = $06;  
  PCI_CLASS_BRIDGE_HOST = $0600;  
  PCI_CLASS_BRIDGE_ISA = $0601;  
  PCI_CLASS_BRIDGE_EISA = $0602;  
  PCI_CLASS_BRIDGE_MC = $0603;  
  PCI_CLASS_BRIDGE_PCI = $0604;  
  PCI_CLASS_BRIDGE_PCMCIA = $0605;  
  PCI_CLASS_BRIDGE_NUBUS = $0606;  
  PCI_CLASS_BRIDGE_CARDBUS = $0607;  
  PCI_CLASS_BRIDGE_RACEWAY = $0608;  
  PCI_CLASS_BRIDGE_PCI_SEMI = $0609;  
  PCI_CLASS_BRIDGE_IB_TO_PCI = $060a;  
  PCI_CLASS_BRIDGE_OTHER = $0680;  
  PCI_BASE_CLASS_COMMUNICATION = $07;  
  PCI_CLASS_COMMUNICATION_SERIAL = $0700;  
  PCI_CLASS_COMMUNICATION_PARALLEL = $0701;  
  PCI_CLASS_COMMUNICATION_MSERIAL = $0702;  
  PCI_CLASS_COMMUNICATION_MODEM = $0703;  
  PCI_CLASS_COMMUNICATION_OTHER = $0780;  
  PCI_BASE_CLASS_SYSTEM = $08;  
  PCI_CLASS_SYSTEM_PIC = $0800;  
  PCI_CLASS_SYSTEM_DMA = $0801;  
  PCI_CLASS_SYSTEM_TIMER = $0802;  
  PCI_CLASS_SYSTEM_RTC = $0803;  
  PCI_CLASS_SYSTEM_PCI_HOTPLUG = $0804;  
  PCI_CLASS_SYSTEM_OTHER = $0880;  
  PCI_BASE_CLASS_INPUT = $09;  
  PCI_CLASS_INPUT_KEYBOARD = $0900;  
  PCI_CLASS_INPUT_PEN = $0901;  
  PCI_CLASS_INPUT_MOUSE = $0902;  
  PCI_CLASS_INPUT_SCANNER = $0903;  
  PCI_CLASS_INPUT_GAMEPORT = $0904;  
  PCI_CLASS_INPUT_OTHER = $0980;  
  PCI_BASE_CLASS_DOCKING = $0a;  
  PCI_CLASS_DOCKING_GENERIC = $0a00;  
  PCI_CLASS_DOCKING_OTHER = $0a80;  
  PCI_BASE_CLASS_PROCESSOR = $0b;  
  PCI_CLASS_PROCESSOR_386 = $0b00;  
  PCI_CLASS_PROCESSOR_486 = $0b01;  
  PCI_CLASS_PROCESSOR_PENTIUM = $0b02;  
  PCI_CLASS_PROCESSOR_ALPHA = $0b10;  
  PCI_CLASS_PROCESSOR_POWERPC = $0b20;  
  PCI_CLASS_PROCESSOR_MIPS = $0b30;  
  PCI_CLASS_PROCESSOR_CO = $0b40;  
  PCI_BASE_CLASS_SERIAL = $0c;  
  PCI_CLASS_SERIAL_FIREWIRE = $0c00;  
  PCI_CLASS_SERIAL_ACCESS = $0c01;  
  PCI_CLASS_SERIAL_SSA = $0c02;  
  PCI_CLASS_SERIAL_USB = $0c03;  
  PCI_CLASS_SERIAL_FIBER = $0c04;  
  PCI_CLASS_SERIAL_SMBUS = $0c05;  
  PCI_CLASS_SERIAL_INFINIBAND = $0c06;  
  PCI_BASE_CLASS_WIRELESS = $0d;  
  PCI_CLASS_WIRELESS_IRDA = $0d00;  
  PCI_CLASS_WIRELESS_CONSUMER_IR = $0d01;  
  PCI_CLASS_WIRELESS_RF = $0d10;  
  PCI_CLASS_WIRELESS_OTHER = $0d80;  
  PCI_BASE_CLASS_INTELLIGENT = $0e;  
  PCI_CLASS_INTELLIGENT_I2O = $0e00;  
  PCI_BASE_CLASS_SATELLITE = $0f;  
  PCI_CLASS_SATELLITE_TV = $0f00;  
  PCI_CLASS_SATELLITE_AUDIO = $0f01;  
  PCI_CLASS_SATELLITE_VOICE = $0f03;  
  PCI_CLASS_SATELLITE_DATA = $0f04;  
  PCI_BASE_CLASS_CRYPT = $10;  
  PCI_CLASS_CRYPT_NETWORK = $1000;  
  PCI_CLASS_CRYPT_ENTERTAINMENT = $1010;  
  PCI_CLASS_CRYPT_OTHER = $1080;  
  PCI_BASE_CLASS_SIGNAL = $11;  
  PCI_CLASS_SIGNAL_DPIO = $1100;  
  PCI_CLASS_SIGNAL_PERF_CTR = $1101;  
  PCI_CLASS_SIGNAL_SYNCHRONIZER = $1110;  
  PCI_CLASS_SIGNAL_OTHER = $1180;  
  PCI_CLASS_OTHERS = $ff;  
{ Several ID's we need in the library  }
  PCI_VENDOR_ID_INTEL = $8086;  
  PCI_VENDOR_ID_COMPAQ = $0e11;  
{ I/O resource flags, compatible with <include/linux/ioport.h>  }
  PCI_IORESOURCE_TYPE_BITS = $00001f00;  
  PCI_IORESOURCE_IO = $00000100;  
  PCI_IORESOURCE_MEM = $00000200;  
  PCI_IORESOURCE_PREFETCH = $00002000;  
  PCI_IORESOURCE_MEM_64 = $00100000;  
  PCI_IORESOURCE_IO_16BIT_ADDR = 1 shl 0;  
  PCI_IORESOURCE_PCI_EA_BEI = 1 shl 5;  

// === Konventiert am: 28-6-25 19:49:13 ===


implementation


{ was #define dname def_expr }
function PCI_BASE_ADDRESS_MEM_MASK : longint; { return type might be wrong }
  begin
    PCI_BASE_ADDRESS_MEM_MASK:= not (Tpciaddr_t($0f));
  end;

{ was #define dname def_expr }
function PCI_BASE_ADDRESS_IO_MASK : longint; { return type might be wrong }
  begin
    PCI_BASE_ADDRESS_IO_MASK:= not (Tpciaddr_t($03));
  end;

{ was #define dname def_expr }
function PCI_ROM_ADDRESS_MASK : longint; { return type might be wrong }
  begin
    PCI_ROM_ADDRESS_MASK:= not (Tpciaddr_t($7ff));
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function PCI_EXP_DEVCAP2_TIMEOUT_RANGE(x : longint) : Tx;
begin
  PCI_EXP_DEVCAP2_TIMEOUT_RANGE:=Tx(@($f));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PCI_EXP_DEVCAP2_TPH_COMP(x : longint) : longint;
begin
  PCI_EXP_DEVCAP2_TPH_COMP:=(x shr 12) and 3;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PCI_EXP_DEVCAP2_LN_CLS(x : longint) : longint;
begin
  PCI_EXP_DEVCAP2_LN_CLS:=(x shr 14) and 3;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PCI_EXP_DEVCAP2_OBFF(x : longint) : longint;
begin
  PCI_EXP_DEVCAP2_OBFF:=(x shr 18) and 3;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PCI_EXP_DEVCAP2_MEE_TLP(x : longint) : longint;
begin
  PCI_EXP_DEVCAP2_MEE_TLP:=(x shr 22) and 3;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PCI_EXP_DEVCAP2_EPR(x : longint) : longint;
begin
  PCI_EXP_DEVCAP2_EPR:=(x shr 24) and 3;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function PCI_EXP_DEVCTL2_TIMEOUT_VALUE(x : longint) : Tx;
begin
  PCI_EXP_DEVCTL2_TIMEOUT_VALUE:=Tx(@($f));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PCI_EXP_DEVCTL2_OBFF(x : longint) : longint;
begin
  PCI_EXP_DEVCTL2_OBFF:=(x shr 13) and 3;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PCI_EXP_LNKCAP2_SPEED(x : longint) : longint;
begin
  PCI_EXP_LNKCAP2_SPEED:=(x shr 1) and $7f;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function PCI_EXP_LNKCTL2_SPEED(x : longint) : Tx;
begin
  PCI_EXP_LNKCTL2_SPEED:=Tx(@($f));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PCI_EXP_LNKCTL2_DEEMPHASIS(x : longint) : longint;
begin
  PCI_EXP_LNKCTL2_DEEMPHASIS:=(x shr 6) and 1;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PCI_EXP_LNKCTL2_MARGIN(x : longint) : longint;
begin
  PCI_EXP_LNKCTL2_MARGIN:=(x shr 7) and 7;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PCI_EXP_LNKCTL2_COM_DEEMPHASIS(x : longint) : longint;
begin
  PCI_EXP_LNKCTL2_COM_DEEMPHASIS:=(x shr 12) and $f;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function PCI_EXP_LINKSTA2_DEEMPHASIS(x : longint) : Tx;
begin
  PCI_EXP_LINKSTA2_DEEMPHASIS:=Tx(@(1));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PCI_EXP_LINKSTA2_CROSSLINK(x : longint) : longint;
begin
  PCI_EXP_LINKSTA2_CROSSLINK:=(x shr 8) and $3;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PCI_EXP_LINKSTA2_COMPONENT(x : longint) : longint;
begin
  PCI_EXP_LINKSTA2_COMPONENT:=(x shr 12) and $7;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function PCI_ERR_CAP_FEP(x : longint) : Tx;
begin
  PCI_ERR_CAP_FEP:=Tx(@(31));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PCI_ERR_MSG_NUM(x : longint) : longint;
begin
  PCI_ERR_MSG_NUM:=(x shr 27) and $1f;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function PCI_PWR_DATA_BASE(x : longint) : Tx;
begin
  PCI_PWR_DATA_BASE:=Tx(@($ff));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PCI_PWR_DATA_SCALE(x : longint) : longint;
begin
  PCI_PWR_DATA_SCALE:=(x shr 8) and 3;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PCI_PWR_DATA_PM_SUB(x : longint) : longint;
begin
  PCI_PWR_DATA_PM_SUB:=(x shr 10) and 7;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PCI_PWR_DATA_PM_STATE(x : longint) : longint;
begin
  PCI_PWR_DATA_PM_STATE:=(x shr 13) and 3;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PCI_PWR_DATA_TYPE(x : longint) : longint;
begin
  PCI_PWR_DATA_TYPE:=(x shr 15) and 7;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PCI_PWR_DATA_RAIL(x : longint) : longint;
begin
  PCI_PWR_DATA_RAIL:=(x shr 18) and 7;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function PCI_PWR_CAP_BUDGET(x : longint) : Tx;
begin
  PCI_PWR_CAP_BUDGET:=Tx(@(1));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PCI_RCEC_EP_CAP_VER(reg : longint) : longint;
begin
  PCI_RCEC_EP_CAP_VER:=(reg shr 16) and $f;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PCI_CXL_DEV_CAP_HDM_CNT(x : longint) : longint;
begin
  PCI_CXL_DEV_CAP_HDM_CNT:=(Tx(@(3 shl 4))) shr 4;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PCI_CXL_DEV_CTRL_CACHE_SF_COV(x : longint) : longint;
begin
  PCI_CXL_DEV_CTRL_CACHE_SF_COV:=(Tx(@($1f shl 3))) shr 3;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PCI_CXL_DEV_CTRL_CACHE_SF_GRAN(x : longint) : longint;
begin
  PCI_CXL_DEV_CTRL_CACHE_SF_GRAN:=(Tx(@($7 shl 8))) shr 8;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PCI_CXL_RANGE_TYPE(x : longint) : longint;
begin
  PCI_CXL_RANGE_TYPE:=(x shr 2) and $7;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PCI_CXL_RANGE_CLASS(x : longint) : longint;
begin
  PCI_CXL_RANGE_CLASS:=(x shr 5) and $7;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PCI_CXL_RANGE_INTERLEAVE(x : longint) : longint;
begin
  PCI_CXL_RANGE_INTERLEAVE:=(x shr 8) and $1f;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PCI_CXL_RANGE_TIMEOUT(x : longint) : longint;
begin
  PCI_CXL_RANGE_TIMEOUT:=(x shr 13) and $7;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PCI_ACS_CAP_VECTOR(x : longint) : longint;
begin
  PCI_ACS_CAP_VECTOR:=(x shr 8) and $ff;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PCI_ARI_CAP_NFN(x : longint) : longint;
begin
  PCI_ARI_CAP_NFN:=(x shr 8) and $ff;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PCI_ARI_CTRL_FG(x : longint) : longint;
begin
  PCI_ARI_CTRL_FG:=(x shr 4) and 7;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function PCI_ATS_CAP_IQD(x : longint) : Tx;
begin
  PCI_ATS_CAP_IQD:=Tx(@($1f));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function PCI_ATS_CTRL_STU(x : longint) : Tx;
begin
  PCI_ATS_CTRL_STU:=Tx(@($1f));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PCI_IOV_CAP_IMN(x : longint) : longint;
begin
  PCI_IOV_CAP_IMN:=x shr 21;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function PCI_IOV_MSA_BIR(x : longint) : Tx;
begin
  PCI_IOV_MSA_BIR:=Tx(@(7));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function PCI_IOV_MSA_OFFSET(x : longint) : Tx;
begin
  PCI_IOV_MSA_OFFSET:=Tx(@($fffffff8));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function PCI_MCAST_CAP_MAX_GROUP(x : longint) : Tx;
begin
  PCI_MCAST_CAP_MAX_GROUP:=Tx(@($3f));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PCI_MCAST_CAP_WIN_SIZE(x : longint) : longint;
begin
  PCI_MCAST_CAP_WIN_SIZE:=(x shr 8) and $3f;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function PCI_MCAST_CTRL_NUM_GROUP(x : longint) : Tx;
begin
  PCI_MCAST_CTRL_NUM_GROUP:=Tx(@($3f));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function PCI_MCAST_BAR_INDEX_POS(x : longint) : Tu32;
begin
  PCI_MCAST_BAR_INDEX_POS:=Tu32(Tx(@($3f)));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function PCI_MCAST_OVL_SIZE(x : longint) : Tu32;
begin
  PCI_MCAST_OVL_SIZE:=Tu32(Tx(@($3f)));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PCI_SEC_LNKCTL3_ENBL_LOWER_SKP_OS_GEN_VEC(x : longint) : longint;
begin
  PCI_SEC_LNKCTL3_ENBL_LOWER_SKP_OS_GEN_VEC:=(x shr 8) and $7F;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PCI_PASID_CAP_WIDTH(x : longint) : longint;
begin
  PCI_PASID_CAP_WIDTH:=(x shr 8) and $1f;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function PCI_DPC_CAP_INT_MSG(x : longint) : Tx;
begin
  PCI_DPC_CAP_INT_MSG:=Tx(@($1f));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PCI_DPC_CAP_RP_LOG(x : longint) : longint;
begin
  PCI_DPC_CAP_RP_LOG:=(x shr 8) and $f;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function PCI_DPC_CTL_TRIGGER(x : longint) : Tx;
begin
  PCI_DPC_CTL_TRIGGER:=Tx(@($3));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PCI_DPC_STS_REASON(x : longint) : longint;
begin
  PCI_DPC_STS_REASON:=(x shr 1) and $3;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PCI_DPC_STS_TRIGGER_EXT(x : longint) : longint;
begin
  PCI_DPC_STS_TRIGGER_EXT:=(x shr 5) and $3;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PCI_DPC_STS_PIO_FEP(x : longint) : longint;
begin
  PCI_DPC_STS_PIO_FEP:=(x shr 8) and $1f;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PCI_DOE_CAP_INT_MSG(x : longint) : longint;
begin
  PCI_DOE_CAP_INT_MSG:=(x shr 1) and $7ff;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PCI_DEVFN(slot,func : longint) : longint;
begin
  PCI_DEVFN:=((Tslot(@($1f))) shl 3) or (Tfunc(@($07)));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PCI_SLOT(devfn : longint) : longint;
begin
  PCI_SLOT:=(devfn shr 3) and $1f;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function PCI_FUNC(devfn : longint) : Tdevfn;
begin
  PCI_FUNC:=Tdevfn(@($07));
end;


end.
