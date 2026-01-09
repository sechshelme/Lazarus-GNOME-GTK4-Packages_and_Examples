unit elf_fdpic;

interface

uses
  fp_elf64, elf_linux;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  // /usr/include/linux/elf-fdpic.h


const
  PT_GNU_STACK = PT_LOOS + $474e551;

type
  Telf32_fdpic_loadseg = record
    addr: TElf32_Addr;
    p_vaddr: TElf32_Addr;
    p_memsz: TElf32_Word;
  end;
  Pelf32_fdpic_loadseg = ^Telf32_fdpic_loadseg;

  Telf32_fdpic_loadmap = record
    version: TElf32_Half;
    nsegs: TElf32_Half;
    segs: Pelf32_fdpic_loadseg;
  end;
  Pelf32_fdpic_loadmap = ^Telf32_fdpic_loadmap;

const
  ELF32_FDPIC_LOADMAP_VERSION = $0000;

type
  Telf64_fdpic_loadseg = record
    addr: TElf64_Addr;
    p_vaddr: TElf64_Addr;
    p_memsz: TElf64_Word;
  end;
  Pelf64_fdpic_loadseg = ^Telf64_fdpic_loadseg;

  Telf64_fdpic_loadmap = record
    version: TElf64_Half;
    nsegs: TElf64_Half;
    segs: Pelf64_fdpic_loadseg;
  end;
  Pelf64_fdpic_loadmap = ^Telf64_fdpic_loadmap;

const
  ELF64_FDPIC_LOADMAP_VERSION = $0000;

  // === Konventiert am: 8-9-25 19:15:15 ===


implementation



end.
