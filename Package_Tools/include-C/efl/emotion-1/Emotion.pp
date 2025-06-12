
unit Emotion;
interface

{
  Automatically converted by H2Pas 1.0.0 from Emotion.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    Emotion.h
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
PEina_List  = ^Eina_List;
PEmotion_Artwork_Info  = ^Emotion_Artwork_Info;
PEmotion_Aspect  = ^Emotion_Aspect;
PEmotion_Event  = ^Emotion_Event;
PEmotion_Meta_Info  = ^Emotion_Meta_Info;
PEmotion_Suspend  = ^Emotion_Suspend;
PEmotion_Version  = ^Emotion_Version;
PEmotion_Vis  = ^Emotion_Vis;
PEmotion_Webcam  = ^Emotion_Webcam;
PEvas  = ^Evas;
PEvas_Object  = ^Evas_Object;
Plongint  = ^longint;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef EMOTION_H}
{$define EMOTION_H}
{*
 * @file
 * @brief Emotion Media Library
 *
 * These routines are used for Emotion.
  }
{*
 *
 * @page emotion_main Emotion
 *
 * @date 2003 (created)
 *
 * @section emotion_toc Table of Contents
 *
 * @li @ref emotion_main_intro
 * @li @ref emotion_main_work
 * @li @ref emotion_main_compiling
 * @li @ref emotion_main_next_steps
 * @li @ref emotion_main_intro_example
 *
 * @section emotion_main_intro Introduction
 *
 * A media object library for Evas and Ecore.
 *
 * Emotion is a library that allows playing audio and video files.
 *
 * It is integrated into Ecore through its mainloop, and is transparent to the
 * user of the library how the decoding of audio and video is being done. Once
 * the objects are created, the user can set callbacks to the specific events
 * and set options to this object, all in the main loop (no threads are needed).
 *
 * Emotion is also integrated with Evas. The emotion object returned by
 * emotion_object_add() is an Evas smart object, so it can be manipulated with
 * default Evas object functions. Callbacks can be added to the signals emitted
 * by this object with evas_object_smart_callback_add().
 *
 * @section emotion_main_work How does Emotion work?
 *
 * The Emotion library uses Evas smart objects to allow you to manipulate the
 * created object as any other Evas object, and to connect to its signals,
 * handling them when needed. It's also possible to swallow Emotion objects
 * inside Edje themes, and expect it to behave as a normal image or rectangle
 * when regarding to its dimensions.
 *
 * @section emotion_main_compiling How to compile
 *
 * Emotion is a library your application links to. The procedure for this is
 * very simple. You simply have to compile your application with the
 * appropriate compiler flags that the @c pkg-config script outputs. For
 * example:
 *
 * Compiling C or C++ files into object files:
 *
 * @verbatim
   gcc -c -o main.o main.c `pkg-config --cflags emotion`
   @endverbatim
 *
 * Linking object files into a binary executable:
 *
 * @verbatim
   gcc -o my_application main.o `pkg-config --libs emotion`
   @endverbatim
 *
 * See @ref pkgconfig
 *
 * @section emotion_main_next_steps Next Steps
 *
 * After you understood what Emotion is and installed it in your
 * system you should proceed understanding the programming
 * interface. We'd recommend you to take a while to learn @ref Ecore and
 * @ref Evas to get started.
 *
 * Recommended reading:
 *
 * @li @ref Emotion_Init to initialize the library.
 * @li @ref Emotion_Video to control video parameters.
 * @li @ref Emotion_Audio to control audio parameters.
 * @li @ref Emotion_Play to control playback.
 * @li @ref Emotion_Webcam to show cameras.
 * @li @ref extern for general programming interface.
 *
 * @section emotion_main_intro_example Introductory Example
 *
 * @include emotion_basic_example.c
 *
 * More examples can be found at @ref emotion_examples.
  }
{$include <Evas.h>}
{$include <Efl_Config.h>}
{$include <extern.h>}
{ C++ extern C conditionnal removed }
{$ifndef EFL_NOLEGACY_API_SUPPORT}
{$include "Emotion_Legacy.h"}
{$endif}
{$include "Emotion_Eo.h"}
{*
 * @file Emotion.h
 * @brief The file that provides Emotion the API, with functions available for
 *        play, seek, change volume, etc.
  }
{ Escape Menu }
{ Title Menu }
{ Root Menu }
{ Subpicture Menu }
{ Audio Menu }
{ Angle Menu }
{ Part Menu }
type
  TEmotion_Event =  Longint;
  Const
    EMOTION_EVENT_MENU1 = 0;
    EMOTION_EVENT_MENU2 = 1;
    EMOTION_EVENT_MENU3 = 2;
    EMOTION_EVENT_MENU4 = 3;
    EMOTION_EVENT_MENU5 = 4;
    EMOTION_EVENT_MENU6 = 5;
    EMOTION_EVENT_MENU7 = 6;
    EMOTION_EVENT_UP = 7;
    EMOTION_EVENT_DOWN = 8;
    EMOTION_EVENT_LEFT = 9;
    EMOTION_EVENT_RIGHT = 10;
    EMOTION_EVENT_SELECT = 11;
    EMOTION_EVENT_NEXT = 12;
    EMOTION_EVENT_PREV = 13;
    EMOTION_EVENT_ANGLE_NEXT = 14;
    EMOTION_EVENT_ANGLE_PREV = 15;
    EMOTION_EVENT_FORCE = 16;
    EMOTION_EVENT_0 = 17;
    EMOTION_EVENT_1 = 18;
    EMOTION_EVENT_2 = 19;
    EMOTION_EVENT_3 = 20;
    EMOTION_EVENT_4 = 21;
    EMOTION_EVENT_5 = 22;
    EMOTION_EVENT_6 = 23;
    EMOTION_EVENT_7 = 24;
    EMOTION_EVENT_8 = 25;
    EMOTION_EVENT_9 = 26;
    EMOTION_EVENT_10 = 27;

{*
 * @enum _Emotion_Meta_Info
 *
 * Used for retrieving information about the media file being played.
 *
 * @see emotion_object_meta_info_get()
 *
 * @ingroup Emotion_Info
  }
{*< track title  }
{*< artist name  }
{*< album name  }
{*< track year  }
{*< track genre  }
{*< track comments  }
{*< track disc ID  }
{*< track count - number of the track in the album  }
type
  TEmotion_Meta_Info =  Longint;
  Const
    EMOTION_META_INFO_TRACK_TITLE = 0;
    EMOTION_META_INFO_TRACK_ARTIST = 1;
    EMOTION_META_INFO_TRACK_ALBUM = 2;
    EMOTION_META_INFO_TRACK_YEAR = 3;
    EMOTION_META_INFO_TRACK_GENRE = 4;
    EMOTION_META_INFO_TRACK_COMMENT = 5;
    EMOTION_META_INFO_TRACK_DISC_ID = 6;
    EMOTION_META_INFO_TRACK_COUNT = 7;

type
  TEmotion_Artwork_Info =  Longint;
  Const
    EMOTION_ARTWORK_IMAGE = 0;
    EMOTION_ARTWORK_PREVIEW_IMAGE = 1;

{*
 * @enum _Emotion_Vis
 *
 * Used for displaying a visualization on the emotion object.
 *
 * @see emotion_object_vis_set()
 *
 * @ingroup Emotion_Visualization
  }
{*< no visualization set  }
{*< goom  }
{*< bumpscope  }
{*< corona  }
{*< dancing particles  }
{*< gdkpixbuf  }
{*< G force  }
{*< goom  }
{*< infinite  }
{*< jakdaw  }
{*< jess  }
{*< lv analyser  }
{*< lv flower  }
{*< lv gltest  }
{*< lv scope  }
{*< madspin  }
{*< nebulus  }
{*< oinksie  }
{*< plasma  }
{ sentinel  }
type
  TEmotion_Vis =  Longint;
  Const
    EMOTION_VIS_NONE = 0;
    EMOTION_VIS_GOOM = 1;
    EMOTION_VIS_LIBVISUAL_BUMPSCOPE = 2;
    EMOTION_VIS_LIBVISUAL_CORONA = 3;
    EMOTION_VIS_LIBVISUAL_DANCING_PARTICLES = 4;
    EMOTION_VIS_LIBVISUAL_GDKPIXBUF = 5;
    EMOTION_VIS_LIBVISUAL_G_FORCE = 6;
    EMOTION_VIS_LIBVISUAL_GOOM = 7;
    EMOTION_VIS_LIBVISUAL_INFINITE = 8;
    EMOTION_VIS_LIBVISUAL_JAKDAW = 9;
    EMOTION_VIS_LIBVISUAL_JESS = 10;
    EMOTION_VIS_LIBVISUAL_LV_ANALYSER = 11;
    EMOTION_VIS_LIBVISUAL_LV_FLOWER = 12;
    EMOTION_VIS_LIBVISUAL_LV_GLTEST = 13;
    EMOTION_VIS_LIBVISUAL_LV_SCOPE = 14;
    EMOTION_VIS_LIBVISUAL_MADSPIN = 15;
    EMOTION_VIS_LIBVISUAL_NEBULUS = 16;
    EMOTION_VIS_LIBVISUAL_OINKSIE = 17;
    EMOTION_VIS_LIBVISUAL_PLASMA = 18;
    EMOTION_VIS_LAST = 19;

{*
 * @enum Emotion_Suspend
 *
 * Used for emotion pipeline resource management.
 *
 * @see emotion_object_suspend_set()
 * @see emotion_object_suspend_get()
 *
 * @ingroup Emotion_Ressource
  }
{*< pipeline is up and running  }
{*< turn off hardware resource usage like overlay  }
{*< destroy the pipeline, but keep full resolution pixels output around  }
{*< destroy the pipeline, and keep half resolution or object resolution if lower  }
type
  PEmotion_Suspend = ^TEmotion_Suspend;
  TEmotion_Suspend =  Longint;
  Const
    EMOTION_WAKEUP = 0;
    EMOTION_SLEEP = 1;
    EMOTION_DEEP_SLEEP = 2;
    EMOTION_HIBERNATE = 3;
;
{*
 * @enum _Emotion_Aspect
 * Defines the aspect ratio option.
  }
{*< ignore video aspect ratio  }
{*< respect video aspect, fitting its width inside the object width  }
{*< respect video aspect, fitting its height inside the object height  }
{*< respect video aspect, fitting it inside the object area  }
{*< respect video aspect, cropping exceding area  }
{*< use custom borders/crop for the video  }
type
  TEmotion_Aspect =  Longint;
  Const
    EMOTION_ASPECT_KEEP_NONE = 0;
    EMOTION_ASPECT_KEEP_WIDTH = 1;
    EMOTION_ASPECT_KEEP_HEIGHT = 2;
    EMOTION_ASPECT_KEEP_BOTH = 3;
    EMOTION_ASPECT_CROP = 4;
    EMOTION_ASPECT_CUSTOM = 5;

type
  PEmotion_Event = ^TEmotion_Event;
  TEmotion_Event = TEmotion_Event;

  PEmotion_Meta_Info = ^TEmotion_Meta_Info;
  TEmotion_Meta_Info = TEmotion_Meta_Info;
{*< Meta info type to be retrieved.  }

  PEmotion_Vis = ^TEmotion_Vis;
  TEmotion_Vis = TEmotion_Vis;
{*< Type of visualization.  }

  PEmotion_Aspect = ^TEmotion_Aspect;
  TEmotion_Aspect = TEmotion_Aspect;
{*< Aspect ratio option.  }

  PEmotion_Artwork_Info = ^TEmotion_Artwork_Info;
  TEmotion_Artwork_Info = TEmotion_Artwork_Info;

const
  EMOTION_CHANNEL_AUTO = -(1);  
  EMOTION_CHANNEL_DEFAULT = 0;  
  EMOTION_VERSION_MAJOR = EFL_VERSION_MAJOR;  
  EMOTION_VERSION_MINOR = EFL_VERSION_MINOR;  
{*
 * @typedef Emotion_Version
 * Represents the current version of Emotion
  }
{* < major (binary or source incompatible changes)  }
{* < minor (new features, bugfixes, major improvements version)  }
{* < micro (bugfix, internal improvements, no new features version)  }
{* < git revision (0 if a proper release or the git revision number Emotion is built from)  }
type
  PEmotion_Version = ^TEmotion_Version;
  TEmotion_Version = record
      major : longint;
      minor : longint;
      micro : longint;
      revision : longint;
    end;
  var
    emotion_version : PEmotion_Version;cvar;external;
{ api calls available  }
{*
 * @brief How to create, initialize, manipulate and connect to signals of an
 * Emotion object.
 * @defgroup extern API available for manipulating Emotion object.
 * @ingroup Emotion
 *
 * @
 *
 * Emotion provides an Evas smart object that allows to play, control and
 * display a video or audio file. The API is synchronous but not everything
 * happens immediately. There are also some signals to report changed states.
 *
 * Basically, once the object is created and initialized, a file will be set to
 * it, and then it can be resized, moved, and controlled by other Evas object
 * functions.
 *
 * However, the decoding of the music and video occurs not in the Ecore main
 * loop, but usually in another thread (this depends on the module being used).
 * The synchronization between this other thread and the main loop not visible
 * to the end user of the library. The user can just register callbacks to the
 * available signals to receive information about the changed states, and can
 * call other functions from the API to request more changes on the current
 * loaded file.
 *
 * There will be a delay between an API being called and it being really
 * executed, since this request will be done in the main thread, and it needs to
 * be sent to the decoding thread. For this reason, always call functions like
 * emotion_object_size_get() or emotion_object_length_get() after some signal
 * being sent, like "playback_started" or "open_done". @ref
 * emotion_signals_example.c "This example demonstrates this behavior".
 *
 * @section signals Available signals
 * The Evas_Object returned by emotion_object_add() has a number of signals that
 * can be listened to using evas' smart callbacks mechanism. All signals have
 * NULL as event info. The following is a list of interesting signals:
 * @li "playback_started" - Emitted when the playback starts
 * @li "playback_finished" - Emitted when the playback finishes
 * @li "frame_decode" - Emitted every time a frame is decoded
 * @li "open_done" - Emitted when the media file is opened
 * @li "position_update" - Emitted when emotion_object_position_set is called
 * @li "decode_stop" - Emitted after the last frame is decoded
 *
 * @section Emotion_Examples
 *
 * The following examples exemplify the emotion usage. There's also the
 * emotion_test binary that is distributed with this library and cover the
 * entire API, but since it is too long and repetitive to be explained, its code
 * is just displayed as another example.
 *
 * @li @ref emotion_basic_example_c
 * @li @ref emotion_signals_example.c "Emotion signals"
 * @li @ref emotion_test_main.c "emotion_test - full API usage"
 *
  }
{*
 * @defgroup Emotion_Init Creation and initialization functions
  }
{*
 * @defgroup Emotion_Audio Audio control functions
  }
{*
 * @defgroup Emotion_Video Video control functions
  }
{*
 * @defgroup Emotion_Visualization Visualization control functions
  }
{*
 * @defgroup Emotion_Info Miscellaneous information retrieval functions
  }
{*
 * @defgroup Emotion_Ressource Video resource management
  }
{*
 * @brief Initialise Emotion library
 *
 * Initialise needed libraries like eina ecore eet
 * Initialise needed modules like webcam
  }

function emotion_init:TEina_Bool;cdecl;external;
{*
 * @brief Shutdown Emotion library
 *
 * Proper shutdown of all loaded modules and initialised libraries.
  }
function emotion_shutdown:TEina_Bool;cdecl;external;
{*
 * @brief Add an emotion object to the canvas.
 *
 * @param evas The canvas where the object will be added to.
 * @return The emotion object just created.
 *
 * This function creates an emotion object and adds it to the specified @p evas.
 * The returned object can be manipulated as any other Evas object, using the
 * default object manipulation functions - evas_object_*.
 *
 * After creating the object with this function, it's still necessary to
 * initialize it with emotion_object_init(), and if an audio file is going to be
 * played with this object instead of a video, use
 * emotion_object_video_mute_set().
 *
 * The next step is to open the desired file with emotion_object_file_set(), and
 * start playing it with emotion_object_play_set().
 *
 * @see emotion_object_init()
 * @see emotion_object_video_mute_set()
 * @see emotion_object_file_set()
 * @see emotion_object_play_set()
 *
 * @ingroup Emotion_Init
  }
function emotion_object_add(evas:PEvas):PEvas_Object;cdecl;external;
{*
 * @brief Set borders for the emotion object.
 *
 * @param obj The emotion object where borders are being set.
 * @param l The left border.
 * @param r The right border.
 * @param t The top border.
 * @param b The bottom border.
 *
 * This function sets borders for the emotion video object (just when a video is
 * present). When positive values are given to one of the parameters, a border
 * will be added to the respective position of the object, representing that
 * size on the original video size. However, if the video is scaled up or down
 * (i.e. the emotion object size is different from the video size), the borders
 * will be scaled respectively too.
 *
 * If a negative value is given to one of the parameters, instead of a border,
 * that respective side of the video will be cropped.
 *
 * It's possible to set a color for the added borders (default is transparent)
 * with emotion_object_bg_color_set(). By default, an Emotion object doesn't
 * have any border.
 *
 * @see emotion_object_border_get()
 * @see emotion_object_bg_color_set()
 *
 * @ingroup Emotion_Video
  }
procedure emotion_object_border_set(obj:PEvas_Object; l:longint; r:longint; t:longint; b:longint);cdecl;external;
{*
 * @brief Get the borders set for the emotion object.
 *
 * @param obj The emotion object from which the borders are being retrieved.
 * @param l The left border.
 * @param r The right border.
 * @param t The top border.
 * @param b The bottom border.
 *
 * @see emotion_object_border_set()
 *
 * @ingroup Emotion_Video
  }
(* Const before type ignored *)
procedure emotion_object_border_get(obj:PEvas_Object; l:Plongint; r:Plongint; t:Plongint; b:Plongint);cdecl;external;
{*
 * @brief Set a color for the background rectangle of this emotion object.
 *
 * @param obj The emotion object where the background color is being set.
 * @param r Red component of the color.
 * @param g Green component of the color.
 * @param b Blue component of the color.
 * @param a Alpha channel of the color.
 *
 * This is useful when a border is added to any side of the Emotion object. The
 * area between the edge of the video and the edge of the object will be filled
 * with the specified color.
 *
 * The default color is 0, 0, 0, 0 (transparent).
 *
 * @see emotion_object_bg_color_get()
 *
 * @ingroup Emotion_Video
  }
procedure emotion_object_bg_color_set(obj:PEvas_Object; r:longint; g:longint; b:longint; a:longint);cdecl;external;
{*
 * @brief Get the background color set for the emotion object.
 *
 * @param obj The emotion object from which the background color is being retrieved.
 * @param r Red component of the color.
 * @param g Green component of the color.
 * @param b Blue component of the color.
 * @param a AAlpha channel of the color.
 *
 * @see emotion_object_bg_color_set()
 *
 * @ingroup Emotion_Video
  }
(* Const before type ignored *)
procedure emotion_object_bg_color_get(obj:PEvas_Object; r:Plongint; g:Plongint; b:Plongint; a:Plongint);cdecl;external;
{*
 * @brief Set whether emotion should keep the aspect ratio of the video.
 *
 * @param obj The emotion object where to set the aspect.
 * @param a The aspect ratio policy.
 *
 * Instead of manually calculating the required border to set with
 * emotion_object_border_set(), and using this to fix the aspect ratio of the
 * video when the emotion object has a different aspect, it's possible to just
 * set the policy to be used.
 *
 * The options are:
 *
 * - @b #EMOTION_ASPECT_KEEP_NONE - ignore the video aspect ratio, and reset any
 *   border set to 0, stretching the video inside the emotion object area. This
 *   option is similar to EVAS_ASPECT_CONTROL_NONE size hint.
 * - @b #EMOTION_ASPECT_KEEP_WIDTH - respect the video aspect ratio, fitting the
 *   video width inside the object width. This option is similar to
 *   EVAS_ASPECT_CONTROL_HORIZONTAL size hint.
 * - @b #EMOTION_ASPECT_KEEP_HEIGHT - respect the video aspect ratio, fitting
 *   the video height inside the object height. This option is similar to
 *   EVAS_ASPECT_CONTROL_VERTIAL size hint.
 * - @b #EMOTION_ASPECT_KEEP_BOTH - respect the video aspect ratio, fitting both
 *   its width and height inside the object area. This option is similar to
 *   EVAS_ASPECT_CONTROL_BOTH size hint. It's the effect called letterboxing.
 * - @b #EMOTION_ASPECT_CROP - respect the video aspect ratio, fitting the width
 *   or height inside the object area, and cropping the exceding areas of the
 *   video in height or width. It's the effect called pan-and-scan.
 * - @b #EMOTION_ASPECT_CUSTOM - ignore the video aspect ratio, and use the
 *   current set from emotion_object_border_set().
 *
 * @note Calling this function with any value except #EMOTION_ASPECT_CUSTOM will
 * invalidate borders set with emotion_object_border_set().
 *
 * @note Calling emotion_object_border_set() will automatically set the aspect
 * policy to #EMOTION_ASPECT_CUSTOM.
 *
 * @see emotion_object_border_set()
 * @see emotion_object_keep_aspect_get()
 *
 * @ingroup Emotion_Video
  }
procedure emotion_object_keep_aspect_set(obj:PEvas_Object; a:TEmotion_Aspect);cdecl;external;
{*
 * @brief Get the current emotion aspect ratio policy.
 *
 * @param obj The emotion object from which we are fetching the aspect ratio
 * policy.
 * @return The current aspect ratio policy.
 *
 * @see emotion_object_keep_aspect_set()
 *
 * @ingroup Emotion_Video
  }
(* Const before type ignored *)
function emotion_object_keep_aspect_get(obj:PEvas_Object):TEmotion_Aspect;cdecl;external;
{*
 * @brief Set the file to be played in the Emotion object.
 *
 * @param obj The emotion object where the file is being loaded.
 * @param filename Path to the file to be loaded. It can be absolute or relative
 * path.
 * @return EINA_TRUE if the new file could be loaded successfully, and
 * EINA_FALSE if the file could not be loaded. This happens when the filename is
 * could not be found, when the module couldn't open the file, when no module is
 * initialized in this object, or when the @p filename is the same as the
 * one previously set.
 *
 * This function sets the file to be used with this emotion object. If the
 * object already has another file set, this file will be unset and unloaded,
 * and the new file will be loaded to this emotion object. The seek position
 * will be set to 0, and the emotion object will be paused, instead of playing.
 *
 * If there was already a filename set, and it's the same as the one being set
 * now, this function does nothing and returns EINA_FALSE.
 *
 * Use @c NULL as argument to @p filename if you want to unload the current file
 * but don't want to load anything else.
 *
 * @see emotion_object_init()
 * @see emotion_object_play_set()
 * @see emotion_object_file_get()
 *
 * @ingroup Emotion_Init
  }
(* Const before type ignored *)
function emotion_object_file_set(obj:PEvas_Object; filename:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Get the filename of the file associated with the emotion object.
 *
 * @param obj The emotion object from which the filename will be retrieved.
 * @return The path to the file loaded into this emotion object.
 *
 * This function returns the path of the file loaded in this emotion object. If
 * no object is loaded, it will return @c NULL.
 *
 * @note Don't free or change the string returned by this function in any way.
 * If you want to unset it, use @c emotion_object_file_set(obj, NULL).
 *
 * @see emotion_object_file_set()
 *
 * @ingroup Emotion_Init
  }
(* Const before type ignored *)
(* Const before type ignored *)
function emotion_object_file_get(obj:PEvas_Object):Pchar;cdecl;external;
{*
 * @defgroup Emotion_Play Play control functions
 * @ingroup Emotion
 *
 * @
  }
{*
 *
 * @brief Set play/pause state of the media file.
 *
 * @param obj The emotion object whose state will be changed.
 * @param play EINA_TRUE to play, EINA_FALSE to pause.
 *
 * This functions sets the currently playing status of the video. Using this
 * function to play or pause the video doesn't alter it's current position.
  }
procedure emotion_object_play_set(obj:PEvas_Object; play:TEina_Bool);cdecl;external;
{*
 * @brief Get play/pause state of the media file.
 *
 * @param obj The emotion object from which the state will be retrieved.
 * @return EINA_TRUE if playing. EINA_FALSE if not playing.
  }
(* Const before type ignored *)
function emotion_object_play_get(obj:PEvas_Object):TEina_Bool;cdecl;external;
{*
 * @brief Set the position in the media file.
 *
 * @param obj The emotion object whose position will be changed.
 * @param sec The position(in seconds) to which the media file will be set.
 *
 * This functions sets the current position of the media file to @p sec, this
 * only works on seekable streams. Setting the position doesn't change the
 * playing state of the media file.
 *
 * @see emotion_object_seekable_get
  }
procedure emotion_object_position_set(obj:PEvas_Object; sec:Tdouble);cdecl;external;
{*
 * @brief Get the position in the media file.
 *
 * @param obj The emotion object from which the position will be retrieved.
 * @return The position of the media file.
 *
 * The position is returned as the number of seconds since the beginning of the
 * media file.
  }
(* Const before type ignored *)
function emotion_object_position_get(obj:PEvas_Object):Tdouble;cdecl;external;
{*
 * @brief Get the percentual size of the buffering cache.
 *
 * @param obj The emotion object from which the buffer size will be retrieved.
 * @return The buffer percent size, ranging from 0.0 to 1.0
 *
 * The buffer size is returned as a number between 0.0 and 1.0, 0.0 means
 * the buffer if empty, 1.0 means full.
 * If no buffering is in progress 1.0 is returned. In all other cases (maybe
 * the backend don't support buffering) 1.0 is returned, thus you can always
 * check for buffer_size < 1.0 to know if buffering is in progress.
 *
 * @warning Generic backend don't implement this (will return 1.0).
  }
(* Const before type ignored *)
function emotion_object_buffer_size_get(obj:PEvas_Object):Tdouble;cdecl;external;
{*
 * @brief Get whether the media file is seekable.
 *
 * @param obj The emotion object from which the seekable status will be
 * retrieved.
 * @return EINA_TRUE if the media file is seekable, EINA_FALSE otherwise.
  }
(* Const before type ignored *)
function emotion_object_seekable_get(obj:PEvas_Object):TEina_Bool;cdecl;external;
{*
 * @brief Get the length of play for the media file.
 *
 * @param obj The emotion object from which the length will be retrieved.
 * @return The length of the media file in seconds.
 *
 * This function returns the length of the media file in seconds.
 *
 * @warning This will return 0 if called before the "length_change" signal has,
 * been emitted.
  }
(* Const before type ignored *)
function emotion_object_play_length_get(obj:PEvas_Object):Tdouble;cdecl;external;
{*
 * @brief Set the play speed of the media file.
 *
 * @param obj The emotion object whose speed will be set.
 * @param speed The speed to be set in the range [0,infinity)
 *
 * This function sets the speed with which the media file will be played. 1.0
 * represents the normal speed, 2 double speed, 0.5 half speed and so on.
 *
 * @warning The only backend that implements this is the experimental VLC
 * backend.
  }
procedure emotion_object_play_speed_set(obj:PEvas_Object; speed:Tdouble);cdecl;external;
{*
 * @brief Get  the play speed of the media file.
 *
 * @param obj The emotion object from which the filename will be retrieved.
 * @return The current speed of the media file.
 *
 * @see emotion_object_play_speed_set
  }
(* Const before type ignored *)
function emotion_object_play_speed_get(obj:PEvas_Object):Tdouble;cdecl;external;
{*
 * @brief Get how much of the file has been played.
 *
 * @param obj The emotion object from which the filename will be retrieved.
 * @return The progress of the media file.
 *
 * @warning Don't change of free the returned string.
 * @warning gstreamer xine backends don't implement this(will return NULL).
  }
(* Const before type ignored *)
(* Const before type ignored *)
function emotion_object_progress_info_get(obj:PEvas_Object):Pchar;cdecl;external;
{*
 * @brief Get how much of the file has been played.
 *
 * @param obj The emotion object from which the filename will be retrieved
 * @return The progress of the media file.
 *
 * This function gets the progress in playing the file, the return value is in
 * the [0, 1] range.
 *
 * @warning gstreamer xine backends don't implement this(will return 0).
  }
(* Const before type ignored *)
function emotion_object_progress_status_get(obj:PEvas_Object):Tdouble;cdecl;external;
{*
 * @
  }
(* Const before type ignored *)
function emotion_object_video_handled_get(obj:PEvas_Object):TEina_Bool;cdecl;external;
(* Const before type ignored *)
function emotion_object_audio_handled_get(obj:PEvas_Object):TEina_Bool;cdecl;external;
{*
 * @brief Retrieve the video aspect ratio of the media file loaded.
 *
 * @param obj The emotion object which the video aspect ratio will be retrieved
 * from.
 * @return The video aspect ratio of the file loaded.
 *
 * This function returns the video aspect ratio (width / height) of the file
 * loaded. It can be used to adapt the size of the emotion object in the canvas,
 * so the aspect won't be changed (by wrongly resizing the object). Or to crop
 * the video correctly, if necessary.
 *
 * The described behavior can be applied like following. Consider a given
 * emotion object that we want to position inside an area, which we will
 * represent by @c w and @c h. Since we want to position this object either
 * stretching, or filling the entire area but overflowing the video, or just
 * adjust the video to fit inside the area without keeping the aspect ratio, we
 * must compare the video aspect ratio with the area aspect ratio:
 * @code
 * int w = 200, h = 300; // an arbitrary value which represents the area where
 *                       // the video would be placed
 * int vw, vh;
 * double r, vr = emotion_object_ratio_get(obj);
 * r = (double)w / h;
 * @endcode
 *
 * Now, if we want to make the video fit inside the area, the following code
 * would do it:
 * @code
 * if (vr > r) // the video is wider than the area
 *   
 *      vw = w;
 *      vh = w / vr;
 *   
 * else // the video is taller than the area
 *   
 *      vh = h;
 *      vw = h * vr;
 *   
 * evas_object_resize(obj, vw, vh);
 * @endcode
 *
 * And for keeping the aspect ratio but making the video fill the entire area,
 * overflowing the content which can't fit inside it, we would do:
 * @code
 * if (vr > r) // the video is wider than the area
 *   
 *      vh = h;
 *      vw = h * vr;
 *   
 * else // the video is taller than the area
 *   
 *      vw = w;
 *      vh = w / vr;
 *   
 * evas_object_resize(obj, vw, vh);
 * @endcode
 *
 * Finally, by just resizing the video to the video area, we would have the
 * video stretched:
 * @code
 * vw = w;
 * vh = h;
 * evas_object_resize(obj, vw, vh);
 * @endcode
 *
 * The following diagram exemplifies what would happen to the video,
 * respectively, in each case:
 *
 * @image html emotion_ratio.png
 * @image latex emotion_ratio.eps width=\textwidth
 *
 * @note This function returns the aspect ratio that the video @b should be, but
 * sometimes the reported size from emotion_object_size_get() represents a
 * different aspect ratio. You can safely resize the video to respect the aspect
 * ratio returned by @b this function.
 *
 * @see emotion_object_size_get()
 *
 * @ingroup Emotion_Video
  }
(* Const before type ignored *)
function emotion_object_ratio_get(obj:PEvas_Object):Tdouble;cdecl;external;
{*
 * @brief Retrieve the video size of the loaded file.
 *
 * @param obj The object from which we are retrieving the video size.
 * @param iw A pointer to a variable where the width will be stored.
 * @param ih A pointer to a variable where the height will be stored.
 *
 * This function returns the reported size of the loaded video file. If a file
 * that doesn't contain a video channel is loaded, then this size can be
 * ignored.
 *
 * The value reported by this function should be consistent with the aspect
 * ratio returned by emotion_object_ratio_get(), but sometimes the information
 * stored in the file is wrong. So use the ratio size reported by
 * emotion_object_ratio_get(), since it is more likely going to be accurate.
 *
 * @note Use @c NULL for @p iw or @p ih if you don't need one of these values.
 *
 * @see emotion_object_ratio_get()
 *
 * @ingroup Emotion_Video
  }
(* Const before type ignored *)
procedure emotion_object_size_get(obj:PEvas_Object; iw:Plongint; ih:Plongint);cdecl;external;
{*
 * @brief Sets whether to use of high-quality image scaling algorithm
 * of the given video object.
 *
 * When enabled, a higher quality video scaling algorithm is used when
 * scaling videos to sizes other than the source video. This gives
 * better results but is more computationally expensive.
 *
 * @param obj The given video object.
 * @param smooth Whether to use smooth scale or not.
 *
 * @see emotion_object_smooth_scale_get()
 *
 * @ingroup Emotion_Video
  }
procedure emotion_object_smooth_scale_set(obj:PEvas_Object; smooth:TEina_Bool);cdecl;external;
{*
 * @brief Gets whether the high-quality image scaling algorithm
 * of the given video object is used.
 *
 * @param obj The given video object.
 * @return Whether the smooth scale is used or not.
 *
 * @see emotion_object_smooth_scale_set()
 *
 * @ingroup Emotion_Video
  }
(* Const before type ignored *)
function emotion_object_smooth_scale_get(obj:PEvas_Object):TEina_Bool;cdecl;external;
{*
 * @brief Send an Emotion Event to an Evas object
 *
 * @param obj The object target of the event.
 * @param ev The emotion event.
 *
 * @see Emotion_Event
  }
procedure emotion_object_event_simple_send(obj:PEvas_Object; ev:TEmotion_Event);cdecl;external;
{*
 * @brief Set the audio volume.
 *
 * @param obj The object where the volume is being set.
 * @param vol The new volume parameter. Range is from 0.0 to 1.0.
 *
 * Sets the audio volume of the stream being played. This has nothing to do with
 * the system volume. This volume will be multiplied by the system volume. e.g.:
 * if the current volume level is 0.5, and the system volume is 50%, it will be
 * 0.5 * 0.5 = 0.25.
 *
 * The default value depends on the module used. This value doesn't get changed
 * when another file is loaded.
 *
 * @see emotion_object_audio_volume_get()
 *
 * @ingroup Emotion_Audio
  }
procedure emotion_object_audio_volume_set(obj:PEvas_Object; vol:Tdouble);cdecl;external;
{*
 * @brief Get the audio volume.
 *
 * @param obj The object from which we are retrieving the volume.
 * @return The current audio volume level for this object.
 *
 * Get the current value for the audio volume level. Range is from 0.0 to 1.0.
 * This volume is set with emotion_object_audio_volume_set().
 *
 * @see emotion_object_audio_volume_set()
 *
 * @ingroup Emotion_Audio
  }
(* Const before type ignored *)
function emotion_object_audio_volume_get(obj:PEvas_Object):Tdouble;cdecl;external;
{*
 * @brief Set the mute audio option for this object.
 *
 * @param obj The object which we are setting the mute audio option.
 * @param mute Whether the audio should be muted (@c EINA_TRUE) or not (@c
 * EINA_FALSE).
 *
 * This function sets the mute audio option for this emotion object. The current
 * module used for this object can use this to avoid decoding the audio portion
 * of the loaded media file.
 *
 * @see emotion_object_audio_mute_get()
 * @see emotion_object_video_mute_set()
 *
 * @ingroup Emotion_Audio
  }
procedure emotion_object_audio_mute_set(obj:PEvas_Object; mute:TEina_Bool);cdecl;external;
{*
 * @brief Get the mute audio option of this object.
 *
 * @param obj The object which we are retrieving the mute audio option from.
 * @return Whether the audio is muted (@c EINA_TRUE) or not (@c EINA_FALSE).
 *
 * This function return the mute audio option from this emotion object. It can
 * be set with emotion_object_audio_mute_set().
 *
 * @see emotion_object_audio_mute_set()
 *
 * @ingroup Emotion_Audio
  }
(* Const before type ignored *)
function emotion_object_audio_mute_get(obj:PEvas_Object):TEina_Bool;cdecl;external;
(* Const before type ignored *)
function emotion_object_audio_channel_count(obj:PEvas_Object):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function emotion_object_audio_channel_name_get(obj:PEvas_Object; channel:longint):Pchar;cdecl;external;
procedure emotion_object_audio_channel_set(obj:PEvas_Object; channel:longint);cdecl;external;
(* Const before type ignored *)
function emotion_object_audio_channel_get(obj:PEvas_Object):longint;cdecl;external;
{*
 * @brief Set the mute video option for this object.
 *
 * @param obj The object which we are setting the mute video option.
 * @param mute Whether the video should be muted (@c EINA_TRUE) or not (@c
 * EINA_FALSE).
 *
 * This function sets the mute video option for this emotion object. The
 * current module used for this object can use this information to avoid
 * decoding the video portion of the loaded media file.
 *
 * @see emotion_object_video_mute_get()
 * @see emotion_object_audio_mute_set()
 *
 * @ingroup Emotion_Video
  }
procedure emotion_object_video_mute_set(obj:PEvas_Object; mute:TEina_Bool);cdecl;external;
{*
 * @brief Get the mute video option of this object.
 *
 * @param obj The object which we are retrieving the mute video option from.
 * @return Whether the video is muted (@c EINA_TRUE) or not (@c EINA_FALSE).
 *
 * This function returns the mute video option from this emotion object. It can
 * be set with emotion_object_video_mute_set().
 *
 * @see emotion_object_video_mute_set()
 *
 * @ingroup Emotion_Video
  }
(* Const before type ignored *)
function emotion_object_video_mute_get(obj:PEvas_Object):TEina_Bool;cdecl;external;
{*
 * @brief Set the video's subtitle file path.
 *
 * @param obj  The object which we are setting a subtitle file path.
 * @param filepath The subtitle file path.
 *
 * This function sets a video's subtitle file path(i.e an .srt file) for
 * supported subtitle formats consult the backend's documentation.
 *
 * @see emotion_object_video_subtitle_file_get().
 *
 * @ingroup Emotion_Video
 * @since 1.8
  }
(* Const before type ignored *)
procedure emotion_object_video_subtitle_file_set(obj:PEvas_Object; filepath:Pchar);cdecl;external;
{*
 * @brief Get the video's subtitle file path.
 *
 * @param obj The object which we are retrieving the subtitle file path from.
 * @return The video's subtitle file path previously set, NULL otherwise.
 *
 * This function returns the video's subtitle file path, if not previously set
 * or in error NULL is returned.
 *
 * @see emotion_object_video_subtitle_file_set().
 *
 * @ingroup Emotion_Video
 * @since 1.8
  }
(* Const before type ignored *)
(* Const before type ignored *)
function emotion_object_video_subtitle_file_get(obj:PEvas_Object):Pchar;cdecl;external;
{*
 * @brief Get the number of available video channel
 *
 * @param obj The object which we are retrieving the channel count from
 * @return the number of available channel.
 *
 * @see emotion_object_video_channel_name_get()
 *
 * @ingroup Emotion_Video
  }
(* Const before type ignored *)
function emotion_object_video_channel_count(obj:PEvas_Object):longint;cdecl;external;
{*
 * @brief Get the name of a given video channel
 *
 * @param obj The object which we are retrieving the channel name from
 * @param channel the channel number
 * @return the channel name.
 *
 * @see emotion_object_video_channel_count()
 *
 * @ingroup Emotion_Video
  }
(* Const before type ignored *)
(* Const before type ignored *)
function emotion_object_video_channel_name_get(obj:PEvas_Object; channel:longint):Pchar;cdecl;external;
{*
 * @brief Set the channel for a given video object
 *
 * @param obj The target object which we are setting the channel
 * @param channel the channel number to be setted.
 *
 * @ingroup Emotion_Video
  }
procedure emotion_object_video_channel_set(obj:PEvas_Object; channel:longint);cdecl;external;
{*
 * @brief Get the channel for a given video object
 *
 * @param obj The target object which we are getting the channel
 * @return The current channel number.
 *
 * @ingroup Emotion_Video
  }
(* Const before type ignored *)
function emotion_object_video_channel_get(obj:PEvas_Object):longint;cdecl;external;
procedure emotion_object_spu_mute_set(obj:PEvas_Object; mute:TEina_Bool);cdecl;external;
(* Const before type ignored *)
function emotion_object_spu_mute_get(obj:PEvas_Object):TEina_Bool;cdecl;external;
(* Const before type ignored *)
function emotion_object_spu_channel_count(obj:PEvas_Object):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function emotion_object_spu_channel_name_get(obj:PEvas_Object; channel:longint):Pchar;cdecl;external;
procedure emotion_object_spu_channel_set(obj:PEvas_Object; channel:longint);cdecl;external;
(* Const before type ignored *)
function emotion_object_spu_channel_get(obj:PEvas_Object):longint;cdecl;external;
(* Const before type ignored *)
function emotion_object_chapter_count(obj:PEvas_Object):longint;cdecl;external;
procedure emotion_object_chapter_set(obj:PEvas_Object; chapter:longint);cdecl;external;
(* Const before type ignored *)
function emotion_object_chapter_get(obj:PEvas_Object):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function emotion_object_chapter_name_get(obj:PEvas_Object; chapter:longint):Pchar;cdecl;external;
procedure emotion_object_eject(obj:PEvas_Object);cdecl;external;
{*
 * @brief Get the dvd title from this emotion object.
 *
 * @param obj The object which the title will be retrieved from.
 * @return A string containing the title.
 *
 * This function is only useful when playing a DVD.
 *
 * @note Don't change or free the string returned by this function.
 *
 * @ingroup Emotion_Info
  }
(* Const before type ignored *)
(* Const before type ignored *)
function emotion_object_title_get(obj:PEvas_Object):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function emotion_object_ref_file_get(obj:PEvas_Object):Pchar;cdecl;external;
(* Const before type ignored *)
function emotion_object_ref_num_get(obj:PEvas_Object):longint;cdecl;external;
(* Const before type ignored *)
function emotion_object_spu_button_count_get(obj:PEvas_Object):longint;cdecl;external;
(* Const before type ignored *)
function emotion_object_spu_button_get(obj:PEvas_Object):longint;cdecl;external;
{*
 * @brief Retrieve meta information from this file being played.
 *
 * @param obj The object which the meta info will be extracted from.
 * @param meta The type of meta information that will be extracted.
 *
 * This function retrieves information about the file loaded. It can retrieve
 * the track title, artist name, album name, etc. See @ref Emotion_Meta_Info
 * for all the possibilities.
 *
 * The meta info may be not available on all types of files. It will return @c
 * NULL if the the file doesn't have meta info, or if this specific field is
 * empty.
 *
 * @note Don't change or free the string returned by this function.
 *
 * @see Emotion_Meta_Info
 *
 * @ingroup Emotion_Info
  }
(* Const before type ignored *)
(* Const before type ignored *)
function emotion_object_meta_info_get(obj:PEvas_Object; meta:TEmotion_Meta_Info):Pchar;cdecl;external;
{*
 * @brief Set the visualization to be used with this object.
 *
 * @param obj The object where the visualization will be set on.
 * @param visualization The type of visualization to be used.
 *
 * The @p visualization specified will be played instead of a video. This is
 * commonly used to display a visualization for audio only files (musics).
 *
 * The available visualizations are @ref Emotion_Vis.
 *
 * @see Emotion_Vis
 * @see emotion_object_vis_get()
 * @see emotion_object_vis_supported()
 *
 * @ingroup Emotion_Visualization
  }
procedure emotion_object_vis_set(obj:PEvas_Object; visualization:TEmotion_Vis);cdecl;external;
{*
 * @brief Get the type of visualization in use by this emotion object.
 *
 * @param obj The emotion object which the visualization is being retrieved
 * from.
 * @return The type of visualization in use by this object.
 *
 * The type of visualization can be set by emotion_object_vis_set().
 *
 * @see Emotion_Vis
 * @see emotion_object_vis_set()
 * @see emotion_object_vis_supported()
 *
 * @ingroup Emotion_Visualization
  }
(* Const before type ignored *)
function emotion_object_vis_get(obj:PEvas_Object):TEmotion_Vis;cdecl;external;
{*
 * @brief Query whether a type of visualization is supported by this object.
 *
 * @param obj The object which the query is being ran on.
 * @param visualization The type of visualization that is being queried.
 * @return EINA_TRUE if the visualization is supported, EINA_FALSE otherwise.
 *
 * This can be used to check if a visualization is supported. e.g.: one wants to
 * display a list of available visualizations for a specific object.
 *
 * @see Emotion_Vis
 * @see emotion_object_vis_set()
 * @see emotion_object_vis_get()
 *
 * @ingroup Emotion_Visualization
  }
(* Const before type ignored *)
function emotion_object_vis_supported(obj:PEvas_Object; visualization:TEmotion_Vis):TEina_Bool;cdecl;external;
{*
 * @brief Raise priority of an object so it will have a priviledged access to hardware resources.
 *
 * @param obj The object which the query is being ran on.
 * @param priority EINA_TRUE means give me a priority access to the hardware resources.
 *
 * Hardware have a few dedicated hardware pipeline that process the video at no cost for the CPU.
 * Especially on SoC, you mostly have one (on mobile phone SoC) or two (on Set Top Box SoC) when
 * Picture in Picture is needed. And most application just have a few video stream that really
 * deserve high frame rate, high quality output. That's why this call is for.
 *
 * Please note that if Emotion can't acquire a priviledged hardware resource, it will fallback
 * to the no-priority path. This work on the first asking first get basis system.
 *
 * @see emotion_object_priority_get()
 *
 * @ingroup Emotion_Ressource
  }
procedure emotion_object_priority_set(obj:PEvas_Object; priority:TEina_Bool);cdecl;external;
{*
 * @brief Get the actual priority of an object.
 *
 * @param obj The object which the query is being ran on.
 * @return EINA_TRUE if the object has a priority access to the hardware.
 *
 * This actually return the priority status of an object. If it failed to have a priviledged
 * access to the hardware, it will return EINA_FALSE.
 *
 * @see emotion_object_priority_get()
 *
 * @ingroup Emotion_Ressource
  }
(* Const before type ignored *)
function emotion_object_priority_get(obj:PEvas_Object):TEina_Bool;cdecl;external;
{*
 * @brief Change the state of an object pipeline.
 *
 * @param obj The object which the query is being ran on.
 * @param state The new state for the object.
 *
 * Changing the state of a pipeline should help preserve the battery of an embedded device.
 * But it will only work sanely if the pipeline is not playing at the time you change its
 * state. Depending on the engine all state may be not implemented.
 *
 * @see Emotion_Suspend
 * @see emotion_object_suspend_get()
 *
 * @ingroup Emotion_Ressource
  }
procedure emotion_object_suspend_set(obj:PEvas_Object; state:TEmotion_Suspend);cdecl;external;
{*
 * @brief Get the current state of the pipeline
 *
 * @param obj The object which the query is being ran on.
 * @return the current state of the pipeline.
 *
 * @see Emotion_Suspend
 * @see emotion_object_suspend_set()
 *
 * @ingroup Emotion_Ressource
  }
function emotion_object_suspend_get(obj:PEvas_Object):TEmotion_Suspend;cdecl;external;
{*
 * @brief Load the last known position if available
 *
 * @param obj The object which the query is being ran on.
 *
 * By using Xattr, Emotion is able, if the system permitt it, to store and retrieve
 * the latest position. It should trigger some smart callback to let the application
 * know when it succeed or fail. Every operation is fully asynchronous and not
 * linked to the actual engine used to play the vide.
 *
 * @see emotion_object_last_position_save()
 *
 * @ingroup Emotion_Info
  }
procedure emotion_object_last_position_load(obj:PEvas_Object);cdecl;external;
{*
 * @brief Save the lastest position if possible
 *
 * @param obj The object which the query is being ran on.
 *
 * By using Xattr, Emotion is able, if the system permitt it, to store and retrieve
 * the latest position. It should trigger some smart callback to let the application
 * know when it succeed or fail. Every operation is fully asynchronous and not
 * linked to the actual engine used to play the vide.
 *
 * @see emotion_object_last_position_load()
 *
 * @ingroup Emotion_Info
  }
procedure emotion_object_last_position_save(obj:PEvas_Object);cdecl;external;
{*
 * @brief Do we have a chance to play that file
 *
 * @param file A stringshared filename that we want to know if Emotion can play.
 *
 * This just actually look at the extension of the file, it doesn't check the mime-type
 * nor if the file is actually sane. So this is just an hint for your application.
 *
 * @see emotion_object_extension_may_play_get()
  }
(* Const before type ignored *)
function emotion_object_extension_may_play_fast_get(file:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Do we have a chance to play that file
 *
 * @param file A filename that we want to know if Emotion can play.
 *
 * This just actually look at the extension of the file, it doesn't check the mime-type
 * nor if the file is actually sane. So this is just an hint for your application.
 *
 * @see emotion_object_extension_may_play_fast_get()
  }
(* Const before type ignored *)
function emotion_object_extension_may_play_get(file:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Get the actual image object that contains the pixels of the video stream
 *
 * @param obj The object which the query is being ran on.
 *
 * This function is useful when you want to get a direct access to the pixels.
 *
 * @see emotion_object_image_get()
  }
(* Const before type ignored *)
function emotion_object_image_get(obj:PEvas_Object):PEvas_Object;cdecl;external;
{*
 * @defgroup Emotion_Webcam API available for accessing webcam
 * @ingroup Emotion
  }
type
{*< Webcam description  }
  var
    EMOTION_WEBCAM_UPDATE : longint;cvar;external;
{*< Ecore_Event triggered when a new webcam is plugged or unplugged  }
    EMOTION_WEBCAM_ADD : longint;cvar;external;
{*< Ecore_Event triggered when a new webcam is plugged in @since 1.8 }
    EMOTION_WEBCAM_DEL : longint;cvar;external;
{*< Ecore_Event triggered when a webcam is unplugged @since 1.8  }
{*
 * @brief Get a list of active and available webcam
 *
 * @return the list of available webcam at the time of the call.
 *
 * It will return the current live list of webcam. It is updated before
 * triggering EMOTION_WEBCAM_UPDATE and should never be modified.
 *
 * @ingroup Emotion_Webcam
  }
(* Const before type ignored *)

function emotion_webcams_get:PEina_List;cdecl;external;
{*
 * @brief Get the human understandable name of a Webcam
 *
 * @param ew The webcam to get the name from.
 * @return the actual human readable name.
 *
 * @ingroup Emotion_Webcam
  }
(* Const before type ignored *)
(* Const before type ignored *)
function emotion_webcam_name_get(ew:PEmotion_Webcam):Pchar;cdecl;external;
{*
 * @brief Get the uri of a Webcam that will be understood by emotion
 *
 * @param ew The webcam to get the uri from.
 * @return the actual uri that emotion will later understood.
 *
 * @ingroup Emotion_Webcam
  }
(* Const before type ignored *)
(* Const before type ignored *)
function emotion_webcam_device_get(ew:PEmotion_Webcam):Pchar;cdecl;external;
{*
 * @brief Get the album artwork from file meta data tags.
 *
 * @param obj The evas object we are working with.
 * @param path The local path for the file.
 * @param type The metadata location type (GST_IMAGE_PREVIEW_IMAGE or GST_PREVIEW).
 *
 * @ingroup Emotion_Artwork
 *
 * @since 1.19
  }
(* Const before type ignored *)
(* Const before type ignored *)
function emotion_file_meta_artwork_get(obj:PEvas_Object; path:Pchar; _type:TEmotion_Artwork_Info):PEvas_Object;cdecl;external;
{*
 * @
  }
{ C++ end of extern C conditionnal removed }
{$endif}

implementation


end.
