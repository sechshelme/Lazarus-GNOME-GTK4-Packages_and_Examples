
unit libelf;
interface

{
  Automatically converted by H2Pas 1.0.0 from libelf.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    libelf.h
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
PElf  = ^Elf;
PElf32_Chdr  = ^Elf32_Chdr;
PElf32_Ehdr  = ^Elf32_Ehdr;
PElf32_Phdr  = ^Elf32_Phdr;
PElf32_Relr  = ^Elf32_Relr;
PElf32_Shdr  = ^Elf32_Shdr;
PElf64_Chdr  = ^Elf64_Chdr;
PElf64_Ehdr  = ^Elf64_Ehdr;
PElf64_Phdr  = ^Elf64_Phdr;
PElf64_Relr  = ^Elf64_Relr;
PElf64_Shdr  = ^Elf64_Shdr;
PElf_Arhdr  = ^Elf_Arhdr;
PElf_Arsym  = ^Elf_Arsym;
PElf_Cmd  = ^Elf_Cmd;
PElf_Data  = ^Elf_Data;
PElf_Kind  = ^Elf_Kind;
PElf_Scn  = ^Elf_Scn;
PElf_Type  = ^Elf_Type;
Psize_t  = ^size_t;
Pxxxxxxxxxx  = ^xxxxxxxxxx;
Pxxxxxxxxxxxxxxxx  = ^xxxxxxxxxxxxxxxx;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Interface for libelf.
   Copyright (C) 1998-2010, 2015 Red Hat, Inc.
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
{$ifndef _LIBELF_H}

const
  _LIBELF_H = 1;  
{$include <stdint.h>}
{$include <sys/types.h>}
{ Get the ELF types.   }
{$include <elf.h>}
{$ifndef SHF_COMPRESSED}
{ Older glibc elf.h might not yet define the ELF compression types.   }
{ Section with compressed data.  }

const
  SHF_COMPRESSED = 1 shl 11;  
{ Section compression header.  Used when SHF_COMPRESSED is set.   }
{ Compression format.   }
{ Uncompressed data size.   }
{ Uncompressed data alignment.   }
type
  PElf32_Chdr = ^TElf32_Chdr;
  TElf32_Chdr = record
      ch_type : TElf32_Word;
      ch_size : TElf32_Word;
      ch_addralign : TElf32_Word;
    end;
{ Compression format.   }
{ Uncompressed data size.   }
{ Uncompressed data alignment.   }

  PElf64_Chdr = ^TElf64_Chdr;
  TElf64_Chdr = record
      ch_type : TElf64_Word;
      ch_reserved : TElf64_Word;
      ch_size : TElf64_Xword;
      ch_addralign : TElf64_Xword;
    end;
{ Legal values for ch_type (compression algorithm).   }
{ ZLIB/DEFLATE algorithm.   }

const
  ELFCOMPRESS_ZLIB = 1;  
{ Start of OS-specific.   }
  ELFCOMPRESS_LOOS = $60000000;  
{ End of OS-specific.   }
  ELFCOMPRESS_HIOS = $6fffffff;  
{ Start of processor-specific.   }
  ELFCOMPRESS_LOPROC = $70000000;  
{ End of processor-specific.   }
  ELFCOMPRESS_HIPROC = $7fffffff;  
{$endif}
{$ifndef ELFCOMPRESS_ZSTD}
{ So ZSTD compression can be used even with an old system elf.h.   }
{ Zstandard algorithm.   }

const
  ELFCOMPRESS_ZSTD = 2;  
{$endif}
{$ifndef SHT_RELR}
{ So RELR defines/typedefs can be used even with an old system elf.h.   }
{ RELR relative relocations  }

const
  SHT_RELR = 19;  
{ RELR relocation table entry  }
type
  PElf32_Relr = ^TElf32_Relr;
  TElf32_Relr = TElf32_Word;

  PElf64_Relr = ^TElf64_Relr;
  TElf64_Relr = TElf64_Xword;
{ Total size of RELR relative relocations  }

const
  DT_RELRSZ = 35;  
{ Address of RELR relative relocations  }
  DT_RELR = 36;  
{ Size of one RELR relative relocaction  }
  DT_RELRENT = 37;  
{$endif}
{ Known translation types.   }
{ unsigned char  }
{ Elf32_Addr, Elf64_Addr, ...  }
{ Dynamic section record.   }
{ ELF header.   }
{ Elf32_Half, Elf64_Half, ...  }
{ Elf32_Off, Elf64_Off, ...  }
{ Program header.   }
{ Relocation entry with addend.   }
{ Relocation entry.   }
{ Section header.   }
{ Elf32_Sword, Elf64_Sword, ...  }
{ Symbol record.   }
{ Elf32_Word, Elf64_Word, ...  }
{ Elf32_Xword, Elf64_Xword, ...  }
{ Elf32_Sxword, Elf64_Sxword, ...  }
{ Elf32_Verdef, Elf64_Verdef, ...  }
{ Elf32_Verdaux, Elf64_Verdaux, ...  }
{ Elf32_Verneed, Elf64_Verneed, ...  }
{ Elf32_Vernaux, Elf64_Vernaux, ...  }
{ Elf32_Nhdr, Elf64_Nhdr, ...  }
{ Elf32_Syminfo, Elf64_Syminfo, ...  }
{ Elf32_Move, Elf64_Move, ...  }
{ Elf32_Lib, Elf64_Lib, ...  }
{ GNU-style hash section.   }
{ Elf32_auxv_t, Elf64_auxv_t, ...  }
{ Compressed, Elf32_Chdr, Elf64_Chdr, ...  }
{ Special GNU Properties note.  Same as Nhdr,
				   except padding.   }
{ Relative relocation entry.   }
{ Keep this the last entry.   }
type
  PElf_Type = ^TElf_Type;
  TElf_Type =  Longint;
  Const
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
;
{ Descriptor for data to be converted to or from memory format.   }
{ Pointer to the actual data.   }
{ Type of this piece of data.   }
{ ELF version.   }
{ Size in bytes.   }
{ Offset into section.   }
{ Alignment in section.   }
type
  PElf_Data = ^TElf_Data;
  TElf_Data = record
      d_buf : pointer;
      d_type : TElf_Type;
      d_version : dword;
      d_size : Tsize_t;
      d_off : Tint64_t;
      d_align : Tsize_t;
    end;
{ Commands for `...'.   }
{ Nothing, terminate, or compute only.   }
{ Read ..  }
{ Read and write ..  }
{ Write ..  }
{ Clear flag.   }
{ Set flag.   }
{ Signal that file descriptor will not be
				   used anymore.   }
{ Read rest of data so that file descriptor
				   is not used anymore.   }
{ The following are extensions.   }
{ Read, but mmap the file if possible.   }
{ Read and write, with mmap.   }
{ Write, with mmap.   }
{ Read, but memory is writable, results are
				   not written to the file.   }
{ Copy basic file data but not the content.  }
{ Keep this the last entry.   }

  PElf_Cmd = ^TElf_Cmd;
  TElf_Cmd =  Longint;
  Const
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
;
{ Flags for the ELF structures.   }
type
  Txxxxxxxxxx =  Longint;
  Const
    ELF_F_DIRTY = $1;
    ELF_F_LAYOUT = $4;
    ELF_F_PERMISSIVE = $8;

{ Flags for elf_compress[_gnu].   }
type
  Txxxxxxxxxxxxxxxx =  Longint;
  Const
    ELF_CHF_FORCE = $1;

{ Identification values for recognized object files.   }
{ Unknown.   }
{ Archive.   }
{ Stupid old COFF.   }
{ ELF file.   }
{ Keep this the last entry.   }
type
  PElf_Kind = ^TElf_Kind;
  TElf_Kind =  Longint;
  Const
    ELF_K_NONE = 0;
    ELF_K_AR = 1;
    ELF_K_COFF = 2;
    ELF_K_ELF = 3;
    ELF_K_NUM = 4;
;
{ Archive member header.   }
{ Name of archive member.   }
{ File date.   }
{ User ID.   }
{ Group ID.   }
{ File mode.   }
{ File size.   }
{ Original name of archive member.   }
type
  PElf_Arhdr = ^TElf_Arhdr;
  TElf_Arhdr = record
      ar_name : Pchar;
      ar_date : Ttime_t;
      ar_uid : Tuid_t;
      ar_gid : Tgid_t;
      ar_mode : Tmode_t;
      ar_size : Tint64_t;
      ar_rawname : Pchar;
    end;
{ Archive symbol table entry.   }
{ Symbol name.   }
{ Offset for this file in the archive.   }
{ Hash value of the name.   }

  PElf_Arsym = ^TElf_Arsym;
  TElf_Arsym = record
      as_name : Pchar;
      as_off : Tsize_t;
      as_hash : dword;
    end;
{ Descriptor for the ELF file.   }
{ Descriptor for ELF file section.   }
{ C++ extern C conditionnal removed }
{ Return descriptor for ELF file to work according to CMD.   }

function elf_begin(__fildes:longint; __cmd:TElf_Cmd; __ref:PElf):PElf;cdecl;external;
{ Create a clone of an existing ELF descriptor.   }
function elf_clone(__elf:PElf; __cmd:TElf_Cmd):PElf;cdecl;external;
{ Create descriptor for memory region.   }
function elf_memory(__image:Pchar; __size:Tsize_t):PElf;cdecl;external;
{ Advance archive descriptor to next element.   }
function elf_next(__elf:PElf):TElf_Cmd;cdecl;external;
{ Free resources allocated for ELF.   }
function elf_end(__elf:PElf):longint;cdecl;external;
{ Update ELF descriptor and write file to disk.   }
function elf_update(__elf:PElf; __cmd:TElf_Cmd):Tint64_t;cdecl;external;
{ Determine what kind of file is associated with ELF.   }
function elf_kind(__elf:PElf):TElf_Kind;cdecl;external;
{ Get the base offset for an object file.   }
function elf_getbase(__elf:PElf):Tint64_t;cdecl;external;
{ Retrieve file identification data.   }
function elf_getident(__elf:PElf; __nbytes:Psize_t):Pchar;cdecl;external;
{ Retrieve class-dependent object file header.   }
function elf32_getehdr(__elf:PElf):PElf32_Ehdr;cdecl;external;
{ Similar but this time the binary calls is ELFCLASS64.   }
function elf64_getehdr(__elf:PElf):PElf64_Ehdr;cdecl;external;
{ Create ELF header if none exists.   }
function elf32_newehdr(__elf:PElf):PElf32_Ehdr;cdecl;external;
{ Similar but this time the binary calls is ELFCLASS64.   }
function elf64_newehdr(__elf:PElf):PElf64_Ehdr;cdecl;external;
{ Get the number of program headers in the ELF file.  If the file uses
   more headers than can be represented in the e_phnum field of the ELF
   header the information from the sh_info field in the zeroth section
   header is used.   }
function elf_getphdrnum(__elf:PElf; __dst:Psize_t):longint;cdecl;external;
{ Retrieve class-dependent program header table.   }
function elf32_getphdr(__elf:PElf):PElf32_Phdr;cdecl;external;
{ Similar but this time the binary calls is ELFCLASS64.   }
function elf64_getphdr(__elf:PElf):PElf64_Phdr;cdecl;external;
{ Create ELF program header.   }
function elf32_newphdr(__elf:PElf; __cnt:Tsize_t):PElf32_Phdr;cdecl;external;
{ Similar but this time the binary calls is ELFCLASS64.   }
function elf64_newphdr(__elf:PElf; __cnt:Tsize_t):PElf64_Phdr;cdecl;external;
{ Get section at INDEX.   }
function elf_getscn(__elf:PElf; __index:Tsize_t):PElf_Scn;cdecl;external;
{ Get section at OFFSET.   }
function elf32_offscn(__elf:PElf; __offset:TElf32_Off):PElf_Scn;cdecl;external;
{ Similar but this time the binary calls is ELFCLASS64.   }
function elf64_offscn(__elf:PElf; __offset:TElf64_Off):PElf_Scn;cdecl;external;
{ Get index of section.   }
function elf_ndxscn(__scn:PElf_Scn):Tsize_t;cdecl;external;
{ Get section with next section index.   }
function elf_nextscn(__elf:PElf; __scn:PElf_Scn):PElf_Scn;cdecl;external;
{ Create a new section and append it at the end of the table.   }
function elf_newscn(__elf:PElf):PElf_Scn;cdecl;external;
{ Get the section index of the extended section index table for the
   given symbol table.   }
function elf_scnshndx(__scn:PElf_Scn):longint;cdecl;external;
{ Get the number of sections in the ELF file.  If the file uses more
   sections than can be represented in the e_shnum field of the ELF
   header the information from the sh_size field in the zeroth section
   header is used.   }
function elf_getshdrnum(__elf:PElf; __dst:Psize_t):longint;cdecl;external;
{ Sun messed up the implementation of 'elf_getshnum' in their implementation.
   It was agreed to make the same functionality available under a different
   name and obsolete the old name.   }
function elf_getshnum(__elf:PElf; __dst:Psize_t):longint;cdecl;external;
{ xxxxxxxxxxxxxxxx  __deprecated_attribute__; }
{ Get the section index of the section header string table in the ELF
   file.  If the index cannot be represented in the e_shstrndx field of
   the ELF header the information from the sh_link field in the zeroth
   section header is used.   }
function elf_getshdrstrndx(__elf:PElf; __dst:Psize_t):longint;cdecl;external;
{ Sun messed up the implementation of 'elf_getshstrndx' in their
   implementation.  It was agreed to make the same functionality available
   under a different name and obsolete the old name.   }
function elf_getshstrndx(__elf:PElf; __dst:Psize_t):longint;cdecl;external;
{ xxxxxxxxxxxxxxxx       __deprecated_attribute__; }
{ Retrieve section header of ELFCLASS32 binary.   }
function elf32_getshdr(__scn:PElf_Scn):PElf32_Shdr;cdecl;external;
{ Similar for ELFCLASS64.   }
function elf64_getshdr(__scn:PElf_Scn):PElf64_Shdr;cdecl;external;
{ Returns compression header for a section if section data is
   compressed.  Returns NULL and sets elf_errno if the section isn't
   compressed or an error occurred.   }
function elf32_getchdr(__scn:PElf_Scn):PElf32_Chdr;cdecl;external;
function elf64_getchdr(__scn:PElf_Scn):PElf64_Chdr;cdecl;external;
{ Compress or decompress the data of a section and adjust the section
   header.

   elf_compress works by setting or clearing the SHF_COMPRESS flag
   from the section Shdr and will encode or decode a Elf32_Chdr or
   Elf64_Chdr at the start of the section data.  elf_compress_gnu will
   encode or decode any section, but is traditionally only used for
   sections that have a name starting with ".debug" when
   uncompressed or ".zdebug" when compressed and stores just the
   uncompressed size.  The GNU compression method is deprecated and
   should only be used for legacy support.

   elf_compress takes a compression type that should be either zero to
   decompress or an ELFCOMPRESS algorithm to use for compression.
   Currently ELFCOMPRESS_ZLIB and ELFCOMPRESS_ZSTD are supported.
   elf_compress_gnu will compress in the traditional GNU compression
   format when compress is one and decompress the section data when
   compress is zero.

   The FLAGS argument can be zero or ELF_CHF_FORCE.  If FLAGS contains
   ELF_CHF_FORCE then it will always compress the section, even if
   that would not reduce the size of the data section (including the
   header).  Otherwise elf_compress and elf_compress_gnu will compress
   the section only if the total data size is reduced.

   On successful compression or decompression the function returns
   one.  If (not forced) compression is requested and the data section
   would not actually reduce in size, the section is not actually
   compressed and zero is returned.  Otherwise -1 is returned and
   elf_errno is set.

   It is an error to request compression for a section that already
   has SHF_COMPRESSED set, or (for elf_compress) to request
   decompression for an section that doesn't have SHF_COMPRESSED set.
   If a section has SHF_COMPRESSED set then calling elf_compress_gnu
   will result in an error.  The section has to be decompressed first
   using elf_compress.  Calling elf_compress on a section compressed
   with elf_compress_gnu is fine, but probably useless.

   It is always an error to call these functions on SHT_NOBITS
   sections or if the section has the SHF_ALLOC flag set.
   elf_compress_gnu will not check whether the section name starts
   with ".debug" or .zdebug".  It is the responsibility of the caller
   to make sure the deprecated GNU compression method is only called
   on correctly named sections (and to change the name of the section
   when using elf_compress_gnu).

   All previous returned Shdrs and Elf_Data buffers are invalidated by
   this call and should no longer be accessed.

   Note that although this changes the header and data returned it
   doesn't mark the section as dirty.  To keep the changes when
   calling elf_update the section has to be flagged ELF_F_DIRTY.   }
function elf_compress(scn:PElf_Scn; _type:longint; flags:dword):longint;cdecl;external;
function elf_compress_gnu(scn:PElf_Scn; compress:longint; flags:dword):longint;cdecl;external;
{ Set or clear flags for ELF file.   }
function elf_flagelf(__elf:PElf; __cmd:TElf_Cmd; __flags:dword):dword;cdecl;external;
{ Similarly for the ELF header.   }
function elf_flagehdr(__elf:PElf; __cmd:TElf_Cmd; __flags:dword):dword;cdecl;external;
{ Similarly for the ELF program header.   }
function elf_flagphdr(__elf:PElf; __cmd:TElf_Cmd; __flags:dword):dword;cdecl;external;
{ Similarly for the given ELF section.   }
function elf_flagscn(__scn:PElf_Scn; __cmd:TElf_Cmd; __flags:dword):dword;cdecl;external;
{ Similarly for the given ELF data.   }
function elf_flagdata(__data:PElf_Data; __cmd:TElf_Cmd; __flags:dword):dword;cdecl;external;
{ Similarly for the given ELF section header.   }
function elf_flagshdr(__scn:PElf_Scn; __cmd:TElf_Cmd; __flags:dword):dword;cdecl;external;
{ Get data from section while translating from file representation to
   memory representation.  The Elf_Data d_type is set based on the
   section type if known.  Otherwise d_type is set to ELF_T_BYTE.  If
   the section contains compressed data then d_type is always set to
   ELF_T_CHDR.   }
function elf_getdata(__scn:PElf_Scn; __data:PElf_Data):PElf_Data;cdecl;external;
{ Get uninterpreted section content.   }
function elf_rawdata(__scn:PElf_Scn; __data:PElf_Data):PElf_Data;cdecl;external;
{ Create new data descriptor for section SCN.   }
function elf_newdata(__scn:PElf_Scn):PElf_Data;cdecl;external;
{ Get data translated from a chunk of the file contents as section data
   would be for TYPE.  The resulting Elf_Data pointer is valid until
   elf_end (ELF) is called.   }
function elf_getdata_rawchunk(__elf:PElf; __offset:Tint64_t; __size:Tsize_t; __type:TElf_Type):PElf_Data;cdecl;external;
{ Return pointer to string at OFFSET in section INDEX.   }
function elf_strptr(__elf:PElf; __index:Tsize_t; __offset:Tsize_t):Pchar;cdecl;external;
{ Return header of archive.   }
function elf_getarhdr(__elf:PElf):PElf_Arhdr;cdecl;external;
{ Return offset in archive for current file ELF.   }
function elf_getaroff(__elf:PElf):Tint64_t;cdecl;external;
{ Select archive element at OFFSET.   }
function elf_rand(__elf:PElf; __offset:Tsize_t):Tsize_t;cdecl;external;
{ Get symbol table of archive.   }
function elf_getarsym(__elf:PElf; __narsyms:Psize_t):PElf_Arsym;cdecl;external;
{ Control ELF descriptor.   }
function elf_cntl(__elf:PElf; __cmd:TElf_Cmd):longint;cdecl;external;
{ Retrieve uninterpreted file contents.   }
function elf_rawfile(__elf:PElf; __nbytes:Psize_t):Pchar;cdecl;external;
{ Return size of array of COUNT elements of the type denoted by TYPE
   in the external representation.  The binary class is taken from ELF.
   The result is based on version VERSION of the ELF standard.   }
function elf32_fsize(__type:TElf_Type; __count:Tsize_t; __version:dword):Tsize_t;cdecl;external;
{ Similar but this time the binary calls is ELFCLASS64.   }
function elf64_fsize(__type:TElf_Type; __count:Tsize_t; __version:dword):Tsize_t;cdecl;external;
{ Convert data structure from the representation in the file represented
   by ELF to their memory representation.   }
(* Const before type ignored *)
function elf32_xlatetom(__dest:PElf_Data; __src:PElf_Data; __encode:dword):PElf_Data;cdecl;external;
{ Same for 64 bit class.   }
(* Const before type ignored *)
function elf64_xlatetom(__dest:PElf_Data; __src:PElf_Data; __encode:dword):PElf_Data;cdecl;external;
{ Convert data structure from to the representation in memory
   represented by ELF file representation.   }
(* Const before type ignored *)
function elf32_xlatetof(__dest:PElf_Data; __src:PElf_Data; __encode:dword):PElf_Data;cdecl;external;
{ Same for 64 bit class.   }
(* Const before type ignored *)
function elf64_xlatetof(__dest:PElf_Data; __src:PElf_Data; __encode:dword):PElf_Data;cdecl;external;
{ Return error code of last failing function call.  This value is kept
   separately for each thread.   }
function elf_errno:longint;cdecl;external;
{ Return error string for ERROR.  If ERROR is zero, return error string
   for most recent error or NULL is none occurred.  If ERROR is -1 the
   behaviour is similar to the last case except that not NULL but a legal
   string is returned.   }
(* Const before type ignored *)
function elf_errmsg(__error:longint):Pchar;cdecl;external;
{ Coordinate ELF library and application versions.   }
function elf_version(__version:dword):dword;cdecl;external;
{ Set fill bytes used to fill holes in data structures.   }
procedure elf_fill(__fill:longint);cdecl;external;
{ Compute hash value.   }
(* Const before type ignored *)
function elf_hash(__string:Pchar):dword;cdecl;external;
{ Compute hash value using the GNU-specific hash function.   }
(* Const before type ignored *)
function elf_gnu_hash(__string:Pchar):dword;cdecl;external;
{ Compute simple checksum from permanent parts of the ELF file.   }
function elf32_checksum(__elf:PElf):longint;cdecl;external;
{ Similar but this time the binary calls is ELFCLASS64.   }
function elf64_checksum(__elf:PElf):longint;cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}
{ libelf.h  }

implementation


end.
