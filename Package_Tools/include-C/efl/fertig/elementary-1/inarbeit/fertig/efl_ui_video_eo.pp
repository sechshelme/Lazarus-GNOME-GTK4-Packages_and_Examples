
unit efl_ui_video_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_video_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_video_eo.h
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
PEfl_Class  = ^Efl_Class;
PEfl_Ui_Video  = ^Efl_Ui_Video;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_UI_VIDEO_EO_H_}
{$define _EFL_UI_VIDEO_EO_H_}
{$ifndef _EFL_UI_VIDEO_EO_CLASS_TYPE}
{$define _EFL_UI_VIDEO_EO_CLASS_TYPE}
type
  PEfl_Ui_Video = ^TEfl_Ui_Video;
  TEfl_Ui_Video = TEo;
{$endif}
{$ifndef _EFL_UI_VIDEO_EO_TYPES}
{$define _EFL_UI_VIDEO_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{* Efl UI video class
 *
 * @ingroup Efl_Ui_Video
  }

{ was #define dname def_expr }
function EFL_UI_VIDEO_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_ui_video_class_get:PEfl_Class;cdecl;external;
{*
 * @brief Whether the object can remember the last played position.
 *
 * @note This API only serves as indication. System support is required.
 *
 * @param[in] obj The object.
 * @param[in] remember @c true when the object can remember the last position,
 * @c false otherwise
 *
 * @ingroup Efl_Ui_Video
  }
procedure efl_ui_video_remember_position_set(obj:PEo; remember:TEina_Bool);cdecl;external;
{*
 * @brief Whether the object can remember the last played position.
 *
 * @note This API only serves as indication. System support is required.
 *
 * @param[in] obj The object.
 *
 * @return @c true when the object can remember the last position, @c false
 * otherwise
 *
 * @ingroup Efl_Ui_Video
  }
(* Const before type ignored *)
function efl_ui_video_remember_position_get(obj:PEo):TEina_Bool;cdecl;external;
{*
 * @brief The underlying Emotion object.
 *
 * @param[in] obj The object.
 *
 * @return The underlying Emotion object.
 *
 * @ingroup Efl_Ui_Video
  }
(* Const before type ignored *)
function efl_ui_video_emotion_get(obj:PEo):PEfl_Canvas_Object;cdecl;external;
{*
 * @brief The title (for instance DVD title) from this emotion object.
 *
 * This function is only useful when playing a DVD.
 *
 * @note Don't change or free the string returned by this function.
 *
 * @param[in] obj The object.
 *
 * @return A string containing the title.
 *
 * @ingroup Efl_Ui_Video
  }
(* Const before type ignored *)
(* Const before type ignored *)
function efl_ui_video_title_get(obj:PEo):Pchar;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_UI_VIDEO_CLASS : longint; { return type might be wrong }
  begin
    EFL_UI_VIDEO_CLASS:=efl_ui_video_class_get;
  end;


end.
