/* EINA - EFL data type library
 * Copyright (C) 2002-2008 Carsten Haitzler, Vincent Torri, Jorge Luis Zapata Muga
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library;
 * if not, see <http://www.gnu.org/licenses/>.
 */

#ifndef EINA_TRASH_H__
#define EINA_TRASH_H__

/**
 * @defgroup Eina_Trash_Group Trash
 * @ingroup Eina_Containers_Group
 * @brief This group provides a generic container.
 *
 * @{
 */

/**
 * @typedef Eina_Trash
 * @brief The type for structure #_Eina_Trash.
 */
typedef struct _Eina_Trash Eina_Trash;

/**
 * @struct _Eina_Trash
 * @brief The structure type for a generic container of an unused allocated pointer.
 */
struct _Eina_Trash
{
   Eina_Trash *next; /**< Next item in the trash */
};

/**
 * @brief Initializes a trash before using it.
 * @details This function just set to zero the trash to correctly
 *          initialize it.
 *
 * @param[in] trash The trash
 *
 * @note You can just set *trash to @c NULL and you will have
 *       the same result.
 */

/**
 * @def EINA_TRASH_CLEAN
 * @brief Definition for a macro to remove all the pointers from the trash.
 * @details This macro allows the cleaning of @a trash in an easy way. It
 *          removes all the pointers from @a trash until it's empty.
 *
 * @param[in,out] trash The trash to clean
 * @param[out] data The pointer extracted from the trash
 *
 * @note This macro can be used for freeing the data in the trash, like in
 *       the following example:
 *
 * @code
 * Eina_Trash *trash = NULL;
 * char *data;
 *
 * // trash is filled with a pointer to some duped strings.
 *
 * EINA_TRASH_CLEAN(&trash, data)
 *   free(data);
 * @endcode
 *
 * @note This macro is useful when you implement some memory pool.
 */

#include "eina_inline_trash.x"

/**
 * @}
 */

#endif /* EINA_TRASH_H_ */
