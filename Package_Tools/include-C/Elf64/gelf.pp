
unit gelf;
interface

{
  Automatically converted by H2Pas 1.0.0 from gelf.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gelf.h
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
PElf  = ^Elf;
PElf32_Word  = ^Elf32_Word;
PElf_Data  = ^Elf_Data;
PElf_Scn  = ^Elf_Scn;
PGElf_Addr  = ^GElf_Addr;
PGElf_auxv_t  = ^GElf_auxv_t;
PGElf_Chdr  = ^GElf_Chdr;
PGElf_Dyn  = ^GElf_Dyn;
PGElf_Ehdr  = ^GElf_Ehdr;
PGElf_Half  = ^GElf_Half;
PGElf_Lib  = ^GElf_Lib;
PGElf_Move  = ^GElf_Move;
PGElf_Nhdr  = ^GElf_Nhdr;
PGElf_Off  = ^GElf_Off;
PGElf_Phdr  = ^GElf_Phdr;
PGElf_Rel  = ^GElf_Rel;
PGElf_Rela  = ^GElf_Rela;
PGElf_Relr  = ^GElf_Relr;
PGElf_Section  = ^GElf_Section;
PGElf_Shdr  = ^GElf_Shdr;
PGElf_Sword  = ^GElf_Sword;
PGElf_Sxword  = ^GElf_Sxword;
PGElf_Sym  = ^GElf_Sym;
PGElf_Syminfo  = ^GElf_Syminfo;
PGElf_Verdaux  = ^GElf_Verdaux;
PGElf_Verdef  = ^GElf_Verdef;
PGElf_Vernaux  = ^GElf_Vernaux;
PGElf_Verneed  = ^GElf_Verneed;
PGElf_Versym  = ^GElf_Versym;
PGElf_Word  = ^GElf_Word;
PGElf_Xword  = ^GElf_Xword;
Psize_t  = ^size_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ This file defines generic ELF types, structures, and macros.
   Copyright (C) 1999, 2000, 2001, 2002, 2004, 2005, 2007, 2015 Red Hat, Inc.
   This file is part of elfutils.

   This file is free software; you can redistribute it and/or modify
   it under the terms of either

     * the GNU Lesser General Public License as published by the Free
       Software Foundation; either version 3 of the License, or (at
       your option) any later version

   or

     * the GNU General Public License as published by the Free
       Software Foundation; either version 2 of the License, or (at
       your option) any later version

   or both in parallel, as here.

   elfutils is distributed in the hope that it will be useful, but
   WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   General Public License for more details.

   You should have received copies of the GNU General Public License and
   the GNU Lesser General Public License along with this program.  If
   not, see <http://www.gnu.org/licenses/>.   }
{$ifndef _GELF_H}

const
  _GELF_H = 1;  
{$include <libelf.h>}
{ C++ extern C conditionnal removed }
{ Class independent type definitions.  Correctly speaking this is not
   true.  We assume that 64-bit binaries are the largest class and
   therefore all other classes can be represented without loss.   }
{ Type for a 16-bit quantity.   }
type
  PGElf_Half = ^TGElf_Half;
  TGElf_Half = TElf64_Half;
{ Types for signed and unsigned 32-bit quantities.   }

  PGElf_Word = ^TGElf_Word;
  TGElf_Word = TElf64_Word;

  PGElf_Sword = ^TGElf_Sword;
  TGElf_Sword = TElf64_Sword;
{ Types for signed and unsigned 64-bit quantities.   }

  PGElf_Xword = ^TGElf_Xword;
  TGElf_Xword = TElf64_Xword;

  PGElf_Sxword = ^TGElf_Sxword;
  TGElf_Sxword = TElf64_Sxword;
{ Type of addresses.   }

  PGElf_Addr = ^TGElf_Addr;
  TGElf_Addr = TElf64_Addr;
{ Type of file offsets.   }

  PGElf_Off = ^TGElf_Off;
  TGElf_Off = TElf64_Off;
{ The ELF file header.  This appears at the start of every ELF file.   }

  PGElf_Ehdr = ^TGElf_Ehdr;
  TGElf_Ehdr = TElf64_Ehdr;
{ Section header.   }

  PGElf_Shdr = ^TGElf_Shdr;
  TGElf_Shdr = TElf64_Shdr;
{ Section index.   }
{ XXX This should probably be a larger type in preparation of times when
   regular section indices can be larger.   }

  PGElf_Section = ^TGElf_Section;
  TGElf_Section = TElf64_Section;
{ Symbol table entry.   }

  PGElf_Sym = ^TGElf_Sym;
  TGElf_Sym = TElf64_Sym;
{ The syminfo section if available contains additional information about
   every dynamic symbol.   }

  PGElf_Syminfo = ^TGElf_Syminfo;
  TGElf_Syminfo = TElf64_Syminfo;
{ Relocation table entry without addend (in section of type SHT_REL).   }

  PGElf_Rel = ^TGElf_Rel;
  TGElf_Rel = TElf64_Rel;
{ Relocation table entry with addend (in section of type SHT_RELA).   }

  PGElf_Rela = ^TGElf_Rela;
  TGElf_Rela = TElf64_Rela;
{ Relative relocation entry (in section of type SHT_RELR).   }

  PGElf_Relr = ^TGElf_Relr;
  TGElf_Relr = TElf64_Relr;
{ Program segment header.   }

  PGElf_Phdr = ^TGElf_Phdr;
  TGElf_Phdr = TElf64_Phdr;
{ Header of a compressed section.   }

  PGElf_Chdr = ^TGElf_Chdr;
  TGElf_Chdr = TElf64_Chdr;
{ Dynamic section entry.   }

  PGElf_Dyn = ^TGElf_Dyn;
  TGElf_Dyn = TElf64_Dyn;
{ Version definition sections.   }

  PGElf_Verdef = ^TGElf_Verdef;
  TGElf_Verdef = TElf64_Verdef;
{ Auxiliary version information.   }

  PGElf_Verdaux = ^TGElf_Verdaux;
  TGElf_Verdaux = TElf64_Verdaux;
{ Version dependency section.   }

  PGElf_Verneed = ^TGElf_Verneed;
  TGElf_Verneed = TElf64_Verneed;
{ Auxiliary needed version information.   }

  PGElf_Vernaux = ^TGElf_Vernaux;
  TGElf_Vernaux = TElf64_Vernaux;
{ Type for version symbol information.   }

  PGElf_Versym = ^TGElf_Versym;
  TGElf_Versym = TElf64_Versym;
{ Auxiliary vector.   }

  PGElf_auxv_t = ^TGElf_auxv_t;
  TGElf_auxv_t = TElf64_auxv_t;
{ Note section contents.   }

  PGElf_Nhdr = ^TGElf_Nhdr;
  TGElf_Nhdr = TElf64_Nhdr;
{ Move structure.   }

  PGElf_Move = ^TGElf_Move;
  TGElf_Move = TElf64_Move;
{ Library list structure.   }

  PGElf_Lib = ^TGElf_Lib;
  TGElf_Lib = TElf64_Lib;
{ How to extract and insert information held in the st_info field.   }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function GELF_ST_BIND(val : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GELF_ST_TYPE(val : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GELF_ST_INFO(bind,_type : longint) : longint;

{ How to extract information held in the st_other field.   }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GELF_ST_VISIBILITY(val : longint) : longint;

{ How to extract and insert information held in the r_info field.   }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GELF_R_SYM(info : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GELF_R_TYPE(info : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GELF_R_INFO(sym,_type : longint) : longint;

{ How to extract and insert information held in the m_info field.   }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GELF_M_SYM(info : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GELF_M_SIZE(info : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GELF_M_INFO(sym,size : longint) : longint;

{ Get class of the file associated with ELF.   }
function gelf_getclass(__elf:PElf):longint;cdecl;external;
{ Return size of array of COUNT elements of the type denoted by TYPE
   in the external representation.  The binary class is taken from ELF.
   The result is based on version VERSION of the ELF standard.   }
function gelf_fsize(__elf:PElf; __type:TElf_Type; __count:Tsize_t; __version:dword):Tsize_t;cdecl;external;
{ Retrieve object file header.   }
function gelf_getehdr(__elf:PElf; __dest:PGElf_Ehdr):PGElf_Ehdr;cdecl;external;
{ Update the ELF header.   }
function gelf_update_ehdr(__elf:PElf; __src:PGElf_Ehdr):longint;cdecl;external;
{ Create new ELF header if none exists.  Creates an Elf32_Ehdr if CLASS
   is ELFCLASS32 or an Elf64_Ehdr if CLASS is ELFCLASS64.  Returns NULL
   on error.   }
function gelf_newehdr(__elf:PElf; __class:longint):pointer;cdecl;external;
{ Get section at OFFSET.   }
function gelf_offscn(__elf:PElf; __offset:TGElf_Off):PElf_Scn;cdecl;external;
{ Retrieve section header.   }
function gelf_getshdr(__scn:PElf_Scn; __dst:PGElf_Shdr):PGElf_Shdr;cdecl;external;
{ Update section header.   }
function gelf_update_shdr(__scn:PElf_Scn; __src:PGElf_Shdr):longint;cdecl;external;
{ Retrieve program header table entry.   }
function gelf_getphdr(__elf:PElf; __ndx:longint; __dst:PGElf_Phdr):PGElf_Phdr;cdecl;external;
{ Update the program header.   }
function gelf_update_phdr(__elf:PElf; __ndx:longint; __src:PGElf_Phdr):longint;cdecl;external;
{ Create new program header with PHNUM entries.  Creates either an
   Elf32_Phdr or an Elf64_Phdr depending on whether the given ELF is
   ELFCLASS32 or ELFCLASS64.  Returns NULL on error.   }
function gelf_newphdr(__elf:PElf; __phnum:Tsize_t):pointer;cdecl;external;
{ Get compression header of section if any.  Returns NULL and sets
   elf_errno if the section isn't compressed or an error occurred.   }
function gelf_getchdr(__scn:PElf_Scn; __dst:PGElf_Chdr):PGElf_Chdr;cdecl;external;
{ Convert data structure from the representation in the file represented
   by ELF to their memory representation.   }
(* Const before type ignored *)
function gelf_xlatetom(__elf:PElf; __dest:PElf_Data; __src:PElf_Data; __encode:dword):PElf_Data;cdecl;external;
{ Convert data structure from to the representation in memory
   represented by ELF file representation.   }
(* Const before type ignored *)
function gelf_xlatetof(__elf:PElf; __dest:PElf_Data; __src:PElf_Data; __encode:dword):PElf_Data;cdecl;external;
{ Retrieve REL relocation info at the given index.   }
function gelf_getrel(__data:PElf_Data; __ndx:longint; __dst:PGElf_Rel):PGElf_Rel;cdecl;external;
{ Retrieve RELA relocation info at the given index.   }
function gelf_getrela(__data:PElf_Data; __ndx:longint; __dst:PGElf_Rela):PGElf_Rela;cdecl;external;
{ Update REL relocation information at given index.   }
function gelf_update_rel(__dst:PElf_Data; __ndx:longint; __src:PGElf_Rel):longint;cdecl;external;
{ Update RELA relocation information at given index.   }
function gelf_update_rela(__dst:PElf_Data; __ndx:longint; __src:PGElf_Rela):longint;cdecl;external;
{ Retrieve symbol information from the symbol table at the given index.   }
function gelf_getsym(__data:PElf_Data; __ndx:longint; __dst:PGElf_Sym):PGElf_Sym;cdecl;external;
{ Update symbol information in the symbol table at the given index.   }
function gelf_update_sym(__data:PElf_Data; __ndx:longint; __src:PGElf_Sym):longint;cdecl;external;
{ Retrieve symbol information and separate section index from the
   symbol table at the given index.   }
function gelf_getsymshndx(__symdata:PElf_Data; __shndxdata:PElf_Data; __ndx:longint; __sym:PGElf_Sym; __xshndx:PElf32_Word):PGElf_Sym;cdecl;external;
{ Update symbol information and separate section index in the symbol
   table at the given index.   }
function gelf_update_symshndx(__symdata:PElf_Data; __shndxdata:PElf_Data; __ndx:longint; __sym:PGElf_Sym; __xshndx:TElf32_Word):longint;cdecl;external;
{ Retrieve additional symbol information from the symbol table at the
   given index.   }
function gelf_getsyminfo(__data:PElf_Data; __ndx:longint; __dst:PGElf_Syminfo):PGElf_Syminfo;cdecl;external;
{ Update additional symbol information in the symbol table at the
   given index.   }
function gelf_update_syminfo(__data:PElf_Data; __ndx:longint; __src:PGElf_Syminfo):longint;cdecl;external;
{ Get information from dynamic table at the given index.   }
function gelf_getdyn(__data:PElf_Data; __ndx:longint; __dst:PGElf_Dyn):PGElf_Dyn;cdecl;external;
{ Update information in dynamic table at the given index.   }
function gelf_update_dyn(__dst:PElf_Data; __ndx:longint; __src:PGElf_Dyn):longint;cdecl;external;
{ Get move structure at the given index.   }
function gelf_getmove(__data:PElf_Data; __ndx:longint; __dst:PGElf_Move):PGElf_Move;cdecl;external;
{ Update move structure at the given index.   }
function gelf_update_move(__data:PElf_Data; __ndx:longint; __src:PGElf_Move):longint;cdecl;external;
{ Get library from table at the given index.   }
function gelf_getlib(__data:PElf_Data; __ndx:longint; __dst:PGElf_Lib):PGElf_Lib;cdecl;external;
{ Update library in table at the given index.   }
function gelf_update_lib(__data:PElf_Data; __ndx:longint; __src:PGElf_Lib):longint;cdecl;external;
{ Retrieve symbol version information at given index.   }
function gelf_getversym(__data:PElf_Data; __ndx:longint; __dst:PGElf_Versym):PGElf_Versym;cdecl;external;
{ Update symbol version information.   }
function gelf_update_versym(__data:PElf_Data; __ndx:longint; __src:PGElf_Versym):longint;cdecl;external;
{ Retrieve required symbol version information at given offset.   }
function gelf_getverneed(__data:PElf_Data; __offset:longint; __dst:PGElf_Verneed):PGElf_Verneed;cdecl;external;
{ Update required symbol version information.   }
function gelf_update_verneed(__data:PElf_Data; __offset:longint; __src:PGElf_Verneed):longint;cdecl;external;
{ Retrieve additional required symbol version information at given offset.   }
function gelf_getvernaux(__data:PElf_Data; __offset:longint; __dst:PGElf_Vernaux):PGElf_Vernaux;cdecl;external;
{ Update additional required symbol version information.   }
function gelf_update_vernaux(__data:PElf_Data; __offset:longint; __src:PGElf_Vernaux):longint;cdecl;external;
{ Retrieve symbol version definition information at given offset.   }
function gelf_getverdef(__data:PElf_Data; __offset:longint; __dst:PGElf_Verdef):PGElf_Verdef;cdecl;external;
{ Update symbol version definition information.   }
function gelf_update_verdef(__data:PElf_Data; __offset:longint; __src:PGElf_Verdef):longint;cdecl;external;
{ Retrieve additional symbol version definition information at given
   offset.   }
function gelf_getverdaux(__data:PElf_Data; __offset:longint; __dst:PGElf_Verdaux):PGElf_Verdaux;cdecl;external;
{ Update additional symbol version definition information.   }
function gelf_update_verdaux(__data:PElf_Data; __offset:longint; __src:PGElf_Verdaux):longint;cdecl;external;
{ Get auxv entry at the given index.   }
function gelf_getauxv(__data:PElf_Data; __ndx:longint; __dst:PGElf_auxv_t):PGElf_auxv_t;cdecl;external;
{ Update auxv entry at the given index.   }
function gelf_update_auxv(__data:PElf_Data; __ndx:longint; __src:PGElf_auxv_t):longint;cdecl;external;
{ Get note header at the given offset into the data, and the offsets of
   the note's name and descriptor data.  Returns the offset of the next
   note header, or 0 for an invalid offset or corrupt note header.   }
function gelf_getnote(__data:PElf_Data; __offset:Tsize_t; __result:PGElf_Nhdr; __name_offset:Psize_t; __desc_offset:Psize_t):Tsize_t;cdecl;external;
{ Compute simple checksum from permanent parts of the ELF file.   }
function gelf_checksum(__elf:PElf):longint;cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}
{ gelf.h  }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GELF_ST_BIND(val : longint) : longint;
begin
  GELF_ST_BIND:=ELF64_ST_BIND(val);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GELF_ST_TYPE(val : longint) : longint;
begin
  GELF_ST_TYPE:=ELF64_ST_TYPE(val);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GELF_ST_INFO(bind,_type : longint) : longint;
begin
  GELF_ST_INFO:=ELF64_ST_INFO(bind,_type);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GELF_ST_VISIBILITY(val : longint) : longint;
begin
  GELF_ST_VISIBILITY:=ELF64_ST_VISIBILITY(val);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GELF_R_SYM(info : longint) : longint;
begin
  GELF_R_SYM:=ELF64_R_SYM(info);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GELF_R_TYPE(info : longint) : longint;
begin
  GELF_R_TYPE:=ELF64_R_TYPE(info);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GELF_R_INFO(sym,_type : longint) : longint;
begin
  GELF_R_INFO:=ELF64_R_INFO(sym,_type);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GELF_M_SYM(info : longint) : longint;
begin
  GELF_M_SYM:=ELF64_M_SYM(info);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GELF_M_SIZE(info : longint) : longint;
begin
  GELF_M_SIZE:=ELF64_M_SIZE(info);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GELF_M_INFO(sym,size : longint) : longint;
begin
  GELF_M_INFO:=ELF64_M_INFO(sym,size);
end;


end.
