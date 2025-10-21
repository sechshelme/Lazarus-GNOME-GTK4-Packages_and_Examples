unit fp_ffi;

interface

uses
  ctypes, ffitarget;

type
  Tsize_t=SizeUInt;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}

const
  FFI_TYPE_VOID_ = 0;  
  FFI_TYPE_INT_ = 1;  
  FFI_TYPE_FLOAT_ = 2;  
  FFI_TYPE_DOUBLE_ = 3;  
  FFI_TYPE_LONGDOUBLE_ = 4;  
  FFI_TYPE_UINT8_ = 5;  
  FFI_TYPE_SINT8_ = 6;  
  FFI_TYPE_UINT16_ = 7;  
  FFI_TYPE_SINT16_ = 8;  
  FFI_TYPE_UINT32_ = 9;  
  FFI_TYPE_SINT32_ = 10;  
  FFI_TYPE_UINT64_ = 11;  
  FFI_TYPE_SINT64_ = 12;  
  FFI_TYPE_STRUCT_ = 13;  
  FFI_TYPE_POINTER_ = 14;  
  FFI_TYPE_COMPLEX_ = 15;  
  FFI_TYPE_LAST_ = FFI_TYPE_COMPLEX_;

const
  FFI_64_BIT_MAX = 9223372036854775807;  


//const
//  FFI_LONG_LONG_MAX = LLONG_MAX;  

type
  Pffi_type = ^Tffi_type;
  Tffi_type = record
      size : Tsize_t;
      alignment : word;
      _type : word;
      elements : ^Pffi_type;
    end;

  Tffi_type_uchar = Tffi_type_uint8;
  Tffi_type_schar = Tffi_type_sint8;  

  Tffi_type_ushort = Tffi_type_uint32;
  Tffi_type_sshort = Tffi_type_sint32;  

  Tffi_type_uint = Tffi_type_uint64;
  Tffi_type_sint = Tffi_type_sint64;  

  Tffi_type_ulong = Tffi_type_uint64;
  Tffi_type_slong = Tffi_type_sint64;  

var
    ffi_type_void : Tffi_type;cvar;external libffi;
    ffi_type_uint8 : Tffi_type;cvar;external libffi;
    ffi_type_sint8 : Tffi_type;cvar;external libffi;
    ffi_type_uint16 : Tffi_type;cvar;external libffi;
    ffi_type_sint16 : Tffi_type;cvar;external libffi;
    ffi_type_uint32 : Tffi_type;cvar;external libffi;
    ffi_type_sint32 : Tffi_type;cvar;external libffi;
    ffi_type_uint64 : Tffi_type;cvar;external libffi;
    ffi_type_sint64 : Tffi_type;cvar;external libffi;
    ffi_type_float : Tffi_type;cvar;external libffi;
    ffi_type_double : Tffi_type;cvar;external libffi;
    ffi_type_pointer : Tffi_type;cvar;external libffi;
    ffi_type_longdouble : Tffi_type;cvar;external libffi;
{$ifdef FFI_TARGET_HAS_COMPLEX_TYPE}
    ffi_type_complex_float : Tffi_type;cvar;external libffi;
    ffi_type_complex_double : Tffi_type;cvar;external libffi;
    ffi_type_complex_longdouble : Tffi_type;cvar;external libffi;
{$endif}
{$endif}
{ LIBFFI_HIDE_BASIC_TYPES  }
type
  Pffi_status = ^Tffi_status;
  Tffi_status =  Longint;
  Const
    FFI_OK = 0;
    FFI_BAD_TYPEDEF = 1;
    FFI_BAD_ABI = 2;
    FFI_BAD_ARGTYPE = 3;
;
type
  Pffi_cif = ^Tffi_cif;
  Tffi_cif = record
      abi : Tffi_abi;
      nargs : dword;
      arg_types : ^Pffi_type;
      rtype : Pffi_type;
      bytes : dword;
      flags : dword;
    end;
{ ---- Definitions for the raw API --------------------------------------  }
{$ifndef FFI_SIZEOF_JAVA_RAW}

const
  FFI_SIZEOF_JAVA_RAW = FFI_SIZEOF_ARG;  
{$endif}
type
  Pffi_raw = ^Tffi_raw;
  Tffi_raw = record
      case longint of
        0 : ( sint : Tffi_sarg );
        1 : ( uint : Tffi_arg );
        2 : ( flt : single );
        3 : ( data : array[0..(FFI_SIZEOF_ARG)-1] of char );
        4 : ( ptr : pointer );
      end;
{$if FFI_SIZEOF_JAVA_RAW == 4 && FFI_SIZEOF_ARG == 8}
{ This is a special case for mips64/n32 ABI (and perhaps others) where
   sizeof(void *) is 4 and FFI_SIZEOF_ARG is 8.   }
type
  Pffi_java_raw = ^Tffi_java_raw;
  Tffi_java_raw = record
      case longint of
        0 : ( sint : longint );
        1 : ( uint : dword );
        2 : ( flt : single );
        3 : ( data : array[0..(FFI_SIZEOF_JAVA_RAW)-1] of char );
        4 : ( ptr : pointer );
      end;
{$else}
type
  Pffi_java_raw = ^Tffi_java_raw;
  Tffi_java_raw = Tffi_raw;
{$endif}

procedure ffi_raw_call(cif:Pffi_cif; fn:procedure ; rvalue:pointer; avalue:Pffi_raw);cdecl;external libffi;
procedure ffi_ptrarray_to_raw(cif:Pffi_cif; args:Ppointer; raw:Pffi_raw);cdecl;external libffi;
procedure ffi_raw_to_ptrarray(cif:Pffi_cif; raw:Pffi_raw; args:Ppointer);cdecl;external libffi;
function ffi_raw_size(cif:Pffi_cif):Tsize_t;cdecl;external libffi;
{ This is analogous to the raw API, except it uses Java parameter
   packing, even on 64-bit machines.  I.e. on 64-bit machines longs
   and doubles are followed by an empty 64-bit word.   }
{$if !FFI_NATIVE_RAW_API}

procedure ffi_java_raw_call(cif:Pffi_cif; fn:procedure ; rvalue:pointer; avalue:Pffi_java_raw);cdecl;external libffi;
{  __attribute__((deprecated)) }
{$endif}

procedure ffi_java_ptrarray_to_raw(cif:Pffi_cif; args:Ppointer; raw:Pffi_java_raw);cdecl;external libffi;
{ __attribute__((deprecated)); }
procedure ffi_java_raw_to_ptrarray(cif:Pffi_cif; raw:Pffi_java_raw; args:Ppointer);cdecl;external libffi;
{_attribute__((deprecated)); }
function ffi_java_raw_size(cif:Pffi_cif):Tsize_t;cdecl;external libffi;
{ __attribute__((deprecated)); }
{ ---- Definitions for closures -----------------------------------------  }
{$if FFI_CLOSURES}
{$ifdef __GNUC__}
{$endif}
type
  Pffi_closure = ^Tffi_closure;
  Tffi_closure = record
      xxxxxxx : record
          case longint of
            0 : ( tramp : array[0..(FFI_TRAMPOLINE_SIZE)-1] of char );
            1 : ( ftramp : pointer );
          end;
      cif : Pffi_cif;
      fun : procedure (para1:Pffi_cif; para2:pointer; para3:Ppointer; para4:pointer);cdecl;
      user_data : pointer;
    end;
{$ifndef __GNUC__}
{$ifdef __sgi}
(** unsupported pragma#pragma pack 0*)
{$endif}
{$endif}

function ffi_closure_alloc(size:Tsize_t; code:Ppointer):pointer;cdecl;external libffi;
procedure ffi_closure_free(para1:pointer);cdecl;external libffi;
function ffi_prep_closure(para1:Pffi_closure; para2:Pffi_cif; fun:procedure (para1:Pffi_cif; para2:pointer; para3:Ppointer; para4:pointer); user_data:pointer):Tffi_status;cdecl;external libffi;
{   __attribute__((deprecated)) }
function ffi_prep_closure_loc(para1:Pffi_closure; para2:Pffi_cif; fun:procedure (para1:Pffi_cif; para2:pointer; para3:Ppointer; para4:pointer); user_data:pointer; codeloc:pointer):Tffi_status;cdecl;external libffi;
{$ifdef __sgi}
(** unsupported pragma#pragma pack 8*)
{$endif}
{$if 0}
{$else}
{$endif}
{$if !FFI_NATIVE_RAW_API}
{ If this is enabled, then a raw closure has the same layout
     as a regular closure.  We use this to install an intermediate
     handler to do the translation, void** -> ffi_raw*.   }
{$endif}
type
  Pffi_raw_closure = ^Tffi_raw_closure;
  Tffi_raw_closure = record
      trampoline_table : pointer;
      trampoline_table_entry : pointer;
      tramp : array[0..(FFI_TRAMPOLINE_SIZE)-1] of char;
      cif : Pffi_cif;
      translate_args : procedure (para1:Pffi_cif; para2:pointer; para3:Ppointer; para4:pointer);cdecl;
      this_closure : pointer;
      fun : procedure (para1:Pffi_cif; para2:pointer; para3:Pffi_raw; para4:pointer);cdecl;
      user_data : pointer;
    end;
{$if 0}
{$else}
{$endif}
{$if !FFI_NATIVE_RAW_API}
{ If this is enabled, then a raw closure has the same layout
     as a regular closure.  We use this to install an intermediate
     handler to do the translation, void** -> ffi_raw*.   }
{$endif}
type
  Pffi_java_raw_closure = ^Tffi_java_raw_closure;
  Tffi_java_raw_closure = record
      trampoline_table : pointer;
      trampoline_table_entry : pointer;
      tramp : array[0..(FFI_TRAMPOLINE_SIZE)-1] of char;
      cif : Pffi_cif;
      translate_args : procedure (para1:Pffi_cif; para2:pointer; para3:Ppointer; para4:pointer);cdecl;
      this_closure : pointer;
      fun : procedure (para1:Pffi_cif; para2:pointer; para3:Pffi_java_raw; para4:pointer);cdecl;
      user_data : pointer;
    end;

function ffi_prep_raw_closure(para1:Pffi_raw_closure; cif:Pffi_cif; fun:procedure (para1:Pffi_cif; para2:pointer; para3:Pffi_raw; para4:pointer); user_data:pointer):Tffi_status;cdecl;external libffi;
function ffi_prep_raw_closure_loc(para1:Pffi_raw_closure; cif:Pffi_cif; fun:procedure (para1:Pffi_cif; para2:pointer; para3:Pffi_raw; para4:pointer); user_data:pointer; codeloc:pointer):Tffi_status;cdecl;external libffi;
{$if !FFI_NATIVE_RAW_API}

function ffi_prep_java_raw_closure(para1:Pffi_java_raw_closure; cif:Pffi_cif; fun:procedure (para1:Pffi_cif; para2:pointer; para3:Pffi_java_raw; para4:pointer); user_data:pointer):Tffi_status;cdecl;external libffi;
{ __attribute__((deprecated)); }
function ffi_prep_java_raw_closure_loc(para1:Pffi_java_raw_closure; cif:Pffi_cif; fun:procedure (para1:Pffi_cif; para2:pointer; para3:Pffi_java_raw; para4:pointer); user_data:pointer; codeloc:pointer):Tffi_status;cdecl;external libffi;
{ __attribute__((deprecated)); }
{$endif}
{$endif}
{ FFI_CLOSURES  }
{$ifdef FFI_GO_CLOSURES}
type
  Pffi_go_closure = ^Tffi_go_closure;
  Tffi_go_closure = record
      tramp : pointer;
      cif : Pffi_cif;
      fun : procedure (para1:Pffi_cif; para2:pointer; para3:Ppointer; para4:pointer);cdecl;
    end;

function ffi_prep_go_closure(para1:Pffi_go_closure; para2:Pffi_cif; fun:procedure (para1:Pffi_cif; para2:pointer; para3:Ppointer; para4:pointer)):Tffi_status;cdecl;external libffi;
procedure ffi_call_go(cif:Pffi_cif; fn:procedure ; rvalue:pointer; avalue:Ppointer; closure:pointer);cdecl;external libffi;
{$endif}
{ FFI_GO_CLOSURES  }
{ ---- Public interface definition --------------------------------------  }

function ffi_prep_cif(cif:Pffi_cif; abi:Tffi_abi; nargs:dword; rtype:Pffi_type; atypes:PPffi_type):Tffi_status;cdecl;external libffi;
function ffi_prep_cif_var(cif:Pffi_cif; abi:Tffi_abi; nfixedargs:dword; ntotalargs:dword; rtype:Pffi_type; 
           atypes:PPffi_type):Tffi_status;cdecl;external libffi;
procedure ffi_call(cif:Pffi_cif; fn:procedure ; rvalue:pointer; avalue:Ppointer);cdecl;external libffi;
function ffi_get_struct_offsets(abi:Tffi_abi; struct_type:Pffi_type; offsets:Psize_t):Tffi_status;cdecl;external libffi;
{ ---- Definitions shared with assembly code ----------------------------  }
{$endif}
{ C++ end of extern C conditionnal removed }
{$endif}

// === Konventiert am: 21-10-25 19:50:41 ===


implementation



end.
