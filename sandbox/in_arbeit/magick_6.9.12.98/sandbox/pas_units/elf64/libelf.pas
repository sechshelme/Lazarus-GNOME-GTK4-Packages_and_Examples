unit libelf;

interface

uses
  clib, fp_elf64, elf_linux;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  // /usr/include/libelf.h


const
  SHF_COMPRESSED = 1 shl 11;

type
  TElf32_Chdr = record
    ch_type: TElf32_Word;
    ch_size: TElf32_Word;
    ch_addralign: TElf32_Word;
  end;
  PElf32_Chdr = ^TElf32_Chdr;

  TElf64_Chdr = record
    ch_type: TElf64_Word;
    ch_reserved: TElf64_Word;
    ch_size: TElf64_Xword;
    ch_addralign: TElf64_Xword;
  end;
  PElf64_Chdr = ^TElf64_Chdr;

const
  ELFCOMPRESS_ZLIB = 1;
  ELFCOMPRESS_LOOS = $60000000;
  ELFCOMPRESS_HIOS = $6fffffff;
  ELFCOMPRESS_LOPROC = $70000000;
  ELFCOMPRESS_HIPROC = $7fffffff;

const
  ELFCOMPRESS_ZSTD = 2;

const
  SHT_RELR = 19;

type
  PElf32_Relr = ^TElf32_Relr;
  TElf32_Relr = TElf32_Word;

  PElf64_Relr = ^TElf64_Relr;
  TElf64_Relr = TElf64_Xword;

const
  DT_RELRSZ = 35;
  DT_RELR = 36;
  DT_RELRENT = 37;

type
  PElf_Type = ^TElf_Type;
  TElf_Type = longint;

const
  ELF_T_BYTE = 0;
  ELF_T_ADDR = 1;
  ELF_T_DYN = 2;
  ELF_T_EHDR = 3;
  ELF_T_HALF = 4;
  ELF_T_OFF = 5;
  ELF_T_PHDR = 6;
  ELF_T_RELA = 7;
  ELF_T_REL = 8;
  ELF_T_SHDR = 9;
  ELF_T_SWORD = 10;
  ELF_T_SYM = 11;
  ELF_T_WORD = 12;
  ELF_T_XWORD = 13;
  ELF_T_SXWORD = 14;
  ELF_T_VDEF = 15;
  ELF_T_VDAUX = 16;
  ELF_T_VNEED = 17;
  ELF_T_VNAUX = 18;
  ELF_T_NHDR = 19;
  ELF_T_SYMINFO = 20;
  ELF_T_MOVE = 21;
  ELF_T_LIB = 22;
  ELF_T_GNUHASH = 23;
  ELF_T_AUXV = 24;
  ELF_T_CHDR = 25;
  ELF_T_NHDR8 = 26;
  ELF_T_RELR = 27;
  ELF_T_NUM = 28;

type
  PElf_Data = ^TElf_Data;

  TElf_Data = record
    d_buf: pointer;
    d_type: TElf_Type;
    d_version: dword;
    d_size: Tsize_t;
    d_off: Tint64_t;
    d_align: Tsize_t;
  end;

type
  PElf_Cmd = ^TElf_Cmd;
  TElf_Cmd = longint;

const
  ELF_C_NULL = 0;
  ELF_C_READ = 1;
  ELF_C_RDWR = 2;
  ELF_C_WRITE = 3;
  ELF_C_CLR = 4;
  ELF_C_SET = 5;
  ELF_C_FDDONE = 6;
  ELF_C_FDREAD = 7;
  ELF_C_READ_MMAP = 8;
  ELF_C_RDWR_MMAP = 9;
  ELF_C_WRITE_MMAP = 10;
  ELF_C_READ_MMAP_PRIVATE = 11;
  ELF_C_EMPTY = 12;
  ELF_C_NUM = 13;

const
  ELF_F_DIRTY = $1;
  ELF_F_LAYOUT = $4;
  ELF_F_PERMISSIVE = $8;

const
  ELF_CHF_FORCE = $1;

type
  PElf_Kind = ^TElf_Kind;
  TElf_Kind = longint;

const
  ELF_K_NONE = 0;
  ELF_K_AR = 1;
  ELF_K_COFF = 2;
  ELF_K_ELF = 3;
  ELF_K_NUM = 4;

type
  TElf_Arhdr = record
    ar_name: pchar;
    ar_date: Ttime_t;
    ar_uid: Tuid_t;
    ar_gid: Tgid_t;
    ar_mode: Tmode_t;
    ar_size: Tint64_t;
    ar_rawname: pchar;
  end;
  PElf_Arhdr = ^TElf_Arhdr;

  TElf_Arsym = record
    as_name: pchar;
    as_off: Tsize_t;
    as_hash: dword;
  end;
  PElf_Arsym = ^TElf_Arsym;

type
  PElf = type Pointer;
  PElf_Scn = type Pointer;

function elf_begin(__fildes: longint; __cmd: TElf_Cmd; __ref: PElf): PElf; cdecl; external libelf64;
function elf_clone(__elf: PElf; __cmd: TElf_Cmd): PElf; cdecl; external libelf64;
function elf_memory(__image: pchar; __size: Tsize_t): PElf; cdecl; external libelf64;
function elf_next(__elf: PElf): TElf_Cmd; cdecl; external libelf64;
function elf_end(__elf: PElf): longint; cdecl; external libelf64;
function elf_update(__elf: PElf; __cmd: TElf_Cmd): Tint64_t; cdecl; external libelf64;
function elf_kind(__elf: PElf): TElf_Kind; cdecl; external libelf64;
function elf_getbase(__elf: PElf): Tint64_t; cdecl; external libelf64;
function elf_getident(__elf: PElf; __nbytes: Psize_t): pchar; cdecl; external libelf64;
function elf32_getehdr(__elf: PElf): PElf32_Ehdr; cdecl; external libelf64;
function elf64_getehdr(__elf: PElf): PElf64_Ehdr; cdecl; external libelf64;
function elf32_newehdr(__elf: PElf): PElf32_Ehdr; cdecl; external libelf64;
function elf64_newehdr(__elf: PElf): PElf64_Ehdr; cdecl; external libelf64;
function elf_getphdrnum(__elf: PElf; __dst: Psize_t): longint; cdecl; external libelf64;
function elf32_getphdr(__elf: PElf): PElf32_Phdr; cdecl; external libelf64;
function elf64_getphdr(__elf: PElf): PElf64_Phdr; cdecl; external libelf64;
function elf32_newphdr(__elf: PElf; __cnt: Tsize_t): PElf32_Phdr; cdecl; external libelf64;
function elf64_newphdr(__elf: PElf; __cnt: Tsize_t): PElf64_Phdr; cdecl; external libelf64;
function elf_getscn(__elf: PElf; __index: Tsize_t): PElf_Scn; cdecl; external libelf64;
function elf32_offscn(__elf: PElf; __offset: TElf32_Off): PElf_Scn; cdecl; external libelf64;
function elf64_offscn(__elf: PElf; __offset: TElf64_Off): PElf_Scn; cdecl; external libelf64;
function elf_ndxscn(__scn: PElf_Scn): Tsize_t; cdecl; external libelf64;
function elf_nextscn(__elf: PElf; __scn: PElf_Scn): PElf_Scn; cdecl; external libelf64;
function elf_newscn(__elf: PElf): PElf_Scn; cdecl; external libelf64;
function elf_scnshndx(__scn: PElf_Scn): longint; cdecl; external libelf64;
function elf_getshdrnum(__elf: PElf; __dst: Psize_t): longint; cdecl; external libelf64;
function elf_getshnum(__elf: PElf; __dst: Psize_t): longint; cdecl; external libelf64; deprecated;
function elf_getshdrstrndx(__elf: PElf; __dst: Psize_t): longint; cdecl; external libelf64;
function elf_getshstrndx(__elf: PElf; __dst: Psize_t): longint; cdecl; external libelf64; deprecated;
function elf32_getshdr(__scn: PElf_Scn): PElf32_Shdr; cdecl; external libelf64;
function elf64_getshdr(__scn: PElf_Scn): PElf64_Shdr; cdecl; external libelf64;
function elf32_getchdr(__scn: PElf_Scn): PElf32_Chdr; cdecl; external libelf64;
function elf64_getchdr(__scn: PElf_Scn): PElf64_Chdr; cdecl; external libelf64;
function elf_compress(scn: PElf_Scn; _type: longint; flags: dword): longint; cdecl; external libelf64;
function elf_compress_gnu(scn: PElf_Scn; compress: longint; flags: dword): longint; cdecl; external libelf64;
function elf_flagelf(__elf: PElf; __cmd: TElf_Cmd; __flags: dword): dword; cdecl; external libelf64;
function elf_flagehdr(__elf: PElf; __cmd: TElf_Cmd; __flags: dword): dword; cdecl; external libelf64;
function elf_flagphdr(__elf: PElf; __cmd: TElf_Cmd; __flags: dword): dword; cdecl; external libelf64;
function elf_flagscn(__scn: PElf_Scn; __cmd: TElf_Cmd; __flags: dword): dword; cdecl; external libelf64;
function elf_flagdata(__data: PElf_Data; __cmd: TElf_Cmd; __flags: dword): dword; cdecl; external libelf64;
function elf_flagshdr(__scn: PElf_Scn; __cmd: TElf_Cmd; __flags: dword): dword; cdecl; external libelf64;
function elf_getdata(__scn: PElf_Scn; __data: PElf_Data): PElf_Data; cdecl; external libelf64;
function elf_rawdata(__scn: PElf_Scn; __data: PElf_Data): PElf_Data; cdecl; external libelf64;
function elf_newdata(__scn: PElf_Scn): PElf_Data; cdecl; external libelf64;
function elf_getdata_rawchunk(__elf: PElf; __offset: Tint64_t; __size: Tsize_t; __type: TElf_Type): PElf_Data; cdecl; external libelf64;
function elf_strptr(__elf: PElf; __index: Tsize_t; __offset: Tsize_t): pchar; cdecl; external libelf64;
function elf_getarhdr(__elf: PElf): PElf_Arhdr; cdecl; external libelf64;
function elf_getaroff(__elf: PElf): Tint64_t; cdecl; external libelf64;
function elf_rand(__elf: PElf; __offset: Tsize_t): Tsize_t; cdecl; external libelf64;
function elf_getarsym(__elf: PElf; __narsyms: Psize_t): PElf_Arsym; cdecl; external libelf64;
function elf_cntl(__elf: PElf; __cmd: TElf_Cmd): longint; cdecl; external libelf64;
function elf_rawfile(__elf: PElf; __nbytes: Psize_t): pchar; cdecl; external libelf64;
function elf32_fsize(__type: TElf_Type; __count: Tsize_t; __version: dword): Tsize_t; cdecl; external libelf64;
function elf64_fsize(__type: TElf_Type; __count: Tsize_t; __version: dword): Tsize_t; cdecl; external libelf64;
function elf32_xlatetom(__dest: PElf_Data; __src: PElf_Data; __encode: dword): PElf_Data; cdecl; external libelf64;
function elf64_xlatetom(__dest: PElf_Data; __src: PElf_Data; __encode: dword): PElf_Data; cdecl; external libelf64;
function elf32_xlatetof(__dest: PElf_Data; __src: PElf_Data; __encode: dword): PElf_Data; cdecl; external libelf64;
function elf64_xlatetof(__dest: PElf_Data; __src: PElf_Data; __encode: dword): PElf_Data; cdecl; external libelf64;
function elf_errno: longint; cdecl; external libelf64;
function elf_errmsg(__error: longint): pchar; cdecl; external libelf64;
function elf_version(__version: dword): dword; cdecl; external libelf64;
procedure elf_fill(__fill: longint); cdecl; external libelf64;
function elf_hash(__string: pchar): dword; cdecl; external libelf64;
function elf_gnu_hash(__string: pchar): dword; cdecl; external libelf64;
function elf32_checksum(__elf: PElf): longint; cdecl; external libelf64;
function elf64_checksum(__elf: PElf): longint; cdecl; external libelf64;

// === Konventiert am: 8-9-25 19:14:56 ===


implementation



end.
