
unit Ecore_Evas;
interface

{
  Automatically converted by H2Pas 1.0.0 from Ecore_Evas.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    Ecore_Evas.h
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
Pdword  = ^dword;
PEcore_Cocoa_Window  = ^Ecore_Cocoa_Window;
PEcore_DirectFB_Window  = ^Ecore_DirectFB_Window;
PEcore_Evas  = ^Ecore_Evas;
PEcore_Evas_Avoid_Damage_Type  = ^Ecore_Evas_Avoid_Damage_Type;
PEcore_Evas_Engine_Type  = ^Ecore_Evas_Engine_Type;
PEcore_Evas_Object_Associate_Flags  = ^Ecore_Evas_Object_Associate_Flags;
PEcore_Evas_Selection_Buffer  = ^Ecore_Evas_Selection_Buffer;
PEcore_Getopt  = ^Ecore_Getopt;
PEcore_Getopt_Desc  = ^Ecore_Getopt_Desc;
PEcore_Getopt_Value  = ^Ecore_Getopt_Value;
PEcore_Win32_Window  = ^Ecore_Win32_Window;
PEcore_WinCE_Window  = ^Ecore_WinCE_Window;
PEcore_Wl2_Window  = ^Ecore_Wl2_Window;
PEcore_Wl_Window  = ^Ecore_Wl_Window;
PEfl_Input_Device  = ^Efl_Input_Device;
PEina_Accessor  = ^Eina_Accessor;
PEina_Content  = ^Eina_Content;
PEina_Future  = ^Eina_Future;
PEina_Iterator  = ^Eina_Iterator;
PEina_List  = ^Eina_List;
PEo  = ^Eo;
PEvas  = ^Evas;
PEvas_Coord  = ^Evas_Coord;
PEvas_Object  = ^Evas_Object;
Plongint  = ^longint;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _ECORE_EVAS_H}
{$define _ECORE_EVAS_H}
{$include <Evas.h>}
{$include <Ecore_Evas_Types.h>}
{*
 * @file Ecore_Evas.h
 * @brief Evas wrapper functions.
 *
 * The following is a list of examples that partially exemplify Ecore_Evas's API:
 * @li @ref ecore_evas_callbacks_example_c
 * @li @ref ecore_evas_object_example_c
 * @li @ref ecore_evas_basics_example_c
 * @li @ref Ecore_Evas_Window_Sizes_Example_c
 * @li @ref Ecore_Evas_Buffer_Example_01_c
 * @li @ref Ecore_Evas_Buffer_Example_02_c
  }
{ FIXME:
 * to do soon:
 * - iconification api needs to work
 * - maximization api needs to work
 *
 * later:
 * - buffer back-end that renders to an evas_image_object ???
 * - qt back-end ???
 * - dfb back-end ??? (dfb's threads make this REALLY HARD)
  }
{ C++ extern C conditionnal removed }
{*
 * @defgroup Ecore_Evas_Group Ecore_Evas wrapper/helper set of functions
 * @ingroup Ecore
 *
 * Ecore evas is a set of functions that make it easy to tie together ecore's
 * main loop and input handling to evas. As such it's a natural base for EFL
 * applications. While this combination makes it easy to create the basic
 * aspects all applications need, for normal applications(ones with buttons,
 * checkboxes and layouts) one should consider using Elementary.
 *
 * Ecore evas is extremely well suited for applications that are not based on
 * widgets. It has a main loop that delivers events, does basic window handling
 * and leaves all of the drawing up to the user. This works very well if used
 * in conjunction with Edje or if doing custom drawing as, for example, is done
 * in games.
 *
 * This is a list of examples of these functions:
 * @li @ref ecore_evas_basics_example_c
 * @li @ref ecore_evas_object_example_c
 * @li @ref ecore_evas_callbacks_example_c
 * @li @ref Ecore_Evas_Window_Sizes_Example_c
 * @li @ref Ecore_Evas_Buffer_Example_01_c
 * @li @ref Ecore_Evas_Buffer_Example_02_c
 *
 * @
  }
{ these are dummy and just tell you what API levels ecore_evas supports - not if
 * the actual support is compiled in. You need to query for that separately.
  }

const
  HAVE_ECORE_EVAS_X = 1;  
  HAVE_ECORE_EVAS_FB = 1;  
  HAVE_ECORE_EVAS_X11_GL = 1;  
{#define HAVE_ECORE_EVAS_X11_16 1 }
{#define HAVE_ECORE_EVAS_DIRECTFB 1 }
  HAVE_ECORE_EVAS_WIN32 = 1;  
  HAVE_ECORE_EVAS_COCOA = 1;  
  HAVE_ECORE_EVAS_SDL = 1;  
{#define HAVE_ECORE_EVAS_WINCE 1 }
{#define HAVE_ECORE_EVAS_EWS 1 /* @deprecated */ }
  HAVE_ECORE_EVAS_PSL1GHT = 1;  
  HAVE_ECORE_EVAS_WAYLAND_SHM = 1;  
  HAVE_ECORE_EVAS_WAYLAND_EGL = 1;  
  HAVE_ECORE_EVAS_DRM = 1;  
  HAVE_ECORE_EVAS_DRM_GL = 1;  
{ @deprecated  }
{ @deprecated  }
{ @deprecated  }
type
  PEcore_Evas_Engine_Type = ^TEcore_Evas_Engine_Type;
  TEcore_Evas_Engine_Type =  Longint;
  Const
    ECORE_EVAS_ENGINE_SOFTWARE_BUFFER = 0;
    ECORE_EVAS_ENGINE_SOFTWARE_XLIB = 1;
    ECORE_EVAS_ENGINE_XRENDER_X11 = 2;
    ECORE_EVAS_ENGINE_OPENGL_X11 = 3;
    ECORE_EVAS_ENGINE_SOFTWARE_XCB = 4;
    ECORE_EVAS_ENGINE_XRENDER_XCB = 5;
    ECORE_EVAS_ENGINE_SOFTWARE_GDI = 6;
    ECORE_EVAS_ENGINE_SOFTWARE_DDRAW = 7;
    ECORE_EVAS_ENGINE_DIRECT3D = 8;
    ECORE_EVAS_ENGINE_OPENGL_GLEW = 9;
    ECORE_EVAS_ENGINE_OPENGL_COCOA = 10;
    ECORE_EVAS_ENGINE_SOFTWARE_SDL = 11;
    ECORE_EVAS_ENGINE_DIRECTFB = 12;
    ECORE_EVAS_ENGINE_SOFTWARE_FB = 13;
    ECORE_EVAS_ENGINE_SOFTWARE_8_X11 = 14;
    ECORE_EVAS_ENGINE_SOFTWARE_16_X11 = 15;
    ECORE_EVAS_ENGINE_SOFTWARE_16_DDRAW = 16;
    ECORE_EVAS_ENGINE_SOFTWARE_16_WINCE = 17;
    ECORE_EVAS_ENGINE_OPENGL_SDL = 18;
    ECORE_EVAS_ENGINE_EWS = 19;
    ECORE_EVAS_ENGINE_PSL1GHT = 20;
    ECORE_EVAS_ENGINE_WAYLAND_SHM = 21;
    ECORE_EVAS_ENGINE_WAYLAND_EGL = 22;
    ECORE_EVAS_ENGINE_DRM = 23;
    ECORE_EVAS_ENGINE_OPENGL_DRM = 24;
;
  ECORE_EVAS_OPT_NONE = 0;  
  ECORE_EVAS_OPT_INDIRECT = 1;  
  ECORE_EVAS_OPT_VSYNC = 2;  
  ECORE_EVAS_OPT_SWAP_MODE = 3;  
  ECORE_EVAS_OPT_GL_DEPTH = 4;  
  ECORE_EVAS_OPT_GL_STENCIL = 5;  
  ECORE_EVAS_OPT_GL_MSAA = 6;  
  ECORE_EVAS_OPT_LAST = 7;  
  ECORE_EVAS_SWAP_MODE_AUTO = 0;  
  ECORE_EVAS_SWAP_MODE_FULL = 1;  
  ECORE_EVAS_SWAP_MODE_COPY = 2;  
  ECORE_EVAS_SWAP_MODE_DOUBLE = 3;  
  ECORE_EVAS_SWAP_MODE_TRIPLE = 4;  
{*
 * @enum _Ecore_Evas_Avoid_Damage_Type
 * This option causes updates of the Ecore_Evas to be done on a pixmap, and
 * then copied to the window, or the pixmap used directly on the window,
 * depending on the setting.
  }
{*< every expose event triggers a new damage and consequently render of the affected area. The rendering of things happens directly on the window  }
{*< there's a pixmap where everything is rendered into, and then copied to the window. On expose events, there's no need to render things again, just to copy the exposed region to the window  }
{*<  there's the same pixmap as the previous one, but it is set as a "background pixmap" of the window. The rendered things appear directly on the window, with no need to copy anything, but would stay stored on the pixmap, so there's no need to render things again on expose events. This option can be faster than the previous one, but may lead to artifacts during resize of the window  }
type
  PEcore_Evas_Avoid_Damage_Type = ^TEcore_Evas_Avoid_Damage_Type;
  TEcore_Evas_Avoid_Damage_Type =  Longint;
  Const
    ECORE_EVAS_AVOID_DAMAGE_NONE = 0;
    ECORE_EVAS_AVOID_DAMAGE_EXPOSE = 1;
    ECORE_EVAS_AVOID_DAMAGE_BUILT_IN = 2;
;
type
  PEcore_Evas_Object_Associate_Flags = ^TEcore_Evas_Object_Associate_Flags;
  TEcore_Evas_Object_Associate_Flags =  Longint;
  Const
    ECORE_EVAS_OBJECT_ASSOCIATE_BASE = 0;
    ECORE_EVAS_OBJECT_ASSOCIATE_STACK = 1 shl 0;
    ECORE_EVAS_OBJECT_ASSOCIATE_LAYER = 1 shl 1;
    ECORE_EVAS_OBJECT_ASSOCIATE_DEL = 1 shl 2;
;
{ module setup/shutdown calls  }

function ecore_evas_engine_type_supported_get(engine:TEcore_Evas_Engine_Type):longint;cdecl;external;
{*
 * @brief Inits the Ecore_Evas system.
 *
 * @return How many times the lib has been initialized, @c 0 indicates failure.
 *
 * Set up the Evas wrapper system. Init Evas and Ecore libraries.
 *
 * @see ecore_evas_shutdown()
  }
function ecore_evas_init:longint;cdecl;external;
{*
 * @brief Shuts down the Ecore_Evas system.
 *
 * @return @c 0 if ecore evas is fully shut down, or > @c 0 if it still being used.
 *
 * This closes the Evas wrapper system down. Shut down Evas and Ecore libraries.
 *
 * @see ecore_evas_init()
  }
function ecore_evas_shutdown:longint;cdecl;external;
{*
 * @brief Sets application compositor synchronization on/off
 *
 * Turns on client+server synchronized rendering in X11.  App comp sync
 * is disabled by default, but can be turned on optionally.
 *
 * @warning This is a deprecated API. DO NOT USE.
 *
 * @param do_sync True to enable comp syncing, False to disable
  }
procedure ecore_evas_app_comp_sync_set(do_sync:TEina_Bool);cdecl;external;
{*
 * @brief Get the compositing synchronization state
 *
 * @return True if app comp sync is enabled.
 *
 * @warning This is a deprecated API. DO NOT USE.
 *
  }
function ecore_evas_app_comp_sync_get:TEina_Bool;cdecl;external;
{*
 * @brief Returns a list of supported engine names.
 *
 * @return Newly allocated list with engine names. Engine names
 * strings are internal and should be considered constants, do not
 * free or modify them, to free the list use ecore_evas_engines_free().
  }
function ecore_evas_engines_get:PEina_List;cdecl;external;
{*
 * @brief Free list returned by ecore_evas_engines_get()
 *
 * @param engines List with engine names
  }
procedure ecore_evas_engines_free(engines:PEina_List);cdecl;external;
{*
 * @brief Creates a new Ecore_Evas based on engine name and common parameters.
 *
 * @param engine_name Engine name as returned by
 *        ecore_evas_engines_get() or @c NULL to use environment variable
 *        ECORE_EVAS_ENGINE, which can be undefined and in this case
 *        this call will try to find the first working engine.
 * @param x Horizontal position of window (not supported in all engines)
 * @param y Vertical position of window (not supported in all engines)
 * @param w Width of window
 * @param h Height of window
 * @param extra_options String with extra parameter, dependent on engines
 *        or @ NULL. String is usually in the form: 'key1=value1;key2=value2'.
 *        Pay attention that when getting this from shell commands, most
 *        consider ';' as the command terminator, so you need to escape
 *        it or use quotes.
 * @return Ecore_Evas instance or @c NULL if creation failed.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function ecore_evas_new(engine_name:Pchar; x:longint; y:longint; w:longint; h:longint; 
           extra_options:Pchar):PEcore_Evas;cdecl;external;
{*
 * @brief Sets whether an Ecore_Evas has an alpha channel or not.
 *
 * @param ee The Ecore_Evas to shape
 * @param alpha @c EINA_TRUE to enable the alpha channel, @c EINA_FALSE to
 * disable it
 *
 * This function allows you to make an Ecore_Evas translucent using an
 * alpha channel. See ecore_evas_shaped_set() for details. The difference
 * between a shaped window and a window with an alpha channel is that an
 * alpha channel supports multiple levels of transparency, as opposed to
 * the 1 bit transparency of a shaped window (a pixel is either opaque, or
 * it's transparent).
 *
 * @warning Support for this depends on the underlying windowing system.
  }
procedure ecore_evas_alpha_set(ee:PEcore_Evas; alpha:TEina_Bool);cdecl;external;
{*
 * @brief Queries whether an Ecore_Evas has an alpha channel.
 *
 * @param ee The Ecore_Evas to query.
 *
 * @return @c EINA_TRUE if ee has an alpha channel, @c EINA_FALSE if it does
 * not.
 *
 * @see ecore_evas_alpha_set()
  }
(* Const before type ignored *)
function ecore_evas_alpha_get(ee:PEcore_Evas):TEina_Bool;cdecl;external;
{*
 * @brief Sets whether an Ecore_Evas has an transparent window or not.
 *
 * @param ee The Ecore_Evas to shape
 * @param transparent @c EINA_TRUE to enable the transparent window,
 * @c EINA_FALSE to disable it
 *
 * This function sets some translucency options, for more complete support see
 * ecore_evas_alpha_set().
 *
 * @warning Support for this depends on the underlying windowing system.
 *
 * @see ecore_evas_alpha_set()
  }
procedure ecore_evas_transparent_set(ee:PEcore_Evas; transparent:TEina_Bool);cdecl;external;
{*
 * @brief Queries whether an Ecore_Evas is transparent.
 *
 * @param ee The Ecore_Evas to query.
 * @return @c EINA_TRUE if ee is transparent, @c EINA_FALSE if it isn't.
 *
 * @see ecore_evas_transparent_set()
  }
(* Const before type ignored *)
function ecore_evas_transparent_get(ee:PEcore_Evas):TEina_Bool;cdecl;external;
{*
 * @brief Gets the geometry of an Ecore_Evas.
 *
 * @param ee The Ecore_Evas whose geometry y
 * @param x A pointer to an int to place the x coordinate in
 * @param y A pointer to an int to place the y coordinate in
 * @param w A pointer to an int to place the w size in
 * @param h A pointer to an int to place the h size in
 *
 * This function takes four pointers to (already allocated) ints, and places
 * the geometry of @p ee in them. If any of the parameters are not desired you
 * may pass @c NULL for them.
 *
 * @code
 * int x, y, w, h;
 * ecore_evas_geometry_get(ee, &x, &y, &w, &h);
 * @endcode
 *
 * @see ecore_evas_new()
 * @see ecore_evas_resize()
 * @see ecore_evas_move()
 * @see ecore_evas_move_resize()
  }
(* Const before type ignored *)
procedure ecore_evas_geometry_get(ee:PEcore_Evas; x:Plongint; y:Plongint; w:Plongint; h:Plongint);cdecl;external;
{*
 * @brief Gets the geometry which an Ecore_Evas was latest recently requested.
 *
 * @param ee The Ecore_Evas whose geometry y
 * @param x A pointer to an int to place the x coordinate in
 * @param y A pointer to an int to place the y coordinate in
 * @param w A pointer to an int to place the w size in
 * @param h A pointer to an int to place the h size in
 *
 * This function takes four pointers to (already allocated) ints, and places
 * the geometry which @p ee was latest recently requested . If any of the
 * parameters are not desired you may pass @c NULL for them.
 * This function can represent recently requested geometry.
 * ecore_evas_geometry_get function returns the value is updated after engine
 * finished request. By comparison, ecore_evas_request_geometry_get returns
 * recently requested value.
 *
 * @code
 * int x, y, w, h;
 * ecore_evas_request_geometry_get(ee, &x, &y, &w, &h);
 * @endcode
 *
 * @since 1.1
  }
(* Const before type ignored *)
procedure ecore_evas_request_geometry_get(ee:PEcore_Evas; x:Plongint; y:Plongint; w:Plongint; h:Plongint);cdecl;external;
{*
 * @brief Sets the Ecore_Evas window focus for the default seat.
 *
 * @param ee The Ecore_Evas
 * @param on @c EINA_TRUE for focus, @c EINA_FALSE to defocus.
 *
 * This function focuses @p ee if @p on is @c EINA_TRUE, or unfocuses @p ee if
 * @p on is @c EINA_FALSE.
 *
 * @warning Support for this depends on the underlying windowing system.
 * @see ecore_evas_focus_device_set()
  }
procedure ecore_evas_focus_set(ee:PEcore_Evas; on:TEina_Bool);cdecl;external;
{*
 * @brief Queries whether the default seat has the Ecore_Evas focus.
 *
 * @param ee The Ecore_Evas to set
 * @return @c EINA_TRUE if @p ee if focused, @c EINA_FALSE if not.
 *
 * @see ecore_evas_focus_set()
 * @see ecore_evas_focus_device_get()
  }
(* Const before type ignored *)
function ecore_evas_focus_get(ee:PEcore_Evas):TEina_Bool;cdecl;external;
{*
 * @brief Sets the Ecore_Evas windows focus for a given seat.
 *
 * @param ee The Ecore_Evas
 * @param seat An Efl_Input_Device that represents the seat or @c NULL for the default seat.
 * @param on @c EINA_TRUE for focus, @c EINA_FALSE to defocus.
 *
 * This function focuses @p ee if @p on is @c EINA_TRUE, or unfocuses @p ee if
 * @p on is @c EINA_FALSE.
 *
 * @warning Support for this depends on the underlying windowing system.
 * @see ecore_evas_focus_device_get()
 * @since 1.19
  }
procedure ecore_evas_focus_device_set(ee:PEcore_Evas; seat:PEo; on:TEina_Bool);cdecl;external;
{*
 * @brief Queries whether an Ecore_Evas' window is focused or not.
 *
 * @param ee The Ecore_Evas to set
 * @param seat An Efl_Input_Device that represents the seat or @c NULL for the default seat.
 * @return @c EINA_TRUE if @p ee if focused, @c EINA_FALSE if not.
 *
 * @see ecore_evas_focus_device_set()
 * @since 1.19
  }
(* Const before type ignored *)
function ecore_evas_focus_device_get(ee:PEcore_Evas; seat:PEo):TEina_Bool;cdecl;external;
{*
 * @brief Iconifies or uniconifies an Ecore_Evas' window.
 *
 * @param ee The Ecore_Evas
 * @param on @c EINA_TRUE to iconify, @c EINA_FALSE to uniconify.
 *
 * This function iconifies @p ee if @p on is @c EINA_TRUE, or uniconifies @p ee
 * if @p on is @c EINA_FALSE.
 *
 * @note Iconify and minimize are synonyms.
 *
 * @warning Support for this depends on the underlying windowing system.
  }
procedure ecore_evas_iconified_set(ee:PEcore_Evas; on:TEina_Bool);cdecl;external;
{*
 * @brief Queries whether an Ecore_Evas' window is iconified or not.
 *
 * @param ee The Ecore_Evas to set
 * @return @c EINA_TRUE if @p ee is iconified, @c EINA_FALSE if not.
 *
 * @note Iconify and minimize are synonyms.
 *
 * @see ecore_evas_iconified_set()
  }
(* Const before type ignored *)
function ecore_evas_iconified_get(ee:PEcore_Evas):TEina_Bool;cdecl;external;
{*
 * @brief Sets whether an Ecore_Evas' window is borderless or not.
 *
 * @param ee The Ecore_Evas
 * @param on @c EINA_TRUE for borderless, @c EINA_FALSE for bordered.
 *
 * This function makes @p ee borderless if @p on is @c EINA_TRUE, or bordered
 * if @p on is @c EINA_FALSE.
 *
 * @warning Support for this depends on the underlying windowing system.
  }
procedure ecore_evas_borderless_set(ee:PEcore_Evas; on:TEina_Bool);cdecl;external;
{*
 * @brief Queries whether an Ecore_Evas' window is borderless or not.
 *
 * @param ee The Ecore_Evas to set
 * @return @c EINA_TRUE if @p ee is borderless, @c EINA_FALSE if not.
 *
 * @see ecore_evas_borderless_set()
  }
(* Const before type ignored *)
function ecore_evas_borderless_get(ee:PEcore_Evas):TEina_Bool;cdecl;external;
{*
 * @brief Sets whether or not an Ecore_Evas' window is fullscreen.
 *
 * @param ee The Ecore_Evas
 * @param on @c EINA_TRUE fullscreen, @c EINA_FALSE not.
 *
 * This function causes @p ee to be fullscreen if @p on is @c EINA_TRUE, or
 * not if @p on is @c EINA_FALSE.
 *
 * @warning Support for this depends on the underlying windowing system.
  }
procedure ecore_evas_fullscreen_set(ee:PEcore_Evas; on:TEina_Bool);cdecl;external;
{*
 * @brief Queries whether an Ecore_Evas' window is fullscreen or not.
 *
 * @param ee The Ecore_Evas to set
 * @return @c EINA_TRUE if @p ee is fullscreen, @c EINA_FALSE if not.
 *
 * @see ecore_evas_fullscreen_set()
  }
(* Const before type ignored *)
function ecore_evas_fullscreen_get(ee:PEcore_Evas):TEina_Bool;cdecl;external;
{*
 * @brief Sets another window that this window is a group member of.
 *
 * @param ee The Ecore_Evas
 * @param ee_group The other group member
 *
 * If @p ee_group is @c NULL, @p ee is removed from the group, otherwise it is
 * added. Note that if you free the @p ee_group canvas before @p ee, then
 * getting the group canvas with ecore_evas_window_group_get() will return
 * an invalid handle.
 *
 * @warning Support for this depends on the underlying windowing system.
 * @since 1.2
  }
(* Const before type ignored *)
procedure ecore_evas_window_group_set(ee:PEcore_Evas; ee_group:PEcore_Evas);cdecl;external;
{*
 * @brief Gets the canvas group set.
 *
 * This returns the handle set by ecore_evas_window_group_set().
 *
 * @param ee The Ecore_Evas to set
 * @return The Canvas group handle
 *
 * @see ecore_evas_window_group_set()
 * @since 1.2
  }
(* Const before type ignored *)
(* Const before type ignored *)
function ecore_evas_window_group_get(ee:PEcore_Evas):PEcore_Evas;cdecl;external;
{*
 * @brief Sets the aspect ratio of a canvas window.
 *
 * @param ee The Ecore_Evas
 * @param aspect The aspect ratio (width divided by height), or 0 to disable
 *
 * This sets the desired aspect ratio of a canvas window
 *
 * @warning Support for this depends on the underlying windowing system.
 * @since 1.2
  }
procedure ecore_evas_aspect_set(ee:PEcore_Evas; aspect:Tdouble);cdecl;external;
{*
 * @brief Gets the aspect ratio of a canvas window.
 *
 * This returns the value set by ecore_evas_aspect_set().
 *
 * @param ee The Ecore_Evas to set
 * @return The aspect ratio
 *
 * @see ecore_evas_aspect_set()
 * @since 1.2
  }
(* Const before type ignored *)
function ecore_evas_aspect_get(ee:PEcore_Evas):Tdouble;cdecl;external;
{*
 * @brief Sets The urgent hint flag.
 *
 * @param ee The Ecore_Evas
 * @param urgent The urgent state flag
 *
 * This sets the "urgent" state hint on a window so the desktop environment
 * can highlight it somehow.
 *
 * @warning Support for this depends on the underlying windowing system.
 * @since 1.2
  }
procedure ecore_evas_urgent_set(ee:PEcore_Evas; urgent:TEina_Bool);cdecl;external;
{*
 * @brief Gets the urgent state on the canvas window.
 *
 * This returns the value set by ecore_evas_urgent_set()
 *
 * @param ee The Ecore_Evas to set
 * @return The urgent state set
 *
 * @see ecore_evas_urgent_set()
 * @since 1.2
  }
(* Const before type ignored *)
function ecore_evas_urgent_get(ee:PEcore_Evas):TEina_Bool;cdecl;external;
{*
 * @brief Sets the modal state flag on the canvas window.
 *
 * @param ee The Ecore_Evas
 * @param modal The modal hint flag
 *
 * This hints if the window should be modal (eg if it is also transient
 * for another window, the other window will maybe be denied focus by
 * the desktop window manager).
 *
 * @warning Support for this depends on the underlying windowing system.
 * @since 1.2
  }
procedure ecore_evas_modal_set(ee:PEcore_Evas; modal:TEina_Bool);cdecl;external;
{*
 * @brief Gets The modal flag.
 *
 * This returns the value set by ecore_evas_modal_set().
 *
 * @param ee The Ecore_Evas to set
 * @return The modal flag
 *
 * @see ecore_evas_modal_set()
 * @since 1.2
  }
(* Const before type ignored *)
function ecore_evas_modal_get(ee:PEcore_Evas):TEina_Bool;cdecl;external;
{*
 * @brief Sets the "i demand attention" flag on a canvas window.
 *
 * @param ee The Ecore_Evas
 * @param demand The flag state to set
 *
 * A window may demand attention now (eg you must enter a password before
 * continuing), and so it may flag a window with this.
 *
 * @warning Support for this depends on the underlying windowing system.
 * @since 1.2
  }
procedure ecore_evas_demand_attention_set(ee:PEcore_Evas; demand:TEina_Bool);cdecl;external;
{*
 * @brief Gets the "i demand attention" flag.
 *
 * This returns the value set by ecore_evas_demand_attention_set().
 *
 * @param ee The Ecore_Evas to set
 * @return The "i demand attention" flag
 *
 * @see ecore_evas_demand_attention_set()
 * @since 1.2
  }
(* Const before type ignored *)
function ecore_evas_demand_attention_get(ee:PEcore_Evas):TEina_Bool;cdecl;external;
{*
 * @brief Sets the "focus skip" flag.
 *
 * @param ee The Ecore_Evas
 * @param skip The "focus skip" state to set.
 *
 * A window may not want to accept focus, be in the taskbar, pager etc.
 * sometimes (example for a small notification window that hovers around
 * a taskbar or panel, or hovers around a window until some activity
 * dismisses it).
 *
 * @warning Support for this depends on the underlying windowing system.
 * @since 1.2
  }
procedure ecore_evas_focus_skip_set(ee:PEcore_Evas; skip:TEina_Bool);cdecl;external;
{*
 * @brief Gets the "focus skip" flag.
 *
 * This returns the value set by ecore_evas_focus_skip_set().
 *
 * @param ee The Ecore_Evas to set
 * @return The "focus skip" flag
 *
 * @see ecore_evas_focus_skip_set()
 * @since 1.2
  }
(* Const before type ignored *)
function ecore_evas_focus_skip_get(ee:PEcore_Evas):TEina_Bool;cdecl;external;
{*
 * @brief Sets if this evas should ignore @b all events.
 *
 * @param ee The Ecore_Evas whose window's to ignore events.
 * @param ignore The Ecore_Evas new ignore state.
 *
 * @warning Support for this depends on the underlying windowing system.
  }
procedure ecore_evas_ignore_events_set(ee:PEcore_Evas; ignore:TEina_Bool);cdecl;external;
{*
 * @brief Returns the ignore state of an Ecore_Evas' window.
 *
 * @param ee The Ecore_Evas whose window's ignore events state is returned.
 * @return The Ecore_Evas window's ignore state.
 *
 * @see ecore_evas_ignore_events_set()
  }
(* Const before type ignored *)
function ecore_evas_ignore_events_get(ee:PEcore_Evas):TEina_Bool;cdecl;external;
{*
 * @brief Queries whether an Ecore_Evas' window is visible or not.
 *
 * @param ee The Ecore_Evas to query.
 * @return @c 1 if @p ee is visible, @c 0 if not.
 *
 * @see ecore_evas_show()
 * @see ecore_evas_hide()
  }
(* Const before type ignored *)
function ecore_evas_visibility_get(ee:PEcore_Evas):longint;cdecl;external;
{*
 * @brief Sets the layer of an Ecore_Evas' window.
 *
 * @param ee The Ecore_Evas
 * @param layer The layer to put @p ee on.
 *
 * This function moves @p ee to the layer @p layer.
 *
 * @warning Support for this depends on the underlying windowing system.
 *
 * @see ecore_evas_lower()
 * @see ecore_evas_raise()
  }
procedure ecore_evas_layer_set(ee:PEcore_Evas; layer:longint);cdecl;external;
{*
 * @brief Gets the layer of an Ecore_Evas' window.
 *
 * @param ee The Ecore_Evas to set
 * @return The layer @p ee's window is on
 *
 * @see ecore_evas_layer_set()
 * @see ecore_evas_lower()
 * @see ecore_evas_raise()
  }
(* Const before type ignored *)
function ecore_evas_layer_get(ee:PEcore_Evas):longint;cdecl;external;
{*
 * @brief Maximizes (or unmaximizes) an Ecore_Evas' window.
 *
 * @param ee The Ecore_Evas
 * @param on @c EINA_TRUE to maximize, @c EINA_FALSE to unmaximize
 *
 * This function maximizes @p ee if @p on is @c EINA_TRUE, or unmaximizes @p ee
 * if @p on is @c EINA_FALSE.
 *
 * @warning Support for this depends on the underlying windowing system.
  }
procedure ecore_evas_maximized_set(ee:PEcore_Evas; on:TEina_Bool);cdecl;external;
{*
 * @brief Queries whether an Ecore_Evas' window is maximized or not.
 *
 * @param ee The Ecore_Evas to set
 * @return @c EINA_TRUE if @p ee is maximized, @c EINA_FALSE if not.
 *
 * @see ecore_evas_maximized_set()
  }
(* Const before type ignored *)
function ecore_evas_maximized_get(ee:PEcore_Evas):TEina_Bool;cdecl;external;
{*
 * @brief Queries if the underlying windowing system supports the window profile.
 *
 * @param ee The Ecore_Evas
 * @return @c EINA_TRUE if the window profile is supported, @c EINA_FALSE otherwise.
 *
 * @warning Support for this depends on the underlying windowing system.
 * @since 1.8.0
  }
(* Const before type ignored *)
function ecore_evas_window_profile_supported_get(ee:PEcore_Evas):TEina_Bool;cdecl;external;
{*
 * @brief Sets the window profile.
 *
 * @param ee The Ecore_Evas to set
 * @param profile The string value of the window profile
 *
 * @warning Support for this depends on the underlying windowing system.
 * @since 1.8.0
  }
(* Const before type ignored *)
procedure ecore_evas_window_profile_set(ee:PEcore_Evas; profile:Pchar);cdecl;external;
{*
 * @brief Gets the window profile.
 *
 * @param ee The Ecore_Evas to get the window profile from.
 * @return The string value of the window profile, or NULL if none exists
 *
 * @warning Support for this depends on the underlying windowing system.
 * @since 1.8.0
  }
(* Const before type ignored *)
(* Const before type ignored *)
function ecore_evas_window_profile_get(ee:PEcore_Evas):Pchar;cdecl;external;
{*
 * @brief Sets the array of available window profiles.
 *
 * @param ee The Ecore_Evas to set
 * @param profiles The string array of available window profiles
 * @param count The number of members in profiles
 *
 * @warning Support for this depends on the underlying windowing system.
 * @since 1.8.0
  }
(* Const before type ignored *)
(* Const before type ignored *)
procedure ecore_evas_window_available_profiles_set(ee:PEcore_Evas; profiles:PPchar; count:dword);cdecl;external;
{*
 * @brief Gets the array of available window profiles.
 *
 * @param ee The Ecore_Evas to get available window profiles from.
 * @param profiles Where to return the string array of available window profiles
 * @param count Where to return the number of members in profiles
 * @return @c EINA_TRUE if available window profiles exist, @c EINA_FALSE otherwise
 *
 * @warning Support for this depends on the underlying windowing system.
 * @since 1.8.0
  }
function ecore_evas_window_available_profiles_get(ee:PEcore_Evas; profiles:PPPchar; count:Pdword):TEina_Bool;cdecl;external;
{*
 * @brief Queries if the underlying windowing system supports the window manager rotation.
 *
 * @param ee The Ecore_Evas
 * @return @c EINA_TRUE if the window manager rotation is supported, @c EINA_FALSE otherwise.
 *
 * @warning Support for this depends on the underlying windowing system.
 * @since 1.9.0
  }
(* Const before type ignored *)
function ecore_evas_wm_rotation_supported_get(ee:PEcore_Evas):TEina_Bool;cdecl;external;
{*
 * @brief Sets the preferred rotation hint.
 *
 * @param ee The Ecore_Evas to set
 * @param rotation Value to set the preferred rotation hint
 *
 * @warning Support for this depends on the underlying windowing system.
 * @since 1.9.0
  }
procedure ecore_evas_wm_rotation_preferred_rotation_set(ee:PEcore_Evas; rotation:longint);cdecl;external;
{*
 * @brief Gets the preferred rotation hint.
 *
 * @param ee The Ecore_Evas to get the preferred rotation hint from.
 * @return The preferred rotation hint, @c -1 on failure.
 *
 * @warning Support for this depends on the underlying windowing system.
 * @since 1.9.0
  }
(* Const before type ignored *)
function ecore_evas_wm_rotation_preferred_rotation_get(ee:PEcore_Evas):longint;cdecl;external;
{*
 * @brief Sets the array of available window rotations.
 *
 * @param ee The Ecore_Evas to set
 * @param rotations The integer array of available window rotations
 * @param count The number of members in rotations
 *
 * @warning Support for this depends on the underlying windowing system.
 * @since 1.9.0
  }
(* Const before type ignored *)
procedure ecore_evas_wm_rotation_available_rotations_set(ee:PEcore_Evas; rotations:Plongint; count:dword);cdecl;external;
{*
 * @brief Gets the array of available window rotations.
 *
 * @param ee The Ecore_Evas to get available window rotations from.
 * @param rotations Where to return the integer array of available window rotations
 * @param count Where to return the number of members in rotations
 * @return @c EINA_TRUE if available window rotations exist, @c EINA_FALSE otherwise
 *
 * @warning Support for this depends on the underlying windowing system.
 * @since 1.9.0
  }
(* Const before type ignored *)
function ecore_evas_wm_rotation_available_rotations_get(ee:PEcore_Evas; rotations:PPlongint; count:Pdword):TEina_Bool;cdecl;external;
{*
 * @brief Sets manual rotation done mode of Ecore_Evas's window.
 *
 * @param ee The Ecore_Evas
 * @param set If true, the window manager will not rotate the Ecore_Evas's window until
 * the rotation done event is received by ecore_evas_wm_rotation_manual_rotation_done.
 * If false, the manual rotation mode is disabled.
 *
 * @since 1.9.0
  }
procedure ecore_evas_wm_rotation_manual_rotation_done_set(ee:PEcore_Evas; set:TEina_Bool);cdecl;external;
{*
 * @brief Gets manual rotation done mode of Ecore_Evas's window.
 *
 * @param ee The Ecore_Evas
 * @return If true, the manual rotation done mode is enabled
 *
 * @since 1.9.0
  }
(* Const before type ignored *)
function ecore_evas_wm_rotation_manual_rotation_done_get(ee:PEcore_Evas):TEina_Bool;cdecl;external;
{*
 * @brief Sets rotation finish manually.
 *
 * @param ee The Ecore_Evas
 *
 * @since 1.9.0
  }
procedure ecore_evas_wm_rotation_manual_rotation_done(ee:PEcore_Evas);cdecl;external;
{*
 * @brief Gets the list of supported auxiliary hint strings.
 *
 * @param ee The Ecore_Evas
 * @return List of supported auxiliary hint strings.
 *
 * @note Do not change the returned list of its contents. Auxiliary hint
 * strings are internal and should be considered constants, do not free or
 * modify them.
 * @warning Support for this depends on the underlying windowing system.
 *
 * The window auxiliary hint is the value which is used to decide which actions should
 * be made available to the user by the window manager. If you want to set a specific hint
 * on your window, then you should check whether it exists in the supported auxiliary
 * hints that are registered in the root window by the window manager. Once you've added
 * an auxiliary hint, you can get a new ID which is used to change value and delete hint.
 * The window manager sends the response message to the application on receiving auxiliary
 * hint change event. A list of auxiliary hints within the Ecore_Evas has this format:
 * ID:HINT:VALUE,ID:HINT:VALUE,...
 *
 * @since 1.10.0
  }
(* Const before type ignored *)
(* Const before type ignored *)
function ecore_evas_aux_hints_supported_get(ee:PEcore_Evas):PEina_List;cdecl;external;
{*
 * @brief Gets the list of allowed auxiliary hint IDs.
 *
 * @param ee The Ecore_Evas
 * @return List of allowed auxiliary hint IDs.
 *
 * @note This function is low level. Instead of using it directly, consider
 * using the callback mechanism in Elementary such as "aux,hint,allowed".
 * @warning Support for this depends on the underlying windowing system.
 *
 * @since 1.10.0
  }
(* Const before type ignored *)
function ecore_evas_aux_hints_allowed_get(ee:PEcore_Evas):PEina_List;cdecl;external;
{*
 * @brief Creates an auxiliary hint of the Ecore_Evas.
 *
 * @param ee The Ecore_Evas
 * @param hint The auxiliary hint string.
 * @param val The value string.
 * @return The ID of created auxiliary hint, or @c -1 on failure.
 *
 * @warning Support for this depends on the underlying windowing system.
 *
 * @since 1.10.0
  }
(* Const before type ignored *)
(* Const before type ignored *)
function ecore_evas_aux_hint_add(ee:PEcore_Evas; hint:Pchar; val:Pchar):longint;cdecl;external;
{*
 * @brief Deletes an auxiliary hint of the Ecore_Evas.
 *
 * @param ee The Ecore_Evas
 * @param id The ID of the auxiliary hint.
 * @return @c EINA_TRUE if no error occurred, @c EINA_FALSE otherwise.
 *
 * @warning Support for this depends on the underlying windowing system.
 *
 * @since 1.10.0
  }
(* Const before type ignored *)
function ecore_evas_aux_hint_del(ee:PEcore_Evas; id:longint):TEina_Bool;cdecl;external;
{*
 * @brief Changes a value of the auxiliary hint.
 *
 * @param ee The Ecore_Evas
 * @param id The auxiliary hint ID.
 * @param val The value string to be set.
 * @return @c EINA_TRUE if no error occurred, @c EINA_FALSE otherwise.
 *
 * @warning Support for this depends on the underlying windowing system.
 *
 * @since 1.10.0
  }
(* Const before type ignored *)
(* Const before type ignored *)
function ecore_evas_aux_hint_val_set(ee:PEcore_Evas; id:longint; val:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Gets a value of the auxiliary hint.
 *
 * @param ee The Ecore_Evas
 * @param id The auxiliary hint ID.
 * @return The string value of the auxiliary hint ID, or NULL if none exists
 *
 * @warning Support for this depends on the underlying windowing system.
 *
 * @since 1.15
  }
(* Const before type ignored *)
(* Const before type ignored *)
function ecore_evas_aux_hint_val_get(ee:PEcore_Evas; id:longint):Pchar;cdecl;external;
{*
 * @brief Gets a ID of the auxiliary hint string.
 *
 * @param ee The Ecore_Evas
 * @param hint The auxiliary hint string.
 * @return The ID of the auxiliary hint string, or @c -1 if none exists
 *
 * @warning Support for this depends on the underlying windowing system.
 *
 * @since 1.15
  }
(* Const before type ignored *)
(* Const before type ignored *)
function ecore_evas_aux_hint_id_get(ee:PEcore_Evas; hint:Pchar):longint;cdecl;external;
{*
 * @brief Sends message to parent ecore.
 *
 * @param ee The Ecore_Evas to set
 * @param msg_domain The domain of message
 * @param msg_id The id of message
 * @param data The data of message
 * @param size The size of message data
 *
 * @warning Support for this depends on the underlying windowing system.
 * @since 1.8.0
 *
 * @see ecore_evas_msg_send()
 * @see ecore_evas_callback_msg_parent_handle_set()
 * @see eecore_evas_callback_msg_handle_set()
 *
 * This is a list of examples of these functions:
 * @li ecore_evas_extn_socket_example
 * @li ecore_evas_extn_plug_example
  }
procedure ecore_evas_msg_parent_send(ee:PEcore_Evas; msg_domain:longint; msg_id:longint; data:pointer; size:longint);cdecl;external;
{*
 * @brief Sends message to child ecore.
 *
 * @param ee The Ecore_Evas to set
 * @param msg_domain The domain of message
 * @param msg_id The id of message
 * @param data The data of message
 * @param size The size of message data
 *
 * @warning Support for this depends on the underlying windowing system.
 * @since 1.8.0
 *
 * @see ecore_evas_msg_parent_send()
 * @see ecore_evas_callback_msg_parent_handle_set()
 * @see eecore_evas_callback_msg_handle_set()
  }
procedure ecore_evas_msg_send(ee:PEcore_Evas; msg_domain:longint; msg_id:longint; data:pointer; size:longint);cdecl;external;
{*
 * @brief Sets a callback for parent Ecore_Evas message.
 *
 * @param ee The Ecore_Evas to set callbacks on
 * @param func_parent_handle The handle to be called when message arrive.
 *
 * @warning Support for this depends on the underlying windowing system.
 * @since 1.8.0
 *
 * @see ecore_evas_msg_parent_send()
 * @see ecore_evas_msg_send()
 * @see eecore_evas_callback_msg_handle_set()
  }
procedure ecore_evas_callback_msg_parent_handle_set(ee:PEcore_Evas; func_parent_handle:procedure (ee:PEcore_Evas; msg_domain:longint; msg_id:longint; data:pointer; size:longint));cdecl;external;
{*
 * @brief Sets a callback for child Ecore_Evas message.
 *
 * @param ee The Ecore_Evas to set callbacks on
 * @param func_handle  The handle to be called when message arrive
 *
 * @warning Support for this depends on the underlying windowing system.
 * @since 1.8.0
 *
 * @see ecore_evas_msg_parent_send()
 * @see ecore_evas_msg_send()
 * @see ecore_evas_callback_msg_parent_handle_set()
  }
procedure ecore_evas_callback_msg_handle_set(ee:PEcore_Evas; func_handle:procedure (ee:PEcore_Evas; msg_domain:longint; msg_id:longint; data:pointer; size:longint));cdecl;external;
{*
 * @brief Moves an Ecore_Evas.
 *
 * @param ee The Ecore_Evas to move
 * @param x The x coordinate to move to
 * @param y The y coordinate to move to
 *
 * This moves @p ee to the screen coordinates (@p x, @p y)
 *
 * @warning Support for this depends on the underlying windowing system.
 *
 * @see ecore_evas_new()
 * @see ecore_evas_resize()
 * @see ecore_evas_move_resize()
  }
procedure ecore_evas_move(ee:PEcore_Evas; x:longint; y:longint);cdecl;external;
{*
 * @brief Resizes an Ecore_Evas.
 *
 * @param ee The Ecore_Evas to move
 * @param w The w coordinate to resize to
 * @param h The h coordinate to resize to
 *
 * This resizes @p ee to @p w x @p h.
 *
 * @warning Support for this depends on the underlying windowing system.
 *
 * @see ecore_evas_new()
 * @see ecore_evas_move()
 * @see ecore_evas_move_resize()
  }
procedure ecore_evas_resize(ee:PEcore_Evas; w:longint; h:longint);cdecl;external;
{*
 * @brief Moves and resizes an Ecore_Evas.
 *
 * @param ee The Ecore_Evas to move and resize
 * @param x The x coordinate to move to
 * @param y The y coordinate to move to
 * @param w The w coordinate to resize to
 * @param h The h coordinate to resize to
 *
 * This moves @p ee to the screen coordinates (@p x, @p y) and resizes
 * it to @p w x @p h.
 *
 * @warning Support for this depends on the underlying windowing system.
 *
 * @see ecore_evas_new()
 * @see ecore_evas_move()
 * @see ecore_evas_resize()
  }
procedure ecore_evas_move_resize(ee:PEcore_Evas; x:longint; y:longint; w:longint; h:longint);cdecl;external;
{*
 * @brief Sets the rotation of an Ecore_Evas' window.
 *
 * @param ee The Ecore_Evas
 * @param rot The angle (in degrees) of rotation
 *
 * The allowed values of @p rot depend on the engine being used. Most only
 * allow multiples of 90.
 *
 * @warning Support for this depends on the underlying windowing system.
 *
 * @see ecore_evas_rotation_with_resize_set()
  }
procedure ecore_evas_rotation_set(ee:PEcore_Evas; rot:longint);cdecl;external;
{*
 * @brief Sets the rotation of an Ecore_Evas' window.
 *
 * @param ee The Ecore_Evas
 * @param rot The angle (in degrees) of rotation.
 *
 * Like ecore_evas_rotation_set(), but it also resizes the window's content so
 * that it fits inside the current window geometry.
 *
 * @warning Support for this depends on the underlying windowing system.
 *
 * @see ecore_evas_rotation_set()
  }
procedure ecore_evas_rotation_with_resize_set(ee:PEcore_Evas; rot:longint);cdecl;external;
{*
 * @brief Gets the rotation of an Ecore_Evas' window
 *
 * @param ee The Ecore_Evas
 * @return The angle (in degrees) of rotation
 *
 * @see ecore_evas_rotation_set()
 * @see ecore_evas_rotation_with_resize_set()
  }
(* Const before type ignored *)
function ecore_evas_rotation_get(ee:PEcore_Evas):longint;cdecl;external;
{*
 * @brief Raises an Ecore_Evas' window.
 *
 * @param ee The Ecore_Evas to raise.
 *
 * This functions raises the Ecore_Evas to the front.
 *
 * @warning Support for this depends on the underlying windowing system.
 *
 * @see ecore_evas_lower()
 * @see ecore_evas_layer_set()
  }
procedure ecore_evas_raise(ee:PEcore_Evas);cdecl;external;
{*
 * @brief Lowers an Ecore_Evas' window.
 *
 * @param ee The Ecore_Evas to raise.
 *
 * This functions lowers the Ecore_Evas to the back.
 *
 * @warning Support for this depends on the underlying windowing system.
 *
 * @see ecore_evas_raise()
 * @see ecore_evas_layer_set()
  }
procedure ecore_evas_lower(ee:PEcore_Evas);cdecl;external;
{*
 * @brief Sets the title of an Ecore_Evas' window.
 *
 * @param ee The Ecore_Evas whose title you wish to set.
 * @param t The title
 *
 * This function sets the title of @p ee to @p t.
 *
 * @warning Support for this depends on the underlying windowing system.
  }
(* Const before type ignored *)
procedure ecore_evas_title_set(ee:PEcore_Evas; t:Pchar);cdecl;external;
{*
 * @brief Gets the title of an Ecore_Evas' window.
 *
 * @param ee The Ecore_Evas whose title you wish to get.
 * @return The title of @p ee.
 *
 * @see ecore_evas_title_set()
  }
(* Const before type ignored *)
(* Const before type ignored *)
function ecore_evas_title_get(ee:PEcore_Evas):Pchar;cdecl;external;
{*
 * @brief Sets the name and class of an Ecore_Evas' window.
 *
 * @param ee the Ecore_Evas
 * @param n The name
 * @param c The class
 *
 * This function sets the name of @p ee to @p n, and its class to @p c. The
 * meaning of @p name and @p class depends on the underlying windowing system.
 *
 * @warning Support for this depends on the underlying windowing system.
  }
(* Const before type ignored *)
(* Const before type ignored *)
procedure ecore_evas_name_class_set(ee:PEcore_Evas; n:Pchar; c:Pchar);cdecl;external;
{*
 * @brief Gets the name and class of an Ecore_Evas' window.
 *
 * @param ee The Ecore_Evas to query.
 * @param n A pointer to a string to place the name in.
 * @param c A pointer to a string to place the class in.
 *
 * This function gets the name of @p ee into @p n, and its class into
 * @p c.
 *
 * @see ecore_evas_name_class_set()
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure ecore_evas_name_class_get(ee:PEcore_Evas; n:PPchar; c:PPchar);cdecl;external;
{*
 * @brief Returns a pointer to the underlying window.
 *
 * @param ee The Ecore_Evas whose window is desired.
 * @return A pointer to the underlying window.
 *
 * @warning Support for this depends on the underlying windowing system.
  }
(* Const before type ignored *)
function ecore_evas_window_get(ee:PEcore_Evas):TEcore_Window;cdecl;external;
{ engine/target specific init calls  }
{*
 * @brief Creates Ecore_Evas using software x11.
 *
 * @param disp_name The name of the Ecore_Evas to be created.
 * @param parent The parent of the Ecore_Evas to be created.
 * @param x The X coordinate to be used.
 * @param y The Y coordinate to be used.
 * @param w The width of the Ecore_Evas to be created.
 * @param h The height of the Ecore_Evas to be created.
 * @return A handle to the created Ecore_Evas.
 *
 * @note If ecore is not compiled with support for x11 then nothing is done and NULL is returned.
  }
(* Const before type ignored *)
function ecore_evas_software_x11_new(disp_name:Pchar; parent:TEcore_X_Window; x:longint; y:longint; w:longint; 
           h:longint):PEcore_Evas;cdecl;external;
{*
 * @brief Gets the window from Ecore_Evas using software x11.
 *
 * @param ee The Ecore_Evas from which to get the window.
 * @return The window of type Ecore_X_Window.
 *
 * @note If ecore is not compiled with support for x11 or if @p ee was not
 * created with ecore_evas_software_x11_new() then nothing is done and
 * 0 is returned.
  }
(* Const before type ignored *)
function ecore_evas_software_x11_window_get(ee:PEcore_Evas):TEcore_X_Window;cdecl;external;
{*
 * @brief Sets the direct_resize of Ecore_Evas using software x11.
 *
 * @param ee The Ecore_Evas in which to set direct resize.
 * @param on Enables the resize of Ecore_Evas if equals @c EINA_TRUE, disables if equals @c EINA_FALSE.
 *
 * @note If ecore is not compiled with support for x11 then nothing is done.
  }
procedure ecore_evas_software_x11_direct_resize_set(ee:PEcore_Evas; on:TEina_Bool);cdecl;external;
{*
 * @brief Gets if the Ecore_Evas is being directly resized using software x11.
 *
 * @param ee The Ecore_Evas from which to get direct resize.
 * @return @c EINA_TRUE if the resize was managed directly, otherwise return @c EINA_FALSE.
 *
 * @note If ecore is not compiled with support for x11 then nothing is done and EINA_FALSE is returned.
  }
(* Const before type ignored *)
function ecore_evas_software_x11_direct_resize_get(ee:PEcore_Evas):TEina_Bool;cdecl;external;
{*
 * @brief Adds an extra window on Ecore_Evas using software x11.
 *
 * @param ee The Ecore_Evas for which to add the window.
 * @param win The window to be added to the Ecore_Evas.
 *
 * @note If ecore is not compiled with support for x11 then nothing is done.
  }
procedure ecore_evas_software_x11_extra_event_window_add(ee:PEcore_Evas; win:TEcore_X_Window);cdecl;external;
{*
 * @brief Creates a new Ecore_Evas which does not contain an XWindow. It will
 * only contain an XPixmap to render to
 *
 * @warning The XPixmap ID can change with every frame after it is rendered,
 * so you should ALWAYS call ecore_evas_software_x11_pixmap_get when you
 * need the current pixmap id.
 *
 * @since 1.8
  }
(* Const before type ignored *)
function ecore_evas_software_x11_pixmap_new(disp_name:Pchar; parent:TEcore_X_Window; x:longint; y:longint; w:longint; 
           h:longint):PEcore_Evas;cdecl;external;
{*
 * @brief Returns the underlying Ecore_X_Pixmap used in the Ecore_Evas.
 *
 * @param ee The Ecore_Evas whose pixmap is desired.
 * @return The underlying Ecore_X_Pixmap
 *
 * @warning Support for this depends on the underlying windowing system.
 *
 * @warning The XPixmap ID can change with every frame after it is rendered,
 * so you should ALWAYS call ecore_evas_software_x11_pixmap_get when you
 * need the current pixmap id.
 *
 * @since 1.8
  }
(* Const before type ignored *)
function ecore_evas_software_x11_pixmap_get(ee:PEcore_Evas):TEcore_X_Pixmap;cdecl;external;
const
  ECORE_EVAS_GL_X11_OPT_NONE = ECORE_EVAS_OPT_NONE;  
  ECORE_EVAS_GL_X11_OPT_INDIRECT = ECORE_EVAS_OPT_INDIRECT;  
  ECORE_EVAS_GL_X11_OPT_VSYNC = ECORE_EVAS_OPT_VSYNC;  
  ECORE_EVAS_GL_X11_OPT_SWAP_MODE = ECORE_EVAS_OPT_SWAP_MODE;  
  ECORE_EVAS_GL_X11_OPT_GL_DEPTH = ECORE_EVAS_OPT_GL_DEPTH;  
  ECORE_EVAS_GL_X11_OPT_GL_STENCIL = ECORE_EVAS_OPT_GL_STENCIL;  
  ECORE_EVAS_GL_X11_OPT_GL_MSAA = ECORE_EVAS_OPT_GL_MSAA;  
  ECORE_EVAS_GL_X11_OPT_LAST = ECORE_EVAS_OPT_LAST;  
  ECORE_EVAS_GL_X11_SWAP_MODE_AUTO = ECORE_EVAS_SWAP_MODE_AUTO;  
  ECORE_EVAS_GL_X11_SWAP_MODE_FULL = ECORE_EVAS_SWAP_MODE_FULL;  
  ECORE_EVAS_GL_X11_SWAP_MODE_COPY = ECORE_EVAS_SWAP_MODE_COPY;  
  ECORE_EVAS_GL_X11_SWAP_MODE_DOUBLE = ECORE_EVAS_SWAP_MODE_DOUBLE;  
  ECORE_EVAS_GL_X11_SWAP_MODE_TRIPLE = ECORE_EVAS_SWAP_MODE_TRIPLE;  
{*
 * @brief Creates Ecore_Evas using opengl x11.
 *
 * @param disp_name The name of the display of the Ecore_Evas to be created.
 * @param parent The parent of the Ecore_Evas to be created.
 * @param x The X coordinate to be used.
 * @param y The Y coordinate to be used.
 * @param w The width of the Ecore_Evas to be created.
 * @param h The height of the Ecore_Evas to be created.
 * @return The new Ecore_Evas.
 *
 * @note If ecore is not compiled with support for x11 then nothing is done and NULL is returned.
  }
(* Const before type ignored *)

function ecore_evas_gl_x11_new(disp_name:Pchar; parent:TEcore_X_Window; x:longint; y:longint; w:longint; 
           h:longint):PEcore_Evas;cdecl;external;
{*
 * @brief Create Ecore_Evas using OpenGL X11, with options
 *
 * @param disp_name The name of the display of the Ecore_Evas to be created.
 * @param parent The parent of the Ecore_Evas to be created.
 * @param x The X coordinate to be used.
 * @param y The Y coordinate to be used.
 * @param w The width of the Ecore_Evas to be created.
 * @param h The height of the Ecore_Evas to be created.
 * @param opt The options array (see above)
 * @return The new Ecore_Evas.
 *
 * Allows creation of an Ecore_Evas, similar to ecore_evas_gl_x11_new,
 * except it permits passing in @p opt, a NULL-terminated C array of
 * key/value pairs for various settings, as follows:
 *
 *   ECORE_EVAS_GL_X11_OPT_INDIRECT:  Use indirect rendering [0,1]
 *   ECORE_EVAS_GL_X11_OPT_VSYNC: Use vsync [0,1]
 *   ECORE_EVAS_GL_X11_OPT_SWAP_MODE: Swap mode to assume (see Evas_Engine_Info_Gl_Swap_Mode)
 *   ECORE_EVAS_GL_X11_OPT_GL_DEPTH: depth_bits
 *   ECORE_EVAS_GL_X11_OPT_GL_STENCIL: stencil_bits
 *   ECORE_EVAS_GL_X11_OPT_GL_MSAA: msaa_bits
 *
 * @note If ecore is not compiled with support for x11 then nothing is done and NULL is returned.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function ecore_evas_gl_x11_options_new(disp_name:Pchar; parent:TEcore_X_Window; x:longint; y:longint; w:longint; 
           h:longint; opt:Plongint):PEcore_Evas;cdecl;external;
{*
 * @brief Gets the window from Ecore_Evas using opengl x11.
 *
 * @param ee The Ecore_Evas from which to get the window.
 * @return The window of type Ecore_X_Window of Ecore_Evas.
 *
 * @note If ecore is not compiled with support for x11 or if @p ee was not
 * created with ecore_evas_gl_x11_new() then nothing is done and
 * 0 is returned.
  }
(* Const before type ignored *)
function ecore_evas_gl_x11_window_get(ee:PEcore_Evas):TEcore_X_Window;cdecl;external;
{*
 * @brief Sets direct_resize for Ecore_Evas using opengl x11.
 *
 * @param ee The Ecore_Evas in which to set direct resize.
 * @param on Enables the resize of Ecore_Evas if equals @c EINA_TRUE, disables if equals @c EINA_FALSE.
 *
 * @note If ecore is not compiled with support for x11 then nothing is done.
  }
procedure ecore_evas_gl_x11_direct_resize_set(ee:PEcore_Evas; on:TEina_Bool);cdecl;external;
{*
 * @brief Gets if the Ecore_Evas is being directly resized using opengl x11.
 *
 * @param ee The Ecore_Evas from which to get direct resize.
 *
 * @note If ecore is not compiled with support for x11 then nothing is done and EINA_FALSE is returned.
 *
 * @return @c EINA_TRUE if the resize was managed directly, otherwise return @c EINA_FALSE.
  }
(* Const before type ignored *)
function ecore_evas_gl_x11_direct_resize_get(ee:PEcore_Evas):TEina_Bool;cdecl;external;
{*
 * @brief Adds extra window on Ecore_Evas using opengl x11.
 *
 * @param ee The Ecore_Evas for which to add the window.
 * @param win The window to be added to the Ecore_Evas.
 *
 * @note If ecore is not compiled with support for x11 then nothing is done.
  }
procedure ecore_evas_gl_x11_extra_event_window_add(ee:PEcore_Evas; win:TEcore_X_Window);cdecl;external;
{*
 * @brief Sets the functions to be used before and after the swap callback.
 *
 * @param ee The Ecore_Evas for which to set the swap callback.
 * @param data The data for which to set the swap callback.
 * @param pre_cb The function to be called before the callback.
 * @param post_cb The function to be called after the callback.
 *
 * @note If ecore is not compiled with support for x11 then nothing is done and the function is returned.
  }
(* Const before type ignored *)
procedure ecore_evas_gl_x11_pre_post_swap_callback_set(ee:PEcore_Evas; data:pointer; pre_cb:procedure (data:pointer; e:PEvas); post_cb:procedure (data:pointer; e:PEvas));cdecl;external;
{*
 * @brief Creates a new Ecore_Evas which does not contain an XWindow. It will
 * only contain an XPixmap to render to.
 *
 * @warning The XPixmap ID can change with every frame after it is rendered,
 * so you should ALWAYS call ecore_evas_software_x11_pixmap_get when you
 * need the current pixmap id.
 *
 * @since 1.8
  }
(* Const before type ignored *)
function ecore_evas_gl_x11_pixmap_new(disp_name:Pchar; parent:TEcore_X_Window; x:longint; y:longint; w:longint; 
           h:longint):PEcore_Evas;cdecl;external;
{*
 * @brief Returns the underlying Ecore_X_Pixmap used in the Ecore_Evas.
 *
 * @param ee The Ecore_Evas whose pixmap is desired.
 * @return The underlying Ecore_X_Pixmap
 *
 * @warning Support for this depends on the underlying windowing system.
 *
 * @warning The XPixmap ID can change with every frame after it is rendered,
 * so you should ALWAYS call ecore_evas_software_x11_pixmap_get when you
 * need the current pixmap id.
 *
 * @since 1.8
  }
(* Const before type ignored *)
function ecore_evas_gl_x11_pixmap_get(ee:PEcore_Evas):TEcore_X_Pixmap;cdecl;external;
(* Const before type ignored *)
{EINA_DEPRECATED }function ecore_evas_xrender_x11_new(disp_name:Pchar; parent:TEcore_X_Window; x:longint; y:longint; w:longint; 
           h:longint):PEcore_Evas;cdecl;external;
(* Const before type ignored *)
{EINA_DEPRECATED }function ecore_evas_xrender_x11_window_get(ee:PEcore_Evas):TEcore_X_Window;cdecl;external;
{EINA_DEPRECATED }procedure ecore_evas_xrender_x11_direct_resize_set(ee:PEcore_Evas; on:TEina_Bool);cdecl;external;
(* Const before type ignored *)
{EINA_DEPRECATED }function ecore_evas_xrender_x11_direct_resize_get(ee:PEcore_Evas):TEina_Bool;cdecl;external;
{EINA_DEPRECATED }procedure ecore_evas_xrender_x11_extra_event_window_add(ee:PEcore_Evas; win:TEcore_X_Window);cdecl;external;
(* Const before type ignored *)
{EINA_DEPRECATED }function ecore_evas_software_x11_8_new(disp_name:Pchar; parent:TEcore_X_Window; x:longint; y:longint; w:longint; 
           h:longint):PEcore_Evas;cdecl;external;
(* Const before type ignored *)
{EINA_DEPRECATED }function ecore_evas_software_x11_8_window_get(ee:PEcore_Evas):TEcore_X_Window;cdecl;external;
(* Const before type ignored *)
{EINA_DEPRECATED }function ecore_evas_software_x11_8_subwindow_get(ee:PEcore_Evas):TEcore_X_Window;cdecl;external;
{EINA_DEPRECATED }procedure ecore_evas_software_x11_8_direct_resize_set(ee:PEcore_Evas; on:TEina_Bool);cdecl;external;
(* Const before type ignored *)
{EINA_DEPRECATED }function ecore_evas_software_x11_8_direct_resize_get(ee:PEcore_Evas):TEina_Bool;cdecl;external;
{EINA_DEPRECATED }procedure ecore_evas_software_x11_8_extra_event_window_add(ee:PEcore_Evas; win:TEcore_X_Window);cdecl;external;
(* Const before type ignored *)
{EINA_DEPRECATED }function ecore_evas_software_x11_16_new(disp_name:Pchar; parent:TEcore_X_Window; x:longint; y:longint; w:longint; 
           h:longint):PEcore_Evas;cdecl;external;
(* Const before type ignored *)
{EINA_DEPRECATED }function ecore_evas_software_x11_16_window_get(ee:PEcore_Evas):TEcore_X_Window;cdecl;external;
{EINA_DEPRECATED }procedure ecore_evas_software_x11_16_direct_resize_set(ee:PEcore_Evas; on:TEina_Bool);cdecl;external;
(* Const before type ignored *)
{EINA_DEPRECATED }function ecore_evas_software_x11_16_direct_resize_get(ee:PEcore_Evas):TEina_Bool;cdecl;external;
{EINA_DEPRECATED }procedure ecore_evas_software_x11_16_extra_event_window_add(ee:PEcore_Evas; win:TEcore_X_Window);cdecl;external;
{*
 * @brief Creates Ecore_Evas using fb backend.
 *
 * @param disp_name The name of the display to be used.
 * @param rotation The rotation to be used.
 * @param w The width of the Ecore_Evas to be created.
 * @param h The height of the Ecore_Evas to be created.
 * @return The new Ecore_Evas.
  }
(* Const before type ignored *)
function ecore_evas_fb_new(disp_name:Pchar; rotation:longint; w:longint; h:longint):PEcore_Evas;cdecl;external;
(* Const before type ignored *)
{EINA_DEPRECATED }function ecore_evas_directfb_new(disp_name:Pchar; windowed:longint; x:longint; y:longint; w:longint; 
           h:longint):PEcore_Evas;cdecl;external;
(* Const before type ignored *)
{EINA_DEPRECATED }function ecore_evas_directfb_window_get(ee:PEcore_Evas):PEcore_DirectFB_Window;cdecl;external;
{*
 * @brief Create an Ecore_Evas window using the wayland-shm engine.
 *
 * @param disp_name Name of the Wayland display to connect to.
 * @param parent ID of the parent window this Ecore_Evas window belongs
 *        to, or 0 if this is a top-level window.
 * @param x Horizontal position of the Ecore_Evas window.
 * @param y Vertical position of the Ecore_Evas window.
 * @param w Width of the Ecore_Evas window to be created.
 * @param h Height of the Ecore_Evas window to be created.
 * @param frame Deprecated.  (Just pass EINA_FALSE.)
 * @return Ecore_Evas instance or @c NULL if creation failed.
 *
 * Wayland's Shared Memory (SHM) rendering model stores client-drawn
 * data in system memory buffers for communication with the display
 * server.  The server then copies the buffer from system memory to the
 * video output as appropriate.  This routine constructs an Ecore_Evas
 * window object that uses SHM buffers for communication using the
 * Wayland protocol.
 *
 * @see ecore_evas_new()
 * @see ecore_evas_wayland_egl_new()
  }
(* Const before type ignored *)
function ecore_evas_wayland_shm_new(disp_name:Pchar; parent:dword; x:longint; y:longint; w:longint; 
           h:longint; frame:TEina_Bool):PEcore_Evas;cdecl;external;
{*
 * @brief Create an Ecore_Evas window using the wayland-egl engine.
 *
 * @param disp_name Name of the Wayland display to connect to.
 * @param parent ID of the parent window this Ecore_Evas window belongs
 *        to, or 0 if this is a top-level window.
 * @param x Horizontal position of the Ecore_Evas window.
 * @param y Vertical position of the Ecore_Evas window.
 * @param w Width of the Ecore_Evas window to be created.
 * @param h Height of the Ecore_Evas window to be created.
 * @param frame Deprecated.  (Just pass EINA_FALSE.)
 * @return Ecore_Evas instance or @c NULL if creation failed.
 *
 * Under Wayland, clients can also set up rendering directly to graphics
 * hardware memory via various rendering APIs such as OpenGL, OpenGL ES,
 * etc.) thus skipping the need for server-side copying of graphics data
 * to the display device, thus providing higher performance than SHM.
 * This routine constructs an Ecore_Evas window object using the
 * Embedded-system Graphics Library (EGL) interface for handling the
 * context management and rendering synchronization.
 *
 * @see ecore_evas_new()
 * @see ecore_evas_wayland_shm_new()
  }
(* Const before type ignored *)
function ecore_evas_wayland_egl_new(disp_name:Pchar; parent:dword; x:longint; y:longint; w:longint; 
           h:longint; frame:TEina_Bool):PEcore_Evas;cdecl;external;
{*
 * @brief Begin resizing the Ecore_Evas window.
 *
 * @param ee The Ecore_Evas.
 * @param location The edge of the window from which the resize should start.
 *
 * The location edge is an enum as defined by the XDG Shell protocol.  See
 * the zxdg_toplevel_v6_resize_edge enum definition for edge numbering.
  }
procedure ecore_evas_wayland_resize(ee:PEcore_Evas; location:longint);cdecl;external;
{*
 * @brief Begin moving the Ecore_Evas window.
 *
 * @param ee The Ecore_Evas.
 * @param x (unused)
 * @param y (unused)
  }
procedure ecore_evas_wayland_move(ee:PEcore_Evas; x:longint; y:longint);cdecl;external;
{*
 * @brief Set the pointer for the Ecore_Evas window.
 *
 * @param ee The Ecore_Evas.
 * @param hot_x X coordinate.
 * @param hot_y Y coordinate.
 *
 * @note: This routine is unimplemented.
  }
procedure ecore_evas_wayland_pointer_set(ee:PEcore_Evas; hot_x:longint; hot_y:longint);cdecl;external;
{*
 * @brief Set the type of the Ecore_Evas window.
 *
 * Enables setting the window as top level, menu, dnd, etc.
 *
 * @param ee The Ecore_Evas.
 * @param type The Ecore_Wl2_Window_Type to set on the window.
 *
 * @see ecore_wl2_window_type_set()
 * @see Ecore_Wl2_Window_Type
  }
procedure ecore_evas_wayland_type_set(ee:PEcore_Evas; _type:longint);cdecl;external;
{*
 * @brief Gets the window from Ecore_Evas using the wayland backend.
 *
 * @param ee The Ecore_Evas from which to get the window.
 * @return The window of type Ecore_X_Window.
 *
 * @note If ecore is not compiled with support for wayland or if @p ee
 * was not created with ecore_evas_wayland_shm_new() or
 * ecore_evas_wayland_egl_new() then nothing is done and NULL is returned.
  }
(* Const before type ignored *)
function ecore_evas_wayland_window_get(ee:PEcore_Evas):PEcore_Wl_Window;cdecl;external;
{*
 * @brief Gets the window from Ecore_Evas using the wayland2 backend.
 *
 * @param ee The Ecore_Evas from which to get the window.
 * @return The window of type Ecore_X_Window.
 *
 * @note If ecore is not compiled with support for wayland or if @p ee
 * was not created with ecore_evas_wayland_shm_new() or
 * ecore_evas_wayland_egl_new() then nothing is done and NULL is returned.
 *
 * @since 1.17
  }
(* Const before type ignored *)
function ecore_evas_wayland2_window_get(ee:PEcore_Evas):PEcore_Wl2_Window;cdecl;external;
{*
 * @brief Gets the window from Ecore_Evas using the opengl_cocoa backend.
 *
 * @param ee The Ecore_Evas from which to get the window.
 * @return The window of type Ecore_X_Window.
 *
 * @note If ecore is not compiled with support for opengl_cocoa or if @p
 * ee was not created with ecore_evas_cocoa_new() then nothing is done
 * and NULL is returned.
 *
 * @since 1.17
  }
(* Const before type ignored *)
function ecore_evas_cocoa_window_get(ee:PEcore_Evas):PEcore_Cocoa_Window;cdecl;external;
{*
 * @brief Create an Ecore_Evas window using the drm engine.
 *
 * @param device Name of the Wayland display to connect to.
 * @param parent (Unused)
 * @param x Horizontal position of the Ecore_Evas window.
 * @param y Vertical position of the Ecore_Evas window.
 * @param w Width of the Ecore_Evas window to be created.
 * @param h Height of the Ecore_Evas window to be created.
 * @return Ecore_Evas instance or @c NULL if creation failed.
 *
 * Creates an Ecore_Evas window using the Direct Rendering Manager (DRM)
 * backend.  DRM is a kernel-level module providing direct graphic
 * hardware access, bypassing the GL stack entirely.
 *
 * @see ecore_evas_new()
 * @see ecore_evas_gl_drm_new()
  }
(* Const before type ignored *)
function ecore_evas_drm_new(device:Pchar; parent:dword; x:longint; y:longint; w:longint; 
           h:longint):PEcore_Evas;cdecl;external;
{*
 * @brief Create an Ecore_Evas window using the drm engine with GL support.
 *
 * @param device Name of the Wayland display to connect to.
 * @param parent (Unused)
 * @param x Horizontal position of the Ecore_Evas window.
 * @param y Vertical position of the Ecore_Evas window.
 * @param w Width of the Ecore_Evas window to be created.
 * @param h Height of the Ecore_Evas window to be created.
 * @return Ecore_Evas instance or @c NULL if creation failed.
 *
 * This creates a drm backend backed Ecore_Evas window, that also includes
 * gl support using libglapi.
 *
 * @see ecore_evas_new()
 * @see ecore_evas_drm_new()
  }
(* Const before type ignored *)
function ecore_evas_gl_drm_new(device:Pchar; parent:dword; x:longint; y:longint; w:longint; 
           h:longint):PEcore_Evas;cdecl;external;
{* @since 1.12  }
{*
 * @brief Creates a new @c Ecore_Evas canvas bound to the Evas
 * @b buffer engine
 *
 * @param w The width of the canvas, in pixels
 * @param h The height of the canvas, in pixels
 * @return A new @c Ecore_Evas instance or @c NULL, on failure
 *
 * This creates a new buffer canvas wrapper, with image data array
 * @b bound to the ARGB format, 8 bits per pixel.
 *
 * This function will allocate the needed pixels array with canonical
 * @c malloc(). If you wish a custom function to allocate it, consider
 * using ecore_evas_buffer_allocfunc_new(), instead.
 *
 * @note This function actually is a wrapper on
 * ecore_evas_buffer_allocfunc_new(), using the same @a w and @a h
 * arguments and canonical @c malloc() and @c free() to the memory
 * allocation and freeing functions. See that function's documentation
 * for more details.
  }
function ecore_evas_buffer_new(w:longint; h:longint):PEcore_Evas;cdecl;external;
{*
 * @brief Creates a new @c Ecore_Evas canvas bound to the Evas
 * @b buffer engine, giving custom allocation and freeing functions for
 * the canvas memory region
 *
 * @param w The width of the canvas, in canvas units
 * @param h The height of the canvas, in canvas units
 * @param alloc_func Function to be called to allocate the memory
 * needed for the new buffer canvas. @a data will be passed the same
 * value as the @p data of this function, while @a size will be passed
 * @p w times @p h times @c sizeof(int).
 * @param free_func Function to be called to free the memory used by
 * the new buffer canvas. @a data will be passed the same value as the
 * @p data of this function, while @a pix will be passed the canvas
 * memory pointer.
 * @param data Custom data to be passed to the allocation and freeing
 * functions
 * @return A new @c Ecore_Evas instance or @c NULL, on failure
 *
 * This creates a new buffer canvas wrapper, with image data array
 * @b bound to the ARGB format, 8 bits per pixel.
 *
 * This function is useful when one wants an @c Ecore_Evas buffer
 * canvas with a custom allocation function, like one getting memory
 * chunks from a memory pool, for example.
 *
 * On any resizing of this @c Ecore_Evas buffer canvas, its image data
 * will be @b freed, to be allocated again with the new size.
 *
 * @note @p w and @p h sizes have to greater or equal to 1. Otherwise,
 * they'll be interpreted as 1, exactly.
 *
 * @see ecore_evas_buffer_new()
  }
(* Const before type ignored *)
function ecore_evas_buffer_allocfunc_new(w:longint; h:longint; alloc_func:function (data:pointer; size:longint):pointer; free_func:procedure (data:pointer; pix:pointer); data:pointer):PEcore_Evas;cdecl;external;
{*
 * @brief Grabs a pointer to the actual pixels array of a given
 * @c Ecore_Evas @b buffer canvas/window.
 *
 * @param ee An @c Ecore_Evas handle
 * @return A pointer to the internal pixels array of @p ee
 *
 * Besides returning a pointer to the actual pixel array of the given
 * canvas, this call will force a <b>rendering update</b> on @p ee
 * first.
 *
 * A common use case for this call is to create an image object, from
 * @b another canvas, to have as data @p ee's contents, thus
 * snapshoting the canvas. For that case, one can also use the
 * ecore_evas_object_image_new() helper function.
  }
(* Const before type ignored *)
function ecore_evas_buffer_pixels_get(ee:PEcore_Evas):pointer;cdecl;external;
{*
 * @brief Returns a pointer to the Ecore_Evas parent of the given Ecore_Evas.
 *
 * @param ee An @c Ecore_Evas handle
 * @return A pointer to the Ecore_Evas parent.
 *
 * A use case for the function is to determine if the buffer is used inside
 * X11 or Wayland. Since the buffer engine doesn't give any indication on
 * it, we need to retrieve information from the Ecore_Evas parent.
 *
 * @since 1.13
  }
function ecore_evas_buffer_ecore_evas_parent_get(ee:PEcore_Evas):PEcore_Evas;cdecl;external;
{*
 * @brief Creates a new @c Ecore_Evas canvas bound to the Evas
 * @b ews (Ecore + Evas Single Process Windowing System) engine
 *
 * EWS is a simple single process windowing system. The backing store
 * is also an @c Ecore_Evas that can be setup with
 * ecore_evas_ews_setup() and retrieved with
 * ecore_evas_ews_ecore_evas_get(). It will allow window management
 * using events prefixed with @c ECORE_EVAS_EVENT_EWS_.
 *
 * The EWS windows (returned by this function or
 * ecore_evas_new("ews"...)) will all be software buffer windows
 * automatic rendered to the backing store.
 *
 * @param x Horizontal position of window, in pixels
 * @param y Vertical position of window, in pixels
 * @param w The width of the canvas, in pixels
 * @param h The height of the canvas, in pixels
 * @return A new @c Ecore_Evas instance or @c NULL, on failure
 *
 * @see ecore_evas_ews_setup()
 * @see ecore_evas_ews_ecore_evas_get()
 *
 * @since 1.1
 * @deprecated - @since 1.26
  }
function ecore_evas_ews_new(x:longint; y:longint; w:longint; h:longint):PEcore_Evas;cdecl;external;
{*
 * @brief Returns the backing store image object that represents the given
 * window in EWS.
 *
 * @param ee The Ecore_Evas from which to get the backing store.
 * @return The evas object of EWS backing store.
 *
 * @note This should not be modified anyhow, but may be helpful to
 *       determine stacking and geometry of it for window managers
 *       that decorate windows.
 *
 * @see ecore_evas_ews_manager_set()
 * @see ecore_evas_ews_evas_get()
 * @since 1.1
 * @deprecated - @since 1.26
  }
(* Const before type ignored *)
function ecore_evas_ews_backing_store_get(ee:PEcore_Evas):PEvas_Object;cdecl;external;
{*
 * @brief Calls the window to be deleted (freed), but can let user decide to
 * forbid it by using ecore_evas_callback_delete_request_set().
 *
 * @param ee The Ecore_Evas for which window will be deleted.
 *
 * @since 1.1
 * @deprecated - @since 1.26
  }
procedure ecore_evas_ews_delete_request(ee:PEcore_Evas);cdecl;external;
{*
 * @brief Creates an Evas image object with image data <b>bound to an
 * own, internal @c Ecore_Evas canvas wrapper</b>
 *
 * @param ee_target @c Ecore_Evas to have the canvas receiving the new
 * image object
 * @return A handle to the new image object
 *
 * This will create a @b special Evas image object. The image's pixel
 * array will get bound to the same image data array of an @b internal
 * @b buffer @c Ecore_Evas canvas. The user of this function is, then,
 * supposed to grab that @c Ecore_Evas handle, with
 * ecore_evas_object_ecore_evas_get(), and use its canvas to render
 * whatever contents he/she wants, @b independently of the contents
 * of the canvas owned by @p ee_target. Those contents will reflect on
 * the canvas of @p ee, though, being exactly the image data of the
 * object returned by this function.
 *
 * This is a helper function for the scenario of one wanting to grab a
 * buffer canvas' contents (with ecore_evas_buffer_pixels_get()) to be
 * used on another canvas, for whatever reason. The most common goal
 * of this setup is to @b save an image file with a whole canvas as
 * contents, that cannot be achieved by using an image file within
 * the target canvas.
 *
 * @warning Always resize the returned image and its underlying
 * @c Ecore_Evas handle accordingly. They must be kept with same sizes
 * for things to work as expected. Also, you @b must issue
 * @c evas_object_image_size_set() on the image with that same size. If
 * the image is to be shown in a canvas bound to an engine different
 * than the buffer one, then you must also set this image's @b fill
 * properties accordingly.
 *
 * @note The image returned will always be bound to the
 * @c EVAS_COLORSPACE_ARGB8888 colorspace, always.
 *
 * @note Use ecore_evas_object_evas_get() to grab the image's internal
 * own canvas directly.
 *
 * @note If snapshoting this image's internal canvas, remember to
 * flush its internal @c Ecore_Evas firstly, with
 * ecore_evas_manual_render().
  }
function ecore_evas_object_image_new(ee_target:PEcore_Evas):PEvas_Object;cdecl;external;
{*
 * @brief Retrieve the internal @c Ecore_Evas handle of an image
 * object created via ecore_evas_object_image_new().
 *
 * @param obj A handle to an image object created via
 * ecore_evas_object_image_new()
 * @return The underlying @c Ecore_Evas handle in @p obj
  }
function ecore_evas_object_ecore_evas_get(obj:PEvas_Object):PEcore_Evas;cdecl;external;
{*
 * @brief Retrieve the canvas bound to the internal @c Ecore_Evas
 * handle of an image object created via ecore_evas_object_image_new()
 *
 * @param obj A handle to an image object created via
 * ecore_evas_object_image_new()
 * @return A handle to @p obj's underlying @c Ecore_Evas's canvas
  }
function ecore_evas_object_evas_get(obj:PEvas_Object):PEvas;cdecl;external;
{*
 * @brief Creates a new @c Ecore_Evas canvas bound to the Evas
 * @b gdi (software) engine.
 *
 * @param parent ID of the parent window this Ecore_Evas window belongs
 *        to, or 0 if this is a top-level window.
 * @param x Horizontal position of window, in pixels.
 * @param y Vertical position of window, in pixels.
 * @param width The width of the canvas, in pixels.
 * @param height The height of the canvas, in pixels.
 * @return A new @c Ecore_Evas instance, or @c NULL on failure.
 *
 * The Graphics Device Interface (GDI) is a display API for Microsoft
 * Win32 similar in concept to Xlib or Quartz, providing an
 * abstraction layer for performing advanced drawing functionalities
 * using software rendering.
  }
function ecore_evas_software_gdi_new(parent:PEcore_Win32_Window; x:longint; y:longint; width:longint; height:longint):PEcore_Evas;cdecl;external;
{*
 * @brief Creates a new @c Ecore_Evas canvas bound to the Evas
 * @b DirectDraw (software) engine.
 *
 * @param parent ID of the parent window this Ecore_Evas window belongs
 *        to, or 0 if this is a top-level window.
 * @param x Horizontal position of window, in pixels
 * @param y Vertical position of window, in pixels
 * @param width The width of the canvas, in pixels
 * @param height The height of the canvas, in pixels
 * @return A new @c Ecore_Evas instance or @c NULL on failure
 *
 * DirectDraw is an old Microsoft Win32 API for graphics rendering.
 * This API uses the unaccelerated software-based rendering.
  }
function ecore_evas_software_ddraw_new(parent:PEcore_Win32_Window; x:longint; y:longint; width:longint; height:longint):PEcore_Evas;cdecl;external;
function ecore_evas_software_16_ddraw_new(parent:PEcore_Win32_Window; x:longint; y:longint; width:longint; height:longint):PEcore_Evas;cdecl;external;
function ecore_evas_direct3d_new(parent:PEcore_Win32_Window; x:longint; y:longint; width:longint; height:longint):PEcore_Evas;cdecl;external;
function ecore_evas_gl_glew_new(parent:PEcore_Win32_Window; x:longint; y:longint; width:longint; height:longint):PEcore_Evas;cdecl;external;
(* Const before type ignored *)
function ecore_evas_win32_window_get(ee:PEcore_Evas):PEcore_Win32_Window;cdecl;external;
{*
 * @brief Creates a new @c Ecore_Evas canvas bound to the Evas
 * @b SDL engine.
 *
 * @param name        Device target name, defaults to "EFL SDL" if NULL.
 * @param w           Width of the canvas, in pixels.
 * @param h           Height of the canvas, in pixels.
 * @param fullscreen  Set the fullscreen property for the window.
 * @param hwsurface   Set the hardware surface property for the window.
 * @param noframe     Set the noframe flag on the einfo.
 * @param alpha       Set alpha for the Ecore_Evas window.
 * @return A new @c Ecore_Evas instance, or @c NULL on failure.
  }
(* Const before type ignored *)
function ecore_evas_sdl_new(name:Pchar; w:longint; h:longint; fullscreen:longint; hwsurface:longint; 
           noframe:longint; alpha:longint):PEcore_Evas;cdecl;external;
(* Const before type ignored *)
function ecore_evas_sdl16_new(name:Pchar; w:longint; h:longint; fullscreen:longint; hwsurface:longint; 
           noframe:longint; alpha:longint):PEcore_Evas;cdecl;external;
{*
 * @brief Creates a new @c Ecore_Evas canvas bound to the Evas
 * @b SDL + gl engine.
 *
 * @param name        Device target name, defaults to "EFL SDL" if NULL.
 * @param w           Width of the canvas, in pixels.
 * @param h           Height of the canvas, in pixels.
 * @param fullscreen  Set the fullscreen property for the window.
 * @param noframe     Set the noframe flag on the einfo.
 * @return A new @c Ecore_Evas instance or @c NULL on failure
  }
(* Const before type ignored *)
function ecore_evas_gl_sdl_new(name:Pchar; w:longint; h:longint; fullscreen:longint; noframe:longint):PEcore_Evas;cdecl;external;
{EINA_DEPRECATED }function ecore_evas_software_wince_new(parent:PEcore_WinCE_Window; x:longint; y:longint; width:longint; height:longint):PEcore_Evas;cdecl;external;
{EINA_DEPRECATED }function ecore_evas_software_wince_fb_new(parent:PEcore_WinCE_Window; x:longint; y:longint; width:longint; height:longint):PEcore_Evas;cdecl;external;
{EINA_DEPRECATED }function ecore_evas_software_wince_gapi_new(parent:PEcore_WinCE_Window; x:longint; y:longint; width:longint; height:longint):PEcore_Evas;cdecl;external;
{EINA_DEPRECATED }function ecore_evas_software_wince_ddraw_new(parent:PEcore_WinCE_Window; x:longint; y:longint; width:longint; height:longint):PEcore_Evas;cdecl;external;
{EINA_DEPRECATED }function ecore_evas_software_wince_gdi_new(parent:PEcore_WinCE_Window; x:longint; y:longint; width:longint; height:longint):PEcore_Evas;cdecl;external;
(* Const before type ignored *)
{EINA_DEPRECATED }function ecore_evas_software_wince_window_get(ee:PEcore_Evas):PEcore_WinCE_Window;cdecl;external;
{*
 * @brief Creates a new @c Ecore_Evas canvas bound to the Evas
 * @b Cocoa engine.
 *
 * @param parent ID of the parent window this Ecore_Evas window belongs
 *        to, or 0 if this is a top-level window.
 * @param x Horizontal position of window, in pixels
 * @param y Vertical position of window, in pixels
 * @param w Width of the canvas, in pixels.
 * @param h Height of the canvas, in pixels.
 *
 * The cocoa backend is used for MacOS based systems.
  }
function ecore_evas_cocoa_new(parent:PEcore_Cocoa_Window; x:longint; y:longint; w:longint; h:longint):PEcore_Evas;cdecl;external;
{*
 * @brief Creates a new @c Ecore_Evas canvas bound to the Evas
 * @b psl1ght engine.
 *
 * @param name Deprecated.
 * @param w Width of the canvas, in pixels.
 * @param h Height of the canvas, in pixels.
 *
 * The psl1ght backend is used for the PS3 GameOS.
  }
(* Const before type ignored *)
{EINA_DEPRECATED }function ecore_evas_psl1ght_new(name:Pchar; w:longint; h:longint):PEcore_Evas;cdecl;external;
{ generic manipulation calls  }
{*
 * @brief Gets the engine name used by this Ecore_Evas(window).
 *
 * @param ee Ecore_Evas whose engine's name is desired
 * @return A string that can(usually) be used in ecore_evas_new()
 *
 * @see ecore_evas_free()
  }
(* Const before type ignored *)
(* Const before type ignored *)
function ecore_evas_engine_name_get(ee:PEcore_Evas):Pchar;cdecl;external;
{*
 * @brief Returns the Ecore_Evas for this Evas.
 *
 * @param e The Evas to get the Ecore_Evas from
 * @return The Ecore_Evas that holds this Evas, or @c NULL if not held by one.
 *
 * @warning Only use on Evas' created with ecore evas!
  }
(* Const before type ignored *)
function ecore_evas_ecore_evas_get(e:PEvas):PEcore_Evas;cdecl;external;
{*
 * @brief Frees an Ecore_Evas.
 *
 * @param ee The Ecore_Evas to free
 *
 * This frees up any memory used by the Ecore_Evas.
  }
procedure ecore_evas_free(ee:PEcore_Evas);cdecl;external;
{*
 * @brief Retrieves user data associated with an Ecore_Evas.
 *
 * @param ee The Ecore_Evas to retrieve the user data from.
 * @param key The key which the user data to be retrieved is associated with.
 * @return @c NULL on error or no data found, A pointer to the user data on
 *     success.
 *
 * This function retrieves user specific data that has been stored within an
 * Ecore_Evas structure with ecore_evas_data_set().
 *
 * @see ecore_evas_data_set()
  }
(* Const before type ignored *)
(* Const before type ignored *)
function ecore_evas_data_get(ee:PEcore_Evas; key:Pchar):pointer;cdecl;external;
{*
 * @brief Stores user data in an Ecore_Evas structure.
 *
 * @param ee The Ecore_Evas to store the user data in.
 * @param key A unique string to associate the user data against. Cannot
 * be NULL.
 * @param data A pointer to the user data to store.
 *
 * This function associates the @p data with a @p key which is stored by
 * the Ecore_Evas @p ee. Be aware that a call to ecore_evas_free() will
 * not free any memory for the associated user data, this is the responsibility
 * of the caller.
 *
 * @see ecore_evas_callback_pre_free_set()
 * @see ecore_evas_free()
 * @see ecore_evas_data_get()
  }
(* Const before type ignored *)
(* Const before type ignored *)
procedure ecore_evas_data_set(ee:PEcore_Evas; key:Pchar; data:pointer);cdecl;external;
{*
 * @brief Sets a callback for Ecore_Evas resize events.
 *
 * @param ee The Ecore_Evas to set callbacks on
 * @param func The function to call
 *
 * A call to this function will set a callback on an Ecore_Evas, causing
 * @p func to be called whenever @p ee is resized.
 *
 * @warning If and when this function is called depends on the underlying
 * windowing system.
  }
procedure ecore_evas_callback_resize_set(ee:PEcore_Evas; func:TEcore_Evas_Event_Cb);cdecl;external;
{*
 * @brief Sets a callback for Ecore_Evas move events.
 *
 * @param ee The Ecore_Evas to set callbacks on
 * @param func The function to call
 *
 * A call to this function will set a callback on an Ecore_Evas, causing
 * @p func to be called whenever @p ee is moved.
 *
 * @warning If and when this function is called depends on the underlying
 * windowing system.
  }
procedure ecore_evas_callback_move_set(ee:PEcore_Evas; func:TEcore_Evas_Event_Cb);cdecl;external;
{*
 * @brief Sets a callback for Ecore_Evas show events.
 *
 * @param ee The Ecore_Evas to set callbacks on
 * @param func The function to call
 *
 * A call to this function will set a callback on an Ecore_Evas, causing
 * @p func to be called whenever @p ee is shown.
 *
 * @warning If and when this function is called depends on the underlying
 * windowing system.
  }
procedure ecore_evas_callback_show_set(ee:PEcore_Evas; func:TEcore_Evas_Event_Cb);cdecl;external;
{*
 * @brief Sets a callback for Ecore_Evas hide events.
 *
 * @param ee The Ecore_Evas to set callbacks on
 * @param func The function to call
 *
 * A call to this function will set a callback on an Ecore_Evas, causing
 * @p func to be called whenever @p ee is hidden.
 *
 * @warning If and when this function is called depends on the underlying
 * windowing system.
  }
procedure ecore_evas_callback_hide_set(ee:PEcore_Evas; func:TEcore_Evas_Event_Cb);cdecl;external;
{*
 * @brief Sets a callback for Ecore_Evas delete request events.
 *
 * @param ee The Ecore_Evas to set callbacks on
 * @param func The function to call
 *
 * A call to this function will set a callback on an Ecore_Evas, causing
 * @p func to be called whenever @p ee gets a delete request.
 *
 * @warning If and when this function is called depends on the underlying
 * windowing system.
  }
procedure ecore_evas_callback_delete_request_set(ee:PEcore_Evas; func:TEcore_Evas_Event_Cb);cdecl;external;
{*
 * @brief Sets a callback for Ecore_Evas destroy events.
 *
 * @param ee The Ecore_Evas to set callbacks on
 * @param func The function to call
 *
 * A call to this function will set a callback on an Ecore_Evas, causing
 * @p func to be called whenever @p ee is destroyed.
 *
 * @warning If and when this function is called depends on the underlying
 * windowing system.
  }
procedure ecore_evas_callback_destroy_set(ee:PEcore_Evas; func:TEcore_Evas_Event_Cb);cdecl;external;
{*
 * @brief Sets a callback for Ecore_Evas focus in events.
 * @param ee The Ecore_Evas to set callbacks on
 * @param func The function to call

 * A call to this function will set a callback on an Ecore_Evas, causing
 * @p func to be called whenever @p ee gets focus.
 *
 * @warning If and when this function is called depends on the underlying
 * windowing system.
 * @note This function only reports focus in events for the default seat!
 *
 * @see ecore_evas_callback_focus_device_in_set()
  }
procedure ecore_evas_callback_focus_in_set(ee:PEcore_Evas; func:TEcore_Evas_Event_Cb);cdecl;external;
{*
 * @brief Sets a callback for Ecore_Evas focus out events.
 *
 * @param ee The Ecore_Evas to set callbacks on
 * @param func The function to call
 *
 * A call to this function will set a callback on an Ecore_Evas, causing
 * @p func to be called whenever @p ee loses focus.
 *
 * @warning If and when this function is called depends on the underlying
 * windowing system.
 * @note This function only reports focus in events for the default seat!
 *
 * @see ecore_evas_callback_focus_device_out_set()
  }
procedure ecore_evas_callback_focus_out_set(ee:PEcore_Evas; func:TEcore_Evas_Event_Cb);cdecl;external;
{*
 * @brief Sets a callback for Ecore_Evas focus in events.
 *
 * @param ee The Ecore_Evas to set callbacks on
 * @param func The function to call
 *
 * A call to this function will set a callback on an Ecore_Evas, causing
 * @p func to be called whenever @p ee gets focus.
 *
 * @warning If and when this function is called depends on the underlying
 * windowing system.
 *
 * @see ecore_evas_callback_focus_device_out_set()
 * @since 1.19
  }
procedure ecore_evas_callback_focus_device_in_set(ee:PEcore_Evas; func:TEcore_Evas_Focus_Device_Event_Cb);cdecl;external;
{*
 * @brief Sets a callback for Ecore_Evas focus out events.
 *
 * @param ee The Ecore_Evas to set callbacks on
 * @param func The function to call
 *
 * A call to this function will set a callback on an Ecore_Evas, causing
 * @p func to be called whenever @p ee loses focus.
 *
 * @warning If and when this function is called depends on the underlying
 * windowing system.
 *
 * @see ecore_evas_callback_focus_device_in_set()
 * @since 1.19
  }
procedure ecore_evas_callback_focus_device_out_set(ee:PEcore_Evas; func:TEcore_Evas_Focus_Device_Event_Cb);cdecl;external;
{*
 * @brief Sets a callback for Ecore_Evas sticky events.
 *
 * @param ee The Ecore_Evas to set callbacks on
 * @param func The function to call
 *
 * A call to this function will set a callback on an Ecore_Evas, causing
 * @p func to be called whenever @p ee becomes sticky.
 *
 * @warning If and when this function is called depends on the underlying
 * windowing system.
  }
procedure ecore_evas_callback_sticky_set(ee:PEcore_Evas; func:TEcore_Evas_Event_Cb);cdecl;external;
{*
 * @brief Sets a callback for Ecore_Evas un-sticky events.
 *
 * @param ee The Ecore_Evas to set callbacks on
 * @param func The function to call

 * A call to this function will set a callback on an Ecore_Evas, causing
 * @p func to be called whenever @p ee becomes un-sticky.
 *
 * @warning If and when this function is called depends on the underlying
 * windowing system.
  }
procedure ecore_evas_callback_unsticky_set(ee:PEcore_Evas; func:TEcore_Evas_Event_Cb);cdecl;external;
{*
 * @brief Sets a callback for Ecore_Evas mouse in events.
 *
 * @param ee The Ecore_Evas to set callbacks on
 * @param func The function to call
 *
 * A call to this function will set a callback on an Ecore_Evas, causing
 * @p func to be called whenever the mouse enters @p ee.
 *
 * @warning If and when this function is called depends on the underlying
 * windowing system.
 *
 * @since 1.19
  }
procedure ecore_evas_callback_device_mouse_in_set(ee:PEcore_Evas; func:TEcore_Evas_Mouse_IO_Cb);cdecl;external;
{*
 * @brief Sets a callback for Ecore_Evas mouse out events.
 *
 * @param ee The Ecore_Evas to set callbacks on
 * @param func The function to call
 *
 * A call to this function will set a callback on an Ecore_Evas, causing
 * @p func to be called whenever the mouse leaves @p ee.
 *
 * @warning If and when this function is called depends on the underlying
 * windowing system.
 *
 * @since 1.19
  }
procedure ecore_evas_callback_device_mouse_out_set(ee:PEcore_Evas; func:TEcore_Evas_Mouse_IO_Cb);cdecl;external;
{*
 * @brief Sets a callback for Ecore_Evas mouse in events.
 *
 * @param ee The Ecore_Evas to set callbacks on
 * @param func The function to call
 *
 * A call to this function will set a callback on an Ecore_Evas, causing
 * @p func to be called whenever the mouse enters @p ee.
 *
 * @note the @p func will only report events for the default mouse.
 * @warning If and when this function is called depends on the underlying
 * windowing system.
 *
 * @see ecore_evas_callback_device_mouse_in_set
  }
procedure ecore_evas_callback_mouse_in_set(ee:PEcore_Evas; func:TEcore_Evas_Event_Cb);cdecl;external;
{*
 * @brief Sets a callback for Ecore_Evas mouse out events.
 *
 * @param ee The Ecore_Evas to set callbacks on
 * @param func The function to call
 *
 * A call to this function will set a callback on an Ecore_Evas, causing
 * @p func to be called whenever the mouse leaves @p ee.
 *
 * @note the @p func will only report events for the default mouse.
 * @warning If and when this function is called depends on the underlying
 * windowing system.
 *
 * @see ecore_evas_callback_device_mouse_out_set
  }
procedure ecore_evas_callback_mouse_out_set(ee:PEcore_Evas; func:TEcore_Evas_Event_Cb);cdecl;external;
{*
 * @brief Sets a callback for Ecore_Evas pre-render events.
 *
 * @param ee The Ecore_Evas to set callbacks on
 * @param func The function to call
 *
 * A call to this function will set a callback on an Ecore_Evas, causing
 * @p func to be called just before the evas in @p ee is rendered.
 *
 * @warning If and when this function is called depends on the underlying
 * windowing system.
  }
procedure ecore_evas_callback_pre_render_set(ee:PEcore_Evas; func:TEcore_Evas_Event_Cb);cdecl;external;
{*
 * @brief Sets a callback for Ecore_Evas mouse post-render events.
 *
 * @param ee The Ecore_Evas to set callbacks on
 * @param func The function to call
 *
 * A call to this function will set a callback on an Ecore_Evas, causing
 * @p func to be called just after the evas in @p ee is rendered.
 *
 * @warning If and when this function is called depends on the underlying
 * windowing system.
  }
procedure ecore_evas_callback_post_render_set(ee:PEcore_Evas; func:TEcore_Evas_Event_Cb);cdecl;external;
{*
 * @brief Sets a callback for Ecore_Evas pre-free event.
 *
 * @param ee The Ecore_Evas to set callbacks on
 * @param func The function to call
 *
 * A call to this function will set a callback on an Ecore_Evas, causing
 * @p func to be called just before the instance @p ee is freed.
 *
 * @warning If and when this function is called depends on the underlying
 * windowing system.
  }
procedure ecore_evas_callback_pre_free_set(ee:PEcore_Evas; func:TEcore_Evas_Event_Cb);cdecl;external;
{*
 * @brief Sets a callback for Ecore_Evas state changes.
 *
 * @param ee The Ecore_Evas to set callbacks on
 * @param func The function to call
 *
 * A call to this function will set a callback on an Ecore_Evas, causing
 * @p func to be called whenever @p ee changes state.
 *
 * @warning If and when this function is called depends on the underlying
 * windowing system.
 *
 * @since 1.2
  }
procedure ecore_evas_callback_state_change_set(ee:PEcore_Evas; func:TEcore_Evas_Event_Cb);cdecl;external;
{*
 * @brief Gets an Ecore_Evas's Evas.
 *
 * @param ee The Ecore_Evas whose Evas you wish to get
 * @return The Evas contained within @p ee.
  }
(* Const before type ignored *)
function ecore_evas_get(ee:PEcore_Evas):PEvas;cdecl;external;
{*
 * @brief Provides Managed move co-ordinates for an Ecore_Evas.
 *
 * @param ee The Ecore_Evas to move
 * @param x The x coordinate to set as the managed location
 * @param y The y coordinate to set as the managed location
 *
 * This sets the managed geometry position of the @p ee to (@p x, @p y)
  }
procedure ecore_evas_managed_move(ee:PEcore_Evas; x:longint; y:longint);cdecl;external;
{*
 * @brief Sets whether an Ecore_Evas is shaped or not.
 *
 * @param ee The Ecore_Evas to shape.
 * @param shaped @c EINA_TRUE to shape, @c EINA_FALSE to not.
 *
 * This function allows one to make an Ecore_Evas shaped to the contents of the
 * evas. If @p shaped is @c EINA_TRUE, @p ee will be transparent in parts of
 * the evas that contain no objects. If @p shaped is @c EINA_FALSE, then @p ee
 * will be rectangular, and parts with no data will show random framebuffer
 * artifacting. For non-shaped Ecore_Evases, it is recommended to cover the
 * entire evas with a background object.
  }
procedure ecore_evas_shaped_set(ee:PEcore_Evas; shaped:TEina_Bool);cdecl;external;
{*
 * @brief Queries whether an Ecore_Evas is shaped or not.
 *
 * @param ee The Ecore_Evas to query.
 * @return @c EINA_TRUE if shaped, @c EINA_FALSE if not.
  }
(* Const before type ignored *)
function ecore_evas_shaped_get(ee:PEcore_Evas):TEina_Bool;cdecl;external;
{*
 * @brief Shows an Ecore_Evas' window.
 *
 * @param ee The Ecore_Evas to show.
 *
 * This function makes @p ee visible.
  }
procedure ecore_evas_show(ee:PEcore_Evas);cdecl;external;
{*
 * @brief Hides an Ecore_Evas' window.
 *
 * @param ee The Ecore_Evas to hide.
 *
 * This function makes @p ee hidden(not visible).
  }
procedure ecore_evas_hide(ee:PEcore_Evas);cdecl;external;
{*
 * @brief Activates (set focus to, via the window manager) an Ecore_Evas' window.
 *
 * @param ee The Ecore_Evas to activate.
 *
 * This functions activates the Ecore_Evas.
  }
procedure ecore_evas_activate(ee:PEcore_Evas);cdecl;external;
{*
 * @brief Sets the minimum size of a given @c Ecore_Evas window.
 *
 * @param ee An @c Ecore_Evas window's handle
 * @param w The minimum width
 * @param h The minimum height
 *
 * This function sets the minimum size of @p ee to be @p w x @p h.
 * One won't be able to resize that window to dimensions smaller than
 * the ones set.
 *
 * @note When base sizes are set, via ecore_evas_size_base_set(),
 * they'll be used to calculate a window's minimum size, instead of
 * those set by this function.
 *
 * @see ecore_evas_size_min_get()
  }
procedure ecore_evas_size_min_set(ee:PEcore_Evas; w:longint; h:longint);cdecl;external;
{*
 * @brief Gets the minimum size set for a given @c Ecore_Evas window.
 *
 * @param ee An @c Ecore_Evas window's handle
 * @param w A pointer to an int to place the minimum width in.
 * @param h A pointer to an int to place the minimum height in.
 *
 * @note Use @c NULL pointers on the size components you're not
 * interested in: they'll be ignored by the function.
 *
 * @see ecore_evas_size_min_set() for more details
  }
(* Const before type ignored *)
procedure ecore_evas_size_min_get(ee:PEcore_Evas; w:Plongint; h:Plongint);cdecl;external;
{*
 * @brief Sets the maximum size of a given @c Ecore_Evas window.
 *
 * @param ee An @c Ecore_Evas window's handle
 * @param w The maximum width
 * @param h The maximum height
 *
 * This function sets the maximum size of @p ee to be @p w x @p h.
 * One won't be able to resize that window to dimensions bigger than
 * the ones set.
 *
 * @see ecore_evas_size_max_get()
  }
procedure ecore_evas_size_max_set(ee:PEcore_Evas; w:longint; h:longint);cdecl;external;
{*
 * @brief Gets the maximum size set for a given @c Ecore_Evas window.
 *
 * @param ee An @c Ecore_Evas window's handle
 * @param w A pointer to an int to place the maximum width in.
 * @param h A pointer to an int to place the maximum height in.
 *
 * @note Use @c NULL pointers on the size components you're not
 * interested in: they'll be ignored by the function.
 *
 * @see ecore_evas_size_max_set() for more details
  }
(* Const before type ignored *)
procedure ecore_evas_size_max_get(ee:PEcore_Evas; w:Plongint; h:Plongint);cdecl;external;
{*
 * @brief Sets the base size for a given @c Ecore_Evas window.
 *
 * @param ee An @c Ecore_Evas window's handle
 * @param w The base width
 * @param h The base height
 *
 * This function sets the @b base size of @p ee to be @p w x @p h.
 * When base sizes are set, they'll be used to calculate a window's
 * @b minimum size, instead of those set by ecore_evas_size_min_get().
 *
 * @see ecore_evas_size_base_get()
  }
procedure ecore_evas_size_base_set(ee:PEcore_Evas; w:longint; h:longint);cdecl;external;
{*
 * @brief Gets the base size set for a given @c Ecore_Evas window.
 *
 * @param ee An @c Ecore_Evas window's handle
 * @param w A pointer to an int to place the base width in.
 * @param h A pointer to an int to place the base height in.
 *
 * @note Use @c NULL pointers on the size components you're not
 * interested in: they'll be ignored by the function.
 *
 * @see ecore_evas_size_base_set() for more details
  }
(* Const before type ignored *)
procedure ecore_evas_size_base_get(ee:PEcore_Evas; w:Plongint; h:Plongint);cdecl;external;
{*
 * @brief Sets the "size step" for a given @c Ecore_Evas window.
 *
 * @param ee An @c Ecore_Evas window's handle
 * @param w The step width
 * @param h The step height
 *
 * This function sets the size steps of @p ee to be @p w x @p h. This
 * limits the size of this @c Ecore_Evas window to be @b always an
 * integer multiple of the step size, for each axis.
  }
procedure ecore_evas_size_step_set(ee:PEcore_Evas; w:longint; h:longint);cdecl;external;
{*
 * @brief Gets the "size step" set for a given @c Ecore_Evas window.
 *
 * @param ee An @c Ecore_Evas window's handle
 * @param w A pointer to an int to place the step width in.
 * @param h A pointer to an int to place the step height in.
 *
 * @note Use @c NULL pointers on the size components you're not
 * interested in: they'll be ignored by the function.
 *
 * @see ecore_evas_size_base_set() for more details
  }
(* Const before type ignored *)
procedure ecore_evas_size_step_get(ee:PEcore_Evas; w:Plongint; h:Plongint);cdecl;external;
{*
 * @brief Sets the cursor for the default pointer device.
 *
 * @param ee The Ecore_Evas
 * @param file  The path to an image file for the cursor.
 * @param layer The layer in which the cursor will appear.
 * @param hot_x The x coordinate of the cursor's hot spot.
 * @param hot_y The y coordinate of the cursor's hot spot.
 *
 * This function makes the mouse cursor over @p ee be the image specified by
 * @p file. The actual point within the image that the mouse is at is specified
 * by @p hot_x and @p hot_y, which are coordinates with respect to the top left
 * corner of the cursor image. Cursor object will be deleted with Ecore_Evas.
 *
 * @note This function creates an object from the image and uses
 * ecore_evas_object_cursor_set().
 *
 * @warning Previously set cursor will be deleted.
 *
 * @see ecore_evas_object_cursor_set()
 * @see ecore_evas_cursor_unset()
  }
(* Const before type ignored *)
procedure ecore_evas_cursor_set(ee:PEcore_Evas; file:Pchar; layer:longint; hot_x:longint; hot_y:longint);cdecl;external;
{*
 * @brief Gets information about an Ecore_Evas' default pointer device.
 *
 * @param ee The Ecore_Evas to get
 * @param obj A pointer to an Evas_Object to place the cursor Evas_Object.
 * @param layer A pointer to an int to place the cursor's layer in.
 * @param hot_x A pointer to an int to place the cursor's hot_x coordinate in.
 * @param hot_y A pointer to an int to place the cursor's hot_y coordinate in.
 *
 * This function queries information about an Ecore_Evas' cursor.
 *
 * @see ecore_evas_cursor_set()
 * @see ecore_evas_object_cursor_set()
 * @see ecore_evas_cursor_unset()
  }
(* Const before type ignored *)
procedure ecore_evas_cursor_get(ee:PEcore_Evas; obj:PPEvas_Object; layer:Plongint; hot_x:Plongint; hot_y:Plongint);cdecl;external;
{*
 * @brief Sets the cursor for the default pointer device.
 *
 * @param ee The Ecore_Evas
 * @param obj The Evas_Object which will be the cursor.
 * @param layer The layer in which the cursor will appear.
 * @param hot_x The x coordinate of the cursor's hot spot.
 * @param hot_y The y coordinate of the cursor's hot spot.
 *
 * This function makes the mouse cursor over @p ee be the object specified by
 * @p obj. The actual point within the object that the mouse is at is specified
 * by @p hot_x and @p hot_y, which are coordinates with respect to the top left
 * corner of the cursor object. Cursor object will be deleted with the Ecore_Evas.
 *
 * @see ecore_evas_cursor_set()
  }
procedure ecore_evas_object_cursor_set(ee:PEcore_Evas; obj:PEvas_Object; layer:longint; hot_x:longint; hot_y:longint);cdecl;external;
{*
 * @brief Unsets the cursor of the default pointer device.
 *
 * @param ee The Ecore_Evas to unset the cursor.
 *
 * This function unsets the cursor from the Ecore_Evas, and returns the cursor
 * object. If the cursor was set from ecore_evas_cursor_set(), this function
 * returns the image. In this case, the image should be deleted when it is
 * no longer needed.
 *
 * @see ecore_evas_cursor_set()
 * @see ecore_evas_object_cursor_set()
 * @since 1.11
  }
function ecore_evas_cursor_unset(ee:PEcore_Evas):PEvas_Object;cdecl;external;
{*
 * @brief Unsets the cursor of the specified pointer device.
 *
 * @param ee The Ecore_Evas to unset the cursor.
 * @param pointer A pointer device to set the cursor. Use @c NULL for the default.
 *
 * This function unsets the cursor from the Ecore_Evas, and returns the cursor
 * object. If the cursor was set from ecore_evas_cursor_set(), this function
 * returns the image. In this case, the image should be deleted when it is
 * no longer needed.
 *
 * @see ecore_evas_cursor_device_set()
 * @see ecore_evas_object_cursor_device_set()
 * @since 1.20
  }
function ecore_evas_cursor_device_unset(ee:PEcore_Evas; pointer:PEfl_Input_Device):PEvas_Object;cdecl;external;
{*
 * @brief Sets the cursor of an Ecore_Evas specified pointer device.
 *
 * @param ee The Ecore_Evas
 * @param pointer A pointer device to set the cursor. Use @c NULL for the default.
 * @param obj The Evas_Object which will be the cursor.
 * @param layer The layer in which the cursor will appear.
 * @param hot_x The x coordinate of the cursor's hot spot.
 * @param hot_y The y coordinate of the cursor's hot spot.
 *
 * This function makes the mouse cursor over @p ee be the object specified by
 * @p obj. The actual point within the object that the mouse is at is specified
 * by @p hot_x and @p hot_y, which are coordinates with respect to the top left
 * corner of the cursor object. Cursor object will be deleted with the Ecore_Evas.
 *
 * @since 1.19
  }
procedure ecore_evas_object_cursor_device_set(ee:PEcore_Evas; pointer:PEfl_Input_Device; obj:PEvas_Object; layer:longint; hot_x:longint; 
            hot_y:longint);cdecl;external;
{*
 * @brief Gets information about an Ecore_Evas' specified pointer device.
 *
 * @param ee The Ecore_Evas
 * @param pointer A pointer device to set the cursor. Use @c NULL for the default.
 * @param obj A pointer to an Evas_Object to place the cursor Evas_Object.
 * @param layer A pointer to an int to place the cursor's layer in.
 * @param hot_x A pointer to an int to place the cursor's hot_x coordinate in.
 * @param hot_y A pointer to an int to place the cursor's hot_y coordinate in.
 *
 * This function queries information about an Ecore_Evas' cursor.
 *
 * @see ecore_evas_cursor_device_set()
 * @since 1.19
  }
(* Const before type ignored *)
function ecore_evas_cursor_device_get(ee:PEcore_Evas; pointer:PEfl_Input_Device; obj:PPEvas_Object; layer:Plongint; hot_x:Plongint; 
           hot_y:Plongint):TEina_Bool;cdecl;external;
{*
 * @brief Tells the WM whether or not to ignore an Ecore_Evas' window.
 *
 * @param ee The Ecore_Evas.
 * @param on @c EINA_TRUE to ignore, @c EINA_FALSE to not.
 *
 * This function causes the window manager to ignore @p ee if @p on is
 * @c EINA_TRUE, or not ignore @p ee if @p on is @c EINA_FALSE.
  }
procedure ecore_evas_override_set(ee:PEcore_Evas; on:TEina_Bool);cdecl;external;
{*
 * @brief Queries whether an Ecore_Evas' window is overridden or not.
 *
 * @param ee The Ecore_Evas to set.
 * @return @c EINA_TRUE if @p ee is overridden, @c EINA_FALSE if not.
  }
(* Const before type ignored *)
function ecore_evas_override_get(ee:PEcore_Evas):TEina_Bool;cdecl;external;
{*
 * @brief Sets whether or not an Ecore_Evas' window should avoid damage.
 *
 * @param ee The Ecore_Evas
 * @param on The type of the damage management
 *
 * This option causes updates of the Ecore_Evas to be done on a pixmap, and
 * then copied to the window, or the pixmap used directly on the window,
 * depending on the setting. Possible options are:
 *
 * @li @ref ECORE_EVAS_AVOID_DAMAGE_NONE - every expose event triggers a new
 * damage and consequently render of the affected area. The rendering of things
 * happens directly on the window;
 *
 * @li @ref ECORE_EVAS_AVOID_DAMAGE_EXPOSE - there's a pixmap where everything
 * is rendered into, and then copied to the window. On expose events, there's
 * no need to render things again, just copy the exposed region to the
 * window;
 *
 * @li @ref ECORE_EVAS_AVOID_DAMAGE_BUILT_IN - there's the same pixmap as the
 * previous one, but it is set as a "background pixmap" of the window.  The
 * rendered things appear directly on the window, with no need to copy
 * anything, but would stay stored on the pixmap, so there's no need to render
 * things again on expose events. This option can be faster than the previous
 * one, but may lead to artifacts during resize of the window.
  }
procedure ecore_evas_avoid_damage_set(ee:PEcore_Evas; on:TEcore_Evas_Avoid_Damage_Type);cdecl;external;
{*
 * @brief Queries whether an Ecore_Evas' window avoids damage or not.
 *
 * @param ee The Ecore_Evas to set
 * @return The type of the damage management
  }
(* Const before type ignored *)
function ecore_evas_avoid_damage_get(ee:PEcore_Evas):TEcore_Evas_Avoid_Damage_Type;cdecl;external;
{*
 * @brief Sets the withdrawn state of an Ecore_Evas' window.
 *
 * @param ee The Ecore_Evas whose window's withdrawn state is set.
 * @param withdrawn The Ecore_Evas window's new withdrawn state.
  }
procedure ecore_evas_withdrawn_set(ee:PEcore_Evas; withdrawn:TEina_Bool);cdecl;external;
{*
 * @brief Returns the withdrawn state of an Ecore_Evas' window.
 *
 * @param ee The Ecore_Evas whose window's withdrawn state is returned.
 * @return The Ecore_Evas window's withdrawn state.
  }
(* Const before type ignored *)
function ecore_evas_withdrawn_get(ee:PEcore_Evas):TEina_Bool;cdecl;external;
{*
 * @brief Sets the sticky state of an Ecore_Evas window.
 *
 * @param ee The Ecore_Evas whose window's sticky state is set.
 * @param sticky The Ecore_Evas window's new sticky state.
  }
procedure ecore_evas_sticky_set(ee:PEcore_Evas; sticky:TEina_Bool);cdecl;external;
{*
 * @brief Returns the sticky state of an Ecore_Evas' window.
 *
 * @param ee The Ecore_Evas whose window's sticky state is returned.
 * @return The Ecore_Evas window's sticky state.
  }
(* Const before type ignored *)
function ecore_evas_sticky_get(ee:PEcore_Evas):TEina_Bool;cdecl;external;
{*
 * @brief Enables/disables manual render.
 *
 * @param ee An @c Ecore_Evas handle
 * @param manual_render Enable/disable manual render. @c EINA_TRUE to enable
 * manual render, @c EINA_FALSE to disable manual render. @c EINA_FALSE by
 * default
 *
 * If @p manual_render is true, default ecore_evas render routine would be
 * disabled and rendering will be done only manually. If @p manual_render is
 * false, rendering will be done by default ecore_evas rendering routine, but
 * still manual rendering is available. Call ecore_evas_manual_render() to
 * force immediate render.
 *
 * @see ecore_evas_manual_render_get()
 * @see ecore_evas_manual_render()
  }
procedure ecore_evas_manual_render_set(ee:PEcore_Evas; manual_render:TEina_Bool);cdecl;external;
{*
 * @brief Gets enable/disable status of manual render.
 *
 * @param ee An @c Ecore_Evas handle
 * @return @c EINA_TRUE if manual render is enabled, @c EINA_FALSE if manual
 * render is disabled
 *
 * @see ecore_evas_manual_render_set()
 * @see ecore_evas_manual_render()
  }
(* Const before type ignored *)
function ecore_evas_manual_render_get(ee:PEcore_Evas):TEina_Bool;cdecl;external;
{*
 * @brief Registers an @c Ecore_Evas to receive events through ecore_input_evas.
 *
 * @param ee The @c Ecore_Evas handle.
 *
 * This function calls ecore_event_window_register() with the @p ee as its @c
 * id argument, @c window argument, and uses its @c Evas too. It is useful when
 * no @c window information is available on a given @c Ecore_Evas backend.
 *
 * @see ecore_evas_input_event_unregister()
 * @since 1.1
  }
procedure ecore_evas_input_event_register(ee:PEcore_Evas);cdecl;external;
{*
 * @brief Unregisters an @c Ecore_Evas receiving events through ecore_input_evas.
 *
 * @param ee The @c Ecore_Evas handle.
 *
 * @see ecore_evas_input_event_register()
 * @since 1.1
  }
procedure ecore_evas_input_event_unregister(ee:PEcore_Evas);cdecl;external;
{*
 * @brief Forces immediate rendering on a given @c Ecore_Evas window.
 *
 * @param ee An @c Ecore_Evas handle
 *
 * Use this call to forcefully flush the @p ee's canvas rendering
 * pipeline, thus bring its window to an up to date state.
  }
procedure ecore_evas_manual_render(ee:PEcore_Evas);cdecl;external;
{*
 * @brief Sets comp syncing to enabled/disabled
 *
 * @param ee An @c Ecore_Evas handle
 * @param do_sync True to enable comp syncing, False to disable
 *
 * Turns on client+server synchronized rendering in X11.  Comp sync is
 * disabled by default, but can be turned on optionally.  Can also be
 * set via the ECORE_EVAS_COMP_NOSYNC / ECORE_EVAS_COMP_SYNC
 * environmental variables.
 *
 * @warning This is a deprecated API. DO NOT USE.
  }
procedure ecore_evas_comp_sync_set(ee:PEcore_Evas; do_sync:TEina_Bool);cdecl;external;
{*
 * @brief Gets the comp sync state
 *
 * @param ee An @c Ecore_Evas handle
 * @return True if composition synchronization is enabled, False otherwise
 *
 * @warning This is a deprecated API. DO NOT USE.
  }
(* Const before type ignored *)
function ecore_evas_comp_sync_get(ee:PEcore_Evas):TEina_Bool;cdecl;external;
{*
 * @brief Gets geometry of screen associated with this Ecore_Evas.
 *
 * @param ee The Ecore_Evas whose window's to query container screen geometry.
 * @param x Where to return the horizontal offset value. May be @c NULL.
 * @param y Where to return the vertical offset value. May be @c NULL.
 * @param w Where to return the width value. May be @c NULL.
 * @param h Where to return the height value. May be @c NULL.
 *
 * @since 1.1
  }
(* Const before type ignored *)
procedure ecore_evas_screen_geometry_get(ee:PEcore_Evas; x:Plongint; y:Plongint; w:Plongint; h:Plongint);cdecl;external;
{*
 * @brief Gets the dpi of the screen the Ecore_Evas is primarily on.
 *
 * @param ee The Ecore_Evas whose window's to query.
 * @param xdpi Pointer to integer to store horizontal DPI. May be @c NULL.
 * @param ydpi Pointer to integer to store vertical DPI. May be @c NULL.
 *
 * @since 1.7
  }
(* Const before type ignored *)
procedure ecore_evas_screen_dpi_get(ee:PEcore_Evas; xdpi:Plongint; ydpi:Plongint);cdecl;external;
{EINA_DEPRECATED }procedure ecore_evas_draw_frame_set(ee:PEcore_Evas; draw_frame:TEina_Bool);cdecl;external;
(* Const before type ignored *)
{EINA_DEPRECATED }function ecore_evas_draw_frame_get(ee:PEcore_Evas):TEina_Bool;cdecl;external;
{*
 * @brief Sets shadow geometry for client-side decorations.
 *
 * Note that the framespace contains both a shadow or glow around the window,
 * and the window borders (title bar, etc...).
 *
 * @since 1.19
  }
procedure ecore_evas_shadow_geometry_set(ee:PEcore_Evas; x:longint; y:longint; w:longint; h:longint);cdecl;external;
{*
 * @brief Gets shadow geometry for client-side decorations.
 *
 * Note that the framespace contains both a shadow or glow around the window,
 * and the window borders (title bar, etc...).
 *
 * @since 1.19
  }
(* Const before type ignored *)
procedure ecore_evas_shadow_geometry_get(ee:PEcore_Evas; x:Plongint; y:Plongint; w:Plongint; h:Plongint);cdecl;external;
{*
 * @brief Associates the given object to this ecore evas.
 *
 * @param ee The Ecore_Evas to associate to @a obj
 * @param obj The object to associate to @a ee
 * @param flags The association flags.
 * @return @c EINA_TRUE on success, @c EINA_FALSE otherwise.
 *
 * Association means that operations on one will affect the other, for
 * example moving the object will move the window, resize the object will
 * also affect the ecore evas window, hide and show applies as well.
 *
 * This is meant to simplify development, since you often need to associate
 * these events with your "base" objects, background or bottom-most object.
 *
 * Be aware that some methods might not be what you would like, deleting
 * either the window or the object will delete the other. If you want to
 * change that behavior, let's say to hide window when it's closed, you
 * must use ecore_evas_callback_delete_request_set() and set your own code,
 * like ecore_evas_hide(). Just remember that if you override delete_request
 * and still want to delete the window/object, you must do that yourself.
 *
 * Since we now define delete_request, deleting windows will not quit
 * main loop, if you wish to do so, you should listen for EVAS_CALLBACK_FREE
 * on the object, that way you get notified and you can call
 * ecore_main_loop_quit().
 *
 * Flags can be OR'ed of:
 * @li ECORE_EVAS_OBJECT_ASSOCIATE_BASE (or 0): to listen to basic events
 *     like delete, resize and move, but no stacking or layer are used.
 * @li ECORE_EVAS_OBJECT_ASSOCIATE_STACK: stacking operations will act
 *     on the Ecore_Evas, not the object. So evas_object_raise() will
 *     call ecore_evas_raise(). Relative operations (stack_above, stack_below)
 *     are still not implemented.
 * @li ECORE_EVAS_OBJECT_ASSOCIATE_LAYER: stacking operations will act
 *     on the Ecore_Evas, not the object. So evas_object_layer_set() will
 *     call ecore_evas_layer_set().
 * @li ECORE_EVAS_OBJECT_ASSOCIATE_DEL: the object delete will delete the
 *     ecore_evas as well as delete_requests on the ecore_evas will delete
 *     etc.
  }
function ecore_evas_object_associate(ee:PEcore_Evas; obj:PEvas_Object; flags:TEcore_Evas_Object_Associate_Flags):TEina_Bool;cdecl;external;
{*
 * @brief Cancels the association set with ecore_evas_object_associate().
 *
 * @param ee The Ecore_Evas to dissociate from @a obj
 * @param obj The object to dissociate from @a ee
 * @return @c EINA_TRUE on success, @c EINA_FALSE otherwise.
  }
function ecore_evas_object_dissociate(ee:PEcore_Evas; obj:PEvas_Object):TEina_Bool;cdecl;external;
{*
 * @brief Gets the object associated with @p ee.
 *
 * @param ee The Ecore_Evas to get the object from.
 * @return The associated object, or @c NULL if there is no associated object.
  }
(* Const before type ignored *)
function ecore_evas_object_associate_get(ee:PEcore_Evas):PEvas_Object;cdecl;external;
{ helper function to be used with ECORE_GETOPT_CALLBACK_*()  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function ecore_getopt_callback_ecore_evas_list_engines(parser:PEcore_Getopt; desc:PEcore_Getopt_Desc; str:Pchar; data:pointer; storage:PEcore_Getopt_Value):byte;cdecl;external;
{*
 * @brief Gets a list of all the ecore_evases.
 *
 * @return A list of ecore_evases.
 *
 * The returned list of ecore evases is only valid until the canvases are
 * destroyed (and should not be cached for instance). The list can be freed by
 * just deleting the list.
  }
function ecore_evas_ecore_evas_list_get:PEina_List;cdecl;external;
{*
 * @brief Gets a list of all the sub ecore_evases.
 *
 * @param ee Ecore_Evas to get the list from.
 * @return A list of sub ecore_evases, or @c NULL if there is no sub ecore_evases.
  }
(* Const before type ignored *)
function ecore_evas_sub_ecore_evas_list_get(ee:PEcore_Evas):PEina_List;cdecl;external;
{*
 * @brief Set the window's client leader.
 *
 * @param ee Ecore_Evas for the window.
 * @param win The window.
 *
 * Sets the client leader X atom property for the given window.  All
 * non-transient top-level windows created by an app other than the main
 * window must have this property set to the app's main window.
  }
procedure ecore_evas_x11_leader_set(ee:PEcore_Evas; win:TEcore_X_Window);cdecl;external;
{*
 * @brief Get the client leader.
 *
 * @param ee Ecore_Evas for the window.
 * @return the current client leader.
 *
 * @see ecore_evas_x11_leader_set()
  }
function ecore_evas_x11_leader_get(ee:PEcore_Evas):TEcore_X_Window;cdecl;external;
{*
 * @brief Reset the client leader to default.
 *
 * @param ee Ecore_Evas for the window.
 *
 * @see ecore_evas_x11_leader_set()
  }
procedure ecore_evas_x11_leader_default_set(ee:PEcore_Evas);cdecl;external;
{*
 * @brief Set the rectangular region that can "contain" the pointer, replacing
 * any previously set region.
 *
 * @param ee The Ecore_Evas
 * @param x The X coordinate for the origin of the input containment rectangle.
 * @param y The Y coordinate for the origin of the input containment rectangle.
 * @param w The width of the input containment rectangle.
 * @param h The height of the input containment rectangle.
 *
 * Ecore_Evas may apply (orthogonal) rotations if needed, via an internal
 * call to _ecore_evas_x11_convert_rectangle_with_angle().  Note that
 * ecore_evas_x11_shape_input_apply() must be called to commit the changes
 * to the window itself.
  }
procedure ecore_evas_x11_shape_input_rectangle_set(ee:PEcore_Evas; x:longint; y:longint; w:longint; h:longint);cdecl;external;
{*
 * @brief Extends the pointer containment region to the union of the new
 * and existing input rectangle.
 *
 * @param ee The Ecore_Evas
 * @param x The X coordinate of the rectangular area to add.
 * @param y The Y coordinate of the rectangular area to add.
 * @param w The width of the rectangular area to add.
 * @param h The height of the rectangular area to add.
 *
 * Ecore_Evas may apply (orthogonal) rotations if needed, via an internal
 * call to _ecore_evas_x11_convert_rectangle_with_angle().  Note that
 * ecore_evas_x11_shape_input_apply() must be called to commit the changes
 * to the window itself.
  }
procedure ecore_evas_x11_shape_input_rectangle_add(ee:PEcore_Evas; x:longint; y:longint; w:longint; h:longint);cdecl;external;
{*
 * @brief Modifies the pointer containment region to subtract a rectangular region from it.
 *
 * @param ee The Ecore_Evas
 * @param x The X coordinate of the subtraction rectangle.
 * @param y The Y coordinate of the subtraction rectangle.
 * @param w The width of the subtraction rectangle.
 * @param h The height of the subtraction rectangle.
 *
 * Ecore_Evas may apply (orthogonal) rotations if needed, via an internal
 * call to _ecore_evas_x11_convert_rectangle_with_angle().  Note that
 * ecore_evas_x11_shape_input_apply() must be called to commit the changes
 * to the window itself.
  }
procedure ecore_evas_x11_shape_input_rectangle_subtract(ee:PEcore_Evas; x:longint; y:longint; w:longint; h:longint);cdecl;external;
{*
 * @brief Disables input for the window.
 *
 * @param ee The Ecore_Evas
 *
 * Sets the pointer containment region to a null rectangle, effectively
 * disabling input for the window.  Note that
 * ecore_evas_x11_shape_input_apply() must be called to commit the
 * changes to the window itself.
  }
procedure ecore_evas_x11_shape_input_empty(ee:PEcore_Evas);cdecl;external;
{*
 * @brief Unsets the pointer containment for the window.
 *
 * @param ee The Ecore_Evas
 *
 * Sets the pointer containment region to a maximally wide and high
 * rectangle, effectively permitting all allowed input events to reach
 * the window.  Note that ecore_evas_x11_shape_input_apply() must be
 * called to commit the changes to the window itself.
  }
procedure ecore_evas_x11_shape_input_reset(ee:PEcore_Evas);cdecl;external;
{*
 * @brief Applies the pointer containment region to the client window.
 *
 * @param ee The Ecore_Evas
  }
procedure ecore_evas_x11_shape_input_apply(ee:PEcore_Evas);cdecl;external;
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief A callback used to accept a new client.
 *
 * @param data The callback data
 * @param ee The Ecore_Evas
 * @param client_host The address of the new client.
 * @return @c EINA_TRUE to accept the client, @c EINA_FALSE otherwise.
 *
 * @see ecore_evas_vnc_start()
 * @since 1.19
  }
(* Const before type ignored *)
type

  TEcore_Evas_Vnc_Client_Accept_Cb = function (data:pointer; ee:PEcore_Evas; client_host:Pchar):TEina_Bool;cdecl;
{*
 * @brief A callback used to inform that a client has disconnected.
 *
 * @param data The callback data
 * @param ee The Ecore_Evas
 * @param client_host The address of the client
 *
 * @see ecore_evas_vnc_start()
 * @since 1.19
  }
(* Const before type ignored *)

  TEcore_Evas_Vnc_Client_Disconnected_Cb = procedure (data:pointer; ee:PEcore_Evas; client_host:Pchar);cdecl;
{*
 * @brief Starts a VNC server.
 *
 * @param ee The Ecore_Evas to start the VNC server
 * @param addr The address that will be used to bind the VNC server. Use @c NULL to bind to any interface.
 * @param port The port number to start the VNC server. Use @c -1 to set the default VNC port (5900)
 * @param accept_cb A callback used to accept a new client. If @c NULL all clients will be accepted.
 * @param disc_cb A callback used to inform that a client has disconnected. It may be @c NULL.
 * @param data Data to pass to @p accept_cb and @p disc_cb
 * @return an Evas_Object that take everything under it to represent the view of the client.
 *
 * @see ecore_evas_vnc_stop()
 * @see Ecore_Evas_Vnc_Client_Accept_Cb()
 * @since 1.19
  }
(* Const before type ignored *)

function ecore_evas_vnc_start(ee:PEcore_Evas; addr:Pchar; port:longint; accept_cb:TEcore_Evas_Vnc_Client_Accept_Cb; disc_cb:TEcore_Evas_Vnc_Client_Disconnected_Cb; 
           data:pointer):PEvas_Object;cdecl;external;
{$endif}
{*
 * @brief Sets a callback for building new Evas.
 *
 * @param func The function to call
 *
 * A call to this function will set a callback on an Ecore_Evas, causing
 * @p func to be called whenever a new Ecore_Evas is created.
 *
 * @warning If and when this function is called depends on the underlying
 * windowing system.
  }

procedure ecore_evas_callback_new_set(func:function (w:longint; h:longint):PEvas);cdecl;external;
{*
 * @defgroup Ecore_Evas_Ews Ecore_Evas Single Process Windowing System.
 * @ingroup Ecore_Evas_Group
 *
 * These are global scope functions to manage the EWS to be used by
 * ecore_evas_ews_new().
 *
 * @since 1.1
 * @deprecated - @since 1.26
 * @
  }
{*
 * @brief Sets the engine to be used by the backing store engine.
 *
 * @param engine The engine to be set.
 * @param options The options of the engine to be set.
 * @return @c EINA_TRUE on success, @c EINA_FALSE if ews is already in use.
 *
 * @since 1.1
 * @deprecated - @since 1.26
  }
(* Const before type ignored *)
(* Const before type ignored *)
function ecore_evas_ews_engine_set(engine:Pchar; options:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Reconfigures the backing store used.
 *
 * @param x The X coordinate to be used.
 * @param y The Y coordinate to be used.
 * @param w The width of the Ecore_Evas to setup.
 * @param h The height of the Ecore_Evas to setup.
 * @return @c EINA_TRUE on success, @c EINA_FALSE otherwise.
 *
 * @since 1.1
 * @deprecated - @since 1.26
  }
function ecore_evas_ews_setup(x:longint; y:longint; w:longint; h:longint):TEina_Bool;cdecl;external;
{*
 * @brief Returns the internal backing store in use.
 *
 * @return The internal backing store in use.
 *
 * @note this will force it to be created, making future calls to
 * ecore_evas_ews_engine_set() void.
 *
 * @see ecore_evas_ews_evas_get()
 * @since 1.1
 * @deprecated - @since 1.26
  }
function ecore_evas_ews_ecore_evas_get:PEcore_Evas;cdecl;external;
{*
 * @brief Returns the internal backing store in use.
 *
 * @return The internal backing store in use.
 *
 * @note this will force it to be created, making future calls to
 * ecore_evas_ews_engine_set() void.
 *
 * @see ecore_evas_ews_ecore_evas_get()
 * @since 1.1
 * @deprecated - @since 1.26
  }
function ecore_evas_ews_evas_get:PEvas;cdecl;external;
{*
 * @brief Gets the current background.
 * @deprecated - @since 1.26
  }
function ecore_evas_ews_background_get:PEvas_Object;cdecl;external;
{*
 * @brief Sets the current background, must be created by evas ecore_evas_ews_evas_get().
 *
 * @param o The Evas_Object for which to set the background.
 *
 * It will be kept at lowest layer (EVAS_LAYER_MIN) and below
 * everything else. You can set any object, default is a black
 * rectangle.
 *
 * @note previous object will be deleted!
 * @deprecated - @since 1.26
  }
procedure ecore_evas_ews_background_set(o:PEvas_Object);cdecl;external;
{*
 * @brief Returns all Ecore_Evas* created by EWS.
 *
 * @return An eina list of Ecore_evases.
 *
 * @note Do not change the returned list or its contents.
 *
 * @since 1.1
 * @deprecated - @since 1.26
  }
(* Const before type ignored *)
function ecore_evas_ews_children_get:PEina_List;cdecl;external;
{*
 * @brief Sets the identifier of the manager taking care of internal windows.
 *
 * @param manager any unique identifier address.
 *
 * The ECORE_EVAS_EWS_EVENT_MANAGER_CHANGE event is issued. Consider
 * handling it to know if you should stop handling events yourself
 * (ie: another manager took over)
 *
 * @see ecore_evas_ews_manager_get()
 * @since 1.1
 * @deprecated - @since 1.26
  }
(* Const before type ignored *)
procedure ecore_evas_ews_manager_set(manager:pointer);cdecl;external;
{*
 * @brief Gets the identifier of the manager taking care of internal windows.
 *
 * @return the value set by ecore_evas_ews_manager_set()
 *
 * @since 1.1
 * @deprecated - @since 1.26
  }
(* Const before type ignored *)
function ecore_evas_ews_manager_get:pointer;cdecl;external;
  var
    ECORE_EVAS_EWS_EVENT_MANAGER_CHANGE : longint;cvar;external;
{*< manager was changed @since 1.1  }
    ECORE_EVAS_EWS_EVENT_ADD : longint;cvar;external;
{*< window was created @since 1.1  }
    ECORE_EVAS_EWS_EVENT_DEL : longint;cvar;external;
{*< window was deleted, pointer is already invalid but may be used as reference for further cleanup work. @since 1.1  }
    ECORE_EVAS_EWS_EVENT_RESIZE : longint;cvar;external;
{*< window was resized @since 1.1  }
    ECORE_EVAS_EWS_EVENT_MOVE : longint;cvar;external;
{*< window was moved @since 1.1  }
    ECORE_EVAS_EWS_EVENT_SHOW : longint;cvar;external;
{*< window become visible @since 1.1  }
    ECORE_EVAS_EWS_EVENT_HIDE : longint;cvar;external;
{*< window become hidden @since 1.1  }
    ECORE_EVAS_EWS_EVENT_FOCUS : longint;cvar;external;
{*< window was focused @since 1.1  }
    ECORE_EVAS_EWS_EVENT_UNFOCUS : longint;cvar;external;
{*< window lost focus @since 1.1  }
    ECORE_EVAS_EWS_EVENT_RAISE : longint;cvar;external;
{*< window was raised @since 1.1  }
    ECORE_EVAS_EWS_EVENT_LOWER : longint;cvar;external;
{*< window was lowered @since 1.1  }
    ECORE_EVAS_EWS_EVENT_ACTIVATE : longint;cvar;external;
{*< window was activated @since 1.1  }
    ECORE_EVAS_EWS_EVENT_ICONIFIED_CHANGE : longint;cvar;external;
{*< window minimized/iconified changed @since 1.1  }
    ECORE_EVAS_EWS_EVENT_MAXIMIZED_CHANGE : longint;cvar;external;
{*< window maximized changed @since 1.1  }
    ECORE_EVAS_EWS_EVENT_LAYER_CHANGE : longint;cvar;external;
{*< window layer changed @since 1.1  }
    ECORE_EVAS_EWS_EVENT_FULLSCREEN_CHANGE : longint;cvar;external;
{*< window fullscreen changed @since 1.1  }
    ECORE_EVAS_EWS_EVENT_CONFIG_CHANGE : longint;cvar;external;
{*< some other window property changed (title, name, class, alpha, transparent, shaped...) @since 1.1  }
{*
 * @
  }
{*
 * @defgroup Ecore_Evas_Extn External plug/socket infrastructure for remote canvases
 * @ingroup Ecore_Evas_Group
 *
 * These functions allow 1 process to create a "socket" was pluged into which another
 * process can create a "plug" remotely to plug into.
 * Socket can provide content for several plugs.
 * This is best for small sized objects (about the size range
 * of a small icon up to a few large icons). Since the plug is actually an
 * image object, you can fetch the pixel data
 *
 * @since 1.2
 * @
  }
    ECORE_EVAS_EXTN_CLIENT_ADD : longint;cvar;external;
{*< this event is received when a plug has connected to an extn socket @since 1.2  }
    ECORE_EVAS_EXTN_CLIENT_DEL : longint;cvar;external;
{*< this event is received when a plug has disconnected from an extn socket @since 1.2  }
{*
 * @brief Creates a new Ecore_Evas canvas for the new external ecore evas socket
 *
 * @param w The width of the canvas, in pixels
 * @param h The height of the canvas, in pixels
 * @return A new @c Ecore_Evas instance, or @c NULL on failure
 *
 * This creates a new extn_socket canvas wrapper, with image data array
 * @b bound to the ARGB format, 8 bits per pixel.
 *
 * If creation is successful, an Ecore_Evas handle is returned or @c NULL if
 * creation fails. Also focus, show, hide etc. callbacks will also be called
 * if the plug object is shown, or already visible on connect, or if it is
 * hidden later, focused or unfocused.
 *
 * This function has to be followed by ecore_evas_extn_socket_listen(),
 * for starting ecore ipc service.
 *
 * @code
 * Eina_Bool res = EINA_FALSE;
 * Ecore_Evas *ee = ecore_evas_extn_socket_new(1, 1);
 *
 * res = ecore_evas_extn_socket_listen("svcname", 1, EINA_FALSE);
 * if (!res) return;
 * ecore_evas_resize(ee, 240, 400);
 * @endcode
 *
 * or
 *
 * @code
 * Eina_Bool res = EINA_FALSE;
 * Ecore_Evas *ee = ecore_evas_extn_socket_new(240, 400);
 *
 * res = ecore_evas_extn_socket_listen("svcname", 1, EINA_FALSE);
 * if (!res) return;
 * @endcode
 *
 * When a client(plug) connects, you will get the ECORE_EVAS_EXTN_CLIENT_ADD event
 * in the ecore event queue, with event_info being the image object pointer
 * passed as a void pointer. When a client disconnects you will get the
 * ECORE_EVAS_EXTN_CLIENT_DEL event.
 *
 * You can set up event handles for these events as follows:
 *
 * @code
 * static Eina_Bool client_add_cb(void *data, int event, void *event_info)
 * 
 *    Ecore_Evas *ee = event_info;
 *    printf("client is connected to external socket %p\n", ee);
 *    return ECORE_CALLBACK_PASS_ON;
 * 
 *
 * static Eina_Bool client_del_cb(void *data, int event, void *event_info)
 * 
 *    Ecore_Evas *ee = event_info;
 *    printf("client is disconnected from external socket %p\n", ee);
 *    return ECORE_CALLBACK_PASS_ON;
 * 
 *
 * void setup(void)
 * 
 *    ecore_event_handler_add(ECORE_EVAS_EXTN_CLIENT_ADD,
 *                           client_add_cb, NULL);
 *    ecore_event_handler_add(ECORE_EVAS_EXTN_CLIENT_DEL,
 *                           client_del_cb, NULL);
 * 
 * @endcode
 *
 * Note that events come in later after the event happened. You may want to be
 * careful as data structures you had associated with the image object
 * may have been freed after deletion, but the object may still be around
 * awaiting cleanup and thus still be valid.You can change the size with something like:
 *
 * @see ecore_evas_extn_socket_listen()
 * @see ecore_evas_extn_plug_new()
 * @see ecore_evas_extn_plug_object_data_lock()
 * @see ecore_evas_extn_plug_object_data_unlock()
 *
 * @since 1.2
  }

function ecore_evas_extn_socket_new(w:longint; h:longint):PEcore_Evas;cdecl;external;
{*
 * @brief Creates a socket to provide the service for external ecore evas
 * socket.
 *
 * @param ee The Ecore_Evas.
 * @param svcname The name of the service to be advertised. ensure that it is
 * unique (when combined with @p svcnum) otherwise creation may fail.
 * @param svcnum A number (any value, @c 0 being the common default) to
 * differentiate multiple instances of services with the same name.
 * @param svcsys A boolean that if true, specifies to create a system-wide
 * service all users can connect to, otherwise the service is private to the
 * user ide that created the service.
 * @return @c EINA_TRUE if creation is successful, @c EINA_FALSE if it does
 * not.
 *
 * This creates socket specified by @p svcname, @p svcnum and @p svcsys. If
 * creation is successful, @c EINA_TRUE is returned or @c EINA_FALSE if
 * creation fails.
 *
 * @see ecore_evas_extn_socket_new()
 * @see ecore_evas_extn_plug_new()
 * @see ecore_evas_extn_plug_object_data_lock()
 * @see ecore_evas_extn_plug_object_data_unlock()
 *
 * @since 1.2
  }
(* Const before type ignored *)
function ecore_evas_extn_socket_listen(ee:PEcore_Evas; svcname:Pchar; svcnum:longint; svcsys:TEina_Bool):TEina_Bool;cdecl;external;
{*
 * @brief Sets the blocking about mouse events to Ecore Evas.
 *
 * @param ee The Ecore_Evas.
 * @param events_block The blocking about mouse events.
 *
 * @see ecore_evas_extn_socket_events_block_get()
 *
 * @since 1.15
  }
procedure ecore_evas_extn_socket_events_block_set(ee:PEcore_Evas; events_block:TEina_Bool);cdecl;external;
{*
 * @brief Gets the blocking about mouse events to Ecore Evas.
 *
 * @param ee The Ecore_Evas.
 * @return The blocking about mouse events.
 *
 * @see ecore_evas_extn_socket_events_block_set()
 *
 * @since 1.15
  }
function ecore_evas_extn_socket_events_block_get(ee:PEcore_Evas):TEina_Bool;cdecl;external;
{*
 * @brief Locks the pixel data so the socket cannot change it.
 *
 * @param obj The image object returned by ecore_evas_extn_plug_new() to lock
 *
 * You may need to get the image pixel data with evas_object_image_data_get()
 * from the image object, but need to ensure that it does not change while
 * you are using the data. This function lets you set an advisory lock on the
 * image data so the external plug process will not render to it or alter it.
 *
 * You should only hold the lock for just as long as you need to read out the
 * image data or otherwise deal with it, and then unlock it with
 * ecore_evas_extn_plug_object_data_unlock(). Keeping a lock over more than
 * 1 iteration of the main ecore loop will be problematic, so avoid it. Also
 * forgetting to unlock may cause the socket process to freeze and thus create
 * odd behaviors.
 *
 * @see ecore_evas_extn_plug_new()
 * @see ecore_evas_extn_plug_object_data_unlock()
 *
 * @since 1.2
  }
procedure ecore_evas_extn_plug_object_data_lock(obj:PEvas_Object);cdecl;external;
{*
 * @brief Unlocks the pixel data so the socket can change it again.
 *
 * @param obj The image object returned by ecore_evas_extn_plug_new() to unlock
 *
 * This unlocks after an advisor lock has been taken by
 * ecore_evas_extn_plug_object_data_lock().
 *
 * @see ecore_evas_extn_plug_new()
 * @see ecore_evas_extn_plug_object_data_lock()
 *
 * @since 1.2
  }
procedure ecore_evas_extn_plug_object_data_unlock(obj:PEvas_Object);cdecl;external;
{*
 * @brief Creates a new external ecore evas plug.
 *
 * @param ee_target The Ecore_Evas containing the canvas in which the new image object will live.
 * @return An evas image object that will contain the image output of a socket.
 *
 * This creates an image object that will contain the output of another
 * processes socket canvas when it connects. All input will be sent back to
 * this process as well, effectively swallowing or placing the socket process
 * in the canvas of the plug process in place of the image object. The image
 * object by default is created to be filled (equivalent of
 * evas_object_image_filled_add() on creation) so image content will scale
 * to fill the image unless otherwise reconfigured. The Ecore_Evas size
 * of the plug is the master size and determines size in pixels of the
 * plug canvas. You can change the size with something like:
 *
 * @code
 * Eina_Bool res = EINA_FALSE;
 * Evas_Object *obj = ecore_evas_extn_plug_new(ee);
 *
 * res = ecore_evas_extn_plug_connect("svcname", 1, EINA_FALSE);
 * if (!res) return;
 * ecore_evas_resize(ee, 240, 400);
 * @endcode
 *
 * @see ecore_evas_extn_socket_new()
 * @see ecore_evas_extn_plug_connect()
 * @since 1.2
  }
function ecore_evas_extn_plug_new(ee_target:PEcore_Evas):PEvas_Object;cdecl;external;
{*
 * @brief Connects an external ecore evas plug to service provided by external
 * ecore evas socket.
 *
 * @param obj The Ecore_Evas containing the canvas in which the new image
 * object will live.
 * @param svcname The service name to connect to set up by the socket.
 * @param svcnum The service number to connect to (set up by socket).
 * @param svcsys Boolean to set if the service is a system one or not (set up
 * by socket).
 * @return @c EINA_TRUE if creation is successful, @c EINA_FALSE if it does
 * not.
 *
 * @see ecore_evas_extn_plug_new()
 *
 * @since 1.2
  }
(* Const before type ignored *)
function ecore_evas_extn_plug_connect(obj:PEvas_Object; svcname:Pchar; svcnum:longint; svcsys:TEina_Bool):TEina_Bool;cdecl;external;
{*
 * @
  }
{*
 * @brief Retrieves the coordinates of the default mouse pointer.
 *
 * @param ee The Ecore_Evas containing the pointer
 * @param x Pointer to integer to store horizontal coordinate. May be @c NULL.
 * @param y Pointer to integer to store vertical coordinate. May be @c NULL.
 *
 * @see ecore_evas_pointer_device_xy_get
 * @since 1.8
  }
(* Const before type ignored *)
procedure ecore_evas_pointer_xy_get(ee:PEcore_Evas; x:PEvas_Coord; y:PEvas_Coord);cdecl;external;
{*
 * @brief Sets the coordinates of the mouse pointer.
 *
 * @param ee The Ecore_Evas containing the pointer
 * @param x The horizontal coordinate to move the pointer to
 * @param y The vertical coordinate to move the pointer to
 *
 * @return @c EINA_TRUE on success, EINA_FALSE on failure.
 *
 * @since 1.8
  }
(* Const before type ignored *)
function ecore_evas_pointer_warp(ee:PEcore_Evas; x:TEvas_Coord; y:TEvas_Coord):TEina_Bool;cdecl;external;
{*
 * @brief Retrieves the coordinates of the mouse pointer.
 *
 * @param ee The Ecore_Evas containing the pointer
 * @param pointer The pointer device, use @c NULL for the default pointer.
 * @param x Pointer to integer to store horizontal coordinate. May be @c NULL.
 * @param y Pointer to integer to store vertical coordinate. May be @c NULL.
 * @since 1.19
  }
(* Const before type ignored *)
(* Const before type ignored *)
procedure ecore_evas_pointer_device_xy_get(ee:PEcore_Evas; pointer:PEfl_Input_Device; x:PEvas_Coord; y:PEvas_Coord);cdecl;external;
{*
 * @brief Retrieves the Visual used for pixmap creation.
 *
 * @param ee The Ecore_Evas containing the pixmap
 * @return The Visual which was used when creating the pixmap
 *
 * @warning If and when this function is called depends on the underlying
 * windowing system. This function should only be called if the Ecore_Evas was
 * created using @c ecore_evas_software_x11_pixmap_new or @c ecore_evas_gl_x11_pixmap_new
 *
 * @since 1.8
  }
(* Const before type ignored *)
function ecore_evas_pixmap_visual_get(ee:PEcore_Evas):pointer;cdecl;external;
{*
 * @brief Retrieves the Colormap used for pixmap creation.
 *
 * @param ee The Ecore_Evas containing the pixmap
 * @return The Colormap which was used when creating the pixmap
 *
 * @warning If and when this function is called depends on the underlying
 * windowing system. This function should only be called if the Ecore_Evas was
 * created using @c ecore_evas_software_x11_pixmap_new or @c ecore_evas_gl_x11_pixmap_new
 *
 * @since 1.8
  }
(* Const before type ignored *)
function ecore_evas_pixmap_colormap_get(ee:PEcore_Evas):dword;cdecl;external;
{*
 * @brief Retrieves the depth used for pixmap creation.
 *
 * @param ee The Ecore_Evas containing the pixmap
 * @return The depth which was used when creating the pixmap
 *
 * @warning If and when this function is called depends on the underlying
 * windowing system. This function should only be called if the Ecore_Evas was
 * created using @c ecore_evas_software_x11_pixmap_new or @c ecore_evas_gl_x11_pixmap_new
 *
 * @since 1.8
  }
(* Const before type ignored *)
function ecore_evas_pixmap_depth_get(ee:PEcore_Evas):longint;cdecl;external;
{* @defgroup Ecore_Evas_Selection_Group Ecore_Evas methods to handle selection
 *
 * These methods perform Copy&Paste and Drag&Drop operations.
 *
 * @since 1.24
 *
 * @
  }
{* @brief Data buffer to use in Copy&Paste (and Drag&Drop) operations
 *
 * @since 1.24
  }
{*< Stores selected / highlighted selection  }
{*< Stores copied things (Ctrl + C)  }
{*< Stores dragged things while drag and drop is happening.  }
{*< Sentinel value. Do not use.  }
type
  PEcore_Evas_Selection_Buffer = ^TEcore_Evas_Selection_Buffer;
  TEcore_Evas_Selection_Buffer =  Longint;
  Const
    ECORE_EVAS_SELECTION_BUFFER_SELECTION_BUFFER = 0;
    ECORE_EVAS_SELECTION_BUFFER_COPY_AND_PASTE_BUFFER = 1;
    ECORE_EVAS_SELECTION_BUFFER_DRAG_AND_DROP_BUFFER = 2;
    ECORE_EVAS_SELECTION_BUFFER_LAST = 3;
;
{*
 * @brief Callback called when the content of one of the selection buffers changes.
 *
 * @param[in] ee The Ecore_Evas that handles this selection.
 * @param[in] selection The selection buffer that has changed.
 *
 * @since 1.24
  }
type

  TEcore_Evas_Selection_Changed_Cb = procedure (ee:PEcore_Evas; seat:dword; selection:TEcore_Evas_Selection_Buffer);cdecl;
{*
 * @brief Sets a callback for Ecore_Evas to be called when a selection buffer changes.
 *
 * @param[in] ee The Ecore_Evas to set the callback on.
 * @param[in] cb The function to call.
 *
 * A call to this function will set a callback on an Ecore_Evas, causing
 * @p func to be called whenever @p ee selections change.
 * Only one such callback can exist for each Ecore_Evas. Calling this method multiple
 * times overwrites previous functions. Use a NULL @p func to stop being notified.
 *
 * @warning If and when this function is called depends on the underlying
 * windowing system.
 *
 * @since 1.24
  }

procedure ecore_evas_callback_selection_changed_set(ee:PEcore_Evas; cb:TEcore_Evas_Selection_Changed_Cb);cdecl;external;
{*
 * @brief Sets the content of the specified selection buffer.
 *
 * @param[in] ee The Ecore_Evas to set the selection buffer on.
 * @param[in] buffer The selection buffer to set.
 * @param[in] content Content to set to the selection buffer. The Eina_Content specifies the MIME type of the data.
 * Ownership of the content is transferred.
 *
 * @note Only ECORE_EVAS_SELECTION_BUFFER_SELECTION_BUFFER and ECORE_EVAS_SELECTION_BUFFER_COPY_AND_PASTE_BUFFER
 * buffers can be set. Drag and drop operations use a different set of methods.
 *
 * @since 1.24
  }
function ecore_evas_selection_set(ee:PEcore_Evas; seat:dword; buffer:TEcore_Evas_Selection_Buffer; content:PEina_Content):TEina_Bool;cdecl;external;
{*
 * @brief Checks if the specified selection buffer has content.
 *
 * @param[in] ee The ecore evas to query
 * @param[in] buffer Which selection buffer to ask
 *
 * @return EINA_TRUE if there is an available selection for the specified buffer.
 *
 * EINA_TRUE is also returned when the selection is in the window associated with @p ee
 *
 * @note Due to the asynchronous nature of selection buffers, this method might not return
 * the right result when invoked from the selection callback set with ecore_evas_callback_selection_changed_set.
 *
 * @since 1.24
  }
function ecore_evas_selection_exists(ee:PEcore_Evas; seat:dword; buffer:TEcore_Evas_Selection_Buffer):TEina_Bool;cdecl;external;
{*
 * @brief Retrieves the content of the specified selection buffer.
 *
 * @param[in] ee The ecore evas to query.
 * @param[in] buffer Selection buffer to retrieve.
 * @param[in] acceptable_types MIME types which are acceptable for the returned Eina_Content.
 * The iterator contains plain strings (char *). Ownership is transferred for the iterator but not for the strings.
 * This is convenient for the usual case of a hard-coded array of strings, since the iterator can be generated
 * on the fly, used and forgotten.
 *
 * @return An Eina_Future containing an Eina_Content which has one of the types in @p acceptable_type.
 * An error is delivered when no matching type is found or when the requested selection buffer is empty.
 *
 * This method is time consuming, therefore, it is recommended to verify the existence of a selection
 * using ecore_evas_selection_exists before calling it.
 *
 * @since 1.24
  }
function ecore_evas_selection_get(ee:PEcore_Evas; seat:dword; buffer:TEcore_Evas_Selection_Buffer; acceptable_types:PEina_Iterator):PEina_Future;cdecl;external;
{*
 * @brief This method is called when the mouse pointer enters or exits the specified window while
 * performing a drag operation.
 *
 * @param[in] ee The Ecore Evas the drag operation started on.
 * @param[in] p Position (in window coordinates) where the event occurred.
 * @param[in] inside @c EINA_TRUE if the pointer just entered this window. @c EINA_FALSE if it has just exited.
 *
 * Set this callback using ecore_evas_callback_drop_state_changed_set.
 *
 * @since 1.24
  }
type

  TEcore_Evas_Drag_Finished_Cb = procedure (ee:PEcore_Evas; seat:dword; data:pointer; accepted:TEina_Bool);cdecl;
{*
 * @brief Starts a new drag operation.
 *
 * @param[in] ee The Ecore Evas the drag operation started on.
 * @param[in] content The content to delivery at the drop site (ownership is transferred).
 * The Eina_Content has data and its associated MIME type, plus a list of alternate types that can be provided.
 * @param[in] drag_rep An Ecore_Evas used as a visual representation of the content being dragged.
 * It must have the same type as @p ee. This is the transparent object dragged along the mouse pointer to indicate that
 * a drag operation is in progress.
 * @p terminate_cb will be called when @p drag_rep is not needed anymore and it must be disposed of.
 * Use @p data to convey @p drag_rep to @p terminate_cb. For example, if @p drag_rep is owned by an Efl_Window, @p data
 * can point to that window.
 * @param[in] action Action the target application should perform upon receiving this content. It is entirely up to the
 * target application to honor (or even understand) this request.
 * @return @c EINA_TRUE if the drag operation has been successfully started.
 *
 * This method must be called when a drag operation is initiated in order to provide the necessary information.
 *
 * @since 1.24
  }
(* Const before type ignored *)

function ecore_evas_drag_start(ee:PEcore_Evas; seat:dword; content:PEina_Content; drag_rep:PEcore_Evas; action:Pchar; 
           terminate_cb:TEcore_Evas_Drag_Finished_Cb; data:pointer):TEina_Bool;cdecl;external;
{*
 * @brief Set the offset of the dragged symbol. Only valid during a drag
 *
 * @param[in] ee The Ecore Evas the drag operation started on.
 * @param[in] seat The seat to use
 * @param[in] offset The offset to apply to the upper left corner ofthe dragged window
 *
 * This must be called on the ee where ecore_evas_drag_start is called on, NOT on the drag representation
 *
 * @since 1.24
  }
procedure ecore_evas_drag_offset_set(ee:PEcore_Evas; seat:dword; offset:TEina_Size2D);cdecl;external;
{*
 * @brief Cancels an ongoing drag operation.
 *
 * @param[in] ee The Ecore Evas the drag operation started on.
 * @return @c EINA_TRUE if the drag operation has been successfully cancelled.
 *
 * The initiator of a drag operation can call this method to abort it.
 *
 * @since 1.24
  }
function ecore_evas_drag_cancel(ee:PEcore_Evas; seat:dword):TEina_Bool;cdecl;external;
{*
 * @brief This method is called when the mouse pointer enters or exits the specified window while
 * performing a drag operation.
 *
 * @param[in] ee The Ecore Evas the drag operation started on.
 * @param[in] p Position (in window coordinates) where the event occurred.
 * @param[in] inside @c EINA_TRUE if the pointer just entered this window. @c EINA_FALSE if it has just exited.
 *
 * Set this callback using ecore_evas_callback_drop_state_changed_set.
 *
 * @since 1.24
  }
type

  TEcore_Evas_Drag_State_Changed_Cb = procedure (ee:PEcore_Evas; seat:dword; p:TEina_Position2D; inside:TEina_Bool);cdecl;
{*
 * @brief Sets the method (callback) to call when the mouse pointer enters or exits the specified window while
 * performing a drag operation.
 *
 * @param[in] ee The Ecore Evas the drag operation started on.
 * @param[in] cb Method to call when the events are received.
 *
 * Only one such callback can exist for each Ecore_Evas. Calling this method multiple
 * times overwrites previous functions. Use a NULL @p cb func to stop being notified.
 *
 * @since 1.24
  }

procedure ecore_evas_callback_drop_state_changed_set(ee:PEcore_Evas; cb:TEcore_Evas_Drag_State_Changed_Cb);cdecl;external;
{*
 * @brief This method is called when the mouse pointer moves over the specified window while
 * performing a drag operation.
 *
 * @param[in] ee The Ecore Evas the drag operation started on.
 * @param[in] p Position (in window coordinates) where the event occurred.
 *
 * Set this callback using ecore_evas_callback_drop_motion_set.
 *
 * @since 1.24
  }
type

  TEcore_Evas_Drag_Motion_Cb = procedure (ee:PEcore_Evas; seat:dword; p:TEina_Position2D);cdecl;
{*
 * @brief Sets the method (callback) to call when the mouse pointer moves over the specified window while
 * performing a drag operation.
 *
 * @param[in] ee The Ecore Evas the drag operation started on.
 * @param[in] cb Method to call when the events are received.
 *
 * Only one such callback can exist for each Ecore_Evas. Calling this method multiple
 * times overwrites previous functions. Use a NULL @p cb func to stop being notified.
 *
 * @since 1.24
  }

procedure ecore_evas_callback_drop_motion_set(ee:PEcore_Evas; cb:TEcore_Evas_Drag_Motion_Cb);cdecl;external;
{*
 * @brief This method is called when the mouse pointer is released over the specified window while
 * performing a drag operation (thus dropping the dragged content over the window).
 *
 * @param[in] ee The Ecore Evas the drag operation started on.
 * @param[in] p Position (in window coordinates) where the event occurred.
 *
 * The dropped data can be retrieved using ecore_evas_selection_get and the
 * ECORE_EVAS_SELECTION_BUFFER_DRAG_AND_DROP_BUFFER buffer.
 *
 * Set this callback using ecore_evas_callback_drop_drop_set.
 *
 * @since 1.24
  }
(* Const before type ignored *)
type

  TEcore_Evas_Drop_Cb = procedure (ee:PEcore_Evas; seat:dword; p:TEina_Position2D; action:Pchar);cdecl;
{*
 * @brief Sets the method (callback) to call when the mouse pointer is released over the specified window while
 * performing a drag operation (thus dropping the dragged content over the window).
 *
 * @param[in] ee The Ecore Evas the drag operation started on.
 * @param[in] cb Method to call when the events are received.
 *
 * Only one such callback can exist for each Ecore_Evas. Calling this method multiple
 * times overwrites previous functions. Use a NULL @p cb func to stop being notified.
 *
 * @since 1.24
  }

procedure ecore_evas_callback_drop_drop_set(ee:PEcore_Evas; cb:TEcore_Evas_Drop_Cb);cdecl;external;
{*
 * @brief Retrieves the list of types the data currently being dragged can be automatically converted to.
 *
 * @param[in] ee The Ecore Evas the drag operation started on.
 * @return
 *
 * This can be used in any of the drag and drop callbacks (Ecore_Evas_Drag_State_Changed_Cb, Ecore_Evas_Drag_Motion_Cb
 * and Ecore_Evas_Drop_Cb) to check if the data being dragged is acceptable and give the user some early feedback
 * before the data is actually dropped on the window.
 *
 * This is functionally equivalent to calling ecore_evas_selection_get and examining the available types in the
 * returned Eina_Content, but much faster since the actual data does not have to be asynchronously requested to the
 * initiator application.
 *
 * @since 1.24
  }
function ecore_evas_drop_available_types_get(ee:PEcore_Evas; seat:dword):PEina_Accessor;cdecl;external;
{*
 * @
  }
{*
 * @
  }
{$endif}

implementation


end.
