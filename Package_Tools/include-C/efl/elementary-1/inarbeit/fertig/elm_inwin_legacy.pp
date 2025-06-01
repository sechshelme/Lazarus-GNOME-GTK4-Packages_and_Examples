
unit elm_inwin_legacy;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_inwin_legacy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_inwin_legacy.h
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
PEvas_Object  = ^Evas_Object;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*
 * Adds an inwin to the current window
 *
 * The @p obj used as parent @b MUST be an @ref Win "Elementary Window".
 * Never call this function with anything other than the top-most window
 * as its parameter, unless you are fond of undefined behavior.
 *
 * After creating the object, the widget will set itself as resize object
 * for the window with elm_win_resize_object_add(), so when shown it will
 * appear to cover almost the entire window (how much of it depends on its
 * content and the style used). It must not be added into other container
 * objects and it needs not be moved or resized manually.
 *
 * @param parent The parent object
 * @return The new object or NULL if it cannot be created
 *
 * @ingroup Elm_Inwin_Group
  }

function elm_win_inwin_add(parent:PEvas_Object):PEvas_Object;cdecl;external;
{*
 * Set the content of an inwin object.
 *
 * Once the content object is set, a previously set one will be deleted.
 * If you want to keep that old content object, use the
 * elm_win_inwin_content_unset() function.
 *
 * @param obj The inwin object
 * @param content The object to set as content
 *
 * @ingroup Elm_Inwin_Group
  }
procedure elm_win_inwin_content_set(obj:PEvas_Object; content:PEvas_Object);cdecl;external;
{*
 * Get the content of an inwin object.
 *
 * Return the content object for this widget.
 *
 * The returned object is valid as long as the inwin is still alive and no
 * other content is set on it. Deleting the object will notify the inwin
 * about it and this one will be left empty.
 *
 * If you need to remove an inwin's content to be reused somewhere else,
 * see elm_win_inwin_content_unset().
 *
 * @param obj The inwin object
 * @return The content that is being used
 *
 * @ingroup Elm_Inwin_Group
  }
(* Const before type ignored *)
function elm_win_inwin_content_get(obj:PEvas_Object):PEvas_Object;cdecl;external;
{*
 * Unset the content of an inwin object.
 *
 * Unparent and return the content object which was set for this widget.
 *
 * @param obj The inwin object
 * @return The content that was being used
 *
 * @ingroup Elm_Inwin_Group
  }
function elm_win_inwin_content_unset(obj:PEvas_Object):PEvas_Object;cdecl;external;
{$include "elm_inwin_eo.legacy.h"}

implementation


end.
