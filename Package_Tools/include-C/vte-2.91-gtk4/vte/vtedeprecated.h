/*
 * Copyright (C) 2001,2002,2003,2009,2010 Red Hat, Inc.
 *
 * This library is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published
 * by the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this library.  If not, see <https://www.gnu.org/licenses/>.
 */

#pragma once

#include "vteterminal.h"
#include "vtepty.h"
#include "vtemacros.h"





extern
void vte_terminal_match_set_cursor(VteTerminal *terminal,
                                   int tag,
                                   GdkCursor *cursor) ;



extern
char *vte_terminal_match_check(VteTerminal *terminal,
			       glong column, glong row,
			       int *tag)  ;



extern
gboolean vte_terminal_spawn_sync(VteTerminal *terminal,
                                 VtePtyFlags pty_flags,
                                 const char *working_directory,
                                 char **argv,
                                 char **envv,
                                 GSpawnFlags spawn_flags,
                                 GSpawnChildSetupFunc child_setup,
                                 gpointer child_setup_data,
                                 GPid *child_pid /* out */,
                                 GCancellable *cancellable,
                                 GError **error)  ;


extern
void vte_pty_close (VtePty *pty)  ;


extern
void vte_terminal_copy_clipboard(VteTerminal *terminal)  ;



extern
const char *vte_terminal_get_icon_title(VteTerminal *terminal)  ;


extern
gboolean vte_terminal_set_encoding(VteTerminal *terminal,
                                   const char *codeset,
                                   GError **error)  ;


extern
const char *vte_terminal_get_encoding(VteTerminal *terminal)  ;

typedef gboolean (*VteSelectionFunc)(VteTerminal *terminal,
                                     glong column,
                                     glong row,
                                     gpointer data)  ;



extern
char *vte_terminal_get_text(VteTerminal *terminal,
			    VteSelectionFunc is_selected,
			    gpointer user_data,
			    GArray *attributes)   ;




extern
char *vte_terminal_get_text_range(VteTerminal *terminal,
				  glong start_row, glong start_col,
				  glong end_row, glong end_col,
				  VteSelectionFunc is_selected,
				  gpointer user_data,
				  GArray *attributes)   ;




extern
char *vte_terminal_get_text_include_trailing_spaces(VteTerminal *terminal,
						    VteSelectionFunc is_selected,
						    gpointer user_data,
						    GArray *attributes)   ;



extern
void vte_terminal_set_rewrap_on_resize(VteTerminal *terminal,
                                       gboolean rewrap)  ;

extern
gboolean vte_terminal_get_rewrap_on_resize(VteTerminal *terminal)  ;


extern
void vte_terminal_set_allow_bold(VteTerminal *terminal,
                                 gboolean allow_bold)  ;

extern
gboolean vte_terminal_get_allow_bold(VteTerminal *terminal)  ;


extern
void vte_terminal_feed_child_binary(VteTerminal *terminal,
                                    const guint8 *data,
                                    gsize length)  ;


extern
char **vte_get_encodings(gboolean include_aliases) ;


extern
gboolean vte_get_encoding_supported(const char *encoding) ;

typedef struct _VteCharAttributes VteCharAttributes ;

/* The structure we return as the supplemental attributes for strings. */
struct _VteCharAttributes {
        /*< private >*/
        long row, column;  /* logical column */
	PangoColor fore, back;
	guint underline:1, strikethrough:1, columns:4;
} ;



#undef 
