
unit efl_canvas_vg_object_eo_legacy;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_canvas_vg_object_eo_legacy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_canvas_vg_object_eo_legacy.h
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
PEvas_Object  = ^Evas_Object;
PEvas_Object_Vg_Fill_Mode  = ^Evas_Object_Vg_Fill_Mode;
PEvas_Vg_Node  = ^Evas_Vg_Node;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EVAS_OBJECT_VG_EO_LEGACY_H_}
{$define _EVAS_OBJECT_VG_EO_LEGACY_H_}
{$ifndef _EVAS_OBJECT_VG_EO_LEGACY_TYPES}
{$define _EVAS_OBJECT_VG_EO_LEGACY_TYPES}
{*
 * @brief Enumeration that defines how viewbox will be filled int the vg canvs's
 * viewport. default Fill_Mode is @c none
 *
 * @since 1.24
 * @ingroup Evas_Object_Vg_Group
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
  PEvas_Object_Vg_Fill_Mode = ^TEvas_Object_Vg_Fill_Mode;
  TEvas_Object_Vg_Fill_Mode =  Longint;
  Const
    EVAS_OBJECT_VG_FILL_MODE_NONE = 0;
    EVAS_OBJECT_VG_FILL_MODE_STRETCH = 1;
    EVAS_OBJECT_VG_FILL_MODE_MEET = 2;
    EVAS_OBJECT_VG_FILL_MODE_SLICE = 3;
;
{$endif}
{*
 * @brief Control how the viewbox is mapped to the vg canvas's viewport.
 *
 * @param[in] obj The object.
 * @param[in] fill_mode Fill mode type
 *
 * @since 1.24
 * @ingroup Evas_Object_Vg_Group
  }

procedure evas_object_vg_fill_mode_set(obj:PEvas_Object; fill_mode:TEvas_Object_Vg_Fill_Mode);cdecl;external;
{*
 * @brief Control how the viewbox is mapped to the vg canvas's viewport.
 *
 * @param[in] obj The object.
 *
 * @return Fill mode type
 *
 * @since 1.24
 * @ingroup Evas_Object_Vg_Group
  }
(* Const before type ignored *)
function evas_object_vg_fill_mode_get(obj:PEvas_Object):TEvas_Object_Vg_Fill_Mode;cdecl;external;
{*
 * @brief Sets the viewbox for the evas vg canvas. viewbox if set should be
 * mapped to the canvas geometry when rendering the vg tree.
 *
 * @param[in] obj The object.
 * @param[in] viewbox viewbox for the vg canvas
 *
 * @since 1.24
 * @ingroup Evas_Object_Vg_Group
  }
procedure evas_object_vg_viewbox_set(obj:PEvas_Object; viewbox:TEina_Rect);cdecl;external;
{*
 * @brief Get the current viewbox from the  evas_object_vg
 *
 * @param[in] obj The object.
 *
 * @return viewbox for the vg canvas
 *
 * @since 1.24
 * @ingroup Evas_Object_Vg_Group
  }
(* Const before type ignored *)
function evas_object_vg_viewbox_get(obj:PEvas_Object):TEina_Rect;cdecl;external;
{*
 * @brief Control how the viewbox is positioned inside the viewport.
 *
 * @param[in] obj The object.
 * @param[in] align_x Alignment in the horizontal axis (0 <= align_x <= 1).
 * @param[in] align_y Alignment in the vertical axis (0 <= align_y <= 1).
 *
 * @since 1.24
 * @ingroup Evas_Object_Vg_Group
  }
procedure evas_object_vg_viewbox_align_set(obj:PEvas_Object; align_x:Tdouble; align_y:Tdouble);cdecl;external;
{*
 * @brief Control how the viewbox is positioned inside the viewport.
 *
 * @param[in] obj The object.
 * @param[out] align_x Alignment in the horizontal axis (0 <= align_x <= 1).
 * @param[out] align_y Alignment in the vertical axis (0 <= align_y <= 1).
 *
 * @since 1.24
 * @ingroup Evas_Object_Vg_Group
  }
(* Const before type ignored *)
procedure evas_object_vg_viewbox_align_get(obj:PEvas_Object; align_x:Pdouble; align_y:Pdouble);cdecl;external;
{*
 * @brief Set the root node of the evas_object_vg.
 *
 * @note To manually create the shape object and show in the Vg object canvas
 * you must create the hierarchy and set as root node.
 *
 * It takes the ownership of the root node.
 *
 * @param[in] obj The object.
 * @param[in] root Root node(Evas_Vg_Container) of the VG canvas.
 *
 * @since 1.24
 * @ingroup Evas_Object_Vg_Group
  }
procedure evas_object_vg_root_node_set(obj:PEvas_Object; root:PEvas_Vg_Node);cdecl;external;
{*
 * @brief Get the root node of the evas_object_vg.
 *
 * @param[in] obj The object.
 *
 * @return Root node of the VG canvas.
 *
 * @since 1.14
 *
 * @ingroup Evas_Object_Vg_Group
  }
(* Const before type ignored *)
function evas_object_vg_root_node_get(obj:PEvas_Object):PEvas_Vg_Node;cdecl;external;
{$endif}

implementation


end.
