unit elf;

interface

uses
  fp_elf64;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


// /usr/include/elf.h


type
  PElf32_Half = ^TElf32_Half;
  TElf32_Half = Tuint16_t;

  PElf64_Half = ^TElf64_Half;
  TElf64_Half = Tuint16_t;

  PElf32_Word = ^TElf32_Word;
  TElf32_Word = Tuint32_t;

  PElf32_Sword = ^TElf32_Sword;
  TElf32_Sword = Tint32_t;

  PElf64_Word = ^TElf64_Word;
  TElf64_Word = Tuint32_t;

  PElf64_Sword = ^TElf64_Sword;
  TElf64_Sword = Tint32_t;

  PElf32_Xword = ^TElf32_Xword;
  TElf32_Xword = Tuint64_t;

  PElf32_Sxword = ^TElf32_Sxword;
  TElf32_Sxword = Tint64_t;

  PElf64_Xword = ^TElf64_Xword;
  TElf64_Xword = Tuint64_t;

  PElf64_Sxword = ^TElf64_Sxword;
  TElf64_Sxword = Tint64_t;

  PElf32_Addr = ^TElf32_Addr;
  TElf32_Addr = Tuint32_t;

  PElf64_Addr = ^TElf64_Addr;
  TElf64_Addr = Tuint64_t;

  PElf32_Off = ^TElf32_Off;
  TElf32_Off = Tuint32_t;

  PElf64_Off = ^TElf64_Off;
  TElf64_Off = Tuint64_t;

  PElf32_Section = ^TElf32_Section;
  TElf32_Section = Tuint16_t;

  PElf64_Section = ^TElf64_Section;
  TElf64_Section = Tuint16_t;

  PElf32_Versym = ^TElf32_Versym;
  TElf32_Versym = TElf32_Half;

  PElf64_Versym = ^TElf64_Versym;
  TElf64_Versym = TElf64_Half;

const
  EI_NIDENT = 16;  
type
  TElf32_Ehdr = record
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
  PElf32_Ehdr = ^TElf32_Ehdr;

  TElf64_Ehdr = record
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
  PElf64_Ehdr = ^TElf64_Ehdr;

const
  EI_MAG0 = 0;  
  ELFMAG0 = $7f;
  EI_MAG1 = 1;
  ELFMAG1 = 'E';
  EI_MAG2 = 2;
  ELFMAG2 = 'L';
  EI_MAG3 = 3;
  ELFMAG3 = 'F';
  ELFMAG = '\177ELF';
  SELFMAG = 4;  
  EI_CLASS = 4;
  ELFCLASSNONE = 0;
  ELFCLASS32 = 1;
  ELFCLASS64 = 2;
  ELFCLASSNUM = 3;  
  EI_DATA = 5;
  ELFDATANONE = 0;
  ELFDATA2LSB = 1;
  ELFDATA2MSB = 2;
  ELFDATANUM = 3;  
  EI_VERSION = 6;
  EI_OSABI = 7;
  ELFOSABI_NONE = 0;
  ELFOSABI_SYSV = 0;
  ELFOSABI_HPUX = 1;
  ELFOSABI_NETBSD = 2;
  ELFOSABI_GNU = 3;
  ELFOSABI_LINUX = ELFOSABI_GNU;
  ELFOSABI_SOLARIS = 6;
  ELFOSABI_AIX = 7;
  ELFOSABI_IRIX = 8;
  ELFOSABI_FREEBSD = 9;
  ELFOSABI_TRU64 = 10;
  ELFOSABI_MODESTO = 11;
  ELFOSABI_OPENBSD = 12;
  ELFOSABI_ARM_AEABI = 64;
  ELFOSABI_ARM = 97;
  ELFOSABI_STANDALONE = 255;
  EI_ABIVERSION = 8;
  EI_PAD = 9;
  ET_NONE = 0;
  ET_REL = 1;
  ET_EXEC = 2;
  ET_DYN = 3;
  ET_CORE = 4;
  ET_NUM = 5;
  ET_LOOS = $fe00;
  ET_HIOS = $feff;
  ET_LOPROC = $ff00;
  ET_HIPROC = $ffff;
  EM_NONE = 0;
  EM_M32 = 1;
  EM_SPARC = 2;
  EM_386 = 3;
  EM_68K = 4;
  EM_88K = 5;
  EM_IAMCU = 6;
  EM_860 = 7;
  EM_MIPS = 8;
  EM_S370 = 9;
  EM_MIPS_RS3_LE = 10;
  EM_PARISC = 15;
  EM_VPP500 = 17;
  EM_SPARC32PLUS = 18;
  EM_960 = 19;
  EM_PPC = 20;
  EM_PPC64 = 21;
  EM_S390 = 22;
  EM_SPU = 23;
  EM_V800 = 36;
  EM_FR20 = 37;
  EM_RH32 = 38;
  EM_RCE = 39;
  EM_ARM = 40;
  EM_FAKE_ALPHA = 41;
  EM_SH = 42;
  EM_SPARCV9 = 43;
  EM_TRICORE = 44;
  EM_ARC = 45;
  EM_H8_300 = 46;
  EM_H8_300H = 47;
  EM_H8S = 48;
  EM_H8_500 = 49;
  EM_IA_64 = 50;
  EM_MIPS_X = 51;
  EM_COLDFIRE = 52;
  EM_68HC12 = 53;
  EM_MMA = 54;
  EM_PCP = 55;
  EM_NCPU = 56;
  EM_NDR1 = 57;
  EM_STARCORE = 58;
  EM_ME16 = 59;
  EM_ST100 = 60;
  EM_TINYJ = 61;
  EM_X86_64 = 62;
  EM_PDSP = 63;
  EM_PDP10 = 64;
  EM_PDP11 = 65;
  EM_FX66 = 66;
  EM_ST9PLUS = 67;
  EM_ST7 = 68;
  EM_68HC16 = 69;
  EM_68HC11 = 70;
  EM_68HC08 = 71;
  EM_68HC05 = 72;
  EM_SVX = 73;
  EM_ST19 = 74;
  EM_VAX = 75;
  EM_CRIS = 76;
  EM_JAVELIN = 77;
  EM_FIREPATH = 78;
  EM_ZSP = 79;
  EM_MMIX = 80;
  EM_HUANY = 81;
  EM_PRISM = 82;
  EM_AVR = 83;
  EM_FR30 = 84;
  EM_D10V = 85;
  EM_D30V = 86;
  EM_V850 = 87;
  EM_M32R = 88;
  EM_MN10300 = 89;
  EM_MN10200 = 90;
  EM_PJ = 91;
  EM_OPENRISC = 92;
  EM_ARC_COMPACT = 93;
  EM_XTENSA = 94;
  EM_VIDEOCORE = 95;
  EM_TMM_GPP = 96;
  EM_NS32K = 97;
  EM_TPC = 98;
  EM_SNP1K = 99;
  EM_ST200 = 100;
  EM_IP2K = 101;
  EM_MAX = 102;
  EM_CR = 103;
  EM_F2MC16 = 104;
  EM_MSP430 = 105;
  EM_BLACKFIN = 106;
  EM_SE_C33 = 107;
  EM_SEP = 108;
  EM_ARCA = 109;
  EM_UNICORE = 110;
  EM_EXCESS = 111;
  EM_DXP = 112;
  EM_ALTERA_NIOS2 = 113;
  EM_CRX = 114;
  EM_XGATE = 115;
  EM_C166 = 116;
  EM_M16C = 117;
  EM_DSPIC30F = 118;
  EM_CE = 119;
  EM_M32C = 120;
  EM_TSK3000 = 131;
  EM_RS08 = 132;
  EM_SHARC = 133;
  EM_ECOG2 = 134;
  EM_SCORE7 = 135;
  EM_DSP24 = 136;
  EM_VIDEOCORE3 = 137;
  EM_LATTICEMICO32 = 138;
  EM_SE_C17 = 139;
  EM_TI_C6000 = 140;
  EM_TI_C2000 = 141;
  EM_TI_C5500 = 142;
  EM_TI_ARP32 = 143;
  EM_TI_PRU = 144;
  EM_MMDSP_PLUS = 160;
  EM_CYPRESS_M8C = 161;
  EM_R32C = 162;
  EM_TRIMEDIA = 163;
  EM_QDSP6 = 164;
  EM_8051 = 165;
  EM_STXP7X = 166;
  EM_NDS32 = 167;
  EM_ECOG1X = 168;
  EM_MAXQ30 = 169;
  EM_XIMO16 = 170;
  EM_MANIK = 171;
  EM_CRAYNV2 = 172;
  EM_RX = 173;
  EM_METAG = 174;
  EM_MCST_ELBRUS = 175;
  EM_ECOG16 = 176;
  EM_CR16 = 177;
  EM_ETPU = 178;
  EM_SLE9X = 179;
  EM_L10M = 180;
  EM_K10M = 181;
  EM_AARCH64 = 183;
  EM_AVR32 = 185;
  EM_STM8 = 186;
  EM_TILE64 = 187;
  EM_TILEPRO = 188;
  EM_MICROBLAZE = 189;
  EM_CUDA = 190;
  EM_TILEGX = 191;
  EM_CLOUDSHIELD = 192;
  EM_COREA_1ST = 193;
  EM_COREA_2ND = 194;
  EM_ARCV2 = 195;
  EM_OPEN8 = 196;
  EM_RL78 = 197;
  EM_VIDEOCORE5 = 198;
  EM_78KOR = 199;
  EM_56800EX = 200;
  EM_BA1 = 201;
  EM_BA2 = 202;
  EM_XCORE = 203;
  EM_MCHP_PIC = 204;
  EM_INTELGT = 205;
  EM_KM32 = 210;
  EM_KMX32 = 211;
  EM_EMX16 = 212;
  EM_EMX8 = 213;
  EM_KVARC = 214;
  EM_CDP = 215;
  EM_COGE = 216;
  EM_COOL = 217;
  EM_NORC = 218;
  EM_CSR_KALIMBA = 219;
  EM_Z80 = 220;
  EM_VISIUM = 221;
  EM_FT32 = 222;
  EM_MOXIE = 223;
  EM_AMDGPU = 224;
  EM_RISCV = 243;
  EM_BPF = 247;
  EM_CSKY = 252;
  EM_LOONGARCH = 258;
  EM_NUM = 259;  
  EM_ARC_A5 = EM_ARC_COMPACT;
  EM_ALPHA = $9026;
  EV_NONE = 0;
  EV_CURRENT = 1;
  EV_NUM = 2;  
type
  TElf32_Shdr = record
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
  PElf32_Shdr = ^TElf32_Shdr;

  TElf64_Shdr = record
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
  PElf64_Shdr = ^TElf64_Shdr;

const
  SHN_UNDEF = 0;  
  SHN_LORESERVE = $ff00;
  SHN_LOPROC = $ff00;
  SHN_BEFORE = $ff00;
  SHN_AFTER = $ff01;
  SHN_HIPROC = $ff1f;
  SHN_LOOS = $ff20;
  SHN_HIOS = $ff3f;
  SHN_ABS = $fff1;
  SHN_COMMON = $fff2;
  SHN_XINDEX = $ffff;
  SHN_HIRESERVE = $ffff;
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
  SHT_INIT_ARRAY = 14;
  SHT_FINI_ARRAY = 15;
  SHT_PREINIT_ARRAY = 16;
  SHT_GROUP = 17;
  SHT_SYMTAB_SHNDX = 18;
  SHT_RELR = 19;
  SHT_NUM = 20;
  SHT_LOOS = $60000000;
  SHT_GNU_ATTRIBUTES = $6ffffff5;
  SHT_GNU_HASH = $6ffffff6;
  SHT_GNU_LIBLIST = $6ffffff7;
  SHT_CHECKSUM = $6ffffff8;
  SHT_LOSUNW = $6ffffffa;
  SHT_SUNW_move = $6ffffffa;  
  SHT_SUNW_COMDAT = $6ffffffb;  
  SHT_SUNW_syminfo = $6ffffffc;  
  SHT_GNU_verdef = $6ffffffd;
  SHT_GNU_verneed = $6ffffffe;
  SHT_GNU_versym = $6fffffff;
  SHT_HISUNW = $6fffffff;
  SHT_HIOS = $6fffffff;
  SHT_LOPROC = $70000000;
  SHT_HIPROC = $7fffffff;
  SHT_LOUSER = $80000000;
  SHT_HIUSER = $8fffffff;
  SHF_WRITE = 1 shl 0;
  SHF_ALLOC = 1 shl 1;
  SHF_EXECINSTR = 1 shl 2;
  SHF_MERGE = 1 shl 4;
  SHF_STRINGS = 1 shl 5;
  SHF_INFO_LINK = 1 shl 6;
  SHF_LINK_ORDER = 1 shl 7;
  SHF_OS_NONCONFORMING = 1 shl 8;
  SHF_GROUP = 1 shl 9;
  SHF_TLS = 1 shl 10;
  SHF_COMPRESSED = 1 shl 11;
  SHF_MASKOS = $0ff00000;
  SHF_MASKPROC = $f0000000;
  SHF_GNU_RETAIN = 1 shl 21;
  SHF_ORDERED = 1 shl 30;
  SHF_EXCLUDE = 1 shl 31;
type
  TElf32_Chdr = record
      ch_type : TElf32_Word;
      ch_size : TElf32_Word;
      ch_addralign : TElf32_Word;
    end;
  PElf32_Chdr = ^TElf32_Chdr;

  TElf64_Chdr = record
      ch_type : TElf64_Word;
      ch_reserved : TElf64_Word;
      ch_size : TElf64_Xword;
      ch_addralign : TElf64_Xword;
    end;
  PElf64_Chdr = ^TElf64_Chdr;

const
  ELFCOMPRESS_ZLIB = 1;  
  ELFCOMPRESS_ZSTD = 2;
  ELFCOMPRESS_LOOS = $60000000;
  ELFCOMPRESS_HIOS = $6fffffff;
  ELFCOMPRESS_LOPROC = $70000000;
  ELFCOMPRESS_HIPROC = $7fffffff;
  GRP_COMDAT = $1;
type
  TElf32_Sym = record
      st_name : TElf32_Word;
      st_value : TElf32_Addr;
      st_size : TElf32_Word;
      st_info : byte;
      st_other : byte;
      st_shndx : TElf32_Section;
    end;
  PElf32_Sym = ^TElf32_Sym;

  TElf64_Sym = record
      st_name : TElf64_Word;
      st_info : byte;
      st_other : byte;
      st_shndx : TElf64_Section;
      st_value : TElf64_Addr;
      st_size : TElf64_Xword;
    end;
  PElf64_Sym = ^TElf64_Sym;

  TElf32_Syminfo = record
      si_boundto : TElf32_Half;
      si_flags : TElf32_Half;
    end;
  PElf32_Syminfo = ^TElf32_Syminfo;

  TElf64_Syminfo = record
      si_boundto : TElf64_Half;
      si_flags : TElf64_Half;
    end;
  PElf64_Syminfo = ^TElf64_Syminfo;

const
  SYMINFO_BT_SELF = $ffff;  
  SYMINFO_BT_PARENT = $fffe;
  SYMINFO_BT_LOWRESERVE = $ff00;
  SYMINFO_FLG_DIRECT = $0001;
  SYMINFO_FLG_PASSTHRU = $0002;
  SYMINFO_FLG_COPY = $0004;
  SYMINFO_FLG_LAZYLOAD = $0008;
  SYMINFO_NONE = 0;
  SYMINFO_CURRENT = 1;  
  SYMINFO_NUM = 2;  


function ELF32_ST_BIND(val : longint) : longint;
function ELF32_ST_TYPE(val : longint) : Tval;
function ELF32_ST_INFO(bind,_type : longint) : longint;
function ELF64_ST_BIND(val : longint) : longint;
function ELF64_ST_TYPE(val : longint) : longint;
function ELF64_ST_INFO(bind,_type : longint) : longint;

const
  STB_LOCAL = 0;  
  STB_GLOBAL = 1;
  STB_WEAK = 2;
  STB_NUM = 3;
  STB_LOOS = 10;
  STB_GNU_UNIQUE = 10;
  STB_HIOS = 12;
  STB_LOPROC = 13;
  STB_HIPROC = 15;
  STT_NOTYPE = 0;
  STT_OBJECT = 1;
  STT_FUNC = 2;
  STT_SECTION = 3;
  STT_FILE = 4;
  STT_COMMON = 5;
  STT_TLS = 6;
  STT_NUM = 7;
  STT_LOOS = 10;
  STT_GNU_IFUNC = 10;
  STT_HIOS = 12;
  STT_LOPROC = 13;
  STT_HIPROC = 15;
  STN_UNDEF = 0;

function ELF32_ST_VISIBILITY(obj : longint) : To;
function ELF64_ST_VISIBILITY(obj : longint) : longint;
const
  STV_DEFAULT = 0;  
  STV_INTERNAL = 1;
  STV_HIDDEN = 2;
  STV_PROTECTED = 3;
type
  TElf32_Rel = record
      r_offset : TElf32_Addr;
      r_info : TElf32_Word;
    end;
  PElf32_Rel = ^TElf32_Rel;

  TElf64_Rel = record
      r_offset : TElf64_Addr;
      r_info : TElf64_Xword;
    end;
  PElf64_Rel = ^TElf64_Rel;

  TElf32_Rela = record
      r_offset : TElf32_Addr;
      r_info : TElf32_Word;
      r_addend : TElf32_Sword;
    end;
  PElf32_Rela = ^TElf32_Rela;

  TElf64_Rela = record
      r_offset : TElf64_Addr;
      r_info : TElf64_Xword;
      r_addend : TElf64_Sxword;
    end;
  PElf64_Rela = ^TElf64_Rela;

  PElf32_Relr = ^TElf32_Relr;
  TElf32_Relr = TElf32_Word;

  PElf64_Relr = ^TElf64_Relr;
  TElf64_Relr = TElf64_Xword;

function ELF32_R_SYM(val : longint) : longint;
function ELF32_R_TYPE(val : longint) : Tval;
function ELF32_R_INFO(sym,_type : longint) : longint;
function ELF64_R_SYM(i : longint) : longint;
function ELF64_R_TYPE(i : longint) : Ti;
function ELF64_R_INFO(sym,_type : longint) : longint;
type
  TElf32_Phdr = record
      p_type : TElf32_Word;
      p_offset : TElf32_Off;
      p_vaddr : TElf32_Addr;
      p_paddr : TElf32_Addr;
      p_filesz : TElf32_Word;
      p_memsz : TElf32_Word;
      p_flags : TElf32_Word;
      p_align : TElf32_Word;
    end;
  PElf32_Phdr = ^TElf32_Phdr;

  TElf64_Phdr = record
      p_type : TElf64_Word;
      p_flags : TElf64_Word;
      p_offset : TElf64_Off;
      p_vaddr : TElf64_Addr;
      p_paddr : TElf64_Addr;
      p_filesz : TElf64_Xword;
      p_memsz : TElf64_Xword;
      p_align : TElf64_Xword;
    end;
  PElf64_Phdr = ^TElf64_Phdr;
const
  PN_XNUM = $ffff;  
  PT_NULL = 0;
  PT_LOAD = 1;
  PT_DYNAMIC = 2;
  PT_INTERP = 3;
  PT_NOTE = 4;
  PT_SHLIB = 5;
  PT_PHDR = 6;
  PT_TLS = 7;
  PT_NUM = 8;
  PT_LOOS = $60000000;
  PT_GNU_EH_FRAME = $6474e550;
  PT_GNU_STACK = $6474e551;
  PT_GNU_RELRO = $6474e552;
  PT_GNU_PROPERTY = $6474e553;
  PT_GNU_SFRAME = $6474e554;
  PT_LOSUNW = $6ffffffa;  
  PT_SUNWBSS = $6ffffffa;
  PT_SUNWSTACK = $6ffffffb;
  PT_HISUNW = $6fffffff;  
  PT_HIOS = $6fffffff;
  PT_LOPROC = $70000000;
  PT_HIPROC = $7fffffff;
  PF_X = 1 shl 0;
  PF_W = 1 shl 1;
  PF_R = 1 shl 2;
  PF_MASKOS = $0ff00000;
  PF_MASKPROC = $f0000000;
  NT_PRSTATUS = 1;
  NT_PRFPREG = 2;
  NT_FPREGSET = 2;
  NT_PRPSINFO = 3;
  NT_PRXREG = 4;
  NT_TASKSTRUCT = 4;
  NT_PLATFORM = 5;
  NT_AUXV = 6;
  NT_GWINDOWS = 7;
  NT_ASRS = 8;
  NT_PSTATUS = 10;
  NT_PSINFO = 13;
  NT_PRCRED = 14;
  NT_UTSNAME = 15;
  NT_LWPSTATUS = 16;
  NT_LWPSINFO = 17;
  NT_PRFPXREG = 20;
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
  NT_VERSION = 1;
type
  TElf32_Dyn = record
      d_tag : TElf32_Sword;
      d_un : record
          case longint of
            0 : ( d_val : TElf32_Word );
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

const
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
  DT_BIND_NOW = 24;
  DT_INIT_ARRAY = 25;
  DT_FINI_ARRAY = 26;
  DT_INIT_ARRAYSZ = 27;
  DT_FINI_ARRAYSZ = 28;
  DT_RUNPATH = 29;
  DT_FLAGS = 30;
  DT_ENCODING = 32;
  DT_PREINIT_ARRAY = 32;
  DT_PREINIT_ARRAYSZ = 33;
  DT_SYMTAB_SHNDX = 34;
  DT_RELRSZ = 35;
  DT_RELR = 36;
  DT_RELRENT = 37;
  DT_NUM = 38;
  DT_LOOS = $6000000d;
  DT_HIOS = $6ffff000;
  DT_LOPROC = $70000000;
  DT_HIPROC = $7fffffff;
  DT_PROCNUM = DT_MIPS_NUM;
  DT_VALRNGLO = $6ffffd00;
  DT_GNU_PRELINKED = $6ffffdf5;
  DT_GNU_CONFLICTSZ = $6ffffdf6;
  DT_GNU_LIBLISTSZ = $6ffffdf7;
  DT_CHECKSUM = $6ffffdf8;  
  DT_PLTPADSZ = $6ffffdf9;  
  DT_MOVEENT = $6ffffdfa;  
  DT_MOVESZ = $6ffffdfb;  
  DT_FEATURE_1 = $6ffffdfc;
  DT_POSFLAG_1 = $6ffffdfd;
  DT_SYMINSZ = $6ffffdfe;
  DT_SYMINENT = $6ffffdff;
  DT_VALRNGHI = $6ffffdff;  

function DT_VALTAGIDX(tag : longint) : longint;

const
  DT_VALNUM = 12;  
  DT_ADDRRNGLO = $6ffffe00;
  DT_GNU_HASH = $6ffffef5;
  DT_TLSDESC_PLT = $6ffffef6;  
  DT_TLSDESC_GOT = $6ffffef7;  
  DT_GNU_CONFLICT = $6ffffef8;
  DT_GNU_LIBLIST = $6ffffef9;
  DT_CONFIG = $6ffffefa;
  DT_DEPAUDIT = $6ffffefb;
  DT_AUDIT = $6ffffefc;
  DT_PLTPAD = $6ffffefd;
  DT_MOVETAB = $6ffffefe;
  DT_SYMINFO = $6ffffeff;
  DT_ADDRRNGHI = $6ffffeff;  

function DT_ADDRTAGIDX(tag : longint) : longint;

const
  DT_ADDRNUM = 11;  
  DT_VERSYM = $6ffffff0;
  DT_RELACOUNT = $6ffffff9;  
  DT_RELCOUNT = $6ffffffa;  
  DT_FLAGS_1 = $6ffffffb;
  DT_VERDEF = $6ffffffc;
  DT_VERDEFNUM = $6ffffffd;
  DT_VERNEED = $6ffffffe;
  DT_VERNEEDNUM = $6fffffff;

function DT_VERSIONTAGIDX(tag : longint) : longint;

const
  DT_VERSIONTAGNUM = 16;  
  DT_AUXILIARY = $7ffffffd;
  DT_FILTER = $7fffffff;

function DT_EXTRATAGIDX(tag : longint) : longint;

const
  DT_EXTRANUM = 3;  
  DF_ORIGIN = $00000001;
  DF_SYMBOLIC = $00000002;
  DF_TEXTREL = $00000004;
  DF_BIND_NOW = $00000008;
  DF_STATIC_TLS = $00000010;
  DF_1_NOW = $00000001;
  DF_1_GLOBAL = $00000002;
  DF_1_GROUP = $00000004;
  DF_1_NODELETE = $00000008;
  DF_1_LOADFLTR = $00000010;
  DF_1_INITFIRST = $00000020;
  DF_1_NOOPEN = $00000040;
  DF_1_ORIGIN = $00000080;
  DF_1_DIRECT = $00000100;
  DF_1_TRANS = $00000200;  
  DF_1_INTERPOSE = $00000400;
  DF_1_NODEFLIB = $00000800;
  DF_1_NODUMP = $00001000;
  DF_1_CONFALT = $00002000;
  DF_1_ENDFILTEE = $00004000;
  DF_1_DISPRELDNE = $00008000;
  DF_1_DISPRELPND = $00010000;
  DF_1_NODIRECT = $00020000;
  DF_1_IGNMULDEF = $00040000;  
  DF_1_NOKSYMS = $00080000;  
  DF_1_NOHDR = $00100000;  
  DF_1_EDITED = $00200000;
  DF_1_NORELOC = $00400000;  
  DF_1_SYMINTPOSE = $00800000;
  DF_1_GLOBAUDIT = $01000000;
  DF_1_SINGLETON = $02000000;
  DF_1_STUB = $04000000;  
  DF_1_PIE = $08000000;  
  DF_1_KMOD = $10000000;  
  DF_1_WEAKFILTER = $20000000;  
  DF_1_NOCOMMON = $40000000;  
  DTF_1_PARINIT = $00000001;
  DTF_1_CONFEXP = $00000002;  
  DF_P1_LAZYLOAD = $00000001;
  DF_P1_GROUPPERM = $00000002;
type
  TElf32_Verdef = record
      vd_version : TElf32_Half;
      vd_flags : TElf32_Half;
      vd_ndx : TElf32_Half;
      vd_cnt : TElf32_Half;
      vd_hash : TElf32_Word;
      vd_aux : TElf32_Word;
      vd_next : TElf32_Word;
    end;
  PElf32_Verdef = ^TElf32_Verdef;

  TElf64_Verdef = record
      vd_version : TElf64_Half;
      vd_flags : TElf64_Half;
      vd_ndx : TElf64_Half;
      vd_cnt : TElf64_Half;
      vd_hash : TElf64_Word;
      vd_aux : TElf64_Word;
      vd_next : TElf64_Word;
    end;
  PElf64_Verdef = ^TElf64_Verdef;

const
  VER_DEF_NONE = 0;  
  VER_DEF_CURRENT = 1;
  VER_DEF_NUM = 2;
  VER_FLG_BASE = $1;
  VER_FLG_WEAK = $2;
  VER_NDX_LOCAL = 0;
  VER_NDX_GLOBAL = 1;
  VER_NDX_LORESERVE = $ff00;
  VER_NDX_ELIMINATE = $ff01;
type
  TElf32_Verdaux = record
      vda_name : TElf32_Word;
      vda_next : TElf32_Word;
    end;
  PElf32_Verdaux = ^TElf32_Verdaux;

  TElf64_Verdaux = record
      vda_name : TElf64_Word;
      vda_next : TElf64_Word;
    end;
  PElf64_Verdaux = ^TElf64_Verdaux;

  TElf32_Verneed = record
      vn_version : TElf32_Half;
      vn_cnt : TElf32_Half;
      vn_file : TElf32_Word;
      vn_aux : TElf32_Word;
      vn_next : TElf32_Word;
    end;
  PElf32_Verneed = ^TElf32_Verneed;

  TElf64_Verneed = record
      vn_version : TElf64_Half;
      vn_cnt : TElf64_Half;
      vn_file : TElf64_Word;
      vn_aux : TElf64_Word;
      vn_next : TElf64_Word;
    end;
  PElf64_Verneed = ^TElf64_Verneed;

const
  VER_NEED_NONE = 0;  
  VER_NEED_CURRENT = 1;
  VER_NEED_NUM = 2;
type
  TElf32_Vernaux = record
      vna_hash : TElf32_Word;
      vna_flags : TElf32_Half;
      vna_other : TElf32_Half;
      vna_name : TElf32_Word;
      vna_next : TElf32_Word;
    end;
  PElf32_Vernaux = ^TElf32_Vernaux;

  TElf64_Vernaux = record
      vna_hash : TElf64_Word;
      vna_flags : TElf64_Half;
      vna_other : TElf64_Half;
      vna_name : TElf64_Word;
      vna_next : TElf64_Word;
    end;
  PElf64_Vernaux = ^TElf64_Vernaux;

  TElf32_auxv_t = record
      a_type : Tuint32_t;
      a_un : record
          case longint of
            0 : ( a_val : Tuint32_t );
          end;
    end;
  PElf32_auxv_t = ^TElf32_auxv_t;

  TElf64_auxv_t = record
      a_type : Tuint64_t;
      a_un : record
          case longint of
            0 : ( a_val : Tuint64_t );
          end;
    end;
  PElf64_auxv_t = ^TElf64_auxv_t;

const
  AT_NULL = 0;  
  AT_IGNORE = 1;
  AT_EXECFD = 2;
  AT_PHDR = 3;
  AT_PHENT = 4;
  AT_PHNUM = 5;
  AT_PAGESZ = 6;
  AT_BASE = 7;
  AT_FLAGS = 8;
  AT_ENTRY = 9;
  AT_NOTELF = 10;
  AT_UID = 11;
  AT_EUID = 12;
  AT_GID = 13;
  AT_EGID = 14;
  AT_CLKTCK = 17;
  AT_PLATFORM = 15;
  AT_HWCAP = 16;
  AT_FPUCW = 18;
  AT_DCACHEBSIZE = 19;
  AT_ICACHEBSIZE = 20;
  AT_UCACHEBSIZE = 21;
  AT_IGNOREPPC = 22;
  AT_SECURE = 23;
  AT_BASE_PLATFORM = 24;
  AT_RANDOM = 25;
  AT_HWCAP2 = 26;
  AT_RSEQ_FEATURE_SIZE = 27;
  AT_RSEQ_ALIGN = 28;
  AT_HWCAP3 = 29;
  AT_HWCAP4 = 30;
  AT_EXECFN = 31;
  AT_SYSINFO = 32;
  AT_SYSINFO_EHDR = 33;  
  AT_L1I_CACHESHAPE = 34;
  AT_L1D_CACHESHAPE = 35;  
  AT_L2_CACHESHAPE = 36;  
  AT_L3_CACHESHAPE = 37;  
  AT_L1I_CACHESIZE = 40;
  AT_L1I_CACHEGEOMETRY = 41;  
  AT_L1D_CACHESIZE = 42;  
  AT_L1D_CACHEGEOMETRY = 43;  
  AT_L2_CACHESIZE = 44;  
  AT_L2_CACHEGEOMETRY = 45;  
  AT_L3_CACHESIZE = 46;  
  AT_L3_CACHEGEOMETRY = 47;  
  AT_MINSIGSTKSZ = 51;
type
  TElf32_Nhdr = record
      n_namesz : TElf32_Word;
      n_descsz : TElf32_Word;
      n_type : TElf32_Word;
    end;
  PElf32_Nhdr = ^TElf32_Nhdr;

  TElf64_Nhdr = record
      n_namesz : TElf64_Word;
      n_descsz : TElf64_Word;
      n_type : TElf64_Word;
    end;
  PElf64_Nhdr = ^TElf64_Nhdr;

const
  ELF_NOTE_SOLARIS = 'SUNW Solaris';  
  ELF_NOTE_GNU = 'GNU';
  ELF_NOTE_FDO = 'FDO';
  ELF_NOTE_PAGESIZE_HINT = 1;
  NT_GNU_ABI_TAG = 1;
  ELF_NOTE_ABI = NT_GNU_ABI_TAG;
  ELF_NOTE_OS_LINUX = 0;
  ELF_NOTE_OS_GNU = 1;  
  ELF_NOTE_OS_SOLARIS2 = 2;  
  ELF_NOTE_OS_FREEBSD = 3;  
  NT_GNU_HWCAP = 2;
  NT_GNU_BUILD_ID = 3;
  NT_GNU_GOLD_VERSION = 4;
  NT_GNU_PROPERTY_TYPE_0 = 5;
  NT_FDO_PACKAGING_METADATA = $cafe1a7e;
  NOTE_GNU_PROPERTY_SECTION_NAME = '.note.gnu.property';
  GNU_PROPERTY_STACK_SIZE = 1;
  GNU_PROPERTY_NO_COPY_ON_PROTECTED = 2;
  GNU_PROPERTY_UINT32_AND_LO = $b0000000;
  GNU_PROPERTY_UINT32_AND_HI = $b0007fff;  
  GNU_PROPERTY_UINT32_OR_LO = $b0008000;
  GNU_PROPERTY_UINT32_OR_HI = $b000ffff;  
  GNU_PROPERTY_1_NEEDED = GNU_PROPERTY_UINT32_OR_LO;
  GNU_PROPERTY_1_NEEDED_INDIRECT_EXTERN_ACCESS = 1 shl 0;
  GNU_PROPERTY_LOPROC = $c0000000;
  GNU_PROPERTY_HIPROC = $dfffffff;
  GNU_PROPERTY_LOUSER = $e0000000;
  GNU_PROPERTY_HIUSER = $ffffffff;
  GNU_PROPERTY_AARCH64_FEATURE_1_AND = $c0000000;
  GNU_PROPERTY_AARCH64_FEATURE_1_BTI = 1 shl 0;  
  GNU_PROPERTY_AARCH64_FEATURE_1_PAC = 1 shl 1;  
  GNU_PROPERTY_X86_ISA_1_USED = $c0010002;
  GNU_PROPERTY_X86_ISA_1_NEEDED = $c0008002;
  GNU_PROPERTY_X86_FEATURE_1_AND = $c0000002;
  GNU_PROPERTY_X86_ISA_1_BASELINE = 1 shl 0;
  GNU_PROPERTY_X86_ISA_1_V2 = 1 shl 1;
  GNU_PROPERTY_X86_ISA_1_V3 = 1 shl 2;
  GNU_PROPERTY_X86_ISA_1_V4 = 1 shl 3;
  GNU_PROPERTY_X86_FEATURE_1_IBT = 1 shl 0;
  GNU_PROPERTY_X86_FEATURE_1_SHSTK = 1 shl 1;
type
  TElf32_Move = record
      m_value : TElf32_Xword;
      m_info : TElf32_Word;
      m_poffset : TElf32_Word;
      m_repeat : TElf32_Half;
      m_stride : TElf32_Half;
    end;
  PElf32_Move = ^TElf32_Move;

  TElf64_Move = record
      m_value : TElf64_Xword;
      m_info : TElf64_Xword;
      m_poffset : TElf64_Xword;
      m_repeat : TElf64_Half;
      m_stride : TElf64_Half;
    end;
  PElf64_Move = ^TElf64_Move;

  function ELF32_M_SYM(info : longint) : longint;
function ELF32_M_SIZE(info : longint) : byte;
function ELF32_M_INFO(sym,size : longint) : longint;
function ELF64_M_SYM(info : longint) : longint;
function ELF64_M_SIZE(info : longint) : longint;
function ELF64_M_INFO(sym,size : longint) : longint;

const
  EF_CPU32 = $00810000;  
  R_68K_NONE = 0;
  R_68K_32 = 1;
  R_68K_16 = 2;
  R_68K_8 = 3;
  R_68K_PC32 = 4;
  R_68K_PC16 = 5;
  R_68K_PC8 = 6;
  R_68K_GOT32 = 7;
  R_68K_GOT16 = 8;
  R_68K_GOT8 = 9;
  R_68K_GOT32O = 10;
  R_68K_GOT16O = 11;
  R_68K_GOT8O = 12;
  R_68K_PLT32 = 13;
  R_68K_PLT16 = 14;
  R_68K_PLT8 = 15;
  R_68K_PLT32O = 16;
  R_68K_PLT16O = 17;
  R_68K_PLT8O = 18;
  R_68K_COPY = 19;
  R_68K_GLOB_DAT = 20;
  R_68K_JMP_SLOT = 21;
  R_68K_RELATIVE = 22;
  R_68K_TLS_GD32 = 25;
  R_68K_TLS_GD16 = 26;
  R_68K_TLS_GD8 = 27;
  R_68K_TLS_LDM32 = 28;
  R_68K_TLS_LDM16 = 29;
  R_68K_TLS_LDM8 = 30;
  R_68K_TLS_LDO32 = 31;
  R_68K_TLS_LDO16 = 32;
  R_68K_TLS_LDO8 = 33;
  R_68K_TLS_IE32 = 34;
  R_68K_TLS_IE16 = 35;
  R_68K_TLS_IE8 = 36;
  R_68K_TLS_LE32 = 37;
  R_68K_TLS_LE16 = 38;
  R_68K_TLS_LE8 = 39;
  R_68K_TLS_DTPMOD32 = 40;
  R_68K_TLS_DTPREL32 = 41;
  R_68K_TLS_TPREL32 = 42;
  R_68K_NUM = 43;
  R_386_NONE = 0;
  R_386_32 = 1;
  R_386_PC32 = 2;
  R_386_GOT32 = 3;
  R_386_PLT32 = 4;
  R_386_COPY = 5;
  R_386_GLOB_DAT = 6;
  R_386_JMP_SLOT = 7;
  R_386_RELATIVE = 8;
  R_386_GOTOFF = 9;
  R_386_GOTPC = 10;
  R_386_32PLT = 11;  
  R_386_TLS_TPOFF = 14;
  R_386_TLS_IE = 15;
  R_386_TLS_GOTIE = 16;
  R_386_TLS_LE = 17;
  R_386_TLS_GD = 18;
  R_386_TLS_LDM = 19;
  R_386_16 = 20;  
  R_386_PC16 = 21;  
  R_386_8 = 22;  
  R_386_PC8 = 23;  
  R_386_TLS_GD_32 = 24;
  R_386_TLS_GD_PUSH = 25;
  R_386_TLS_GD_CALL = 26;
  R_386_TLS_GD_POP = 27;
  R_386_TLS_LDM_32 = 28;
  R_386_TLS_LDM_PUSH = 29;
  R_386_TLS_LDM_CALL = 30;
  R_386_TLS_LDM_POP = 31;
  R_386_TLS_LDO_32 = 32;
  R_386_TLS_IE_32 = 33;
  R_386_TLS_LE_32 = 34;
  R_386_TLS_DTPMOD32 = 35;
  R_386_TLS_DTPOFF32 = 36;
  R_386_TLS_TPOFF32 = 37;
  R_386_SIZE32 = 38;
  R_386_TLS_GOTDESC = 39;
  R_386_TLS_DESC_CALL = 40;
  R_386_TLS_DESC = 41;
  R_386_IRELATIVE = 42;
  R_386_GOT32X = 43;
  R_386_NUM = 44;
  STT_SPARC_REGISTER = 13;
  EF_SPARCV9_MM = 3;
  EF_SPARCV9_TSO = 0;  
  EF_SPARCV9_PSO = 1;  
  EF_SPARCV9_RMO = 2;  
  EF_SPARC_LEDATA = $800000;
  EF_SPARC_EXT_MASK = $FFFF00;  
  EF_SPARC_32PLUS = $000100;
  EF_SPARC_SUN_US1 = $000200;
  EF_SPARC_HAL_R1 = $000400;
  EF_SPARC_SUN_US3 = $000800;
  R_SPARC_NONE = 0;
  R_SPARC_8 = 1;
  R_SPARC_16 = 2;
  R_SPARC_32 = 3;
  R_SPARC_DISP8 = 4;
  R_SPARC_DISP16 = 5;
  R_SPARC_DISP32 = 6;
  R_SPARC_WDISP30 = 7;
  R_SPARC_WDISP22 = 8;
  R_SPARC_HI22 = 9;
  R_SPARC_22 = 10;
  R_SPARC_13 = 11;
  R_SPARC_LO10 = 12;
  R_SPARC_GOT10 = 13;
  R_SPARC_GOT13 = 14;
  R_SPARC_GOT22 = 15;
  R_SPARC_PC10 = 16;
  R_SPARC_PC22 = 17;
  R_SPARC_WPLT30 = 18;
  R_SPARC_COPY = 19;
  R_SPARC_GLOB_DAT = 20;
  R_SPARC_JMP_SLOT = 21;
  R_SPARC_RELATIVE = 22;
  R_SPARC_UA32 = 23;
  R_SPARC_PLT32 = 24;
  R_SPARC_HIPLT22 = 25;
  R_SPARC_LOPLT10 = 26;
  R_SPARC_PCPLT32 = 27;
  R_SPARC_PCPLT22 = 28;
  R_SPARC_PCPLT10 = 29;
  R_SPARC_10 = 30;
  R_SPARC_11 = 31;
  R_SPARC_64 = 32;
  R_SPARC_OLO10 = 33;
  R_SPARC_HH22 = 34;
  R_SPARC_HM10 = 35;
  R_SPARC_LM22 = 36;
  R_SPARC_PC_HH22 = 37;
  R_SPARC_PC_HM10 = 38;
  R_SPARC_PC_LM22 = 39;
  R_SPARC_WDISP16 = 40;
  R_SPARC_WDISP19 = 41;
  R_SPARC_GLOB_JMP = 42;
  R_SPARC_7 = 43;
  R_SPARC_5 = 44;
  R_SPARC_6 = 45;
  R_SPARC_DISP64 = 46;
  R_SPARC_PLT64 = 47;
  R_SPARC_HIX22 = 48;
  R_SPARC_LOX10 = 49;
  R_SPARC_H44 = 50;
  R_SPARC_M44 = 51;
  R_SPARC_L44 = 52;
  R_SPARC_REGISTER = 53;
  R_SPARC_UA64 = 54;
  R_SPARC_UA16 = 55;
  R_SPARC_TLS_GD_HI22 = 56;  
  R_SPARC_TLS_GD_LO10 = 57;  
  R_SPARC_TLS_GD_ADD = 58;  
  R_SPARC_TLS_GD_CALL = 59;  
  R_SPARC_TLS_LDM_HI22 = 60;  
  R_SPARC_TLS_LDM_LO10 = 61;  
  R_SPARC_TLS_LDM_ADD = 62;  
  R_SPARC_TLS_LDM_CALL = 63;  
  R_SPARC_TLS_LDO_HIX22 = 64;  
  R_SPARC_TLS_LDO_LOX10 = 65;  
  R_SPARC_TLS_LDO_ADD = 66;  
  R_SPARC_TLS_IE_HI22 = 67;  
  R_SPARC_TLS_IE_LO10 = 68;  
  R_SPARC_TLS_IE_LD = 69;  
  R_SPARC_TLS_IE_LDX = 70;  
  R_SPARC_TLS_IE_ADD = 71;  
  R_SPARC_TLS_LE_HIX22 = 72;  
  R_SPARC_TLS_LE_LOX10 = 73;  
  R_SPARC_TLS_DTPMOD32 = 74;  
  R_SPARC_TLS_DTPMOD64 = 75;  
  R_SPARC_TLS_DTPOFF32 = 76;  
  R_SPARC_TLS_DTPOFF64 = 77;  
  R_SPARC_TLS_TPOFF32 = 78;  
  R_SPARC_TLS_TPOFF64 = 79;  
  R_SPARC_GOTDATA_HIX22 = 80;  
  R_SPARC_GOTDATA_LOX10 = 81;  
  R_SPARC_GOTDATA_OP_HIX22 = 82;  
  R_SPARC_GOTDATA_OP_LOX10 = 83;  
  R_SPARC_GOTDATA_OP = 84;  
  R_SPARC_H34 = 85;  
  R_SPARC_SIZE32 = 86;  
  R_SPARC_SIZE64 = 87;  
  R_SPARC_WDISP10 = 88;  
  R_SPARC_JMP_IREL = 248;  
  R_SPARC_IRELATIVE = 249;  
  R_SPARC_GNU_VTINHERIT = 250;  
  R_SPARC_GNU_VTENTRY = 251;  
  R_SPARC_REV32 = 252;  
  R_SPARC_NUM = 253;
  DT_SPARC_REGISTER = $70000001;
  DT_SPARC_NUM = 2;  
  EF_MIPS_NOREORDER = 1;
  EF_MIPS_PIC = 2;
  EF_MIPS_CPIC = 4;
  EF_MIPS_XGOT = 8;  
  EF_MIPS_UCODE = 16;  
  EF_MIPS_ABI2 = 32;  
  EF_MIPS_ABI_ON32 = 64;  
  EF_MIPS_OPTIONS_FIRST = $00000080;
  EF_MIPS_32BITMODE = $00000100;
  EF_MIPS_FP64 = 512;
  EF_MIPS_NAN2008 = 1024;
  EF_MIPS_ARCH_ASE = $0f000000;
  EF_MIPS_ARCH_ASE_MDMX = $08000000;
  EF_MIPS_ARCH_ASE_M16 = $04000000;
  EF_MIPS_ARCH_ASE_MICROMIPS = $02000000;
  EF_MIPS_ARCH = $f0000000;
  EF_MIPS_ARCH_1 = $00000000;
  EF_MIPS_ARCH_2 = $10000000;
  EF_MIPS_ARCH_3 = $20000000;
  EF_MIPS_ARCH_4 = $30000000;
  EF_MIPS_ARCH_5 = $40000000;
  EF_MIPS_ARCH_32 = $50000000;
  EF_MIPS_ARCH_64 = $60000000;
  EF_MIPS_ARCH_32R2 = $70000000;
  EF_MIPS_ARCH_64R2 = $80000000;
  EF_MIPS_ARCH_32R6 = $90000000;
  EF_MIPS_ARCH_64R6 = $a0000000;
  EF_MIPS_ABI = $0000F000;
  EF_MIPS_ABI_O32 = $00001000;
  EF_MIPS_ABI_O64 = $00002000;
  EF_MIPS_ABI_EABI32 = $00003000;
  EF_MIPS_ABI_EABI64 = $00004000;
  EF_MIPS_MACH = $00FF0000;  
  EF_MIPS_MACH_3900 = $00810000;  
  EF_MIPS_MACH_4010 = $00820000;  
  EF_MIPS_MACH_4100 = $00830000;  
  EF_MIPS_MACH_ALLEGREX = $00840000;  
  EF_MIPS_MACH_4650 = $00850000;  
  EF_MIPS_MACH_4120 = $00870000;  
  EF_MIPS_MACH_4111 = $00880000;  
  EF_MIPS_MACH_SB1 = $008a0000;  
  EF_MIPS_MACH_OCTEON = $008b0000;  
  EF_MIPS_MACH_XLR = $008c0000;  
  EF_MIPS_MACH_OCTEON2 = $008d0000;  
  EF_MIPS_MACH_OCTEON3 = $008e0000;  
  EF_MIPS_MACH_5400 = $00910000;  
  EF_MIPS_MACH_5900 = $00920000;  
  EF_MIPS_MACH_IAMR2 = $00930000;  
  EF_MIPS_MACH_5500 = $00980000;  
  EF_MIPS_MACH_9000 = $00990000;  
  EF_MIPS_MACH_LS2E = $00A00000;  
  EF_MIPS_MACH_LS2F = $00A10000;  
  EF_MIPS_MACH_GS464 = $00A20000;  
  EF_MIPS_MACH_GS464E = $00A30000;  
  EF_MIPS_MACH_GS264E = $00A40000;  
  E_MIPS_ARCH_1 = EF_MIPS_ARCH_1;
  E_MIPS_ARCH_2 = EF_MIPS_ARCH_2;  
  E_MIPS_ARCH_3 = EF_MIPS_ARCH_3;  
  E_MIPS_ARCH_4 = EF_MIPS_ARCH_4;  
  E_MIPS_ARCH_5 = EF_MIPS_ARCH_5;  
  E_MIPS_ARCH_32 = EF_MIPS_ARCH_32;  
  E_MIPS_ARCH_64 = EF_MIPS_ARCH_64;  
  SHN_MIPS_ACOMMON = $ff00;
  SHN_MIPS_TEXT = $ff01;
  SHN_MIPS_DATA = $ff02;
  SHN_MIPS_SCOMMON = $ff03;
  SHN_MIPS_SUNDEFINED = $ff04;
  SHT_MIPS_LIBLIST = $70000000;
  SHT_MIPS_MSYM = $70000001;  
  SHT_MIPS_CONFLICT = $70000002;
  SHT_MIPS_GPTAB = $70000003;
  SHT_MIPS_UCODE = $70000004;
  SHT_MIPS_DEBUG = $70000005;
  SHT_MIPS_REGINFO = $70000006;
  SHT_MIPS_PACKAGE = $70000007;  
  SHT_MIPS_PACKSYM = $70000008;  
  SHT_MIPS_RELD = $70000009;  
  SHT_MIPS_IFACE = $7000000b;  
  SHT_MIPS_CONTENT = $7000000c;  
  SHT_MIPS_OPTIONS = $7000000d;
  SHT_MIPS_SHDR = $70000010;  
  SHT_MIPS_FDESC = $70000011;  
  SHT_MIPS_EXTSYM = $70000012;  
  SHT_MIPS_DENSE = $70000013;  
  SHT_MIPS_PDESC = $70000014;  
  SHT_MIPS_LOCSYM = $70000015;  
  SHT_MIPS_AUXSYM = $70000016;  
  SHT_MIPS_OPTSYM = $70000017;  
  SHT_MIPS_LOCSTR = $70000018;  
  SHT_MIPS_LINE = $70000019;  
  SHT_MIPS_RFDESC = $7000001a;  
  SHT_MIPS_DELTASYM = $7000001b;  
  SHT_MIPS_DELTAINST = $7000001c;  
  SHT_MIPS_DELTACLASS = $7000001d;  
  SHT_MIPS_DWARF = $7000001e;
  SHT_MIPS_DELTADECL = $7000001f;  
  SHT_MIPS_SYMBOL_LIB = $70000020;  
  SHT_MIPS_EVENTS = $70000021;
  SHT_MIPS_TRANSLATE = $70000022;  
  SHT_MIPS_PIXIE = $70000023;  
  SHT_MIPS_XLATE = $70000024;  
  SHT_MIPS_XLATE_DEBUG = $70000025;  
  SHT_MIPS_WHIRL = $70000026;  
  SHT_MIPS_EH_REGION = $70000027;  
  SHT_MIPS_XLATE_OLD = $70000028;  
  SHT_MIPS_PDR_EXCEPTION = $70000029;  
  SHT_MIPS_ABIFLAGS = $7000002a;  
  SHT_MIPS_XHASH = $7000002b;  
  SHF_MIPS_GPREL = $10000000;
  SHF_MIPS_MERGE = $20000000;  
  SHF_MIPS_ADDR = $40000000;  
  SHF_MIPS_STRINGS = $80000000;  
  SHF_MIPS_NOSTRIP = $08000000;  
  SHF_MIPS_LOCAL = $04000000;  
  SHF_MIPS_NAMES = $02000000;  
  SHF_MIPS_NODUPE = $01000000;  
  STO_MIPS_DEFAULT = $0;
  STO_MIPS_INTERNAL = $1;  
  STO_MIPS_HIDDEN = $2;  
  STO_MIPS_PROTECTED = $3;  
  STO_MIPS_PLT = $8;  
  STO_MIPS_SC_ALIGN_UNUSED = $ff;  
  STB_MIPS_SPLIT_COMMON = 13;
type
  TElf32_gptab = record
      case longint of
        0 : ( gt_header : record
            gt_current_g_value : TElf32_Word;
            gt_unused : TElf32_Word;
          end );
        1 : ( gt_entry : record
            gt_g_value : TElf32_Word;
            gt_bytes : TElf32_Word;
          end );
      end;
  PElf32_gptab = ^TElf32_gptab;

  TElf32_RegInfo = record
      ri_gprmask : TElf32_Word;
      ri_cprmask : array[0..3] of TElf32_Word;
      ri_gp_value : TElf32_Sword;
    end;
  PElf32_RegInfo = ^TElf32_RegInfo;

  TElf_Options = record
      kind : byte;
      size : byte;
      section : TElf32_Section;
      info : TElf32_Word;
    end;
  PElf_Options = ^TElf_Options;

const
  ODK_NULL = 0;  
  ODK_REGINFO = 1;
  ODK_EXCEPTIONS = 2;
  ODK_PAD = 3;
  ODK_HWPATCH = 4;
  ODK_FILL = 5;
  ODK_TAGS = 6;
  ODK_HWAND = 7;
  ODK_HWOR = 8;
  OEX_FPU_MIN = $1f;
  OEX_FPU_MAX = $1f00;
  OEX_PAGE0 = $10000;
  OEX_SMM = $20000;
  OEX_FPDBUG = $40000;
  OEX_PRECISEFP = OEX_FPDBUG;  
  OEX_DISMISS = $80000;
  OEX_FPU_INVAL = $10;  
  OEX_FPU_DIV0 = $08;  
  OEX_FPU_OFLO = $04;  
  OEX_FPU_UFLO = $02;  
  OEX_FPU_INEX = $01;  
  OHW_R4KEOP = $1;
  OHW_R8KPFETCH = $2;
  OHW_R5KEOP = $4;
  OHW_R5KCVTL = $8;
  OPAD_PREFIX = $1;  
  OPAD_POSTFIX = $2;  
  OPAD_SYMBOL = $4;  
type
  TElf_Options_Hw = record
      hwp_flags1 : TElf32_Word;
      hwp_flags2 : TElf32_Word;
    end;
  PElf_Options_Hw = ^TElf_Options_Hw;

const
  OHWA0_R4KEOP_CHECKED = $00000001;  
  OHWA1_R4KEOP_CLEAN = $00000002;  
  R_MIPS_NONE = 0;
  R_MIPS_16 = 1;
  R_MIPS_32 = 2;
  R_MIPS_REL32 = 3;
  R_MIPS_26 = 4;
  R_MIPS_HI16 = 5;
  R_MIPS_LO16 = 6;
  R_MIPS_GPREL16 = 7;
  R_MIPS_LITERAL = 8;
  R_MIPS_GOT16 = 9;
  R_MIPS_PC16 = 10;
  R_MIPS_CALL16 = 11;
  R_MIPS_GPREL32 = 12;
  R_MIPS_SHIFT5 = 16;  
  R_MIPS_SHIFT6 = 17;  
  R_MIPS_64 = 18;  
  R_MIPS_GOT_DISP = 19;  
  R_MIPS_GOT_PAGE = 20;  
  R_MIPS_GOT_OFST = 21;  
  R_MIPS_GOT_HI16 = 22;  
  R_MIPS_GOT_LO16 = 23;  
  R_MIPS_SUB = 24;  
  R_MIPS_INSERT_A = 25;  
  R_MIPS_INSERT_B = 26;  
  R_MIPS_DELETE = 27;  
  R_MIPS_HIGHER = 28;  
  R_MIPS_HIGHEST = 29;  
  R_MIPS_CALL_HI16 = 30;  
  R_MIPS_CALL_LO16 = 31;  
  R_MIPS_SCN_DISP = 32;  
  R_MIPS_REL16 = 33;  
  R_MIPS_ADD_IMMEDIATE = 34;  
  R_MIPS_PJUMP = 35;  
  R_MIPS_RELGOT = 36;  
  R_MIPS_JALR = 37;  
  R_MIPS_TLS_DTPMOD32 = 38;
  R_MIPS_TLS_DTPREL32 = 39;
  R_MIPS_TLS_DTPMOD64 = 40;
  R_MIPS_TLS_DTPREL64 = 41;
  R_MIPS_TLS_GD = 42;
  R_MIPS_TLS_LDM = 43;
  R_MIPS_TLS_DTPREL_HI16 = 44;
  R_MIPS_TLS_DTPREL_LO16 = 45;
  R_MIPS_TLS_GOTTPREL = 46;
  R_MIPS_TLS_TPREL32 = 47;
  R_MIPS_TLS_TPREL64 = 48;
  R_MIPS_TLS_TPREL_HI16 = 49;
  R_MIPS_TLS_TPREL_LO16 = 50;
  R_MIPS_GLOB_DAT = 51;  
  R_MIPS_PC21_S2 = 60;  
  R_MIPS_PC26_S2 = 61;  
  R_MIPS_PC18_S3 = 62;  
  R_MIPS_PC19_S2 = 63;  
  R_MIPS_PCHI16 = 64;  
  R_MIPS_PCLO16 = 65;  
  R_MIPS16_26 = 100;  
  R_MIPS16_GPREL = 101;  
  R_MIPS16_GOT16 = 102;  
  R_MIPS16_CALL16 = 103;  
  R_MIPS16_HI16 = 104;  
  R_MIPS16_LO16 = 105;  
  R_MIPS16_TLS_GD = 106;  
  R_MIPS16_TLS_LDM = 107;  
  R_MIPS16_TLS_DTPREL_HI16 = 108;  
  R_MIPS16_TLS_DTPREL_LO16 = 109;  
  R_MIPS16_TLS_GOTTPREL = 110;  
  R_MIPS16_TLS_TPREL_HI16 = 111;  
  R_MIPS16_TLS_TPREL_LO16 = 112;  
  R_MIPS16_PC16_S1 = 113;  
  R_MIPS_COPY = 126;  
  R_MIPS_JUMP_SLOT = 127;  
  R_MIPS_RELATIVE = 128;  
  R_MICROMIPS_26_S1 = 133;  
  R_MICROMIPS_HI16 = 134;  
  R_MICROMIPS_LO16 = 135;  
  R_MICROMIPS_GPREL16 = 136;  
  R_MICROMIPS_LITERAL = 137;  
  R_MICROMIPS_GOT16 = 138;  
  R_MICROMIPS_PC7_S1 = 139;  
  R_MICROMIPS_PC10_S1 = 140;  
  R_MICROMIPS_PC16_S1 = 141;  
  R_MICROMIPS_CALL16 = 142;  
  R_MICROMIPS_GOT_DISP = 145;  
  R_MICROMIPS_GOT_PAGE = 146;  
  R_MICROMIPS_GOT_OFST = 147;  
  R_MICROMIPS_GOT_HI16 = 148;  
  R_MICROMIPS_GOT_LO16 = 149;  
  R_MICROMIPS_SUB = 150;  
  R_MICROMIPS_HIGHER = 151;  
  R_MICROMIPS_HIGHEST = 152;  
  R_MICROMIPS_CALL_HI16 = 153;  
  R_MICROMIPS_CALL_LO16 = 154;  
  R_MICROMIPS_SCN_DISP = 155;  
  R_MICROMIPS_JALR = 156;  
  R_MICROMIPS_HI0_LO16 = 157;  
  R_MICROMIPS_TLS_GD = 162;  
  R_MICROMIPS_TLS_LDM = 163;  
  R_MICROMIPS_TLS_DTPREL_HI16 = 164;  
  R_MICROMIPS_TLS_DTPREL_LO16 = 165;  
  R_MICROMIPS_TLS_GOTTPREL = 166;  
  R_MICROMIPS_TLS_TPREL_HI16 = 169;  
  R_MICROMIPS_TLS_TPREL_LO16 = 170;  
  R_MICROMIPS_GPREL7_S2 = 172;  
  R_MICROMIPS_PC23_S2 = 173;  
  R_MIPS_PC32 = 248;  
  R_MIPS_EH = 249;  
  R_MIPS_GNU_REL16_S2 = 250;  
  R_MIPS_GNU_VTINHERIT = 253;  
  R_MIPS_GNU_VTENTRY = 254;  
  R_MIPS_NUM = 255;
  PT_MIPS_REGINFO = $70000000;
  PT_MIPS_RTPROC = $70000001;
  PT_MIPS_OPTIONS = $70000002;  
  PT_MIPS_ABIFLAGS = $70000003;
  PF_MIPS_LOCAL = $10000000;
  DT_MIPS_RLD_VERSION = $70000001;
  DT_MIPS_TIME_STAMP = $70000002;
  DT_MIPS_ICHECKSUM = $70000003;
  DT_MIPS_IVERSION = $70000004;
  DT_MIPS_FLAGS = $70000005;
  DT_MIPS_BASE_ADDRESS = $70000006;
  DT_MIPS_MSYM = $70000007;  
  DT_MIPS_CONFLICT = $70000008;
  DT_MIPS_LIBLIST = $70000009;
  DT_MIPS_LOCAL_GOTNO = $7000000a;
  DT_MIPS_CONFLICTNO = $7000000b;
  DT_MIPS_LIBLISTNO = $70000010;
  DT_MIPS_SYMTABNO = $70000011;
  DT_MIPS_UNREFEXTNO = $70000012;
  DT_MIPS_GOTSYM = $70000013;
  DT_MIPS_HIPAGENO = $70000014;
  DT_MIPS_RLD_MAP = $70000016;
  DT_MIPS_DELTA_CLASS = $70000017;
  DT_MIPS_DELTA_CLASS_NO = $70000018;
  DT_MIPS_DELTA_INSTANCE = $70000019;
  DT_MIPS_DELTA_INSTANCE_NO = $7000001a;
  DT_MIPS_DELTA_RELOC = $7000001b;
  DT_MIPS_DELTA_RELOC_NO = $7000001c;
  DT_MIPS_DELTA_SYM = $7000001d;
  DT_MIPS_DELTA_SYM_NO = $7000001e;
  DT_MIPS_DELTA_CLASSSYM = $70000020;
  DT_MIPS_DELTA_CLASSSYM_NO = $70000021;
  DT_MIPS_CXX_FLAGS = $70000022;
  DT_MIPS_PIXIE_INIT = $70000023;  
  DT_MIPS_SYMBOL_LIB = $70000024;  
  DT_MIPS_LOCALPAGE_GOTIDX = $70000025;  
  DT_MIPS_LOCAL_GOTIDX = $70000026;  
  DT_MIPS_HIDDEN_GOTIDX = $70000027;  
  DT_MIPS_PROTECTED_GOTIDX = $70000028;  
  DT_MIPS_OPTIONS = $70000029;
  DT_MIPS_INTERFACE = $7000002a;
  DT_MIPS_DYNSTR_ALIGN = $7000002b;  
  DT_MIPS_INTERFACE_SIZE = $7000002c;
  DT_MIPS_RLD_TEXT_RESOLVE_ADDR = $7000002d;
  DT_MIPS_PERF_SUFFIX = $7000002e;
  DT_MIPS_COMPACT_SIZE = $7000002f;
  DT_MIPS_GP_VALUE = $70000030;
  DT_MIPS_AUX_DYNAMIC = $70000031;
  DT_MIPS_PLTGOT = $70000032;
  DT_MIPS_RWPLT = $70000034;
  DT_MIPS_RLD_MAP_REL = $70000035;
  DT_MIPS_XHASH = $70000036;
  DT_MIPS_NUM = $37;  
  RHF_NONE = 0;
  RHF_QUICKSTART = 1 shl 0;
  RHF_NOTPOT = 1 shl 1;
  RHF_NO_LIBRARY_REPLACEMENT = 1 shl 2;
  RHF_NO_MOVE = 1 shl 3;  
  RHF_SGI_ONLY = 1 shl 4;  
  RHF_GUARANTEE_INIT = 1 shl 5;  
  RHF_DELTA_C_PLUS_PLUS = 1 shl 6;  
  RHF_GUARANTEE_START_INIT = 1 shl 7;  
  RHF_PIXIE = 1 shl 8;  
  RHF_DEFAULT_DELAY_LOAD = 1 shl 9;  
  RHF_REQUICKSTART = 1 shl 10;  
  RHF_REQUICKSTARTED = 1 shl 11;  
  RHF_CORD = 1 shl 12;  
  RHF_NO_UNRES_UNDEF = 1 shl 13;  
  RHF_RLD_ORDER_SAFE = 1 shl 14;  
type
  TElf32_Lib = record
      l_name : TElf32_Word;
      l_time_stamp : TElf32_Word;
      l_checksum : TElf32_Word;
      l_version : TElf32_Word;
      l_flags : TElf32_Word;
    end;
  PElf32_Lib = ^TElf32_Lib;

  TElf64_Lib = record
      l_name : TElf64_Word;
      l_time_stamp : TElf64_Word;
      l_checksum : TElf64_Word;
      l_version : TElf64_Word;
      l_flags : TElf64_Word;
    end;
  PElf64_Lib = ^TElf64_Lib;

const
  LL_NONE = 0;  
  LL_EXACT_MATCH = 1 shl 0;
  LL_IGNORE_INT_VER = 1 shl 1;
  LL_REQUIRE_MINOR = 1 shl 2;  
  LL_EXPORTS = 1 shl 3;  
  LL_DELAY_LOAD = 1 shl 4;  
  LL_DELTA = 1 shl 5;  
type
  PElf32_Conflict = ^TElf32_Conflict;
  TElf32_Conflict = TElf32_Addr;

  TElf_MIPS_ABIFlags_v0 = record
      version : TElf32_Half;
      isa_level : byte;
      isa_rev : byte;
      gpr_size : byte;
      cpr1_size : byte;
      cpr2_size : byte;
      fp_abi : byte;
      isa_ext : TElf32_Word;
      ases : TElf32_Word;
      flags1 : TElf32_Word;
      flags2 : TElf32_Word;
    end;
  PElf64_Lib = ^TElf64_Lib;

const
  MIPS_AFL_REG_NONE = $00;  
  MIPS_AFL_REG_32 = $01;
  MIPS_AFL_REG_64 = $02;
  MIPS_AFL_REG_128 = $03;
  MIPS_AFL_ASE_DSP = $00000001;
  MIPS_AFL_ASE_DSPR2 = $00000002;
  MIPS_AFL_ASE_EVA = $00000004;
  MIPS_AFL_ASE_MCU = $00000008;
  MIPS_AFL_ASE_MDMX = $00000010;
  MIPS_AFL_ASE_MIPS3D = $00000020;
  MIPS_AFL_ASE_MT = $00000040;
  MIPS_AFL_ASE_SMARTMIPS = $00000080;
  MIPS_AFL_ASE_VIRT = $00000100;
  MIPS_AFL_ASE_MSA = $00000200;
  MIPS_AFL_ASE_MIPS16 = $00000400;
  MIPS_AFL_ASE_MICROMIPS = $00000800;
  MIPS_AFL_ASE_XPA = $00001000;
  MIPS_AFL_ASE_MASK = $00001fff;
  MIPS_AFL_EXT_XLR = 1;
  MIPS_AFL_EXT_OCTEON2 = 2;
  MIPS_AFL_EXT_OCTEONP = 3;
  MIPS_AFL_EXT_LOONGSON_3A = 4;
  MIPS_AFL_EXT_OCTEON = 5;
  MIPS_AFL_EXT_5900 = 6;
  MIPS_AFL_EXT_4650 = 7;
  MIPS_AFL_EXT_4010 = 8;
  MIPS_AFL_EXT_4100 = 9;
  MIPS_AFL_EXT_3900 = 10;
  MIPS_AFL_EXT_10000 = 11;
  MIPS_AFL_EXT_SB1 = 12;
  MIPS_AFL_EXT_4111 = 13;
  MIPS_AFL_EXT_4120 = 14;
  MIPS_AFL_EXT_5400 = 15;
  MIPS_AFL_EXT_5500 = 16;
  MIPS_AFL_EXT_LOONGSON_2E = 17;
  MIPS_AFL_EXT_LOONGSON_2F = 18;
  MIPS_AFL_FLAGS1_ODDSPREG = 1;
  Const
    Val_GNU_MIPS_ABI_FP_ANY = 0;
    Val_GNU_MIPS_ABI_FP_DOUBLE = 1;
    Val_GNU_MIPS_ABI_FP_SINGLE = 2;
    Val_GNU_MIPS_ABI_FP_SOFT = 3;
    Val_GNU_MIPS_ABI_FP_OLD_64 = 4;
    Val_GNU_MIPS_ABI_FP_XX = 5;
    Val_GNU_MIPS_ABI_FP_64 = 6;
    Val_GNU_MIPS_ABI_FP_64A = 7;
    Val_GNU_MIPS_ABI_FP_MAX = 7;
const
  EF_PARISC_TRAPNIL = $00010000;
  EF_PARISC_EXT = $00020000;
  EF_PARISC_LSB = $00040000;
  EF_PARISC_WIDE = $00080000;
  EF_PARISC_NO_KABP = $00100000;
  EF_PARISC_LAZYSWAP = $00400000;
  EF_PARISC_ARCH = $0000ffff;
  EFA_PARISC_1_0 = $020b;
  EFA_PARISC_1_1 = $0210;
  EFA_PARISC_2_0 = $0214;
  SHN_PARISC_ANSI_COMMON = $ff00;
  SHN_PARISC_HUGE_COMMON = $ff01;
  SHT_PARISC_EXT = $70000000;
  SHT_PARISC_UNWIND = $70000001;
  SHT_PARISC_DOC = $70000002;
  SHF_PARISC_SHORT = $20000000;
  SHF_PARISC_HUGE = $40000000;
  SHF_PARISC_SBP = $80000000;
  STT_PARISC_MILLICODE = 13;
  STT_HP_OPAQUE = STT_LOOS+$1;  
  STT_HP_STUB = STT_LOOS+$2;  
  R_PARISC_NONE = 0;
  R_PARISC_DIR32 = 1;
  R_PARISC_DIR21L = 2;
  R_PARISC_DIR17R = 3;
  R_PARISC_DIR17F = 4;
  R_PARISC_DIR14R = 6;
  R_PARISC_PCREL32 = 9;
  R_PARISC_PCREL21L = 10;
  R_PARISC_PCREL17R = 11;
  R_PARISC_PCREL17F = 12;
  R_PARISC_PCREL14R = 14;
  R_PARISC_DPREL21L = 18;
  R_PARISC_DPREL14R = 22;
  R_PARISC_GPREL21L = 26;
  R_PARISC_GPREL14R = 30;
  R_PARISC_LTOFF21L = 34;
  R_PARISC_LTOFF14R = 38;
  R_PARISC_SECREL32 = 41;
  R_PARISC_SEGBASE = 48;
  R_PARISC_SEGREL32 = 49;
  R_PARISC_PLTOFF21L = 50;
  R_PARISC_PLTOFF14R = 54;
  R_PARISC_LTOFF_FPTR32 = 57;
  R_PARISC_LTOFF_FPTR21L = 58;
  R_PARISC_LTOFF_FPTR14R = 62;
  R_PARISC_FPTR64 = 64;
  R_PARISC_PLABEL32 = 65;
  R_PARISC_PLABEL21L = 66;
  R_PARISC_PLABEL14R = 70;
  R_PARISC_PCREL64 = 72;
  R_PARISC_PCREL22F = 74;
  R_PARISC_PCREL14WR = 75;
  R_PARISC_PCREL14DR = 76;
  R_PARISC_PCREL16F = 77;
  R_PARISC_PCREL16WF = 78;
  R_PARISC_PCREL16DF = 79;
  R_PARISC_DIR64 = 80;
  R_PARISC_DIR14WR = 83;
  R_PARISC_DIR14DR = 84;
  R_PARISC_DIR16F = 85;
  R_PARISC_DIR16WF = 86;
  R_PARISC_DIR16DF = 87;
  R_PARISC_GPREL64 = 88;
  R_PARISC_GPREL14WR = 91;
  R_PARISC_GPREL14DR = 92;
  R_PARISC_GPREL16F = 93;
  R_PARISC_GPREL16WF = 94;
  R_PARISC_GPREL16DF = 95;
  R_PARISC_LTOFF64 = 96;
  R_PARISC_LTOFF14WR = 99;
  R_PARISC_LTOFF14DR = 100;
  R_PARISC_LTOFF16F = 101;
  R_PARISC_LTOFF16WF = 102;
  R_PARISC_LTOFF16DF = 103;
  R_PARISC_SECREL64 = 104;
  R_PARISC_SEGREL64 = 112;
  R_PARISC_PLTOFF14WR = 115;
  R_PARISC_PLTOFF14DR = 116;
  R_PARISC_PLTOFF16F = 117;
  R_PARISC_PLTOFF16WF = 118;
  R_PARISC_PLTOFF16DF = 119;
  R_PARISC_LTOFF_FPTR64 = 120;
  R_PARISC_LTOFF_FPTR14WR = 123;
  R_PARISC_LTOFF_FPTR14DR = 124;
  R_PARISC_LTOFF_FPTR16F = 125;
  R_PARISC_LTOFF_FPTR16WF = 126;
  R_PARISC_LTOFF_FPTR16DF = 127;
  R_PARISC_LORESERVE = 128;  
  R_PARISC_COPY = 128;
  R_PARISC_IPLT = 129;
  R_PARISC_EPLT = 130;
  R_PARISC_TPREL32 = 153;
  R_PARISC_TPREL21L = 154;
  R_PARISC_TPREL14R = 158;
  R_PARISC_LTOFF_TP21L = 162;
  R_PARISC_LTOFF_TP14R = 166;
  R_PARISC_LTOFF_TP14F = 167;
  R_PARISC_TPREL64 = 216;
  R_PARISC_TPREL14WR = 219;
  R_PARISC_TPREL14DR = 220;
  R_PARISC_TPREL16F = 221;
  R_PARISC_TPREL16WF = 222;
  R_PARISC_TPREL16DF = 223;
  R_PARISC_LTOFF_TP64 = 224;
  R_PARISC_LTOFF_TP14WR = 227;
  R_PARISC_LTOFF_TP14DR = 228;
  R_PARISC_LTOFF_TP16F = 229;
  R_PARISC_LTOFF_TP16WF = 230;
  R_PARISC_LTOFF_TP16DF = 231;
  R_PARISC_GNU_VTENTRY = 232;  
  R_PARISC_GNU_VTINHERIT = 233;  
  R_PARISC_TLS_GD21L = 234;
  R_PARISC_TLS_GD14R = 235;
  R_PARISC_TLS_GDCALL = 236;
  R_PARISC_TLS_LDM21L = 237;
  R_PARISC_TLS_LDM14R = 238;
  R_PARISC_TLS_LDMCALL = 239;
  R_PARISC_TLS_LDO21L = 240;
  R_PARISC_TLS_LDO14R = 241;
  R_PARISC_TLS_DTPMOD32 = 242;
  R_PARISC_TLS_DTPMOD64 = 243;
  R_PARISC_TLS_DTPOFF32 = 244;
  R_PARISC_TLS_DTPOFF64 = 245;
  R_PARISC_TLS_LE21L = R_PARISC_TPREL21L;  
  R_PARISC_TLS_LE14R = R_PARISC_TPREL14R;  
  R_PARISC_TLS_IE21L = R_PARISC_LTOFF_TP21L;  
  R_PARISC_TLS_IE14R = R_PARISC_LTOFF_TP14R;  
  R_PARISC_TLS_TPREL32 = R_PARISC_TPREL32;  
  R_PARISC_TLS_TPREL64 = R_PARISC_TPREL64;  
  R_PARISC_HIRESERVE = 255;  
  PT_HP_TLS = PT_LOOS+$0;
  PT_HP_CORE_NONE = PT_LOOS+$1;  
  PT_HP_CORE_VERSION = PT_LOOS+$2;  
  PT_HP_CORE_KERNEL = PT_LOOS+$3;  
  PT_HP_CORE_COMM = PT_LOOS+$4;  
  PT_HP_CORE_PROC = PT_LOOS+$5;  
  PT_HP_CORE_LOADABLE = PT_LOOS+$6;  
  PT_HP_CORE_STACK = PT_LOOS+$7;  
  PT_HP_CORE_SHM = PT_LOOS+$8;  
  PT_HP_CORE_MMF = PT_LOOS+$9;  
  PT_HP_PARALLEL = PT_LOOS+$10;  
  PT_HP_FASTBIND = PT_LOOS+$11;  
  PT_HP_OPT_ANNOT = PT_LOOS+$12;  
  PT_HP_HSL_ANNOT = PT_LOOS+$13;  
  PT_HP_STACK = PT_LOOS+$14;  
  PT_PARISC_ARCHEXT = $70000000;  
  PT_PARISC_UNWIND = $70000001;  
  PF_PARISC_SBP = $08000000;
  PF_HP_PAGE_SIZE = $00100000;  
  PF_HP_FAR_SHARED = $00200000;  
  PF_HP_NEAR_SHARED = $00400000;  
  PF_HP_CODE = $01000000;  
  PF_HP_MODIFY = $02000000;  
  PF_HP_LAZYSWAP = $04000000;  
  PF_HP_SBP = $08000000;  
  EF_ALPHA_32BIT = 1;
  EF_ALPHA_CANRELAX = 2;
  SHT_ALPHA_DEBUG = $70000001;
  SHT_ALPHA_REGINFO = $70000002;  
  SHF_ALPHA_GPREL = $10000000;
  STO_ALPHA_NOPV = $80;
  STO_ALPHA_STD_GPLOAD = $88;
  R_ALPHA_NONE = 0;
  R_ALPHA_REFLONG = 1;
  R_ALPHA_REFQUAD = 2;
  R_ALPHA_GPREL32 = 3;
  R_ALPHA_LITERAL = 4;
  R_ALPHA_LITUSE = 5;
  R_ALPHA_GPDISP = 6;
  R_ALPHA_BRADDR = 7;
  R_ALPHA_HINT = 8;
  R_ALPHA_SREL16 = 9;
  R_ALPHA_SREL32 = 10;
  R_ALPHA_SREL64 = 11;
  R_ALPHA_GPRELHIGH = 17;
  R_ALPHA_GPRELLOW = 18;
  R_ALPHA_GPREL16 = 19;
  R_ALPHA_COPY = 24;
  R_ALPHA_GLOB_DAT = 25;
  R_ALPHA_JMP_SLOT = 26;
  R_ALPHA_RELATIVE = 27;
  R_ALPHA_TLS_GD_HI = 28;  
  R_ALPHA_TLSGD = 29;  
  R_ALPHA_TLS_LDM = 30;  
  R_ALPHA_DTPMOD64 = 31;  
  R_ALPHA_GOTDTPREL = 32;  
  R_ALPHA_DTPREL64 = 33;  
  R_ALPHA_DTPRELHI = 34;  
  R_ALPHA_DTPRELLO = 35;  
  R_ALPHA_DTPREL16 = 36;  
  R_ALPHA_GOTTPREL = 37;  
  R_ALPHA_TPREL64 = 38;  
  R_ALPHA_TPRELHI = 39;  
  R_ALPHA_TPRELLO = 40;  
  R_ALPHA_TPREL16 = 41;  
  R_ALPHA_NUM = 46;
  LITUSE_ALPHA_ADDR = 0;
  LITUSE_ALPHA_BASE = 1;  
  LITUSE_ALPHA_BYTOFF = 2;  
  LITUSE_ALPHA_JSR = 3;  
  LITUSE_ALPHA_TLS_GD = 4;  
  LITUSE_ALPHA_TLS_LDM = 5;  
  DT_ALPHA_PLTRO = DT_LOPROC+0;
  DT_ALPHA_NUM = 1;  
  EF_PPC_EMB = $80000000;
  EF_PPC_RELOCATABLE = $00010000;
  EF_PPC_RELOCATABLE_LIB = $00008000;
  R_PPC_NONE = 0;
  R_PPC_ADDR32 = 1;
  R_PPC_ADDR24 = 2;
  R_PPC_ADDR16 = 3;
  R_PPC_ADDR16_LO = 4;
  R_PPC_ADDR16_HI = 5;
  R_PPC_ADDR16_HA = 6;
  R_PPC_ADDR14 = 7;
  R_PPC_ADDR14_BRTAKEN = 8;  
  R_PPC_ADDR14_BRNTAKEN = 9;  
  R_PPC_REL24 = 10;
  R_PPC_REL14 = 11;
  R_PPC_REL14_BRTAKEN = 12;  
  R_PPC_REL14_BRNTAKEN = 13;  
  R_PPC_GOT16 = 14;  
  R_PPC_GOT16_LO = 15;  
  R_PPC_GOT16_HI = 16;  
  R_PPC_GOT16_HA = 17;  
  R_PPC_PLTREL24 = 18;  
  R_PPC_COPY = 19;  
  R_PPC_GLOB_DAT = 20;  
  R_PPC_JMP_SLOT = 21;  
  R_PPC_RELATIVE = 22;  
  R_PPC_LOCAL24PC = 23;  
  R_PPC_UADDR32 = 24;  
  R_PPC_UADDR16 = 25;  
  R_PPC_REL32 = 26;  
  R_PPC_PLT32 = 27;  
  R_PPC_PLTREL32 = 28;  
  R_PPC_PLT16_LO = 29;  
  R_PPC_PLT16_HI = 30;  
  R_PPC_PLT16_HA = 31;  
  R_PPC_SDAREL16 = 32;  
  R_PPC_SECTOFF = 33;  
  R_PPC_SECTOFF_LO = 34;  
  R_PPC_SECTOFF_HI = 35;  
  R_PPC_SECTOFF_HA = 36;  
  R_PPC_TLS = 67;
  R_PPC_DTPMOD32 = 68;
  R_PPC_TPREL16 = 69;
  R_PPC_TPREL16_LO = 70;
  R_PPC_TPREL16_HI = 71;
  R_PPC_TPREL16_HA = 72;
  R_PPC_TPREL32 = 73;
  R_PPC_DTPREL16 = 74;
  R_PPC_DTPREL16_LO = 75;
  R_PPC_DTPREL16_HI = 76;
  R_PPC_DTPREL16_HA = 77;
  R_PPC_DTPREL32 = 78;
  R_PPC_GOT_TLSGD16 = 79;
  R_PPC_GOT_TLSGD16_LO = 80;
  R_PPC_GOT_TLSGD16_HI = 81;
  R_PPC_GOT_TLSGD16_HA = 82;
  R_PPC_GOT_TLSLD16 = 83;
  R_PPC_GOT_TLSLD16_LO = 84;
  R_PPC_GOT_TLSLD16_HI = 85;
  R_PPC_GOT_TLSLD16_HA = 86;
  R_PPC_GOT_TPREL16 = 87;
  R_PPC_GOT_TPREL16_LO = 88;
  R_PPC_GOT_TPREL16_HI = 89;
  R_PPC_GOT_TPREL16_HA = 90;
  R_PPC_GOT_DTPREL16 = 91;
  R_PPC_GOT_DTPREL16_LO = 92;
  R_PPC_GOT_DTPREL16_HI = 93;
  R_PPC_GOT_DTPREL16_HA = 94;
  R_PPC_TLSGD = 95;
  R_PPC_TLSLD = 96;
  R_PPC_EMB_NADDR32 = 101;
  R_PPC_EMB_NADDR16 = 102;  
  R_PPC_EMB_NADDR16_LO = 103;  
  R_PPC_EMB_NADDR16_HI = 104;  
  R_PPC_EMB_NADDR16_HA = 105;  
  R_PPC_EMB_SDAI16 = 106;  
  R_PPC_EMB_SDA2I16 = 107;  
  R_PPC_EMB_SDA2REL = 108;  
  R_PPC_EMB_SDA21 = 109;
  R_PPC_EMB_MRKREF = 110;  
  R_PPC_EMB_RELSEC16 = 111;  
  R_PPC_EMB_RELST_LO = 112;  
  R_PPC_EMB_RELST_HI = 113;  
  R_PPC_EMB_RELST_HA = 114;  
  R_PPC_EMB_BIT_FLD = 115;  
  R_PPC_EMB_RELSDA = 116;
  R_PPC_DIAB_SDA21_LO = 180;
  R_PPC_DIAB_SDA21_HI = 181;
  R_PPC_DIAB_SDA21_HA = 182;
  R_PPC_DIAB_RELSDA_LO = 183;
  R_PPC_DIAB_RELSDA_HI = 184;
  R_PPC_DIAB_RELSDA_HA = 185;
  R_PPC_IRELATIVE = 248;
  R_PPC_REL16 = 249;
  R_PPC_REL16_LO = 250;
  R_PPC_REL16_HI = 251;
  R_PPC_REL16_HA = 252;
  R_PPC_TOC16 = 255;
  DT_PPC_GOT = DT_LOPROC+0;
  DT_PPC_OPT = DT_LOPROC+1;  
  DT_PPC_NUM = 2;  
  PPC_OPT_TLS = 1;
  R_PPC64_NONE = R_PPC_NONE;
  R_PPC64_ADDR32 = R_PPC_ADDR32;
  R_PPC64_ADDR24 = R_PPC_ADDR24;
  R_PPC64_ADDR16 = R_PPC_ADDR16;
  R_PPC64_ADDR16_LO = R_PPC_ADDR16_LO;
  R_PPC64_ADDR16_HI = R_PPC_ADDR16_HI;
  R_PPC64_ADDR16_HA = R_PPC_ADDR16_HA;
  R_PPC64_ADDR14 = R_PPC_ADDR14;
  R_PPC64_ADDR14_BRTAKEN = R_PPC_ADDR14_BRTAKEN;  
  R_PPC64_ADDR14_BRNTAKEN = R_PPC_ADDR14_BRNTAKEN;  
  R_PPC64_REL24 = R_PPC_REL24;
  R_PPC64_REL14 = R_PPC_REL14;
  R_PPC64_REL14_BRTAKEN = R_PPC_REL14_BRTAKEN;  
  R_PPC64_REL14_BRNTAKEN = R_PPC_REL14_BRNTAKEN;  
  R_PPC64_GOT16 = R_PPC_GOT16;  
  R_PPC64_GOT16_LO = R_PPC_GOT16_LO;  
  R_PPC64_GOT16_HI = R_PPC_GOT16_HI;  
  R_PPC64_GOT16_HA = R_PPC_GOT16_HA;  
  R_PPC64_COPY = R_PPC_COPY;  
  R_PPC64_GLOB_DAT = R_PPC_GLOB_DAT;  
  R_PPC64_JMP_SLOT = R_PPC_JMP_SLOT;  
  R_PPC64_RELATIVE = R_PPC_RELATIVE;  
  R_PPC64_UADDR32 = R_PPC_UADDR32;  
  R_PPC64_UADDR16 = R_PPC_UADDR16;  
  R_PPC64_REL32 = R_PPC_REL32;  
  R_PPC64_PLT32 = R_PPC_PLT32;  
  R_PPC64_PLTREL32 = R_PPC_PLTREL32;  
  R_PPC64_PLT16_LO = R_PPC_PLT16_LO;  
  R_PPC64_PLT16_HI = R_PPC_PLT16_HI;  
  R_PPC64_PLT16_HA = R_PPC_PLT16_HA;  
  R_PPC64_SECTOFF = R_PPC_SECTOFF;  
  R_PPC64_SECTOFF_LO = R_PPC_SECTOFF_LO;  
  R_PPC64_SECTOFF_HI = R_PPC_SECTOFF_HI;  
  R_PPC64_SECTOFF_HA = R_PPC_SECTOFF_HA;  
  R_PPC64_ADDR30 = 37;
  R_PPC64_ADDR64 = 38;
  R_PPC64_ADDR16_HIGHER = 39;
  R_PPC64_ADDR16_HIGHERA = 40;
  R_PPC64_ADDR16_HIGHEST = 41;
  R_PPC64_ADDR16_HIGHESTA = 42;
  R_PPC64_UADDR64 = 43;
  R_PPC64_REL64 = 44;
  R_PPC64_PLT64 = 45;
  R_PPC64_PLTREL64 = 46;
  R_PPC64_TOC16 = 47;
  R_PPC64_TOC16_LO = 48;
  R_PPC64_TOC16_HI = 49;
  R_PPC64_TOC16_HA = 50;
  R_PPC64_TOC = 51;
  R_PPC64_PLTGOT16 = 52;
  R_PPC64_PLTGOT16_LO = 53;
  R_PPC64_PLTGOT16_HI = 54;
  R_PPC64_PLTGOT16_HA = 55;
  R_PPC64_ADDR16_DS = 56;
  R_PPC64_ADDR16_LO_DS = 57;
  R_PPC64_GOT16_DS = 58;
  R_PPC64_GOT16_LO_DS = 59;
  R_PPC64_PLT16_LO_DS = 60;
  R_PPC64_SECTOFF_DS = 61;
  R_PPC64_SECTOFF_LO_DS = 62;
  R_PPC64_TOC16_DS = 63;
  R_PPC64_TOC16_LO_DS = 64;
  R_PPC64_PLTGOT16_DS = 65;
  R_PPC64_PLTGOT16_LO_DS = 66;
  R_PPC64_TLS = 67;
  R_PPC64_DTPMOD64 = 68;
  R_PPC64_TPREL16 = 69;
  R_PPC64_TPREL16_LO = 70;
  R_PPC64_TPREL16_HI = 71;
  R_PPC64_TPREL16_HA = 72;
  R_PPC64_TPREL64 = 73;
  R_PPC64_DTPREL16 = 74;
  R_PPC64_DTPREL16_LO = 75;
  R_PPC64_DTPREL16_HI = 76;
  R_PPC64_DTPREL16_HA = 77;
  R_PPC64_DTPREL64 = 78;
  R_PPC64_GOT_TLSGD16 = 79;
  R_PPC64_GOT_TLSGD16_LO = 80;
  R_PPC64_GOT_TLSGD16_HI = 81;
  R_PPC64_GOT_TLSGD16_HA = 82;
  R_PPC64_GOT_TLSLD16 = 83;
  R_PPC64_GOT_TLSLD16_LO = 84;
  R_PPC64_GOT_TLSLD16_HI = 85;
  R_PPC64_GOT_TLSLD16_HA = 86;
  R_PPC64_GOT_TPREL16_DS = 87;
  R_PPC64_GOT_TPREL16_LO_DS = 88;
  R_PPC64_GOT_TPREL16_HI = 89;
  R_PPC64_GOT_TPREL16_HA = 90;
  R_PPC64_GOT_DTPREL16_DS = 91;
  R_PPC64_GOT_DTPREL16_LO_DS = 92;
  R_PPC64_GOT_DTPREL16_HI = 93;
  R_PPC64_GOT_DTPREL16_HA = 94;
  R_PPC64_TPREL16_DS = 95;
  R_PPC64_TPREL16_LO_DS = 96;
  R_PPC64_TPREL16_HIGHER = 97;
  R_PPC64_TPREL16_HIGHERA = 98;
  R_PPC64_TPREL16_HIGHEST = 99;
  R_PPC64_TPREL16_HIGHESTA = 100;
  R_PPC64_DTPREL16_DS = 101;
  R_PPC64_DTPREL16_LO_DS = 102;
  R_PPC64_DTPREL16_HIGHER = 103;
  R_PPC64_DTPREL16_HIGHERA = 104;
  R_PPC64_DTPREL16_HIGHEST = 105;
  R_PPC64_DTPREL16_HIGHESTA = 106;
  R_PPC64_TLSGD = 107;
  R_PPC64_TLSLD = 108;
  R_PPC64_TOCSAVE = 109;
  R_PPC64_ADDR16_HIGH = 110;
  R_PPC64_ADDR16_HIGHA = 111;  
  R_PPC64_TPREL16_HIGH = 112;  
  R_PPC64_TPREL16_HIGHA = 113;  
  R_PPC64_DTPREL16_HIGH = 114;  
  R_PPC64_DTPREL16_HIGHA = 115;  
  R_PPC64_JMP_IREL = 247;
  R_PPC64_IRELATIVE = 248;  
  R_PPC64_REL16 = 249;
  R_PPC64_REL16_LO = 250;
  R_PPC64_REL16_HI = 251;
  R_PPC64_REL16_HA = 252;
  EF_PPC64_ABI = 3;
  DT_PPC64_GLINK = DT_LOPROC+0;
  DT_PPC64_OPD = DT_LOPROC+1;  
  DT_PPC64_OPDSZ = DT_LOPROC+2;  
  DT_PPC64_OPT = DT_LOPROC+3;  
  DT_PPC64_NUM = 4;  
  PPC64_OPT_TLS = 1;
  PPC64_OPT_MULTI_TOC = 2;  
  PPC64_OPT_LOCALENTRY = 4;  
  STO_PPC64_LOCAL_BIT = 5;
  STO_PPC64_LOCAL_MASK = 7 shl STO_PPC64_LOCAL_BIT;  

function PPC64_LOCAL_ENTRY_OFFSET(other : longint) : longint;

{ ARM specific declarations  }
{ Processor specific flags for the ELF header e_flags field.   }
const
  EF_ARM_RELEXEC = $01;  
  EF_ARM_HASENTRY = $02;  
  EF_ARM_INTERWORK = $04;  
  EF_ARM_APCS_26 = $08;  
  EF_ARM_APCS_FLOAT = $10;  
  EF_ARM_PIC = $20;  
{ 8-bit structure alignment is in use  }
  EF_ARM_ALIGN8 = $40;  
  EF_ARM_NEW_ABI = $80;  
  EF_ARM_OLD_ABI = $100;  
  EF_ARM_SOFT_FLOAT = $200;  
  EF_ARM_VFP_FLOAT = $400;  
  EF_ARM_MAVERICK_FLOAT = $800;  
{ NB conflicts with EF_ARM_SOFT_FLOAT  }
  EF_ARM_ABI_FLOAT_SOFT = $200;  
{ NB conflicts with EF_ARM_VFP_FLOAT  }
  EF_ARM_ABI_FLOAT_HARD = $400;  
{ Other constants defined in the ARM ELF spec. version B-01.   }
{ NB. These conflict with values defined above.   }
  EF_ARM_SYMSARESORTED = $04;  
  EF_ARM_DYNSYMSUSESEGIDX = $08;  
  EF_ARM_MAPSYMSFIRST = $10;  
{ xxxxxxxxxxxxxxxxxxx #define EF_ARM_EABIMASK		0XFF000000 }
{ Constants defined in AAELF.   }
  EF_ARM_BE8 = $00800000;  
  EF_ARM_LE8 = $00400000;  
{ was #define dname(params) para_def_expr }
{ argument types are unknown }

function EF_ARM_EABI_VERSION(flags : longint) : Tflags;

const
  EF_ARM_EABI_UNKNOWN = $00000000;  
  EF_ARM_EABI_VER1 = $01000000;  
  EF_ARM_EABI_VER2 = $02000000;  
  EF_ARM_EABI_VER3 = $03000000;  
  EF_ARM_EABI_VER4 = $04000000;  
  EF_ARM_EABI_VER5 = $05000000;  
{ Additional symbol types for Thumb.   }
{ A Thumb function.   }
  STT_ARM_TFUNC = STT_LOPROC;  
{ A Thumb label.   }
  STT_ARM_16BIT = STT_HIPROC;  
{ ARM-specific values for sh_flags  }
{ Section contains an entry point  }
  SHF_ARM_ENTRYSECT = $10000000;  
{ Section may be multiply defined
					      in the input to a link step.   }
  SHF_ARM_COMDEF = $80000000;  
{ ARM-specific program header flags  }
{ Segment contains the location
					      addressed by the static base.  }
  PF_ARM_SB = $10000000;  
{ Position-independent segment.   }
  PF_ARM_PI = $20000000;  
{ Absolute segment.   }
  PF_ARM_ABS = $40000000;  
{ Processor specific values for the Phdr p_type field.   }
{ ARM unwind segment.   }
  PT_ARM_EXIDX = PT_LOPROC+1;  
{ Processor specific values for the Shdr sh_type field.   }
{ ARM unwind section.   }
  SHT_ARM_EXIDX = SHT_LOPROC+1;  
{ Preemption details.   }
  SHT_ARM_PREEMPTMAP = SHT_LOPROC+2;  
{ ARM attributes section.   }
  SHT_ARM_ATTRIBUTES = SHT_LOPROC+3;  
{ AArch64 relocs.   }
{ No relocation.   }
  R_AARCH64_NONE = 0;  
{ ILP32 AArch64 relocs.   }
{ Direct 32 bit.   }
  R_AARCH64_P32_ABS32 = 1;  
{ Copy symbol at runtime.   }
  R_AARCH64_P32_COPY = 180;  
{ Create GOT entry.   }
  R_AARCH64_P32_GLOB_DAT = 181;  
{ Create PLT entry.   }
  R_AARCH64_P32_JUMP_SLOT = 182;  
{ Adjust by program base.   }
  R_AARCH64_P32_RELATIVE = 183;  
{ Module number, 32 bit.   }
  R_AARCH64_P32_TLS_DTPMOD = 184;  
{ Module-relative offset, 32 bit.   }
  R_AARCH64_P32_TLS_DTPREL = 185;  
{ TP-relative offset, 32 bit.   }
  R_AARCH64_P32_TLS_TPREL = 186;  
{ TLS Descriptor.   }
  R_AARCH64_P32_TLSDESC = 187;  
{ STT_GNU_IFUNC relocation.  }
  R_AARCH64_P32_IRELATIVE = 188;  
{ LP64 AArch64 relocs.   }
{ Direct 64 bit.  }
  R_AARCH64_ABS64 = 257;  
{ Direct 32 bit.   }
  R_AARCH64_ABS32 = 258;  
{ Direct 16-bit.   }
  R_AARCH64_ABS16 = 259;  
{ PC-relative 64-bit.	 }
  R_AARCH64_PREL64 = 260;  
{ PC-relative 32-bit.	 }
  R_AARCH64_PREL32 = 261;  
{ PC-relative 16-bit.	 }
  R_AARCH64_PREL16 = 262;  
{ Dir. MOVZ imm. from bits 15:0.   }
  R_AARCH64_MOVW_UABS_G0 = 263;  
{ Likewise for MOVK; no check.   }
  R_AARCH64_MOVW_UABS_G0_NC = 264;  
{ Dir. MOVZ imm. from bits 31:16.   }
  R_AARCH64_MOVW_UABS_G1 = 265;  
{ Likewise for MOVK; no check.   }
  R_AARCH64_MOVW_UABS_G1_NC = 266;  
{ Dir. MOVZ imm. from bits 47:32.   }
  R_AARCH64_MOVW_UABS_G2 = 267;  
{ Likewise for MOVK; no check.   }
  R_AARCH64_MOVW_UABS_G2_NC = 268;  
{ Dir. MOVK,Z imm. from 63:48.   }
  R_AARCH64_MOVW_UABS_G3 = 269;  
{ Dir. MOVN,Z imm. from 15:0.   }
  R_AARCH64_MOVW_SABS_G0 = 270;  
{ Dir. MOVN,Z imm. from 31:16.   }
  R_AARCH64_MOVW_SABS_G1 = 271;  
{ Dir. MOVN,Z imm. from 47:32.   }
  R_AARCH64_MOVW_SABS_G2 = 272;  
{ PC-rel. LD imm. from bits 20:2.   }
  R_AARCH64_LD_PREL_LO19 = 273;  
{ PC-rel. ADR imm. from bits 20:0.   }
  R_AARCH64_ADR_PREL_LO21 = 274;  
{ Page-rel. ADRP imm. from 32:12.   }
  R_AARCH64_ADR_PREL_PG_HI21 = 275;  
{ Likewise; no overflow check.   }
  R_AARCH64_ADR_PREL_PG_HI21_NC = 276;  
{ Dir. ADD imm. from bits 11:0.   }
  R_AARCH64_ADD_ABS_LO12_NC = 277;  
{ Likewise for LD/ST; no check.  }
  R_AARCH64_LDST8_ABS_LO12_NC = 278;  
{ PC-rel. TBZ/TBNZ imm. from 15:2.   }
  R_AARCH64_TSTBR14 = 279;  
{ PC-rel. cond. br. imm. from 20:2.  }
  R_AARCH64_CONDBR19 = 280;  
{ PC-rel. B imm. from bits 27:2.   }
  R_AARCH64_JUMP26 = 282;  
{ Likewise for CALL.   }
  R_AARCH64_CALL26 = 283;  
{ Dir. ADD imm. from bits 11:1.   }
  R_AARCH64_LDST16_ABS_LO12_NC = 284;  
{ Likewise for bits 11:2.   }
  R_AARCH64_LDST32_ABS_LO12_NC = 285;  
{ Likewise for bits 11:3.   }
  R_AARCH64_LDST64_ABS_LO12_NC = 286;  
{ PC-rel. MOVN,Z imm. from 15:0.   }
  R_AARCH64_MOVW_PREL_G0 = 287;  
{ Likewise for MOVK; no check.   }
  R_AARCH64_MOVW_PREL_G0_NC = 288;  
{ PC-rel. MOVN,Z imm. from 31:16.  }
  R_AARCH64_MOVW_PREL_G1 = 289;  
{ Likewise for MOVK; no check.   }
  R_AARCH64_MOVW_PREL_G1_NC = 290;  
{ PC-rel. MOVN,Z imm. from 47:32.  }
  R_AARCH64_MOVW_PREL_G2 = 291;  
{ Likewise for MOVK; no check.   }
  R_AARCH64_MOVW_PREL_G2_NC = 292;  
{ PC-rel. MOVN,Z imm. from 63:48.  }
  R_AARCH64_MOVW_PREL_G3 = 293;  
{ Dir. ADD imm. from bits 11:4.   }
  R_AARCH64_LDST128_ABS_LO12_NC = 299;  
{ GOT-rel. off. MOVN,Z imm. 15:0.  }
  R_AARCH64_MOVW_GOTOFF_G0 = 300;  
{ Likewise for MOVK; no check.   }
  R_AARCH64_MOVW_GOTOFF_G0_NC = 301;  
{ GOT-rel. o. MOVN,Z imm. 31:16.   }
  R_AARCH64_MOVW_GOTOFF_G1 = 302;  
{ Likewise for MOVK; no check.   }
  R_AARCH64_MOVW_GOTOFF_G1_NC = 303;  
{ GOT-rel. o. MOVN,Z imm. 47:32.   }
  R_AARCH64_MOVW_GOTOFF_G2 = 304;  
{ Likewise for MOVK; no check.   }
  R_AARCH64_MOVW_GOTOFF_G2_NC = 305;  
{ GOT-rel. o. MOVN,Z imm. 63:48.   }
  R_AARCH64_MOVW_GOTOFF_G3 = 306;  
{ GOT-relative 64-bit.   }
  R_AARCH64_GOTREL64 = 307;  
{ GOT-relative 32-bit.   }
  R_AARCH64_GOTREL32 = 308;  
{ PC-rel. GOT off. load imm. 20:2.   }
  R_AARCH64_GOT_LD_PREL19 = 309;  
{ GOT-rel. off. LD/ST imm. 14:3.   }
  R_AARCH64_LD64_GOTOFF_LO15 = 310;  
{ P-page-rel. GOT off. ADRP 32:12.   }
  R_AARCH64_ADR_GOT_PAGE = 311;  
{ Dir. GOT off. LD/ST imm. 11:3.   }
  R_AARCH64_LD64_GOT_LO12_NC = 312;  
{ GOT-page-rel. GOT off. LD/ST 14:3  }
  R_AARCH64_LD64_GOTPAGE_LO15 = 313;  
{ PC-relative ADR imm. 20:0.   }
  R_AARCH64_TLSGD_ADR_PREL21 = 512;  
{ page-rel. ADRP imm. 32:12.   }
  R_AARCH64_TLSGD_ADR_PAGE21 = 513;  
{ direct ADD imm. from 11:0.   }
  R_AARCH64_TLSGD_ADD_LO12_NC = 514;  
{ GOT-rel. MOVN,Z 31:16.   }
  R_AARCH64_TLSGD_MOVW_G1 = 515;  
{ GOT-rel. MOVK imm. 15:0.   }
  R_AARCH64_TLSGD_MOVW_G0_NC = 516;  
{ Like 512; local dynamic model.   }
  R_AARCH64_TLSLD_ADR_PREL21 = 517;  
{ Like 513; local dynamic model.   }
  R_AARCH64_TLSLD_ADR_PAGE21 = 518;  
{ Like 514; local dynamic model.   }
  R_AARCH64_TLSLD_ADD_LO12_NC = 519;  
{ Like 515; local dynamic model.   }
  R_AARCH64_TLSLD_MOVW_G1 = 520;  
{ Like 516; local dynamic model.   }
  R_AARCH64_TLSLD_MOVW_G0_NC = 521;  
{ TLS PC-rel. load imm. 20:2.   }
  R_AARCH64_TLSLD_LD_PREL19 = 522;  
{ TLS DTP-rel. MOVN,Z 47:32.   }
  R_AARCH64_TLSLD_MOVW_DTPREL_G2 = 523;  
{ TLS DTP-rel. MOVN,Z 31:16.   }
  R_AARCH64_TLSLD_MOVW_DTPREL_G1 = 524;  
{ Likewise; MOVK; no check.   }
  R_AARCH64_TLSLD_MOVW_DTPREL_G1_NC = 525;  
{ TLS DTP-rel. MOVN,Z 15:0.   }
  R_AARCH64_TLSLD_MOVW_DTPREL_G0 = 526;  
{ Likewise; MOVK; no check.   }
  R_AARCH64_TLSLD_MOVW_DTPREL_G0_NC = 527;  
{ DTP-rel. ADD imm. from 23:12.  }
  R_AARCH64_TLSLD_ADD_DTPREL_HI12 = 528;  
{ DTP-rel. ADD imm. from 11:0.   }
  R_AARCH64_TLSLD_ADD_DTPREL_LO12 = 529;  
{ Likewise; no ovfl. check.   }
  R_AARCH64_TLSLD_ADD_DTPREL_LO12_NC = 530;  
{ DTP-rel. LD/ST imm. 11:0.   }
  R_AARCH64_TLSLD_LDST8_DTPREL_LO12 = 531;  
{ Likewise; no check.   }
  R_AARCH64_TLSLD_LDST8_DTPREL_LO12_NC = 532;  
{ DTP-rel. LD/ST imm. 11:1.   }
  R_AARCH64_TLSLD_LDST16_DTPREL_LO12 = 533;  
{ Likewise; no check.   }
  R_AARCH64_TLSLD_LDST16_DTPREL_LO12_NC = 534;  
{ DTP-rel. LD/ST imm. 11:2.   }
  R_AARCH64_TLSLD_LDST32_DTPREL_LO12 = 535;  
{ Likewise; no check.   }
  R_AARCH64_TLSLD_LDST32_DTPREL_LO12_NC = 536;  
{ DTP-rel. LD/ST imm. 11:3.   }
  R_AARCH64_TLSLD_LDST64_DTPREL_LO12 = 537;  
{ Likewise; no check.   }
  R_AARCH64_TLSLD_LDST64_DTPREL_LO12_NC = 538;  
{ GOT-rel. MOVN,Z 31:16.   }
  R_AARCH64_TLSIE_MOVW_GOTTPREL_G1 = 539;  
{ GOT-rel. MOVK 15:0.   }
  R_AARCH64_TLSIE_MOVW_GOTTPREL_G0_NC = 540;  
{ Page-rel. ADRP 32:12.   }
  R_AARCH64_TLSIE_ADR_GOTTPREL_PAGE21 = 541;  
{ Direct LD off. 11:3.   }
  R_AARCH64_TLSIE_LD64_GOTTPREL_LO12_NC = 542;  
{ PC-rel. load imm. 20:2.   }
  R_AARCH64_TLSIE_LD_GOTTPREL_PREL19 = 543;  
{ TLS TP-rel. MOVN,Z 47:32.   }
  R_AARCH64_TLSLE_MOVW_TPREL_G2 = 544;  
{ TLS TP-rel. MOVN,Z 31:16.   }
  R_AARCH64_TLSLE_MOVW_TPREL_G1 = 545;  
{ Likewise; MOVK; no check.   }
  R_AARCH64_TLSLE_MOVW_TPREL_G1_NC = 546;  
{ TLS TP-rel. MOVN,Z 15:0.   }
  R_AARCH64_TLSLE_MOVW_TPREL_G0 = 547;  
{ Likewise; MOVK; no check.   }
  R_AARCH64_TLSLE_MOVW_TPREL_G0_NC = 548;  
{ TP-rel. ADD imm. 23:12.   }
  R_AARCH64_TLSLE_ADD_TPREL_HI12 = 549;  
{ TP-rel. ADD imm. 11:0.   }
  R_AARCH64_TLSLE_ADD_TPREL_LO12 = 550;  
{ Likewise; no ovfl. check.   }
  R_AARCH64_TLSLE_ADD_TPREL_LO12_NC = 551;  
{ TP-rel. LD/ST off. 11:0.   }
  R_AARCH64_TLSLE_LDST8_TPREL_LO12 = 552;  
{ Likewise; no ovfl. check.  }
  R_AARCH64_TLSLE_LDST8_TPREL_LO12_NC = 553;  
{ TP-rel. LD/ST off. 11:1.   }
  R_AARCH64_TLSLE_LDST16_TPREL_LO12 = 554;  
{ Likewise; no check.   }
  R_AARCH64_TLSLE_LDST16_TPREL_LO12_NC = 555;  
{ TP-rel. LD/ST off. 11:2.   }
  R_AARCH64_TLSLE_LDST32_TPREL_LO12 = 556;  
{ Likewise; no check.   }
  R_AARCH64_TLSLE_LDST32_TPREL_LO12_NC = 557;  
{ TP-rel. LD/ST off. 11:3.   }
  R_AARCH64_TLSLE_LDST64_TPREL_LO12 = 558;  
{ Likewise; no check.   }
  R_AARCH64_TLSLE_LDST64_TPREL_LO12_NC = 559;  
{ PC-rel. load immediate 20:2.   }
  R_AARCH64_TLSDESC_LD_PREL19 = 560;  
{ PC-rel. ADR immediate 20:0.   }
  R_AARCH64_TLSDESC_ADR_PREL21 = 561;  
{ Page-rel. ADRP imm. 32:12.   }
  R_AARCH64_TLSDESC_ADR_PAGE21 = 562;  
{ Direct LD off. from 11:3.   }
  R_AARCH64_TLSDESC_LD64_LO12 = 563;  
{ Direct ADD imm. from 11:0.   }
  R_AARCH64_TLSDESC_ADD_LO12 = 564;  
{ GOT-rel. MOVN,Z imm. 31:16.   }
  R_AARCH64_TLSDESC_OFF_G1 = 565;  
{ GOT-rel. MOVK imm. 15:0; no ck.   }
  R_AARCH64_TLSDESC_OFF_G0_NC = 566;  
{ Relax LDR.   }
  R_AARCH64_TLSDESC_LDR = 567;  
{ Relax ADD.   }
  R_AARCH64_TLSDESC_ADD = 568;  
{ Relax BLR.   }
  R_AARCH64_TLSDESC_CALL = 569;  
{ TP-rel. LD/ST off. 11:4.   }
  R_AARCH64_TLSLE_LDST128_TPREL_LO12 = 570;  
{ Likewise; no check.   }
  R_AARCH64_TLSLE_LDST128_TPREL_LO12_NC = 571;  
{ DTP-rel. LD/ST imm. 11:4.  }
  R_AARCH64_TLSLD_LDST128_DTPREL_LO12 = 572;  
{ Likewise; no check.   }
  R_AARCH64_TLSLD_LDST128_DTPREL_LO12_NC = 573;  
{ Copy symbol at runtime.   }
  R_AARCH64_COPY = 1024;  
{ Create GOT entry.   }
  R_AARCH64_GLOB_DAT = 1025;  
{ Create PLT entry.   }
  R_AARCH64_JUMP_SLOT = 1026;  
{ Adjust by program base.   }
  R_AARCH64_RELATIVE = 1027;  
{ Module number, 64 bit.   }
  R_AARCH64_TLS_DTPMOD = 1028;  
{ Module-relative offset, 64 bit.   }
  R_AARCH64_TLS_DTPREL = 1029;  
{ TP-relative offset, 64 bit.   }
  R_AARCH64_TLS_TPREL = 1030;  
{ TLS Descriptor.   }
  R_AARCH64_TLSDESC = 1031;  
{ STT_GNU_IFUNC relocation.   }
  R_AARCH64_IRELATIVE = 1032;  
{ MTE memory tag segment type.   }
  PT_AARCH64_MEMTAG_MTE = PT_LOPROC+2;  
{ AArch64 specific values for the Dyn d_tag field.   }
  DT_AARCH64_BTI_PLT = DT_LOPROC+1;  
  DT_AARCH64_PAC_PLT = DT_LOPROC+3;  
  DT_AARCH64_VARIANT_PCS = DT_LOPROC+5;  
  DT_AARCH64_NUM = 6;  
{ AArch64 specific values for the st_other field.   }
  STO_AARCH64_VARIANT_PCS = $80;  
{ ARM relocs.   }
{ No reloc  }
  R_ARM_NONE = 0;  
{ Deprecated PC relative 26
					   bit branch.   }
  R_ARM_PC24 = 1;  
{ Direct 32 bit   }
  R_ARM_ABS32 = 2;  
{ PC relative 32 bit  }
  R_ARM_REL32 = 3;  
  R_ARM_PC13 = 4;  
{ Direct 16 bit  }
  R_ARM_ABS16 = 5;  
{ Direct 12 bit  }
  R_ARM_ABS12 = 6;  
{ Direct & 0x7C (LDR, STR).   }
  R_ARM_THM_ABS5 = 7;  
{ Direct 8 bit  }
  R_ARM_ABS8 = 8;  
  R_ARM_SBREL32 = 9;  
{ PC relative 24 bit (Thumb32 BL).   }
  R_ARM_THM_PC22 = 10;  
{ PC relative & 0x3FC
					   (Thumb16 LDR, ADD, ADR).   }
  R_ARM_THM_PC8 = 11;  
  R_ARM_AMP_VCALL9 = 12;  
{ Obsolete static relocation.   }
  R_ARM_SWI24 = 13;  
{ Dynamic relocation.   }
  R_ARM_TLS_DESC = 13;  
{ Reserved.   }
  R_ARM_THM_SWI8 = 14;  
{ Reserved.   }
  R_ARM_XPC25 = 15;  
{ Reserved.   }
  R_ARM_THM_XPC22 = 16;  
{ ID of module containing symbol  }
  R_ARM_TLS_DTPMOD32 = 17;  
{ Offset in TLS block  }
  R_ARM_TLS_DTPOFF32 = 18;  
{ Offset in static TLS block  }
  R_ARM_TLS_TPOFF32 = 19;  
{ Copy symbol at runtime  }
  R_ARM_COPY = 20;  
{ Create GOT entry  }
  R_ARM_GLOB_DAT = 21;  
{ Create PLT entry  }
  R_ARM_JUMP_SLOT = 22;  
{ Adjust by program base  }
  R_ARM_RELATIVE = 23;  
{ 32 bit offset to GOT  }
  R_ARM_GOTOFF = 24;  
{ 32 bit PC relative offset to GOT  }
  R_ARM_GOTPC = 25;  
{ 32 bit GOT entry  }
  R_ARM_GOT32 = 26;  
{ Deprecated, 32 bit PLT address.   }
  R_ARM_PLT32 = 27;  
{ PC relative 24 bit (BL, BLX).   }
  R_ARM_CALL = 28;  
{ PC relative 24 bit
					   (B, BL<cond>).   }
  R_ARM_JUMP24 = 29;  
{ PC relative 24 bit (Thumb32 B.W).   }
  R_ARM_THM_JUMP24 = 30;  
{ Adjust by program base.   }
  R_ARM_BASE_ABS = 31;  
{ Obsolete.   }
  R_ARM_ALU_PCREL_7_0 = 32;  
{ Obsolete.   }
  R_ARM_ALU_PCREL_15_8 = 33;  
{ Obsolete.   }
  R_ARM_ALU_PCREL_23_15 = 34;  
{ Deprecated, prog. base relative.   }
  R_ARM_LDR_SBREL_11_0 = 35;  
{ Deprecated, prog. base relative.   }
  R_ARM_ALU_SBREL_19_12 = 36;  
{ Deprecated, prog. base relative.   }
  R_ARM_ALU_SBREL_27_20 = 37;  
  R_ARM_TARGET1 = 38;  
{ Program base relative.   }
  R_ARM_SBREL31 = 39;  
  R_ARM_V4BX = 40;  
  R_ARM_TARGET2 = 41;  
{ 32 bit PC relative.   }
  R_ARM_PREL31 = 42;  
{ Direct 16-bit (MOVW).   }
  R_ARM_MOVW_ABS_NC = 43;  
{ Direct high 16-bit (MOVT).   }
  R_ARM_MOVT_ABS = 44;  
{ PC relative 16-bit (MOVW).   }
  R_ARM_MOVW_PREL_NC = 45;  
{ PC relative (MOVT).   }
  R_ARM_MOVT_PREL = 46;  
{ Direct 16 bit (Thumb32 MOVW).   }
  R_ARM_THM_MOVW_ABS_NC = 47;  
{ Direct high 16 bit
					   (Thumb32 MOVT).   }
  R_ARM_THM_MOVT_ABS = 48;  
{ PC relative 16 bit
					   (Thumb32 MOVW).   }
  R_ARM_THM_MOVW_PREL_NC = 49;  
{ PC relative high 16 bit
					   (Thumb32 MOVT).   }
  R_ARM_THM_MOVT_PREL = 50;  
{ PC relative 20 bit
					   (Thumb32 B<cond>.W).   }
  R_ARM_THM_JUMP19 = 51;  
{ PC relative X & 0x7E
					   (Thumb16 CBZ, CBNZ).   }
  R_ARM_THM_JUMP6 = 52;  
{ PC relative 12 bit
					   (Thumb32 ADR.W).   }
  R_ARM_THM_ALU_PREL_11_0 = 53;  
{ PC relative 12 bit
					   (Thumb32 LDRD,SB,H,SH).   }
  R_ARM_THM_PC12 = 54;  
{ Direct 32-bit.   }
  R_ARM_ABS32_NOI = 55;  
{ PC relative 32-bit.   }
  R_ARM_REL32_NOI = 56;  
{ PC relative (ADD, SUB).   }
  R_ARM_ALU_PC_G0_NC = 57;  
{ PC relative (ADD, SUB).   }
  R_ARM_ALU_PC_G0 = 58;  
{ PC relative (ADD, SUB).   }
  R_ARM_ALU_PC_G1_NC = 59;  
{ PC relative (ADD, SUB).   }
  R_ARM_ALU_PC_G1 = 60;  
{ PC relative (ADD, SUB).   }
  R_ARM_ALU_PC_G2 = 61;  
{ PC relative (LDR,STR,LDRB,STRB).   }
  R_ARM_LDR_PC_G1 = 62;  
{ PC relative (LDR,STR,LDRB,STRB).   }
  R_ARM_LDR_PC_G2 = 63;  
{ PC relative (STRD,H,
					   LDRD,SB,H,SH).   }
  R_ARM_LDRS_PC_G0 = 64;  
{ PC relative (STRD,H,
					   LDRD,SB,H,SH).   }
  R_ARM_LDRS_PC_G1 = 65;  
{ PC relative (STRD,H,
					   LDRD,SB,H,SH).   }
  R_ARM_LDRS_PC_G2 = 66;  
{ PC relative (LDC, STC).   }
  R_ARM_LDC_PC_G0 = 67;  
{ PC relative (LDC, STC).   }
  R_ARM_LDC_PC_G1 = 68;  
{ PC relative (LDC, STC).   }
  R_ARM_LDC_PC_G2 = 69;  
{ Program base relative (ADD,SUB).   }
  R_ARM_ALU_SB_G0_NC = 70;  
{ Program base relative (ADD,SUB).   }
  R_ARM_ALU_SB_G0 = 71;  
{ Program base relative (ADD,SUB).   }
  R_ARM_ALU_SB_G1_NC = 72;  
{ Program base relative (ADD,SUB).   }
  R_ARM_ALU_SB_G1 = 73;  
{ Program base relative (ADD,SUB).   }
  R_ARM_ALU_SB_G2 = 74;  
{ Program base relative (LDR,
					   STR, LDRB, STRB).   }
  R_ARM_LDR_SB_G0 = 75;  
{ Program base relative
					   (LDR, STR, LDRB, STRB).   }
  R_ARM_LDR_SB_G1 = 76;  
{ Program base relative
					   (LDR, STR, LDRB, STRB).   }
  R_ARM_LDR_SB_G2 = 77;  
{ Program base relative
					   (LDR, STR, LDRB, STRB).   }
  R_ARM_LDRS_SB_G0 = 78;  
{ Program base relative
					   (LDR, STR, LDRB, STRB).   }
  R_ARM_LDRS_SB_G1 = 79;  
{ Program base relative
					   (LDR, STR, LDRB, STRB).   }
  R_ARM_LDRS_SB_G2 = 80;  
{ Program base relative (LDC,STC).   }
  R_ARM_LDC_SB_G0 = 81;  
{ Program base relative (LDC,STC).   }
  R_ARM_LDC_SB_G1 = 82;  
{ Program base relative (LDC,STC).   }
  R_ARM_LDC_SB_G2 = 83;  
{ Program base relative 16
					   bit (MOVW).   }
  R_ARM_MOVW_BREL_NC = 84;  
{ Program base relative high
					   16 bit (MOVT).   }
  R_ARM_MOVT_BREL = 85;  
{ Program base relative 16
					   bit (MOVW).   }
  R_ARM_MOVW_BREL = 86;  
{ Program base relative 16
					   bit (Thumb32 MOVW).   }
  R_ARM_THM_MOVW_BREL_NC = 87;  
{ Program base relative high
					   16 bit (Thumb32 MOVT).   }
  R_ARM_THM_MOVT_BREL = 88;  
{ Program base relative 16
					   bit (Thumb32 MOVW).   }
  R_ARM_THM_MOVW_BREL = 89;  
  R_ARM_TLS_GOTDESC = 90;  
  R_ARM_TLS_CALL = 91;  
{ TLS relaxation.   }
  R_ARM_TLS_DESCSEQ = 92;  
  R_ARM_THM_TLS_CALL = 93;  
  R_ARM_PLT32_ABS = 94;  
{ GOT entry.   }
  R_ARM_GOT_ABS = 95;  
{ PC relative GOT entry.   }
  R_ARM_GOT_PREL = 96;  
{ GOT entry relative to GOT
					   origin (LDR).   }
  R_ARM_GOT_BREL12 = 97;  
{ 12 bit, GOT entry relative
					   to GOT origin (LDR, STR).   }
  R_ARM_GOTOFF12 = 98;  
  R_ARM_GOTRELAX = 99;  
  R_ARM_GNU_VTENTRY = 100;  
  R_ARM_GNU_VTINHERIT = 101;  
{ PC relative & 0xFFE (Thumb16 B).   }
  R_ARM_THM_PC11 = 102;  
{ PC relative & 0x1FE
					   (Thumb16 B/B<cond>).   }
  R_ARM_THM_PC9 = 103;  
{ PC-rel 32 bit for global dynamic
					   thread local data  }
  R_ARM_TLS_GD32 = 104;  
{ PC-rel 32 bit for local dynamic
					   thread local data  }
  R_ARM_TLS_LDM32 = 105;  
{ 32 bit offset relative to TLS
					   block  }
  R_ARM_TLS_LDO32 = 106;  
{ PC-rel 32 bit for GOT entry of
					   static TLS block offset  }
  R_ARM_TLS_IE32 = 107;  
{ 32 bit offset relative to static
					   TLS block  }
  R_ARM_TLS_LE32 = 108;  
{ 12 bit relative to TLS
					   block (LDR, STR).   }
  R_ARM_TLS_LDO12 = 109;  
{ 12 bit relative to static
					   TLS block (LDR, STR).   }
  R_ARM_TLS_LE12 = 110;  
{ 12 bit GOT entry relative
					   to GOT origin (LDR).   }
  R_ARM_TLS_IE12GP = 111;  
{ Obsolete.   }
  R_ARM_ME_TOO = 128;  
  R_ARM_THM_TLS_DESCSEQ = 129;  
  R_ARM_THM_TLS_DESCSEQ16 = 129;  
  R_ARM_THM_TLS_DESCSEQ32 = 130;  
{ GOT entry relative to GOT
					   origin, 12 bit (Thumb32 LDR).   }
  R_ARM_THM_GOT_BREL12 = 131;  
  R_ARM_IRELATIVE = 160;  
  R_ARM_RXPC25 = 249;  
  R_ARM_RSBREL32 = 250;  
  R_ARM_THM_RPC22 = 251;  
  R_ARM_RREL32 = 252;  
  R_ARM_RABS22 = 253;  
  R_ARM_RPC24 = 254;  
  R_ARM_RBASE = 255;  
{ Keep this the last entry.   }
  R_ARM_NUM = 256;  
{ C-SKY  }
{ no reloc  }
  R_CKCORE_NONE = 0;  
{ direct 32 bit (S + A)  }
  R_CKCORE_ADDR32 = 1;  
{ disp ((S + A - P) >> 2) & 0xff    }
  R_CKCORE_PCRELIMM8BY4 = 2;  
{ disp ((S + A - P) >> 1) & 0x7ff   }
  R_CKCORE_PCRELIMM11BY2 = 3;  
{ 32-bit rel (S + A - P)            }
  R_CKCORE_PCREL32 = 5;  
{ disp ((S + A - P) >>1) & 0x7ff    }
  R_CKCORE_PCRELJSR_IMM11BY2 = 6;  
{ 32 bit adjust program base(B + A) }
  R_CKCORE_RELATIVE = 9;  
{ 32 bit adjust by program base     }
  R_CKCORE_COPY = 10;  
{ off between got and sym (S)       }
  R_CKCORE_GLOB_DAT = 11;  
{ PLT entry (S)  }
  R_CKCORE_JUMP_SLOT = 12;  
{ offset to GOT (S + A - GOT)       }
  R_CKCORE_GOTOFF = 13;  
{ PC offset to GOT (GOT + A - P)    }
  R_CKCORE_GOTPC = 14;  
{ 32 bit GOT entry (G)  }
  R_CKCORE_GOT32 = 15;  
{ 32 bit PLT entry (G)  }
  R_CKCORE_PLT32 = 16;  
{ GOT entry in GLOB_DAT (GOT + G)   }
  R_CKCORE_ADDRGOT = 17;  
{ PLT entry in GLOB_DAT (GOT + G)   }
  R_CKCORE_ADDRPLT = 18;  
{ ((S + A - P) >> 1) & 0x3ffffff    }
  R_CKCORE_PCREL_IMM26BY2 = 19;  
{ disp ((S + A - P) >> 1) & 0xffff  }
  R_CKCORE_PCREL_IMM16BY2 = 20;  
{ disp ((S + A - P) >> 2) & 0xffff  }
  R_CKCORE_PCREL_IMM16BY4 = 21;  
{ disp ((S + A - P) >> 1) & 0x3ff   }
  R_CKCORE_PCREL_IMM10BY2 = 22;  
{ disp ((S + A - P) >> 2) & 0x3ff   }
  R_CKCORE_PCREL_IMM10BY4 = 23;  
{ high & low 16 bit ADDR  }
  R_CKCORE_ADDR_HI16 = 24;  
{ ((S + A) >> 16) & 0xffff  }
{ (S + A) & 0xffff  }
  R_CKCORE_ADDR_LO16 = 25;  
{ high & low 16 bit GOTPC  }
  R_CKCORE_GOTPC_HI16 = 26;  
{ ((GOT + A - P) >> 16) & 0xffff  }
{ (GOT + A - P) & 0xffff  }
  R_CKCORE_GOTPC_LO16 = 27;  
{ high & low 16 bit GOTOFF  }
  R_CKCORE_GOTOFF_HI16 = 28;  
{ ((S + A - GOT) >> 16) & 0xffff  }
{ (S + A - GOT) & 0xffff  }
  R_CKCORE_GOTOFF_LO16 = 29;  
{ 12 bit disp GOT entry (G)  }
  R_CKCORE_GOT12 = 30;  
{ high & low 16 bit GOT  }
  R_CKCORE_GOT_HI16 = 31;  
{ (G >> 16) & 0xffff  }
{ (G & 0xffff)  }
  R_CKCORE_GOT_LO16 = 32;  
{ 12 bit disp PLT entry (G)  }
  R_CKCORE_PLT12 = 33;  
{ high & low 16 bit PLT  }
  R_CKCORE_PLT_HI16 = 34;  
{ (G >> 16) & 0xffff  }
{ G & 0xffff  }
  R_CKCORE_PLT_LO16 = 35;  
{ high & low 16 bit ADDRGOT  }
  R_CKCORE_ADDRGOT_HI16 = 36;  
{ (GOT + G * 4) & 0xffff  }
{ (GOT + G * 4) & 0xffff  }
  R_CKCORE_ADDRGOT_LO16 = 37;  
{ high & low 16 bit ADDRPLT  }
  R_CKCORE_ADDRPLT_HI16 = 38;  
{ ((GOT + G * 4) >> 16) & 0xFFFF  }
{ (GOT+G*4) & 0xffff  }
  R_CKCORE_ADDRPLT_LO16 = 39;  
{ disp ((S+A-P) >>1) & x3ffffff  }
  R_CKCORE_PCREL_JSR_IMM26BY2 = 40;  
{ (S+A-BTEXT) & 0xffff  }
  R_CKCORE_TOFFSET_LO16 = 41;  
{ (S+A-BTEXT) & 0xffff  }
  R_CKCORE_DOFFSET_LO16 = 42;  
{ disp ((S+A-P) >>1) & 0x3ffff  }
  R_CKCORE_PCREL_IMM18BY2 = 43;  
{ disp (S+A-BDATA) & 0x3ffff  }
  R_CKCORE_DOFFSET_IMM18 = 44;  
{ disp ((S+A-BDATA)>>1) & 0x3ffff  }
  R_CKCORE_DOFFSET_IMM18BY2 = 45;  
{ disp ((S+A-BDATA)>>2) & 0x3ffff  }
  R_CKCORE_DOFFSET_IMM18BY4 = 46;  
{ disp (G >> 2)  }
  R_CKCORE_GOT_IMM18BY4 = 48;  
{ disp (G >> 2)  }
  R_CKCORE_PLT_IMM18BY4 = 49;  
{ disp ((S+A-P) >>2) & 0x7f  }
  R_CKCORE_PCREL_IMM7BY4 = 50;  
{ 32 bit offset to TLS block  }
  R_CKCORE_TLS_LE32 = 51;  
  R_CKCORE_TLS_IE32 = 52;  
  R_CKCORE_TLS_GD32 = 53;  
  R_CKCORE_TLS_LDM32 = 54;  
  R_CKCORE_TLS_LDO32 = 55;  
  R_CKCORE_TLS_DTPMOD32 = 56;  
  R_CKCORE_TLS_DTPOFF32 = 57;  
  R_CKCORE_TLS_TPOFF32 = 58;  
{ C-SKY elf header definition.   }
{ xxxxxxxxxxxxxxxxxxxxxxxxx
#define EF_CSKY_ABIMASK		    0XF0000000
#define EF_CSKY_OTHER		    0X0FFF0000
#define EF_CSKY_PROCESSOR	    0X0000FFFF

#define EF_CSKY_ABIV1		    0X10000000
#define EF_CSKY_ABIV2		    0X20000000
 }
{ C-SKY attributes section.   }
  SHT_CSKY_ATTRIBUTES = SHT_LOPROC+1;  
{ IA-64 specific declarations.   }
{ Processor specific flags for the Ehdr e_flags field.   }
{ os-specific flags  }
  EF_IA_64_MASKOS = $0000000f;  
{ 64-bit ABI  }
  EF_IA_64_ABI64 = $00000010;  
{ arch. version mask  }
  EF_IA_64_ARCH = $ff000000;  
{ Processor specific values for the Phdr p_type field.   }
{ arch extension bits  }
  PT_IA_64_ARCHEXT = PT_LOPROC+0;  
{ ia64 unwind bits  }
  PT_IA_64_UNWIND = PT_LOPROC+1;  
  PT_IA_64_HP_OPT_ANOT = PT_LOOS+$12;  
  PT_IA_64_HP_HSL_ANOT = PT_LOOS+$13;  
  PT_IA_64_HP_STACK = PT_LOOS+$14;  
{ Processor specific flags for the Phdr p_flags field.   }
{ spec insns w/o recovery  }
  PF_IA_64_NORECOV = $80000000;  
{ Processor specific values for the Shdr sh_type field.   }
{ extension bits  }
  SHT_IA_64_EXT = SHT_LOPROC+0;  
{ unwind bits  }
  SHT_IA_64_UNWIND = SHT_LOPROC+1;  
{ Processor specific flags for the Shdr sh_flags field.   }
{ section near gp  }
  SHF_IA_64_SHORT = $10000000;  
{ spec insns w/o recovery  }
  SHF_IA_64_NORECOV = $20000000;  
{ Processor specific values for the Dyn d_tag field.   }
  DT_IA_64_PLT_RESERVE = DT_LOPROC+0;  
  DT_IA_64_NUM = 1;  
{ IA-64 relocations.   }
{ none  }
  R_IA64_NONE = $00;  
{ symbol + addend, add imm14  }
  R_IA64_IMM14 = $21;  
{ symbol + addend, add imm22  }
  R_IA64_IMM22 = $22;  
{ symbol + addend, mov imm64  }
  R_IA64_IMM64 = $23;  
{ symbol + addend, data4 MSB  }
  R_IA64_DIR32MSB = $24;  
{ symbol + addend, data4 LSB  }
  R_IA64_DIR32LSB = $25;  
{ symbol + addend, data8 MSB  }
  R_IA64_DIR64MSB = $26;  
{ symbol + addend, data8 LSB  }
  R_IA64_DIR64LSB = $27;  
{ @gprel(sym + add), add imm22  }
  R_IA64_GPREL22 = $2a;  
{ @gprel(sym + add), mov imm64  }
  R_IA64_GPREL64I = $2b;  
{ @gprel(sym + add), data4 MSB  }
  R_IA64_GPREL32MSB = $2c;  
{ @gprel(sym + add), data4 LSB  }
  R_IA64_GPREL32LSB = $2d;  
{ @gprel(sym + add), data8 MSB  }
  R_IA64_GPREL64MSB = $2e;  
{ @gprel(sym + add), data8 LSB  }
  R_IA64_GPREL64LSB = $2f;  
{ @ltoff(sym + add), add imm22  }
  R_IA64_LTOFF22 = $32;  
{ @ltoff(sym + add), mov imm64  }
  R_IA64_LTOFF64I = $33;  
{ @pltoff(sym + add), add imm22  }
  R_IA64_PLTOFF22 = $3a;  
{ @pltoff(sym + add), mov imm64  }
  R_IA64_PLTOFF64I = $3b;  
{ @pltoff(sym + add), data8 MSB  }
  R_IA64_PLTOFF64MSB = $3e;  
{ @pltoff(sym + add), data8 LSB  }
  R_IA64_PLTOFF64LSB = $3f;  
{ @fptr(sym + add), mov imm64  }
  R_IA64_FPTR64I = $43;  
{ @fptr(sym + add), data4 MSB  }
  R_IA64_FPTR32MSB = $44;  
{ @fptr(sym + add), data4 LSB  }
  R_IA64_FPTR32LSB = $45;  
{ @fptr(sym + add), data8 MSB  }
  R_IA64_FPTR64MSB = $46;  
{ @fptr(sym + add), data8 LSB  }
  R_IA64_FPTR64LSB = $47;  
{ @pcrel(sym + add), brl  }
  R_IA64_PCREL60B = $48;  
{ @pcrel(sym + add), ptb, call  }
  R_IA64_PCREL21B = $49;  
{ @pcrel(sym + add), chk.s  }
  R_IA64_PCREL21M = $4a;  
{ @pcrel(sym + add), fchkf  }
  R_IA64_PCREL21F = $4b;  
{ @pcrel(sym + add), data4 MSB  }
  R_IA64_PCREL32MSB = $4c;  
{ @pcrel(sym + add), data4 LSB  }
  R_IA64_PCREL32LSB = $4d;  
{ @pcrel(sym + add), data8 MSB  }
  R_IA64_PCREL64MSB = $4e;  
{ @pcrel(sym + add), data8 LSB  }
  R_IA64_PCREL64LSB = $4f;  
{ @ltoff(@fptr(s+a)), imm22  }
  R_IA64_LTOFF_FPTR22 = $52;  
{ @ltoff(@fptr(s+a)), imm64  }
  R_IA64_LTOFF_FPTR64I = $53;  
{ @ltoff(@fptr(s+a)), data4 MSB  }
  R_IA64_LTOFF_FPTR32MSB = $54;  
{ @ltoff(@fptr(s+a)), data4 LSB  }
  R_IA64_LTOFF_FPTR32LSB = $55;  
{ @ltoff(@fptr(s+a)), data8 MSB  }
  R_IA64_LTOFF_FPTR64MSB = $56;  
{ @ltoff(@fptr(s+a)), data8 LSB  }
  R_IA64_LTOFF_FPTR64LSB = $57;  
{ @segrel(sym + add), data4 MSB  }
  R_IA64_SEGREL32MSB = $5c;  
{ @segrel(sym + add), data4 LSB  }
  R_IA64_SEGREL32LSB = $5d;  
{ @segrel(sym + add), data8 MSB  }
  R_IA64_SEGREL64MSB = $5e;  
{ @segrel(sym + add), data8 LSB  }
  R_IA64_SEGREL64LSB = $5f;  
{ @secrel(sym + add), data4 MSB  }
  R_IA64_SECREL32MSB = $64;  
{ @secrel(sym + add), data4 LSB  }
  R_IA64_SECREL32LSB = $65;  
{ @secrel(sym + add), data8 MSB  }
  R_IA64_SECREL64MSB = $66;  
{ @secrel(sym + add), data8 LSB  }
  R_IA64_SECREL64LSB = $67;  
{ data 4 + REL  }
  R_IA64_REL32MSB = $6c;  
{ data 4 + REL  }
  R_IA64_REL32LSB = $6d;  
{ data 8 + REL  }
  R_IA64_REL64MSB = $6e;  
{ data 8 + REL  }
  R_IA64_REL64LSB = $6f;  
{ symbol + addend, data4 MSB  }
  R_IA64_LTV32MSB = $74;  
{ symbol + addend, data4 LSB  }
  R_IA64_LTV32LSB = $75;  
{ symbol + addend, data8 MSB  }
  R_IA64_LTV64MSB = $76;  
{ symbol + addend, data8 LSB  }
  R_IA64_LTV64LSB = $77;  
{ @pcrel(sym + add), 21bit inst  }
  R_IA64_PCREL21BI = $79;  
{ @pcrel(sym + add), 22bit inst  }
  R_IA64_PCREL22 = $7a;  
{ @pcrel(sym + add), 64bit inst  }
  R_IA64_PCREL64I = $7b;  
{ dynamic reloc, imported PLT, MSB  }
  R_IA64_IPLTMSB = $80;  
{ dynamic reloc, imported PLT, LSB  }
  R_IA64_IPLTLSB = $81;  
{ copy relocation  }
  R_IA64_COPY = $84;  
{ Addend and symbol difference  }
  R_IA64_SUB = $85;  
{ LTOFF22, relaxable.   }
  R_IA64_LTOFF22X = $86;  
{ Use of LTOFF22X.   }
  R_IA64_LDXMOV = $87;  
{ @tprel(sym + add), imm14  }
  R_IA64_TPREL14 = $91;  
{ @tprel(sym + add), imm22  }
  R_IA64_TPREL22 = $92;  
{ @tprel(sym + add), imm64  }
  R_IA64_TPREL64I = $93;  
{ @tprel(sym + add), data8 MSB  }
  R_IA64_TPREL64MSB = $96;  
{ @tprel(sym + add), data8 LSB  }
  R_IA64_TPREL64LSB = $97;  
{ @ltoff(@tprel(s+a)), imm2  }
  R_IA64_LTOFF_TPREL22 = $9a;  
{ @dtpmod(sym + add), data8 MSB  }
  R_IA64_DTPMOD64MSB = $a6;  
{ @dtpmod(sym + add), data8 LSB  }
  R_IA64_DTPMOD64LSB = $a7;  
{ @ltoff(@dtpmod(sym + add)), imm22  }
  R_IA64_LTOFF_DTPMOD22 = $aa;  
{ @dtprel(sym + add), imm14  }
  R_IA64_DTPREL14 = $b1;  
{ @dtprel(sym + add), imm22  }
  R_IA64_DTPREL22 = $b2;  
{ @dtprel(sym + add), imm64  }
  R_IA64_DTPREL64I = $b3;  
{ @dtprel(sym + add), data4 MSB  }
  R_IA64_DTPREL32MSB = $b4;  
{ @dtprel(sym + add), data4 LSB  }
  R_IA64_DTPREL32LSB = $b5;  
{ @dtprel(sym + add), data8 MSB  }
  R_IA64_DTPREL64MSB = $b6;  
{ @dtprel(sym + add), data8 LSB  }
  R_IA64_DTPREL64LSB = $b7;  
{ @ltoff(@dtprel(s+a)), imm22  }
  R_IA64_LTOFF_DTPREL22 = $ba;  
{ SH specific declarations  }
{ Processor specific flags for the ELF header e_flags field.   }
  EF_SH_MACH_MASK = $1f;  
  EF_SH_UNKNOWN = $0;  
  EF_SH1 = $1;  
  EF_SH2 = $2;  
  EF_SH3 = $3;  
  EF_SH_DSP = $4;  
  EF_SH3_DSP = $5;  
  EF_SH4AL_DSP = $6;  
  EF_SH3E = $8;  
  EF_SH4 = $9;  
  EF_SH2E = $b;  
  EF_SH4A = $c;  
  EF_SH2A = $d;  
  EF_SH4_NOFPU = $10;  
  EF_SH4A_NOFPU = $11;  
  EF_SH4_NOMMU_NOFPU = $12;  
  EF_SH2A_NOFPU = $13;  
  EF_SH3_NOMMU = $14;  
  EF_SH2A_SH4_NOFPU = $15;  
  EF_SH2A_SH3_NOFPU = $16;  
  EF_SH2A_SH4 = $17;  
  EF_SH2A_SH3E = $18;  
{ SH relocs.   }
  R_SH_NONE = 0;  
  R_SH_DIR32 = 1;  
  R_SH_REL32 = 2;  
  R_SH_DIR8WPN = 3;  
  R_SH_IND12W = 4;  
  R_SH_DIR8WPL = 5;  
  R_SH_DIR8WPZ = 6;  
  R_SH_DIR8BP = 7;  
  R_SH_DIR8W = 8;  
  R_SH_DIR8L = 9;  
  R_SH_SWITCH16 = 25;  
  R_SH_SWITCH32 = 26;  
  R_SH_USES = 27;  
  R_SH_COUNT = 28;  
  R_SH_ALIGN = 29;  
  R_SH_CODE = 30;  
  R_SH_DATA = 31;  
  R_SH_LABEL = 32;  
  R_SH_SWITCH8 = 33;  
  R_SH_GNU_VTINHERIT = 34;  
  R_SH_GNU_VTENTRY = 35;  
  R_SH_TLS_GD_32 = 144;  
  R_SH_TLS_LD_32 = 145;  
  R_SH_TLS_LDO_32 = 146;  
  R_SH_TLS_IE_32 = 147;  
  R_SH_TLS_LE_32 = 148;  
  R_SH_TLS_DTPMOD32 = 149;  
  R_SH_TLS_DTPOFF32 = 150;  
  R_SH_TLS_TPOFF32 = 151;  
  R_SH_GOT32 = 160;  
  R_SH_PLT32 = 161;  
  R_SH_COPY = 162;  
  R_SH_GLOB_DAT = 163;  
  R_SH_JMP_SLOT = 164;  
  R_SH_RELATIVE = 165;  
  R_SH_GOTOFF = 166;  
  R_SH_GOTPC = 167;  
{ Keep this the last entry.   }
  R_SH_NUM = 256;  
{ S/390 specific definitions.   }
{ Valid values for the e_flags field.   }
{ High GPRs kernel facility needed.   }
  EF_S390_HIGH_GPRS = $00000001;  
{ Additional s390 relocs  }
{ No reloc.   }
  R_390_NONE = 0;  
{ Direct 8 bit.   }
  R_390_8 = 1;  
{ Direct 12 bit.   }
  R_390_12 = 2;  
{ Direct 16 bit.   }
  R_390_16 = 3;  
{ Direct 32 bit.   }
  R_390_32 = 4;  
{ PC relative 32 bit.	 }
  R_390_PC32 = 5;  
{ 12 bit GOT offset.   }
  R_390_GOT12 = 6;  
{ 32 bit GOT offset.   }
  R_390_GOT32 = 7;  
{ 32 bit PC relative PLT address.   }
  R_390_PLT32 = 8;  
{ Copy symbol at runtime.   }
  R_390_COPY = 9;  
{ Create GOT entry.   }
  R_390_GLOB_DAT = 10;  
{ Create PLT entry.   }
  R_390_JMP_SLOT = 11;  
{ Adjust by program base.   }
  R_390_RELATIVE = 12;  
{ 32 bit offset to GOT.	  }
  R_390_GOTOFF32 = 13;  
{ 32 bit PC relative offset to GOT.   }
  R_390_GOTPC = 14;  
{ 16 bit GOT offset.   }
  R_390_GOT16 = 15;  
{ PC relative 16 bit.	 }
  R_390_PC16 = 16;  
{ PC relative 16 bit shifted by 1.   }
  R_390_PC16DBL = 17;  
{ 16 bit PC rel. PLT shifted by 1.   }
  R_390_PLT16DBL = 18;  
{ PC relative 32 bit shifted by 1.   }
  R_390_PC32DBL = 19;  
{ 32 bit PC rel. PLT shifted by 1.   }
  R_390_PLT32DBL = 20;  
{ 32 bit PC rel. GOT shifted by 1.   }
  R_390_GOTPCDBL = 21;  
{ Direct 64 bit.   }
  R_390_64 = 22;  
{ PC relative 64 bit.	 }
  R_390_PC64 = 23;  
{ 64 bit GOT offset.   }
  R_390_GOT64 = 24;  
{ 64 bit PC relative PLT address.   }
  R_390_PLT64 = 25;  
{ 32 bit PC rel. to GOT entry >> 1.  }
  R_390_GOTENT = 26;  
{ 16 bit offset to GOT.  }
  R_390_GOTOFF16 = 27;  
{ 64 bit offset to GOT.  }
  R_390_GOTOFF64 = 28;  
{ 12 bit offset to jump slot.	 }
  R_390_GOTPLT12 = 29;  
{ 16 bit offset to jump slot.	 }
  R_390_GOTPLT16 = 30;  
{ 32 bit offset to jump slot.	 }
  R_390_GOTPLT32 = 31;  
{ 64 bit offset to jump slot.	 }
  R_390_GOTPLT64 = 32;  
{ 32 bit rel. offset to jump slot.   }
  R_390_GOTPLTENT = 33;  
{ 16 bit offset from GOT to PLT.  }
  R_390_PLTOFF16 = 34;  
{ 32 bit offset from GOT to PLT.  }
  R_390_PLTOFF32 = 35;  
{ 16 bit offset from GOT to PLT.  }
  R_390_PLTOFF64 = 36;  
{ Tag for load insn in TLS code.   }
  R_390_TLS_LOAD = 37;  
{ Tag for function call in general
					   dynamic TLS code.  }
  R_390_TLS_GDCALL = 38;  
{ Tag for function call in local
					   dynamic TLS code.  }
  R_390_TLS_LDCALL = 39;  
{ Direct 32 bit for general dynamic
					   thread local data.   }
  R_390_TLS_GD32 = 40;  
{ Direct 64 bit for general dynamic
					  thread local data.   }
  R_390_TLS_GD64 = 41;  
{ 12 bit GOT offset for static TLS
					   block offset.   }
  R_390_TLS_GOTIE12 = 42;  
{ 32 bit GOT offset for static TLS
					   block offset.   }
  R_390_TLS_GOTIE32 = 43;  
{ 64 bit GOT offset for static TLS
					   block offset.  }
  R_390_TLS_GOTIE64 = 44;  
{ Direct 32 bit for local dynamic
					   thread local data in LE code.   }
  R_390_TLS_LDM32 = 45;  
{ Direct 64 bit for local dynamic
					   thread local data in LE code.   }
  R_390_TLS_LDM64 = 46;  
{ 32 bit address of GOT entry for
					   negated static TLS block offset.   }
  R_390_TLS_IE32 = 47;  
{ 64 bit address of GOT entry for
					   negated static TLS block offset.   }
  R_390_TLS_IE64 = 48;  
{ 32 bit rel. offset to GOT entry for
					   negated static TLS block offset.   }
  R_390_TLS_IEENT = 49;  
{ 32 bit negated offset relative to
					   static TLS block.   }
  R_390_TLS_LE32 = 50;  
{ 64 bit negated offset relative to
					   static TLS block.   }
  R_390_TLS_LE64 = 51;  
{ 32 bit offset relative to TLS
					   block.   }
  R_390_TLS_LDO32 = 52;  
{ 64 bit offset relative to TLS
					   block.   }
  R_390_TLS_LDO64 = 53;  
{ ID of module containing symbol.   }
  R_390_TLS_DTPMOD = 54;  
{ Offset in TLS block.	  }
  R_390_TLS_DTPOFF = 55;  
{ Negated offset in static TLS
					   block.   }
  R_390_TLS_TPOFF = 56;  
{ Direct 20 bit.   }
  R_390_20 = 57;  
{ 20 bit GOT offset.   }
  R_390_GOT20 = 58;  
{ 20 bit offset to jump slot.   }
  R_390_GOTPLT20 = 59;  
{ 20 bit GOT offset for static TLS
					   block offset.   }
  R_390_TLS_GOTIE20 = 60;  
{ STT_GNU_IFUNC relocation.   }
  R_390_IRELATIVE = 61;  
{ Keep this the last entry.   }
  R_390_NUM = 62;  
{ CRIS relocations.   }
  R_CRIS_NONE = 0;  
  R_CRIS_8 = 1;  
  R_CRIS_16 = 2;  
  R_CRIS_32 = 3;  
  R_CRIS_8_PCREL = 4;  
  R_CRIS_16_PCREL = 5;  
  R_CRIS_32_PCREL = 6;  
  R_CRIS_GNU_VTINHERIT = 7;  
  R_CRIS_GNU_VTENTRY = 8;  
  R_CRIS_COPY = 9;  
  R_CRIS_GLOB_DAT = 10;  
  R_CRIS_JUMP_SLOT = 11;  
  R_CRIS_RELATIVE = 12;  
  R_CRIS_16_GOT = 13;  
  R_CRIS_32_GOT = 14;  
  R_CRIS_16_GOTPLT = 15;  
  R_CRIS_32_GOTPLT = 16;  
  R_CRIS_32_GOTREL = 17;  
  R_CRIS_32_PLT_GOTREL = 18;  
  R_CRIS_32_PLT_PCREL = 19;  
  R_CRIS_NUM = 20;  
{ AMD x86-64 relocations.   }
{ No reloc  }
  R_X86_64_NONE = 0;  
{ Direct 64 bit   }
  R_X86_64_64 = 1;  
{ PC relative 32 bit signed  }
  R_X86_64_PC32 = 2;  
{ 32 bit GOT entry  }
  R_X86_64_GOT32 = 3;  
{ 32 bit PLT address  }
  R_X86_64_PLT32 = 4;  
{ Copy symbol at runtime  }
  R_X86_64_COPY = 5;  
{ Create GOT entry  }
  R_X86_64_GLOB_DAT = 6;  
{ Create PLT entry  }
  R_X86_64_JUMP_SLOT = 7;  
{ Adjust by program base  }
  R_X86_64_RELATIVE = 8;  
{ 32 bit signed PC relative
					   offset to GOT  }
  R_X86_64_GOTPCREL = 9;  
{ Direct 32 bit zero extended  }
  R_X86_64_32 = 10;  
{ Direct 32 bit sign extended  }
  R_X86_64_32S = 11;  
{ Direct 16 bit zero extended  }
  R_X86_64_16 = 12;  
{ 16 bit sign extended pc relative  }
  R_X86_64_PC16 = 13;  
{ Direct 8 bit sign extended   }
  R_X86_64_8 = 14;  
{ 8 bit sign extended pc relative  }
  R_X86_64_PC8 = 15;  
{ ID of module containing symbol  }
  R_X86_64_DTPMOD64 = 16;  
{ Offset in module's TLS block  }
  R_X86_64_DTPOFF64 = 17;  
{ Offset in initial TLS block  }
  R_X86_64_TPOFF64 = 18;  
{ 32 bit signed PC relative offset
					   to two GOT entries for GD symbol  }
  R_X86_64_TLSGD = 19;  
{ 32 bit signed PC relative offset
					   to two GOT entries for LD symbol  }
  R_X86_64_TLSLD = 20;  
{ Offset in TLS block  }
  R_X86_64_DTPOFF32 = 21;  
{ 32 bit signed PC relative offset
					   to GOT entry for IE symbol  }
  R_X86_64_GOTTPOFF = 22;  
{ Offset in initial TLS block  }
  R_X86_64_TPOFF32 = 23;  
{ PC relative 64 bit  }
  R_X86_64_PC64 = 24;  
{ 64 bit offset to GOT  }
  R_X86_64_GOTOFF64 = 25;  
{ 32 bit signed pc relative
					   offset to GOT  }
  R_X86_64_GOTPC32 = 26;  
{ 64-bit GOT entry offset  }
  R_X86_64_GOT64 = 27;  
{ 64-bit PC relative offset
					   to GOT entry  }
  R_X86_64_GOTPCREL64 = 28;  
{ 64-bit PC relative offset to GOT  }
  R_X86_64_GOTPC64 = 29;  
{ like GOT64, says PLT entry needed  }
  R_X86_64_GOTPLT64 = 30;  
{ 64-bit GOT relative offset
					   to PLT entry  }
  R_X86_64_PLTOFF64 = 31;  
{ Size of symbol plus 32-bit addend  }
  R_X86_64_SIZE32 = 32;  
{ Size of symbol plus 64-bit addend  }
  R_X86_64_SIZE64 = 33;  
{ GOT offset for TLS descriptor.   }
  R_X86_64_GOTPC32_TLSDESC = 34;  
{ Marker for call through TLS
					   descriptor.   }
  R_X86_64_TLSDESC_CALL = 35;  
{ TLS descriptor.   }
  R_X86_64_TLSDESC = 36;  
{ Adjust indirectly by program base  }
  R_X86_64_IRELATIVE = 37;  
{ 64-bit adjust by program base  }
  R_X86_64_RELATIVE64 = 38;  
{ 39 Reserved was R_X86_64_PC32_BND  }
{ 40 Reserved was R_X86_64_PLT32_BND  }
{ Load from 32 bit signed pc relative
					   offset to GOT entry without REX
					   prefix, relaxable.   }
  R_X86_64_GOTPCRELX = 41;  
{ Load from 32 bit signed pc relative
					   offset to GOT entry with REX prefix,
					   relaxable.   }
  R_X86_64_REX_GOTPCRELX = 42;  
  R_X86_64_NUM = 43;  
{ x86-64 sh_type values.   }
{ Unwind information.   }
  SHT_X86_64_UNWIND = $70000001;  
{ x86-64 d_tag values.   }
  DT_X86_64_PLT = DT_LOPROC+0;  
  DT_X86_64_PLTSZ = DT_LOPROC+1;  
  DT_X86_64_PLTENT = DT_LOPROC+3;  
  DT_X86_64_NUM = 4;  
{ AM33 relocations.   }
{ No reloc.   }
  R_MN10300_NONE = 0;  
{ Direct 32 bit.   }
  R_MN10300_32 = 1;  
{ Direct 16 bit.   }
  R_MN10300_16 = 2;  
{ Direct 8 bit.   }
  R_MN10300_8 = 3;  
{ PC-relative 32-bit.   }
  R_MN10300_PCREL32 = 4;  
{ PC-relative 16-bit signed.   }
  R_MN10300_PCREL16 = 5;  
{ PC-relative 8-bit signed.   }
  R_MN10300_PCREL8 = 6;  
{ Ancient C++ vtable garbage...  }
  R_MN10300_GNU_VTINHERIT = 7;  
{ ... collection annotation.   }
  R_MN10300_GNU_VTENTRY = 8;  
{ Direct 24 bit.   }
  R_MN10300_24 = 9;  
{ 32-bit PCrel offset to GOT.   }
  R_MN10300_GOTPC32 = 10;  
{ 16-bit PCrel offset to GOT.   }
  R_MN10300_GOTPC16 = 11;  
{ 32-bit offset from GOT.   }
  R_MN10300_GOTOFF32 = 12;  
{ 24-bit offset from GOT.   }
  R_MN10300_GOTOFF24 = 13;  
{ 16-bit offset from GOT.   }
  R_MN10300_GOTOFF16 = 14;  
{ 32-bit PCrel to PLT entry.   }
  R_MN10300_PLT32 = 15;  
{ 16-bit PCrel to PLT entry.   }
  R_MN10300_PLT16 = 16;  
{ 32-bit offset to GOT entry.   }
  R_MN10300_GOT32 = 17;  
{ 24-bit offset to GOT entry.   }
  R_MN10300_GOT24 = 18;  
{ 16-bit offset to GOT entry.   }
  R_MN10300_GOT16 = 19;  
{ Copy symbol at runtime.   }
  R_MN10300_COPY = 20;  
{ Create GOT entry.   }
  R_MN10300_GLOB_DAT = 21;  
{ Create PLT entry.   }
  R_MN10300_JMP_SLOT = 22;  
{ Adjust by program base.   }
  R_MN10300_RELATIVE = 23;  
{ 32-bit offset for global dynamic.   }
  R_MN10300_TLS_GD = 24;  
{ 32-bit offset for local dynamic.   }
  R_MN10300_TLS_LD = 25;  
{ Module-relative offset.   }
  R_MN10300_TLS_LDO = 26;  
{ GOT offset for static TLS block
					   offset.   }
  R_MN10300_TLS_GOTIE = 27;  
{ GOT address for static TLS block
					   offset.   }
  R_MN10300_TLS_IE = 28;  
{ Offset relative to static TLS
					   block.   }
  R_MN10300_TLS_LE = 29;  
{ ID of module containing symbol.   }
  R_MN10300_TLS_DTPMOD = 30;  
{ Offset in module TLS block.   }
  R_MN10300_TLS_DTPOFF = 31;  
{ Offset in static TLS block.   }
  R_MN10300_TLS_TPOFF = 32;  
{ Adjustment for next reloc as needed
					   by linker relaxation.   }
  R_MN10300_SYM_DIFF = 33;  
{ Alignment requirement for linker
					   relaxation.   }
  R_MN10300_ALIGN = 34;  
  R_MN10300_NUM = 35;  
{ M32R relocs.   }
{ No reloc.  }
  R_M32R_NONE = 0;  
{ Direct 16 bit.  }
  R_M32R_16 = 1;  
{ Direct 32 bit.  }
  R_M32R_32 = 2;  
{ Direct 24 bit.  }
  R_M32R_24 = 3;  
{ PC relative 10 bit shifted.  }
  R_M32R_10_PCREL = 4;  
{ PC relative 18 bit shifted.  }
  R_M32R_18_PCREL = 5;  
{ PC relative 26 bit shifted.  }
  R_M32R_26_PCREL = 6;  
{ High 16 bit with unsigned low.  }
  R_M32R_HI16_ULO = 7;  
{ High 16 bit with signed low.  }
  R_M32R_HI16_SLO = 8;  
{ Low 16 bit.  }
  R_M32R_LO16 = 9;  
{ 16 bit offset in SDA.  }
  R_M32R_SDA16 = 10;  
  R_M32R_GNU_VTINHERIT = 11;  
  R_M32R_GNU_VTENTRY = 12;  
{ M32R relocs use SHT_RELA.   }
{ Direct 16 bit.  }
  R_M32R_16_RELA = 33;  
{ Direct 32 bit.  }
  R_M32R_32_RELA = 34;  
{ Direct 24 bit.  }
  R_M32R_24_RELA = 35;  
{ PC relative 10 bit shifted.  }
  R_M32R_10_PCREL_RELA = 36;  
{ PC relative 18 bit shifted.  }
  R_M32R_18_PCREL_RELA = 37;  
{ PC relative 26 bit shifted.  }
  R_M32R_26_PCREL_RELA = 38;  
{ High 16 bit with unsigned low  }
  R_M32R_HI16_ULO_RELA = 39;  
{ High 16 bit with signed low  }
  R_M32R_HI16_SLO_RELA = 40;  
{ Low 16 bit  }
  R_M32R_LO16_RELA = 41;  
{ 16 bit offset in SDA  }
  R_M32R_SDA16_RELA = 42;  
  R_M32R_RELA_GNU_VTINHERIT = 43;  
  R_M32R_RELA_GNU_VTENTRY = 44;  
{ PC relative 32 bit.   }
  R_M32R_REL32 = 45;  
{ 24 bit GOT entry  }
  R_M32R_GOT24 = 48;  
{ 26 bit PC relative to PLT shifted  }
  R_M32R_26_PLTREL = 49;  
{ Copy symbol at runtime  }
  R_M32R_COPY = 50;  
{ Create GOT entry  }
  R_M32R_GLOB_DAT = 51;  
{ Create PLT entry  }
  R_M32R_JMP_SLOT = 52;  
{ Adjust by program base  }
  R_M32R_RELATIVE = 53;  
{ 24 bit offset to GOT  }
  R_M32R_GOTOFF = 54;  
{ 24 bit PC relative offset to GOT  }
  R_M32R_GOTPC24 = 55;  
{ High 16 bit GOT entry with unsigned
					   low  }
  R_M32R_GOT16_HI_ULO = 56;  
{ High 16 bit GOT entry with signed
					   low  }
  R_M32R_GOT16_HI_SLO = 57;  
{ Low 16 bit GOT entry  }
  R_M32R_GOT16_LO = 58;  
{ High 16 bit PC relative offset to
					   GOT with unsigned low  }
  R_M32R_GOTPC_HI_ULO = 59;  
{ High 16 bit PC relative offset to
					   GOT with signed low  }
  R_M32R_GOTPC_HI_SLO = 60;  
{ Low 16 bit PC relative offset to
					   GOT  }
  R_M32R_GOTPC_LO = 61;  
{ High 16 bit offset to GOT
					   with unsigned low  }
  R_M32R_GOTOFF_HI_ULO = 62;  
{ High 16 bit offset to GOT
					   with signed low  }
  R_M32R_GOTOFF_HI_SLO = 63;  
{ Low 16 bit offset to GOT  }
  R_M32R_GOTOFF_LO = 64;  
{ Keep this the last entry.  }
  R_M32R_NUM = 256;  
{ MicroBlaze relocations  }
{ No reloc.  }
  R_MICROBLAZE_NONE = 0;  
{ Direct 32 bit.  }
  R_MICROBLAZE_32 = 1;  
{ PC relative 32 bit.  }
  R_MICROBLAZE_32_PCREL = 2;  
{ PC relative 64 bit.  }
  R_MICROBLAZE_64_PCREL = 3;  
{ Low 16 bits of PCREL32.  }
  R_MICROBLAZE_32_PCREL_LO = 4;  
{ Direct 64 bit.  }
  R_MICROBLAZE_64 = 5;  
{ Low 16 bit.  }
  R_MICROBLAZE_32_LO = 6;  
{ Read-only small data area.  }
  R_MICROBLAZE_SRO32 = 7;  
{ Read-write small data area.  }
  R_MICROBLAZE_SRW32 = 8;  
{ No reloc.  }
  R_MICROBLAZE_64_NONE = 9;  
{ Symbol Op Symbol relocation.  }
  R_MICROBLAZE_32_SYM_OP_SYM = 10;  
{ GNU C++ vtable hierarchy.  }
  R_MICROBLAZE_GNU_VTINHERIT = 11;  
{ GNU C++ vtable member usage.  }
  R_MICROBLAZE_GNU_VTENTRY = 12;  
{ PC-relative GOT offset.   }
  R_MICROBLAZE_GOTPC_64 = 13;  
{ GOT entry offset.   }
  R_MICROBLAZE_GOT_64 = 14;  
{ PLT offset (PC-relative).   }
  R_MICROBLAZE_PLT_64 = 15;  
{ Adjust by program base.   }
  R_MICROBLAZE_REL = 16;  
{ Create PLT entry.   }
  R_MICROBLAZE_JUMP_SLOT = 17;  
{ Create GOT entry.   }
  R_MICROBLAZE_GLOB_DAT = 18;  
{ 64 bit offset to GOT.  }
  R_MICROBLAZE_GOTOFF_64 = 19;  
{ 32 bit offset to GOT.  }
  R_MICROBLAZE_GOTOFF_32 = 20;  
{ Runtime copy.   }
  R_MICROBLAZE_COPY = 21;  
{ TLS Reloc.  }
  R_MICROBLAZE_TLS = 22;  
{ TLS General Dynamic.  }
  R_MICROBLAZE_TLSGD = 23;  
{ TLS Local Dynamic.  }
  R_MICROBLAZE_TLSLD = 24;  
{ TLS Module ID.  }
  R_MICROBLAZE_TLSDTPMOD32 = 25;  
{ TLS Offset Within TLS Block.  }
  R_MICROBLAZE_TLSDTPREL32 = 26;  
{ TLS Offset Within TLS Block.  }
  R_MICROBLAZE_TLSDTPREL64 = 27;  
{ TLS Offset From Thread Pointer.  }
  R_MICROBLAZE_TLSGOTTPREL32 = 28;  
{ TLS Offset From Thread Pointer.  }
  R_MICROBLAZE_TLSTPREL32 = 29;  
{ Legal values for d_tag (dynamic entry type).   }
{ Address of _gp.   }
  DT_NIOS2_GP = $70000002;  
{ Nios II relocations.   }
{ No reloc.   }
  R_NIOS2_NONE = 0;  
{ Direct signed 16 bit.   }
  R_NIOS2_S16 = 1;  
{ Direct unsigned 16 bit.   }
  R_NIOS2_U16 = 2;  
{ PC relative 16 bit.   }
  R_NIOS2_PCREL16 = 3;  
{ Direct call.   }
  R_NIOS2_CALL26 = 4;  
{ 5 bit constant expression.   }
  R_NIOS2_IMM5 = 5;  
{ 5 bit expression, shift 22.   }
  R_NIOS2_CACHE_OPX = 6;  
{ 6 bit constant expression.   }
  R_NIOS2_IMM6 = 7;  
{ 8 bit constant expression.   }
  R_NIOS2_IMM8 = 8;  
{ High 16 bit.   }
  R_NIOS2_HI16 = 9;  
{ Low 16 bit.   }
  R_NIOS2_LO16 = 10;  
{ High 16 bit, adjusted.   }
  R_NIOS2_HIADJ16 = 11;  
{ 32 bit symbol value + addend.   }
  R_NIOS2_BFD_RELOC_32 = 12;  
{ 16 bit symbol value + addend.   }
  R_NIOS2_BFD_RELOC_16 = 13;  
{ 8 bit symbol value + addend.   }
  R_NIOS2_BFD_RELOC_8 = 14;  
{ 16 bit GP pointer offset.   }
  R_NIOS2_GPREL = 15;  
{ GNU C++ vtable hierarchy.   }
  R_NIOS2_GNU_VTINHERIT = 16;  
{ GNU C++ vtable member usage.   }
  R_NIOS2_GNU_VTENTRY = 17;  
{ Unconditional branch.   }
  R_NIOS2_UJMP = 18;  
{ Conditional branch.   }
  R_NIOS2_CJMP = 19;  
{ Indirect call through register.   }
  R_NIOS2_CALLR = 20;  
{ Alignment requirement for
					   linker relaxation.   }
  R_NIOS2_ALIGN = 21;  
{ 16 bit GOT entry.   }
  R_NIOS2_GOT16 = 22;  
{ 16 bit GOT entry for function.   }
  R_NIOS2_CALL16 = 23;  
{ %lo of offset to GOT pointer.   }
  R_NIOS2_GOTOFF_LO = 24;  
{ %hiadj of offset to GOT pointer.   }
  R_NIOS2_GOTOFF_HA = 25;  
{ %lo of PC relative offset.   }
  R_NIOS2_PCREL_LO = 26;  
{ %hiadj of PC relative offset.   }
  R_NIOS2_PCREL_HA = 27;  
{ 16 bit GOT offset for TLS GD.   }
  R_NIOS2_TLS_GD16 = 28;  
{ 16 bit GOT offset for TLS LDM.   }
  R_NIOS2_TLS_LDM16 = 29;  
{ 16 bit module relative offset.   }
  R_NIOS2_TLS_LDO16 = 30;  
{ 16 bit GOT offset for TLS IE.   }
  R_NIOS2_TLS_IE16 = 31;  
{ 16 bit LE TP-relative offset.   }
  R_NIOS2_TLS_LE16 = 32;  
{ Module number.   }
  R_NIOS2_TLS_DTPMOD = 33;  
{ Module-relative offset.   }
  R_NIOS2_TLS_DTPREL = 34;  
{ TP-relative offset.   }
  R_NIOS2_TLS_TPREL = 35;  
{ Copy symbol at runtime.   }
  R_NIOS2_COPY = 36;  
{ Create GOT entry.   }
  R_NIOS2_GLOB_DAT = 37;  
{ Create PLT entry.   }
  R_NIOS2_JUMP_SLOT = 38;  
{ Adjust by program base.   }
  R_NIOS2_RELATIVE = 39;  
{ 16 bit offset to GOT pointer.   }
  R_NIOS2_GOTOFF = 40;  
{ Direct call in .noat section.   }
  R_NIOS2_CALL26_NOAT = 41;  
{ %lo() of GOT entry.   }
  R_NIOS2_GOT_LO = 42;  
{ %hiadj() of GOT entry.   }
  R_NIOS2_GOT_HA = 43;  
{ %lo() of function GOT entry.   }
  R_NIOS2_CALL_LO = 44;  
{ %hiadj() of function GOT entry.   }
  R_NIOS2_CALL_HA = 45;  
{ TILEPro relocations.   }
{ No reloc  }
  R_TILEPRO_NONE = 0;  
{ Direct 32 bit  }
  R_TILEPRO_32 = 1;  
{ Direct 16 bit  }
  R_TILEPRO_16 = 2;  
{ Direct 8 bit  }
  R_TILEPRO_8 = 3;  
{ PC relative 32 bit  }
  R_TILEPRO_32_PCREL = 4;  
{ PC relative 16 bit  }
  R_TILEPRO_16_PCREL = 5;  
{ PC relative 8 bit  }
  R_TILEPRO_8_PCREL = 6;  
{ Low 16 bit  }
  R_TILEPRO_LO16 = 7;  
{ High 16 bit  }
  R_TILEPRO_HI16 = 8;  
{ High 16 bit, adjusted  }
  R_TILEPRO_HA16 = 9;  
{ Copy relocation  }
  R_TILEPRO_COPY = 10;  
{ Create GOT entry  }
  R_TILEPRO_GLOB_DAT = 11;  
{ Create PLT entry  }
  R_TILEPRO_JMP_SLOT = 12;  
{ Adjust by program base  }
  R_TILEPRO_RELATIVE = 13;  
{ X1 pipe branch offset  }
  R_TILEPRO_BROFF_X1 = 14;  
{ X1 pipe jump offset  }
  R_TILEPRO_JOFFLONG_X1 = 15;  
{ X1 pipe jump offset to PLT  }
  R_TILEPRO_JOFFLONG_X1_PLT = 16;  
{ X0 pipe 8-bit  }
  R_TILEPRO_IMM8_X0 = 17;  
{ Y0 pipe 8-bit  }
  R_TILEPRO_IMM8_Y0 = 18;  
{ X1 pipe 8-bit  }
  R_TILEPRO_IMM8_X1 = 19;  
{ Y1 pipe 8-bit  }
  R_TILEPRO_IMM8_Y1 = 20;  
{ X1 pipe mtspr  }
  R_TILEPRO_MT_IMM15_X1 = 21;  
{ X1 pipe mfspr  }
  R_TILEPRO_MF_IMM15_X1 = 22;  
{ X0 pipe 16-bit  }
  R_TILEPRO_IMM16_X0 = 23;  
{ X1 pipe 16-bit  }
  R_TILEPRO_IMM16_X1 = 24;  
{ X0 pipe low 16-bit  }
  R_TILEPRO_IMM16_X0_LO = 25;  
{ X1 pipe low 16-bit  }
  R_TILEPRO_IMM16_X1_LO = 26;  
{ X0 pipe high 16-bit  }
  R_TILEPRO_IMM16_X0_HI = 27;  
{ X1 pipe high 16-bit  }
  R_TILEPRO_IMM16_X1_HI = 28;  
{ X0 pipe high 16-bit, adjusted  }
  R_TILEPRO_IMM16_X0_HA = 29;  
{ X1 pipe high 16-bit, adjusted  }
  R_TILEPRO_IMM16_X1_HA = 30;  
{ X0 pipe PC relative 16 bit  }
  R_TILEPRO_IMM16_X0_PCREL = 31;  
{ X1 pipe PC relative 16 bit  }
  R_TILEPRO_IMM16_X1_PCREL = 32;  
{ X0 pipe PC relative low 16 bit  }
  R_TILEPRO_IMM16_X0_LO_PCREL = 33;  
{ X1 pipe PC relative low 16 bit  }
  R_TILEPRO_IMM16_X1_LO_PCREL = 34;  
{ X0 pipe PC relative high 16 bit  }
  R_TILEPRO_IMM16_X0_HI_PCREL = 35;  
{ X1 pipe PC relative high 16 bit  }
  R_TILEPRO_IMM16_X1_HI_PCREL = 36;  
{ X0 pipe PC relative ha() 16 bit  }
  R_TILEPRO_IMM16_X0_HA_PCREL = 37;  
{ X1 pipe PC relative ha() 16 bit  }
  R_TILEPRO_IMM16_X1_HA_PCREL = 38;  
{ X0 pipe 16-bit GOT offset  }
  R_TILEPRO_IMM16_X0_GOT = 39;  
{ X1 pipe 16-bit GOT offset  }
  R_TILEPRO_IMM16_X1_GOT = 40;  
{ X0 pipe low 16-bit GOT offset  }
  R_TILEPRO_IMM16_X0_GOT_LO = 41;  
{ X1 pipe low 16-bit GOT offset  }
  R_TILEPRO_IMM16_X1_GOT_LO = 42;  
{ X0 pipe high 16-bit GOT offset  }
  R_TILEPRO_IMM16_X0_GOT_HI = 43;  
{ X1 pipe high 16-bit GOT offset  }
  R_TILEPRO_IMM16_X1_GOT_HI = 44;  
{ X0 pipe ha() 16-bit GOT offset  }
  R_TILEPRO_IMM16_X0_GOT_HA = 45;  
{ X1 pipe ha() 16-bit GOT offset  }
  R_TILEPRO_IMM16_X1_GOT_HA = 46;  
{ X0 pipe mm "start"  }
  R_TILEPRO_MMSTART_X0 = 47;  
{ X0 pipe mm "end"  }
  R_TILEPRO_MMEND_X0 = 48;  
{ X1 pipe mm "start"  }
  R_TILEPRO_MMSTART_X1 = 49;  
{ X1 pipe mm "end"  }
  R_TILEPRO_MMEND_X1 = 50;  
{ X0 pipe shift amount  }
  R_TILEPRO_SHAMT_X0 = 51;  
{ X1 pipe shift amount  }
  R_TILEPRO_SHAMT_X1 = 52;  
{ Y0 pipe shift amount  }
  R_TILEPRO_SHAMT_Y0 = 53;  
{ Y1 pipe shift amount  }
  R_TILEPRO_SHAMT_Y1 = 54;  
{ X1 pipe destination 8-bit  }
  R_TILEPRO_DEST_IMM8_X1 = 55;  
{ Relocs 56-59 are currently not defined.   }
{ "jal" for TLS GD  }
  R_TILEPRO_TLS_GD_CALL = 60;  
{ X0 pipe "addi" for TLS GD  }
  R_TILEPRO_IMM8_X0_TLS_GD_ADD = 61;  
{ X1 pipe "addi" for TLS GD  }
  R_TILEPRO_IMM8_X1_TLS_GD_ADD = 62;  
{ Y0 pipe "addi" for TLS GD  }
  R_TILEPRO_IMM8_Y0_TLS_GD_ADD = 63;  
{ Y1 pipe "addi" for TLS GD  }
  R_TILEPRO_IMM8_Y1_TLS_GD_ADD = 64;  
{ "lw_tls" for TLS IE  }
  R_TILEPRO_TLS_IE_LOAD = 65;  
{ X0 pipe 16-bit TLS GD offset  }
  R_TILEPRO_IMM16_X0_TLS_GD = 66;  
{ X1 pipe 16-bit TLS GD offset  }
  R_TILEPRO_IMM16_X1_TLS_GD = 67;  
{ X0 pipe low 16-bit TLS GD offset  }
  R_TILEPRO_IMM16_X0_TLS_GD_LO = 68;  
{ X1 pipe low 16-bit TLS GD offset  }
  R_TILEPRO_IMM16_X1_TLS_GD_LO = 69;  
{ X0 pipe high 16-bit TLS GD offset  }
  R_TILEPRO_IMM16_X0_TLS_GD_HI = 70;  
{ X1 pipe high 16-bit TLS GD offset  }
  R_TILEPRO_IMM16_X1_TLS_GD_HI = 71;  
{ X0 pipe ha() 16-bit TLS GD offset  }
  R_TILEPRO_IMM16_X0_TLS_GD_HA = 72;  
{ X1 pipe ha() 16-bit TLS GD offset  }
  R_TILEPRO_IMM16_X1_TLS_GD_HA = 73;  
{ X0 pipe 16-bit TLS IE offset  }
  R_TILEPRO_IMM16_X0_TLS_IE = 74;  
{ X1 pipe 16-bit TLS IE offset  }
  R_TILEPRO_IMM16_X1_TLS_IE = 75;  
{ X0 pipe low 16-bit TLS IE offset  }
  R_TILEPRO_IMM16_X0_TLS_IE_LO = 76;  
{ X1 pipe low 16-bit TLS IE offset  }
  R_TILEPRO_IMM16_X1_TLS_IE_LO = 77;  
{ X0 pipe high 16-bit TLS IE offset  }
  R_TILEPRO_IMM16_X0_TLS_IE_HI = 78;  
{ X1 pipe high 16-bit TLS IE offset  }
  R_TILEPRO_IMM16_X1_TLS_IE_HI = 79;  
{ X0 pipe ha() 16-bit TLS IE offset  }
  R_TILEPRO_IMM16_X0_TLS_IE_HA = 80;  
{ X1 pipe ha() 16-bit TLS IE offset  }
  R_TILEPRO_IMM16_X1_TLS_IE_HA = 81;  
{ ID of module containing symbol  }
  R_TILEPRO_TLS_DTPMOD32 = 82;  
{ Offset in TLS block  }
  R_TILEPRO_TLS_DTPOFF32 = 83;  
{ Offset in static TLS block  }
  R_TILEPRO_TLS_TPOFF32 = 84;  
{ X0 pipe 16-bit TLS LE offset  }
  R_TILEPRO_IMM16_X0_TLS_LE = 85;  
{ X1 pipe 16-bit TLS LE offset  }
  R_TILEPRO_IMM16_X1_TLS_LE = 86;  
{ X0 pipe low 16-bit TLS LE offset  }
  R_TILEPRO_IMM16_X0_TLS_LE_LO = 87;  
{ X1 pipe low 16-bit TLS LE offset  }
  R_TILEPRO_IMM16_X1_TLS_LE_LO = 88;  
{ X0 pipe high 16-bit TLS LE offset  }
  R_TILEPRO_IMM16_X0_TLS_LE_HI = 89;  
{ X1 pipe high 16-bit TLS LE offset  }
  R_TILEPRO_IMM16_X1_TLS_LE_HI = 90;  
{ X0 pipe ha() 16-bit TLS LE offset  }
  R_TILEPRO_IMM16_X0_TLS_LE_HA = 91;  
{ X1 pipe ha() 16-bit TLS LE offset  }
  R_TILEPRO_IMM16_X1_TLS_LE_HA = 92;  
{ GNU C++ vtable hierarchy  }
  R_TILEPRO_GNU_VTINHERIT = 128;  
{ GNU C++ vtable member usage  }
  R_TILEPRO_GNU_VTENTRY = 129;  
  R_TILEPRO_NUM = 130;  
{ TILE-Gx relocations.   }
{ No reloc  }
  R_TILEGX_NONE = 0;  
{ Direct 64 bit  }
  R_TILEGX_64 = 1;  
{ Direct 32 bit  }
  R_TILEGX_32 = 2;  
{ Direct 16 bit  }
  R_TILEGX_16 = 3;  
{ Direct 8 bit  }
  R_TILEGX_8 = 4;  
{ PC relative 64 bit  }
  R_TILEGX_64_PCREL = 5;  
{ PC relative 32 bit  }
  R_TILEGX_32_PCREL = 6;  
{ PC relative 16 bit  }
  R_TILEGX_16_PCREL = 7;  
{ PC relative 8 bit  }
  R_TILEGX_8_PCREL = 8;  
{ hword 0 16-bit  }
  R_TILEGX_HW0 = 9;  
{ hword 1 16-bit  }
  R_TILEGX_HW1 = 10;  
{ hword 2 16-bit  }
  R_TILEGX_HW2 = 11;  
{ hword 3 16-bit  }
  R_TILEGX_HW3 = 12;  
{ last hword 0 16-bit  }
  R_TILEGX_HW0_LAST = 13;  
{ last hword 1 16-bit  }
  R_TILEGX_HW1_LAST = 14;  
{ last hword 2 16-bit  }
  R_TILEGX_HW2_LAST = 15;  
{ Copy relocation  }
  R_TILEGX_COPY = 16;  
{ Create GOT entry  }
  R_TILEGX_GLOB_DAT = 17;  
{ Create PLT entry  }
  R_TILEGX_JMP_SLOT = 18;  
{ Adjust by program base  }
  R_TILEGX_RELATIVE = 19;  
{ X1 pipe branch offset  }
  R_TILEGX_BROFF_X1 = 20;  
{ X1 pipe jump offset  }
  R_TILEGX_JUMPOFF_X1 = 21;  
{ X1 pipe jump offset to PLT  }
  R_TILEGX_JUMPOFF_X1_PLT = 22;  
{ X0 pipe 8-bit  }
  R_TILEGX_IMM8_X0 = 23;  
{ Y0 pipe 8-bit  }
  R_TILEGX_IMM8_Y0 = 24;  
{ X1 pipe 8-bit  }
  R_TILEGX_IMM8_X1 = 25;  
{ Y1 pipe 8-bit  }
  R_TILEGX_IMM8_Y1 = 26;  
{ X1 pipe destination 8-bit  }
  R_TILEGX_DEST_IMM8_X1 = 27;  
{ X1 pipe mtspr  }
  R_TILEGX_MT_IMM14_X1 = 28;  
{ X1 pipe mfspr  }
  R_TILEGX_MF_IMM14_X1 = 29;  
{ X0 pipe mm "start"  }
  R_TILEGX_MMSTART_X0 = 30;  
{ X0 pipe mm "end"  }
  R_TILEGX_MMEND_X0 = 31;  
{ X0 pipe shift amount  }
  R_TILEGX_SHAMT_X0 = 32;  
{ X1 pipe shift amount  }
  R_TILEGX_SHAMT_X1 = 33;  
{ Y0 pipe shift amount  }
  R_TILEGX_SHAMT_Y0 = 34;  
{ Y1 pipe shift amount  }
  R_TILEGX_SHAMT_Y1 = 35;  
{ X0 pipe hword 0  }
  R_TILEGX_IMM16_X0_HW0 = 36;  
{ X1 pipe hword 0  }
  R_TILEGX_IMM16_X1_HW0 = 37;  
{ X0 pipe hword 1  }
  R_TILEGX_IMM16_X0_HW1 = 38;  
{ X1 pipe hword 1  }
  R_TILEGX_IMM16_X1_HW1 = 39;  
{ X0 pipe hword 2  }
  R_TILEGX_IMM16_X0_HW2 = 40;  
{ X1 pipe hword 2  }
  R_TILEGX_IMM16_X1_HW2 = 41;  
{ X0 pipe hword 3  }
  R_TILEGX_IMM16_X0_HW3 = 42;  
{ X1 pipe hword 3  }
  R_TILEGX_IMM16_X1_HW3 = 43;  
{ X0 pipe last hword 0  }
  R_TILEGX_IMM16_X0_HW0_LAST = 44;  
{ X1 pipe last hword 0  }
  R_TILEGX_IMM16_X1_HW0_LAST = 45;  
{ X0 pipe last hword 1  }
  R_TILEGX_IMM16_X0_HW1_LAST = 46;  
{ X1 pipe last hword 1  }
  R_TILEGX_IMM16_X1_HW1_LAST = 47;  
{ X0 pipe last hword 2  }
  R_TILEGX_IMM16_X0_HW2_LAST = 48;  
{ X1 pipe last hword 2  }
  R_TILEGX_IMM16_X1_HW2_LAST = 49;  
{ X0 pipe PC relative hword 0  }
  R_TILEGX_IMM16_X0_HW0_PCREL = 50;  
{ X1 pipe PC relative hword 0  }
  R_TILEGX_IMM16_X1_HW0_PCREL = 51;  
{ X0 pipe PC relative hword 1  }
  R_TILEGX_IMM16_X0_HW1_PCREL = 52;  
{ X1 pipe PC relative hword 1  }
  R_TILEGX_IMM16_X1_HW1_PCREL = 53;  
{ X0 pipe PC relative hword 2  }
  R_TILEGX_IMM16_X0_HW2_PCREL = 54;  
{ X1 pipe PC relative hword 2  }
  R_TILEGX_IMM16_X1_HW2_PCREL = 55;  
{ X0 pipe PC relative hword 3  }
  R_TILEGX_IMM16_X0_HW3_PCREL = 56;  
{ X1 pipe PC relative hword 3  }
  R_TILEGX_IMM16_X1_HW3_PCREL = 57;  
{ X0 pipe PC-rel last hword 0  }
  R_TILEGX_IMM16_X0_HW0_LAST_PCREL = 58;  
{ X1 pipe PC-rel last hword 0  }
  R_TILEGX_IMM16_X1_HW0_LAST_PCREL = 59;  
{ X0 pipe PC-rel last hword 1  }
  R_TILEGX_IMM16_X0_HW1_LAST_PCREL = 60;  
{ X1 pipe PC-rel last hword 1  }
  R_TILEGX_IMM16_X1_HW1_LAST_PCREL = 61;  
{ X0 pipe PC-rel last hword 2  }
  R_TILEGX_IMM16_X0_HW2_LAST_PCREL = 62;  
{ X1 pipe PC-rel last hword 2  }
  R_TILEGX_IMM16_X1_HW2_LAST_PCREL = 63;  
{ X0 pipe hword 0 GOT offset  }
  R_TILEGX_IMM16_X0_HW0_GOT = 64;  
{ X1 pipe hword 0 GOT offset  }
  R_TILEGX_IMM16_X1_HW0_GOT = 65;  
{ X0 pipe PC-rel PLT hword 0  }
  R_TILEGX_IMM16_X0_HW0_PLT_PCREL = 66;  
{ X1 pipe PC-rel PLT hword 0  }
  R_TILEGX_IMM16_X1_HW0_PLT_PCREL = 67;  
{ X0 pipe PC-rel PLT hword 1  }
  R_TILEGX_IMM16_X0_HW1_PLT_PCREL = 68;  
{ X1 pipe PC-rel PLT hword 1  }
  R_TILEGX_IMM16_X1_HW1_PLT_PCREL = 69;  
{ X0 pipe PC-rel PLT hword 2  }
  R_TILEGX_IMM16_X0_HW2_PLT_PCREL = 70;  
{ X1 pipe PC-rel PLT hword 2  }
  R_TILEGX_IMM16_X1_HW2_PLT_PCREL = 71;  
{ X0 pipe last hword 0 GOT offset  }
  R_TILEGX_IMM16_X0_HW0_LAST_GOT = 72;  
{ X1 pipe last hword 0 GOT offset  }
  R_TILEGX_IMM16_X1_HW0_LAST_GOT = 73;  
{ X0 pipe last hword 1 GOT offset  }
  R_TILEGX_IMM16_X0_HW1_LAST_GOT = 74;  
{ X1 pipe last hword 1 GOT offset  }
  R_TILEGX_IMM16_X1_HW1_LAST_GOT = 75;  
{ X0 pipe PC-rel PLT hword 3  }
  R_TILEGX_IMM16_X0_HW3_PLT_PCREL = 76;  
{ X1 pipe PC-rel PLT hword 3  }
  R_TILEGX_IMM16_X1_HW3_PLT_PCREL = 77;  
{ X0 pipe hword 0 TLS GD offset  }
  R_TILEGX_IMM16_X0_HW0_TLS_GD = 78;  
{ X1 pipe hword 0 TLS GD offset  }
  R_TILEGX_IMM16_X1_HW0_TLS_GD = 79;  
{ X0 pipe hword 0 TLS LE offset  }
  R_TILEGX_IMM16_X0_HW0_TLS_LE = 80;  
{ X1 pipe hword 0 TLS LE offset  }
  R_TILEGX_IMM16_X1_HW0_TLS_LE = 81;  
{ X0 pipe last hword 0 LE off  }
  R_TILEGX_IMM16_X0_HW0_LAST_TLS_LE = 82;  
{ X1 pipe last hword 0 LE off  }
  R_TILEGX_IMM16_X1_HW0_LAST_TLS_LE = 83;  
{ X0 pipe last hword 1 LE off  }
  R_TILEGX_IMM16_X0_HW1_LAST_TLS_LE = 84;  
{ X1 pipe last hword 1 LE off  }
  R_TILEGX_IMM16_X1_HW1_LAST_TLS_LE = 85;  
{ X0 pipe last hword 0 GD off  }
  R_TILEGX_IMM16_X0_HW0_LAST_TLS_GD = 86;  
{ X1 pipe last hword 0 GD off  }
  R_TILEGX_IMM16_X1_HW0_LAST_TLS_GD = 87;  
{ X0 pipe last hword 1 GD off  }
  R_TILEGX_IMM16_X0_HW1_LAST_TLS_GD = 88;  
{ X1 pipe last hword 1 GD off  }
  R_TILEGX_IMM16_X1_HW1_LAST_TLS_GD = 89;  
{ Relocs 90-91 are currently not defined.   }
{ X0 pipe hword 0 TLS IE offset  }
  R_TILEGX_IMM16_X0_HW0_TLS_IE = 92;  
{ X1 pipe hword 0 TLS IE offset  }
  R_TILEGX_IMM16_X1_HW0_TLS_IE = 93;  
{ X0 pipe PC-rel PLT last hword 0  }
  R_TILEGX_IMM16_X0_HW0_LAST_PLT_PCREL = 94;  
{ X1 pipe PC-rel PLT last hword 0  }
  R_TILEGX_IMM16_X1_HW0_LAST_PLT_PCREL = 95;  
{ X0 pipe PC-rel PLT last hword 1  }
  R_TILEGX_IMM16_X0_HW1_LAST_PLT_PCREL = 96;  
{ X1 pipe PC-rel PLT last hword 1  }
  R_TILEGX_IMM16_X1_HW1_LAST_PLT_PCREL = 97;  
{ X0 pipe PC-rel PLT last hword 2  }
  R_TILEGX_IMM16_X0_HW2_LAST_PLT_PCREL = 98;  
{ X1 pipe PC-rel PLT last hword 2  }
  R_TILEGX_IMM16_X1_HW2_LAST_PLT_PCREL = 99;  
{ X0 pipe last hword 0 IE off  }
  R_TILEGX_IMM16_X0_HW0_LAST_TLS_IE = 100;  
{ X1 pipe last hword 0 IE off  }
  R_TILEGX_IMM16_X1_HW0_LAST_TLS_IE = 101;  
{ X0 pipe last hword 1 IE off  }
  R_TILEGX_IMM16_X0_HW1_LAST_TLS_IE = 102;  
{ X1 pipe last hword 1 IE off  }
  R_TILEGX_IMM16_X1_HW1_LAST_TLS_IE = 103;  
{ Relocs 104-105 are currently not defined.   }
{ 64-bit ID of symbol's module  }
  R_TILEGX_TLS_DTPMOD64 = 106;  
{ 64-bit offset in TLS block  }
  R_TILEGX_TLS_DTPOFF64 = 107;  
{ 64-bit offset in static TLS block  }
  R_TILEGX_TLS_TPOFF64 = 108;  
{ 32-bit ID of symbol's module  }
  R_TILEGX_TLS_DTPMOD32 = 109;  
{ 32-bit offset in TLS block  }
  R_TILEGX_TLS_DTPOFF32 = 110;  
{ 32-bit offset in static TLS block  }
  R_TILEGX_TLS_TPOFF32 = 111;  
{ "jal" for TLS GD  }
  R_TILEGX_TLS_GD_CALL = 112;  
{ X0 pipe "addi" for TLS GD  }
  R_TILEGX_IMM8_X0_TLS_GD_ADD = 113;  
{ X1 pipe "addi" for TLS GD  }
  R_TILEGX_IMM8_X1_TLS_GD_ADD = 114;  
{ Y0 pipe "addi" for TLS GD  }
  R_TILEGX_IMM8_Y0_TLS_GD_ADD = 115;  
{ Y1 pipe "addi" for TLS GD  }
  R_TILEGX_IMM8_Y1_TLS_GD_ADD = 116;  
{ "ld_tls" for TLS IE  }
  R_TILEGX_TLS_IE_LOAD = 117;  
{ X0 pipe "addi" for TLS GD/IE  }
  R_TILEGX_IMM8_X0_TLS_ADD = 118;  
{ X1 pipe "addi" for TLS GD/IE  }
  R_TILEGX_IMM8_X1_TLS_ADD = 119;  
{ Y0 pipe "addi" for TLS GD/IE  }
  R_TILEGX_IMM8_Y0_TLS_ADD = 120;  
{ Y1 pipe "addi" for TLS GD/IE  }
  R_TILEGX_IMM8_Y1_TLS_ADD = 121;  
{ GNU C++ vtable hierarchy  }
  R_TILEGX_GNU_VTINHERIT = 128;  
{ GNU C++ vtable member usage  }
  R_TILEGX_GNU_VTENTRY = 129;  
  R_TILEGX_NUM = 130;  
{ RISC-V ELF Flags  }
  EF_RISCV_RVC = $0001;  
  EF_RISCV_FLOAT_ABI = $0006;  
  EF_RISCV_FLOAT_ABI_SOFT = $0000;  
  EF_RISCV_FLOAT_ABI_SINGLE = $0002;  
  EF_RISCV_FLOAT_ABI_DOUBLE = $0004;  
  EF_RISCV_FLOAT_ABI_QUAD = $0006;  
  EF_RISCV_RVE = $0008;  
  EF_RISCV_TSO = $0010;  
{ RISC-V relocations.   }
  R_RISCV_NONE = 0;  
  R_RISCV_32 = 1;  
  R_RISCV_64 = 2;  
  R_RISCV_RELATIVE = 3;  
  R_RISCV_COPY = 4;  
  R_RISCV_JUMP_SLOT = 5;  
  R_RISCV_TLS_DTPMOD32 = 6;  
  R_RISCV_TLS_DTPMOD64 = 7;  
  R_RISCV_TLS_DTPREL32 = 8;  
  R_RISCV_TLS_DTPREL64 = 9;  
  R_RISCV_TLS_TPREL32 = 10;  
  R_RISCV_TLS_TPREL64 = 11;  
  R_RISCV_BRANCH = 16;  
  R_RISCV_JAL = 17;  
  R_RISCV_CALL = 18;  
  R_RISCV_CALL_PLT = 19;  
  R_RISCV_GOT_HI20 = 20;  
  R_RISCV_TLS_GOT_HI20 = 21;  
  R_RISCV_TLS_GD_HI20 = 22;  
  R_RISCV_PCREL_HI20 = 23;  
  R_RISCV_PCREL_LO12_I = 24;  
  R_RISCV_PCREL_LO12_S = 25;  
  R_RISCV_HI20 = 26;  
  R_RISCV_LO12_I = 27;  
  R_RISCV_LO12_S = 28;  
  R_RISCV_TPREL_HI20 = 29;  
  R_RISCV_TPREL_LO12_I = 30;  
  R_RISCV_TPREL_LO12_S = 31;  
  R_RISCV_TPREL_ADD = 32;  
  R_RISCV_ADD8 = 33;  
  R_RISCV_ADD16 = 34;  
  R_RISCV_ADD32 = 35;  
  R_RISCV_ADD64 = 36;  
  R_RISCV_SUB8 = 37;  
  R_RISCV_SUB16 = 38;  
  R_RISCV_SUB32 = 39;  
  R_RISCV_SUB64 = 40;  
  R_RISCV_GNU_VTINHERIT = 41;  
  R_RISCV_GNU_VTENTRY = 42;  
  R_RISCV_ALIGN = 43;  
  R_RISCV_RVC_BRANCH = 44;  
  R_RISCV_RVC_JUMP = 45;  
  R_RISCV_RVC_LUI = 46;  
  R_RISCV_GPREL_I = 47;  
  R_RISCV_GPREL_S = 48;  
  R_RISCV_TPREL_I = 49;  
  R_RISCV_TPREL_S = 50;  
  R_RISCV_RELAX = 51;  
  R_RISCV_SUB6 = 52;  
  R_RISCV_SET6 = 53;  
  R_RISCV_SET8 = 54;  
  R_RISCV_SET16 = 55;  
  R_RISCV_SET32 = 56;  
  R_RISCV_32_PCREL = 57;  
  R_RISCV_IRELATIVE = 58;  
  R_RISCV_PLT32 = 59;  
  R_RISCV_SET_ULEB128 = 60;  
  R_RISCV_SUB_ULEB128 = 61;  
  R_RISCV_NUM = 62;  
{ RISC-V specific values for the st_other field.   }
{ Function uses variant calling
					   convention  }
  STO_RISCV_VARIANT_CC = $80;  
{ RISC-V specific values for the sh_type field.   }
  SHT_RISCV_ATTRIBUTES = SHT_LOPROC+3;  
{ RISC-V specific values for the p_type field.   }
  PT_RISCV_ATTRIBUTES = PT_LOPROC+3;  
{ RISC-V specific values for the d_tag field.   }
  DT_RISCV_VARIANT_CC = DT_LOPROC+1;  
{ BPF specific declarations.   }
{ No reloc  }
  R_BPF_NONE = 0;  
  R_BPF_64_64 = 1;  
  R_BPF_64_32 = 10;  
{ Imagination Meta specific relocations.  }
  R_METAG_HIADDR16 = 0;  
  R_METAG_LOADDR16 = 1;  
{ 32bit absolute address  }
  R_METAG_ADDR32 = 2;  
{ No reloc  }
  R_METAG_NONE = 3;  
  R_METAG_RELBRANCH = 4;  
  R_METAG_GETSETOFF = 5;  
{ Backward compatibility  }
  R_METAG_REG32OP1 = 6;  
  R_METAG_REG32OP2 = 7;  
  R_METAG_REG32OP3 = 8;  
  R_METAG_REG16OP1 = 9;  
  R_METAG_REG16OP2 = 10;  
  R_METAG_REG16OP3 = 11;  
  R_METAG_REG32OP4 = 12;  
  R_METAG_HIOG = 13;  
  R_METAG_LOOG = 14;  
  R_METAG_REL8 = 15;  
  R_METAG_REL16 = 16;  
{ GNU  }
  R_METAG_GNU_VTINHERIT = 30;  
  R_METAG_GNU_VTENTRY = 31;  
{ PIC relocations  }
  R_METAG_HI16_GOTOFF = 32;  
  R_METAG_LO16_GOTOFF = 33;  
  R_METAG_GETSET_GOTOFF = 34;  
  R_METAG_GETSET_GOT = 35;  
  R_METAG_HI16_GOTPC = 36;  
  R_METAG_LO16_GOTPC = 37;  
  R_METAG_HI16_PLT = 38;  
  R_METAG_LO16_PLT = 39;  
  R_METAG_RELBRANCH_PLT = 40;  
  R_METAG_GOTOFF = 41;  
  R_METAG_PLT = 42;  
  R_METAG_COPY = 43;  
  R_METAG_JMP_SLOT = 44;  
  R_METAG_RELATIVE = 45;  
  R_METAG_GLOB_DAT = 46;  
{ TLS relocations  }
  R_METAG_TLS_GD = 47;  
  R_METAG_TLS_LDM = 48;  
  R_METAG_TLS_LDO_HI16 = 49;  
  R_METAG_TLS_LDO_LO16 = 50;  
  R_METAG_TLS_LDO = 51;  
  R_METAG_TLS_IE = 52;  
  R_METAG_TLS_IENONPIC = 53;  
  R_METAG_TLS_IENONPIC_HI16 = 54;  
  R_METAG_TLS_IENONPIC_LO16 = 55;  
  R_METAG_TLS_TPOFF = 56;  
  R_METAG_TLS_DTPMOD = 57;  
  R_METAG_TLS_DTPOFF = 58;  
  R_METAG_TLS_LE = 59;  
  R_METAG_TLS_LE_HI16 = 60;  
  R_METAG_TLS_LE_LO16 = 61;  
{ NDS32 relocations.   }
  R_NDS32_NONE = 0;  
  R_NDS32_32_RELA = 20;  
  R_NDS32_COPY = 39;  
  R_NDS32_GLOB_DAT = 40;  
  R_NDS32_JMP_SLOT = 41;  
  R_NDS32_RELATIVE = 42;  
  R_NDS32_TLS_TPOFF = 102;  
  R_NDS32_TLS_DESC = 119;  
{ LoongArch ELF Flags  }
  EF_LARCH_ABI_MODIFIER_MASK = $07;  
  EF_LARCH_ABI_SOFT_FLOAT = $01;  
  EF_LARCH_ABI_SINGLE_FLOAT = $02;  
  EF_LARCH_ABI_DOUBLE_FLOAT = $03;  
  EF_LARCH_OBJABI_V1 = $40;  
{ LoongArch specific dynamic relocations  }
  R_LARCH_NONE = 0;  
  R_LARCH_32 = 1;  
  R_LARCH_64 = 2;  
  R_LARCH_RELATIVE = 3;  
  R_LARCH_COPY = 4;  
  R_LARCH_JUMP_SLOT = 5;  
  R_LARCH_TLS_DTPMOD32 = 6;  
  R_LARCH_TLS_DTPMOD64 = 7;  
  R_LARCH_TLS_DTPREL32 = 8;  
  R_LARCH_TLS_DTPREL64 = 9;  
  R_LARCH_TLS_TPREL32 = 10;  
  R_LARCH_TLS_TPREL64 = 11;  
  R_LARCH_IRELATIVE = 12;  
{ Reserved for future relocs that the dynamic linker must understand.   }
{ used by the static linker for relocating .text.   }
  R_LARCH_MARK_LA = 20;  
  R_LARCH_MARK_PCREL = 21;  
  R_LARCH_SOP_PUSH_PCREL = 22;  
  R_LARCH_SOP_PUSH_ABSOLUTE = 23;  
  R_LARCH_SOP_PUSH_DUP = 24;  
  R_LARCH_SOP_PUSH_GPREL = 25;  
  R_LARCH_SOP_PUSH_TLS_TPREL = 26;  
  R_LARCH_SOP_PUSH_TLS_GOT = 27;  
  R_LARCH_SOP_PUSH_TLS_GD = 28;  
  R_LARCH_SOP_PUSH_PLT_PCREL = 29;  
  R_LARCH_SOP_ASSERT = 30;  
  R_LARCH_SOP_NOT = 31;  
  R_LARCH_SOP_SUB = 32;  
  R_LARCH_SOP_SL = 33;  
  R_LARCH_SOP_SR = 34;  
  R_LARCH_SOP_ADD = 35;  
  R_LARCH_SOP_AND = 36;  
  R_LARCH_SOP_IF_ELSE = 37;  
  R_LARCH_SOP_POP_32_S_10_5 = 38;  
  R_LARCH_SOP_POP_32_U_10_12 = 39;  
  R_LARCH_SOP_POP_32_S_10_12 = 40;  
  R_LARCH_SOP_POP_32_S_10_16 = 41;  
  R_LARCH_SOP_POP_32_S_10_16_S2 = 42;  
  R_LARCH_SOP_POP_32_S_5_20 = 43;  
  R_LARCH_SOP_POP_32_S_0_5_10_16_S2 = 44;  
  R_LARCH_SOP_POP_32_S_0_10_10_16_S2 = 45;  
  R_LARCH_SOP_POP_32_U = 46;  
{ used by the static linker for relocating non .text.   }
  R_LARCH_ADD8 = 47;  
  R_LARCH_ADD16 = 48;  
  R_LARCH_ADD24 = 49;  
  R_LARCH_ADD32 = 50;  
  R_LARCH_ADD64 = 51;  
  R_LARCH_SUB8 = 52;  
  R_LARCH_SUB16 = 53;  
  R_LARCH_SUB24 = 54;  
  R_LARCH_SUB32 = 55;  
  R_LARCH_SUB64 = 56;  
  R_LARCH_GNU_VTINHERIT = 57;  
  R_LARCH_GNU_VTENTRY = 58;  
{ reserved 59-63  }
  R_LARCH_B16 = 64;  
  R_LARCH_B21 = 65;  
  R_LARCH_B26 = 66;  
  R_LARCH_ABS_HI20 = 67;  
  R_LARCH_ABS_LO12 = 68;  
  R_LARCH_ABS64_LO20 = 69;  
  R_LARCH_ABS64_HI12 = 70;  
  R_LARCH_PCALA_HI20 = 71;  
  R_LARCH_PCALA_LO12 = 72;  
  R_LARCH_PCALA64_LO20 = 73;  
  R_LARCH_PCALA64_HI12 = 74;  
  R_LARCH_GOT_PC_HI20 = 75;  
  R_LARCH_GOT_PC_LO12 = 76;  
  R_LARCH_GOT64_PC_LO20 = 77;  
  R_LARCH_GOT64_PC_HI12 = 78;  
  R_LARCH_GOT_HI20 = 79;  
  R_LARCH_GOT_LO12 = 80;  
  R_LARCH_GOT64_LO20 = 81;  
  R_LARCH_GOT64_HI12 = 82;  
  R_LARCH_TLS_LE_HI20 = 83;  
  R_LARCH_TLS_LE_LO12 = 84;  
  R_LARCH_TLS_LE64_LO20 = 85;  
  R_LARCH_TLS_LE64_HI12 = 86;  
  R_LARCH_TLS_IE_PC_HI20 = 87;  
  R_LARCH_TLS_IE_PC_LO12 = 88;  
  R_LARCH_TLS_IE64_PC_LO20 = 89;  
  R_LARCH_TLS_IE64_PC_HI12 = 90;  
  R_LARCH_TLS_IE_HI20 = 91;  
  R_LARCH_TLS_IE_LO12 = 92;  
  R_LARCH_TLS_IE64_LO20 = 93;  
  R_LARCH_TLS_IE64_HI12 = 94;  
  R_LARCH_TLS_LD_PC_HI20 = 95;  
  R_LARCH_TLS_LD_HI20 = 96;  
  R_LARCH_TLS_GD_PC_HI20 = 97;  
  R_LARCH_TLS_GD_HI20 = 98;  
  R_LARCH_32_PCREL = 99;  
  R_LARCH_RELAX = 100;  
  R_LARCH_DELETE = 101;  
  R_LARCH_ALIGN = 102;  
  R_LARCH_PCREL20_S2 = 103;  
  R_LARCH_CFA = 104;  
  R_LARCH_ADD6 = 105;  
  R_LARCH_SUB6 = 106;  
  R_LARCH_ADD_ULEB128 = 107;  
  R_LARCH_SUB_ULEB128 = 108;  
  R_LARCH_64_PCREL = 109;  
{ ARC specific declarations.   }
{ Processor specific flags for the Ehdr e_flags field.   }
  EF_ARC_MACH_MSK = $000000ff;  
  EF_ARC_OSABI_MSK = $00000f00;  
  EF_ARC_ALL_MSK = EF_ARC_MACH_MSK or EF_ARC_OSABI_MSK;  
{ Processor specific values for the Shdr sh_type field.   }
{ ARC attributes section.   }
  SHT_ARC_ATTRIBUTES = SHT_LOPROC+1;  
{ ARCompact/ARCv2 specific relocs.   }
  R_ARC_NONE = $0;  
  R_ARC_8 = $1;  
  R_ARC_16 = $2;  
  R_ARC_24 = $3;  
  R_ARC_32 = $4;  
  R_ARC_B22_PCREL = $6;  
  R_ARC_H30 = $7;  
  R_ARC_N8 = $8;  
  R_ARC_N16 = $9;  
  R_ARC_N24 = $A;  
  R_ARC_N32 = $B;  
  R_ARC_SDA = $C;  
  R_ARC_SECTOFF = $D;  
  R_ARC_S21H_PCREL = $E;  
  R_ARC_S21W_PCREL = $F;  
  R_ARC_S25H_PCREL = $10;  
  R_ARC_S25W_PCREL = $11;  
  R_ARC_SDA32 = $12;  
  R_ARC_SDA_LDST = $13;  
  R_ARC_SDA_LDST1 = $14;  
  R_ARC_SDA_LDST2 = $15;  
  R_ARC_SDA16_LD = $16;  
  R_ARC_SDA16_LD1 = $17;  
  R_ARC_SDA16_LD2 = $18;  
  R_ARC_S13_PCREL = $19;  
  R_ARC_W = $1A;  
  R_ARC_32_ME = $1B;  
  R_ARC_N32_ME = $1C;  
  R_ARC_SECTOFF_ME = $1D;  
  R_ARC_SDA32_ME = $1E;  
  R_ARC_W_ME = $1F;  
  R_ARC_H30_ME = $20;  
  R_ARC_SECTOFF_U8 = $21;  
  R_ARC_SECTOFF_S9 = $22;  
  R_AC_SECTOFF_U8 = $23;  
  R_AC_SECTOFF_U8_1 = $24;  
  R_AC_SECTOFF_U8_2 = $25;  
  R_AC_SECTOFF_S9 = $26;  
  R_AC_SECTOFF_S9_1 = $27;  
  R_AC_SECTOFF_S9_2 = $28;  
  R_ARC_SECTOFF_ME_1 = $29;  
  R_ARC_SECTOFF_ME_2 = $2A;  
  R_ARC_SECTOFF_1 = $2B;  
  R_ARC_SECTOFF_2 = $2C;  
  R_ARC_SDA_12 = $2D;  
  R_ARC_SDA16_ST2 = $30;  
  R_ARC_32_PCREL = $31;  
  R_ARC_PC32 = $32;  
  R_ARC_GOTPC32 = $33;  
  R_ARC_PLT32 = $34;  
  R_ARC_COPY = $35;  
  R_ARC_GLOB_DAT = $36;  
  R_ARC_JMP_SLOT = $37;  
  R_ARC_RELATIVE = $38;  
  R_ARC_GOTOFF = $39;  
  R_ARC_GOTPC = $3A;  
  R_ARC_GOT32 = $3B;  
  R_ARC_S21W_PCREL_PLT = $3C;  
  R_ARC_S25H_PCREL_PLT = $3D;  
  R_ARC_JLI_SECTOFF = $3F;  
  R_ARC_TLS_DTPMOD = $42;  
  R_ARC_TLS_DTPOFF = $43;  
  R_ARC_TLS_TPOFF = $44;  
  R_ARC_TLS_GD_GOT = $45;  
  R_ARC_TLS_GD_LD = $46;  
  R_ARC_TLS_GD_CALL = $47;  
  R_ARC_TLS_IE_GOT = $48;  
  R_ARC_TLS_DTPOFF_S9 = $49;  
  R_ARC_TLS_LE_S9 = $4A;  
  R_ARC_TLS_LE_32 = $4B;  
  R_ARC_S25W_PCREL_PLT = $4C;  
  R_ARC_S21H_PCREL_PLT = $4D;  
  R_ARC_NPS_CMEM16 = $4E;  
{ OpenRISC 1000 specific relocs.   }
  R_OR1K_NONE = 0;  
  R_OR1K_32 = 1;  
  R_OR1K_16 = 2;  
  R_OR1K_8 = 3;  
  R_OR1K_LO_16_IN_INSN = 4;  
  R_OR1K_HI_16_IN_INSN = 5;  
  R_OR1K_INSN_REL_26 = 6;  
  R_OR1K_GNU_VTENTRY = 7;  
  R_OR1K_GNU_VTINHERIT = 8;  
  R_OR1K_32_PCREL = 9;  
  R_OR1K_16_PCREL = 10;  
  R_OR1K_8_PCREL = 11;  
  R_OR1K_GOTPC_HI16 = 12;  
  R_OR1K_GOTPC_LO16 = 13;  
  R_OR1K_GOT16 = 14;  
  R_OR1K_PLT26 = 15;  
  R_OR1K_GOTOFF_HI16 = 16;  
  R_OR1K_GOTOFF_LO16 = 17;  
  R_OR1K_COPY = 18;  
  R_OR1K_GLOB_DAT = 19;  
  R_OR1K_JMP_SLOT = 20;  
  R_OR1K_RELATIVE = 21;  
  R_OR1K_TLS_GD_HI16 = 22;  
  R_OR1K_TLS_GD_LO16 = 23;  
  R_OR1K_TLS_LDM_HI16 = 24;  
  R_OR1K_TLS_LDM_LO16 = 25;  
  R_OR1K_TLS_LDO_HI16 = 26;  
  R_OR1K_TLS_LDO_LO16 = 27;  
  R_OR1K_TLS_IE_HI16 = 28;  
  R_OR1K_TLS_IE_LO16 = 29;  
  R_OR1K_TLS_LE_HI16 = 30;  
  R_OR1K_TLS_LE_LO16 = 31;  
  R_OR1K_TLS_TPOFF = 32;  
  R_OR1K_TLS_DTPOFF = 33;  
  R_OR1K_TLS_DTPMOD = 34;  
{$endif}
{ elf.h  }

// === Konventiert am: 8-9-25 19:14:50 ===


implementation


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ELF32_ST_BIND(val : longint) : longint;
begin
  ELF32_ST_BIND:=(byte(val)) shr 4;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function ELF32_ST_TYPE(val : longint) : Tval;
begin
  ELF32_ST_TYPE:=Tval(@($f));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ELF32_ST_INFO(bind,_type : longint) : longint;
begin
  ELF32_ST_INFO:=(bind shl 4)+(Ttype(@($f)));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ELF64_ST_BIND(val : longint) : longint;
begin
  ELF64_ST_BIND:=ELF32_ST_BIND(val);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ELF64_ST_TYPE(val : longint) : longint;
begin
  ELF64_ST_TYPE:=ELF32_ST_TYPE(val);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ELF64_ST_INFO(bind,_type : longint) : longint;
begin
  ELF64_ST_INFO:=ELF32_ST_INFO(bind,_type);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function ELF32_ST_VISIBILITY(obj : longint) : To;
begin
  ELF32_ST_VISIBILITY:=To(@($03));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ELF64_ST_VISIBILITY(obj : longint) : longint;
begin
  ELF64_ST_VISIBILITY:=ELF32_ST_VISIBILITY(o);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ELF32_R_SYM(val : longint) : longint;
begin
  ELF32_R_SYM:=val shr 8;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function ELF32_R_TYPE(val : longint) : Tval;
begin
  ELF32_R_TYPE:=Tval(@($ff));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ELF32_R_INFO(sym,_type : longint) : longint;
begin
  ELF32_R_INFO:=(sym shl 8)+(Ttype(@($ff)));
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

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ELF64_R_INFO(sym,_type : longint) : longint;
begin
  ELF64_R_INFO:=((TElf64_Xword(sym)) shl 32)+_type;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function DT_VALTAGIDX(tag : longint) : longint;
begin
  DT_VALTAGIDX:=DT_VALRNGHI-tag;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function DT_ADDRTAGIDX(tag : longint) : longint;
begin
  DT_ADDRTAGIDX:=DT_ADDRRNGHI-tag;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function DT_VERSIONTAGIDX(tag : longint) : longint;
begin
  DT_VERSIONTAGIDX:=DT_VERNEEDNUM-tag;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function DT_EXTRATAGIDX(tag : longint) : longint;
begin
  DT_EXTRATAGIDX:=(TElf32_Word(-(((TElf32_Sword(tag)) shl 1) shr 1)))-1;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ELF32_M_SYM(info : longint) : longint;
begin
  ELF32_M_SYM:=info shr 8;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function ELF32_M_SIZE(info : longint) : byte;
begin
  ELF32_M_SIZE:=byte(info);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ELF32_M_INFO(sym,size : longint) : longint;
begin
  ELF32_M_INFO:=(sym shl 8)+(byte(size));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ELF64_M_SYM(info : longint) : longint;
begin
  ELF64_M_SYM:=ELF32_M_SYM(info);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ELF64_M_SIZE(info : longint) : longint;
begin
  ELF64_M_SIZE:=ELF32_M_SIZE(info);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ELF64_M_INFO(sym,size : longint) : longint;
begin
  ELF64_M_INFO:=ELF32_M_INFO(sym,size);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PPC64_LOCAL_ENTRY_OFFSET(other : longint) : longint;
begin
  PPC64_LOCAL_ENTRY_OFFSET:=((1 shl ((Tother(@(STO_PPC64_LOCAL_MASK))) shr STO_PPC64_LOCAL_BIT)) shr 2) shl 2;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function EF_ARM_EABI_VERSION(flags : longint) : Tflags;
begin
  EF_ARM_EABI_VERSION:=Tflags(@(EF_ARM_EABIMASK));
end;


end.
