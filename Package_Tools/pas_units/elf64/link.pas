unit link;

interface

uses
  fp_tcod;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}

// /usr/include/link.h


{ Data structure for communication from the run-time dynamic linker for
   loaded ELF shared objects.
   Copyright (C) 1995-2024 Free Software Foundation, Inc.
   This file is part of the GNU C Library.

   The GNU C Library is free software; you can redistribute it and/or
   modify it under the terms of the GNU Lesser General Public
   License as published by the Free Software Foundation; either
   version 2.1 of the License, or (at your option) any later version.

   The GNU C Library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Lesser General Public License for more details.

   You should have received a copy of the GNU Lesser General Public
   License along with the GNU C Library; if not, see
   <https://www.gnu.org/licenses/>.   }
{$ifndef	_LINK_H}

const
  _LINK_H = 1;  
{$include <features.h>}
{$include <elf.h>}
{$include <dlfcn.h>}
{$include <sys/types.h>}
{ We use this macro to refer to ELF types independent of the native wordsize.
   `ElfW(TYPE)' is used in place of `Elf32_TYPE' or `Elf64_TYPE'.   }
{ xxxxxxxxxxxxxx #define ElfW(type)	_ElfW (Elf, __ELF_NATIVE_CLASS, type) }
{ xxxxxxxxxxxxxx #define _ElfW(e,w,t)	_ElfW_1 (e, w, _##t) }
{ xxxxxxxxxxxxxx #define _ElfW_1(e,w,t)	e##w##t }
{$include <bits/elfclass.h>		/* Defines __ELF_NATIVE_CLASS.  */}
{$include <bits/link.h>}
{ The legacy rendezvous structure used by the run-time dynamic linker to
   communicate details of shared object loading to the debugger.   }
{ xxxxxxxxxxxxxxxxxxxxx
struct r_debug
  
    int r_version;

    struct link_map *r_map;	

    ElfW(Addr) r_brk;
    enum 
      
	RT_CONSISTENT,
	RT_ADD,			
	RT_DELETE		
       r_state;

    ElfW(Addr) r_ldbase;
  ;
 }
{ This is the symbol of that structure provided by the dynamic linker.   }
  var
    _r_debug : Tr_debug;cvar;external libtcod;
{ The extended rendezvous structure used by the run-time dynamic linker
   to communicate details of shared object loading to the debugger.  If
   the executable's dynamic section has a DT_DEBUG element, the run-time
   linker sets that element's value to the address where this structure
   can be found.   }
{ The following field is added by r_version == 2.   }
{ Link to the next r_debug_extended structure.  Each r_debug_extended
       structure represents a different namespace.  The first
       r_debug_extended structure is for the default namespace.   }
type
  Pr_debug_extended = ^Tr_debug_extended;
  Tr_debug_extended = record
      base : Tr_debug;
      r_next : Pr_debug_extended;
    end;

{ This symbol refers to the "dynamic structure" in the `.dynamic' section
   of whatever module refers to `_DYNAMIC'.  So, to find its own
   `struct r_debug_extended', a program could do:
     for (dyn = _DYNAMIC; dyn->d_tag != DT_NULL; ++dyn)
       if (dyn->d_tag == DT_DEBUG)
	 r_debug_extended = (struct r_debug_extended *) dyn->d_un.d_ptr;
  }
  var
    Dyn : TElfW;cvar;external libtcod;
{ Structure describing a loaded shared object.  The `l_next' and `l_prev'
   members form a chain of all the shared objects loaded at startup.

   These data structures exist in space used by the run-time dynamic linker;
   modifying them may have disastrous results.   }
{ xxxxxxxxxxxxxxxx
struct link_map
  

    ElfW(Addr) l_addr;		
		
    char *l_name;	
    ElfW(Dyn) *l_ld;		
    struct link_map *l_next, *l_prev;
  ;
 }
{$ifdef __USE_GNU}
{ Version numbers for la_version handshake interface.   }
{$include <bits/link_lavcurrent.h>}
{ Activity types signaled through la_activity.   }
{ Link map consistent again.   }
{ New object will be added.   }
{ Objects will be removed.   }
type
  Txxxxxxxxx =  Longint;
  Const
    LA_ACT_CONSISTENT = 0;
    LA_ACT_ADD = 1;
    LA_ACT_DELETE = 2;

{ Values representing origin of name for dynamic loading.   }
{ Original name.   }
{ Directory from LD_LIBRARY_PATH.   }
{ Directory from RPATH/RUNPATH.   }
{ Found through ldconfig.   }
{ Default directory.   }
{ Unused.   }
type
  Txxxxxxxxxx =  Longint;
  Const
    LA_SER_ORIG = $01;
    LA_SER_LIBPATH = $02;
    LA_SER_RUNPATH = $04;
    LA_SER_CONFIG = $08;
    LA_SER_DEFAULT = $40;
    LA_SER_SECURE = $80;

{ Values for la_objopen return value.   }
{ Audit symbols bound to this object.   }
{ Audit symbols bound from this object.   }
type
  Txxxxxxxxxxxxxxxxx =  Longint;
  Const
    LA_FLG_BINDTO = $01;
    LA_FLG_BINDFROM = $02;

{ Values for la_symbind flags parameter.   }
{ la_pltenter will not be called.   }
{ la_pltexit will not be called.   }
{ Return value is a structure.   }
{ Binding due to dlsym call.   }
{ Value has been changed by a previous
				   la_symbind call.   }
type
  Txxxxxxxxxxxxxxxxxxxxx =  Longint;
  Const
    LA_SYMB_NOPLTENTER = $01;
    LA_SYMB_NOPLTEXIT = $02;
    LA_SYMB_STRUCTCALL = $04;
    LA_SYMB_DLSYM = $08;
    LA_SYMB_ALTVALUE = $10;

{ xxxxxxxxxxxxxx
struct dl_phdr_info
  
    ElfW(Addr) dlpi_addr;
    const char *dlpi_name;
    const ElfW(Phdr) *dlpi_phdr;
    ElfW(Half) dlpi_phnum;


    unsigned long long int dlpi_adds;
     unsigned long long int dlpi_subs;

    size_t dlpi_tls_modid;

    void *dlpi_tls_data;
  ;

 }

function dl_iterate_phdr(__callback:function (para1:Pdl_phdr_info; para2:Tsize_t; para3:pointer):longint; __data:pointer):longint;cdecl;external libtcod;
{ Prototypes for the ld.so auditing interfaces.  These are not
   defined anywhere in ld.so but instead have to be provided by the
   auditing DSO.   }
function la_version(__version:dword):dword;cdecl;external libtcod;
procedure la_activity(__cookie:Puintptr_t; __flag:dword);cdecl;external libtcod;
function la_objsearch(__name:Pchar; __cookie:Puintptr_t; __flag:dword):Pchar;cdecl;external libtcod;
function la_objopen(__map:Plink_map; __lmid:TLmid_t; __cookie:Puintptr_t):dword;cdecl;external libtcod;
procedure la_preinit(__cookie:Puintptr_t);cdecl;external libtcod;
function la_symbind32(__sym:PElf32_Sym; __ndx:dword; __refcook:Puintptr_t; __defcook:Puintptr_t; __flags:Pdword; 
           __symname:Pchar):Tuintptr_t;cdecl;external libtcod;
function la_symbind64(__sym:PElf64_Sym; __ndx:dword; __refcook:Puintptr_t; __defcook:Puintptr_t; __flags:Pdword; 
           __symname:Pchar):Tuintptr_t;cdecl;external libtcod;
function la_objclose(__cookie:Puintptr_t):dword;cdecl;external libtcod;
{$endif}
{$endif}
{ link.h  }

// === Konventiert am: 8-9-25 19:14:59 ===


implementation



end.
