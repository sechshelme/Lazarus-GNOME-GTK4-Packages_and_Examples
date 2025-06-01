
unit elm_layout_common;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_layout_common.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_layout_common.h
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


{*
 * @addtogroup Elm_Layout
 *
 * @
  }
{*
 * @def elm_layout_icon_set
 * Convenience macro to set the icon object in a layout that follows the
 * Elementary naming convention for its parts.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function elm_layout_icon_get(_ly : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function elm_layout_end_get(_ly : longint) : longint;

{*
 * @
  }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function elm_layout_icon_get(_ly : longint) : longint;
begin
  elm_layout_icon_get:=elm_layout_content_get(_ly,'elm.swallow.icon');
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function elm_layout_end_get(_ly : longint) : longint;
begin
  elm_layout_end_get:=elm_layout_content_get(_ly,'elm.swallow.end');
end;


end.
