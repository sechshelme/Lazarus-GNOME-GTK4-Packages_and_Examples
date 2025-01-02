/*
 * Copyright (C) 2012 Igalia S.L.
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Library General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
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

#if !defined(__WEBKIT_H_INSIDE__) && !defined(__WEBKIT_WEB_PROCESS_EXTENSION_H_INSIDE__) && !defined(BUILDING_WEBKIT)
#error "Only <webkit/webkit.h> can be included directly."
#endif

#ifndef WebKitHitTestResult_h
#define WebKitHitTestResult_h

#include <glib-object.h>
#include <webkit/WebKitDefines.h>



#define WEBKIT_TYPE_HIT_TEST_RESULT            (webkit_hit_test_result_get_type())

WEBKIT_DECLARE_FINAL_TYPE (WebKitHitTestResult, webkit_hit_test_result, WEBKIT, HIT_TEST_RESULT, GObject)

/**
 * WebKitHitTestResultContext:
 * @WEBKIT_HIT_TEST_RESULT_CONTEXT_DOCUMENT: anywhere in the document.
 * @WEBKIT_HIT_TEST_RESULT_CONTEXT_LINK: a hyperlink element.
 * @WEBKIT_HIT_TEST_RESULT_CONTEXT_IMAGE: an image element.
 * @WEBKIT_HIT_TEST_RESULT_CONTEXT_MEDIA: a video or audio element.
 * @WEBKIT_HIT_TEST_RESULT_CONTEXT_EDITABLE: an editable element
 * @WEBKIT_HIT_TEST_RESULT_CONTEXT_SCROLLBAR: a scrollbar element.
 * @WEBKIT_HIT_TEST_RESULT_CONTEXT_SELECTION: a selected element. Since 2.8
 *
 * Enum values with flags representing the context of a #WebKitHitTestResult.
 */
typedef enum
{
    WEBKIT_HIT_TEST_RESULT_CONTEXT_DOCUMENT  = 1 << 1,
    WEBKIT_HIT_TEST_RESULT_CONTEXT_LINK      = 1 << 2,
    WEBKIT_HIT_TEST_RESULT_CONTEXT_IMAGE     = 1 << 3,
    WEBKIT_HIT_TEST_RESULT_CONTEXT_MEDIA     = 1 << 4,
    WEBKIT_HIT_TEST_RESULT_CONTEXT_EDITABLE  = 1 << 5,
    WEBKIT_HIT_TEST_RESULT_CONTEXT_SCROLLBAR = 1 << 6,
    WEBKIT_HIT_TEST_RESULT_CONTEXT_SELECTION = 1 << 7
} WebKitHitTestResultContext;

extern guint
webkit_hit_test_result_get_context          (WebKitHitTestResult *hit_test_result);

extern gboolean
webkit_hit_test_result_context_is_link      (WebKitHitTestResult *hit_test_result);

extern gboolean
webkit_hit_test_result_context_is_image     (WebKitHitTestResult *hit_test_result);

extern gboolean
webkit_hit_test_result_context_is_media     (WebKitHitTestResult *hit_test_result);

extern gboolean
webkit_hit_test_result_context_is_editable  (WebKitHitTestResult *hit_test_result);

extern gboolean
webkit_hit_test_result_context_is_selection (WebKitHitTestResult *hit_test_result);

extern const gchar *
webkit_hit_test_result_get_link_uri         (WebKitHitTestResult *hit_test_result);

extern const gchar *
webkit_hit_test_result_get_link_title       (WebKitHitTestResult *hit_test_result);

extern const gchar *
webkit_hit_test_result_get_link_label       (WebKitHitTestResult *hit_test_result);

extern const gchar *
webkit_hit_test_result_get_image_uri        (WebKitHitTestResult *hit_test_result);

extern const gchar *
webkit_hit_test_result_get_media_uri        (WebKitHitTestResult *hit_test_result);

extern gboolean
webkit_hit_test_result_context_is_scrollbar (WebKitHitTestResult *hit_test_result);



#endif
