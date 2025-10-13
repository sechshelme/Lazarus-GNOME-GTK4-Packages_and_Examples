
unit libvlc_media_player;
interface

{
  Automatically converted by H2Pas 1.0.0 from libvlc_media_player.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    libvlc_media_player.h
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
Plibvlc_audio_output_channel_t  = ^libvlc_audio_output_channel_t;
Plibvlc_audio_output_device_t  = ^libvlc_audio_output_device_t;
Plibvlc_audio_output_device_types_t  = ^libvlc_audio_output_device_types_t;
Plibvlc_audio_output_t  = ^libvlc_audio_output_t;
Plibvlc_chapter_description_t  = ^libvlc_chapter_description_t;
Plibvlc_equalizer_t  = ^libvlc_equalizer_t;
Plibvlc_event_manager_t  = ^libvlc_event_manager_t;
Plibvlc_instance_t  = ^libvlc_instance_t;
Plibvlc_media_player_role  = ^libvlc_media_player_role;
Plibvlc_media_player_role_t  = ^libvlc_media_player_role_t;
Plibvlc_media_player_t  = ^libvlc_media_player_t;
Plibvlc_media_t  = ^libvlc_media_t;
Plibvlc_navigate_mode_t  = ^libvlc_navigate_mode_t;
Plibvlc_position_t  = ^libvlc_position_t;
Plibvlc_renderer_item_t  = ^libvlc_renderer_item_t;
Plibvlc_teletext_key_t  = ^libvlc_teletext_key_t;
Plibvlc_title_description_t  = ^libvlc_title_description_t;
Plibvlc_track_description_t  = ^libvlc_track_description_t;
Plibvlc_video_adjust_option_t  = ^libvlc_video_adjust_option_t;
Plibvlc_video_lock_cb  = ^libvlc_video_lock_cb;
Plibvlc_video_logo_option_t  = ^libvlc_video_logo_option_t;
Plibvlc_video_marquee_option_t  = ^libvlc_video_marquee_option_t;
Plibvlc_video_viewpoint_t  = ^libvlc_video_viewpoint_t;
Plongint  = ^longint;
Pxxxxxxxxxx  = ^xxxxxxxxxx;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{****************************************************************************
 * libvlc_media_player.h:  libvlc_media_player external API
 *****************************************************************************
 * Copyright (C) 1998-2015 VLC authors and VideoLAN
 * $Id: c431c235e92ced9e6e7d7712eb7ff0e73dc4f933 $
 *
 * Authors: Clément Stenac <zorglub@videolan.org>
 *          Jean-Paul Saman <jpsaman@videolan.org>
 *          Pierre d'Herbemont <pdherbemont@videolan.org>
 *
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation; either version 2.1 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program; if not, write to the Free Software Foundation,
 * Inc., 51 Franklin Street, Fifth Floor, Boston MA 02110-1301, USA.
 **************************************************************************** }
{$ifndef VLC_LIBVLC_MEDIA_PLAYER_H}

const
  VLC_LIBVLC_MEDIA_PLAYER_H = 1;  
{* \defgroup libvlc_media_player LibVLC media player
 * \ingroup libvlc
 * A LibVLC media player plays one media (usually in a custom drawable).
 * @
 * \file
 * LibVLC simple media player external API
  }
type
{*
 * Description for video, audio tracks and subtitles. It contains
 * id, name (description string) and pointer to next record.
  }

  Plibvlc_track_description_t = ^Tlibvlc_track_description_t;
  Tlibvlc_track_description_t = record
      i_id : longint;
      psz_name : Pchar;
      p_next : Plibvlc_track_description_t;
    end;
{*
 * Description for titles
  }
  Txxxxxxxxxx =  Longint;
  Const
    libvlc_title_menu = $01;
    libvlc_title_interactive = $02;

{*< duration in milliseconds  }
{*< title name  }
{*< info if item was recognized as a menu, interactive or plain content by the demuxer  }
type
  Plibvlc_title_description_t = ^Tlibvlc_title_description_t;
  Tlibvlc_title_description_t = record
      i_duration : Tint64_t;
      psz_name : Pchar;
      i_flags : dword;
    end;
{*
 * Description for chapters
  }
{*< time-offset of the chapter in milliseconds  }
{*< duration of the chapter in milliseconds  }
{*< chapter name  }

  Plibvlc_chapter_description_t = ^Tlibvlc_chapter_description_t;
  Tlibvlc_chapter_description_t = record
      i_time_offset : Tint64_t;
      i_duration : Tint64_t;
      psz_name : Pchar;
    end;
{*
 * Description for audio output. It contains
 * name, description and pointer to next record.
  }

  Plibvlc_audio_output_t = ^Tlibvlc_audio_output_t;
  Tlibvlc_audio_output_t = record
      psz_name : Pchar;
      psz_description : Pchar;
      p_next : Plibvlc_audio_output_t;
    end;
{*
 * Description for audio output device.
  }
{*< Next entry in list  }
{*< Device identifier string  }
{*< User-friendly device description  }
{ More fields may be added here in later versions  }

  Plibvlc_audio_output_device_t = ^Tlibvlc_audio_output_device_t;
  Tlibvlc_audio_output_device_t = record
      p_next : Plibvlc_audio_output_device_t;
      psz_device : Pchar;
      psz_description : Pchar;
    end;
{*
 * Marq options definition
  }
{* string argument  }

  Plibvlc_video_marquee_option_t = ^Tlibvlc_video_marquee_option_t;
  Tlibvlc_video_marquee_option_t =  Longint;
  Const
    libvlc_marquee_Enable = 0;
    libvlc_marquee_Text = 1;
    libvlc_marquee_Color = 2;
    libvlc_marquee_Opacity = 3;
    libvlc_marquee_Position = 4;
    libvlc_marquee_Refresh = 5;
    libvlc_marquee_Size = 6;
    libvlc_marquee_Timeout = 7;
    libvlc_marquee_X = 8;
    libvlc_marquee_Y = 9;
;
{*
 * Navigation mode
  }
type
  Plibvlc_navigate_mode_t = ^Tlibvlc_navigate_mode_t;
  Tlibvlc_navigate_mode_t =  Longint;
  Const
    libvlc_navigate_activate = 0;
    libvlc_navigate_up = 1;
    libvlc_navigate_down = 2;
    libvlc_navigate_left = 3;
    libvlc_navigate_right = 4;
    libvlc_navigate_popup = 5;
;
{*
 * Enumeration of values used to set position (e.g. of video title).
  }
type
  Plibvlc_position_t = ^Tlibvlc_position_t;
  Tlibvlc_position_t =  Longint;
  Const
    libvlc_position_disable = -(1);
    libvlc_position_center = (-(1))+1;
    libvlc_position_left = (-(1))+2;
    libvlc_position_right = (-(1))+3;
    libvlc_position_top = (-(1))+4;
    libvlc_position_top_left = (-(1))+5;
    libvlc_position_top_right = (-(1))+6;
    libvlc_position_bottom = (-(1))+7;
    libvlc_position_bottom_left = (-(1))+8;
    libvlc_position_bottom_right = (-(1))+9;
;
{*
 * Enumeration of teletext keys than can be passed via
 * libvlc_video_set_teletext()
  }
type
  Plibvlc_teletext_key_t = ^Tlibvlc_teletext_key_t;
  Tlibvlc_teletext_key_t =  Longint;
  Const
    libvlc_teletext_key_red = 'r' shl 16;
    libvlc_teletext_key_green = 'g' shl 16;
    libvlc_teletext_key_yellow = 'y' shl 16;
    libvlc_teletext_key_blue = 'b' shl 16;
    libvlc_teletext_key_index = 'i' shl 16;
;
{*
 * Opaque equalizer handle.
 *
 * Equalizer settings can be applied to a media player.
  }
type
{*
 * Create an empty Media Player object
 *
 * \param p_libvlc_instance the libvlc instance in which the Media Player
 *        should be created.
 * \return a new media player object, or NULL on error.
  }

function libvlc_media_player_new(p_libvlc_instance:Plibvlc_instance_t):Plibvlc_media_player_t;cdecl;external;
{*
 * Create a Media Player object from a Media
 *
 * \param p_md the media. Afterwards the p_md can be safely
 *        destroyed.
 * \return a new media player object, or NULL on error.
  }
function libvlc_media_player_new_from_media(p_md:Plibvlc_media_t):Plibvlc_media_player_t;cdecl;external;
{*
 * Release a media_player after use
 * Decrement the reference count of a media player object. If the
 * reference count is 0, then libvlc_media_player_release() will
 * release the media player object. If the media player object
 * has been released, then it should not be used again.
 *
 * \param p_mi the Media Player to free
  }
procedure libvlc_media_player_release(p_mi:Plibvlc_media_player_t);cdecl;external;
{*
 * Retain a reference to a media player object. Use
 * libvlc_media_player_release() to decrement reference count.
 *
 * \param p_mi media player object
  }
procedure libvlc_media_player_retain(p_mi:Plibvlc_media_player_t);cdecl;external;
{*
 * Set the media that will be used by the media_player. If any,
 * previous md will be released.
 *
 * \param p_mi the Media Player
 * \param p_md the Media. Afterwards the p_md can be safely
 *        destroyed.
  }
procedure libvlc_media_player_set_media(p_mi:Plibvlc_media_player_t; p_md:Plibvlc_media_t);cdecl;external;
{*
 * Get the media used by the media_player.
 *
 * \param p_mi the Media Player
 * \return the media associated with p_mi, or NULL if no
 *         media is associated
  }
function libvlc_media_player_get_media(p_mi:Plibvlc_media_player_t):Plibvlc_media_t;cdecl;external;
{*
 * Get the Event Manager from which the media player send event.
 *
 * \param p_mi the Media Player
 * \return the event manager associated with p_mi
  }
function libvlc_media_player_event_manager(p_mi:Plibvlc_media_player_t):Plibvlc_event_manager_t;cdecl;external;
{*
 * is_playing
 *
 * \param p_mi the Media Player
 * \return 1 if the media player is playing, 0 otherwise
 *
 * \libvlc_return_bool
  }
function libvlc_media_player_is_playing(p_mi:Plibvlc_media_player_t):longint;cdecl;external;
{*
 * Play
 *
 * \param p_mi the Media Player
 * \return 0 if playback started (and was already started), or -1 on error.
  }
function libvlc_media_player_play(p_mi:Plibvlc_media_player_t):longint;cdecl;external;
{*
 * Pause or resume (no effect if there is no media)
 *
 * \param mp the Media Player
 * \param do_pause play/resume if zero, pause if non-zero
 * \version LibVLC 1.1.1 or later
  }
procedure libvlc_media_player_set_pause(mp:Plibvlc_media_player_t; do_pause:longint);cdecl;external;
{*
 * Toggle pause (no effect if there is no media)
 *
 * \param p_mi the Media Player
  }
procedure libvlc_media_player_pause(p_mi:Plibvlc_media_player_t);cdecl;external;
{*
 * Stop (no effect if there is no media)
 *
 * \param p_mi the Media Player
  }
procedure libvlc_media_player_stop(p_mi:Plibvlc_media_player_t);cdecl;external;
{*
 * Set a renderer to the media player
 *
 * \note must be called before the first call of libvlc_media_player_play() to
 * take effect.
 *
 * \see libvlc_renderer_discoverer_new
 *
 * \param p_mi the Media Player
 * \param p_item an item discovered by libvlc_renderer_discoverer_start()
 * \return 0 on success, -1 on error.
 * \version LibVLC 3.0.0 or later
  }
function libvlc_media_player_set_renderer(p_mi:Plibvlc_media_player_t; p_item:Plibvlc_renderer_item_t):longint;cdecl;external;
{*
 * Callback prototype to allocate and lock a picture buffer.
 *
 * Whenever a new video frame needs to be decoded, the lock callback is
 * invoked. Depending on the video chroma, one or three pixel planes of
 * adequate dimensions must be returned via the second parameter. Those
 * planes must be aligned on 32-bytes boundaries.
 *
 * \param opaque private pointer as passed to libvlc_video_set_callbacks() [IN]
 * \param planes start address of the pixel planes (LibVLC allocates the array
 *             of void pointers, this callback must initialize the array) [OUT]
 * \return a private pointer for the display and unlock callbacks to identify
 *         the picture buffers
  }
type
  Plibvlc_video_lock_cb = ^Tlibvlc_video_lock_cb;
  Tlibvlc_video_lock_cb = function (opaque:pointer; planes:Ppointer):pointer;cdecl;
{*
 * Callback prototype to unlock a picture buffer.
 *
 * When the video frame decoding is complete, the unlock callback is invoked.
 * This callback might not be needed at all. It is only an indication that the
 * application can now read the pixel values if it needs to.
 *
 * \note A picture buffer is unlocked after the picture is decoded,
 * but before the picture is displayed.
 *
 * \param opaque private pointer as passed to libvlc_video_set_callbacks() [IN]
 * \param picture private pointer returned from the @ref libvlc_video_lock_cb
 *                callback [IN]
 * \param planes pixel planes as defined by the @ref libvlc_video_lock_cb
 *               callback (this parameter is only for convenience) [IN]
  }
(* Const before declarator ignored *)

  Tlibvlc_video_unlock_cb = procedure (opaque:pointer; picture:pointer; planes:Ppointer);cdecl;
{*
 * Callback prototype to display a picture.
 *
 * When the video frame needs to be shown, as determined by the media playback
 * clock, the display callback is invoked.
 *
 * \param opaque private pointer as passed to libvlc_video_set_callbacks() [IN]
 * \param picture private pointer returned from the @ref libvlc_video_lock_cb
 *                callback [IN]
  }

  Tlibvlc_video_display_cb = procedure (opaque:pointer; picture:pointer);cdecl;
{*
 * Callback prototype to configure picture buffers format.
 * This callback gets the format of the video as output by the video decoder
 * and the chain of video filters (if any). It can opt to change any parameter
 * as it needs. In that case, LibVLC will attempt to convert the video format
 * (rescaling and chroma conversion) but these operations can be CPU intensive.
 *
 * \param opaque pointer to the private pointer passed to
 *               libvlc_video_set_callbacks() [IN/OUT]
 * \param chroma pointer to the 4 bytes video format identifier [IN/OUT]
 * \param width pointer to the pixel width [IN/OUT]
 * \param height pointer to the pixel height [IN/OUT]
 * \param pitches table of scanline pitches in bytes for each pixel plane
 *                (the table is allocated by LibVLC) [OUT]
 * \param lines table of scanlines count for each plane [OUT]
 * \return the number of picture buffers allocated, 0 indicates failure
 *
 * \note
 * For each pixels plane, the scanline pitch must be bigger than or equal to
 * the number of bytes per pixel multiplied by the pixel width.
 * Similarly, the number of scanlines must be bigger than of equal to
 * the pixel height.
 * Furthermore, we recommend that pitches and lines be multiple of 32
 * to not break assumptions that might be held by optimized code
 * in the video decoders, video filters and/or video converters.
  }

  Tlibvlc_video_format_cb = function (opaque:Ppointer; chroma:Pchar; width:Pdword; height:Pdword; pitches:Pdword; 
               lines:Pdword):dword;cdecl;
{*
 * Callback prototype to configure picture buffers format.
 *
 * \param opaque private pointer as passed to libvlc_video_set_callbacks()
 *               (and possibly modified by @ref libvlc_video_format_cb) [IN]
  }

  Tlibvlc_video_cleanup_cb = procedure (opaque:pointer);cdecl;
{*
 * Set callbacks and private data to render decoded video to a custom area
 * in memory.
 * Use libvlc_video_set_format() or libvlc_video_set_format_callbacks()
 * to configure the decoded format.
 *
 * \warning Rendering video into custom memory buffers is considerably less
 * efficient than rendering in a custom window as normal.
 *
 * For optimal perfomances, VLC media player renders into a custom window, and
 * does not use this function and associated callbacks. It is <b>highly
 * recommended</b> that other LibVLC-based application do likewise.
 * To embed video in a window, use libvlc_media_player_set_xid() or equivalent
 * depending on the operating system.
 *
 * If window embedding does not fit the application use case, then a custom
 * LibVLC video output display plugin is required to maintain optimal video
 * rendering performances.
 *
 * The following limitations affect performance:
 * - Hardware video decoding acceleration will either be disabled completely,
 *   or require (relatively slow) copy from video/DSP memory to main memory.
 * - Sub-pictures (subtitles, on-screen display, etc.) must be blent into the
 *   main picture by the CPU instead of the GPU.
 * - Depending on the video format, pixel format conversion, picture scaling,
 *   cropping and/or picture re-orientation, must be performed by the CPU
 *   instead of the GPU.
 * - Memory copying is required between LibVLC reference picture buffers and
 *   application buffers (between lock and unlock callbacks).
 *
 * \param mp the media player
 * \param lock callback to lock video memory (must not be NULL)
 * \param unlock callback to unlock video memory (or NULL if not needed)
 * \param display callback to display video (or NULL if not needed)
 * \param opaque private pointer for the three callbacks (as first parameter)
 * \version LibVLC 1.1.1 or later
  }

procedure libvlc_video_set_callbacks(mp:Plibvlc_media_player_t; lock:Tlibvlc_video_lock_cb; unlock:Tlibvlc_video_unlock_cb; display:Tlibvlc_video_display_cb; opaque:pointer);cdecl;external;
{*
 * Set decoded video chroma and dimensions.
 * This only works in combination with libvlc_video_set_callbacks(),
 * and is mutually exclusive with libvlc_video_set_format_callbacks().
 *
 * \param mp the media player
 * \param chroma a four-characters string identifying the chroma
 *               (e.g. "RV32" or "YUYV")
 * \param width pixel width
 * \param height pixel height
 * \param pitch line pitch (in bytes)
 * \version LibVLC 1.1.1 or later
 * \bug All pixel planes are expected to have the same pitch.
 * To use the YCbCr color space with chrominance subsampling,
 * consider using libvlc_video_set_format_callbacks() instead.
  }
(* Const before type ignored *)
procedure libvlc_video_set_format(mp:Plibvlc_media_player_t; chroma:Pchar; width:dword; height:dword; pitch:dword);cdecl;external;
{*
 * Set decoded video chroma and dimensions. This only works in combination with
 * libvlc_video_set_callbacks().
 *
 * \param mp the media player
 * \param setup callback to select the video format (cannot be NULL)
 * \param cleanup callback to release any allocated resources (or NULL)
 * \version LibVLC 2.0.0 or later
  }
procedure libvlc_video_set_format_callbacks(mp:Plibvlc_media_player_t; setup:Tlibvlc_video_format_cb; cleanup:Tlibvlc_video_cleanup_cb);cdecl;external;
{*
 * Set the NSView handler where the media player should render its video output.
 *
 * Use the vout called "macosx".
 *
 * The drawable is an NSObject that follow the VLCOpenGLVideoViewEmbedding
 * protocol:
 *
 * @code.m
 * \@protocol VLCOpenGLVideoViewEmbedding <NSObject>
 * - (void)addVoutSubview:(NSView *)view;
 * - (void)removeVoutSubview:(NSView *)view;
 * \@end
 * @endcode
 *
 * Or it can be an NSView object.
 *
 * If you want to use it along with Qt see the QMacCocoaViewContainer. Then
 * the following code should work:
 * @code.mm
 * 
 *     NSView *video = [[NSView alloc] init];
 *     QMacCocoaViewContainer *container = new QMacCocoaViewContainer(video, parent);
 *     libvlc_media_player_set_nsobject(mp, video);
 *     [video release];
 * 
 * @endcode
 *
 * You can find a live example in VLCVideoView in VLCKit.framework.
 *
 * \param p_mi the Media Player
 * \param drawable the drawable that is either an NSView or an object following
 * the VLCOpenGLVideoViewEmbedding protocol.
  }
procedure libvlc_media_player_set_nsobject(p_mi:Plibvlc_media_player_t; drawable:pointer);cdecl;external;
{*
 * Get the NSView handler previously set with libvlc_media_player_set_nsobject().
 *
 * \param p_mi the Media Player
 * \return the NSView handler or 0 if none where set
  }
function libvlc_media_player_get_nsobject(p_mi:Plibvlc_media_player_t):pointer;cdecl;external;
{*
 * Set an X Window System drawable where the media player should render its
 * video output. The call takes effect when the playback starts. If it is
 * already started, it might need to be stopped before changes apply.
 * If LibVLC was built without X11 output support, then this function has no
 * effects.
 *
 * By default, LibVLC will capture input events on the video rendering area.
 * Use libvlc_video_set_mouse_input() and libvlc_video_set_key_input() to
 * disable that and deliver events to the parent window / to the application
 * instead. By design, the X11 protocol delivers input events to only one
 * recipient.
 *
 * \warning
 * The application must call the XInitThreads() function from Xlib before
 * libvlc_new(), and before any call to XOpenDisplay() directly or via any
 * other library. Failure to call XInitThreads() will seriously impede LibVLC
 * performance. Calling XOpenDisplay() before XInitThreads() will eventually
 * crash the process. That is a limitation of Xlib.
 *
 * \param p_mi media player
 * \param drawable X11 window ID
 *
 * \note
 * The specified identifier must correspond to an existing Input/Output class
 * X11 window. Pixmaps are <b>not</b> currently supported. The default X11
 * server is assumed, i.e. that specified in the DISPLAY environment variable.
 *
 * \warning
 * LibVLC can deal with invalid X11 handle errors, however some display drivers
 * (EGL, GLX, VA and/or VDPAU) can unfortunately not. Thus the window handle
 * must remain valid until playback is stopped, otherwise the process may
 * abort or crash.
 *
 * \bug
 * No more than one window handle per media player instance can be specified.
 * If the media has multiple simultaneously active video tracks, extra tracks
 * will be rendered into external windows beyond the control of the
 * application.
  }
procedure libvlc_media_player_set_xwindow(p_mi:Plibvlc_media_player_t; drawable:Tuint32_t);cdecl;external;
{*
 * Get the X Window System window identifier previously set with
 * libvlc_media_player_set_xwindow(). Note that this will return the identifier
 * even if VLC is not currently using it (for instance if it is playing an
 * audio-only input).
 *
 * \param p_mi the Media Player
 * \return an X window ID, or 0 if none where set.
  }
function libvlc_media_player_get_xwindow(p_mi:Plibvlc_media_player_t):Tuint32_t;cdecl;external;
{*
 * Set a Win32/Win64 API window handle (HWND) where the media player should
 * render its video output. If LibVLC was built without Win32/Win64 API output
 * support, then this has no effects.
 *
 * \param p_mi the Media Player
 * \param drawable windows handle of the drawable
  }
procedure libvlc_media_player_set_hwnd(p_mi:Plibvlc_media_player_t; drawable:pointer);cdecl;external;
{*
 * Get the Windows API window handle (HWND) previously set with
 * libvlc_media_player_set_hwnd(). The handle will be returned even if LibVLC
 * is not currently outputting any video to it.
 *
 * \param p_mi the Media Player
 * \return a window handle or NULL if there are none.
  }
function libvlc_media_player_get_hwnd(p_mi:Plibvlc_media_player_t):pointer;cdecl;external;
{*
 * Set the android context.
 *
 * \version LibVLC 3.0.0 and later.
 *
 * \param p_mi the media player
 * \param p_awindow_handler org.videolan.libvlc.AWindow jobject owned by the
 *        org.videolan.libvlc.MediaPlayer class from the libvlc-android project.
  }
procedure libvlc_media_player_set_android_context(p_mi:Plibvlc_media_player_t; p_awindow_handler:pointer);cdecl;external;
{*
 * Set the EFL Evas Object.
 *
 * \version LibVLC 3.0.0 and later.
 *
 * \param p_mi the media player
 * \param p_evas_object a valid EFL Evas Object (Evas_Object)
 * \return -1 if an error was detected, 0 otherwise.
  }
function libvlc_media_player_set_evas_object(p_mi:Plibvlc_media_player_t; p_evas_object:pointer):longint;cdecl;external;
{*
 * Callback prototype for audio playback.
 *
 * The LibVLC media player decodes and post-processes the audio signal
 * asynchronously (in an internal thread). Whenever audio samples are ready
 * to be queued to the output, this callback is invoked.
 *
 * The number of samples provided per invocation may depend on the file format,
 * the audio coding algorithm, the decoder plug-in, the post-processing
 * filters and timing. Application must not assume a certain number of samples.
 *
 * The exact format of audio samples is determined by libvlc_audio_set_format()
 * or libvlc_audio_set_format_callbacks() as is the channels layout.
 *
 * Note that the number of samples is per channel. For instance, if the audio
 * track sampling rate is 48000 Hz, then 1200 samples represent 25 milliseconds
 * of audio signal - regardless of the number of audio channels.
 *
 * \param data data pointer as passed to libvlc_audio_set_callbacks() [IN]
 * \param samples pointer to a table of audio samples to play back [IN]
 * \param count number of audio samples to play back
 * \param pts expected play time stamp (see libvlc_delay())
  }
(* Const before type ignored *)
type

  Tlibvlc_audio_play_cb = procedure (data:pointer; samples:pointer; count:dword; pts:Tint64_t);cdecl;
{*
 * Callback prototype for audio pause.
 *
 * LibVLC invokes this callback to pause audio playback.
 *
 * \note The pause callback is never called if the audio is already paused.
 * \param data data pointer as passed to libvlc_audio_set_callbacks() [IN]
 * \param pts time stamp of the pause request (should be elapsed already)
  }

  Tlibvlc_audio_pause_cb = procedure (data:pointer; pts:Tint64_t);cdecl;
{*
 * Callback prototype for audio resumption.
 *
 * LibVLC invokes this callback to resume audio playback after it was
 * previously paused.
 *
 * \note The resume callback is never called if the audio is not paused.
 * \param data data pointer as passed to libvlc_audio_set_callbacks() [IN]
 * \param pts time stamp of the resumption request (should be elapsed already)
  }

  Tlibvlc_audio_resume_cb = procedure (data:pointer; pts:Tint64_t);cdecl;
{*
 * Callback prototype for audio buffer flush.
 *
 * LibVLC invokes this callback if it needs to discard all pending buffers and
 * stop playback as soon as possible. This typically occurs when the media is
 * stopped.
 *
 * \param data data pointer as passed to libvlc_audio_set_callbacks() [IN]
  }

  Tlibvlc_audio_flush_cb = procedure (data:pointer; pts:Tint64_t);cdecl;
{*
 * Callback prototype for audio buffer drain.
 *
 * LibVLC may invoke this callback when the decoded audio track is ending.
 * There will be no further decoded samples for the track, but playback should
 * nevertheless continue until all already pending buffers are rendered.
 *
 * \param data data pointer as passed to libvlc_audio_set_callbacks() [IN]
  }

  Tlibvlc_audio_drain_cb = procedure (data:pointer);cdecl;
{*
 * Callback prototype for audio volume change.
 * \param data data pointer as passed to libvlc_audio_set_callbacks() [IN]
 * \param volume software volume (1. = nominal, 0. = mute)
 * \param mute muted flag
  }

  Tlibvlc_audio_set_volume_cb = procedure (data:pointer; volume:single; mute:Tbool);cdecl;
{*
 * Sets callbacks and private data for decoded audio.
 *
 * Use libvlc_audio_set_format() or libvlc_audio_set_format_callbacks()
 * to configure the decoded audio format.
 *
 * \note The audio callbacks override any other audio output mechanism.
 * If the callbacks are set, LibVLC will <b>not</b> output audio in any way.
 *
 * \param mp the media player
 * \param play callback to play audio samples (must not be NULL)
 * \param pause callback to pause playback (or NULL to ignore)
 * \param resume callback to resume playback (or NULL to ignore)
 * \param flush callback to flush audio buffers (or NULL to ignore)
 * \param drain callback to drain audio buffers (or NULL to ignore)
 * \param opaque private pointer for the audio callbacks (as first parameter)
 * \version LibVLC 2.0.0 or later
  }

procedure libvlc_audio_set_callbacks(mp:Plibvlc_media_player_t; play:Tlibvlc_audio_play_cb; pause:Tlibvlc_audio_pause_cb; resume:Tlibvlc_audio_resume_cb; flush:Tlibvlc_audio_flush_cb; 
            drain:Tlibvlc_audio_drain_cb; opaque:pointer);cdecl;external;
{*
 * Set callbacks and private data for decoded audio. This only works in
 * combination with libvlc_audio_set_callbacks().
 * Use libvlc_audio_set_format() or libvlc_audio_set_format_callbacks()
 * to configure the decoded audio format.
 *
 * \param mp the media player
 * \param set_volume callback to apply audio volume,
 *                   or NULL to apply volume in software
 * \version LibVLC 2.0.0 or later
  }
procedure libvlc_audio_set_volume_callback(mp:Plibvlc_media_player_t; set_volume:Tlibvlc_audio_set_volume_cb);cdecl;external;
{*
 * Callback prototype to setup the audio playback.
 *
 * This is called when the media player needs to create a new audio output.
 * \param opaque pointer to the data pointer passed to
 *               libvlc_audio_set_callbacks() [IN/OUT]
 * \param format 4 bytes sample format [IN/OUT]
 * \param rate sample rate [IN/OUT]
 * \param channels channels count [IN/OUT]
 * \return 0 on success, anything else to skip audio playback
  }
type

  Tlibvlc_audio_setup_cb = function (data:Ppointer; format:Pchar; rate:Pdword; channels:Pdword):longint;cdecl;
{*
 * Callback prototype for audio playback cleanup.
 *
 * This is called when the media player no longer needs an audio output.
 * \param opaque data pointer as passed to libvlc_audio_set_callbacks() [IN]
  }

  Tlibvlc_audio_cleanup_cb = procedure (data:pointer);cdecl;
{*
 * Sets decoded audio format via callbacks.
 *
 * This only works in combination with libvlc_audio_set_callbacks().
 *
 * \param mp the media player
 * \param setup callback to select the audio format (cannot be NULL)
 * \param cleanup callback to release any allocated resources (or NULL)
 * \version LibVLC 2.0.0 or later
  }

procedure libvlc_audio_set_format_callbacks(mp:Plibvlc_media_player_t; setup:Tlibvlc_audio_setup_cb; cleanup:Tlibvlc_audio_cleanup_cb);cdecl;external;
{*
 * Sets a fixed decoded audio format.
 *
 * This only works in combination with libvlc_audio_set_callbacks(),
 * and is mutually exclusive with libvlc_audio_set_format_callbacks().
 *
 * \param mp the media player
 * \param format a four-characters string identifying the sample format
 *               (e.g. "S16N" or "f32l")
 * \param rate sample rate (expressed in Hz)
 * \param channels channels count
 * \version LibVLC 2.0.0 or later
  }
(* Const before type ignored *)
procedure libvlc_audio_set_format(mp:Plibvlc_media_player_t; format:Pchar; rate:dword; channels:dword);cdecl;external;
{* \bug This might go away ... to be replaced by a broader system  }
{*
 * Get the current movie length (in ms).
 *
 * \param p_mi the Media Player
 * \return the movie length (in ms), or -1 if there is no media.
  }
function libvlc_media_player_get_length(p_mi:Plibvlc_media_player_t):Tlibvlc_time_t;cdecl;external;
{*
 * Get the current movie time (in ms).
 *
 * \param p_mi the Media Player
 * \return the movie time (in ms), or -1 if there is no media.
  }
function libvlc_media_player_get_time(p_mi:Plibvlc_media_player_t):Tlibvlc_time_t;cdecl;external;
{*
 * Set the movie time (in ms). This has no effect if no media is being played.
 * Not all formats and protocols support this.
 *
 * \param p_mi the Media Player
 * \param i_time the movie time (in ms).
  }
procedure libvlc_media_player_set_time(p_mi:Plibvlc_media_player_t; i_time:Tlibvlc_time_t);cdecl;external;
{*
 * Get movie position as percentage between 0.0 and 1.0.
 *
 * \param p_mi the Media Player
 * \return movie position, or -1. in case of error
  }
function libvlc_media_player_get_position(p_mi:Plibvlc_media_player_t):single;cdecl;external;
{*
 * Set movie position as percentage between 0.0 and 1.0.
 * This has no effect if playback is not enabled.
 * This might not work depending on the underlying input format and protocol.
 *
 * \param p_mi the Media Player
 * \param f_pos the position
  }
procedure libvlc_media_player_set_position(p_mi:Plibvlc_media_player_t; f_pos:single);cdecl;external;
{*
 * Set movie chapter (if applicable).
 *
 * \param p_mi the Media Player
 * \param i_chapter chapter number to play
  }
procedure libvlc_media_player_set_chapter(p_mi:Plibvlc_media_player_t; i_chapter:longint);cdecl;external;
{*
 * Get movie chapter.
 *
 * \param p_mi the Media Player
 * \return chapter number currently playing, or -1 if there is no media.
  }
function libvlc_media_player_get_chapter(p_mi:Plibvlc_media_player_t):longint;cdecl;external;
{*
 * Get movie chapter count
 *
 * \param p_mi the Media Player
 * \return number of chapters in movie, or -1.
  }
function libvlc_media_player_get_chapter_count(p_mi:Plibvlc_media_player_t):longint;cdecl;external;
{*
 * Is the player able to play
 *
 * \param p_mi the Media Player
 * \return boolean
 *
 * \libvlc_return_bool
  }
function libvlc_media_player_will_play(p_mi:Plibvlc_media_player_t):longint;cdecl;external;
{*
 * Get title chapter count
 *
 * \param p_mi the Media Player
 * \param i_title title
 * \return number of chapters in title, or -1
  }
function libvlc_media_player_get_chapter_count_for_title(p_mi:Plibvlc_media_player_t; i_title:longint):longint;cdecl;external;
{*
 * Set movie title
 *
 * \param p_mi the Media Player
 * \param i_title title number to play
  }
procedure libvlc_media_player_set_title(p_mi:Plibvlc_media_player_t; i_title:longint);cdecl;external;
{*
 * Get movie title
 *
 * \param p_mi the Media Player
 * \return title number currently playing, or -1
  }
function libvlc_media_player_get_title(p_mi:Plibvlc_media_player_t):longint;cdecl;external;
{*
 * Get movie title count
 *
 * \param p_mi the Media Player
 * \return title number count, or -1
  }
function libvlc_media_player_get_title_count(p_mi:Plibvlc_media_player_t):longint;cdecl;external;
{*
 * Set previous chapter (if applicable)
 *
 * \param p_mi the Media Player
  }
procedure libvlc_media_player_previous_chapter(p_mi:Plibvlc_media_player_t);cdecl;external;
{*
 * Set next chapter (if applicable)
 *
 * \param p_mi the Media Player
  }
procedure libvlc_media_player_next_chapter(p_mi:Plibvlc_media_player_t);cdecl;external;
{*
 * Get the requested movie play rate.
 * @warning Depending on the underlying media, the requested rate may be
 * different from the real playback rate.
 *
 * \param p_mi the Media Player
 * \return movie play rate
  }
function libvlc_media_player_get_rate(p_mi:Plibvlc_media_player_t):single;cdecl;external;
{*
 * Set movie play rate
 *
 * \param p_mi the Media Player
 * \param rate movie play rate to set
 * \return -1 if an error was detected, 0 otherwise (but even then, it might
 * not actually work depending on the underlying media protocol)
  }
function libvlc_media_player_set_rate(p_mi:Plibvlc_media_player_t; rate:single):longint;cdecl;external;
{*
 * Get current movie state
 *
 * \param p_mi the Media Player
 * \return the current state of the media player (playing, paused, ...) \see libvlc_state_t
  }
function libvlc_media_player_get_state(p_mi:Plibvlc_media_player_t):Tlibvlc_state_t;cdecl;external;
{*
 * How many video outputs does this media player have?
 *
 * \param p_mi the media player
 * \return the number of video outputs
  }
function libvlc_media_player_has_vout(p_mi:Plibvlc_media_player_t):dword;cdecl;external;
{*
 * Is this media player seekable?
 *
 * \param p_mi the media player
 * \return true if the media player can seek
 *
 * \libvlc_return_bool
  }
function libvlc_media_player_is_seekable(p_mi:Plibvlc_media_player_t):longint;cdecl;external;
{*
 * Can this media player be paused?
 *
 * \param p_mi the media player
 * \return true if the media player can pause
 *
 * \libvlc_return_bool
  }
function libvlc_media_player_can_pause(p_mi:Plibvlc_media_player_t):longint;cdecl;external;
{*
 * Check if the current program is scrambled
 *
 * \param p_mi the media player
 * \return true if the current program is scrambled
 *
 * \libvlc_return_bool
 * \version LibVLC 2.2.0 or later
  }
function libvlc_media_player_program_scrambled(p_mi:Plibvlc_media_player_t):longint;cdecl;external;
{*
 * Display the next frame (if supported)
 *
 * \param p_mi the media player
  }
procedure libvlc_media_player_next_frame(p_mi:Plibvlc_media_player_t);cdecl;external;
{*
 * Navigate through DVD Menu
 *
 * \param p_mi the Media Player
 * \param navigate the Navigation mode
 * \version libVLC 2.0.0 or later
  }
procedure libvlc_media_player_navigate(p_mi:Plibvlc_media_player_t; navigate:dword);cdecl;external;
{*
 * Set if, and how, the video title will be shown when media is played.
 *
 * \param p_mi the media player
 * \param position position at which to display the title, or libvlc_position_disable to prevent the title from being displayed
 * \param timeout title display timeout in milliseconds (ignored if libvlc_position_disable)
 * \version libVLC 2.1.0 or later
  }
procedure libvlc_media_player_set_video_title_display(p_mi:Plibvlc_media_player_t; position:Tlibvlc_position_t; timeout:dword);cdecl;external;
{*
 * Add a slave to the current media player.
 *
 * \note If the player is playing, the slave will be added directly. This call
 * will also update the slave list of the attached libvlc_media_t.
 *
 * \version LibVLC 3.0.0 and later.
 *
 * \see libvlc_media_slaves_add
 *
 * \param p_mi the media player
 * \param i_type subtitle or audio
 * \param psz_uri Uri of the slave (should contain a valid scheme).
 * \param b_select True if this slave should be selected when it's loaded
 *
 * \return 0 on success, -1 on error.
  }
(* Const before type ignored *)
function libvlc_media_player_add_slave(p_mi:Plibvlc_media_player_t; i_type:Tlibvlc_media_slave_type_t; psz_uri:Pchar; b_select:Tbool):longint;cdecl;external;
{*
 * Release (free) libvlc_track_description_t
 *
 * \param p_track_description the structure to release
  }
procedure libvlc_track_description_list_release(p_track_description:Plibvlc_track_description_t);cdecl;external;
{* \defgroup libvlc_video LibVLC video controls
 * @
  }
{*
 * Toggle fullscreen status on non-embedded video outputs.
 *
 * @warning The same limitations applies to this function
 * as to libvlc_set_fullscreen().
 *
 * \param p_mi the media player
  }
procedure libvlc_toggle_fullscreen(p_mi:Plibvlc_media_player_t);cdecl;external;
{*
 * Enable or disable fullscreen.
 *
 * @warning With most window managers, only a top-level windows can be in
 * full-screen mode. Hence, this function will not operate properly if
 * libvlc_media_player_set_xwindow() was used to embed the video in a
 * non-top-level window. In that case, the embedding window must be reparented
 * to the root window <b>before</b> fullscreen mode is enabled. You will want
 * to reparent it back to its normal parent when disabling fullscreen.
 *
 * \param p_mi the media player
 * \param b_fullscreen boolean for fullscreen status
  }
procedure libvlc_set_fullscreen(p_mi:Plibvlc_media_player_t; b_fullscreen:longint);cdecl;external;
{*
 * Get current fullscreen status.
 *
 * \param p_mi the media player
 * \return the fullscreen status (boolean)
 *
 * \libvlc_return_bool
  }
function libvlc_get_fullscreen(p_mi:Plibvlc_media_player_t):longint;cdecl;external;
{*
 * Enable or disable key press events handling, according to the LibVLC hotkeys
 * configuration. By default and for historical reasons, keyboard events are
 * handled by the LibVLC video widget.
 *
 * \note On X11, there can be only one subscriber for key press and mouse
 * click events per window. If your application has subscribed to those events
 * for the X window ID of the video widget, then LibVLC will not be able to
 * handle key presses and mouse clicks in any case.
 *
 * \warning This function is only implemented for X11 and Win32 at the moment.
 *
 * \param p_mi the media player
 * \param on true to handle key press events, false to ignore them.
  }
procedure libvlc_video_set_key_input(p_mi:Plibvlc_media_player_t; on:dword);cdecl;external;
{*
 * Enable or disable mouse click events handling. By default, those events are
 * handled. This is needed for DVD menus to work, as well as a few video
 * filters such as "puzzle".
 *
 * \see libvlc_video_set_key_input().
 *
 * \warning This function is only implemented for X11 and Win32 at the moment.
 *
 * \param p_mi the media player
 * \param on true to handle mouse click events, false to ignore them.
  }
procedure libvlc_video_set_mouse_input(p_mi:Plibvlc_media_player_t; on:dword);cdecl;external;
{*
 * Get the pixel dimensions of a video.
 *
 * \param p_mi media player
 * \param num number of the video (starting from, and most commonly 0)
 * \param px pointer to get the pixel width [OUT]
 * \param py pointer to get the pixel height [OUT]
 * \return 0 on success, -1 if the specified video does not exist
  }
function libvlc_video_get_size(p_mi:Plibvlc_media_player_t; num:dword; px:Pdword; py:Pdword):longint;cdecl;external;
{*
 * Get the mouse pointer coordinates over a video.
 * Coordinates are expressed in terms of the decoded video resolution,
 * <b>not</b> in terms of pixels on the screen/viewport (to get the latter,
 * you can query your windowing system directly).
 *
 * Either of the coordinates may be negative or larger than the corresponding
 * dimension of the video, if the cursor is outside the rendering area.
 *
 * @warning The coordinates may be out-of-date if the pointer is not located
 * on the video rendering area. LibVLC does not track the pointer if it is
 * outside of the video widget.
 *
 * @note LibVLC does not support multiple pointers (it does of course support
 * multiple input devices sharing the same pointer) at the moment.
 *
 * \param p_mi media player
 * \param num number of the video (starting from, and most commonly 0)
 * \param px pointer to get the abscissa [OUT]
 * \param py pointer to get the ordinate [OUT]
 * \return 0 on success, -1 if the specified video does not exist
  }
function libvlc_video_get_cursor(p_mi:Plibvlc_media_player_t; num:dword; px:Plongint; py:Plongint):longint;cdecl;external;
{*
 * Get the current video scaling factor.
 * See also libvlc_video_set_scale().
 *
 * \param p_mi the media player
 * \return the currently configured zoom factor, or 0. if the video is set
 * to fit to the output window/drawable automatically.
  }
function libvlc_video_get_scale(p_mi:Plibvlc_media_player_t):single;cdecl;external;
{*
 * Set the video scaling factor. That is the ratio of the number of pixels on
 * screen to the number of pixels in the original decoded video in each
 * dimension. Zero is a special value; it will adjust the video to the output
 * window/drawable (in windowed mode) or the entire screen.
 *
 * Note that not all video outputs support scaling.
 *
 * \param p_mi the media player
 * \param f_factor the scaling factor, or zero
  }
procedure libvlc_video_set_scale(p_mi:Plibvlc_media_player_t; f_factor:single);cdecl;external;
{*
 * Get current video aspect ratio.
 *
 * \param p_mi the media player
 * \return the video aspect ratio or NULL if unspecified
 * (the result must be released with free() or libvlc_free()).
  }
function libvlc_video_get_aspect_ratio(p_mi:Plibvlc_media_player_t):Pchar;cdecl;external;
{*
 * Set new video aspect ratio.
 *
 * \param p_mi the media player
 * \param psz_aspect new video aspect-ratio or NULL to reset to default
 * \note Invalid aspect ratios are ignored.
  }
(* Const before type ignored *)
procedure libvlc_video_set_aspect_ratio(p_mi:Plibvlc_media_player_t; psz_aspect:Pchar);cdecl;external;
{*
 * Create a video viewpoint structure.
 *
 * \version LibVLC 3.0.0 and later
 *
 * \return video viewpoint or NULL
 *         (the result must be released with free() or libvlc_free()).
  }
function libvlc_video_new_viewpoint:Plibvlc_video_viewpoint_t;cdecl;external;
{*
 * Update the video viewpoint information.
 *
 * \note It is safe to call this function before the media player is started.
 *
 * \version LibVLC 3.0.0 and later
 *
 * \param p_mi the media player
 * \param p_viewpoint video viewpoint allocated via libvlc_video_new_viewpoint()
 * \param b_absolute if true replace the old viewpoint with the new one. If
 * false, increase/decrease it.
 * \return -1 in case of error, 0 otherwise
 *
 * \note the values are set asynchronously, it will be used by the next frame displayed.
  }
(* Const before type ignored *)
function libvlc_video_update_viewpoint(p_mi:Plibvlc_media_player_t; p_viewpoint:Plibvlc_video_viewpoint_t; b_absolute:Tbool):longint;cdecl;external;
{*
 * Get current video subtitle.
 *
 * \param p_mi the media player
 * \return the video subtitle selected, or -1 if none
  }
function libvlc_video_get_spu(p_mi:Plibvlc_media_player_t):longint;cdecl;external;
{*
 * Get the number of available video subtitles.
 *
 * \param p_mi the media player
 * \return the number of available video subtitles
  }
function libvlc_video_get_spu_count(p_mi:Plibvlc_media_player_t):longint;cdecl;external;
{*
 * Get the description of available video subtitles.
 *
 * \param p_mi the media player
 * \return list containing description of available video subtitles.
 * It must be freed with libvlc_track_description_list_release()
  }
function libvlc_video_get_spu_description(p_mi:Plibvlc_media_player_t):Plibvlc_track_description_t;cdecl;external;
{*
 * Set new video subtitle.
 *
 * \param p_mi the media player
 * \param i_spu video subtitle track to select (i_id from track description)
 * \return 0 on success, -1 if out of range
  }
function libvlc_video_set_spu(p_mi:Plibvlc_media_player_t; i_spu:longint):longint;cdecl;external;
{*
 * Get the current subtitle delay. Positive values means subtitles are being
 * displayed later, negative values earlier.
 *
 * \param p_mi media player
 * \return time (in microseconds) the display of subtitles is being delayed
 * \version LibVLC 2.0.0 or later
  }
function libvlc_video_get_spu_delay(p_mi:Plibvlc_media_player_t):Tint64_t;cdecl;external;
{*
 * Set the subtitle delay. This affects the timing of when the subtitle will
 * be displayed. Positive values result in subtitles being displayed later,
 * while negative values will result in subtitles being displayed earlier.
 *
 * The subtitle delay will be reset to zero each time the media changes.
 *
 * \param p_mi media player
 * \param i_delay time (in microseconds) the display of subtitles should be delayed
 * \return 0 on success, -1 on error
 * \version LibVLC 2.0.0 or later
  }
function libvlc_video_set_spu_delay(p_mi:Plibvlc_media_player_t; i_delay:Tint64_t):longint;cdecl;external;
{*
 * Get the full description of available titles
 *
 * \version LibVLC 3.0.0 and later.
 *
 * \param p_mi the media player
 * \param titles address to store an allocated array of title descriptions
 *        descriptions (must be freed with libvlc_title_descriptions_release()
 *        by the caller) [OUT]
 *
 * \return the number of titles (-1 on error)
  }
function libvlc_media_player_get_full_title_descriptions(p_mi:Plibvlc_media_player_t; titles:PPPlibvlc_title_description_t):longint;cdecl;external;
{*
 * Release a title description
 *
 * \version LibVLC 3.0.0 and later
 *
 * \param p_titles title description array to release
 * \param i_count number of title descriptions to release
  }
procedure libvlc_title_descriptions_release(p_titles:PPlibvlc_title_description_t; i_count:dword);cdecl;external;
{*
 * Get the full description of available chapters
 *
 * \version LibVLC 3.0.0 and later.
 *
 * \param p_mi the media player
 * \param i_chapters_of_title index of the title to query for chapters (uses current title if set to -1)
 * \param pp_chapters address to store an allocated array of chapter descriptions
 *        descriptions (must be freed with libvlc_chapter_descriptions_release()
 *        by the caller) [OUT]
 *
 * \return the number of chapters (-1 on error)
  }
function libvlc_media_player_get_full_chapter_descriptions(p_mi:Plibvlc_media_player_t; i_chapters_of_title:longint; pp_chapters:PPPlibvlc_chapter_description_t):longint;cdecl;external;
{*
 * Release a chapter description
 *
 * \version LibVLC 3.0.0 and later
 *
 * \param p_chapters chapter description array to release
 * \param i_count number of chapter descriptions to release
  }
procedure libvlc_chapter_descriptions_release(p_chapters:PPlibvlc_chapter_description_t; i_count:dword);cdecl;external;
{*
 * Get current crop filter geometry.
 *
 * \param p_mi the media player
 * \return the crop filter geometry or NULL if unset
  }
function libvlc_video_get_crop_geometry(p_mi:Plibvlc_media_player_t):Pchar;cdecl;external;
{*
 * Set new crop filter geometry.
 *
 * \param p_mi the media player
 * \param psz_geometry new crop filter geometry (NULL to unset)
  }
(* Const before type ignored *)
procedure libvlc_video_set_crop_geometry(p_mi:Plibvlc_media_player_t; psz_geometry:Pchar);cdecl;external;
{*
 * Get current teletext page requested or 0 if it's disabled.
 *
 * Teletext is disabled by default, call libvlc_video_set_teletext() to enable
 * it.
 *
 * \param p_mi the media player
 * \return the current teletext page requested.
  }
function libvlc_video_get_teletext(p_mi:Plibvlc_media_player_t):longint;cdecl;external;
{*
 * Set new teletext page to retrieve.
 *
 * This function can also be used to send a teletext key.
 *
 * \param p_mi the media player
 * \param i_page teletex page number requested. This value can be 0 to disable
 * teletext, a number in the range ]0;1000[ to show the requested page, or a
 * \ref libvlc_teletext_key_t. 100 is the default teletext page.
  }
procedure libvlc_video_set_teletext(p_mi:Plibvlc_media_player_t; i_page:longint);cdecl;external;
{*
 * Get number of available video tracks.
 *
 * \param p_mi media player
 * \return the number of available video tracks (int)
  }
function libvlc_video_get_track_count(p_mi:Plibvlc_media_player_t):longint;cdecl;external;
{*
 * Get the description of available video tracks.
 *
 * \param p_mi media player
 * \return list with description of available video tracks, or NULL on error.
 * It must be freed with libvlc_track_description_list_release()
  }
function libvlc_video_get_track_description(p_mi:Plibvlc_media_player_t):Plibvlc_track_description_t;cdecl;external;
{*
 * Get current video track.
 *
 * \param p_mi media player
 * \return the video track ID (int) or -1 if no active input
  }
function libvlc_video_get_track(p_mi:Plibvlc_media_player_t):longint;cdecl;external;
{*
 * Set video track.
 *
 * \param p_mi media player
 * \param i_track the track ID (i_id field from track description)
 * \return 0 on success, -1 if out of range
  }
function libvlc_video_set_track(p_mi:Plibvlc_media_player_t; i_track:longint):longint;cdecl;external;
{*
 * Take a snapshot of the current video window.
 *
 * If i_width AND i_height is 0, original size is used.
 * If i_width XOR i_height is 0, original aspect-ratio is preserved.
 *
 * \param p_mi media player instance
 * \param num number of video output (typically 0 for the first/only one)
 * \param psz_filepath the path of a file or a folder to save the screenshot into
 * \param i_width the snapshot's width
 * \param i_height the snapshot's height
 * \return 0 on success, -1 if the video was not found
  }
(* Const before type ignored *)
function libvlc_video_take_snapshot(p_mi:Plibvlc_media_player_t; num:dword; psz_filepath:Pchar; i_width:dword; i_height:dword):longint;cdecl;external;
{*
 * Enable or disable deinterlace filter
 *
 * \param p_mi libvlc media player
 * \param psz_mode type of deinterlace filter, NULL to disable
  }
(* Const before type ignored *)
procedure libvlc_video_set_deinterlace(p_mi:Plibvlc_media_player_t; psz_mode:Pchar);cdecl;external;
{*
 * Get an integer marquee option value
 *
 * \param p_mi libvlc media player
 * \param option marq option to get \see libvlc_video_marquee_int_option_t
  }
function libvlc_video_get_marquee_int(p_mi:Plibvlc_media_player_t; option:dword):longint;cdecl;external;
{*
 * Get a string marquee option value
 *
 * \param p_mi libvlc media player
 * \param option marq option to get \see libvlc_video_marquee_string_option_t
  }
function libvlc_video_get_marquee_string(p_mi:Plibvlc_media_player_t; option:dword):Pchar;cdecl;external;
{*
 * Enable, disable or set an integer marquee option
 *
 * Setting libvlc_marquee_Enable has the side effect of enabling (arg !0)
 * or disabling (arg 0) the marq filter.
 *
 * \param p_mi libvlc media player
 * \param option marq option to set \see libvlc_video_marquee_int_option_t
 * \param i_val marq option value
  }
procedure libvlc_video_set_marquee_int(p_mi:Plibvlc_media_player_t; option:dword; i_val:longint);cdecl;external;
{*
 * Set a marquee string option
 *
 * \param p_mi libvlc media player
 * \param option marq option to set \see libvlc_video_marquee_string_option_t
 * \param psz_text marq option value
  }
(* Const before type ignored *)
procedure libvlc_video_set_marquee_string(p_mi:Plibvlc_media_player_t; option:dword; psz_text:Pchar);cdecl;external;
{* option values for libvlc_video_get,set_logo_int,string  }
{*< string argument, "file,d,t;file,d,t;..."  }
type
  Tlibvlc_video_logo_option_t =  Longint;
  Const
    libvlc_logo_enable = 0;
    libvlc_logo_file = 1;
    libvlc_logo_x = 2;
    libvlc_logo_y = 3;
    libvlc_logo_delay = 4;
    libvlc_logo_repeat = 5;
    libvlc_logo_opacity = 6;
    libvlc_logo_position = 7;

{*
 * Get integer logo option.
 *
 * \param p_mi libvlc media player instance
 * \param option logo option to get, values of libvlc_video_logo_option_t
  }

function libvlc_video_get_logo_int(p_mi:Plibvlc_media_player_t; option:dword):longint;cdecl;external;
{*
 * Set logo option as integer. Options that take a different type value
 * are ignored.
 * Passing libvlc_logo_enable as option value has the side effect of
 * starting (arg !0) or stopping (arg 0) the logo filter.
 *
 * \param p_mi libvlc media player instance
 * \param option logo option to set, values of libvlc_video_logo_option_t
 * \param value logo option value
  }
procedure libvlc_video_set_logo_int(p_mi:Plibvlc_media_player_t; option:dword; value:longint);cdecl;external;
{*
 * Set logo option as string. Options that take a different type value
 * are ignored.
 *
 * \param p_mi libvlc media player instance
 * \param option logo option to set, values of libvlc_video_logo_option_t
 * \param psz_value logo option value
  }
(* Const before type ignored *)
procedure libvlc_video_set_logo_string(p_mi:Plibvlc_media_player_t; option:dword; psz_value:Pchar);cdecl;external;
{* option values for libvlc_video_get,set_adjust_int,float,bool  }
type
  Tlibvlc_video_adjust_option_t =  Longint;
  Const
    libvlc_adjust_Enable = 0;
    libvlc_adjust_Contrast = 1;
    libvlc_adjust_Brightness = 2;
    libvlc_adjust_Hue = 3;
    libvlc_adjust_Saturation = 4;
    libvlc_adjust_Gamma = 5;

{*
 * Get integer adjust option.
 *
 * \param p_mi libvlc media player instance
 * \param option adjust option to get, values of libvlc_video_adjust_option_t
 * \version LibVLC 1.1.1 and later.
  }

function libvlc_video_get_adjust_int(p_mi:Plibvlc_media_player_t; option:dword):longint;cdecl;external;
{*
 * Set adjust option as integer. Options that take a different type value
 * are ignored.
 * Passing libvlc_adjust_enable as option value has the side effect of
 * starting (arg !0) or stopping (arg 0) the adjust filter.
 *
 * \param p_mi libvlc media player instance
 * \param option adust option to set, values of libvlc_video_adjust_option_t
 * \param value adjust option value
 * \version LibVLC 1.1.1 and later.
  }
procedure libvlc_video_set_adjust_int(p_mi:Plibvlc_media_player_t; option:dword; value:longint);cdecl;external;
{*
 * Get float adjust option.
 *
 * \param p_mi libvlc media player instance
 * \param option adjust option to get, values of libvlc_video_adjust_option_t
 * \version LibVLC 1.1.1 and later.
  }
function libvlc_video_get_adjust_float(p_mi:Plibvlc_media_player_t; option:dword):single;cdecl;external;
{*
 * Set adjust option as float. Options that take a different type value
 * are ignored.
 *
 * \param p_mi libvlc media player instance
 * \param option adust option to set, values of libvlc_video_adjust_option_t
 * \param value adjust option value
 * \version LibVLC 1.1.1 and later.
  }
procedure libvlc_video_set_adjust_float(p_mi:Plibvlc_media_player_t; option:dword; value:single);cdecl;external;
{* @ video  }
{* \defgroup libvlc_audio LibVLC audio controls
 * @
  }
{*
 * Audio device types
  }
type
  Plibvlc_audio_output_device_types_t = ^Tlibvlc_audio_output_device_types_t;
  Tlibvlc_audio_output_device_types_t =  Longint;
  Const
    libvlc_AudioOutputDevice_Error = -(1);
    libvlc_AudioOutputDevice_Mono = 1;
    libvlc_AudioOutputDevice_Stereo = 2;
    libvlc_AudioOutputDevice_2F2R = 4;
    libvlc_AudioOutputDevice_3F2R = 5;
    libvlc_AudioOutputDevice_5_1 = 6;
    libvlc_AudioOutputDevice_6_1 = 7;
    libvlc_AudioOutputDevice_7_1 = 8;
    libvlc_AudioOutputDevice_SPDIF = 10;
;
{*
 * Audio channels
  }
type
  Plibvlc_audio_output_channel_t = ^Tlibvlc_audio_output_channel_t;
  Tlibvlc_audio_output_channel_t =  Longint;
  Const
    libvlc_AudioChannel_Error = -(1);
    libvlc_AudioChannel_Stereo = 1;
    libvlc_AudioChannel_RStereo = 2;
    libvlc_AudioChannel_Left = 3;
    libvlc_AudioChannel_Right = 4;
    libvlc_AudioChannel_Dolbys = 5;
;
{*
 * Gets the list of available audio output modules.
 *
 * \param p_instance libvlc instance
 * \return list of available audio outputs. It must be freed with
*          \see libvlc_audio_output_list_release \see libvlc_audio_output_t .
 *         In case of error, NULL is returned.
  }

function libvlc_audio_output_list_get(p_instance:Plibvlc_instance_t):Plibvlc_audio_output_t;cdecl;external;
{*
 * Frees the list of available audio output modules.
 *
 * \param p_list list with audio outputs for release
  }
procedure libvlc_audio_output_list_release(p_list:Plibvlc_audio_output_t);cdecl;external;
{*
 * Selects an audio output module.
 * \note Any change will take be effect only after playback is stopped and
 * restarted. Audio output cannot be changed while playing.
 *
 * \param p_mi media player
 * \param psz_name name of audio output,
 *               use psz_name of \see libvlc_audio_output_t
 * \return 0 if function succeeded, -1 on error
  }
(* Const before type ignored *)
function libvlc_audio_output_set(p_mi:Plibvlc_media_player_t; psz_name:Pchar):longint;cdecl;external;
{*
 * Gets a list of potential audio output devices,
 * \see libvlc_audio_output_device_set().
 *
 * \note Not all audio outputs support enumerating devices.
 * The audio output may be functional even if the list is empty (NULL).
 *
 * \note The list may not be exhaustive.
 *
 * \warning Some audio output devices in the list might not actually work in
 * some circumstances. By default, it is recommended to not specify any
 * explicit audio device.
 *
 * \param mp media player
 * \return A NULL-terminated linked list of potential audio output devices.
 * It must be freed with libvlc_audio_output_device_list_release()
 * \version LibVLC 2.2.0 or later.
  }
function libvlc_audio_output_device_enum(mp:Plibvlc_media_player_t):Plibvlc_audio_output_device_t;cdecl;external;
{*
 * Gets a list of audio output devices for a given audio output module,
 * \see libvlc_audio_output_device_set().
 *
 * \note Not all audio outputs support this. In particular, an empty (NULL)
 * list of devices does <b>not</b> imply that the specified audio output does
 * not work.
 *
 * \note The list might not be exhaustive.
 *
 * \warning Some audio output devices in the list might not actually work in
 * some circumstances. By default, it is recommended to not specify any
 * explicit audio device.
 *
 * \param p_instance libvlc instance
 * \param aout audio output name
 *                 (as returned by libvlc_audio_output_list_get())
 * \return A NULL-terminated linked list of potential audio output devices.
 * It must be freed with libvlc_audio_output_device_list_release()
 * \version LibVLC 2.1.0 or later.
  }
(* Const before type ignored *)
function libvlc_audio_output_device_list_get(p_instance:Plibvlc_instance_t; aout:Pchar):Plibvlc_audio_output_device_t;cdecl;external;
{*
 * Frees a list of available audio output devices.
 *
 * \param p_list list with audio outputs for release
 * \version LibVLC 2.1.0 or later.
  }
procedure libvlc_audio_output_device_list_release(p_list:Plibvlc_audio_output_device_t);cdecl;external;
{*
 * Configures an explicit audio output device.
 *
 * If the module paramater is NULL, audio output will be moved to the device
 * specified by the device identifier string immediately. This is the
 * recommended usage.
 *
 * A list of adequate potential device strings can be obtained with
 * libvlc_audio_output_device_enum().
 *
 * However passing NULL is supported in LibVLC version 2.2.0 and later only;
 * in earlier versions, this function would have no effects when the module
 * parameter was NULL.
 *
 * If the module parameter is not NULL, the device parameter of the
 * corresponding audio output, if it exists, will be set to the specified
 * string. Note that some audio output modules do not have such a parameter
 * (notably MMDevice and PulseAudio).
 *
 * A list of adequate potential device strings can be obtained with
 * libvlc_audio_output_device_list_get().
 *
 * \note This function does not select the specified audio output plugin.
 * libvlc_audio_output_set() is used for that purpose.
 *
 * \warning The syntax for the device parameter depends on the audio output.
 *
 * Some audio output modules require further parameters (e.g. a channels map
 * in the case of ALSA).
 *
 * \param mp media player
 * \param module If NULL, current audio output module.
 *               if non-NULL, name of audio output module
                 (\see libvlc_audio_output_t)
 * \param device_id device identifier string
 * \return Nothing. Errors are ignored (this is a design bug).
  }
(* Const before type ignored *)
(* Const before type ignored *)
procedure libvlc_audio_output_device_set(mp:Plibvlc_media_player_t; module:Pchar; device_id:Pchar);cdecl;external;
{*
 * Get the current audio output device identifier.
 *
 * This complements libvlc_audio_output_device_set().
 *
 * \warning The initial value for the current audio output device identifier
 * may not be set or may be some unknown value. A LibVLC application should
 * compare this value against the known device identifiers (e.g. those that
 * were previously retrieved by a call to libvlc_audio_output_device_enum or
 * libvlc_audio_output_device_list_get) to find the current audio output device.
 *
 * It is possible that the selected audio output device changes (an external
 * change) without a call to libvlc_audio_output_device_set. That may make this
 * method unsuitable to use if a LibVLC application is attempting to track
 * dynamic audio device changes as they happen.
 *
 * \param mp media player
 * \return the current audio output device identifier
 *         NULL if no device is selected or in case of error
 *         (the result must be released with free() or libvlc_free()).
 * \version LibVLC 3.0.0 or later.
  }
function libvlc_audio_output_device_get(mp:Plibvlc_media_player_t):Pchar;cdecl;external;
{*
 * Toggle mute status.
 *
 * \param p_mi media player
 * \warning Toggling mute atomically is not always possible: On some platforms,
 * other processes can mute the VLC audio playback stream asynchronously. Thus,
 * there is a small race condition where toggling will not work.
 * See also the limitations of libvlc_audio_set_mute().
  }
procedure libvlc_audio_toggle_mute(p_mi:Plibvlc_media_player_t);cdecl;external;
{*
 * Get current mute status.
 *
 * \param p_mi media player
 * \return the mute status (boolean) if defined, -1 if undefined/unapplicable
  }
function libvlc_audio_get_mute(p_mi:Plibvlc_media_player_t):longint;cdecl;external;
{*
 * Set mute status.
 *
 * \param p_mi media player
 * \param status If status is true then mute, otherwise unmute
 * \warning This function does not always work. If there are no active audio
 * playback stream, the mute status might not be available. If digital
 * pass-through (S/PDIF, HDMI...) is in use, muting may be unapplicable. Also
 * some audio output plugins do not support muting at all.
 * \note To force silent playback, disable all audio tracks. This is more
 * efficient and reliable than mute.
  }
procedure libvlc_audio_set_mute(p_mi:Plibvlc_media_player_t; status:longint);cdecl;external;
{*
 * Get current software audio volume.
 *
 * \param p_mi media player
 * \return the software volume in percents
 * (0 = mute, 100 = nominal / 0dB)
  }
function libvlc_audio_get_volume(p_mi:Plibvlc_media_player_t):longint;cdecl;external;
{*
 * Set current software audio volume.
 *
 * \param p_mi media player
 * \param i_volume the volume in percents (0 = mute, 100 = 0dB)
 * \return 0 if the volume was set, -1 if it was out of range
  }
function libvlc_audio_set_volume(p_mi:Plibvlc_media_player_t; i_volume:longint):longint;cdecl;external;
{*
 * Get number of available audio tracks.
 *
 * \param p_mi media player
 * \return the number of available audio tracks (int), or -1 if unavailable
  }
function libvlc_audio_get_track_count(p_mi:Plibvlc_media_player_t):longint;cdecl;external;
{*
 * Get the description of available audio tracks.
 *
 * \param p_mi media player
 * \return list with description of available audio tracks, or NULL.
 * It must be freed with libvlc_track_description_list_release()
  }
function libvlc_audio_get_track_description(p_mi:Plibvlc_media_player_t):Plibvlc_track_description_t;cdecl;external;
{*
 * Get current audio track.
 *
 * \param p_mi media player
 * \return the audio track ID or -1 if no active input.
  }
function libvlc_audio_get_track(p_mi:Plibvlc_media_player_t):longint;cdecl;external;
{*
 * Set current audio track.
 *
 * \param p_mi media player
 * \param i_track the track ID (i_id field from track description)
 * \return 0 on success, -1 on error
  }
function libvlc_audio_set_track(p_mi:Plibvlc_media_player_t; i_track:longint):longint;cdecl;external;
{*
 * Get current audio channel.
 *
 * \param p_mi media player
 * \return the audio channel \see libvlc_audio_output_channel_t
  }
function libvlc_audio_get_channel(p_mi:Plibvlc_media_player_t):longint;cdecl;external;
{*
 * Set current audio channel.
 *
 * \param p_mi media player
 * \param channel the audio channel, \see libvlc_audio_output_channel_t
 * \return 0 on success, -1 on error
  }
function libvlc_audio_set_channel(p_mi:Plibvlc_media_player_t; channel:longint):longint;cdecl;external;
{*
 * Get current audio delay.
 *
 * \param p_mi media player
 * \return the audio delay (microseconds)
 * \version LibVLC 1.1.1 or later
  }
function libvlc_audio_get_delay(p_mi:Plibvlc_media_player_t):Tint64_t;cdecl;external;
{*
 * Set current audio delay. The audio delay will be reset to zero each time the media changes.
 *
 * \param p_mi media player
 * \param i_delay the audio delay (microseconds)
 * \return 0 on success, -1 on error
 * \version LibVLC 1.1.1 or later
  }
function libvlc_audio_set_delay(p_mi:Plibvlc_media_player_t; i_delay:Tint64_t):longint;cdecl;external;
{*
 * Get the number of equalizer presets.
 *
 * \return number of presets
 * \version LibVLC 2.2.0 or later
  }
function libvlc_audio_equalizer_get_preset_count:dword;cdecl;external;
{*
 * Get the name of a particular equalizer preset.
 *
 * This name can be used, for example, to prepare a preset label or menu in a user
 * interface.
 *
 * \param u_index index of the preset, counting from zero
 * \return preset name, or NULL if there is no such preset
 * \version LibVLC 2.2.0 or later
  }
(* Const before type ignored *)
function libvlc_audio_equalizer_get_preset_name(u_index:dword):Pchar;cdecl;external;
{*
 * Get the number of distinct frequency bands for an equalizer.
 *
 * \return number of frequency bands
 * \version LibVLC 2.2.0 or later
  }
function libvlc_audio_equalizer_get_band_count:dword;cdecl;external;
{*
 * Get a particular equalizer band frequency.
 *
 * This value can be used, for example, to create a label for an equalizer band control
 * in a user interface.
 *
 * \param u_index index of the band, counting from zero
 * \return equalizer band frequency (Hz), or -1 if there is no such band
 * \version LibVLC 2.2.0 or later
  }
function libvlc_audio_equalizer_get_band_frequency(u_index:dword):single;cdecl;external;
{*
 * Create a new default equalizer, with all frequency values zeroed.
 *
 * The new equalizer can subsequently be applied to a media player by invoking
 * libvlc_media_player_set_equalizer().
 *
 * The returned handle should be freed via libvlc_audio_equalizer_release() when
 * it is no longer needed.
 *
 * \return opaque equalizer handle, or NULL on error
 * \version LibVLC 2.2.0 or later
  }
function libvlc_audio_equalizer_new:Plibvlc_equalizer_t;cdecl;external;
{*
 * Create a new equalizer, with initial frequency values copied from an existing
 * preset.
 *
 * The new equalizer can subsequently be applied to a media player by invoking
 * libvlc_media_player_set_equalizer().
 *
 * The returned handle should be freed via libvlc_audio_equalizer_release() when
 * it is no longer needed.
 *
 * \param u_index index of the preset, counting from zero
 * \return opaque equalizer handle, or NULL on error
 * \version LibVLC 2.2.0 or later
  }
function libvlc_audio_equalizer_new_from_preset(u_index:dword):Plibvlc_equalizer_t;cdecl;external;
{*
 * Release a previously created equalizer instance.
 *
 * The equalizer was previously created by using libvlc_audio_equalizer_new() or
 * libvlc_audio_equalizer_new_from_preset().
 *
 * It is safe to invoke this method with a NULL p_equalizer parameter for no effect.
 *
 * \param p_equalizer opaque equalizer handle, or NULL
 * \version LibVLC 2.2.0 or later
  }
procedure libvlc_audio_equalizer_release(p_equalizer:Plibvlc_equalizer_t);cdecl;external;
{*
 * Set a new pre-amplification value for an equalizer.
 *
 * The new equalizer settings are subsequently applied to a media player by invoking
 * libvlc_media_player_set_equalizer().
 *
 * The supplied amplification value will be clamped to the -20.0 to +20.0 range.
 *
 * \param p_equalizer valid equalizer handle, must not be NULL
 * \param f_preamp preamp value (-20.0 to 20.0 Hz)
 * \return zero on success, -1 on error
 * \version LibVLC 2.2.0 or later
  }
function libvlc_audio_equalizer_set_preamp(p_equalizer:Plibvlc_equalizer_t; f_preamp:single):longint;cdecl;external;
{*
 * Get the current pre-amplification value from an equalizer.
 *
 * \param p_equalizer valid equalizer handle, must not be NULL
 * \return preamp value (Hz)
 * \version LibVLC 2.2.0 or later
  }
function libvlc_audio_equalizer_get_preamp(p_equalizer:Plibvlc_equalizer_t):single;cdecl;external;
{*
 * Set a new amplification value for a particular equalizer frequency band.
 *
 * The new equalizer settings are subsequently applied to a media player by invoking
 * libvlc_media_player_set_equalizer().
 *
 * The supplied amplification value will be clamped to the -20.0 to +20.0 range.
 *
 * \param p_equalizer valid equalizer handle, must not be NULL
 * \param f_amp amplification value (-20.0 to 20.0 Hz)
 * \param u_band index, counting from zero, of the frequency band to set
 * \return zero on success, -1 on error
 * \version LibVLC 2.2.0 or later
  }
function libvlc_audio_equalizer_set_amp_at_index(p_equalizer:Plibvlc_equalizer_t; f_amp:single; u_band:dword):longint;cdecl;external;
{*
 * Get the amplification value for a particular equalizer frequency band.
 *
 * \param p_equalizer valid equalizer handle, must not be NULL
 * \param u_band index, counting from zero, of the frequency band to get
 * \return amplification value (Hz); NaN if there is no such frequency band
 * \version LibVLC 2.2.0 or later
  }
function libvlc_audio_equalizer_get_amp_at_index(p_equalizer:Plibvlc_equalizer_t; u_band:dword):single;cdecl;external;
{*
 * Apply new equalizer settings to a media player.
 *
 * The equalizer is first created by invoking libvlc_audio_equalizer_new() or
 * libvlc_audio_equalizer_new_from_preset().
 *
 * It is possible to apply new equalizer settings to a media player whether the media
 * player is currently playing media or not.
 *
 * Invoking this method will immediately apply the new equalizer settings to the audio
 * output of the currently playing media if there is any.
 *
 * If there is no currently playing media, the new equalizer settings will be applied
 * later if and when new media is played.
 *
 * Equalizer settings will automatically be applied to subsequently played media.
 *
 * To disable the equalizer for a media player invoke this method passing NULL for the
 * p_equalizer parameter.
 *
 * The media player does not keep a reference to the supplied equalizer so it is safe
 * for an application to release the equalizer reference any time after this method
 * returns.
 *
 * \param p_mi opaque media player handle
 * \param p_equalizer opaque equalizer handle, or NULL to disable the equalizer for this media player
 * \return zero on success, -1 on error
 * \version LibVLC 2.2.0 or later
  }
function libvlc_media_player_set_equalizer(p_mi:Plibvlc_media_player_t; p_equalizer:Plibvlc_equalizer_t):longint;cdecl;external;
{*
 * Media player roles.
 *
 * \version LibVLC 3.0.0 and later.
 *
 * See \ref libvlc_media_player_set_role()
  }
{*< Don't use a media player role  }
{*< Music (or radio) playback  }
{*< Video playback  }
{*< Speech, real-time communication  }
{*< Video game  }
{*< User interaction feedback  }
{*< Embedded animation (e.g. in web page)  }
{*< Audio editting/production  }
{*< Accessibility  }
{* Testing  }
type
  Plibvlc_media_player_role = ^Tlibvlc_media_player_role;
  Tlibvlc_media_player_role =  Longint;
  Const
    libvlc_role_None = 0;
    libvlc_role_Music = 1;
    libvlc_role_Video = 2;
    libvlc_role_Communication = 3;
    libvlc_role_Game = 4;
    libvlc_role_Notification = 5;
    libvlc_role_Animation = 6;
    libvlc_role_Production = 7;
    libvlc_role_Accessibility = 8;
    libvlc_role_Test = 9;
;
  Tlibvlc_media_player_role_t = Tlibvlc_media_player_role;
  Plibvlc_media_player_role_t = ^Tlibvlc_media_player_role_t;
  libvlc_role_Last = libvlc_role_Test;  
{*
 * Gets the media role.
 *
 * \version LibVLC 3.0.0 and later.
 *
 * \param p_mi media player
 * \return the media player role (\ref libvlc_media_player_role_t)
  }

function libvlc_media_player_get_role(p_mi:Plibvlc_media_player_t):longint;cdecl;external;
{*
 * Sets the media role.
 *
 * \param p_mi media player
 * \param role the media player role (\ref libvlc_media_player_role_t)
 * \return 0 on success, -1 on error
  }
function libvlc_media_player_set_role(p_mi:Plibvlc_media_player_t; role:dword):longint;cdecl;external;
{* @ audio  }
{* @ media_player  }
{$endif}
{ VLC_LIBVLC_MEDIA_PLAYER_H  }

implementation


end.
