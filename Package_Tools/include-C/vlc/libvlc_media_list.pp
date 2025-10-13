
unit libvlc_media_list;
interface

{
  Automatically converted by H2Pas 1.0.0 from libvlc_media_list.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    libvlc_media_list.h
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
Plibvlc_event_manager_t  = ^libvlc_event_manager_t;
Plibvlc_instance_t  = ^libvlc_instance_t;
Plibvlc_media_list_t  = ^libvlc_media_list_t;
Plibvlc_media_t  = ^libvlc_media_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{****************************************************************************
 * libvlc_media_list.h:  libvlc_media_list API
 *****************************************************************************
 * Copyright (C) 1998-2008 VLC authors and VideoLAN
 * $Id: fa3b90932be8c3a9cce27925d4867aeddde748d7 $
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
{$ifndef LIBVLC_MEDIA_LIST_H}

const
  LIBVLC_MEDIA_LIST_H = 1;  
{* \defgroup libvlc_media_list LibVLC media list
 * \ingroup libvlc
 * A LibVLC media list holds multiple @ref libvlc_media_t media descriptors.
 * @
 * \file
 * LibVLC media list (playlist) external API
  }
type
{*
 * Create an empty media list.
 *
 * \param p_instance libvlc instance
 * \return empty media list, or NULL on error
  }

function libvlc_media_list_new(p_instance:Plibvlc_instance_t):Plibvlc_media_list_t;cdecl;external;
{*
 * Release media list created with libvlc_media_list_new().
 *
 * \param p_ml a media list created with libvlc_media_list_new()
  }
procedure libvlc_media_list_release(p_ml:Plibvlc_media_list_t);cdecl;external;
{*
 * Retain reference to a media list
 *
 * \param p_ml a media list created with libvlc_media_list_new()
  }
procedure libvlc_media_list_retain(p_ml:Plibvlc_media_list_t);cdecl;external;
{*
 * Associate media instance with this media list instance.
 * If another media instance was present it will be released.
 * The libvlc_media_list_lock should NOT be held upon entering this function.
 *
 * \param p_ml a media list instance
 * \param p_md media instance to add
  }
procedure libvlc_media_list_set_media(p_ml:Plibvlc_media_list_t; p_md:Plibvlc_media_t);cdecl;external;
{*
 * Get media instance from this media list instance. This action will increase
 * the refcount on the media instance.
 * The libvlc_media_list_lock should NOT be held upon entering this function.
 *
 * \param p_ml a media list instance
 * \return media instance
  }
function libvlc_media_list_media(p_ml:Plibvlc_media_list_t):Plibvlc_media_t;cdecl;external;
{*
 * Add media instance to media list
 * The libvlc_media_list_lock should be held upon entering this function.
 *
 * \param p_ml a media list instance
 * \param p_md a media instance
 * \return 0 on success, -1 if the media list is read-only
  }
function libvlc_media_list_add_media(p_ml:Plibvlc_media_list_t; p_md:Plibvlc_media_t):longint;cdecl;external;
{*
 * Insert media instance in media list on a position
 * The libvlc_media_list_lock should be held upon entering this function.
 *
 * \param p_ml a media list instance
 * \param p_md a media instance
 * \param i_pos position in array where to insert
 * \return 0 on success, -1 if the media list is read-only
  }
function libvlc_media_list_insert_media(p_ml:Plibvlc_media_list_t; p_md:Plibvlc_media_t; i_pos:longint):longint;cdecl;external;
{*
 * Remove media instance from media list on a position
 * The libvlc_media_list_lock should be held upon entering this function.
 *
 * \param p_ml a media list instance
 * \param i_pos position in array where to insert
 * \return 0 on success, -1 if the list is read-only or the item was not found
  }
function libvlc_media_list_remove_index(p_ml:Plibvlc_media_list_t; i_pos:longint):longint;cdecl;external;
{*
 * Get count on media list items
 * The libvlc_media_list_lock should be held upon entering this function.
 *
 * \param p_ml a media list instance
 * \return number of items in media list
  }
function libvlc_media_list_count(p_ml:Plibvlc_media_list_t):longint;cdecl;external;
{*
 * List media instance in media list at a position
 * The libvlc_media_list_lock should be held upon entering this function.
 *
 * \param p_ml a media list instance
 * \param i_pos position in array where to insert
 * \return media instance at position i_pos, or NULL if not found.
 * In case of success, libvlc_media_retain() is called to increase the refcount
 * on the media.
  }
function libvlc_media_list_item_at_index(p_ml:Plibvlc_media_list_t; i_pos:longint):Plibvlc_media_t;cdecl;external;
{*
 * Find index position of List media instance in media list.
 * Warning: the function will return the first matched position.
 * The libvlc_media_list_lock should be held upon entering this function.
 *
 * \param p_ml a media list instance
 * \param p_md media instance
 * \return position of media instance or -1 if media not found
  }
function libvlc_media_list_index_of_item(p_ml:Plibvlc_media_list_t; p_md:Plibvlc_media_t):longint;cdecl;external;
{*
 * This indicates if this media list is read-only from a user point of view
 *
 * \param p_ml media list instance
 * \return 1 on readonly, 0 on readwrite
 *
 * \libvlc_return_bool
  }
function libvlc_media_list_is_readonly(p_ml:Plibvlc_media_list_t):longint;cdecl;external;
{*
 * Get lock on media list items
 *
 * \param p_ml a media list instance
  }
procedure libvlc_media_list_lock(p_ml:Plibvlc_media_list_t);cdecl;external;
{*
 * Release lock on media list items
 * The libvlc_media_list_lock should be held upon entering this function.
 *
 * \param p_ml a media list instance
  }
procedure libvlc_media_list_unlock(p_ml:Plibvlc_media_list_t);cdecl;external;
{*
 * Get libvlc_event_manager from this media list instance.
 * The p_event_manager is immutable, so you don't have to hold the lock
 *
 * \param p_ml a media list instance
 * \return libvlc_event_manager
  }
function libvlc_media_list_event_manager(p_ml:Plibvlc_media_list_t):Plibvlc_event_manager_t;cdecl;external;
{* @ media_list  }
{$endif}
{ _LIBVLC_MEDIA_LIST_H  }

implementation


end.
