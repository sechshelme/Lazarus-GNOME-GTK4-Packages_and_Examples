
unit sokol_fontstash;
interface

{
  Automatically converted by H2Pas 1.0.0 from sokol_fontstash.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    sokol_fontstash.h
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
PFONScontext  = ^FONScontext;
Psfons_allocator_t  = ^sfons_allocator_t;
Psfons_desc_t  = ^sfons_desc_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


type
  Psfons_allocator_t = ^Tsfons_allocator_t;
  Tsfons_allocator_t = record
      alloc_fn : function (size:Tsize_t; user_data:pointer):pointer;cdecl;
      free_fn : procedure (ptr:pointer; user_data:pointer);cdecl;
      user_data : pointer;
    end;
{ initial width of font atlas texture (default: 512, must be power of 2) }
{ initial height of font atlas texture (default: 512, must be power of 2) }
{ optional memory allocation overrides }

  Psfons_desc_t = ^Tsfons_desc_t;
  Tsfons_desc_t = record
      width : longint;
      height : longint;
      allocator : Tsfons_allocator_t;
    end;
(* Const before type ignored *)

function sfons_create(desc:Psfons_desc_t):PFONScontext;cdecl;external;
procedure sfons_destroy(ctx:PFONScontext);cdecl;external;
procedure sfons_flush(ctx:PFONScontext);cdecl;external;
function sfons_rgba(r:Tuint8_t; g:Tuint8_t; b:Tuint8_t; a:Tuint8_t):Tuint32_t;cdecl;external;
{$endif}
{ SOKOL_FONTSTASH_INCLUDED  }

implementation


end.
