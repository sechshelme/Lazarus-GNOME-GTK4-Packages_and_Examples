unit gelf;

interface

uses
  clib, fp_elf64, elf_linux, elf, libelf;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  // /usr/include/gelf.h


type
  PGElf_Half = ^TGElf_Half;
  TGElf_Half = TElf64_Half;

  PGElf_Word = ^TGElf_Word;
  TGElf_Word = TElf64_Word;

  PGElf_Sword = ^TGElf_Sword;
  TGElf_Sword = TElf64_Sword;

  PGElf_Xword = ^TGElf_Xword;
  TGElf_Xword = TElf64_Xword;

  PGElf_Sxword = ^TGElf_Sxword;
  TGElf_Sxword = TElf64_Sxword;

  PGElf_Addr = ^TGElf_Addr;
  TGElf_Addr = TElf64_Addr;

  PGElf_Off = ^TGElf_Off;
  TGElf_Off = TElf64_Off;

  PGElf_Ehdr = ^TGElf_Ehdr;
  TGElf_Ehdr = TElf64_Ehdr;

  PGElf_Shdr = ^TGElf_Shdr;
  TGElf_Shdr = TElf64_Shdr;

  PGElf_Section = ^TGElf_Section;
  TGElf_Section = TElf64_Section;

  PGElf_Sym = ^TGElf_Sym;
  TGElf_Sym = TElf64_Sym;

  PGElf_Syminfo = ^TGElf_Syminfo;
  TGElf_Syminfo = TElf64_Syminfo;

  PGElf_Rel = ^TGElf_Rel;
  TGElf_Rel = TElf64_Rel;

  PGElf_Rela = ^TGElf_Rela;
  TGElf_Rela = TElf64_Rela;

  PGElf_Relr = ^TGElf_Relr;
  TGElf_Relr = TElf64_Relr;

  PGElf_Phdr = ^TGElf_Phdr;
  TGElf_Phdr = TElf64_Phdr;

  PGElf_Chdr = ^TGElf_Chdr;
  TGElf_Chdr = TElf64_Chdr;

  PGElf_Dyn = ^TGElf_Dyn;
  TGElf_Dyn = TElf64_Dyn;

  PGElf_Verdef = ^TGElf_Verdef;
  TGElf_Verdef = TElf64_Verdef;

  PGElf_Verdaux = ^TGElf_Verdaux;
  TGElf_Verdaux = TElf64_Verdaux;

  PGElf_Verneed = ^TGElf_Verneed;
  TGElf_Verneed = TElf64_Verneed;

  PGElf_Vernaux = ^TGElf_Vernaux;
  TGElf_Vernaux = TElf64_Vernaux;

  PGElf_Versym = ^TGElf_Versym;
  TGElf_Versym = TElf64_Versym;

  PGElf_auxv_t = ^TGElf_auxv_t;
  TGElf_auxv_t = TElf64_auxv_t;

  PGElf_Nhdr = ^TGElf_Nhdr;
  TGElf_Nhdr = TElf64_Nhdr;

  PGElf_Move = ^TGElf_Move;
  TGElf_Move = TElf64_Move;

  PGElf_Lib = ^TGElf_Lib;
  TGElf_Lib = TElf64_Lib;

  //function GELF_ST_BIND(val : longint) : longint;
  //
  //{ was #define dname(params) para_def_expr }
  //{ argument types are unknown }
  //{ return type might be wrong }
  //function GELF_ST_TYPE(val : longint) : longint;
  //
  //{ was #define dname(params) para_def_expr }
  //{ argument types are unknown }
  //{ return type might be wrong }
  //function GELF_ST_INFO(bind,_type : longint) : longint;
  //
  //{ How to extract information held in the st_other field.   }
  //{ was #define dname(params) para_def_expr }
  //{ argument types are unknown }
  //{ return type might be wrong }
  //function GELF_ST_VISIBILITY(val : longint) : longint;
  //
  //{ How to extract and insert information held in the r_info field.   }
  //{ was #define dname(params) para_def_expr }
  //{ argument types are unknown }
  //{ return type might be wrong }
  //function GELF_R_SYM(info : longint) : longint;
  //
  //{ was #define dname(params) para_def_expr }
  //{ argument types are unknown }
  //{ return type might be wrong }
  //function GELF_R_TYPE(info : longint) : longint;
  //
  //{ was #define dname(params) para_def_expr }
  //{ argument types are unknown }
  //{ return type might be wrong }
  //function GELF_R_INFO(sym,_type : longint) : longint;
  //
  //{ How to extract and insert information held in the m_info field.   }
  //{ was #define dname(params) para_def_expr }
  //{ argument types are unknown }
  //{ return type might be wrong }
  //function GELF_M_SYM(info : longint) : longint;
  //
  //{ was #define dname(params) para_def_expr }
  //{ argument types are unknown }
  //{ return type might be wrong }
  //function GELF_M_SIZE(info : longint) : longint;
  //
  //{ was #define dname(params) para_def_expr }
  //{ argument types are unknown }
  //{ return type might be wrong }
  //function GELF_M_INFO(sym,size : longint) : longint;

function gelf_getclass(__elf: PElf): longint; cdecl; external libelf64;
function gelf_fsize(__elf: PElf; __type: TElf_Type; __count: Tsize_t; __version: dword): Tsize_t; cdecl; external libelf64;
function gelf_getehdr(__elf: PElf; __dest: PGElf_Ehdr): PGElf_Ehdr; cdecl; external libelf64;
function gelf_update_ehdr(__elf: PElf; __src: PGElf_Ehdr): longint; cdecl; external libelf64;
function gelf_newehdr(__elf: PElf; __class: longint): pointer; cdecl; external libelf64;
function gelf_offscn(__elf: PElf; __offset: TGElf_Off): PElf_Scn; cdecl; external libelf64;
function gelf_getshdr(__scn: PElf_Scn; __dst: PGElf_Shdr): PGElf_Shdr; cdecl; external libelf64;
function gelf_update_shdr(__scn: PElf_Scn; __src: PGElf_Shdr): longint; cdecl; external libelf64;
function gelf_getphdr(__elf: PElf; __ndx: longint; __dst: PGElf_Phdr): PGElf_Phdr; cdecl; external libelf64;
function gelf_update_phdr(__elf: PElf; __ndx: longint; __src: PGElf_Phdr): longint; cdecl; external libelf64;
function gelf_newphdr(__elf: PElf; __phnum: Tsize_t): pointer; cdecl; external libelf64;
function gelf_getchdr(__scn: PElf_Scn; __dst: PGElf_Chdr): PGElf_Chdr; cdecl; external libelf64;
function gelf_xlatetom(__elf: PElf; __dest: PElf_Data; __src: PElf_Data; __encode: dword): PElf_Data; cdecl; external libelf64;
function gelf_xlatetof(__elf: PElf; __dest: PElf_Data; __src: PElf_Data; __encode: dword): PElf_Data; cdecl; external libelf64;
function gelf_getrel(__data: PElf_Data; __ndx: longint; __dst: PGElf_Rel): PGElf_Rel; cdecl; external libelf64;
function gelf_getrela(__data: PElf_Data; __ndx: longint; __dst: PGElf_Rela): PGElf_Rela; cdecl; external libelf64;
function gelf_update_rel(__dst: PElf_Data; __ndx: longint; __src: PGElf_Rel): longint; cdecl; external libelf64;
function gelf_update_rela(__dst: PElf_Data; __ndx: longint; __src: PGElf_Rela): longint; cdecl; external libelf64;
function gelf_getsym(__data: PElf_Data; __ndx: longint; __dst: PGElf_Sym): PGElf_Sym; cdecl; external libelf64;
function gelf_update_sym(__data: PElf_Data; __ndx: longint; __src: PGElf_Sym): longint; cdecl; external libelf64;
function gelf_getsymshndx(__symdata: PElf_Data; __shndxdata: PElf_Data; __ndx: longint; __sym: PGElf_Sym; __xshndx: PElf32_Word): PGElf_Sym; cdecl; external libelf64;
function gelf_update_symshndx(__symdata: PElf_Data; __shndxdata: PElf_Data; __ndx: longint; __sym: PGElf_Sym; __xshndx: TElf32_Word): longint; cdecl; external libelf64;
function gelf_getsyminfo(__data: PElf_Data; __ndx: longint; __dst: PGElf_Syminfo): PGElf_Syminfo; cdecl; external libelf64;
function gelf_update_syminfo(__data: PElf_Data; __ndx: longint; __src: PGElf_Syminfo): longint; cdecl; external libelf64;
function gelf_getdyn(__data: PElf_Data; __ndx: longint; __dst: PGElf_Dyn): PGElf_Dyn; cdecl; external libelf64;
function gelf_update_dyn(__dst: PElf_Data; __ndx: longint; __src: PGElf_Dyn): longint; cdecl; external libelf64;
function gelf_getmove(__data: PElf_Data; __ndx: longint; __dst: PGElf_Move): PGElf_Move; cdecl; external libelf64;
function gelf_update_move(__data: PElf_Data; __ndx: longint; __src: PGElf_Move): longint; cdecl; external libelf64;
function gelf_getlib(__data: PElf_Data; __ndx: longint; __dst: PGElf_Lib): PGElf_Lib; cdecl; external libelf64;
function gelf_update_lib(__data: PElf_Data; __ndx: longint; __src: PGElf_Lib): longint; cdecl; external libelf64;
function gelf_getversym(__data: PElf_Data; __ndx: longint; __dst: PGElf_Versym): PGElf_Versym; cdecl; external libelf64;
function gelf_update_versym(__data: PElf_Data; __ndx: longint; __src: PGElf_Versym): longint; cdecl; external libelf64;
function gelf_getverneed(__data: PElf_Data; __offset: longint; __dst: PGElf_Verneed): PGElf_Verneed; cdecl; external libelf64;
function gelf_update_verneed(__data: PElf_Data; __offset: longint; __src: PGElf_Verneed): longint; cdecl; external libelf64;
function gelf_getvernaux(__data: PElf_Data; __offset: longint; __dst: PGElf_Vernaux): PGElf_Vernaux; cdecl; external libelf64;
function gelf_update_vernaux(__data: PElf_Data; __offset: longint; __src: PGElf_Vernaux): longint; cdecl; external libelf64;
function gelf_getverdef(__data: PElf_Data; __offset: longint; __dst: PGElf_Verdef): PGElf_Verdef; cdecl; external libelf64;
function gelf_update_verdef(__data: PElf_Data; __offset: longint; __src: PGElf_Verdef): longint; cdecl; external libelf64;
function gelf_getverdaux(__data: PElf_Data; __offset: longint; __dst: PGElf_Verdaux): PGElf_Verdaux; cdecl; external libelf64;
function gelf_update_verdaux(__data: PElf_Data; __offset: longint; __src: PGElf_Verdaux): longint; cdecl; external libelf64;
function gelf_getauxv(__data: PElf_Data; __ndx: longint; __dst: PGElf_auxv_t): PGElf_auxv_t; cdecl; external libelf64;
function gelf_update_auxv(__data: PElf_Data; __ndx: longint; __src: PGElf_auxv_t): longint; cdecl; external libelf64;
function gelf_getnote(__data: PElf_Data; __offset: Tsize_t; __result: PGElf_Nhdr; __name_offset: Psize_t; __desc_offset: Psize_t): Tsize_t; cdecl; external libelf64;
function gelf_checksum(__elf: PElf): longint; cdecl; external libelf64;

// === Konventiert am: 8-9-25 19:14:53 ===


implementation


//{ was #define dname(params) para_def_expr }
//{ argument types are unknown }
//{ return type might be wrong }   
//function GELF_ST_BIND(val : longint) : longint;
//begin
//  GELF_ST_BIND:=ELF64_ST_BIND(val);
//end;
//
//{ was #define dname(params) para_def_expr }
//{ argument types are unknown }
//{ return type might be wrong }   
//function GELF_ST_TYPE(val : longint) : longint;
//begin
//  GELF_ST_TYPE:=ELF64_ST_TYPE(val);
//end;
//
//{ was #define dname(params) para_def_expr }
//{ argument types are unknown }
//{ return type might be wrong }   
//function GELF_ST_INFO(bind,_type : longint) : longint;
//begin
//  GELF_ST_INFO:=ELF64_ST_INFO(bind,_type);
//end;
//
//{ was #define dname(params) para_def_expr }
//{ argument types are unknown }
//{ return type might be wrong }   
//function GELF_ST_VISIBILITY(val : longint) : longint;
//begin
//  GELF_ST_VISIBILITY:=ELF64_ST_VISIBILITY(val);
//end;
//
//{ was #define dname(params) para_def_expr }
//{ argument types are unknown }
//{ return type might be wrong }   
//function GELF_R_SYM(info : longint) : longint;
//begin
//  GELF_R_SYM:=ELF64_R_SYM(info);
//end;
//
//{ was #define dname(params) para_def_expr }
//{ argument types are unknown }
//{ return type might be wrong }   
//function GELF_R_TYPE(info : longint) : longint;
//begin
//  GELF_R_TYPE:=ELF64_R_TYPE(info);
//end;
//
//{ was #define dname(params) para_def_expr }
//{ argument types are unknown }
//{ return type might be wrong }   
//function GELF_R_INFO(sym,_type : longint) : longint;
//begin
//  GELF_R_INFO:=ELF64_R_INFO(sym,_type);
//end;
//
//{ was #define dname(params) para_def_expr }
//{ argument types are unknown }
//{ return type might be wrong }   
//function GELF_M_SYM(info : longint) : longint;
//begin
//  GELF_M_SYM:=ELF64_M_SYM(info);
//end;
//
//{ was #define dname(params) para_def_expr }
//{ argument types are unknown }
//{ return type might be wrong }   
//function GELF_M_SIZE(info : longint) : longint;
//begin
//  GELF_M_SIZE:=ELF64_M_SIZE(info);
//end;
//
//{ was #define dname(params) para_def_expr }
//{ argument types are unknown }
//{ return type might be wrong }   
//function GELF_M_INFO(sym,size : longint) : longint;
//begin
//  GELF_M_INFO:=ELF64_M_INFO(sym,size);
//end;


end.
