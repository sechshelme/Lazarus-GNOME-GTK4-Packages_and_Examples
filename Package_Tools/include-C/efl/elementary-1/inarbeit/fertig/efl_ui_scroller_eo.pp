
unit efl_ui_scroller_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_scroller_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_scroller_eo.h
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
PEfl_Class  = ^Efl_Class;
PEfl_Ui_Scroller  = ^Efl_Ui_Scroller;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_UI_SCROLLER_EO_H_}
{$define _EFL_UI_SCROLLER_EO_H_}
{$ifndef _EFL_UI_SCROLLER_EO_CLASS_TYPE}
{$define _EFL_UI_SCROLLER_EO_CLASS_TYPE}
type
  PEfl_Ui_Scroller = ^TEfl_Ui_Scroller;
  TEfl_Ui_Scroller = TEo;
{$endif}
{$ifndef _EFL_UI_SCROLLER_EO_TYPES}
{$define _EFL_UI_SCROLLER_EO_TYPES}
{$endif}
{*
 * @brief Widget container that allows objects bigger than itself to be put
 * inside it, and provides scrolling functionality so the whole content is
 * visible.
 *
 * Some widgets have scrolling capabilities (like @ref Efl_Ui_List) that allow
 * big content to be shown inside a small viewport, using the well-known
 * scrollbar objects. Some other widgets (like @ref Efl_Ui_Box, for example)
 * cannot scroll by themselves and therefore would not be fully visible when
 * placed inside a viewport smaller than them.
 *
 * The @ref Efl_Ui_Scroller is a helper class that provides scrolling
 * capabilities for widgets which don't have them. In the above example, simply
 * putting the @ref Efl_Ui_Box inside a @ref Efl_Ui_Scroller (using
 * @ref efl_content_set) would give it the ability to scroll.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Scroller
  }

{ was #define dname def_expr }
function EFL_UI_SCROLLER_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_ui_scroller_class_get:PEfl_Class;cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function EFL_UI_SCROLLER_CLASS : longint; { return type might be wrong }
  begin
    EFL_UI_SCROLLER_CLASS:=efl_ui_scroller_class_get;
  end;


end.
