/*
 * spelling-language.h
 *
 * Copyright 2021-2023 Christian Hergert <chergert@redhat.com>
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this library; if not, see <http://www.gnu.org/licenses/>.
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#pragma once

#if !defined(LIBSPELLING_INSIDE) && !defined(LIBSPELLING_COMPILATION)
# error "Only <libspelling.h> can be included directly."
#endif

#include <glib-object.h>

#include "spelling-types.h"
#include "spelling-version-macros.h"

G_BEGIN_DECLS

#define SPELLING_TYPE_LANGUAGE         (spelling_language_get_type())
#define SPELLING_IS_LANGUAGE(obj)      (G_TYPE_CHECK_INSTANCE_TYPE(obj, SPELLING_TYPE_LANGUAGE))
#define SPELLING_LANGUAGE(obj)         (G_TYPE_CHECK_INSTANCE_CAST(obj, SPELLING_TYPE_LANGUAGE, SpellingLanguage))
#define SPELLING_LANGUAGE_CLASS(klass) (G_TYPE_CHECK_CLASS_CAST(klass, SPELLING_TYPE_LANGUAGE, SpellingLanguageClass))

typedef struct _SpellingLanguage SpellingLanguage;
typedef struct _SpellingLanguageClass SpellingLanguageClass;

SPELLING_AVAILABLE_IN_ALL
GType        spelling_language_get_type             (void) G_GNUC_CONST;
SPELLING_AVAILABLE_IN_ALL
const char  *spelling_language_get_code             (SpellingLanguage *self);
SPELLING_AVAILABLE_IN_ALL
gboolean     spelling_language_contains_word        (SpellingLanguage *self,
                                                     const char       *word,
                                                     gssize            word_len);
SPELLING_AVAILABLE_IN_ALL
char       **spelling_language_list_corrections     (SpellingLanguage *self,
                                                     const char       *word,
                                                     gssize            word_len);
SPELLING_AVAILABLE_IN_ALL
void         spelling_language_add_word             (SpellingLanguage *self,
                                                     const char       *word);
SPELLING_AVAILABLE_IN_ALL
void         spelling_language_ignore_word          (SpellingLanguage *self,
                                                     const char       *word);
SPELLING_AVAILABLE_IN_ALL
const char  *spelling_language_get_extra_word_chars (SpellingLanguage *self);

G_DEFINE_AUTOPTR_CLEANUP_FUNC (SpellingLanguage, g_object_unref)

G_END_DECLS
