/* EINA - EFL data type library
 * Copyright (C) 2013 Gustavo Sverzut Barbieri
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

#ifndef EINA_ALLOCA_H
# define EINA_ALLOCA_H

# include <stdlib.h>
# include <stddef.h>

/**
 * @file eina_alloca.h
 * Check if GCC's alloca() is available.  If it is available via a different spelling,
 * define alloca to that spelling.
 */


/**
 * @brief Allocates memory in the stack frame of the caller, so that it
 * is automatically freed when the caller returns.
 *
 * @param[in] size Number of bytes of space to allocate.
 * @return Pointer to beginning of the allocated space.
 *
 * @see alloca(3) for more details.
 */
void *alloca(size_t size);
#  endif
# endif

#endif /* EINA_HAVE_ALLOCA_H */
