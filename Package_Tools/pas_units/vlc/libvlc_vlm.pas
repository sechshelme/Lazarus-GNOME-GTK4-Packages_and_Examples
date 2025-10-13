unit libvlc_vlm;

interface

uses
  fp_vlc;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{****************************************************************************
 * libvlc_vlm.h:  libvlc_* new external API
 *****************************************************************************
 * Copyright (C) 1998-2008 VLC authors and VideoLAN
 * $Id: cfa2d956463056b287cdb0a4faeb46442040a010 $
 *
 * Authors: Clément Stenac <zorglub@videolan.org>
 *          Jean-Paul Saman <jpsaman _at_ m2x _dot_ nl>
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
{$ifndef LIBVLC_VLM_H}

const
  LIBVLC_VLM_H = 1;  
{* \defgroup libvlc_vlm LibVLC VLM
 * \ingroup libvlc
 * @
 * \file
 * LibVLC stream output manager external API
  }
{*
 * Release the vlm instance related to the given libvlc_instance_t
 *
 * \param p_instance the instance
  }

procedure libvlc_vlm_release(p_instance:Plibvlc_instance_t);cdecl;external libvlc;
{*
 * Add a broadcast, with one input.
 *
 * \param p_instance the instance
 * \param psz_name the name of the new broadcast
 * \param psz_input the input MRL
 * \param psz_output the output MRL (the parameter to the "sout" variable)
 * \param i_options number of additional options
 * \param ppsz_options additional options
 * \param b_enabled boolean for enabling the new broadcast
 * \param b_loop Should this broadcast be played in loop ?
 * \return 0 on success, -1 on error
  }
function libvlc_vlm_add_broadcast(p_instance:Plibvlc_instance_t; psz_name:Pchar; psz_input:Pchar; psz_output:Pchar; i_options:longint; 
           ppsz_options:PPchar; b_enabled:longint; b_loop:longint):longint;cdecl;external libvlc;
{*
 * Add a vod, with one input.
 *
 * \param p_instance the instance
 * \param psz_name the name of the new vod media
 * \param psz_input the input MRL
 * \param i_options number of additional options
 * \param ppsz_options additional options
 * \param b_enabled boolean for enabling the new vod
 * \param psz_mux the muxer of the vod media
 * \return 0 on success, -1 on error
  }
function libvlc_vlm_add_vod(p_instance:Plibvlc_instance_t; psz_name:Pchar; psz_input:Pchar; i_options:longint; ppsz_options:PPchar; 
           b_enabled:longint; psz_mux:Pchar):longint;cdecl;external libvlc;
{*
 * Delete a media (VOD or broadcast).
 *
 * \param p_instance the instance
 * \param psz_name the media to delete
 * \return 0 on success, -1 on error
  }
function libvlc_vlm_del_media(p_instance:Plibvlc_instance_t; psz_name:Pchar):longint;cdecl;external libvlc;
{*
 * Enable or disable a media (VOD or broadcast).
 *
 * \param p_instance the instance
 * \param psz_name the media to work on
 * \param b_enabled the new status
 * \return 0 on success, -1 on error
  }
function libvlc_vlm_set_enabled(p_instance:Plibvlc_instance_t; psz_name:Pchar; b_enabled:longint):longint;cdecl;external libvlc;
{*
 * Set the output for a media.
 *
 * \param p_instance the instance
 * \param psz_name the media to work on
 * \param psz_output the output MRL (the parameter to the "sout" variable)
 * \return 0 on success, -1 on error
  }
function libvlc_vlm_set_output(p_instance:Plibvlc_instance_t; psz_name:Pchar; psz_output:Pchar):longint;cdecl;external libvlc;
{*
 * Set a media's input MRL. This will delete all existing inputs and
 * add the specified one.
 *
 * \param p_instance the instance
 * \param psz_name the media to work on
 * \param psz_input the input MRL
 * \return 0 on success, -1 on error
  }
function libvlc_vlm_set_input(p_instance:Plibvlc_instance_t; psz_name:Pchar; psz_input:Pchar):longint;cdecl;external libvlc;
{*
 * Add a media's input MRL. This will add the specified one.
 *
 * \param p_instance the instance
 * \param psz_name the media to work on
 * \param psz_input the input MRL
 * \return 0 on success, -1 on error
  }
function libvlc_vlm_add_input(p_instance:Plibvlc_instance_t; psz_name:Pchar; psz_input:Pchar):longint;cdecl;external libvlc;
{*
 * Set a media's loop status.
 *
 * \param p_instance the instance
 * \param psz_name the media to work on
 * \param b_loop the new status
 * \return 0 on success, -1 on error
  }
function libvlc_vlm_set_loop(p_instance:Plibvlc_instance_t; psz_name:Pchar; b_loop:longint):longint;cdecl;external libvlc;
{*
 * Set a media's vod muxer.
 *
 * \param p_instance the instance
 * \param psz_name the media to work on
 * \param psz_mux the new muxer
 * \return 0 on success, -1 on error
  }
function libvlc_vlm_set_mux(p_instance:Plibvlc_instance_t; psz_name:Pchar; psz_mux:Pchar):longint;cdecl;external libvlc;
{*
 * Edit the parameters of a media. This will delete all existing inputs and
 * add the specified one.
 *
 * \param p_instance the instance
 * \param psz_name the name of the new broadcast
 * \param psz_input the input MRL
 * \param psz_output the output MRL (the parameter to the "sout" variable)
 * \param i_options number of additional options
 * \param ppsz_options additional options
 * \param b_enabled boolean for enabling the new broadcast
 * \param b_loop Should this broadcast be played in loop ?
 * \return 0 on success, -1 on error
  }
function libvlc_vlm_change_media(p_instance:Plibvlc_instance_t; psz_name:Pchar; psz_input:Pchar; psz_output:Pchar; i_options:longint; 
           ppsz_options:PPchar; b_enabled:longint; b_loop:longint):longint;cdecl;external libvlc;
{*
 * Play the named broadcast.
 *
 * \param p_instance the instance
 * \param psz_name the name of the broadcast
 * \return 0 on success, -1 on error
  }
function libvlc_vlm_play_media(p_instance:Plibvlc_instance_t; psz_name:Pchar):longint;cdecl;external libvlc;
{*
 * Stop the named broadcast.
 *
 * \param p_instance the instance
 * \param psz_name the name of the broadcast
 * \return 0 on success, -1 on error
  }
function libvlc_vlm_stop_media(p_instance:Plibvlc_instance_t; psz_name:Pchar):longint;cdecl;external libvlc;
{*
 * Pause the named broadcast.
 *
 * \param p_instance the instance
 * \param psz_name the name of the broadcast
 * \return 0 on success, -1 on error
  }
function libvlc_vlm_pause_media(p_instance:Plibvlc_instance_t; psz_name:Pchar):longint;cdecl;external libvlc;
{*
 * Seek in the named broadcast.
 *
 * \param p_instance the instance
 * \param psz_name the name of the broadcast
 * \param f_percentage the percentage to seek to
 * \return 0 on success, -1 on error
  }
function libvlc_vlm_seek_media(p_instance:Plibvlc_instance_t; psz_name:Pchar; f_percentage:single):longint;cdecl;external libvlc;
{*
 * Return information about the named media as a JSON
 * string representation.
 *
 * This function is mainly intended for debugging use,
 * if you want programmatic access to the state of
 * a vlm_media_instance_t, please use the corresponding
 * libvlc_vlm_get_media_instance_xxx -functions.
 * Currently there are no such functions available for
 * vlm_media_t though.
 *
 * \param p_instance the instance
 * \param psz_name the name of the media,
 *      if the name is an empty string, all media is described
 * \return string with information about named media, or NULL on error
  }
function libvlc_vlm_show_media(p_instance:Plibvlc_instance_t; psz_name:Pchar):Pchar;cdecl;external libvlc;
{*
 * Get vlm_media instance position by name or instance id
 *
 * \param p_instance a libvlc instance
 * \param psz_name name of vlm media instance
 * \param i_instance instance id
 * \return position as float or -1. on error
  }
function libvlc_vlm_get_media_instance_position(p_instance:Plibvlc_instance_t; psz_name:Pchar; i_instance:longint):single;cdecl;external libvlc;
{*
 * Get vlm_media instance time by name or instance id
 *
 * \param p_instance a libvlc instance
 * \param psz_name name of vlm media instance
 * \param i_instance instance id
 * \return time as integer or -1 on error
  }
function libvlc_vlm_get_media_instance_time(p_instance:Plibvlc_instance_t; psz_name:Pchar; i_instance:longint):longint;cdecl;external libvlc;
{*
 * Get vlm_media instance length by name or instance id
 *
 * \param p_instance a libvlc instance
 * \param psz_name name of vlm media instance
 * \param i_instance instance id
 * \return length of media item or -1 on error
  }
function libvlc_vlm_get_media_instance_length(p_instance:Plibvlc_instance_t; psz_name:Pchar; i_instance:longint):longint;cdecl;external libvlc;
{*
 * Get vlm_media instance playback rate by name or instance id
 *
 * \param p_instance a libvlc instance
 * \param psz_name name of vlm media instance
 * \param i_instance instance id
 * \return playback rate or -1 on error
  }
function libvlc_vlm_get_media_instance_rate(p_instance:Plibvlc_instance_t; psz_name:Pchar; i_instance:longint):longint;cdecl;external libvlc;
{$if 0}
{*
 * Get vlm_media instance title number by name or instance id
 * \bug will always return 0
 * \param p_instance a libvlc instance
 * \param psz_name name of vlm media instance
 * \param i_instance instance id
 * \return title as number or -1 on error
  }

function libvlc_vlm_get_media_instance_title(p_instance:Plibvlc_instance_t; psz_name:Pchar; i_instance:longint):longint;cdecl;external libvlc;
{*
 * Get vlm_media instance chapter number by name or instance id
 * \bug will always return 0
 * \param p_instance a libvlc instance
 * \param psz_name name of vlm media instance
 * \param i_instance instance id
 * \return chapter as number or -1 on error
  }
function libvlc_vlm_get_media_instance_chapter(p_instance:Plibvlc_instance_t; psz_name:Pchar; i_instance:longint):longint;cdecl;external libvlc;
{*
 * Is libvlc instance seekable ?
 * \bug will always return 0
 * \param p_instance a libvlc instance
 * \param psz_name name of vlm media instance
 * \param i_instance instance id
 * \return 1 if seekable, 0 if not, -1 if media does not exist
  }
function libvlc_vlm_get_media_instance_seekable(p_instance:Plibvlc_instance_t; psz_name:Pchar; i_instance:longint):longint;cdecl;external libvlc;
{$endif}
{*
 * Get libvlc_event_manager from a vlm media.
 * The p_event_manager is immutable, so you don't have to hold the lock
 *
 * \param p_instance a libvlc instance
 * \return libvlc_event_manager
  }

function libvlc_vlm_get_event_manager(p_instance:Plibvlc_instance_t):Plibvlc_event_manager_t;cdecl;external libvlc;
{* @  }
{$endif}
{ <vlc/libvlc_vlm.h>  }

// === Konventiert am: 13-10-25 19:24:57 ===


implementation



end.
