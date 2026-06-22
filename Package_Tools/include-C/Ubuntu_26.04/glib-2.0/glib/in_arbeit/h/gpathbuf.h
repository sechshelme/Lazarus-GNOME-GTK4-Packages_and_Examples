/* gpathbuf.h: A mutable path builder
 *
 * SPDX-FileCopyrightText: 2023  Emmanuele Bassi
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#pragma once

#if !defined (__GLIB_H_INSIDE__) && !defined (GLIB_COMPILATION)
#error "Only <glib.h> can be included directly."
#endif

#include <glib/gtypes.h>



typedef struct _GPathBuf  GPathBuf;

struct _GPathBuf
{
  /*< private >*/
  gpointer dummy[8];
};

/** xxxxxxxxxxxxx
#define G_PATH_BUF_INIT { { NULL, } } \
  GLIB_AVAILABLE_MACRO_IN_2_76
 */

extern
GPathBuf *    g_path_buf_new            (void);
extern
GPathBuf *    g_path_buf_new_from_path  (const char *path);
extern
GPathBuf *    g_path_buf_init           (GPathBuf   *buf);
extern
GPathBuf *    g_path_buf_init_from_path (GPathBuf   *buf,
                                         const char *path);
extern
void          g_path_buf_clear          (GPathBuf   *buf);
extern
char *        g_path_buf_clear_to_path  (GPathBuf   *buf) ;
extern
void          g_path_buf_free           (GPathBuf   *buf);
extern
char *        g_path_buf_free_to_path   (GPathBuf   *buf) ;
extern
GPathBuf *    g_path_buf_copy           (GPathBuf   *buf);

extern
GPathBuf *    g_path_buf_push           (GPathBuf   *buf,
                                         const char *path);
extern
gboolean      g_path_buf_pop            (GPathBuf   *buf);

extern
gboolean      g_path_buf_set_filename   (GPathBuf   *buf,
                                         const char *file_name);
extern
gboolean      g_path_buf_set_extension  (GPathBuf   *buf,
                                         const char *extension);

extern
char *        g_path_buf_to_path        (GPathBuf   *buf) ;

extern
gboolean      g_path_buf_equal          (gconstpointer v1,
                                         gconstpointer v2);


