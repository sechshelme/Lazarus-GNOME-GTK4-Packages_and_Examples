
unit elf_fdpic;
interface

{
  Automatically converted by H2Pas 1.0.0 from elf_fdpic.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elf_fdpic.h
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
Pelf32_fdpic_loadmap  = ^elf32_fdpic_loadmap;
Pelf32_fdpic_loadseg  = ^elf32_fdpic_loadseg;
Pelf64_fdpic_loadmap  = ^elf64_fdpic_loadmap;
Pelf64_fdpic_loadseg  = ^elf64_fdpic_loadseg;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: GPL-2.0+ WITH Linux-syscall-note  }
{ elf-fdpic.h: FDPIC ELF load map
 *
 * Copyright (C) 2003 Red Hat, Inc. All Rights Reserved.
 * Written by David Howells (dhowells@redhat.com)
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version
 * 2 of the License, or (at your option) any later version.
  }
{$ifndef _LINUX_ELF_FDPIC_H}
{$define _LINUX_ELF_FDPIC_H}
{$include <linux/elf.h>}

const
  PT_GNU_STACK = PT_LOOS+$474e551;  
{ segment mappings for ELF FDPIC libraries/executables/interpreters  }
{ core address to which mapped  }
{ VMA recorded in file  }
{ allocation size recorded in file  }
type
  Pelf32_fdpic_loadseg = ^Telf32_fdpic_loadseg;
  Telf32_fdpic_loadseg = record
      addr : TElf32_Addr;
      p_vaddr : TElf32_Addr;
      p_memsz : TElf32_Word;
    end;

{ version of these structures, just in case...  }
{ number of segments  }
  Pelf32_fdpic_loadmap = ^Telf32_fdpic_loadmap;
  Telf32_fdpic_loadmap = record
      version : TElf32_Half;
      nsegs : TElf32_Half;
      segs : Pelf32_fdpic_loadseg;
    end;


const
  ELF32_FDPIC_LOADMAP_VERSION = $0000;  
{ segment mappings for ELF FDPIC libraries/executables/interpreters  }
{ core address to which mapped  }
{ VMA recorded in file  }
{ allocation size recorded in file  }
type
  Pelf64_fdpic_loadseg = ^Telf64_fdpic_loadseg;
  Telf64_fdpic_loadseg = record
      addr : TElf64_Addr;
      p_vaddr : TElf64_Addr;
      p_memsz : TElf64_Word;
    end;

{ version of these structures, just in case...  }
{ number of segments  }
  Pelf64_fdpic_loadmap = ^Telf64_fdpic_loadmap;
  Telf64_fdpic_loadmap = record
      version : TElf64_Half;
      nsegs : TElf64_Half;
      segs : Pelf64_fdpic_loadseg;
    end;


const
  ELF64_FDPIC_LOADMAP_VERSION = $0000;  
{$endif}
{ _LINUX_ELF_FDPIC_H  }

implementation


end.
