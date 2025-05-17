
unit efl_canvas_vg_object_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_canvas_vg_object_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_canvas_vg_object_eo.h
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
Pdouble  = ^double;
PEfl_Canvas_Vg_Fill_Mode  = ^Efl_Canvas_Vg_Fill_Mode;
PEfl_Canvas_Vg_Node  = ^Efl_Canvas_Vg_Node;
PEfl_Canvas_Vg_Object  = ^Efl_Canvas_Vg_Object;
PEfl_Class  = ^Efl_Class;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_CANVAS_VG_OBJECT_EO_H_}
{$define _EFL_CANVAS_VG_OBJECT_EO_H_}
{$ifndef _EFL_CANVAS_VG_OBJECT_EO_CLASS_TYPE}
{$define _EFL_CANVAS_VG_OBJECT_EO_CLASS_TYPE}
type
  PEfl_Canvas_Vg_Object = ^TEfl_Canvas_Vg_Object;
  TEfl_Canvas_Vg_Object = TEo;
{$endif}
{$ifndef _EFL_CANVAS_VG_OBJECT_EO_TYPES}
{$define _EFL_CANVAS_VG_OBJECT_EO_TYPES}
{$ifdef EFL_BETA_API_SUPPORT}
{* Enumeration that defines how viewbox will be filled int the vg canvs's
 * viewport. default Fill_Mode is @c none
 *
 * @ingroup Efl_Canvas_Vg_Fill_Mode
  }
{*< Don't scale the viewbox. Placed it
                                     * inside viewport taking align property
                                     * into account  }
{*< Scale the viewbox so that it matches the
                                    * canvas viewport. Aaspect ratio might be
                                    * changed.  }
{*< Scale the viewbox so that it fits inside
                                 * canvas viewport while maintaining the aspect
                                 * ratio. At least one of the dimensions of the
                                 * viewbox should be equal to the corresponding
                                 * dimension of the viewport.  }
{*< Scale the viewbox so that it covers the
                                 * entire canvas viewport while maintaining the
                                 * aspect ratio. At least one of the dimensions
                                 * of the viewbox should be equal to the
                                 * corresponding dimension of the viewport.  }
type
  PEfl_Canvas_Vg_Fill_Mode = ^TEfl_Canvas_Vg_Fill_Mode;
  TEfl_Canvas_Vg_Fill_Mode =  Longint;
  Const
    EFL_CANVAS_VG_FILL_MODE_NONE = 0;
    EFL_CANVAS_VG_FILL_MODE_STRETCH = 1;
    EFL_CANVAS_VG_FILL_MODE_MEET = 2;
    EFL_CANVAS_VG_FILL_MODE_SLICE = 3;
;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{* Efl vector graphics class
 *
 * @ingroup Efl_Canvas_Vg_Object
  }

{ was #define dname def_expr }
function EFL_CANVAS_VG_OBJECT_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_canvas_vg_object_class_get:PEfl_Class;cdecl;external;
{*
 * @brief Control how the viewbox is mapped to the vg canvas's viewport.
 *
 * @param[in] obj The object.
 * @param[in] fill_mode Fill mode type
 *
 * @ingroup Efl_Canvas_Vg_Object
  }
procedure efl_canvas_vg_object_fill_mode_set(obj:PEo; fill_mode:TEfl_Canvas_Vg_Fill_Mode);cdecl;external;
{*
 * @brief Control how the viewbox is mapped to the vg canvas's viewport.
 *
 * @param[in] obj The object.
 *
 * @return Fill mode type
 *
 * @ingroup Efl_Canvas_Vg_Object
  }
(* Const before type ignored *)
function efl_canvas_vg_object_fill_mode_get(obj:PEo):TEfl_Canvas_Vg_Fill_Mode;cdecl;external;
{*
 * @brief The viewbox for the evas vg canvas. viewbox if set should be mapped
 * to the canvas geometry when rendering the vg tree.
 *
 * @param[in] obj The object.
 * @param[in] viewbox viewbox for the vg canvas
 *
 * @ingroup Efl_Canvas_Vg_Object
  }
procedure efl_canvas_vg_object_viewbox_set(obj:PEo; viewbox:TEina_Rect);cdecl;external;
{*
 * @brief The viewbox for the evas vg canvas. viewbox if set should be mapped
 * to the canvas geometry when rendering the vg tree.
 *
 * @param[in] obj The object.
 *
 * @return viewbox for the vg canvas
 *
 * @ingroup Efl_Canvas_Vg_Object
  }
(* Const before type ignored *)
function efl_canvas_vg_object_viewbox_get(obj:PEo):TEina_Rect;cdecl;external;
{*
 * @brief Control how the viewbox is positioned inside the viewport.
 *
 * @param[in] obj The object.
 * @param[in] align_x Alignment in the horizontal axis (0 <= align_x <= 1).
 * @param[in] align_y Alignment in the vertical axis (0 <= align_y <= 1).
 *
 * @ingroup Efl_Canvas_Vg_Object
  }
procedure efl_canvas_vg_object_viewbox_align_set(obj:PEo; align_x:Tdouble; align_y:Tdouble);cdecl;external;
{*
 * @brief Control how the viewbox is positioned inside the viewport.
 *
 * @param[in] obj The object.
 * @param[out] align_x Alignment in the horizontal axis (0 <= align_x <= 1).
 * @param[out] align_y Alignment in the vertical axis (0 <= align_y <= 1).
 *
 * @ingroup Efl_Canvas_Vg_Object
  }
(* Const before type ignored *)
procedure efl_canvas_vg_object_viewbox_align_get(obj:PEo; align_x:Pdouble; align_y:Pdouble);cdecl;external;
{*
 * @brief The root node of the evas_object_vg.
 *
 * @note To manually create the shape object and show in the Vg object canvas
 * you must create the hierarchy and set as root node.
 *
 * It takes the ownership of the root node.
 *
 * @param[in] obj The object.
 * @param[in] root Root node of the VG canvas.
 *
 * @ingroup Efl_Canvas_Vg_Object
  }
procedure efl_canvas_vg_object_root_node_set(obj:PEo; root:PEfl_Canvas_Vg_Node);cdecl;external;
{*
 * @brief The root node of the evas_object_vg.
 *
 * @note To manually create the shape object and show in the Vg object canvas
 * you must create the hierarchy and set as root node.
 *
 * It takes the ownership of the root node.
 *
 * @param[in] obj The object.
 *
 * @return Root node of the VG canvas.
 *
 * @ingroup Efl_Canvas_Vg_Object
  }
(* Const before type ignored *)
function efl_canvas_vg_object_root_node_get(obj:PEo):PEfl_Canvas_Vg_Node;cdecl;external;
{* The default vector size that specified from vector resource.
 *
 * @since 1.22
 *
 * @ingroup Efl_Canvas_Vg_Object
  }
(* Const before type ignored *)
function efl_canvas_vg_object_default_size_get(obj:PEo):TEina_Size2D;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_CANVAS_VG_OBJECT_CLASS : longint; { return type might be wrong }
  begin
    EFL_CANVAS_VG_OBJECT_CLASS:=efl_canvas_vg_object_class_get;
  end;


end.
