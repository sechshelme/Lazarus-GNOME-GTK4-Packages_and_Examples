
unit 2;
interface

{
  Automatically converted by H2Pas 1.0.0 from 2.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    2.h
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



{ was #define dname def_expr }
function PANGO_TYPE_LAYOUT : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_LAYOUT(object : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_LAYOUT_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_IS_LAYOUT(object : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_IS_LAYOUT_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_LAYOUT_GET_CLASS(obj : longint) : longint;


implementation

{ was #define dname def_expr }
function PANGO_TYPE_LAYOUT : longint; { return type might be wrong }
  begin
    PANGO_TYPE_LAYOUT:=pango_layout_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_LAYOUT(object : longint) : longint;
begin
  PANGO_LAYOUT:=G_TYPE_CHECK_INSTANCE_CAST(object,PANGO_TYPE_LAYOUT,PangoLayout);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_LAYOUT_CLASS(klass : longint) : longint;
begin
  PANGO_LAYOUT_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,PANGO_TYPE_LAYOUT,PangoLayoutClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_IS_LAYOUT(object : longint) : longint;
begin
  PANGO_IS_LAYOUT:=G_TYPE_CHECK_INSTANCE_TYPE(object,PANGO_TYPE_LAYOUT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_IS_LAYOUT_CLASS(klass : longint) : longint;
begin
  PANGO_IS_LAYOUT_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,PANGO_TYPE_LAYOUT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_LAYOUT_GET_CLASS(obj : longint) : longint;
begin
  PANGO_LAYOUT_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,PANGO_TYPE_LAYOUT,PangoLayoutClass);
end;


end.
