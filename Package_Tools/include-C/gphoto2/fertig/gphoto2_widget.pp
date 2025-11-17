
unit gphoto2_widget;
interface

{
  Automatically converted by H2Pas 1.0.0 from gphoto2_widget.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gphoto2_widget.h
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
PCamera  = ^Camera;
PCameraWidget  = ^CameraWidget;
PCameraWidgetType  = ^CameraWidgetType;
Pchar  = ^char;
PGPContext  = ^GPContext;
Plongint  = ^longint;
Psingle  = ^single;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{* \file
 *
 * \author Copyright 2000 Scott Fritzinger
 *
 * \note
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * \note
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * \note
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
 * Boston, MA  02110-1301  USA
  }
{$ifndef LIBGPHOTO2_GPHOTO2_WIDGET_H}
{$define LIBGPHOTO2_GPHOTO2_WIDGET_H}
{$include <gphoto2/gphoto2-context.h>}
{ C++ extern C conditionnal removed }
{ __cplusplus  }
{* \brief internal structure please use the accessors.  }
type
{ C++ end of extern C conditionnal removed }
{ __cplusplus  }
{$include <gphoto2/gphoto2-camera.h>}
{ C++ extern C conditionnal removed }
{ __cplusplus  }
{*
 * \brief Type of the widget to be created.
 *
 * The actual widget type we want to create. The type of the value
 * it supports depends on this type.
  }
{ Value (get/set):	 }
{*< \brief Window widget
				 *   This is the toplevel configuration widget. It should likely contain multiple #GP_WIDGET_SECTION entries.
				  }
{*< \brief Section widget (think Tab)  }
{*< \brief Text widget.  }{ char *		 }
{*< \brief Slider widget.  }{ float		 }
{*< \brief Toggle widget (think check box)  }{ int			 }
{*< \brief Radio button widget.  }{ char *		 }
{*< \brief Menu widget (same as RADIO).  }{ char *		 }
{*< \brief Button press widget.  }{ CameraWidgetCallback  }
{*< \brief Date entering widget.  }{ int			 }
type
  PCameraWidgetType = ^TCameraWidgetType;
  TCameraWidgetType =  Longint;
  Const
    GP_WIDGET_WINDOW = 0;
    GP_WIDGET_SECTION = 1;
    GP_WIDGET_TEXT = 2;
    GP_WIDGET_RANGE = 3;
    GP_WIDGET_TOGGLE = 4;
    GP_WIDGET_RADIO = 5;
    GP_WIDGET_MENU = 6;
    GP_WIDGET_BUTTON = 7;
    GP_WIDGET_DATE = 8;
;
{*
 * \brief Callback handler for Button widgets.
  }
type

  TCameraWidgetCallback = function (para1:PCamera; para2:PCameraWidget; para3:PGPContext):longint;cdecl;
(* Const before type ignored *)

function gp_widget_new(_type:TCameraWidgetType; _label:Pchar; widget:PPCameraWidget):longint;cdecl;external;
function gp_widget_free(widget:PCameraWidget):longint;cdecl;external;
function gp_widget_ref(widget:PCameraWidget):longint;cdecl;external;
function gp_widget_unref(widget:PCameraWidget):longint;cdecl;external;
function gp_widget_append(widget:PCameraWidget; child:PCameraWidget):longint;cdecl;external;
function gp_widget_prepend(widget:PCameraWidget; child:PCameraWidget):longint;cdecl;external;
function gp_widget_count_children(widget:PCameraWidget):longint;cdecl;external;
function gp_widget_get_child(widget:PCameraWidget; child_number:longint; child:PPCameraWidget):longint;cdecl;external;
{ Retrieve Widgets  }
(* Const before type ignored *)
function gp_widget_get_child_by_label(widget:PCameraWidget; _label:Pchar; child:PPCameraWidget):longint;cdecl;external;
function gp_widget_get_child_by_id(widget:PCameraWidget; id:longint; child:PPCameraWidget):longint;cdecl;external;
(* Const before type ignored *)
function gp_widget_get_child_by_name(widget:PCameraWidget; name:Pchar; child:PPCameraWidget):longint;cdecl;external;
function gp_widget_get_root(widget:PCameraWidget; root:PPCameraWidget):longint;cdecl;external;
function gp_widget_get_parent(widget:PCameraWidget; parent:PPCameraWidget):longint;cdecl;external;
(* Const before type ignored *)
function gp_widget_set_value(widget:PCameraWidget; value:pointer):longint;cdecl;external;
function gp_widget_get_value(widget:PCameraWidget; value:pointer):longint;cdecl;external;
(* Const before type ignored *)
function gp_widget_set_name(widget:PCameraWidget; name:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function gp_widget_get_name(widget:PCameraWidget; name:PPchar):longint;cdecl;external;
(* Const before type ignored *)
function gp_widget_set_info(widget:PCameraWidget; info:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function gp_widget_get_info(widget:PCameraWidget; info:PPchar):longint;cdecl;external;
function gp_widget_get_id(widget:PCameraWidget; id:Plongint):longint;cdecl;external;
function gp_widget_get_type(widget:PCameraWidget; _type:PCameraWidgetType):longint;cdecl;external;
(* Const before type ignored *)
function gp_widget_get_label(widget:PCameraWidget; _label:PPchar):longint;cdecl;external;
function gp_widget_set_range(range:PCameraWidget; low:single; high:single; increment:single):longint;cdecl;external;
function gp_widget_get_range(range:PCameraWidget; min:Psingle; max:Psingle; increment:Psingle):longint;cdecl;external;
(* Const before type ignored *)
function gp_widget_add_choice(widget:PCameraWidget; choice:Pchar):longint;cdecl;external;
function gp_widget_count_choices(widget:PCameraWidget):longint;cdecl;external;
(* Const before type ignored *)
function gp_widget_get_choice(widget:PCameraWidget; choice_number:longint; choice:PPchar):longint;cdecl;external;
function gp_widget_changed(widget:PCameraWidget):longint;cdecl;external;
function gp_widget_set_changed(widget:PCameraWidget; changed:longint):longint;cdecl;external;
function gp_widget_set_readonly(widget:PCameraWidget; readonly:longint):longint;cdecl;external;
function gp_widget_get_readonly(widget:PCameraWidget; readonly:Plongint):longint;cdecl;external;
{ C++ end of extern C conditionnal removed }
{ __cplusplus  }
{$endif}
{ !defined(LIBGPHOTO2_GPHOTO2_WIDGET_H)  }

implementation


end.
