
unit libvlc_media;
interface

{
  Automatically converted by H2Pas 1.0.0 from libvlc_media.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    libvlc_media.h
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
Plibvlc_audio_track_t  = ^libvlc_audio_track_t;
Plibvlc_event_manager_t  = ^libvlc_event_manager_t;
Plibvlc_instance_t  = ^libvlc_instance_t;
Plibvlc_media_list_t  = ^libvlc_media_list_t;
Plibvlc_media_parse_flag_t  = ^libvlc_media_parse_flag_t;
Plibvlc_media_parsed_status_t  = ^libvlc_media_parsed_status_t;
Plibvlc_media_slave_t  = ^libvlc_media_slave_t;
Plibvlc_media_slave_type_t  = ^libvlc_media_slave_type_t;
Plibvlc_media_stats_t  = ^libvlc_media_stats_t;
Plibvlc_media_t  = ^libvlc_media_t;
Plibvlc_media_track_info_t  = ^libvlc_media_track_info_t;
Plibvlc_media_track_t  = ^libvlc_media_track_t;
Plibvlc_media_type_t  = ^libvlc_media_type_t;
Plibvlc_meta_t  = ^libvlc_meta_t;
Plibvlc_state_t  = ^libvlc_state_t;
Plibvlc_subtitle_track_t  = ^libvlc_subtitle_track_t;
Plibvlc_track_type_t  = ^libvlc_track_type_t;
Plibvlc_video_orient_t  = ^libvlc_video_orient_t;
Plibvlc_video_projection_t  = ^libvlc_video_projection_t;
Plibvlc_video_track_t  = ^libvlc_video_track_t;
Plibvlc_video_viewpoint_t  = ^libvlc_video_viewpoint_t;
Puint64_t  = ^uint64_t;
Pxxxxxxxxx  = ^xxxxxxxxx;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{****************************************************************************
 * libvlc_media.h:  libvlc external API
 *****************************************************************************
 * Copyright (C) 1998-2009 VLC authors and VideoLAN
 * $Id: 383f366b6940f7b3d89f5945e015793833ea541f $
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
{$ifndef VLC_LIBVLC_MEDIA_H}

const
  VLC_LIBVLC_MEDIA_H = 1;  
{* \defgroup libvlc_media LibVLC media
 * \ingroup libvlc
 * @ref libvlc_media_t is an abstract representation of a playable media.
 * It consists of a media location and various optional meta data.
 * @
 * \file
 * LibVLC media item/descriptor external API
  }
type
{* Meta data types  }
{ Add new meta types HERE  }

  Plibvlc_meta_t = ^Tlibvlc_meta_t;
  Tlibvlc_meta_t =  Longint;
  Const
    libvlc_meta_Title = 0;
    libvlc_meta_Artist = 1;
    libvlc_meta_Genre = 2;
    libvlc_meta_Copyright = 3;
    libvlc_meta_Album = 4;
    libvlc_meta_TrackNumber = 5;
    libvlc_meta_Description = 6;
    libvlc_meta_Rating = 7;
    libvlc_meta_Date = 8;
    libvlc_meta_Setting = 9;
    libvlc_meta_URL = 10;
    libvlc_meta_Language = 11;
    libvlc_meta_NowPlaying = 12;
    libvlc_meta_Publisher = 13;
    libvlc_meta_EncodedBy = 14;
    libvlc_meta_ArtworkURL = 15;
    libvlc_meta_TrackID = 16;
    libvlc_meta_TrackTotal = 17;
    libvlc_meta_Director = 18;
    libvlc_meta_Season = 19;
    libvlc_meta_Episode = 20;
    libvlc_meta_ShowName = 21;
    libvlc_meta_Actors = 22;
    libvlc_meta_AlbumArtist = 23;
    libvlc_meta_DiscNumber = 24;
    libvlc_meta_DiscTotal = 25;
;
{*
 * Note the order of libvlc_state_t enum must match exactly the order of
 * \see mediacontrol_PlayerStatus, \see input_state_e enums,
 * and VideoLAN.LibVLC.State (at bindings/cil/src/media.cs).
 *
 * Expected states by web plugins are:
 * IDLE/CLOSE=0, OPENING=1, PLAYING=3, PAUSED=4,
 * STOPPING=5, ENDED=6, ERROR=7
  }
{ XXX: Deprecated value. Check the
                       * libvlc_MediaPlayerBuffering event to know the
                       * buffering state of a libvlc_media_player  }
type
  Plibvlc_state_t = ^Tlibvlc_state_t;
  Tlibvlc_state_t =  Longint;
  Const
    libvlc_NothingSpecial = 0;
    libvlc_Opening = 1;
    libvlc_Buffering = 2;
    libvlc_Playing = 3;
    libvlc_Paused = 4;
    libvlc_Stopped = 5;
    libvlc_Ended = 6;
    libvlc_Error = 7;
;
type
  Txxxxxxxxx =  Longint;
  Const
    libvlc_media_option_trusted = $2;
    libvlc_media_option_unique = $100;

type
  Plibvlc_track_type_t = ^Tlibvlc_track_type_t;
  Tlibvlc_track_type_t =  Longint;
  Const
    libvlc_track_unknown = -(1);
    libvlc_track_audio = 0;
    libvlc_track_video = 1;
    libvlc_track_text = 2;
;
{ Input  }
{ Demux  }
{ Decoders  }
{ Video Output  }
{ Audio output  }
{ Stream output  }
type
  Plibvlc_media_stats_t = ^Tlibvlc_media_stats_t;
  Tlibvlc_media_stats_t = record
      i_read_bytes : longint;
      f_input_bitrate : single;
      i_demux_read_bytes : longint;
      f_demux_bitrate : single;
      i_demux_corrupted : longint;
      i_demux_discontinuity : longint;
      i_decoded_video : longint;
      i_decoded_audio : longint;
      i_displayed_pictures : longint;
      i_lost_pictures : longint;
      i_played_abuffers : longint;
      i_lost_abuffers : longint;
      i_sent_packets : longint;
      i_sent_bytes : longint;
      f_send_bitrate : single;
    end;
{ Codec fourcc  }
{ Codec specific  }
{ Audio specific  }
{ Video specific  }

  Plibvlc_media_track_info_t = ^Tlibvlc_media_track_info_t;
  Tlibvlc_media_track_info_t = record
      i_codec : Tuint32_t;
      i_id : longint;
      i_type : Tlibvlc_track_type_t;
      i_profile : longint;
      i_level : longint;
      u : record
          case longint of
            0 : ( audio : record
                i_channels : dword;
                i_rate : dword;
              end );
            1 : ( video : record
                i_height : dword;
                i_width : dword;
              end );
          end;
    end;

  Plibvlc_audio_track_t = ^Tlibvlc_audio_track_t;
  Tlibvlc_audio_track_t = record
      i_channels : dword;
      i_rate : dword;
    end;
{*< Normal. Top line represents top, left column left.  }
{*< Flipped horizontally  }
{*< Flipped vertically  }
{*< Rotated 180 degrees  }
{*< Transposed  }
{*< Rotated 90 degrees clockwise (or 270 anti-clockwise)  }
{*< Rotated 90 degrees anti-clockwise  }
{*< Anti-transposed  }

  Plibvlc_video_orient_t = ^Tlibvlc_video_orient_t;
  Tlibvlc_video_orient_t =  Longint;
  Const
    libvlc_video_orient_top_left = 0;
    libvlc_video_orient_top_right = 1;
    libvlc_video_orient_bottom_left = 2;
    libvlc_video_orient_bottom_right = 3;
    libvlc_video_orient_left_top = 4;
    libvlc_video_orient_left_bottom = 5;
    libvlc_video_orient_right_top = 6;
    libvlc_video_orient_right_bottom = 7;
;
{*< 360 spherical  }
type
  Plibvlc_video_projection_t = ^Tlibvlc_video_projection_t;
  Tlibvlc_video_projection_t =  Longint;
  Const
    libvlc_video_projection_rectangular = 0;
    libvlc_video_projection_equirectangular = 1;
    libvlc_video_projection_cubemap_layout_standard = $100;
;
{*
 * Viewpoint
 *
 * \warning allocate using libvlc_video_new_viewpoint()
  }
{*< view point yaw in degrees  ]-180;180]  }
{*< view point pitch in degrees  ]-90;90]  }
{*< view point roll in degrees ]-180;180]  }
{*< field of view in degrees ]0;180[ (default 80.) }
type
  Plibvlc_video_viewpoint_t = ^Tlibvlc_video_viewpoint_t;
  Tlibvlc_video_viewpoint_t = record
      f_yaw : single;
      f_pitch : single;
      f_roll : single;
      f_field_of_view : single;
    end;
{*< Initial view point  }

  Plibvlc_video_track_t = ^Tlibvlc_video_track_t;
  Tlibvlc_video_track_t = record
      i_height : dword;
      i_width : dword;
      i_sar_num : dword;
      i_sar_den : dword;
      i_frame_rate_num : dword;
      i_frame_rate_den : dword;
      i_orientation : Tlibvlc_video_orient_t;
      i_projection : Tlibvlc_video_projection_t;
      pose : Tlibvlc_video_viewpoint_t;
    end;

  Plibvlc_subtitle_track_t = ^Tlibvlc_subtitle_track_t;
  Tlibvlc_subtitle_track_t = record
      psz_encoding : Pchar;
    end;
{ Codec fourcc  }
{ Codec specific  }

  Plibvlc_media_track_t = ^Tlibvlc_media_track_t;
  Tlibvlc_media_track_t = record
      i_codec : Tuint32_t;
      i_original_fourcc : Tuint32_t;
      i_id : longint;
      i_type : Tlibvlc_track_type_t;
      i_profile : longint;
      i_level : longint;
      xxxxxxx : record
          case longint of
            0 : ( audio : Plibvlc_audio_track_t );
            1 : ( video : Plibvlc_video_track_t );
            2 : ( subtitle : Plibvlc_subtitle_track_t );
          end;
      i_bitrate : dword;
      psz_language : Pchar;
      psz_description : Pchar;
    end;
{*
 * Media type
 *
 * \see libvlc_media_get_type
  }

  Plibvlc_media_type_t = ^Tlibvlc_media_type_t;
  Tlibvlc_media_type_t =  Longint;
  Const
    libvlc_media_type_unknown = 0;
    libvlc_media_type_file = 1;
    libvlc_media_type_directory = 2;
    libvlc_media_type_disc = 3;
    libvlc_media_type_stream = 4;
    libvlc_media_type_playlist = 5;
;
{*
 * Parse flags used by libvlc_media_parse_with_options()
 *
 * \see libvlc_media_parse_with_options
  }
{*
     * Parse media if it's a local file
      }
{*
     * Parse media even if it's a network file
      }
{*
     * Fetch meta and covert art using local resources
      }
{*
     * Fetch meta and covert art using network resources
      }
{*
     * Interact with the user (via libvlc_dialog_cbs) when preparsing this item
     * (and not its sub items). Set this flag in order to receive a callback
     * when the input is asking for credentials.
      }
type
  Plibvlc_media_parse_flag_t = ^Tlibvlc_media_parse_flag_t;
  Tlibvlc_media_parse_flag_t =  Longint;
  Const
    libvlc_media_parse_local = $00;
    libvlc_media_parse_network = $01;
    libvlc_media_fetch_local = $02;
    libvlc_media_fetch_network = $04;
    libvlc_media_do_interact = $08;
;
{*
 * Parse status used sent by libvlc_media_parse_with_options() or returned by
 * libvlc_media_get_parsed_status()
 *
 * \see libvlc_media_parse_with_options
 * \see libvlc_media_get_parsed_status
  }
type
  Plibvlc_media_parsed_status_t = ^Tlibvlc_media_parsed_status_t;
  Tlibvlc_media_parsed_status_t =  Longint;
  Const
    libvlc_media_parsed_status_skipped = 1;
    libvlc_media_parsed_status_failed = 2;
    libvlc_media_parsed_status_timeout = 3;
    libvlc_media_parsed_status_done = 4;
;
{*
 * Type of a media slave: subtitle or audio.
  }
type
  Plibvlc_media_slave_type_t = ^Tlibvlc_media_slave_type_t;
  Tlibvlc_media_slave_type_t =  Longint;
  Const
    libvlc_media_slave_type_subtitle = 0;
    libvlc_media_slave_type_audio = 1;
;
{*
 * A slave of a libvlc_media_t
 * \see libvlc_media_slaves_get
  }
type
  Plibvlc_media_slave_t = ^Tlibvlc_media_slave_t;
  Tlibvlc_media_slave_t = record
      psz_uri : Pchar;
      i_type : Tlibvlc_media_slave_type_t;
      i_priority : dword;
    end;
{*
 * Callback prototype to open a custom bitstream input media.
 *
 * The same media item can be opened multiple times. Each time, this callback
 * is invoked. It should allocate and initialize any instance-specific
 * resources, then store them in *datap. The instance resources can be freed
 * in the @ref libvlc_media_close_cb callback.
 *
 * \param opaque private pointer as passed to libvlc_media_new_callbacks()
 * \param datap storage space for a private data pointer [OUT]
 * \param sizep byte length of the bitstream or UINT64_MAX if unknown [OUT]
 *
 * \note For convenience, *datap is initially NULL and *sizep is initially 0.
 *
 * \return 0 on success, non-zero on error. In case of failure, the other
 * callbacks will not be invoked and any value stored in *datap and *sizep is
 * discarded.
  }

  Tlibvlc_media_open_cb = function (opaque:pointer; datap:Ppointer; sizep:Puint64_t):longint;cdecl;
{*
 * Callback prototype to read data from a custom bitstream input media.
 *
 * \param opaque private pointer as set by the @ref libvlc_media_open_cb
 *               callback
 * \param buf start address of the buffer to read data into
 * \param len bytes length of the buffer
 *
 * \return strictly positive number of bytes read, 0 on end-of-stream,
 *         or -1 on non-recoverable error
 *
 * \note If no data is immediately available, then the callback should sleep.
 * \warning The application is responsible for avoiding deadlock situations.
 * In particular, the callback should return an error if playback is stopped;
 * if it does not return, then libvlc_media_player_stop() will never return.
  }

  Tlibvlc_media_read_cb = function (opaque:pointer; buf:Pbyte; len:Tsize_t):Tssize_t;cdecl;
{*
 * Callback prototype to seek a custom bitstream input media.
 *
 * \param opaque private pointer as set by the @ref libvlc_media_open_cb
 *               callback
 * \param offset absolute byte offset to seek to
 * \return 0 on success, -1 on error.
  }

  Tlibvlc_media_seek_cb = function (opaque:pointer; offset:Tuint64_t):longint;cdecl;
{*
 * Callback prototype to close a custom bitstream input media.
 *
 * \param opaque private pointer as set by the @ref libvlc_media_open_cb
 *               callback
  }

  Tlibvlc_media_close_cb = procedure (opaque:pointer);cdecl;
{*
 * Create a media with a certain given media resource location,
 * for instance a valid URL.
 *
 * \note To refer to a local file with this function,
 * the file://... URI syntax <b>must</b> be used (see IETF RFC3986).
 * We recommend using libvlc_media_new_path() instead when dealing with
 * local files.
 *
 * \see libvlc_media_release
 *
 * \param p_instance the instance
 * \param psz_mrl the media location
 * \return the newly created media or NULL on error
  }
(* Const before type ignored *)

function libvlc_media_new_location(p_instance:Plibvlc_instance_t; psz_mrl:Pchar):Plibvlc_media_t;cdecl;external;
{*
 * Create a media for a certain file path.
 *
 * \see libvlc_media_release
 *
 * \param p_instance the instance
 * \param path local filesystem path
 * \return the newly created media or NULL on error
  }
(* Const before type ignored *)
function libvlc_media_new_path(p_instance:Plibvlc_instance_t; path:Pchar):Plibvlc_media_t;cdecl;external;
{*
 * Create a media for an already open file descriptor.
 * The file descriptor shall be open for reading (or reading and writing).
 *
 * Regular file descriptors, pipe read descriptors and character device
 * descriptors (including TTYs) are supported on all platforms.
 * Block device descriptors are supported where available.
 * Directory descriptors are supported on systems that provide fdopendir().
 * Sockets are supported on all platforms where they are file descriptors,
 * i.e. all except Windows.
 *
 * \note This library will <b>not</b> automatically close the file descriptor
 * under any circumstance. Nevertheless, a file descriptor can usually only be
 * rendered once in a media player. To render it a second time, the file
 * descriptor should probably be rewound to the beginning with lseek().
 *
 * \see libvlc_media_release
 *
 * \version LibVLC 1.1.5 and later.
 *
 * \param p_instance the instance
 * \param fd open file descriptor
 * \return the newly created media or NULL on error
  }
function libvlc_media_new_fd(p_instance:Plibvlc_instance_t; fd:longint):Plibvlc_media_t;cdecl;external;
{*
 * Create a media with custom callbacks to read the data from.
 *
 * \param instance LibVLC instance
 * \param open_cb callback to open the custom bitstream input media
 * \param read_cb callback to read data (must not be NULL)
 * \param seek_cb callback to seek, or NULL if seeking is not supported
 * \param close_cb callback to close the media, or NULL if unnecessary
 * \param opaque data pointer for the open callback
 *
 * \return the newly created media or NULL on error
 *
 * \note If open_cb is NULL, the opaque pointer will be passed to read_cb,
 * seek_cb and close_cb, and the stream size will be treated as unknown.
 *
 * \note The callbacks may be called asynchronously (from another thread).
 * A single stream instance need not be reentrant. However the open_cb needs to
 * be reentrant if the media is used by multiple player instances.
 *
 * \warning The callbacks may be used until all or any player instances
 * that were supplied the media item are stopped.
 *
 * \see libvlc_media_release
 *
 * \version LibVLC 3.0.0 and later.
  }
function libvlc_media_new_callbacks(instance:Plibvlc_instance_t; open_cb:Tlibvlc_media_open_cb; read_cb:Tlibvlc_media_read_cb; seek_cb:Tlibvlc_media_seek_cb; close_cb:Tlibvlc_media_close_cb; 
           opaque:pointer):Plibvlc_media_t;cdecl;external;
{*
 * Create a media as an empty node with a given name.
 *
 * \see libvlc_media_release
 *
 * \param p_instance the instance
 * \param psz_name the name of the node
 * \return the new empty media or NULL on error
  }
(* Const before type ignored *)
function libvlc_media_new_as_node(p_instance:Plibvlc_instance_t; psz_name:Pchar):Plibvlc_media_t;cdecl;external;
{*
 * Add an option to the media.
 *
 * This option will be used to determine how the media_player will
 * read the media. This allows to use VLC's advanced
 * reading/streaming options on a per-media basis.
 *
 * \note The options are listed in 'vlc --long-help' from the command line,
 * e.g. "-sout-all". Keep in mind that available options and their semantics
 * vary across LibVLC versions and builds.
 * \warning Not all options affects libvlc_media_t objects:
 * Specifically, due to architectural issues most audio and video options,
 * such as text renderer options, have no effects on an individual media.
 * These options must be set through libvlc_new() instead.
 *
 * \param p_md the media descriptor
 * \param psz_options the options (as a string)
  }
(* Const before type ignored *)
procedure libvlc_media_add_option(p_md:Plibvlc_media_t; psz_options:Pchar);cdecl;external;
{*
 * Add an option to the media with configurable flags.
 *
 * This option will be used to determine how the media_player will
 * read the media. This allows to use VLC's advanced
 * reading/streaming options on a per-media basis.
 *
 * The options are detailed in vlc --long-help, for instance
 * "--sout-all". Note that all options are not usable on medias:
 * specifically, due to architectural issues, video-related options
 * such as text renderer options cannot be set on a single media. They
 * must be set on the whole libvlc instance instead.
 *
 * \param p_md the media descriptor
 * \param psz_options the options (as a string)
 * \param i_flags the flags for this option
  }
(* Const before type ignored *)
procedure libvlc_media_add_option_flag(p_md:Plibvlc_media_t; psz_options:Pchar; i_flags:dword);cdecl;external;
{*
 * Retain a reference to a media descriptor object (libvlc_media_t). Use
 * libvlc_media_release() to decrement the reference count of a
 * media descriptor object.
 *
 * \param p_md the media descriptor
  }
procedure libvlc_media_retain(p_md:Plibvlc_media_t);cdecl;external;
{*
 * Decrement the reference count of a media descriptor object. If the
 * reference count is 0, then libvlc_media_release() will release the
 * media descriptor object. It will send out an libvlc_MediaFreed event
 * to all listeners. If the media descriptor object has been released it
 * should not be used again.
 *
 * \param p_md the media descriptor
  }
procedure libvlc_media_release(p_md:Plibvlc_media_t);cdecl;external;
{*
 * Get the media resource locator (mrl) from a media descriptor object
 *
 * \param p_md a media descriptor object
 * \return string with mrl of media descriptor object
  }
function libvlc_media_get_mrl(p_md:Plibvlc_media_t):Pchar;cdecl;external;
{*
 * Duplicate a media descriptor object.
 *
 * \param p_md a media descriptor object.
  }
function libvlc_media_duplicate(p_md:Plibvlc_media_t):Plibvlc_media_t;cdecl;external;
{*
 * Read the meta of the media.
 *
 * If the media has not yet been parsed this will return NULL.
 *
 * \see libvlc_media_parse
 * \see libvlc_media_parse_with_options
 * \see libvlc_MediaMetaChanged
 *
 * \param p_md the media descriptor
 * \param e_meta the meta to read
 * \return the media's meta
  }
function libvlc_media_get_meta(p_md:Plibvlc_media_t; e_meta:Tlibvlc_meta_t):Pchar;cdecl;external;
{*
 * Set the meta of the media (this function will not save the meta, call
 * libvlc_media_save_meta in order to save the meta)
 *
 * \param p_md the media descriptor
 * \param e_meta the meta to write
 * \param psz_value the media's meta
  }
(* Const before type ignored *)
procedure libvlc_media_set_meta(p_md:Plibvlc_media_t; e_meta:Tlibvlc_meta_t; psz_value:Pchar);cdecl;external;
{*
 * Save the meta previously set
 *
 * \param p_md the media desriptor
 * \return true if the write operation was successful
  }
function libvlc_media_save_meta(p_md:Plibvlc_media_t):longint;cdecl;external;
{*
 * Get current state of media descriptor object. Possible media states are
 * libvlc_NothingSpecial=0, libvlc_Opening, libvlc_Playing, libvlc_Paused,
 * libvlc_Stopped, libvlc_Ended, libvlc_Error.
 *
 * \see libvlc_state_t
 * \param p_md a media descriptor object
 * \return state of media descriptor object
  }
function libvlc_media_get_state(p_md:Plibvlc_media_t):Tlibvlc_state_t;cdecl;external;
{*
 * Get the current statistics about the media
 * \param p_md: media descriptor object
 * \param p_stats: structure that contain the statistics about the media
 *                 (this structure must be allocated by the caller)
 * \return true if the statistics are available, false otherwise
 *
 * \libvlc_return_bool
  }
function libvlc_media_get_stats(p_md:Plibvlc_media_t; p_stats:Plibvlc_media_stats_t):longint;cdecl;external;
{ The following method uses libvlc_media_list_t, however, media_list usage is optionnal
 * and this is here for convenience  }
{#define VLC_FORWARD_DECLARE_OBJECT(a) struct a }
{*
 * Get subitems of media descriptor object. This will increment
 * the reference count of supplied media descriptor object. Use
 * libvlc_media_list_release() to decrement the reference counting.
 *
 * \param p_md media descriptor object
 * \return list of media descriptor subitems or NULL
  }
function libvlc_media_subitems(p_md:Plibvlc_media_t):Plibvlc_media_list_t;cdecl;external;
{*
 * Get event manager from media descriptor object.
 * NOTE: this function doesn't increment reference counting.
 *
 * \param p_md a media descriptor object
 * \return event manager object
  }
function libvlc_media_event_manager(p_md:Plibvlc_media_t):Plibvlc_event_manager_t;cdecl;external;
{*
 * Get duration (in ms) of media descriptor object item.
 *
 * \param p_md media descriptor object
 * \return duration of media item or -1 on error
  }
function libvlc_media_get_duration(p_md:Plibvlc_media_t):Tlibvlc_time_t;cdecl;external;
{*
 * Parse the media asynchronously with options.
 *
 * This fetches (local or network) art, meta data and/or tracks information.
 * This method is the extended version of libvlc_media_parse_with_options().
 *
 * To track when this is over you can listen to libvlc_MediaParsedChanged
 * event. However if this functions returns an error, you will not receive any
 * events.
 *
 * It uses a flag to specify parse options (see libvlc_media_parse_flag_t). All
 * these flags can be combined. By default, media is parsed if it's a local
 * file.
 *
 * \note Parsing can be aborted with libvlc_media_parse_stop().
 *
 * \see libvlc_MediaParsedChanged
 * \see libvlc_media_get_meta
 * \see libvlc_media_tracks_get
 * \see libvlc_media_get_parsed_status
 * \see libvlc_media_parse_flag_t
 *
 * \param p_md media descriptor object
 * \param parse_flag parse options:
 * \param timeout maximum time allowed to preparse the media. If -1, the
 * default "preparse-timeout" option will be used as a timeout. If 0, it will
 * wait indefinitely. If > 0, the timeout will be used (in milliseconds).
 * \return -1 in case of error, 0 otherwise
 * \version LibVLC 3.0.0 or later
  }
function libvlc_media_parse_with_options(p_md:Plibvlc_media_t; parse_flag:Tlibvlc_media_parse_flag_t; timeout:longint):longint;cdecl;external;
{*
 * Stop the parsing of the media
 *
 * When the media parsing is stopped, the libvlc_MediaParsedChanged event will
 * be sent with the libvlc_media_parsed_status_timeout status.
 *
 * \see libvlc_media_parse_with_options
 *
 * \param p_md media descriptor object
 * \version LibVLC 3.0.0 or later
  }
procedure libvlc_media_parse_stop(p_md:Plibvlc_media_t);cdecl;external;
{*
 * Get Parsed status for media descriptor object.
 *
 * \see libvlc_MediaParsedChanged
 * \see libvlc_media_parsed_status_t
 *
 * \param p_md media descriptor object
 * \return a value of the libvlc_media_parsed_status_t enum
 * \version LibVLC 3.0.0 or later
  }
function libvlc_media_get_parsed_status(p_md:Plibvlc_media_t):Tlibvlc_media_parsed_status_t;cdecl;external;
{*
 * Sets media descriptor's user_data. user_data is specialized data
 * accessed by the host application, VLC.framework uses it as a pointer to
 * an native object that references a libvlc_media_t pointer
 *
 * \param p_md media descriptor object
 * \param p_new_user_data pointer to user data
  }
procedure libvlc_media_set_user_data(p_md:Plibvlc_media_t; p_new_user_data:pointer);cdecl;external;
{*
 * Get media descriptor's user_data. user_data is specialized data
 * accessed by the host application, VLC.framework uses it as a pointer to
 * an native object that references a libvlc_media_t pointer
 *
 * \param p_md media descriptor object
  }
function libvlc_media_get_user_data(p_md:Plibvlc_media_t):pointer;cdecl;external;
{*
 * Get media descriptor's elementary streams description
 *
 * Note, you need to call libvlc_media_parse() or play the media at least once
 * before calling this function.
 * Not doing this will result in an empty array.
 *
 * \version LibVLC 2.1.0 and later.
 *
 * \param p_md media descriptor object
 * \param tracks address to store an allocated array of Elementary Streams
 *        descriptions (must be freed with libvlc_media_tracks_release
          by the caller) [OUT]
 *
 * \return the number of Elementary Streams (zero on error)
  }
function libvlc_media_tracks_get(p_md:Plibvlc_media_t; tracks:PPPlibvlc_media_track_t):dword;cdecl;external;
{*
 * Get codec description from media elementary stream
 *
 * \version LibVLC 3.0.0 and later.
 *
 * \see libvlc_media_track_t
 *
 * \param i_type i_type from libvlc_media_track_t
 * \param i_codec i_codec or i_original_fourcc from libvlc_media_track_t
 *
 * \return codec description
  }
(* Const before type ignored *)
function libvlc_media_get_codec_description(i_type:Tlibvlc_track_type_t; i_codec:Tuint32_t):Pchar;cdecl;external;
{*
 * Release media descriptor's elementary streams description array
 *
 * \version LibVLC 2.1.0 and later.
 *
 * \param p_tracks tracks info array to release
 * \param i_count number of elements in the array
  }
procedure libvlc_media_tracks_release(p_tracks:PPlibvlc_media_track_t; i_count:dword);cdecl;external;
{*
 * Get the media type of the media descriptor object
 *
 * \version LibVLC 3.0.0 and later.
 *
 * \see libvlc_media_type_t
 *
 * \param p_md media descriptor object
 *
 * \return media type
  }
function libvlc_media_get_type(p_md:Plibvlc_media_t):Tlibvlc_media_type_t;cdecl;external;
{*
 * Add a slave to the current media.
 *
 * A slave is an external input source that may contains an additional subtitle
 * track (like a .srt) or an additional audio track (like a .ac3).
 *
 * \note This function must be called before the media is parsed (via
 * libvlc_media_parse_with_options()) or before the media is played (via
 * libvlc_media_player_play())
 *
 * \version LibVLC 3.0.0 and later.
 *
 * \param p_md media descriptor object
 * \param i_type subtitle or audio
 * \param i_priority from 0 (low priority) to 4 (high priority)
 * \param psz_uri Uri of the slave (should contain a valid scheme).
 *
 * \return 0 on success, -1 on error.
  }
(* Const before type ignored *)
function libvlc_media_slaves_add(p_md:Plibvlc_media_t; i_type:Tlibvlc_media_slave_type_t; i_priority:dword; psz_uri:Pchar):longint;cdecl;external;
{*
 * Clear all slaves previously added by libvlc_media_slaves_add() or
 * internally.
 *
 * \version LibVLC 3.0.0 and later.
 *
 * \param p_md media descriptor object
  }
procedure libvlc_media_slaves_clear(p_md:Plibvlc_media_t);cdecl;external;
{*
 * Get a media descriptor's slave list
 *
 * The list will contain slaves parsed by VLC or previously added by
 * libvlc_media_slaves_add(). The typical use case of this function is to save
 * a list of slave in a database for a later use.
 *
 * \version LibVLC 3.0.0 and later.
 *
 * \see libvlc_media_slaves_add
 *
 * \param p_md media descriptor object
 * \param ppp_slaves address to store an allocated array of slaves (must be
 * freed with libvlc_media_slaves_release()) [OUT]
 *
 * \return the number of slaves (zero on error)
  }
function libvlc_media_slaves_get(p_md:Plibvlc_media_t; ppp_slaves:PPPlibvlc_media_slave_t):dword;cdecl;external;
{*
 * Release a media descriptor's slave list
 *
 * \version LibVLC 3.0.0 and later.
 *
 * \param pp_slaves slave array to release
 * \param i_count number of elements in the array
  }
procedure libvlc_media_slaves_release(pp_slaves:PPlibvlc_media_slave_t; i_count:dword);cdecl;external;
{* @ }
{$endif}
{ VLC_LIBVLC_MEDIA_H  }

implementation


end.
