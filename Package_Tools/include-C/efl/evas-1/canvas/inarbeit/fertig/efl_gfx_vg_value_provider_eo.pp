
unit efl_gfx_vg_value_provider_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_gfx_vg_value_provider_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_gfx_vg_value_provider_eo.h
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
PEfl_Gfx_Vg_Value_Provider  = ^Efl_Gfx_Vg_Value_Provider;
PEfl_Gfx_Vg_Value_Provider_Flags  = ^Efl_Gfx_Vg_Value_Provider_Flags;
PEina_Matrix4  = ^Eina_Matrix4;
PEina_Stringshare  = ^Eina_Stringshare;
PEo  = ^Eo;
Plongint  = ^longint;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_GFX_VG_VALUE_PROVIDER_EO_H_}
{$define _EFL_GFX_VG_VALUE_PROVIDER_EO_H_}
{$ifndef _EFL_GFX_VG_VALUE_PROVIDER_EO_CLASS_TYPE}
{$define _EFL_GFX_VG_VALUE_PROVIDER_EO_CLASS_TYPE}
type
  PEfl_Gfx_Vg_Value_Provider = ^TEfl_Gfx_Vg_Value_Provider;
  TEfl_Gfx_Vg_Value_Provider = TEo;
{$endif}
{$ifndef _EFL_GFX_VG_VALUE_PROVIDER_EO_TYPES}
{$define _EFL_GFX_VG_VALUE_PROVIDER_EO_TYPES}
{$ifdef EFL_BETA_API_SUPPORT}
{* Property information applied to value provider.
 *
 * @since 1.24
 *
 * @ingroup Efl_Gfx_Vg_Value_Provider_Flags
  }
{*< Nothing changed.
                                             *
                                             * @since 1.24  }
{*< Fill color changed.
                                                   *
                                                   * @since 1.24  }
{*< Stroke color changed.
                                                     *
                                                     * @since 1.24  }
{*< Stroke width changed.
                                                     *
                                                     * @since 1.24  }
{*< Transform matrix
                                                        * changed.
                                                        *
                                                        * @since 1.24  }
type
  PEfl_Gfx_Vg_Value_Provider_Flags = ^TEfl_Gfx_Vg_Value_Provider_Flags;
  TEfl_Gfx_Vg_Value_Provider_Flags =  Longint;
  Const
    EFL_GFX_VG_VALUE_PROVIDER_FLAGS_NONE = 0;
    EFL_GFX_VG_VALUE_PROVIDER_FLAGS_FILL_COLOR = 1;
    EFL_GFX_VG_VALUE_PROVIDER_FLAGS_STROKE_COLOR = 2;
    EFL_GFX_VG_VALUE_PROVIDER_FLAGS_STROKE_WIDTH = 4;
    EFL_GFX_VG_VALUE_PROVIDER_FLAGS_TRANSFORM_MATRIX = 8;
;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief Efl Vector Value Provider class.
 *
 * This class is a set of that contain the value of several properties provided
 * by content. User can use this class to change the properties for the
 * specific content specified by the keypath.
 *
 * @ingroup Efl_Gfx_Vg_Value_Provider
  }

{ was #define dname def_expr }
function EFL_GFX_VG_VALUE_PROVIDER_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_gfx_vg_value_provider_class_get:PEfl_Class;cdecl;external;
{*
 * @brief Keypath is the target a specific content or a set of contents that
 * will be updated. It can include the specific name of the contents,
 * wildcard(*) or Globstar(**).
 *
 * @param[in] obj The object.
 * @param[in] keypath The keypath of contents
 *
 * @ingroup Efl_Gfx_Vg_Value_Provider
  }
procedure efl_gfx_vg_value_provider_keypath_set(obj:PEo; keypath:PEina_Stringshare);cdecl;external;
{*
 * @brief Keypath is the target a specific content or a set of contents that
 * will be updated. It can include the specific name of the contents,
 * wildcard(*) or Globstar(**).
 *
 * @param[in] obj The object.
 *
 * @return The keypath of contents
 *
 * @ingroup Efl_Gfx_Vg_Value_Provider
  }
(* Const before type ignored *)
function efl_gfx_vg_value_provider_keypath_get(obj:PEo):PEina_Stringshare;cdecl;external;
{*
 * @brief User can adjust transform value of the content specified by the
 * keypath.
 *
 * @param[in] obj The object.
 * @param[in] m Matrix Value.
 *
 * @ingroup Efl_Gfx_Vg_Value_Provider
  }
procedure efl_gfx_vg_value_provider_transform_set(obj:PEo; m:PEina_Matrix4);cdecl;external;
{*
 * @brief User can adjust transform value of the content specified by the
 * keypath.
 *
 * @param[in] obj The object.
 *
 * @return Matrix Value.
 *
 * @ingroup Efl_Gfx_Vg_Value_Provider
  }
(* Const before type ignored *)
function efl_gfx_vg_value_provider_transform_get(obj:PEo):PEina_Matrix4;cdecl;external;
{*
 * @brief User can adjust color value of the fill content specified by the
 * keypath.
 *
 * @param[in] obj The object.
 * @param[in] r Red color value of fill.
 * @param[in] g Green color value of fill.
 * @param[in] b Blue color value of fill.
 * @param[in] a Alpha value of fill.
 *
 * @ingroup Efl_Gfx_Vg_Value_Provider
  }
procedure efl_gfx_vg_value_provider_fill_color_set(obj:PEo; r:longint; g:longint; b:longint; a:longint);cdecl;external;
{*
 * @brief User can adjust color value of the fill content specified by the
 * keypath.
 *
 * @param[in] obj The object.
 * @param[out] r Red color value of fill.
 * @param[out] g Green color value of fill.
 * @param[out] b Blue color value of fill.
 * @param[out] a Alpha value of fill.
 *
 * @ingroup Efl_Gfx_Vg_Value_Provider
  }
(* Const before type ignored *)
procedure efl_gfx_vg_value_provider_fill_color_get(obj:PEo; r:Plongint; g:Plongint; b:Plongint; a:Plongint);cdecl;external;
{*
 * @brief User can adjust color value of the stroke content specified by the
 * keypath.
 *
 * @param[in] obj The object.
 * @param[in] r Red color value of stroke.
 * @param[in] g Green color value of stroke.
 * @param[in] b Blue color value of stroke.
 * @param[in] a Alpha value of stroke.
 *
 * @ingroup Efl_Gfx_Vg_Value_Provider
  }
procedure efl_gfx_vg_value_provider_stroke_color_set(obj:PEo; r:longint; g:longint; b:longint; a:longint);cdecl;external;
{*
 * @brief User can adjust color value of the stroke content specified by the
 * keypath.
 *
 * @param[in] obj The object.
 * @param[out] r Red color value of stroke.
 * @param[out] g Green color value of stroke.
 * @param[out] b Blue color value of stroke.
 * @param[out] a Alpha value of stroke.
 *
 * @ingroup Efl_Gfx_Vg_Value_Provider
  }
(* Const before type ignored *)
procedure efl_gfx_vg_value_provider_stroke_color_get(obj:PEo; r:Plongint; g:Plongint; b:Plongint; a:Plongint);cdecl;external;
{*
 * @brief User can adjust width value of the stroke content specified by the
 * keypath.
 *
 * @param[in] obj The object.
 * @param[in] width Width value of stroke.
 *
 * @ingroup Efl_Gfx_Vg_Value_Provider
  }
procedure efl_gfx_vg_value_provider_stroke_width_set(obj:PEo; width:Tdouble);cdecl;external;
{*
 * @brief User can adjust width value of the stroke content specified by the
 * keypath.
 *
 * @param[in] obj The object.
 *
 * @return Width value of stroke.
 *
 * @ingroup Efl_Gfx_Vg_Value_Provider
  }
(* Const before type ignored *)
function efl_gfx_vg_value_provider_stroke_width_get(obj:PEo):Tdouble;cdecl;external;
{*
 * @brief Flag of properties updated in value provider object.
 *
 * @param[in] obj The object.
 *
 * @return Flag of the changed property.
 *
 * @ingroup Efl_Gfx_Vg_Value_Provider
  }
(* Const before type ignored *)
function efl_gfx_vg_value_provider_updated_get(obj:PEo):TEfl_Gfx_Vg_Value_Provider_Flags;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_GFX_VG_VALUE_PROVIDER_CLASS : longint; { return type might be wrong }
  begin
    EFL_GFX_VG_VALUE_PROVIDER_CLASS:=efl_gfx_vg_value_provider_class_get;
  end;


end.
