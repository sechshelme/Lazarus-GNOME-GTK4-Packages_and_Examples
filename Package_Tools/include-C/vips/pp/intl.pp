
unit intl;
interface

{
  Automatically converted by H2Pas 1.0.0 from intl.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    intl.h
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


{ i18n stuff for vips. Deprecated in favour of glib/gi18n.h.
  }
{$ifndef VIPS_INTL_H}
{$define VIPS_INTL_H}
{$ifdef ENABLE_NLS}
{$include <glib/gi18n.h>}
{$else}
{!ENABLE_NLS }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function _(_String : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function N_(_String : longint) : longint;

{$endif}
{ ENABLE_NLS  }
{$endif}
{ VIPS_INTL_H  }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function _(_String : longint) : longint;
begin
  _:=_String;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function N_(_String : longint) : longint;
begin
  N_:=_String;
end;


end.
