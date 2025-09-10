unit link;

interface

uses
  fp_elf64, elf;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  // /usr/include/link.h

  { xxxxxxxxxxxxxx #define ElfW(type)  _ElfW (Elf, __ELF_NATIVE_CLASS, type) }
  { xxxxxxxxxxxxxx #define _ElfW(e,w,t)  _ElfW_1 (e, w, _##t) }
  { xxxxxxxxxxxxxx #define _ElfW_1(e,w,t)  e##w##t }
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
  //  var
  //    _r_debug : Tr_debug;cvar;external libtcod;
  //type
  //  Pr_debug_extended = ^Tr_debug_extended;
  //  Tr_debug_extended = record
  //      base : Tr_debug;
  //      r_next : Pr_debug_extended;
  //    end;

  //  var
  //    Dyn : TElfW;cvar;external libtcod;
{ xxxxxxxxxxxxxxxx
struct link_map
  

    ElfW(Addr) l_addr;

    char *l_name;
    ElfW(Dyn) *l_ld;
    struct link_map *l_next, *l_prev;
  ;
 }
const
  LA_ACT_CONSISTENT = 0;
  LA_ACT_ADD = 1;
  LA_ACT_DELETE = 2;

const
  LA_SER_ORIG = $01;
  LA_SER_LIBPATH = $02;
  LA_SER_RUNPATH = $04;
  LA_SER_CONFIG = $08;
  LA_SER_DEFAULT = $40;
  LA_SER_SECURE = $80;

const
  LA_FLG_BINDTO = $01;
  LA_FLG_BINDFROM = $02;

const
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
  ;     }
type
  Pdl_phdr_info = Pointer;
  Plink_map = Pointer;

type
  Titerate_phdr = function(para1: Pdl_phdr_info; para2: Tsize_t; para3: pointer): longint;

function dl_iterate_phdr(__callback: Titerate_phdr; __data: pointer): longint; cdecl; external libelf64;
function la_version(__version: dword): dword; cdecl; external libelf64;
procedure la_activity(__cookie: Puintptr_t; __flag: dword); cdecl; external libelf64;
function la_objsearch(__name: pchar; __cookie: Puintptr_t; __flag: dword): pchar; cdecl; external libelf64;
function la_objopen(__map: Plink_map; __lmid: TLmid_t; __cookie: Puintptr_t): dword; cdecl; external libelf64;
procedure la_preinit(__cookie: Puintptr_t); cdecl; external libelf64;
function la_symbind32(__sym: PElf32_Sym; __ndx: dword; __refcook: Puintptr_t; __defcook: Puintptr_t; __flags: Pdword;
  __symname: pchar): Tuintptr_t; cdecl; external libelf64;
function la_symbind64(__sym: PElf64_Sym; __ndx: dword; __refcook: Puintptr_t; __defcook: Puintptr_t; __flags: Pdword;
  __symname: pchar): Tuintptr_t; cdecl; external libelf64;
function la_objclose(__cookie: Puintptr_t): dword; cdecl; external libelf64;

// === Konventiert am: 8-9-25 19:14:59 ===


implementation



end.
