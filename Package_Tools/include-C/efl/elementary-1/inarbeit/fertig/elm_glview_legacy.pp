
unit elm_glview_legacy;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_glview_legacy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_glview_legacy.h
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
Plongint  = ^longint;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*
 * Add a new glview to the parent
 *
 * @param parent The parent object
 * @return The new object or NULL if it cannot be created
 *
 * @ingroup Elm_Glview_Group
  }

function elm_glview_add(parent:PEvas_Object):PEvas_Object;cdecl;external;
{*
 * Adds a new GLView to the parent, given an OpenGL-ES context version number.
 *
 * @param[in] parent The parent object
 * @param[in] version Requested GL ES version number (default is 2.x, 1.x may also be supported)
 * @return The new object or @c NULL if it cannot be created
 *
 * @since 1.12
  }
function elm_glview_version_add(parent:PEvas_Object; version:TEvas_GL_Context_Version):PEvas_Object;cdecl;external;
{*
 * Notifies that there has been changes in the GLView.
 *
 * @param obj The GLView object
 *
 * @ingroup Elm_Glview_Group
  }
procedure elm_glview_changed_set(obj:PEvas_Object);cdecl;external;
{*
 * Gets the size of the GLView.
 *
 * @param obj The GLView object
 * @param w pointer of int width
 * @param h pointer of int height
 *
 * @ingroup Elm_Glview_Group
  }
(* Const before type ignored *)
procedure elm_glview_size_get(obj:PEvas_Object; w:Plongint; h:Plongint);cdecl;external;
{*
 * Sets the size of the GLView.
 *
 * @param obj The GLView object
 * @param w width of GLView
 * @param h height of GLView
 *
 * @ingroup Elm_Glview_Group
  }
procedure elm_glview_size_set(obj:PEvas_Object; w:longint; h:longint);cdecl;external;
{*
 * Set the init function that runs once in the main loop.
 * @param obj The GLView object
 * @param func The callback function
 *
 * @ingroup GLView
  }
procedure elm_glview_init_func_set(obj:PEvas_Object; func:TElm_GLView_Func_Cb);cdecl;external;
{*
 * Set the delete function that runs in the main loop.
 *
 * @param obj The GLView object
 * @param func The callback function
 *
 * @ingroup Elm_Glview_Group
  }
procedure elm_glview_del_func_set(obj:PEvas_Object; func:TElm_GLView_Func_Cb);cdecl;external;
{*
 * Set the resize function that gets called when resize happens.
 *
 * @param obj The GLView object
 * @param func The callback function
 *
 * @ingroup Elm_Glview_Group
  }
procedure elm_glview_resize_func_set(obj:PEvas_Object; func:TElm_GLView_Func_Cb);cdecl;external;
{*
 * Set the render function that runs in the main loop.
 *
 * @param obj The GLView object
 * @param func The callback function
 *
 * @ingroup Elm_Glview_Group
  }
procedure elm_glview_render_func_set(obj:PEvas_Object; func:TElm_GLView_Func_Cb);cdecl;external;
{$include "elm_glview_eo.legacy.h"}

implementation


end.
