
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
function PANGO_TYPE_CAIRO_FONT_MAP : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_CAIRO_FONT_MAP(object : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_IS_CAIRO_FONT_MAP(object : longint) : longint;


implementation

{ was #define dname def_expr }
function PANGO_TYPE_CAIRO_FONT_MAP : longint; { return type might be wrong }
  begin
    PANGO_TYPE_CAIRO_FONT_MAP:=pango_cairo_font_map_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_CAIRO_FONT_MAP(object : longint) : longint;
begin
  PANGO_CAIRO_FONT_MAP:=G_TYPE_CHECK_INSTANCE_CAST(object,PANGO_TYPE_CAIRO_FONT_MAP,PangoCairoFontMap);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_IS_CAIRO_FONT_MAP(object : longint) : longint;
begin
  PANGO_IS_CAIRO_FONT_MAP:=G_TYPE_CHECK_INSTANCE_TYPE(object,PANGO_TYPE_CAIRO_FONT_MAP);
end;


end.
