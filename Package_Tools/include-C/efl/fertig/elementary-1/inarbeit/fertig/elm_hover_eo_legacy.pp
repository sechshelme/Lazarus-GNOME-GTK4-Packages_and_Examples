
unit elm_hover_eo_legacy;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_hover_eo_legacy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_hover_eo_legacy.h
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
Pchar  = ^char;
PEfl_Canvas_Object  = ^Efl_Canvas_Object;
PElm_Hover  = ^Elm_Hover;
PElm_Hover_Axis  = ^Elm_Hover_Axis;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _ELM_HOVER_EO_LEGACY_H_}
{$define _ELM_HOVER_EO_LEGACY_H_}
{$ifndef _ELM_HOVER_EO_CLASS_TYPE}
{$define _ELM_HOVER_EO_CLASS_TYPE}
type
  PElm_Hover = ^TElm_Hover;
  TElm_Hover = TEo;
{$endif}
{$ifndef _ELM_HOVER_EO_TYPES}
{$define _ELM_HOVER_EO_TYPES}
{* The orientation axis for the hover object
 *
 * @ingroup Elm_Hover
  }
{*< ELM_HOVER_AXIS_NONE -- no preferred orientation.
                             }
{*< ELM_HOVER_AXIS_HORIZONTAL -- horizontal.  }
{*< ELM_HOVER_AXIS_VERTICAL -- vertical.  }
{*< ELM_HOVER_AXIS_BOTH -- both.  }
type
  PElm_Hover_Axis = ^TElm_Hover_Axis;
  TElm_Hover_Axis =  Longint;
  Const
    ELM_HOVER_AXIS_NONE = 0;
    ELM_HOVER_AXIS_HORIZONTAL = 1;
    ELM_HOVER_AXIS_VERTICAL = 2;
    ELM_HOVER_AXIS_BOTH = 3;
;
{$endif}
{*
 * @brief Sets the target object for the hover.
 *
 * This function will cause the hover to be centered on the target object.
 *
 * @param[in] obj The object.
 * @param[in] target The target object.
 *
 * @ingroup Elm_Hover_Group
  }

procedure elm_hover_target_set(obj:PElm_Hover; target:PEfl_Canvas_Object);cdecl;external;
{*
 * @brief Get the target object for the hover.
 *
 * @param[in] obj The object.
 *
 * @return The target object.
 *
 * @ingroup Elm_Hover_Group
  }
(* Const before type ignored *)
function elm_hover_target_get(obj:PElm_Hover):PEfl_Canvas_Object;cdecl;external;
{*
 * @brief Returns the best swallow location for content in the hover.
 *
 * Best is defined here as the location at which there is the most available
 * space.
 *
 * @c pref_axis may be either #ELM_HOVER_AXIS_NONE (for no preferred
 * orientation), #ELM_HOVER_AXIS_HORIZONTAL, #ELM_HOVER_AXIS_VERTICAL or
 * #ELM_HOVER_AXIS_BOTH.
 *
 * If #ELM_HOVER_AXIS_HORIZONTAL is chosen the returned position will
 * necessarily be along the horizontal axis("left" or "right"). If
 * #ELM_HOVER_AXIS_VERTICAL is chosen the returned position will necessarily be
 * along the vertical axis("top" or "bottom"). Choosing #ELM_HOVER_AXIS_BOTH or
 * #ELM_HOVER_AXIS_NONE has the same effect and the returned position may be in
 * either axis.
 *
 * See also @ref elm_object_part_content_set.
 *
 * @param[in] obj The object.
 * @param[in] pref_axis The preferred orientation axis for the hover object to
 * use
 *
 * @return Swallow location
 *
 * @ingroup Elm_Hover_Group
  }
(* Const before type ignored *)
(* Const before type ignored *)
function elm_hover_best_content_location_get(obj:PElm_Hover; pref_axis:TElm_Hover_Axis):Pchar;cdecl;external;
{* Dismiss a hover object
 *
 * @ingroup Elm_Hover_Group
  }
procedure elm_hover_dismiss(obj:PElm_Hover);cdecl;external;
{$endif}

implementation


end.
