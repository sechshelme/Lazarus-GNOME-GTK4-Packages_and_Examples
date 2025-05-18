
unit efl_text_style_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_text_style_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_text_style_eo.h
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
Pbyte  = ^byte;
Pchar  = ^char;
PEfl_Class  = ^Efl_Class;
PEfl_Text_Style  = ^Efl_Text_Style;
PEfl_Text_Style_Background_Type  = ^Efl_Text_Style_Background_Type;
PEfl_Text_Style_Effect_Type  = ^Efl_Text_Style_Effect_Type;
PEfl_Text_Style_Shadow_Direction  = ^Efl_Text_Style_Shadow_Direction;
PEfl_Text_Style_Strikethrough_Type  = ^Efl_Text_Style_Strikethrough_Type;
PEfl_Text_Style_Underline_Type  = ^Efl_Text_Style_Underline_Type;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_TEXT_STYLE_EO_H_}
{$define _EFL_TEXT_STYLE_EO_H_}
{$ifndef _EFL_TEXT_STYLE_EO_CLASS_TYPE}
{$define _EFL_TEXT_STYLE_EO_CLASS_TYPE}
type
  PEfl_Text_Style = ^TEfl_Text_Style;
  TEfl_Text_Style = TEo;
{$endif}
{$ifndef _EFL_TEXT_STYLE_EO_TYPES}
{$define _EFL_TEXT_STYLE_EO_TYPES}
{* Type of background to use behind each line of text.
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Style_Background_Type
  }
{*< Do not use background.
                                            *
                                            * @since 1.24  }
{*< Use a solid-color rectangle as
                                              * background. Requires
                                              * @ref efl_text_background_color_get.
                                              *
                                              * @since 1.24  }
type
  PEfl_Text_Style_Background_Type = ^TEfl_Text_Style_Background_Type;
  TEfl_Text_Style_Background_Type =  Longint;
  Const
    EFL_TEXT_STYLE_BACKGROUND_TYPE_NONE = 0;
    EFL_TEXT_STYLE_BACKGROUND_TYPE_SOLID_COLOR = 1;
;
{* Whether to add a strike-through decoration to the displayed text or not.
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Style_Strikethrough_Type
  }
{*< Do not use strike-through.
                                               *
                                               * @since 1.24  }
{*< Strike-through with a single
                                            * line. Requires
                                            * @ref efl_text_strikethrough_color_get.
                                            *
                                            * @since 1.24  }
type
  PEfl_Text_Style_Strikethrough_Type = ^TEfl_Text_Style_Strikethrough_Type;
  TEfl_Text_Style_Strikethrough_Type =  Longint;
  Const
    EFL_TEXT_STYLE_STRIKETHROUGH_TYPE_NONE = 0;
    EFL_TEXT_STYLE_STRIKETHROUGH_TYPE_SINGLE = 1;
;
{* Effect to apply to the displayed text.
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Style_Effect_Type
  }
{*< No effect.
                                        *
                                        * @since 1.24  }
{*< Shadow effect. Uses
                                      * @ref efl_text_shadow_color_get and
                                      * @ref efl_text_shadow_direction_get.
                                      *
                                      * @since 1.24  }
{*< Far shadow effect. Uses
                                          * @ref efl_text_shadow_color_get and
                                          * @ref efl_text_shadow_direction_get.
                                          *
                                          * @since 1.24  }
{*< Soft shadow effect. Uses
                                           * @ref efl_text_shadow_color_get and
                                           * @ref efl_text_shadow_direction_get.
                                           *
                                           * @since 1.24  }
{*< Far and soft shadow effect.
                                               * Uses
                                               * @ref efl_text_shadow_color_get
                                               * and
                                               * @ref efl_text_shadow_direction_get.
                                               *
                                               * @since 1.24  }
{*< Glow effect. Uses
                                    * @ref efl_text_glow_color_get and
                                    * @ref efl_text_secondary_glow_color_get.
                                    *
                                    * @since 1.24  }
{*< Outline effect. Uses
                                       * @ref efl_text_outline_color_get.
                                       *
                                       * @since 1.24  }
{*< Soft outline effect. Uses
                                            * @ref efl_text_outline_color_get.
                                            *
                                            * @since 1.24  }
{*< Outline + shadow effect. Uses
                                              * @ref efl_text_shadow_color_get,
                                              * @ref efl_text_shadow_direction_get
                                              * and
                                              * @ref efl_text_outline_color_get.
                                              *
                                              * @since 1.24  }
{*< Outline + soft shadow
                                                  * effect. Uses
                                                  * @ref efl_text_shadow_color_get,
                                                  * @ref efl_text_shadow_direction_get
                                                  * and
                                                  * @ref efl_text_outline_color_get.
                                                  *
                                                  * @since 1.24  }
type
  PEfl_Text_Style_Effect_Type = ^TEfl_Text_Style_Effect_Type;
  TEfl_Text_Style_Effect_Type =  Longint;
  Const
    EFL_TEXT_STYLE_EFFECT_TYPE_NONE = 0;
    EFL_TEXT_STYLE_EFFECT_TYPE_SHADOW = 1;
    EFL_TEXT_STYLE_EFFECT_TYPE_FAR_SHADOW = 2;
    EFL_TEXT_STYLE_EFFECT_TYPE_SOFT_SHADOW = 3;
    EFL_TEXT_STYLE_EFFECT_TYPE_FAR_SOFT_SHADOW = 4;
    EFL_TEXT_STYLE_EFFECT_TYPE_GLOW = 5;
    EFL_TEXT_STYLE_EFFECT_TYPE_OUTLINE = 6;
    EFL_TEXT_STYLE_EFFECT_TYPE_SOFT_OUTLINE = 7;
    EFL_TEXT_STYLE_EFFECT_TYPE_OUTLINE_SHADOW = 8;
    EFL_TEXT_STYLE_EFFECT_TYPE_OUTLINE_SOFT_SHADOW = 9;
;
{* Direction of the shadow effect.
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Style_Shadow_Direction
  }
{*< Shadow towards bottom
                                                     * right.
                                                     *
                                                     * @since 1.24  }
{*< Shadow towards bottom.
                                           *
                                           * @since 1.24  }
{*< Shadow towards bottom left.
                                                *
                                                * @since 1.24  }
{*< Shadow towards left.
                                         *
                                         * @since 1.24  }
{*< Shadow towards top left.
                                             *
                                             * @since 1.24  }
{*< Shadow towards top.
                                        *
                                        * @since 1.24  }
{*< Shadow towards top right.
                                              *
                                              * @since 1.24  }
{*< Shadow towards right.
                                         *
                                         * @since 1.24  }
type
  PEfl_Text_Style_Shadow_Direction = ^TEfl_Text_Style_Shadow_Direction;
  TEfl_Text_Style_Shadow_Direction =  Longint;
  Const
    EFL_TEXT_STYLE_SHADOW_DIRECTION_BOTTOM_RIGHT = 0;
    EFL_TEXT_STYLE_SHADOW_DIRECTION_BOTTOM = 1;
    EFL_TEXT_STYLE_SHADOW_DIRECTION_BOTTOM_LEFT = 2;
    EFL_TEXT_STYLE_SHADOW_DIRECTION_LEFT = 3;
    EFL_TEXT_STYLE_SHADOW_DIRECTION_TOP_LEFT = 4;
    EFL_TEXT_STYLE_SHADOW_DIRECTION_TOP = 5;
    EFL_TEXT_STYLE_SHADOW_DIRECTION_TOP_RIGHT = 6;
    EFL_TEXT_STYLE_SHADOW_DIRECTION_RIGHT = 7;
;
{* Type of underline for the displayed text.
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Style_Underline_Type
  }
{*< Text without underline.
                                           *
                                           * @since 1.24  }
{*< Underlined with a single line.
                                         * Requires
                                         * @ref efl_text_underline_color_get.
                                         *
                                         * @since 1.24  }
{*< Underlined with a double line.
                                         * Requires
                                         * @ref efl_text_underline_color_get
                                         * and
                                         * @ref efl_text_secondary_underline_color_get.
                                         *
                                         * @since 1.24  }
{*< Underlined with a dashed line.
                                        * Requires
                                        * @ref efl_text_underline_dashed_color_get,
                                        * @ref efl_text_underline_dashed_width_get
                                        * and
                                        * @ref efl_text_underline_dashed_gap_get.
                                        *
                                        * @since 1.24  }
type
  PEfl_Text_Style_Underline_Type = ^TEfl_Text_Style_Underline_Type;
  TEfl_Text_Style_Underline_Type =  Longint;
  Const
    EFL_TEXT_STYLE_UNDERLINE_TYPE_NONE = 0;
    EFL_TEXT_STYLE_UNDERLINE_TYPE_SINGLE = 1;
    EFL_TEXT_STYLE_UNDERLINE_TYPE_DOUBLE = 2;
    EFL_TEXT_STYLE_UNDERLINE_TYPE_DASHED = 3;
;
{$endif}
{*
 * @brief Decorations to add to the text.
 *
 * Decorations include text color, glow, outline, underline, strike-through and
 * shadows.
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Style
  }

{ was #define dname def_expr }
function EFL_TEXT_STYLE_INTERFACE : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_text_style_interface_get:PEfl_Class;cdecl;external;
{*
 * @brief Color of text, excluding all other decorations. By default it is
 * invisible.
 *
 * @param[in] obj The object.
 * @param[in] r Red component.
 * @param[in] g Green component.
 * @param[in] b Blue component.
 * @param[in] a Alpha component.
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Style
  }
procedure efl_text_color_set(obj:PEo; r:byte; g:byte; b:byte; a:byte);cdecl;external;
{*
 * @brief Color of text, excluding all other decorations. By default it is
 * invisible.
 *
 * @param[in] obj The object.
 * @param[out] r Red component.
 * @param[out] g Green component.
 * @param[out] b Blue component.
 * @param[out] a Alpha component.
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Style
  }
(* Const before type ignored *)
procedure efl_text_color_get(obj:PEo; r:Pbyte; g:Pbyte; b:Pbyte; a:Pbyte);cdecl;external;
{*
 * @brief Type of background to use behind each line of text.
 *
 * @param[in] obj The object.
 * @param[in] type Background type.
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Style
  }
procedure efl_text_background_type_set(obj:PEo; _type:TEfl_Text_Style_Background_Type);cdecl;external;
{*
 * @brief Type of background to use behind each line of text.
 *
 * @param[in] obj The object.
 *
 * @return Background type.
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Style
  }
(* Const before type ignored *)
function efl_text_background_type_get(obj:PEo):TEfl_Text_Style_Background_Type;cdecl;external;
{*
 * @brief Color of the background behind each line of text. By default it is
 * invisible.
 *
 * @param[in] obj The object.
 * @param[in] r Red component.
 * @param[in] g Green component.
 * @param[in] b Blue component.
 * @param[in] a Alpha component.
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Style
  }
procedure efl_text_background_color_set(obj:PEo; r:byte; g:byte; b:byte; a:byte);cdecl;external;
{*
 * @brief Color of the background behind each line of text. By default it is
 * invisible.
 *
 * @param[in] obj The object.
 * @param[out] r Red component.
 * @param[out] g Green component.
 * @param[out] b Blue component.
 * @param[out] a Alpha component.
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Style
  }
(* Const before type ignored *)
procedure efl_text_background_color_get(obj:PEo; r:Pbyte; g:Pbyte; b:Pbyte; a:Pbyte);cdecl;external;
{*
 * @brief Type of underline to use for the text.
 *
 * @param[in] obj The object.
 * @param[in] type Underline type.
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Style
  }
procedure efl_text_underline_type_set(obj:PEo; _type:TEfl_Text_Style_Underline_Type);cdecl;external;
{*
 * @brief Type of underline to use for the text.
 *
 * @param[in] obj The object.
 *
 * @return Underline type.
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Style
  }
(* Const before type ignored *)
function efl_text_underline_type_get(obj:PEo):TEfl_Text_Style_Underline_Type;cdecl;external;
{*
 * @brief Color of the primary underline. By default it is invisible.
 *
 * @param[in] obj The object.
 * @param[in] r Red component.
 * @param[in] g Green component.
 * @param[in] b Blue component.
 * @param[in] a Alpha component.
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Style
  }
procedure efl_text_underline_color_set(obj:PEo; r:byte; g:byte; b:byte; a:byte);cdecl;external;
{*
 * @brief Color of the primary underline. By default it is invisible.
 *
 * @param[in] obj The object.
 * @param[out] r Red component.
 * @param[out] g Green component.
 * @param[out] b Blue component.
 * @param[out] a Alpha component.
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Style
  }
(* Const before type ignored *)
procedure efl_text_underline_color_get(obj:PEo; r:Pbyte; g:Pbyte; b:Pbyte; a:Pbyte);cdecl;external;
{*
 * @brief Width (in pixels) of the single underline when
 * @ref efl_text_underline_type_get is
 * @ref EFL_TEXT_STYLE_UNDERLINE_TYPE_SINGLE.
 *
 * @param[in] obj The object.
 * @param[in] height Underline width in pixels.
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Style
  }
procedure efl_text_underline_height_set(obj:PEo; height:Tdouble);cdecl;external;
{*
 * @brief Width (in pixels) of the single underline when
 * @ref efl_text_underline_type_get is
 * @ref EFL_TEXT_STYLE_UNDERLINE_TYPE_SINGLE.
 *
 * @param[in] obj The object.
 *
 * @return Underline width in pixels.
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Style
  }
(* Const before type ignored *)
function efl_text_underline_height_get(obj:PEo):Tdouble;cdecl;external;
{*
 * @brief Color of the dashed underline. Only valid when
 * @ref efl_text_underline_type_get is
 * @ref EFL_TEXT_STYLE_UNDERLINE_TYPE_DASHED. By default it is invisible.
 *
 * @param[in] obj The object.
 * @param[in] r Red component.
 * @param[in] g Green component.
 * @param[in] b Blue component.
 * @param[in] a Alpha component.
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Style
  }
procedure efl_text_underline_dashed_color_set(obj:PEo; r:byte; g:byte; b:byte; a:byte);cdecl;external;
{*
 * @brief Color of the dashed underline. Only valid when
 * @ref efl_text_underline_type_get is
 * @ref EFL_TEXT_STYLE_UNDERLINE_TYPE_DASHED. By default it is invisible.
 *
 * @param[in] obj The object.
 * @param[out] r Red component.
 * @param[out] g Green component.
 * @param[out] b Blue component.
 * @param[out] a Alpha component.
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Style
  }
(* Const before type ignored *)
procedure efl_text_underline_dashed_color_get(obj:PEo; r:Pbyte; g:Pbyte; b:Pbyte; a:Pbyte);cdecl;external;
{*
 * @brief Length (in pixels) of the dashes when
 * @ref efl_text_underline_type_get is
 * @ref EFL_TEXT_STYLE_UNDERLINE_TYPE_DASHED.
 *
 * @param[in] obj The object.
 * @param[in] width Dash length in pixels.
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Style
  }
procedure efl_text_underline_dashed_width_set(obj:PEo; width:longint);cdecl;external;
{*
 * @brief Length (in pixels) of the dashes when
 * @ref efl_text_underline_type_get is
 * @ref EFL_TEXT_STYLE_UNDERLINE_TYPE_DASHED.
 *
 * @param[in] obj The object.
 *
 * @return Dash length in pixels.
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Style
  }
(* Const before type ignored *)
function efl_text_underline_dashed_width_get(obj:PEo):longint;cdecl;external;
{*
 * @brief Length (in pixels) of the gaps between the dashes when
 * @ref efl_text_underline_type_get is
 * @ref EFL_TEXT_STYLE_UNDERLINE_TYPE_DASHED.
 *
 * @param[in] obj The object.
 * @param[in] gap Gap length in pixels.
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Style
  }
procedure efl_text_underline_dashed_gap_set(obj:PEo; gap:longint);cdecl;external;
{*
 * @brief Length (in pixels) of the gaps between the dashes when
 * @ref efl_text_underline_type_get is
 * @ref EFL_TEXT_STYLE_UNDERLINE_TYPE_DASHED.
 *
 * @param[in] obj The object.
 *
 * @return Gap length in pixels.
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Style
  }
(* Const before type ignored *)
function efl_text_underline_dashed_gap_get(obj:PEo):longint;cdecl;external;
{*
 * @brief Color of the secondary underline. Only valid when
 * @ref efl_text_underline_type_get is
 * @ref EFL_TEXT_STYLE_UNDERLINE_TYPE_DOUBLE. By default it is invisible.
 *
 * @param[in] obj The object.
 * @param[in] r Red component.
 * @param[in] g Green component.
 * @param[in] b Blue component.
 * @param[in] a Alpha component.
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Style
  }
procedure efl_text_secondary_underline_color_set(obj:PEo; r:byte; g:byte; b:byte; a:byte);cdecl;external;
{*
 * @brief Color of the secondary underline. Only valid when
 * @ref efl_text_underline_type_get is
 * @ref EFL_TEXT_STYLE_UNDERLINE_TYPE_DOUBLE. By default it is invisible.
 *
 * @param[in] obj The object.
 * @param[out] r Red component.
 * @param[out] g Green component.
 * @param[out] b Blue component.
 * @param[out] a Alpha component.
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Style
  }
(* Const before type ignored *)
procedure efl_text_secondary_underline_color_get(obj:PEo; r:Pbyte; g:Pbyte; b:Pbyte; a:Pbyte);cdecl;external;
{*
 * @brief Enables crossed-out text.
 *
 * @param[in] obj The object.
 * @param[in] type Strike-through type.
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Style
  }
procedure efl_text_strikethrough_type_set(obj:PEo; _type:TEfl_Text_Style_Strikethrough_Type);cdecl;external;
{*
 * @brief Enables crossed-out text.
 *
 * @param[in] obj The object.
 *
 * @return Strike-through type.
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Style
  }
(* Const before type ignored *)
function efl_text_strikethrough_type_get(obj:PEo):TEfl_Text_Style_Strikethrough_Type;cdecl;external;
{*
 * @brief Color of the line striking through the text. By default it is
 * invisible.
 *
 * @param[in] obj The object.
 * @param[in] r Red component.
 * @param[in] g Green component.
 * @param[in] b Blue component.
 * @param[in] a Alpha component.
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Style
  }
procedure efl_text_strikethrough_color_set(obj:PEo; r:byte; g:byte; b:byte; a:byte);cdecl;external;
{*
 * @brief Color of the line striking through the text. By default it is
 * invisible.
 *
 * @param[in] obj The object.
 * @param[out] r Red component.
 * @param[out] g Green component.
 * @param[out] b Blue component.
 * @param[out] a Alpha component.
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Style
  }
(* Const before type ignored *)
procedure efl_text_strikethrough_color_get(obj:PEo; r:Pbyte; g:Pbyte; b:Pbyte; a:Pbyte);cdecl;external;
{*
 * @brief Controls a number of decorations around the text, like shadow,
 * outline and glow, including combinations of them.
 *
 * @param[in] obj The object.
 * @param[in] type Effect type.
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Style
  }
procedure efl_text_effect_type_set(obj:PEo; _type:TEfl_Text_Style_Effect_Type);cdecl;external;
{*
 * @brief Controls a number of decorations around the text, like shadow,
 * outline and glow, including combinations of them.
 *
 * @param[in] obj The object.
 *
 * @return Effect type.
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Style
  }
(* Const before type ignored *)
function efl_text_effect_type_get(obj:PEo):TEfl_Text_Style_Effect_Type;cdecl;external;
{*
 * @brief Color of the text outline. By default it is invisible.
 *
 * @param[in] obj The object.
 * @param[in] r Red component.
 * @param[in] g Green component.
 * @param[in] b Blue component.
 * @param[in] a Alpha component.
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Style
  }
procedure efl_text_outline_color_set(obj:PEo; r:byte; g:byte; b:byte; a:byte);cdecl;external;
{*
 * @brief Color of the text outline. By default it is invisible.
 *
 * @param[in] obj The object.
 * @param[out] r Red component.
 * @param[out] g Green component.
 * @param[out] b Blue component.
 * @param[out] a Alpha component.
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Style
  }
(* Const before type ignored *)
procedure efl_text_outline_color_get(obj:PEo; r:Pbyte; g:Pbyte; b:Pbyte; a:Pbyte);cdecl;external;
{*
 * @brief Direction of the shadow effect.
 *
 * @param[in] obj The object.
 * @param[in] type Shadow direction.
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Style
  }
procedure efl_text_shadow_direction_set(obj:PEo; _type:TEfl_Text_Style_Shadow_Direction);cdecl;external;
{*
 * @brief Direction of the shadow effect.
 *
 * @param[in] obj The object.
 *
 * @return Shadow direction.
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Style
  }
(* Const before type ignored *)
function efl_text_shadow_direction_get(obj:PEo):TEfl_Text_Style_Shadow_Direction;cdecl;external;
{*
 * @brief Color of the text shadow. By default it is invisible.
 *
 * @param[in] obj The object.
 * @param[in] r Red component.
 * @param[in] g Green component.
 * @param[in] b Blue component.
 * @param[in] a Alpha component.
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Style
  }
procedure efl_text_shadow_color_set(obj:PEo; r:byte; g:byte; b:byte; a:byte);cdecl;external;
{*
 * @brief Color of the text shadow. By default it is invisible.
 *
 * @param[in] obj The object.
 * @param[out] r Red component.
 * @param[out] g Green component.
 * @param[out] b Blue component.
 * @param[out] a Alpha component.
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Style
  }
(* Const before type ignored *)
procedure efl_text_shadow_color_get(obj:PEo; r:Pbyte; g:Pbyte; b:Pbyte; a:Pbyte);cdecl;external;
{*
 * @brief Color of the text glow. By default it is invisible.
 *
 * @param[in] obj The object.
 * @param[in] r Red component.
 * @param[in] g Green component.
 * @param[in] b Blue component.
 * @param[in] a Alpha component.
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Style
  }
procedure efl_text_glow_color_set(obj:PEo; r:byte; g:byte; b:byte; a:byte);cdecl;external;
{*
 * @brief Color of the text glow. By default it is invisible.
 *
 * @param[in] obj The object.
 * @param[out] r Red component.
 * @param[out] g Green component.
 * @param[out] b Blue component.
 * @param[out] a Alpha component.
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Style
  }
(* Const before type ignored *)
procedure efl_text_glow_color_get(obj:PEo; r:Pbyte; g:Pbyte; b:Pbyte; a:Pbyte);cdecl;external;
{*
 * @brief Color of the secondary glow decoration. This is the color of the
 * inner glow (where it touches the text) which gradually fades into
 * @ref efl_text_glow_color_get as it reaches the outer edge. By default it is
 * invisible.
 *
 * @param[in] obj The object.
 * @param[in] r Red component.
 * @param[in] g Green component.
 * @param[in] b Blue component.
 * @param[in] a Alpha component.
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Style
  }
procedure efl_text_secondary_glow_color_set(obj:PEo; r:byte; g:byte; b:byte; a:byte);cdecl;external;
{*
 * @brief Color of the secondary glow decoration. This is the color of the
 * inner glow (where it touches the text) which gradually fades into
 * @ref efl_text_glow_color_get as it reaches the outer edge. By default it is
 * invisible.
 *
 * @param[in] obj The object.
 * @param[out] r Red component.
 * @param[out] g Green component.
 * @param[out] b Blue component.
 * @param[out] a Alpha component.
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Style
  }
(* Const before type ignored *)
procedure efl_text_secondary_glow_color_get(obj:PEo; r:Pbyte; g:Pbyte; b:Pbyte; a:Pbyte);cdecl;external;
{*
 * @brief Program that applies a special filter
 *
 * See @ref Efl_Gfx_Filter.
 *
 * @param[in] obj The object.
 * @param[in] code Filter code.
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Style
  }
(* Const before type ignored *)
procedure efl_text_gfx_filter_set(obj:PEo; code:Pchar);cdecl;external;
{*
 * @brief Program that applies a special filter
 *
 * See @ref Efl_Gfx_Filter.
 *
 * @param[in] obj The object.
 *
 * @return Filter code.
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Style
  }
(* Const before type ignored *)
(* Const before type ignored *)
function efl_text_gfx_filter_get(obj:PEo):Pchar;cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function EFL_TEXT_STYLE_INTERFACE : longint; { return type might be wrong }
  begin
    EFL_TEXT_STYLE_INTERFACE:=efl_text_style_interface_get;
  end;


end.
