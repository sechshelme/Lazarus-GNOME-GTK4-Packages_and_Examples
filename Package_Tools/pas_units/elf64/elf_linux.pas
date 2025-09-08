unit elf_linux;

interface

uses
  fp_tcod;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}

// /usr/include/linux/elf.h


{ SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note  }
{$ifndef _LINUX_ELF_H}
{$define _LINUX_ELF_H}
{$include <linux/types.h>}
{$include <linux/elf-em.h>}
{ 32-bit ELF base types.  }
type
  PElf32_Addr = ^TElf32_Addr;
  TElf32_Addr = Tu32;

  PElf32_Half = ^TElf32_Half;
  TElf32_Half = Tu16;

  PElf32_Off = ^TElf32_Off;
  TElf32_Off = Tu32;

  PElf32_Sword = ^TElf32_Sword;
  TElf32_Sword = Ts32;

  PElf32_Word = ^TElf32_Word;
  TElf32_Word = Tu32;
{ 64-bit ELF base types.  }

  PElf64_Addr = ^TElf64_Addr;
  TElf64_Addr = Tu64;

  PElf64_Half = ^TElf64_Half;
  TElf64_Half = Tu16;

  PElf64_SHalf = ^TElf64_SHalf;
  TElf64_SHalf = Ts16;

  PElf64_Off = ^TElf64_Off;
  TElf64_Off = Tu64;

  PElf64_Sword = ^TElf64_Sword;
  TElf64_Sword = Ts32;

  PElf64_Word = ^TElf64_Word;
  TElf64_Word = Tu32;

  PElf64_Xword = ^TElf64_Xword;
  TElf64_Xword = Tu64;

  PElf64_Sxword = ^TElf64_Sxword;
  TElf64_Sxword = Ts64;
{ These constants are for the segment types stored in the image headers  }

const
  PT_NULL = 0;  
  PT_LOAD = 1;  
  PT_DYNAMIC = 2;  
  PT_INTERP = 3;  
  PT_NOTE = 4;  
  PT_SHLIB = 5;  
  PT_PHDR = 6;  
{ Thread local storage segment  }
  PT_TLS = 7;  
{ OS-specific  }
  PT_LOOS = $60000000;  
{ OS-specific  }
  PT_HIOS = $6fffffff;  
  PT_LOPROC = $70000000;  
  PT_HIPROC = $7fffffff;  
  PT_GNU_EH_FRAME = PT_LOOS+$474e550;  
  PT_GNU_STACK = PT_LOOS+$474e551;  
  PT_GNU_RELRO = PT_LOOS+$474e552;  
  PT_GNU_PROPERTY = PT_LOOS+$474e553;  
{ ARM MTE memory tag segment type  }
  PT_AARCH64_MEMTAG_MTE = PT_LOPROC+$2;  
{
 * Extended Numbering
 *
 * If the real number of program header table entries is larger than
 * or equal to PN_XNUM(0xffff), it is set to sh_info field of the
 * section header at index 0, and PN_XNUM is set to e_phnum
 * field. Otherwise, the section header at index 0 is zero
 * initialized, if it exists.
 *
 * Specifications are available in:
 *
 * - Oracle: Linker and Libraries.
 *   Part No: 817–1984–19, August 2011.
 *   https://docs.oracle.com/cd/E18752_01/pdf/817-1984.pdf
 *
 * - System V ABI AMD64 Architecture Processor Supplement
 *   Draft Version 0.99.4,
 *   January 13, 2010.
 *   http://www.cs.washington.edu/education/courses/cse351/12wi/supp-docs/abi.pdf
  }
  PN_XNUM = $ffff;  
{ These constants define the different elf file types  }
  ET_NONE = 0;  
  ET_REL = 1;  
  ET_EXEC = 2;  
  ET_DYN = 3;  
  ET_CORE = 4;  
  ET_LOPROC = $ff00;  
  ET_HIPROC = $ffff;  
{ This is the info that is needed to parse the dynamic section of the file  }
  DT_NULL = 0;  
  DT_NEEDED = 1;  
  DT_PLTRELSZ = 2;  
  DT_PLTGOT = 3;  
  DT_HASH = 4;  
  DT_STRTAB = 5;  
  DT_SYMTAB = 6;  
  DT_RELA = 7;  
  DT_RELASZ = 8;  
  DT_RELAENT = 9;  
  DT_STRSZ = 10;  
  DT_SYMENT = 11;  
  DT_INIT = 12;  
  DT_FINI = 13;  
  DT_SONAME = 14;  
  DT_RPATH = 15;  
  DT_SYMBOLIC = 16;  
  DT_REL = 17;  
  DT_RELSZ = 18;  
  DT_RELENT = 19;  
  DT_PLTREL = 20;  
  DT_DEBUG = 21;  
  DT_TEXTREL = 22;  
  DT_JMPREL = 23;  
  DT_ENCODING = 32;  
  OLD_DT_LOOS = $60000000;  
  DT_LOOS = $6000000d;  
  DT_HIOS = $6ffff000;  
  DT_VALRNGLO = $6ffffd00;  
  DT_VALRNGHI = $6ffffdff;  
  DT_ADDRRNGLO = $6ffffe00;  
  DT_ADDRRNGHI = $6ffffeff;  
  DT_VERSYM = $6ffffff0;  
  DT_RELACOUNT = $6ffffff9;  
  DT_RELCOUNT = $6ffffffa;  
  DT_FLAGS_1 = $6ffffffb;  
  DT_VERDEF = $6ffffffc;  
  DT_VERDEFNUM = $6ffffffd;  
  DT_VERNEED = $6ffffffe;  
  DT_VERNEEDNUM = $6fffffff;  
  OLD_DT_HIOS = $6fffffff;  
  DT_LOPROC = $70000000;  
  DT_HIPROC = $7fffffff;  
{ This info is needed when parsing the symbol table  }
  STB_LOCAL = 0;  
  STB_GLOBAL = 1;  
  STB_WEAK = 2;  
  STT_NOTYPE = 0;  
  STT_OBJECT = 1;  
  STT_FUNC = 2;  
  STT_SECTION = 3;  
  STT_FILE = 4;  
  STT_COMMON = 5;  
  STT_TLS = 6;  
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function ELF_ST_BIND(x : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function ELF_ST_TYPE(x : longint) : Tx;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ELF32_ST_BIND(x : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ELF32_ST_TYPE(x : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ELF64_ST_BIND(x : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ELF64_ST_TYPE(x : longint) : longint;

type
  PElf32_Dyn = ^TElf32_Dyn;
  TElf32_Dyn = record
      d_tag : TElf32_Sword;
      d_un : record
          case longint of
            0 : ( d_val : TElf32_Sword );
            1 : ( d_ptr : TElf32_Addr );
          end;
    end;
{ entry tag value  }

  PElf64_Dyn = ^TElf64_Dyn;
  TElf64_Dyn = record
      d_tag : TElf64_Sxword;
      d_un : record
          case longint of
            0 : ( d_val : TElf64_Xword );
            1 : ( d_ptr : TElf64_Addr );
          end;
    end;
{ The following are used with relocations  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function ELF32_R_SYM(x : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function ELF32_R_TYPE(x : longint) : Tx;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ELF64_R_SYM(i : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function ELF64_R_TYPE(i : longint) : Ti;

type
  Pelf32_rel = ^Telf32_rel;
  Telf32_rel = record
      r_offset : TElf32_Addr;
      r_info : TElf32_Word;
    end;
{ Location at which to apply the action  }
{ index and type of relocation  }

  Pelf64_rel = ^Telf64_rel;
  Telf64_rel = record
      r_offset : TElf64_Addr;
      r_info : TElf64_Xword;
    end;

  Pelf32_rela = ^Telf32_rela;
  Telf32_rela = record
      r_offset : TElf32_Addr;
      r_info : TElf32_Word;
      r_addend : TElf32_Sword;
    end;
{ Location at which to apply the action  }
{ index and type of relocation  }
{ Constant addend used to compute value  }

  Pelf64_rela = ^Telf64_rela;
  Telf64_rela = record
      r_offset : TElf64_Addr;
      r_info : TElf64_Xword;
      r_addend : TElf64_Sxword;
    end;

  Pelf32_sym = ^Telf32_sym;
  Telf32_sym = record
      st_name : TElf32_Word;
      st_value : TElf32_Addr;
      st_size : TElf32_Word;
      st_info : byte;
      st_other : byte;
      st_shndx : TElf32_Half;
    end;
{ Symbol name, index in string tbl  }
{ Type and binding attributes  }
{ No defined meaning, 0  }
{ Associated section index  }
{ Value of the symbol  }
{ Associated symbol size  }

  Pelf64_sym = ^Telf64_sym;
  Telf64_sym = record
      st_name : TElf64_Word;
      st_info : byte;
      st_other : byte;
      st_shndx : TElf64_Half;
      st_value : TElf64_Addr;
      st_size : TElf64_Xword;
    end;

const
  EI_NIDENT = 16;  
{ Entry point  }
type
  Pelf32_hdr = ^Telf32_hdr;
  Telf32_hdr = record
      e_ident : array[0..(EI_NIDENT)-1] of byte;
      e_type : TElf32_Half;
      e_machine : TElf32_Half;
      e_version : TElf32_Word;
      e_entry : TElf32_Addr;
      e_phoff : TElf32_Off;
      e_shoff : TElf32_Off;
      e_flags : TElf32_Word;
      e_ehsize : TElf32_Half;
      e_phentsize : TElf32_Half;
      e_phnum : TElf32_Half;
      e_shentsize : TElf32_Half;
      e_shnum : TElf32_Half;
      e_shstrndx : TElf32_Half;
    end;
  TElf32_Ehdr = Telf32_hdr;
  PElf32_Ehdr = ^TElf32_Ehdr;
{ ELF "magic number"  }
{ Entry point virtual address  }
{ Program header table file offset  }
{ Section header table file offset  }

  Pelf64_hdr = ^Telf64_hdr;
  Telf64_hdr = record
      e_ident : array[0..(EI_NIDENT)-1] of byte;
      e_type : TElf64_Half;
      e_machine : TElf64_Half;
      e_version : TElf64_Word;
      e_entry : TElf64_Addr;
      e_phoff : TElf64_Off;
      e_shoff : TElf64_Off;
      e_flags : TElf64_Word;
      e_ehsize : TElf64_Half;
      e_phentsize : TElf64_Half;
      e_phnum : TElf64_Half;
      e_shentsize : TElf64_Half;
      e_shnum : TElf64_Half;
      e_shstrndx : TElf64_Half;
    end;
  TElf64_Ehdr = Telf64_hdr;
  PElf64_Ehdr = ^TElf64_Ehdr;
{ These constants define the permissions on sections in the program
   header, p_flags.  }

const
  PF_R = $4;  
  PF_W = $2;  
  PF_X = $1;  
type
  Pelf32_phdr = ^Telf32_phdr;
  Telf32_phdr = record
      p_type : TElf32_Word;
      p_offset : TElf32_Off;
      p_vaddr : TElf32_Addr;
      p_paddr : TElf32_Addr;
      p_filesz : TElf32_Word;
      p_memsz : TElf32_Word;
      p_flags : TElf32_Word;
      p_align : TElf32_Word;
    end;
{ Segment file offset  }
{ Segment virtual address  }
{ Segment physical address  }
{ Segment size in file  }
{ Segment size in memory  }
{ Segment alignment, file & memory  }

  Pelf64_phdr = ^Telf64_phdr;
  Telf64_phdr = record
      p_type : TElf64_Word;
      p_flags : TElf64_Word;
      p_offset : TElf64_Off;
      p_vaddr : TElf64_Addr;
      p_paddr : TElf64_Addr;
      p_filesz : TElf64_Xword;
      p_memsz : TElf64_Xword;
      p_align : TElf64_Xword;
    end;
{ sh_type  }

const
  SHT_NULL = 0;  
  SHT_PROGBITS = 1;  
  SHT_SYMTAB = 2;  
  SHT_STRTAB = 3;  
  SHT_RELA = 4;  
  SHT_HASH = 5;  
  SHT_DYNAMIC = 6;  
  SHT_NOTE = 7;  
  SHT_NOBITS = 8;  
  SHT_REL = 9;  
  SHT_SHLIB = 10;  
  SHT_DYNSYM = 11;  
  SHT_NUM = 12;  
  SHT_LOPROC = $70000000;  
  SHT_HIPROC = $7fffffff;  
  SHT_LOUSER = $80000000;  
  SHT_HIUSER = $ffffffff;  
{ sh_flags  }
  SHF_WRITE = $1;  
  SHF_ALLOC = $2;  
  SHF_EXECINSTR = $4;  
  SHF_RELA_LIVEPATCH = $00100000;  
  SHF_RO_AFTER_INIT = $00200000;  
  SHF_MASKPROC = $f0000000;  
{ special section indexes  }
  SHN_UNDEF = 0;  
  SHN_LORESERVE = $ff00;  
  SHN_LOPROC = $ff00;  
  SHN_HIPROC = $ff1f;  
  SHN_LIVEPATCH = $ff20;  
  SHN_ABS = $fff1;  
  SHN_COMMON = $fff2;  
  SHN_HIRESERVE = $ffff;  
type
  Pelf32_shdr = ^Telf32_shdr;
  Telf32_shdr = record
      sh_name : TElf32_Word;
      sh_type : TElf32_Word;
      sh_flags : TElf32_Word;
      sh_addr : TElf32_Addr;
      sh_offset : TElf32_Off;
      sh_size : TElf32_Word;
      sh_link : TElf32_Word;
      sh_info : TElf32_Word;
      sh_addralign : TElf32_Word;
      sh_entsize : TElf32_Word;
    end;
{ Section name, index in string tbl  }
{ Type of section  }
{ Miscellaneous section attributes  }
{ Section virtual addr at execution  }
{ Section file offset  }
{ Size of section in bytes  }
{ Index of another section  }
{ Additional section information  }
{ Section alignment  }
{ Entry size if section holds table  }

  Pelf64_shdr = ^Telf64_shdr;
  Telf64_shdr = record
      sh_name : TElf64_Word;
      sh_type : TElf64_Word;
      sh_flags : TElf64_Xword;
      sh_addr : TElf64_Addr;
      sh_offset : TElf64_Off;
      sh_size : TElf64_Xword;
      sh_link : TElf64_Word;
      sh_info : TElf64_Word;
      sh_addralign : TElf64_Xword;
      sh_entsize : TElf64_Xword;
    end;
{ e_ident[] indexes  }

const
  EI_MAG0 = 0;  
  EI_MAG1 = 1;  
  EI_MAG2 = 2;  
  EI_MAG3 = 3;  
  EI_CLASS = 4;  
  EI_DATA = 5;  
  EI_VERSION = 6;  
  EI_OSABI = 7;  
  EI_PAD = 8;  
{ EI_MAG  }
  ELFMAG0 = $7f;  
  ELFMAG1 = 'E';  
  ELFMAG2 = 'L';  
  ELFMAG3 = 'F';  
  ELFMAG = '\177ELF';  
  SELFMAG = 4;  
{ EI_CLASS  }
  ELFCLASSNONE = 0;  
  ELFCLASS32 = 1;  
  ELFCLASS64 = 2;  
  ELFCLASSNUM = 3;  
{ e_ident[EI_DATA]  }
  ELFDATANONE = 0;  
  ELFDATA2LSB = 1;  
  ELFDATA2MSB = 2;  
{ e_version, EI_VERSION  }
  EV_NONE = 0;  
  EV_CURRENT = 1;  
  EV_NUM = 2;  
  ELFOSABI_NONE = 0;  
  ELFOSABI_LINUX = 3;  
{$ifndef ELF_OSABI}

const
  ELF_OSABI = ELFOSABI_NONE;  
{$endif}
{
 * Notes used in ET_CORE. Architectures export some of the arch register sets
 * using the corresponding note types via the PTRACE_GETREGSET and
 * PTRACE_SETREGSET requests.
 * The note name for these types is "LINUX", except NT_PRFPREG that is named
 * "CORE".
  }

const
  NT_PRSTATUS = 1;  
  NT_PRFPREG = 2;  
  NT_PRPSINFO = 3;  
  NT_TASKSTRUCT = 4;  
  NT_AUXV = 6;  
{
 * Note to userspace developers: size of NT_SIGINFO note may increase
 * in the future to accomodate more fields, don't assume it is fixed!
  }
  NT_SIGINFO = $53494749;  
  NT_FILE = $46494c45;  
{ copied from gdb5.1/include/elf/common.h  }
  NT_PRXFPREG = $46e62b7f;  
{ PowerPC Altivec/VMX registers  }
  NT_PPC_VMX = $100;  
{ PowerPC SPE/EVR registers  }
  NT_PPC_SPE = $101;  
{ PowerPC VSX registers  }
  NT_PPC_VSX = $102;  
{ Target Address Register  }
  NT_PPC_TAR = $103;  
{ Program Priority Register  }
  NT_PPC_PPR = $104;  
{ Data Stream Control Register  }
  NT_PPC_DSCR = $105;  
{ Event Based Branch Registers  }
  NT_PPC_EBB = $106;  
{ Performance Monitor Registers  }
  NT_PPC_PMU = $107;  
{ TM checkpointed GPR Registers  }
  NT_PPC_TM_CGPR = $108;  
{ TM checkpointed FPR Registers  }
  NT_PPC_TM_CFPR = $109;  
{ TM checkpointed VMX Registers  }
  NT_PPC_TM_CVMX = $10a;  
{ TM checkpointed VSX Registers  }
  NT_PPC_TM_CVSX = $10b;  
{ TM Special Purpose Registers  }
  NT_PPC_TM_SPR = $10c;  
{ TM checkpointed Target Address Register  }
  NT_PPC_TM_CTAR = $10d;  
{ TM checkpointed Program Priority Register  }
  NT_PPC_TM_CPPR = $10e;  
{ TM checkpointed Data Stream Control Register  }
  NT_PPC_TM_CDSCR = $10f;  
{ Memory Protection Keys registers  }
  NT_PPC_PKEY = $110;  
{ PowerPC DEXCR registers  }
  NT_PPC_DEXCR = $111;  
{ PowerPC HASHKEYR register  }
  NT_PPC_HASHKEYR = $112;  
{ i386 TLS slots (struct user_desc)  }
  NT_386_TLS = $200;  
{ x86 io permission bitmap (1=deny)  }
  NT_386_IOPERM = $201;  
{ x86 extended state using xsave  }
  NT_X86_XSTATE = $202;  
{ Old binutils treats 0x203 as a CET state  }
{ x86 SHSTK state  }
  NT_X86_SHSTK = $204;  
{ s390 upper register halves  }
  NT_S390_HIGH_GPRS = $300;  
{ s390 timer register  }
  NT_S390_TIMER = $301;  
{ s390 TOD clock comparator register  }
  NT_S390_TODCMP = $302;  
{ s390 TOD programmable register  }
  NT_S390_TODPREG = $303;  
{ s390 control registers  }
  NT_S390_CTRS = $304;  
{ s390 prefix register  }
  NT_S390_PREFIX = $305;  
{ s390 breaking event address  }
  NT_S390_LAST_BREAK = $306;  
{ s390 system call restart data  }
  NT_S390_SYSTEM_CALL = $307;  
{ s390 transaction diagnostic block  }
  NT_S390_TDB = $308;  
{ s390 vector registers 0-15 upper half  }
  NT_S390_VXRS_LOW = $309;  
{ s390 vector registers 16-31  }
  NT_S390_VXRS_HIGH = $30a;  
{ s390 guarded storage registers  }
  NT_S390_GS_CB = $30b;  
{ s390 guarded storage broadcast control block  }
  NT_S390_GS_BC = $30c;  
{ s390 runtime instrumentation  }
  NT_S390_RI_CB = $30d;  
{ s390 protvirt cpu dump data  }
  NT_S390_PV_CPU_DATA = $30e;  
{ ARM VFP/NEON registers  }
  NT_ARM_VFP = $400;  
{ ARM TLS register  }
  NT_ARM_TLS = $401;  
{ ARM hardware breakpoint registers  }
  NT_ARM_HW_BREAK = $402;  
{ ARM hardware watchpoint registers  }
  NT_ARM_HW_WATCH = $403;  
{ ARM system call number  }
  NT_ARM_SYSTEM_CALL = $404;  
{ ARM Scalable Vector Extension registers  }
  NT_ARM_SVE = $405;  
{ ARM pointer authentication code masks  }
  NT_ARM_PAC_MASK = $406;  
{ ARM pointer authentication address keys  }
  NT_ARM_PACA_KEYS = $407;  
{ ARM pointer authentication generic key  }
  NT_ARM_PACG_KEYS = $408;  
{ arm64 tagged address control (prctl())  }
  NT_ARM_TAGGED_ADDR_CTRL = $409;  
{ arm64 ptr auth enabled keys (prctl())  }
  NT_ARM_PAC_ENABLED_KEYS = $40a;  
{ ARM Streaming SVE registers  }
  NT_ARM_SSVE = $40b;  
{ ARM SME ZA registers  }
  NT_ARM_ZA = $40c;  
{ ARM SME ZT registers  }
  NT_ARM_ZT = $40d;  
{ ARCv2 accumulator/extra registers  }
  NT_ARC_V2 = $600;  
{ Vmcore Device Dump Note  }
  NT_VMCOREDD = $700;  
{ MIPS DSP ASE registers  }
  NT_MIPS_DSP = $800;  
{ MIPS floating-point mode  }
  NT_MIPS_FP_MODE = $801;  
{ MIPS SIMD registers  }
  NT_MIPS_MSA = $802;  
{ RISC-V Control and Status Registers  }
  NT_RISCV_CSR = $900;  
{ RISC-V vector registers  }
  NT_RISCV_VECTOR = $901;  
{ LoongArch CPU config registers  }
  NT_LOONGARCH_CPUCFG = $a00;  
{ LoongArch control and status registers  }
  NT_LOONGARCH_CSR = $a01;  
{ LoongArch Loongson SIMD Extension registers  }
  NT_LOONGARCH_LSX = $a02;  
{ LoongArch Loongson Advanced SIMD Extension registers  }
  NT_LOONGARCH_LASX = $a03;  
{ LoongArch Loongson Binary Translation registers  }
  NT_LOONGARCH_LBT = $a04;  
{ LoongArch hardware breakpoint registers  }
  NT_LOONGARCH_HW_BREAK = $a05;  
{ LoongArch hardware watchpoint registers  }
  NT_LOONGARCH_HW_WATCH = $a06;  
{ Note types with note name "GNU"  }
  NT_GNU_PROPERTY_TYPE_0 = 5;  
{ Note header in a PT_NOTE section  }
{ Name size  }
{ Content size  }
{ Content type  }
type
  Pelf32_note = ^Telf32_note;
  Telf32_note = record
      n_namesz : TElf32_Word;
      n_descsz : TElf32_Word;
      n_type : TElf32_Word;
    end;
  TElf32_Nhdr = Telf32_note;
  PElf32_Nhdr = ^TElf32_Nhdr;
{ Note header in a PT_NOTE section  }
{ Name size  }
{ Content size  }
{ Content type  }

  Pelf64_note = ^Telf64_note;
  Telf64_note = record
      n_namesz : TElf64_Word;
      n_descsz : TElf64_Word;
      n_type : TElf64_Word;
    end;
  TElf64_Nhdr = Telf64_note;
  PElf64_Nhdr = ^TElf64_Nhdr;
{ .note.gnu.property types for EM_AARCH64:  }

const
  GNU_PROPERTY_AARCH64_FEATURE_1_AND = $c0000000;  
{ Bits for GNU_PROPERTY_AARCH64_FEATURE_1_BTI  }
  GNU_PROPERTY_AARCH64_FEATURE_1_BTI = 1 shl 0;  
{$endif}
{ _LINUX_ELF_H  }

// === Konventiert am: 8-9-25 19:15:12 ===


implementation


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ELF_ST_BIND(x : longint) : longint;
begin
  ELF_ST_BIND:=x shr 4;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function ELF_ST_TYPE(x : longint) : Tx;
begin
  ELF_ST_TYPE:=Tx(@($f));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ELF32_ST_BIND(x : longint) : longint;
begin
  ELF32_ST_BIND:=ELF_ST_BIND(x);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ELF32_ST_TYPE(x : longint) : longint;
begin
  ELF32_ST_TYPE:=ELF_ST_TYPE(x);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ELF64_ST_BIND(x : longint) : longint;
begin
  ELF64_ST_BIND:=ELF_ST_BIND(x);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ELF64_ST_TYPE(x : longint) : longint;
begin
  ELF64_ST_TYPE:=ELF_ST_TYPE(x);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ELF32_R_SYM(x : longint) : longint;
begin
  ELF32_R_SYM:=x shr 8;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function ELF32_R_TYPE(x : longint) : Tx;
begin
  ELF32_R_TYPE:=Tx(@($ff));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ELF64_R_SYM(i : longint) : longint;
begin
  ELF64_R_SYM:=i shr 32;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function ELF64_R_TYPE(i : longint) : Ti;
begin
  ELF64_R_TYPE:=Ti(@($ffffffff));
end;


end.
