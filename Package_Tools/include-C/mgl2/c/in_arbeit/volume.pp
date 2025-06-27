
unit volume;
interface

{
  Automatically converted by H2Pas 1.0.0 from volume.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    volume.h
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
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


(* Const before type ignored *)
(* Const before type ignored *)

procedure mgl_surf3_xyz_val(graph:THMGL; Val:Tdouble; x:THCDT; y:THCDT; z:THCDT; 
            a:THCDT; stl:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_surf3_val(graph:THMGL; Val:Tdouble; a:THCDT; stl:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_surf3_xyz(graph:THMGL; x:THCDT; y:THCDT; z:THCDT; a:THCDT; 
            stl:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_surf3(graph:THMGL; a:THCDT; stl:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_surf3a_xyz_val(graph:THMGL; Val:Tdouble; x:THCDT; y:THCDT; z:THCDT; 
            a:THCDT; b:THCDT; stl:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_surf3a_val(graph:THMGL; Val:Tdouble; a:THCDT; b:THCDT; stl:Pchar; 
            opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_surf3a_xyz(graph:THMGL; x:THCDT; y:THCDT; z:THCDT; a:THCDT; 
            b:THCDT; stl:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_surf3a(graph:THMGL; a:THCDT; b:THCDT; stl:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_surf3c_xyz_val(graph:THMGL; Val:Tdouble; x:THCDT; y:THCDT; z:THCDT; 
            a:THCDT; b:THCDT; stl:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_surf3c_val(graph:THMGL; Val:Tdouble; a:THCDT; b:THCDT; stl:Pchar; 
            opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_surf3c_xyz(graph:THMGL; x:THCDT; y:THCDT; z:THCDT; a:THCDT; 
            b:THCDT; stl:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_surf3c(graph:THMGL; a:THCDT; b:THCDT; stl:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_surf3ca_xyz_val(graph:THMGL; Val:Tdouble; x:THCDT; y:THCDT; z:THCDT; 
            a:THCDT; c:THCDT; b:THCDT; stl:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_surf3ca_val(graph:THMGL; Val:Tdouble; a:THCDT; c:THCDT; b:THCDT; 
            stl:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_surf3ca_xyz(graph:THMGL; x:THCDT; y:THCDT; z:THCDT; a:THCDT; 
            c:THCDT; b:THCDT; stl:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_surf3ca(graph:THMGL; a:THCDT; c:THCDT; b:THCDT; stl:Pchar; 
            opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_cloud_xyz(graph:THMGL; x:THCDT; y:THCDT; z:THCDT; a:THCDT; 
            stl:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_cloud(graph:THMGL; a:THCDT; stl:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
procedure mgl_beam_val(graph:THMGL; Val:Tdouble; tr:THCDT; g1:THCDT; g2:THCDT; 
            a:THCDT; r:Tdouble; stl:Pchar; norm:longint);cdecl;external;
(* Const before type ignored *)
procedure mgl_beam(graph:THMGL; tr:THCDT; g1:THCDT; g2:THCDT; a:THCDT; 
            r:Tdouble; stl:Pchar; norm:longint; num:longint);cdecl;external;

implementation


end.
