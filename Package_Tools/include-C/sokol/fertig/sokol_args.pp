
unit sokol_args;
interface

{
  Automatically converted by H2Pas 1.0.0 from sokol_args.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    sokol_args.h
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
Psargs_allocator  = ^sargs_allocator;
Psargs_desc  = ^sargs_desc;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


type
  Psargs_allocator = ^Tsargs_allocator;
  Tsargs_allocator = record
      alloc_fn : function (size:Tsize_t; user_data:pointer):pointer;cdecl;
      free_fn : procedure (ptr:pointer; user_data:pointer);cdecl;
      user_data : pointer;
    end;

  Psargs_desc = ^Tsargs_desc;
  Tsargs_desc = record
      argc : longint;
      argv : ^Pchar;
      max_args : longint;
      buf_size : longint;
      allocator : Tsargs_allocator;
    end;
{ setup sokol-args }
(* Const before type ignored *)

procedure sargs_setup(desc:Psargs_desc);cdecl;external;
{ shutdown sokol-args }
procedure sargs_shutdown;cdecl;external;
{ true between sargs_setup() and sargs_shutdown() }
function sargs_isvalid:Tbool;cdecl;external;
{ test if an argument exists by key name }
(* Const before type ignored *)
function sargs_exists(key:Pchar):Tbool;cdecl;external;
{ get value by key name, return empty string if key doesn't exist or an existing key has no value }
(* Const before type ignored *)
(* Const before type ignored *)
function sargs_value(key:Pchar):Pchar;cdecl;external;
{ get value by key name, return provided default if key doesn't exist or has no value }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function sargs_value_def(key:Pchar; def:Pchar):Pchar;cdecl;external;
{ return true if val arg matches the value associated with key }
(* Const before type ignored *)
(* Const before type ignored *)
function sargs_equals(key:Pchar; val:Pchar):Tbool;cdecl;external;
{ return true if key's value is "true", "yes", "on" or an existing key has no value }
(* Const before type ignored *)
function sargs_boolean(key:Pchar):Tbool;cdecl;external;
{ get index of arg by key name, return -1 if not exists }
(* Const before type ignored *)
function sargs_find(key:Pchar):longint;cdecl;external;
{ get number of parsed arguments }
function sargs_num_args:longint;cdecl;external;
{ get key name of argument at index, or empty string }
(* Const before type ignored *)
function sargs_key_at(index:longint):Pchar;cdecl;external;
{ get value string of argument at index, or empty string }
(* Const before type ignored *)
function sargs_value_at(index:longint):Pchar;cdecl;external;

implementation


end.
