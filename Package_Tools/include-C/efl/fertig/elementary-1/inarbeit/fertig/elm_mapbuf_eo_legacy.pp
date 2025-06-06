
unit elm_mapbuf_eo_legacy;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_mapbuf_eo_legacy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_mapbuf_eo_legacy.h
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
PElm_Mapbuf  = ^Elm_Mapbuf;
Plongint  = ^longint;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _ELM_MAPBUF_EO_LEGACY_H_}
{$define _ELM_MAPBUF_EO_LEGACY_H_}
{$ifndef _ELM_MAPBUF_EO_CLASS_TYPE}
{$define _ELM_MAPBUF_EO_CLASS_TYPE}
type
  PElm_Mapbuf = ^TElm_Mapbuf;
  TElm_Mapbuf = TEo;
{$endif}
{$ifndef _ELM_MAPBUF_EO_TYPES}
{$define _ELM_MAPBUF_EO_TYPES}
{$endif}
{*
 * @brief Set or unset auto flag for map rendering.
 *
 * When a ampbuf object has "auto mode" enabled, then it will enable and
 * disable map mode based on current visibility. Mapbuf will track if you show
 * or hide it AND if the object is inside the canvas viewport or not when it is
 * moved or resized. Note that if you turn automode off, then map mode will be
 * in a disabled state at this point. When you turn it on for the first time,
 * the current state will be evaluated base on current properties of the mapbuf
 * object.
 *
 * Auto mode is disabled by default.
 *
 * @param[in] obj The object.
 * @param[in] on The auto mode state.
 *
 * @ingroup Elm_Mapbuf_Group
  }

procedure elm_mapbuf_auto_set(obj:PElm_Mapbuf; on:TEina_Bool);cdecl;external;
{*
 * @brief Get a value whether auto mode is enabled or not.
 *
 * @param[in] obj The object.
 *
 * @return The auto mode state.
 *
 * @ingroup Elm_Mapbuf_Group
  }
(* Const before type ignored *)
function elm_mapbuf_auto_get(obj:PElm_Mapbuf):TEina_Bool;cdecl;external;
{*
 * @brief Enable or disable smooth map rendering.
 *
 * This sets smoothing for map rendering. If the object is a type that has its
 * own smoothing settings, then both the smooth settings for this object and
 * the map must be turned off.
 *
 * By default smooth maps are enabled.
 *
 * @param[in] obj The object.
 * @param[in] smooth The smooth mode state.
 *
 * @ingroup Elm_Mapbuf_Group
  }
procedure elm_mapbuf_smooth_set(obj:PElm_Mapbuf; smooth:TEina_Bool);cdecl;external;
{*
 * @brief Get a value whether smooth map rendering is enabled or not.
 *
 * @param[in] obj The object.
 *
 * @return The smooth mode state.
 *
 * @ingroup Elm_Mapbuf_Group
  }
(* Const before type ignored *)
function elm_mapbuf_smooth_get(obj:PElm_Mapbuf):TEina_Bool;cdecl;external;
{*
 * @brief Set or unset alpha flag for map rendering.
 *
 * This sets alpha flag for map rendering. If the object is a type that has its
 * own alpha settings, then this will take precedence. Only image objects have
 * this currently. It stops alpha blending of the map area, and is useful if
 * you know the object and/or all sub-objects is 100% solid.
 *
 * Alpha is enabled by default.
 *
 * @param[in] obj The object.
 * @param[in] alpha The alpha state.
 *
 * @ingroup Elm_Mapbuf_Group
  }
procedure elm_mapbuf_alpha_set(obj:PElm_Mapbuf; alpha:TEina_Bool);cdecl;external;
{*
 * @brief Get a value whether alpha blending is enabled or not.
 *
 * @param[in] obj The object.
 *
 * @return The alpha state.
 *
 * @ingroup Elm_Mapbuf_Group
  }
(* Const before type ignored *)
function elm_mapbuf_alpha_get(obj:PElm_Mapbuf):TEina_Bool;cdecl;external;
{*
 * @brief Enable or disable the map.
 *
 * This enables the map that is set or disables it. On enable, the object
 * geometry will be saved, and the new geometry will change (position and size)
 * to reflect the map geometry set.
 *
 * Also, when enabled, alpha and smooth states will be used, so if the content
 * isn't solid, alpha should be enabled, for example, otherwise a black
 * rectangle will fill the content.
 *
 * When disabled, the stored map will be freed and geometry prior to enabling
 * the map will be restored.
 *
 * It's disabled by default.
 *
 * @param[in] obj The object.
 * @param[in] enabled The enabled state.
 *
 * @ingroup Elm_Mapbuf_Group
  }
procedure elm_mapbuf_enabled_set(obj:PElm_Mapbuf; enabled:TEina_Bool);cdecl;external;
{*
 * @brief Get a value whether map is enabled or not.
 *
 * @param[in] obj The object.
 *
 * @return The enabled state.
 *
 * @ingroup Elm_Mapbuf_Group
  }
(* Const before type ignored *)
function elm_mapbuf_enabled_get(obj:PElm_Mapbuf):TEina_Bool;cdecl;external;
{*
 * @brief The color of a point (vertex) in the mapbuf.
 *
 * This represents the color of the vertex in the mapbuf. Colors will be
 * linearly interpolated between vertex points through the mapbuf. Color will
 * multiply the "texture" pixels (like GL_MODULATE in OpenGL). The default
 * color of a vertex in a mapbuf is white solid (255, 255, 255, 255) which
 * means it will have no effect on modifying the texture pixels.
 *
 * @param[in] obj The object.
 * @param[in] idx Index of point to change, from 0 to 3.
 * @param[in] r Red (0 - 255)
 * @param[in] g Green (0 - 255)
 * @param[in] b Blue (0 - 255)
 * @param[in] a Alpha (0 - 255)
 *
 * @since 1.9
 *
 * @ingroup Elm_Mapbuf_Group
  }
procedure elm_mapbuf_point_color_set(obj:PElm_Mapbuf; idx:longint; r:longint; g:longint; b:longint; 
            a:longint);cdecl;external;
{*
 * @brief The color of a point (vertex) in the mapbuf.
 *
 * This represents the color of the vertex in the mapbuf. Colors will be
 * linearly interpolated between vertex points through the mapbuf. Color will
 * multiply the "texture" pixels (like GL_MODULATE in OpenGL). The default
 * color of a vertex in a mapbuf is white solid (255, 255, 255, 255) which
 * means it will have no effect on modifying the texture pixels.
 *
 * @param[in] obj The object.
 * @param[in] idx Index of point to change, from 0 to 3.
 * @param[out] r Red (0 - 255)
 * @param[out] g Green (0 - 255)
 * @param[out] b Blue (0 - 255)
 * @param[out] a Alpha (0 - 255)
 *
 * @since 1.9
 *
 * @ingroup Elm_Mapbuf_Group
  }
(* Const before type ignored *)
procedure elm_mapbuf_point_color_get(obj:PElm_Mapbuf; idx:longint; r:Plongint; g:Plongint; b:Plongint; 
            a:Plongint);cdecl;external;
{$endif}

implementation


end.
