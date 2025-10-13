unit deprecated;

interface

uses
  fp_vlc;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{****************************************************************************
 * deprecated.h:  libvlc deprecated API
 *****************************************************************************
 * Copyright (C) 1998-2008 VLC authors and VideoLAN
 * $Id: 27323a434498604ca281900c3e4087a42d22a5d8 $
 *
 * Authors: Clément Stenac <zorglub@videolan.org>
 *          Jean-Paul Saman <jpsaman@videolan.org>
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
{$ifndef _H}

const
  _H = 1;  
{*
 * \ingroup libvlc libvlc_media_player
 * @
  }
{*
 * Get movie fps rate
 *
 * This function is provided for backward compatibility. It cannot deal with
 * multiple video tracks. In LibVLC versions prior to 3.0, it would also fail
 * if the file format did not convey the frame rate explicitly.
 *
 * \deprecated Consider using libvlc_media_tracks_get() instead.
 *
 * \param p_mi the Media Player
 * \return frames per second (fps) for this playing movie, or 0 if unspecified
  }

function libvlc_media_player_get_fps(p_mi:Plibvlc_media_player_t):single;cdecl;external libvlc;
{* end bug  }
{*
 * \deprecated Use libvlc_media_player_set_nsobject() instead
  }
procedure libvlc_media_player_set_agl(p_mi:Plibvlc_media_player_t; drawable:Tuint32_t);cdecl;external libvlc;
{*
 * \deprecated Use libvlc_media_player_get_nsobject() instead
  }
function libvlc_media_player_get_agl(p_mi:Plibvlc_media_player_t):Tuint32_t;cdecl;external libvlc;
{*
 * \deprecated Use libvlc_track_description_list_release() instead
  }
procedure libvlc_track_description_release(p_track_description:Plibvlc_track_description_t);cdecl;external libvlc;
{* @ }
{*
 * \ingroup libvlc libvlc_video
 * @
  }
{*
 * Get current video height.
 * \deprecated Use libvlc_video_get_size() instead.
 *
 * \param p_mi the media player
 * \return the video pixel height or 0 if not applicable
  }
function libvlc_video_get_height(p_mi:Plibvlc_media_player_t):longint;cdecl;external libvlc;
{*
 * Get current video width.
 * \deprecated Use libvlc_video_get_size() instead.
 *
 * \param p_mi the media player
 * \return the video pixel width or 0 if not applicable
  }
function libvlc_video_get_width(p_mi:Plibvlc_media_player_t):longint;cdecl;external libvlc;
{*
 * Get the description of available titles.
 *
 * \param p_mi the media player
 * \return list containing description of available titles.
 * It must be freed with libvlc_track_description_list_release()
  }
function libvlc_video_get_title_description(p_mi:Plibvlc_media_player_t):Plibvlc_track_description_t;cdecl;external libvlc;
{*
 * Get the description of available chapters for specific title.
 *
 * \param p_mi the media player
 * \param i_title selected title
 * \return list containing description of available chapter for title i_title.
 * It must be freed with libvlc_track_description_list_release()
  }
function libvlc_video_get_chapter_description(p_mi:Plibvlc_media_player_t; i_title:longint):Plibvlc_track_description_t;cdecl;external libvlc;
{*
 * Set new video subtitle file.
 * \deprecated Use libvlc_media_player_add_slave() instead.
 *
 * \param p_mi the media player
 * \param psz_subtitle new video subtitle file
 * \return the success status (boolean)
  }
function libvlc_video_set_subtitle_file(p_mi:Plibvlc_media_player_t; psz_subtitle:Pchar):longint;cdecl;external libvlc;
{*
 * Toggle teletext transparent status on video output.
 * \deprecated use libvlc_video_set_teletext() instead.
 *
 * \param p_mi the media player
  }
procedure libvlc_toggle_teletext(p_mi:Plibvlc_media_player_t);cdecl;external libvlc;
{* @ }
{*
 * \ingroup libvlc libvlc_audio
 * @
  }
{*
 * Backward compatibility stub. Do not use in new code.
 * \deprecated Use libvlc_audio_output_device_list_get() instead.
 * \return always 0.
  }
function libvlc_audio_output_device_count(p_instance:Plibvlc_instance_t; psz_audio_output:Pchar):longint;cdecl;external libvlc;
{*
 * Backward compatibility stub. Do not use in new code.
 * \deprecated Use libvlc_audio_output_device_list_get() instead.
 * \return always NULL.
  }
function libvlc_audio_output_device_longname(p_instance:Plibvlc_instance_t; psz_output:Pchar; i_device:longint):Pchar;cdecl;external libvlc;
{*
 * Backward compatibility stub. Do not use in new code.
 * \deprecated Use libvlc_audio_output_device_list_get() instead.
 * \return always NULL.
  }
function libvlc_audio_output_device_id(p_instance:Plibvlc_instance_t; psz_audio_output:Pchar; i_device:longint):Pchar;cdecl;external libvlc;
{*
 * Stub for backward compatibility.
 * \return always -1.
  }
function libvlc_audio_output_get_device_type(p_mi:Plibvlc_media_player_t):longint;cdecl;external libvlc;
{*
 * Stub for backward compatibility.
  }
procedure libvlc_audio_output_set_device_type(p_mp:Plibvlc_media_player_t; device_type:longint);cdecl;external libvlc;
{* @ }
{*
 * \ingroup libvlc libvlc_media
 * @
  }
{*
 * Parse a media.
 *
 * This fetches (local) art, meta data and tracks information.
 * The method is synchronous.
 *
 * \deprecated This function could block indefinitely.
 *             Use libvlc_media_parse_with_options() instead
 *
 * \see libvlc_media_parse_with_options
 * \see libvlc_media_get_meta
 * \see libvlc_media_get_tracks_info
 *
 * \param p_md media descriptor object
  }
procedure libvlc_media_parse(p_md:Plibvlc_media_t);cdecl;external libvlc;
{*
 * Parse a media.
 *
 * This fetches (local) art, meta data and tracks information.
 * The method is the asynchronous of libvlc_media_parse().
 *
 * To track when this is over you can listen to libvlc_MediaParsedChanged
 * event. However if the media was already parsed you will not receive this
 * event.
 *
 * \deprecated You can't be sure to receive the libvlc_MediaParsedChanged
 *             event (you can wait indefinitely for this event).
 *             Use libvlc_media_parse_with_options() instead
 *
 * \see libvlc_media_parse
 * \see libvlc_MediaParsedChanged
 * \see libvlc_media_get_meta
 * \see libvlc_media_get_tracks_info
 *
 * \param p_md media descriptor object
  }
procedure libvlc_media_parse_async(p_md:Plibvlc_media_t);cdecl;external libvlc;
{*
 * Return true is the media descriptor object is parsed
 *
 * \deprecated This can return true in case of failure.
 *             Use libvlc_media_get_parsed_status() instead
 *
 * \see libvlc_MediaParsedChanged
 *
 * \param p_md media descriptor object
 * \return true if media object has been parsed otherwise it returns false
 *
 * \libvlc_return_bool
  }
function libvlc_media_is_parsed(p_md:Plibvlc_media_t):longint;cdecl;external libvlc;
{*
 * Get media descriptor's elementary streams description
 *
 * Note, you need to call libvlc_media_parse() or play the media at least once
 * before calling this function.
 * Not doing this will result in an empty array.
 *
 * \deprecated Use libvlc_media_tracks_get() instead
 *
 * \param p_md media descriptor object
 * \param tracks address to store an allocated array of Elementary Streams
 *        descriptions (must be freed by the caller) [OUT]
 *
 * \return the number of Elementary Streams
  }
function libvlc_media_get_tracks_info(p_md:Plibvlc_media_t; tracks:PPlibvlc_media_track_info_t):longint;cdecl;external libvlc;
{* @ }
{*
 * \ingroup libvlc libvlc_media_list
 * @
  }
function libvlc_media_list_add_file_content(p_ml:Plibvlc_media_list_t; psz_uri:Pchar):longint;cdecl;external libvlc;
{* @ }
{*
 * \ingroup libvlc libvlc_media_discoverer
 * @
  }
{*
 * \deprecated Use libvlc_media_discoverer_new() and libvlc_media_discoverer_start().
  }
function libvlc_media_discoverer_new_from_name(p_inst:Plibvlc_instance_t; psz_name:Pchar):Plibvlc_media_discoverer_t;cdecl;external libvlc;
{*
 * Get media service discover object its localized name.
 *
 * \deprecated Useless, use libvlc_media_discoverer_list_get() to get the
 * longname of the service discovery.
 *
 * \param p_mdis media discover object
 * \return localized name or NULL if the media_discoverer is not started
  }
function libvlc_media_discoverer_localized_name(p_mdis:Plibvlc_media_discoverer_t):Pchar;cdecl;external libvlc;
{*
 * Get event manager from media service discover object.
 *
 * \deprecated Useless, media_discoverer events are only triggered when calling
 * libvlc_media_discoverer_start() and libvlc_media_discoverer_stop().
 *
 * \param p_mdis media service discover object
 * \return event manager object.
  }
function libvlc_media_discoverer_event_manager(p_mdis:Plibvlc_media_discoverer_t):Plibvlc_event_manager_t;cdecl;external libvlc;
{* @ }
{*
 * \ingroup libvlc libvlc_core
 * @
  }
{*
 * Waits until an interface causes the instance to exit.
 * You should start at least one interface first, using libvlc_add_intf().
 *
 * \param p_instance the instance
 * \warning This function wastes one thread doing basically nothing.
 * libvlc_set_exit_handler() should be used instead.
  }
procedure libvlc_wait(p_instance:Plibvlc_instance_t);cdecl;external libvlc;
{* @ }
{*
 * \ingroup libvlc_core
 * \defgroup libvlc_log_deprecated LibVLC logging (legacy)
 * @
  }
{* This structure is opaque. It represents a libvlc log iterator  }
type
{ 0=INFO, 1=ERR, 2=WARN, 3=DBG  }
{ module type  }
{ module name  }
{ optional header  }
{ message  }

  Plibvlc_log_message_t = ^Tlibvlc_log_message_t;
  Tlibvlc_log_message_t = record
      i_severity : longint;
      psz_type : Pchar;
      psz_name : Pchar;
      psz_header : Pchar;
      psz_message : Pchar;
    end;
{*
 * Always returns minus one.
 * This function is only provided for backward compatibility.
 *
 * \param p_instance ignored
 * \return always -1
  }

function libvlc_get_log_verbosity(p_instance:Plibvlc_instance_t):dword;cdecl;external libvlc;
{*
 * This function does nothing.
 * It is only provided for backward compatibility.
 *
 * \param p_instance ignored
 * \param level ignored
  }
procedure libvlc_set_log_verbosity(p_instance:Plibvlc_instance_t; level:dword);cdecl;external libvlc;
{*
 * This function does nothing useful.
 * It is only provided for backward compatibility.
 *
 * \param p_instance libvlc instance
 * \return an unique pointer or NULL on error
  }
function libvlc_log_open(p_instance:Plibvlc_instance_t):Plibvlc_log_t;cdecl;external libvlc;
{*
 * Frees memory allocated by libvlc_log_open().
 *
 * \param p_log libvlc log instance or NULL
  }
procedure libvlc_log_close(p_log:Plibvlc_log_t);cdecl;external libvlc;
{*
 * Always returns zero.
 * This function is only provided for backward compatibility.
 *
 * \param p_log ignored
 * \return always zero
  }
function libvlc_log_count(p_log:Plibvlc_log_t):dword;cdecl;external libvlc;
{*
 * This function does nothing.
 * It is only provided for backward compatibility.
 *
 * \param p_log ignored
  }
procedure libvlc_log_clear(p_log:Plibvlc_log_t);cdecl;external libvlc;
{*
 * This function does nothing useful.
 * It is only provided for backward compatibility.
 *
 * \param p_log ignored
 * \return an unique pointer or NULL on error or if the parameter was NULL
  }
function libvlc_log_get_iterator(p_log:Plibvlc_log_t):Plibvlc_log_iterator_t;cdecl;external libvlc;
{*
 * Frees memory allocated by libvlc_log_get_iterator().
 *
 * \param p_iter libvlc log iterator or NULL
  }
procedure libvlc_log_iterator_free(p_iter:Plibvlc_log_iterator_t);cdecl;external libvlc;
{*
 * Always returns zero.
 * This function is only provided for backward compatibility.
 *
 * \param p_iter ignored
 * \return always zero
  }
function libvlc_log_iterator_has_next(p_iter:Plibvlc_log_iterator_t):longint;cdecl;external libvlc;
{*
 * Always returns NULL.
 * This function is only provided for backward compatibility.
 *
 * \param p_iter libvlc log iterator or NULL
 * \param p_buf ignored
 * \return always NULL
  }
function libvlc_log_iterator_next(p_iter:Plibvlc_log_iterator_t; p_buf:Plibvlc_log_message_t):Plibvlc_log_message_t;cdecl;external libvlc;
{* @ }
{*
 * \ingroup libvlc
 * \defgroup libvlc_playlist LibVLC playlist (legacy)
 * @deprecated Use @ref libvlc_media_list instead.
 * @
 * \file
 * LibVLC deprecated playlist API
  }
{*
 * Start playing (if there is any item in the playlist).
 *
 * Additionnal playlist item options can be specified for addition to the
 * item before it is played.
 *
 * \param p_instance the playlist instance
 * \param i_id the item to play. If this is a negative number, the next
 *        item will be selected. Otherwise, the item with the given ID will be
 *        played
 * \param i_options the number of options to add to the item
 * \param ppsz_options the options to add to the item
  }
procedure libvlc_playlist_play(p_instance:Plibvlc_instance_t; i_id:longint; i_options:longint; ppsz_options:PPchar);cdecl;external libvlc;
{* @ }
{$endif}
{ __H  }

// === Konventiert am: 13-10-25 19:24:25 ===


implementation



end.
