unit elf_linux;

interface

uses
  fp_elf64;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}

// /usr/include/linux/elf.h


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

const
  PT_NULL = 0;  
  PT_LOAD = 1;  
  PT_DYNAMIC = 2;  
  PT_INTERP = 3;  
  PT_NOTE = 4;  
  PT_SHLIB = 5;  
  PT_PHDR = 6;  
  PT_TLS = 7;
  PT_LOOS = $60000000;
  PT_HIOS = $6fffffff;
  PT_LOPROC = $70000000;  
  PT_HIPROC = $7fffffff;  
  PT_GNU_EH_FRAME = PT_LOOS+$474e550;  
  PT_GNU_STACK = PT_LOOS+$474e551;  
  PT_GNU_RELRO = PT_LOOS+$474e552;  
  PT_GNU_PROPERTY = PT_LOOS+$474e553;  
  PT_AARCH64_MEMTAG_MTE = PT_LOPROC+$2;
  PN_XNUM = $ffff;
  ET_NONE = 0;
  ET_REL = 1;  
  ET_EXEC = 2;  
  ET_DYN = 3;  
  ET_CORE = 4;  
  ET_LOPROC = $ff00;  
  ET_HIPROC = $ffff;  
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

//function ELF_ST_BIND(x : longint) : longint;
//
//{ was #define dname(params) para_def_expr }
//{ argument types are unknown }
//function ELF_ST_TYPE(x : longint) : Tx;
//
//{ was #define dname(params) para_def_expr }
//{ argument types are unknown }
//{ return type might be wrong }   
//function ELF32_ST_BIND(x : longint) : longint;
//
//{ was #define dname(params) para_def_expr }
//{ argument types are unknown }
//{ return type might be wrong }   
//function ELF32_ST_TYPE(x : longint) : longint;
//
//{ was #define dname(params) para_def_expr }
//{ argument types are unknown }
//{ return type might be wrong }   
//function ELF64_ST_BIND(x : longint) : longint;
//
//{ was #define dname(params) para_def_expr }
//{ argument types are unknown }
//{ return type might be wrong }   
//function ELF64_ST_TYPE(x : longint) : longint;

type
  TElf32_Dyn = record
      d_tag : TElf32_Sword;
      d_un : record
          case longint of
            0 : ( d_val : TElf32_Sword );
            1 : ( d_ptr : TElf32_Addr );
          end;
    end;
  PElf32_Dyn = ^TElf32_Dyn;

  TElf64_Dyn = record
      d_tag : TElf64_Sxword;
      d_un : record
          case longint of
            0 : ( d_val : TElf64_Xword );
            1 : ( d_ptr : TElf64_Addr );
          end;
    end;
  PElf64_Dyn = ^TElf64_Dyn;

//function ELF32_R_SYM(x : longint) : longint;
//
//{ was #define dname(params) para_def_expr }
//{ argument types are unknown }
//function ELF32_R_TYPE(x : longint) : Tx;
//
//{ was #define dname(params) para_def_expr }
//{ argument types are unknown }
//{ return type might be wrong }   
//function ELF64_R_SYM(i : longint) : longint;
//
//{ was #define dname(params) para_def_expr }
//{ argument types are unknown }
//function ELF64_R_TYPE(i : longint) : Ti;

type
  Telf32_rel = record
      r_offset : TElf32_Addr;
      r_info : TElf32_Word;
    end;
  Pelf32_rel = ^Telf32_rel;

  Telf64_rel = record
      r_offset : TElf64_Addr;
      r_info : TElf64_Xword;
    end;
  Pelf64_rel = ^Telf64_rel;

  Telf32_rela = record
      r_offset : TElf32_Addr;
      r_info : TElf32_Word;
      r_addend : TElf32_Sword;
    end;
  Pelf32_rela = ^Telf32_rela;

  Telf64_rela = record
      r_offset : TElf64_Addr;
      r_info : TElf64_Xword;
      r_addend : TElf64_Sxword;
    end;
  Pelf64_rela = ^Telf64_rela;

  Telf32_sym = record
      st_name : TElf32_Word;
      st_value : TElf32_Addr;
      st_size : TElf32_Word;
      st_info : byte;
      st_other : byte;
      st_shndx : TElf32_Half;
    end;
  Pelf32_sym = ^Telf32_sym;

  Telf64_sym = record
      st_name : TElf64_Word;
      st_info : byte;
      st_other : byte;
      st_shndx : TElf64_Half;
      st_value : TElf64_Addr;
      st_size : TElf64_Xword;
    end;
  Pelf64_sym = ^Telf64_sym;

const
  EI_NIDENT = 16;  
type
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
  Pelf32_hdr = ^Telf32_hdr;
  TElf32_Ehdr = Telf32_hdr;
  PElf32_Ehdr = ^TElf32_Ehdr;

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
  Pelf64_hdr = ^Telf64_hdr;
  TElf64_Ehdr = Telf64_hdr;
  PElf64_Ehdr = ^TElf64_Ehdr;

const
  PF_R = $4;  
  PF_W = $2;  
  PF_X = $1;  
type
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
  Pelf32_phdr = ^Telf32_phdr;

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
  Pelf64_phdr = ^Telf64_phdr;

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
  SHF_WRITE = $1;
  SHF_ALLOC = $2;  
  SHF_EXECINSTR = $4;  
  SHF_RELA_LIVEPATCH = $00100000;  
  SHF_RO_AFTER_INIT = $00200000;  
  SHF_MASKPROC = $f0000000;  
  SHN_UNDEF = 0;
  SHN_LORESERVE = $ff00;  
  SHN_LOPROC = $ff00;  
  SHN_HIPROC = $ff1f;  
  SHN_LIVEPATCH = $ff20;  
  SHN_ABS = $fff1;  
  SHN_COMMON = $fff2;  
  SHN_HIRESERVE = $ffff;  
type
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
  Pelf32_shdr = ^Telf32_shdr;

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
  Pelf64_shdr = ^Telf64_shdr;

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
  ELFMAG0 = $7f;
  ELFMAG1 = 'E';  
  ELFMAG2 = 'L';  
  ELFMAG3 = 'F';  
  ELFMAG = '\177ELF';  
  SELFMAG = 4;  
  ELFCLASSNONE = 0;
  ELFCLASS32 = 1;  
  ELFCLASS64 = 2;  
  ELFCLASSNUM = 3;  
  ELFDATANONE = 0;
  ELFDATA2LSB = 1;  
  ELFDATA2MSB = 2;  
  EV_NONE = 0;
  EV_CURRENT = 1;  
  EV_NUM = 2;  
  ELFOSABI_NONE = 0;  
  ELFOSABI_LINUX = 3;  

const
  ELF_OSABI = ELFOSABI_NONE;  

const
  NT_PRSTATUS = 1;  
  NT_PRFPREG = 2;  
  NT_PRPSINFO = 3;  
  NT_TASKSTRUCT = 4;  
  NT_AUXV = 6;  
  NT_SIGINFO = $53494749;
  NT_FILE = $46494c45;  
  NT_PRXFPREG = $46e62b7f;
  NT_PPC_VMX = $100;
  NT_PPC_SPE = $101;
  NT_PPC_VSX = $102;
  NT_PPC_TAR = $103;
  NT_PPC_PPR = $104;
  NT_PPC_DSCR = $105;
  NT_PPC_EBB = $106;
  NT_PPC_PMU = $107;
  NT_PPC_TM_CGPR = $108;
  NT_PPC_TM_CFPR = $109;
  NT_PPC_TM_CVMX = $10a;
  NT_PPC_TM_CVSX = $10b;
  NT_PPC_TM_SPR = $10c;
  NT_PPC_TM_CTAR = $10d;
  NT_PPC_TM_CPPR = $10e;
  NT_PPC_TM_CDSCR = $10f;
  NT_PPC_PKEY = $110;
  NT_PPC_DEXCR = $111;
  NT_PPC_HASHKEYR = $112;
  NT_386_TLS = $200;
  NT_386_IOPERM = $201;
  NT_X86_XSTATE = $202;
  NT_X86_SHSTK = $204;
  NT_S390_HIGH_GPRS = $300;
  NT_S390_TIMER = $301;
  NT_S390_TODCMP = $302;
  NT_S390_TODPREG = $303;
  NT_S390_CTRS = $304;
  NT_S390_PREFIX = $305;
  NT_S390_LAST_BREAK = $306;
  NT_S390_SYSTEM_CALL = $307;
  NT_S390_TDB = $308;
  NT_S390_VXRS_LOW = $309;
  NT_S390_VXRS_HIGH = $30a;
  NT_S390_GS_CB = $30b;
  NT_S390_GS_BC = $30c;
  NT_S390_RI_CB = $30d;
  NT_S390_PV_CPU_DATA = $30e;
  NT_ARM_VFP = $400;
  NT_ARM_TLS = $401;
  NT_ARM_HW_BREAK = $402;
  NT_ARM_HW_WATCH = $403;
  NT_ARM_SYSTEM_CALL = $404;
  NT_ARM_SVE = $405;
  NT_ARM_PAC_MASK = $406;
  NT_ARM_PACA_KEYS = $407;
  NT_ARM_PACG_KEYS = $408;
  NT_ARM_TAGGED_ADDR_CTRL = $409;
  NT_ARM_PAC_ENABLED_KEYS = $40a;
  NT_ARM_SSVE = $40b;
  NT_ARM_ZA = $40c;
  NT_ARM_ZT = $40d;
  NT_ARC_V2 = $600;
  NT_VMCOREDD = $700;
  NT_MIPS_DSP = $800;
  NT_MIPS_FP_MODE = $801;
  NT_MIPS_MSA = $802;
  NT_RISCV_CSR = $900;
  NT_RISCV_VECTOR = $901;
  NT_LOONGARCH_CPUCFG = $a00;
  NT_LOONGARCH_CSR = $a01;
  NT_LOONGARCH_LSX = $a02;
  NT_LOONGARCH_LASX = $a03;
  NT_LOONGARCH_LBT = $a04;
  NT_LOONGARCH_HW_BREAK = $a05;
  NT_LOONGARCH_HW_WATCH = $a06;
  NT_GNU_PROPERTY_TYPE_0 = 5;
type
  Telf32_note = record
      n_namesz : TElf32_Word;
      n_descsz : TElf32_Word;
      n_type : TElf32_Word;
    end;
  Pelf32_note = ^Telf32_note;
  TElf32_Nhdr = Telf32_note;
  PElf32_Nhdr = ^TElf32_Nhdr;

  Telf64_note = record
      n_namesz : TElf64_Word;
      n_descsz : TElf64_Word;
      n_type : TElf64_Word;
    end;
  Pelf64_note = ^Telf64_note;
  TElf64_Nhdr = Telf64_note;
  PElf64_Nhdr = ^TElf64_Nhdr;

const
  GNU_PROPERTY_AARCH64_FEATURE_1_AND = $c0000000;  
  GNU_PROPERTY_AARCH64_FEATURE_1_BTI = 1 shl 0;

// === Konventiert am: 8-9-25 19:15:12 ===


implementation


//{ was #define dname(params) para_def_expr }
//{ argument types are unknown }
//{ return type might be wrong }   
//function ELF_ST_BIND(x : longint) : longint;
//begin
//  ELF_ST_BIND:=x shr 4;
//end;
//
//{ was #define dname(params) para_def_expr }
//{ argument types are unknown }
//function ELF_ST_TYPE(x : longint) : Tx;
//begin
//  ELF_ST_TYPE:=Tx(@($f));
//end;
//
//{ was #define dname(params) para_def_expr }
//{ argument types are unknown }
//{ return type might be wrong }   
//function ELF32_ST_BIND(x : longint) : longint;
//begin
//  ELF32_ST_BIND:=ELF_ST_BIND(x);
//end;
//
//{ was #define dname(params) para_def_expr }
//{ argument types are unknown }
//{ return type might be wrong }   
//function ELF32_ST_TYPE(x : longint) : longint;
//begin
//  ELF32_ST_TYPE:=ELF_ST_TYPE(x);
//end;
//
//{ was #define dname(params) para_def_expr }
//{ argument types are unknown }
//{ return type might be wrong }   
//function ELF64_ST_BIND(x : longint) : longint;
//begin
//  ELF64_ST_BIND:=ELF_ST_BIND(x);
//end;
//
//{ was #define dname(params) para_def_expr }
//{ argument types are unknown }
//{ return type might be wrong }   
//function ELF64_ST_TYPE(x : longint) : longint;
//begin
//  ELF64_ST_TYPE:=ELF_ST_TYPE(x);
//end;
//
//{ was #define dname(params) para_def_expr }
//{ argument types are unknown }
//{ return type might be wrong }   
//function ELF32_R_SYM(x : longint) : longint;
//begin
//  ELF32_R_SYM:=x shr 8;
//end;
//
//{ was #define dname(params) para_def_expr }
//{ argument types are unknown }
//function ELF32_R_TYPE(x : longint) : Tx;
//begin
//  ELF32_R_TYPE:=Tx(@($ff));
//end;
//
//{ was #define dname(params) para_def_expr }
//{ argument types are unknown }
//{ return type might be wrong }   
//function ELF64_R_SYM(i : longint) : longint;
//begin
//  ELF64_R_SYM:=i shr 32;
//end;
//
//{ was #define dname(params) para_def_expr }
//{ argument types are unknown }
//function ELF64_R_TYPE(i : longint) : Ti;
//begin
//  ELF64_R_TYPE:=Ti(@($ffffffff));
//end;
//

end.
