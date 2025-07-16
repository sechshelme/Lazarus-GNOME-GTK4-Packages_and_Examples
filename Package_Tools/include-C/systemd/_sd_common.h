/* SPDX-License-Identifier: LGPL-2.1-or-later */
#ifndef foosdcommonhfoo
#define foosdcommonhfoo

/***
  systemd is free software; you can redistribute it and/or modify it
  under the terms of the GNU Lesser General Public License as published by
  the Free Software Foundation; either version 2.1 of the License, or
  (at your option) any later version.

  systemd is distributed in the hope that it will be useful, but
  WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
  Lesser General Public License for more details.

  You should have received a copy of the GNU Lesser General Public License
  along with systemd; If not, see <https://www.gnu.org/licenses/>.
***/

/* This is a private header; never even think of including this directly! */


typedef void (*_sd_destroy_t)(void *userdata);


/* Note that strictly speaking __deprecated__ has been available before GCC 6. However, starting with GCC 6
 * it also works on enum values, which we are interested in. Since this is a developer-facing feature anyway
 * (as opposed to build engineer-facing), let's hence conditionalize this to gcc 6, given that the developers
 * are probably going to use something newer anyway. */

