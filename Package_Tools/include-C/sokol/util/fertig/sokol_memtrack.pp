
unit sokol_memtrack;
interface

{
  Automatically converted by H2Pas 1.0.0 from sokol_memtrack.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    sokol_memtrack.h
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
Psmemtrack_info_t  = ^smemtrack_info_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


type
  Psmemtrack_info_t = ^Tsmemtrack_info_t;
  Tsmemtrack_info_t = record
      num_allocs : longint;
      num_bytes : longint;
    end;

function smemtrack_info:Tsmemtrack_info_t;cdecl;external;
function smemtrack_alloc(size:Tsize_t; user_data:pointer):pointer;cdecl;external;
procedure smemtrack_free(ptr:pointer; user_data:pointer);cdecl;external;

implementation


end.
