
unit efl_ui_video_eo_legacy;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_video_eo_legacy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_video_eo_legacy.h
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
PEfl_Ui_Video  = ^Efl_Ui_Video;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_UI_VIDEO_EO_LEGACY_H_}
{$define _EFL_UI_VIDEO_EO_LEGACY_H_}
{$ifndef _EFL_UI_VIDEO_EO_CLASS_TYPE}
{$define _EFL_UI_VIDEO_EO_CLASS_TYPE}
type
  PEfl_Ui_Video = ^TEfl_Ui_Video;
  TEfl_Ui_Video = TEo;
{$endif}
{$ifndef _EFL_UI_VIDEO_EO_TYPES}
{$define _EFL_UI_VIDEO_EO_TYPES}
{$endif}
{*
 * @brief Set whether the object can remember the last played position.
 *
 * @note This API only serves as indication. System support is required.
 *
 * @param[in] obj The object.
 * @param[in] remember @c true when the object can remember the last position,
 * @c false otherwise
 *
 * @ingroup Elm_Video_Group
  }

procedure elm_video_remember_position_set(obj:PEfl_Ui_Video; remember:TEina_Bool);cdecl;external;
{*
 * @brief Set whether the object can remember the last played position.
 *
 * @note This API only serves as indication. System support is required.
 *
 * @param[in] obj The object.
 *
 * @return @c true when the object can remember the last position, @c false
 * otherwise
 *
 * @ingroup Elm_Video_Group
  }
(* Const before type ignored *)
function elm_video_remember_position_get(obj:PEfl_Ui_Video):TEina_Bool;cdecl;external;
{*
 * @brief Get the underlying Emotion object.
 *
 * @param[in] obj The object.
 *
 * @return The underlying Emotion object.
 *
 * @ingroup Elm_Video_Group
  }
(* Const before type ignored *)
function elm_video_emotion_get(obj:PEfl_Ui_Video):PEfl_Canvas_Object;cdecl;external;
{*
 * @brief Get the title (for instance DVD title) from this emotion object.
 *
 * This function is only useful when playing a DVD.
 *
 * @note Don't change or free the string returned by this function.
 *
 * @param[in] obj The object.
 *
 * @return A string containing the title.
 *
 * @ingroup Elm_Video_Group
  }
(* Const before type ignored *)
(* Const before type ignored *)
function elm_video_title_get(obj:PEfl_Ui_Video):Pchar;cdecl;external;
{$endif}

implementation


end.
