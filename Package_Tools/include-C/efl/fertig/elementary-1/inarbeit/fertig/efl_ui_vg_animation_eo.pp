
unit efl_ui_vg_animation_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_vg_animation_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    efl_ui_vg_animation_eo.h
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
PEfl_Class  = ^Efl_Class;
PEfl_Gfx_Vg_Value_Provider  = ^Efl_Gfx_Vg_Value_Provider;
PEfl_Ui_Vg_Animation  = ^Efl_Ui_Vg_Animation;
PEfl_Ui_Vg_Animation_State  = ^Efl_Ui_Vg_Animation_State;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_UI_VG_ANIMATION_EO_H_}
{$define _EFL_UI_VG_ANIMATION_EO_H_}
{$ifndef _EFL_UI_VG_ANIMATION_EO_CLASS_TYPE}
{$define _EFL_UI_VG_ANIMATION_EO_CLASS_TYPE}
type
  PEfl_Ui_Vg_Animation = ^TEfl_Ui_Vg_Animation;
  TEfl_Ui_Vg_Animation = TEo;
{$endif}
{$ifndef _EFL_UI_VG_ANIMATION_EO_TYPES}
{$define _EFL_UI_VG_ANIMATION_EO_TYPES}
{* State of vg_animation
 *
 * @since 1.24
 *
 * @ingroup Efl_Ui_Vg_Animation_State
  }
{*< Animation is not ready to play.
                                            * (Probably, it didn't file set yet
                                            * or failed to read file.
                                            *
                                            * @since 1.24  }
{*< Animation is playing.
                                      *
                                      * @since 1.24  }
{*< Animation is playing
                                                * backwards (rewinding).
                                                *
                                                * @since 1.24  }
{*< Animation has been paused.
                                     *
                                     * @since 1.24  }
{*< Vg Animation successfully loaded a file
                                     * then readied for playing. Otherwise
                                     * after finished animation or stopped
                                     * forcibly by request.
                                     *
                                     * @since 1.24  }
type
  PEfl_Ui_Vg_Animation_State = ^TEfl_Ui_Vg_Animation_State;
  TEfl_Ui_Vg_Animation_State = (EFL_UI_VG_ANIMATION_STATE_NOT_READY := 0,
    EFL_UI_VG_ANIMATION_STATE_PLAYING,EFL_UI_VG_ANIMATION_STATE_PLAYING_BACKWARDS,
    EFL_UI_VG_ANIMATION_STATE_PAUSED,EFL_UI_VG_ANIMATION_STATE_STOPPED
    );
{$endif}
{*
 * @brief Elementary Vector Graphcis Animation class. Vg Animation is designed
 * to show and play animation of vector graphics based content. It hides all
 * @ref Efl_Canvas_Vg_Object details but just open an API to read vector data
 * from file. Also, it implements details of animation control methods of
 * Vector.
 *
 * Vector data could contain static or animatable vector elements including
 * animation information. Available vector data file formats are SVG, JSON and
 * EET. @ref Efl_Ui_Vg_Animation currently only supports the animation
 * information contained in JSON (known as Lottie file as well) and EET files.
 *
 * @since 1.24
 *
 * @ingroup Efl_Ui_Vg_Animation
  }

{ was #define dname def_expr }
function EFL_UI_VG_ANIMATION_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_ui_vg_animation_class_get:PEfl_Class;cdecl;external;
{*
 * @brief Number of current frame.
 *
 * Ranges from 0 to @ref efl_ui_vg_animation_frame_count_get - 1.
 *
 * @param[in] obj The object.
 * @param[in] frame_num Current frame number.
 *
 * @since 1.24
 *
 * @ingroup Efl_Ui_Vg_Animation
  }
procedure efl_ui_vg_animation_frame_set(obj:PEo; frame_num:longint);cdecl;external;
{*
 * @brief Number of current frame.
 *
 * Ranges from 0 to @ref efl_ui_vg_animation_frame_count_get - 1.
 *
 * @param[in] obj The object.
 *
 * @return Current frame number.
 *
 * @since 1.24
 *
 * @ingroup Efl_Ui_Vg_Animation
  }
(* Const before type ignored *)
function efl_ui_vg_animation_frame_get(obj:PEo):longint;cdecl;external;
{* The default view size that specified from vector resource.
 *
 * @since 1.24
 *
 * @ingroup Efl_Ui_Vg_Animation
  }
(* Const before type ignored *)
function efl_ui_vg_animation_default_view_size_get(obj:PEo):TEina_Size2D;cdecl;external;
{*
 * @brief Current vg animation state. See @ref Efl_Ui_Vg_Animation_State
 *
 * @param[in] obj The object.
 *
 * @return Current vg animation state
 *
 * @since 1.24
 *
 * @ingroup Efl_Ui_Vg_Animation
  }
(* Const before type ignored *)
function efl_ui_vg_animation_state_get(obj:PEo):TEfl_Ui_Vg_Animation_State;cdecl;external;
{*
 * @brief The index of end frame of the vg animation, if it's animated. Note :
 * frame number starts with 0.
 *
 * @param[in] obj The object.
 *
 * @return The number of frames. 0, if it's not animated.
 *
 * @since 1.24
 *
 * @ingroup Efl_Ui_Vg_Animation
  }
(* Const before type ignored *)
function efl_ui_vg_animation_frame_count_get(obj:PEo):longint;cdecl;external;
{*
 * @brief The start progress of the play.
 *
 * @param[in] obj The object.
 * @param[in] min_progress The minimum progress. Value must be 0 ~ 1.
 *
 * @since 1.24
 *
 * @ingroup Efl_Ui_Vg_Animation
  }
procedure efl_ui_vg_animation_min_progress_set(obj:PEo; min_progress:Tdouble);cdecl;external;
{*
 * @brief The start progress of the play.
 *
 * @param[in] obj The object.
 *
 * @return The minimum progress. Value must be 0 ~ 1.
 *
 * @since 1.24
 *
 * @ingroup Efl_Ui_Vg_Animation
  }
(* Const before type ignored *)
function efl_ui_vg_animation_min_progress_get(obj:PEo):Tdouble;cdecl;external;
{*
 * @brief The last progress of the play.
 *
 * @param[in] obj The object.
 * @param[in] max_progress The maximum progress. Value must be 0 ~ 1.
 *
 * @since 1.24
 *
 * @ingroup Efl_Ui_Vg_Animation
  }
procedure efl_ui_vg_animation_max_progress_set(obj:PEo; max_progress:Tdouble);cdecl;external;
{*
 * @brief The last progress of the play.
 *
 * @param[in] obj The object.
 *
 * @return The maximum progress. Value must be 0 ~ 1.
 *
 * @since 1.24
 *
 * @ingroup Efl_Ui_Vg_Animation
  }
(* Const before type ignored *)
function efl_ui_vg_animation_max_progress_get(obj:PEo):Tdouble;cdecl;external;
{*
 * @brief The start frame of the play.
 *
 * @param[in] obj The object.
 * @param[in] min_frame The minimum frame for play. Value must be 0 ~
 * @ref efl_ui_vg_animation_max_frame_get
 *
 * @since 1.24
 *
 * @ingroup Efl_Ui_Vg_Animation
  }
procedure efl_ui_vg_animation_min_frame_set(obj:PEo; min_frame:longint);cdecl;external;
{*
 * @brief The start frame of the play.
 *
 * @param[in] obj The object.
 *
 * @return The minimum frame for play. Value must be 0 ~
 * @ref efl_ui_vg_animation_max_frame_get
 *
 * @since 1.24
 *
 * @ingroup Efl_Ui_Vg_Animation
  }
(* Const before type ignored *)
function efl_ui_vg_animation_min_frame_get(obj:PEo):longint;cdecl;external;
{*
 * @brief The last frame of the play.
 *
 * @param[in] obj The object.
 * @param[in] max_frame The maximum frame for play. Value must be
 * @ref efl_ui_vg_animation_min_frame_get ~ (@Efl.Ui.Vg_Animation.frame_count -
 * 1). The default value is @ref efl_ui_vg_animation_frame_count_get - 1.
 *
 * @since 1.24
 *
 * @ingroup Efl_Ui_Vg_Animation
  }
procedure efl_ui_vg_animation_max_frame_set(obj:PEo; max_frame:longint);cdecl;external;
{*
 * @brief The last frame of the play.
 *
 * @param[in] obj The object.
 *
 * @return The maximum frame for play. Value must be
 * @ref efl_ui_vg_animation_min_frame_get ~ (@Efl.Ui.Vg_Animation.frame_count -
 * 1). The default value is @ref efl_ui_vg_animation_frame_count_get - 1.
 *
 * @since 1.24
 *
 * @ingroup Efl_Ui_Vg_Animation
  }
(* Const before type ignored *)
function efl_ui_vg_animation_max_frame_get(obj:PEo):longint;cdecl;external;
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief Play animation of sector one time instantly when it's available.
 *
 * If end sector is NULL, only start sector is referenced. If both the start
 * and end sectors are valid, Play is played and stoped at starting point of
 * each sector.
 *
 * If start is null and end is valid, playback starts from 0 frame to the start
 * frame of the end sector. If both sectors start and end are invalid. Play
 * from 0 frame to the last frame of vg animation object.
 *
 * @note This method use to @ref efl_ui_vg_animation_min_frame_get,
 * @ref efl_ui_vg_animation_max_frame_get (@Efl.Ui.Vg_Animation.min_progress,
 * @ref efl_ui_vg_animation_max_progress_get) internally. So if you have
 * changed the min or max frame(progress) it can be changed to the sector
 * frame.
 *
 * @param[in] obj The object.
 * @param[in] start The name of start sector
 * @param[in] end The name of end sector
 *
 * @return @c true when it's successful. @c false otherwise.
 *
 * @since 1.24
 *
 * @ingroup Efl_Ui_Vg_Animation
  }
(* Const before type ignored *)
(* Const before type ignored *)
function efl_ui_vg_animation_playing_sector(obj:PEo; start:Pchar; end:Pchar):TEina_Bool;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief Override each value of the animation object. Values can be properties
 * of Efl.Gfx.Vg.Value_provider such as color and matrix information.
 *
 * Example: Eo *vp = efl_add(EFL_GFX_VG_VALUE_PROVIDER_CLASS, NULL);
 * @ref efl_gfx_vg_value_provider_keypath_set(vp,
 * "SomeLayer:SomeObject:SomeContents"); // Set vp property
 * @ref efl_ui_vg_animation_value_provider_override(target_vg_animation, vg);
 * See @ref Efl_Gfx_Vg_Value_Provider
 *
 * @param[in] obj The object.
 * @param[in] value_provider Override the values of the animation object. this
 * should have keypath infomation. See @ref Efl_Gfx_Vg_Value_Provider
 *
 * @since 1.24
 *
 * @ingroup Efl_Ui_Vg_Animation
  }

procedure efl_ui_vg_animation_value_provider_override(obj:PEo; value_provider:PEfl_Gfx_Vg_Value_Provider);cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_UI_VG_ANIMATION_CLASS : longint; { return type might be wrong }
  begin
    EFL_UI_VG_ANIMATION_CLASS:=efl_ui_vg_animation_class_get;
  end;


end.
