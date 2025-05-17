/* EINA - EFL data type library
 * Copyright (C) 2020 Ali Alzyod
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

#ifndef EINA_RANGE_H_
#define EINA_RANGE_H_

#include "eina_types.h"

#include "eina_cpu.h"


/** @brief A Int range */
typedef struct _Eina_Range
{
   size_t start;
   size_t length;
} Eina_Range;


/**
 * @brief convenience macro for comparing two Eina_Range structs
 * @param[in] a An Eina_Range
 * @param[in] b An Eina_Range
 * @return 1 if the structs are equal, 0 if they are not
 * @since 1.24
 */


/**
 * @brief Union between two ranges.
 *
 * @param[in] range The first range.
 * @param[in] range2 The second range.
 * @return The union between two ranges.
 *
 * @since 1.24
 * */

#include "eina_inline_range.x"

#endif /*EINA_RANGE_H_*/
