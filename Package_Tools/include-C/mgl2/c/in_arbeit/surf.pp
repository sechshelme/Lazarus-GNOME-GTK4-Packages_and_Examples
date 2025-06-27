
unit surf;
interface

{
  Automatically converted by H2Pas 1.0.0 from surf.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    surf.h
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
(* Const before type ignored *)

procedure mgl_fsurf(graph:THMGL; fz:Pchar; stl:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_fsurf_xyz(graph:THMGL; fx:Pchar; fy:Pchar; fz:Pchar; stl:Pchar; 
            opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_grid_xy(graph:THMGL; x:THCDT; y:THCDT; z:THCDT; stl:Pchar; 
            opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_grid(graph:THMGL; a:THCDT; stl:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_mesh_xy(graph:THMGL; x:THCDT; y:THCDT; z:THCDT; sch:Pchar; 
            opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_mesh(graph:THMGL; z:THCDT; sch:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_fall_xy(graph:THMGL; x:THCDT; y:THCDT; z:THCDT; sch:Pchar; 
            opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_fall(graph:THMGL; z:THCDT; sch:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_belt_xy(graph:THMGL; x:THCDT; y:THCDT; z:THCDT; sch:Pchar; 
            opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_belt(graph:THMGL; z:THCDT; sch:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_beltc_xy(graph:THMGL; x:THCDT; y:THCDT; z:THCDT; c:THCDT; 
            sch:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_beltc(graph:THMGL; z:THCDT; c:THCDT; sch:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_surf_xy(graph:THMGL; x:THCDT; y:THCDT; z:THCDT; sch:Pchar; 
            opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_surf(graph:THMGL; z:THCDT; sch:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_dens_xy(graph:THMGL; x:THCDT; y:THCDT; c:THCDT; sch:Pchar; 
            opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_dens(graph:THMGL; c:THCDT; sch:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_boxs_xy(graph:THMGL; x:THCDT; y:THCDT; z:THCDT; sch:Pchar; 
            opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_boxs(graph:THMGL; z:THCDT; sch:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_tile_xyc(graph:THMGL; x:THCDT; y:THCDT; z:THCDT; c:THCDT; 
            sch:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_tile_xy(graph:THMGL; x:THCDT; y:THCDT; z:THCDT; sch:Pchar; 
            opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_tile(graph:THMGL; z:THCDT; sch:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_tiles_xyc(graph:THMGL; x:THCDT; y:THCDT; z:THCDT; r:THCDT; 
            c:THCDT; sch:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_tiles_xy(graph:THMGL; x:THCDT; y:THCDT; z:THCDT; r:THCDT; 
            sch:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_tiles(graph:THMGL; z:THCDT; r:THCDT; sch:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_surfc_xy(graph:THMGL; x:THCDT; y:THCDT; z:THCDT; c:THCDT; 
            sch:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_surfc(graph:THMGL; z:THCDT; c:THCDT; sch:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_surfa_xy(graph:THMGL; x:THCDT; y:THCDT; z:THCDT; c:THCDT; 
            sch:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_surfa(graph:THMGL; z:THCDT; c:THCDT; sch:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_surfca_xy(gr:THMGL; x:THCDT; y:THCDT; z:THCDT; c:THCDT; 
            a:THCDT; sch:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_surfca(gr:THMGL; z:THCDT; c:THCDT; a:THCDT; sch:Pchar; 
            opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_stfa_xy(graph:THMGL; x:THCDT; y:THCDT; re:THCDT; im:THCDT; 
            dn:longint; sch:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_stfa(graph:THMGL; re:THCDT; im:THCDT; dn:longint; sch:Pchar; 
            opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_map_xy(graph:THMGL; x:THCDT; y:THCDT; a:THCDT; b:THCDT; 
            sch:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_map(graph:THMGL; a:THCDT; b:THCDT; sch:Pchar; opt:Pchar);cdecl;external;

implementation


end.
