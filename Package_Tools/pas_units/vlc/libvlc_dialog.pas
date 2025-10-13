unit libvlc_dialog;

interface

uses
  fp_vlc;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{****************************************************************************
 * libvlc_dialog.h:  libvlc dialog API
 *****************************************************************************
 * Copyright © 2016 VLC authors and VideoLAN
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
{$ifndef LIBVLC_DIALOG_H}

const
  LIBVLC_DIALOG_H = 1;  
{$include <stdbool.h>}
type
{*
 * @defgroup libvlc_dialog LibVLC dialog
 * @ingroup libvlc
 * @
 * @file
 * LibVLC dialog external API
  }

  Plibvlc_dialog_question_type = ^Tlibvlc_dialog_question_type;
  Tlibvlc_dialog_question_type =  Longint;
  Const
    LIBVLC_DIALOG_QUESTION_NORMAL = 0;
    LIBVLC_DIALOG_QUESTION_WARNING = 1;
    LIBVLC_DIALOG_QUESTION_CRITICAL = 2;
;
{*
 * Dialog callbacks to be implemented
  }
{*
     * Called when an error message needs to be displayed
     *
     * @param p_data opaque pointer for the callback
     * @param psz_title title of the dialog
     * @param psz_text text of the dialog
      }
{*
     * Called when a login dialog needs to be displayed
     *
     * You can interact with this dialog by calling libvlc_dialog_post_login()
     * to post an answer or libvlc_dialog_dismiss() to cancel this dialog.
     *
     * @note to receive this callback, libvlc_dialog_cbs.pf_cancel should not be
     * NULL.
     *
     * @param p_data opaque pointer for the callback
     * @param p_id id used to interact with the dialog
     * @param psz_title title of the dialog
     * @param psz_text text of the dialog
     * @param psz_default_username user name that should be set on the user form
     * @param b_ask_store if true, ask the user if he wants to save the
     * credentials
      }
{*
     * Called when a question dialog needs to be displayed
     *
     * You can interact with this dialog by calling libvlc_dialog_post_action()
     * to post an answer or libvlc_dialog_dismiss() to cancel this dialog.
     *
     * @note to receive this callback, libvlc_dialog_cbs.pf_cancel should not be
     * NULL.
     *
     * @param p_data opaque pointer for the callback
     * @param p_id id used to interact with the dialog
     * @param psz_title title of the dialog
     * @param psz_text text of the dialog
     * @param i_type question type (or severity) of the dialog
     * @param psz_cancel text of the cancel button
     * @param psz_action1 text of the first button, if NULL, don't display this
     * button
     * @param psz_action2 text of the second button, if NULL, don't display
     * this button
      }
{*
     * Called when a progress dialog needs to be displayed
     *
     * If cancellable (psz_cancel != NULL), you can cancel this dialog by
     * calling libvlc_dialog_dismiss()
     *
     * @note to receive this callback, libvlc_dialog_cbs.pf_cancel and
     * libvlc_dialog_cbs.pf_update_progress should not be NULL.
     *
     * @param p_data opaque pointer for the callback
     * @param p_id id used to interact with the dialog
     * @param psz_title title of the dialog
     * @param psz_text text of the dialog
     * @param b_indeterminate true if the progress dialog is indeterminate
     * @param f_position initial position of the progress bar (between 0.0 and
     * 1.0)
     * @param psz_cancel text of the cancel button, if NULL the dialog is not
     * cancellable
      }
{*
     * Called when a displayed dialog needs to be cancelled
     *
     * The implementation must call libvlc_dialog_dismiss() to really release
     * the dialog.
     *
     * @param p_data opaque pointer for the callback
     * @param p_id id of the dialog
      }
{*
     * Called when a progress dialog needs to be updated
     *
     * @param p_data opaque pointer for the callback
     * @param p_id id of the dialog
     * @param f_position osition of the progress bar (between 0.0 and 1.0)
     * @param psz_text new text of the progress dialog
      }
type
  Plibvlc_dialog_cbs = ^Tlibvlc_dialog_cbs;
  Tlibvlc_dialog_cbs = record
      pf_display_error : procedure (p_data:pointer; psz_title:Pchar; psz_text:Pchar);cdecl;
      pf_display_login : procedure (p_data:pointer; p_id:Plibvlc_dialog_id; psz_title:Pchar; psz_text:Pchar; psz_default_username:Pchar; 
                    b_ask_store:Tbool);cdecl;
      pf_display_question : procedure (p_data:pointer; p_id:Plibvlc_dialog_id; psz_title:Pchar; psz_text:Pchar; i_type:Tlibvlc_dialog_question_type; 
                    psz_cancel:Pchar; psz_action1:Pchar; psz_action2:Pchar);cdecl;
      pf_display_progress : procedure (p_data:pointer; p_id:Plibvlc_dialog_id; psz_title:Pchar; psz_text:Pchar; b_indeterminate:Tbool; 
                    f_position:single; psz_cancel:Pchar);cdecl;
      pf_cancel : procedure (p_data:pointer; p_id:Plibvlc_dialog_id);cdecl;
      pf_update_progress : procedure (p_data:pointer; p_id:Plibvlc_dialog_id; f_position:single; psz_text:Pchar);cdecl;
    end;
{*
 * Register callbacks in order to handle VLC dialogs
 *
 * @version LibVLC 3.0.0 and later.
 *
 * @param p_cbs a pointer to callbacks, or NULL to unregister callbacks.
 * @param p_data opaque pointer for the callback
  }

procedure libvlc_dialog_set_callbacks(p_instance:Plibvlc_instance_t; p_cbs:Plibvlc_dialog_cbs; p_data:pointer);cdecl;external libvlc;
{*
 * Associate an opaque pointer with the dialog id
 *
 * @version LibVLC 3.0.0 and later.
  }
procedure libvlc_dialog_set_context(p_id:Plibvlc_dialog_id; p_context:pointer);cdecl;external libvlc;
{*
 * Return the opaque pointer associated with the dialog id
 *
 * @version LibVLC 3.0.0 and later.
  }
function libvlc_dialog_get_context(p_id:Plibvlc_dialog_id):pointer;cdecl;external libvlc;
{*
 * Post a login answer
 *
 * After this call, p_id won't be valid anymore
 *
 * @see libvlc_dialog_cbs.pf_display_login
 *
 * @version LibVLC 3.0.0 and later.
 *
 * @param p_id id of the dialog
 * @param psz_username valid and non empty string
 * @param psz_password valid string (can be empty)
 * @param b_store if true, store the credentials
 * @return 0 on success, or -1 on error
  }
function libvlc_dialog_post_login(p_id:Plibvlc_dialog_id; psz_username:Pchar; psz_password:Pchar; b_store:Tbool):longint;cdecl;external libvlc;
{*
 * Post a question answer
 *
 * After this call, p_id won't be valid anymore
 *
 * @see libvlc_dialog_cbs.pf_display_question
 *
 * @version LibVLC 3.0.0 and later.
 *
 * @param p_id id of the dialog
 * @param i_action 1 for action1, 2 for action2
 * @return 0 on success, or -1 on error
  }
function libvlc_dialog_post_action(p_id:Plibvlc_dialog_id; i_action:longint):longint;cdecl;external libvlc;
{*
 * Dismiss a dialog
 *
 * After this call, p_id won't be valid anymore
 *
 * @see libvlc_dialog_cbs.pf_cancel
 *
 * @version LibVLC 3.0.0 and later.
 *
 * @param p_id id of the dialog
 * @return 0 on success, or -1 on error
  }
function libvlc_dialog_dismiss(p_id:Plibvlc_dialog_id):longint;cdecl;external libvlc;
{* @  }
{$endif}
{ LIBVLC_DIALOG_H  }

// === Konventiert am: 13-10-25 19:24:31 ===


implementation



end.
