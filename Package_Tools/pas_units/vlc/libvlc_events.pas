unit libvlc_events;

interface

uses
  fp_vlc;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{****************************************************************************
 * libvlc_events.h:  libvlc_events external API structure
 *****************************************************************************
 * Copyright (C) 1998-2010 VLC authors and VideoLAN
 * $Id $
 *
 * Authors: Filippo Carone <littlejohn@videolan.org>
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
{$ifndef LIBVLC_EVENTS_H}

const
  LIBVLC_EVENTS_H = 1;  
{*
 * \file
 * This file defines libvlc_event external API
  }
type
{*
 * \ingroup libvlc_event
 * @
  }
{*
 * Event types
  }
{ Append new event types at the end of a category.
     * Do not remove, insert or re-order any entry.
     * Keep this in sync with lib/event.c:libvlc_event_type_name().  }
{*
     * \deprecated Useless event, it will be triggered only when calling
     * libvlc_media_discoverer_start()
      }
{*
     * \deprecated Useless event, it will be triggered only when calling
     * libvlc_media_discoverer_stop()
      }
  Tlibvlc_event_e =  Longint;
  Const
    libvlc_MediaMetaChanged = 0;
    libvlc_MediaSubItemAdded = 1;
    libvlc_MediaDurationChanged = 2;
    libvlc_MediaParsedChanged = 3;
    libvlc_MediaFreed = 4;
    libvlc_MediaStateChanged = 5;
    libvlc_MediaSubItemTreeAdded = 6;
    libvlc_MediaPlayerMediaChanged = $100;
    libvlc_MediaPlayerNothingSpecial = 257;
    libvlc_MediaPlayerOpening = 258;
    libvlc_MediaPlayerBuffering = 259;
    libvlc_MediaPlayerPlaying = 260;
    libvlc_MediaPlayerPaused = 261;
    libvlc_MediaPlayerStopped = 262;
    libvlc_MediaPlayerForward = 263;
    libvlc_MediaPlayerBackward = 264;
    libvlc_MediaPlayerEndReached = 265;
    libvlc_MediaPlayerEncounteredError = 266;
    libvlc_MediaPlayerTimeChanged = 267;
    libvlc_MediaPlayerPositionChanged = 268;
    libvlc_MediaPlayerSeekableChanged = 269;
    libvlc_MediaPlayerPausableChanged = 270;
    libvlc_MediaPlayerTitleChanged = 271;
    libvlc_MediaPlayerSnapshotTaken = 272;
    libvlc_MediaPlayerLengthChanged = 273;
    libvlc_MediaPlayerVout = 274;
    libvlc_MediaPlayerScrambledChanged = 275;
    libvlc_MediaPlayerESAdded = 276;
    libvlc_MediaPlayerESDeleted = 277;
    libvlc_MediaPlayerESSelected = 278;
    libvlc_MediaPlayerCorked = 279;
    libvlc_MediaPlayerUncorked = 280;
    libvlc_MediaPlayerMuted = 281;
    libvlc_MediaPlayerUnmuted = 282;
    libvlc_MediaPlayerAudioVolume = 283;
    libvlc_MediaPlayerAudioDevice = 284;
    libvlc_MediaPlayerChapterChanged = 285;
    libvlc_MediaListItemAdded = $200;
    libvlc_MediaListWillAddItem = 513;
    libvlc_MediaListItemDeleted = 514;
    libvlc_MediaListWillDeleteItem = 515;
    libvlc_MediaListEndReached = 516;
    libvlc_MediaListViewItemAdded = $300;
    libvlc_MediaListViewWillAddItem = 769;
    libvlc_MediaListViewItemDeleted = 770;
    libvlc_MediaListViewWillDeleteItem = 771;
    libvlc_MediaListPlayerPlayed = $400;
    libvlc_MediaListPlayerNextItemSet = 1025;
    libvlc_MediaListPlayerStopped = 1026;
    libvlc_MediaDiscovererStarted = $500;
    libvlc_MediaDiscovererEnded = 1281;
    libvlc_RendererDiscovererItemAdded = 1282;
    libvlc_RendererDiscovererItemDeleted = 1283;
    libvlc_VlmMediaAdded = $600;
    libvlc_VlmMediaRemoved = 1537;
    libvlc_VlmMediaChanged = 1538;
    libvlc_VlmMediaInstanceStarted = 1539;
    libvlc_VlmMediaInstanceStopped = 1540;
    libvlc_VlmMediaInstanceStatusInit = 1541;
    libvlc_VlmMediaInstanceStatusOpening = 1542;
    libvlc_VlmMediaInstanceStatusPlaying = 1543;
    libvlc_VlmMediaInstanceStatusPause = 1544;
    libvlc_VlmMediaInstanceStatusEnd = 1545;
    libvlc_VlmMediaInstanceStatusError = 1546;

{*
 * A LibVLC event
  }
{*< Event type (see @ref libvlc_event_e)  }
{*< Object emitting the event  }
{ media descriptor  }
{*< see @ref libvlc_media_parsed_status_t  }
{*< see @ref libvlc_state_t  }
{ media instance  }
{ media list  }
{ media list player  }
{ snapshot taken  }
{ Length changed  }
{ VLM media  }
{ Extra MediaPlayer  }
{*< Type-dependent event description  }
type
  Plibvlc_event_t = ^Tlibvlc_event_t;
  Tlibvlc_event_t = record
      _type : longint;
      p_obj : pointer;
      u : record
          case longint of
            0 : ( media_meta_changed : record
                meta_type : Tlibvlc_meta_t;
              end );
            1 : ( media_subitem_added : record
                new_child : Plibvlc_media_t;
              end );
            2 : ( media_duration_changed : record
                new_duration : Tint64_t;
              end );
            3 : ( media_parsed_changed : record
                new_status : longint;
              end );
            4 : ( media_freed : record
                md : Plibvlc_media_t;
              end );
            5 : ( media_state_changed : record
                new_state : longint;
              end );
            6 : ( media_subitemtree_added : record
                item : Plibvlc_media_t;
              end );
            7 : ( media_player_buffering : record
                new_cache : single;
              end );
            8 : ( media_player_chapter_changed : record
                new_chapter : longint;
              end );
            9 : ( media_player_position_changed : record
                new_position : single;
              end );
            10 : ( media_player_time_changed : record
                new_time : Tlibvlc_time_t;
              end );
            11 : ( media_player_title_changed : record
                new_title : longint;
              end );
            12 : ( media_player_seekable_changed : record
                new_seekable : longint;
              end );
            13 : ( media_player_pausable_changed : record
                new_pausable : longint;
              end );
            14 : ( media_player_scrambled_changed : record
                new_scrambled : longint;
              end );
            15 : ( media_player_vout : record
                new_count : longint;
              end );
            16 : ( media_list_item_added : record
                item : Plibvlc_media_t;
                index : longint;
              end );
            17 : ( media_list_will_add_item : record
                item : Plibvlc_media_t;
                index : longint;
              end );
            18 : ( media_list_item_deleted : record
                item : Plibvlc_media_t;
                index : longint;
              end );
            19 : ( media_list_will_delete_item : record
                item : Plibvlc_media_t;
                index : longint;
              end );
            20 : ( media_list_player_next_item_set : record
                item : Plibvlc_media_t;
              end );
            21 : ( media_player_snapshot_taken : record
                psz_filename : Pchar;
              end );
            22 : ( media_player_length_changed : record
                new_length : Tlibvlc_time_t;
              end );
            23 : ( vlm_media_event : record
                psz_media_name : Pchar;
                psz_instance_name : Pchar;
              end );
            24 : ( media_player_media_changed : record
                new_media : Plibvlc_media_t;
              end );
            25 : ( media_player_es_changed : record
                i_type : Tlibvlc_track_type_t;
                i_id : longint;
              end );
            26 : ( media_player_audio_volume : record
                volume : single;
              end );
            27 : ( media_player_audio_device : record
                device : Pchar;
              end );
            28 : ( renderer_discoverer_item_added : record
                item : Plibvlc_renderer_item_t;
              end );
            29 : ( renderer_discoverer_item_deleted : record
                item : Plibvlc_renderer_item_t;
              end );
          end;
    end;
{*@  }
{$endif}
{ _LIBVLC_EVENTS_H  }

// === Konventiert am: 13-10-25 19:24:33 ===


implementation



end.
