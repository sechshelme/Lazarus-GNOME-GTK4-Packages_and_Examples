unit libvlc_media_list_player;

interface

uses
  fp_vlc;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{****************************************************************************
 * libvlc_media_list_player.h:  libvlc_media_list API
 *****************************************************************************
 * Copyright (C) 1998-2008 VLC authors and VideoLAN
 * $Id: 04f7d9b9f0d47e1b8304b51ca20fd2b1045a0ff2 $
 *
 * Authors: Pierre d'Herbemont
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
{$ifndef LIBVLC_MEDIA_LIST_PLAYER_H}

const
  LIBVLC_MEDIA_LIST_PLAYER_H = 1;  
{* \defgroup libvlc_media_list_player LibVLC media list player
 * \ingroup libvlc
 * The LibVLC media list player plays a @ref libvlc_media_list_t list of media,
 * in a certain order.
 * This is required to especially support playlist files.
 * The normal @ref libvlc_media_player_t LibVLC media player can only play a
 * single media, and does not handle playlist files properly.
 * @
 * \file
 * LibVLC media list player external API
  }
type
{*
 *  Defines playback modes for playlist.
  }

  Plibvlc_playback_mode_t = ^Tlibvlc_playback_mode_t;
  Tlibvlc_playback_mode_t =  Longint;
  Const
    libvlc_playback_mode_default = 0;
    libvlc_playback_mode_loop = 1;
    libvlc_playback_mode_repeat = 2;
;
{*
 * Create new media_list_player.
 *
 * \param p_instance libvlc instance
 * \return media list player instance or NULL on error
  }

function libvlc_media_list_player_new(p_instance:Plibvlc_instance_t):Plibvlc_media_list_player_t;cdecl;external libvlc;
{*
 * Release a media_list_player after use
 * Decrement the reference count of a media player object. If the
 * reference count is 0, then libvlc_media_list_player_release() will
 * release the media player object. If the media player object
 * has been released, then it should not be used again.
 *
 * \param p_mlp media list player instance
  }
procedure libvlc_media_list_player_release(p_mlp:Plibvlc_media_list_player_t);cdecl;external libvlc;
{*
 * Retain a reference to a media player list object. Use
 * libvlc_media_list_player_release() to decrement reference count.
 *
 * \param p_mlp media player list object
  }
procedure libvlc_media_list_player_retain(p_mlp:Plibvlc_media_list_player_t);cdecl;external libvlc;
{*
 * Return the event manager of this media_list_player.
 *
 * \param p_mlp media list player instance
 * \return the event manager
  }
function libvlc_media_list_player_event_manager(p_mlp:Plibvlc_media_list_player_t):Plibvlc_event_manager_t;cdecl;external libvlc;
{*
 * Replace media player in media_list_player with this instance.
 *
 * \param p_mlp media list player instance
 * \param p_mi media player instance
  }
procedure libvlc_media_list_player_set_media_player(p_mlp:Plibvlc_media_list_player_t; p_mi:Plibvlc_media_player_t);cdecl;external libvlc;
{*
 * Get media player of the media_list_player instance.
 *
 * \param p_mlp media list player instance
 * \return media player instance
 * \note the caller is responsible for releasing the returned instance
  }
function libvlc_media_list_player_get_media_player(p_mlp:Plibvlc_media_list_player_t):Plibvlc_media_player_t;cdecl;external libvlc;
{*
 * Set the media list associated with the player
 *
 * \param p_mlp media list player instance
 * \param p_mlist list of media
  }
procedure libvlc_media_list_player_set_media_list(p_mlp:Plibvlc_media_list_player_t; p_mlist:Plibvlc_media_list_t);cdecl;external libvlc;
{*
 * Play media list
 *
 * \param p_mlp media list player instance
  }
procedure libvlc_media_list_player_play(p_mlp:Plibvlc_media_list_player_t);cdecl;external libvlc;
{*
 * Toggle pause (or resume) media list
 *
 * \param p_mlp media list player instance
  }
procedure libvlc_media_list_player_pause(p_mlp:Plibvlc_media_list_player_t);cdecl;external libvlc;
{*
 * Pause or resume media list
 *
 * \param p_mlp media list player instance
 * \param do_pause play/resume if zero, pause if non-zero
 * \version LibVLC 3.0.0 or later
  }
procedure libvlc_media_list_player_set_pause(p_mlp:Plibvlc_media_list_player_t; do_pause:longint);cdecl;external libvlc;
{*
 * Is media list playing?
 *
 * \param p_mlp media list player instance
 * \return true for playing and false for not playing
 *
 * \libvlc_return_bool
  }
function libvlc_media_list_player_is_playing(p_mlp:Plibvlc_media_list_player_t):longint;cdecl;external libvlc;
{*
 * Get current libvlc_state of media list player
 *
 * \param p_mlp media list player instance
 * \return libvlc_state_t for media list player
  }
function libvlc_media_list_player_get_state(p_mlp:Plibvlc_media_list_player_t):Tlibvlc_state_t;cdecl;external libvlc;
{*
 * Play media list item at position index
 *
 * \param p_mlp media list player instance
 * \param i_index index in media list to play
 * \return 0 upon success -1 if the item wasn't found
  }
function libvlc_media_list_player_play_item_at_index(p_mlp:Plibvlc_media_list_player_t; i_index:longint):longint;cdecl;external libvlc;
{*
 * Play the given media item
 *
 * \param p_mlp media list player instance
 * \param p_md the media instance
 * \return 0 upon success, -1 if the media is not part of the media list
  }
function libvlc_media_list_player_play_item(p_mlp:Plibvlc_media_list_player_t; p_md:Plibvlc_media_t):longint;cdecl;external libvlc;
{*
 * Stop playing media list
 *
 * \param p_mlp media list player instance
  }
procedure libvlc_media_list_player_stop(p_mlp:Plibvlc_media_list_player_t);cdecl;external libvlc;
{*
 * Play next item from media list
 *
 * \param p_mlp media list player instance
 * \return 0 upon success -1 if there is no next item
  }
function libvlc_media_list_player_next(p_mlp:Plibvlc_media_list_player_t):longint;cdecl;external libvlc;
{*
 * Play previous item from media list
 *
 * \param p_mlp media list player instance
 * \return 0 upon success -1 if there is no previous item
  }
function libvlc_media_list_player_previous(p_mlp:Plibvlc_media_list_player_t):longint;cdecl;external libvlc;
{*
 * Sets the playback mode for the playlist
 *
 * \param p_mlp media list player instance
 * \param e_mode playback mode specification
  }
procedure libvlc_media_list_player_set_playback_mode(p_mlp:Plibvlc_media_list_player_t; e_mode:Tlibvlc_playback_mode_t);cdecl;external libvlc;
{* @ media_list_player  }
{$endif}
{ LIBVLC_MEDIA_LIST_PLAYER_H  }

// === Konventiert am: 13-10-25 19:24:45 ===


implementation



end.
