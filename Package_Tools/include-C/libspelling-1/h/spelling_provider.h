/*
 * spelling-provider.h
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



#define SPELLING_TYPE_PROVIDER         (spelling_provider_get_type())
#define SPELLING_PROVIDER(obj)         (G_TYPE_CHECK_INSTANCE_CAST(obj, SPELLING_TYPE_PROVIDER, SpellingProvider))
#define SPELLING_PROVIDER_CLASS(klass) (G_TYPE_CHECK_CLASS_CAST(klass, SPELLING_TYPE_PROVIDER, SpellingProviderClass))
#define SPELLING_IS_PROVIDER(obj)      (G_TYPE_CHECK_INSTANCE_TYPE(obj, SPELLING_TYPE_PROVIDER))

typedef struct _SpellingProvider SpellingProvider;
typedef struct _SpellingProviderClass SpellingProviderClass;

extern
GType             spelling_provider_get_type          (void) ;
extern
SpellingProvider *spelling_provider_get_default       (void);
extern
const char       *spelling_provider_get_default_code  (SpellingProvider *self);
extern
const char       *spelling_provider_get_display_name  (SpellingProvider *self);
extern
gboolean          spelling_provider_supports_language (SpellingProvider *self,
                                                       const char       *language);
extern
GPtrArray        *spelling_provider_list_languages    (SpellingProvider *self);
extern
SpellingLanguage *spelling_provider_get_language      (SpellingProvider *self,
                                                       const char       *language);

//G_DEFINE_AUTOPTR_CLEANUP_FUNC  (SpellingProvider, g_object_unref)


