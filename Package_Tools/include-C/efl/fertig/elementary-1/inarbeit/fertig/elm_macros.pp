
unit elm_macros;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_macros.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_macros.h
}

    { Pointers to basic pascal types, inserted by h2pas conversion program.}
    Type
      PLongint  = ^Longint;
      PSmallInt = ^SmallInt;
      PByte     = ^Byte;
      PWord     = ^Word;
      PDWord    = ^DWord;
      PDouble   = ^Double;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ handy macros  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function ELM_RECTS_INTERSECT(x,y,w,h,xx,yy,ww,hh : longint) : longint;

const
  ELM_PI = 3.14159265358979323846;  
{ was #define dname(params) para_def_expr }
{ argument types are unknown }

function ELM_SCALE_SIZE(x : longint) : longint;

{ checks if the point(xx, yy) stays out of the rectangle(x, y, w, h) area. }
(* error 
#define ELM_RECTS_POINT_OUT(x, y, w, h, xx, yy) (((xx) < (x)) || ((yy) < (y)) || ((xx) > ((x) + (w))) || ((yy) > ((y) + (h))))
in define line 7 *)
    { check if the rect (x, y, w, h) includes whole body of rect (xx, yy, ww, hh) }
    { was #define dname(params) para_def_expr }
    { argument types are unknown }
    { return type might be wrong }   
    function ELM_RECTS_INCLUDE(x,y,w,h,xx,yy,ww,hh : longint) : longint;    

    { check if the rect (x,y,w,h) is either left of or stays out of body of rect(xx,yy,ww,hh) }
(* error 
#define ELM_RECTS_X_AXIS_OUT(x, y, w, h, xx, yy, ww, hh) (((x) < (xx)) || (((x) + (w)) > ((xx) + (ww))) || (((y) + (h)) > ((yy) + (hh))))
in define line 13 *)
    { check if the rect (x,y,w,h) is either top of or stays out of body of rect(xx,yy,ww,hh) }
(* error 
#define ELM_RECTS_Y_AXIS_OUT(x, y, w, h, xx, yy, ww, hh) (((y) < (yy)) || (((x) + (w)) > ((xx) + (ww))) || (((y) + (h)) > ((yy) + (hh))))
in define line 16 *)

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ELM_RECTS_INTERSECT(x,y,w,h,xx,yy,ww,hh : longint) : longint;
begin
  ELM_RECTS_INTERSECT:=(((x<(Txx(+(ww)))) and (@(y<(Tyy(+(hh)))))) and (@((Tx(+(w)))>xx))) and (@((Ty(+(h)))>yy));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function ELM_SCALE_SIZE(x : longint) : longint;
begin
  ELM_SCALE_SIZE:=longint((((Tdouble(x))*(elm_config_scale_get))/(elm_app_base_scale_get))+0.5);
end;

    { was #define dname(params) para_def_expr }
    { argument types are unknown }
    { return type might be wrong }   
    function ELM_RECTS_INCLUDE(x,y,w,h,xx,yy,ww,hh : longint) : longint;
    begin
      ELM_RECTS_INCLUDE:=(x<=xx) and (@((Tx(+(w)))>=(((xx+ww) and (@(y<=yy))) and (@((Ty(+(h)))>=(Tyy(+(hh))))))));
    end;


end.
