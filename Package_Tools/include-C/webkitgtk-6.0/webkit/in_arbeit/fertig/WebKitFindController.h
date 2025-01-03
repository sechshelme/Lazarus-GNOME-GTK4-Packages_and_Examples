/*
 * Copyright (C) 2012 Igalia S.L.
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Library General Public License for more details.
 *
 * You should have received a copy of the GNU Library General Public License
 * along with this library; see the file COPYING.LIB.  If not, write to
 * the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
 * Boston, MA 02110-1301, USA.
 */

#if !defined(__WEBKIT_H_INSIDE__) && !defined(BUILDING_WEBKIT)
#error "Only <webkit/webkit.h> can be included directly."
#endif

#ifndef WebKitFindController_h
#define WebKitFindController_h

#include <glib-object.h>
#include <webkit/WebKitDefines.h>



#define WEBKIT_TYPE_FIND_CONTROLLER            (webkit_find_controller_get_type())

//WEBKIT_DECLARE_FINAL_TYPE (WebKitFindController, webkit_find_controller, WEBKIT, FIND_CONTROLLER, GObject)

typedef struct _WebKitWebView WebKitWebView;

/**
 * WebKitFindOptions:
 * @WEBKIT_FIND_OPTIONS_NONE: no search flags, this means a case
 *   sensitive, no wrap, forward only search.
 * @WEBKIT_FIND_OPTIONS_CASE_INSENSITIVE: case insensitive search.
 * @WEBKIT_FIND_OPTIONS_AT_WORD_STARTS: search text only at the
 *   begining of the words.
 * @WEBKIT_FIND_OPTIONS_TREAT_MEDIAL_CAPITAL_AS_WORD_START: treat
 *   capital letters in the middle of words as word start.
 * @WEBKIT_FIND_OPTIONS_BACKWARDS: search backwards.
 * @WEBKIT_FIND_OPTIONS_WRAP_AROUND: if not present search will stop
 *   at the end of the document.
 *
 * Enum values used to specify search options.
 */
typedef enum {
  WEBKIT_FIND_OPTIONS_NONE,

  WEBKIT_FIND_OPTIONS_CASE_INSENSITIVE =                   1 << 0,
  WEBKIT_FIND_OPTIONS_AT_WORD_STARTS =                     1 << 1,
  WEBKIT_FIND_OPTIONS_TREAT_MEDIAL_CAPITAL_AS_WORD_START = 1 << 2,
  WEBKIT_FIND_OPTIONS_BACKWARDS =                          1 << 3,
  WEBKIT_FIND_OPTIONS_WRAP_AROUND =                        1 << 4
} WebKitFindOptions;

extern void
webkit_find_controller_search              (WebKitFindController *find_controller,
                                            const gchar          *search_text,
                                            guint32               find_options,
                                            guint                 max_match_count);

extern void
webkit_find_controller_search_finish       (WebKitFindController *find_controller);

extern void
webkit_find_controller_search_next         (WebKitFindController *find_controller);

extern void
webkit_find_controller_search_previous     (WebKitFindController *find_controller);

extern void
webkit_find_controller_count_matches       (WebKitFindController *find_controller,
                                            const gchar          *search_text,
                                            guint32               find_options,
                                            guint                 max_match_count);

extern const gchar *
webkit_find_controller_get_search_text     (WebKitFindController *find_controller);

extern guint32
webkit_find_controller_get_options         (WebKitFindController *find_controller);

extern guint
webkit_find_controller_get_max_match_count (WebKitFindController *find_controller);

extern WebKitWebView *
webkit_find_controller_get_web_view        (WebKitFindController *find_controller);



#endif
