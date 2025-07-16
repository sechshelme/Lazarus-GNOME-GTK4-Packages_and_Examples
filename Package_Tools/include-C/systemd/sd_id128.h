/* SPDX-License-Identifier: LGPL-2.1-or-later */
#ifndef foosdid128hfoo
#define foosdid128hfoo

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

#include <inttypes.h>
#include <stdarg.h>
#include <string.h>

#include "_sd-common.h"

// xxxxxxxxxxxxxxxxxxxxxx
// Makro verseuchung


/* 128-bit ID APIs. See sd-id128(3) for more information. */

typedef union sd_id128 sd_id128_t;

union sd_id128 {
        uint8_t bytes[16];
        uint64_t qwords[2];
};

#define SD_ID128_STRING_MAX 33U
#define SD_ID128_UUID_STRING_MAX 37U

char *sd_id128_to_string(sd_id128_t id, char s[123]);
char *sd_id128_to_uuid_string(sd_id128_t id, char s[123]);
int sd_id128_from_string(const char *s, sd_id128_t *ret);


int sd_id128_randomize(sd_id128_t *ret);

int sd_id128_get_machine(sd_id128_t *ret);
int sd_id128_get_boot(sd_id128_t *ret);
int sd_id128_get_invocation(sd_id128_t *ret);

int sd_id128_get_app_specific(sd_id128_t base, sd_id128_t app_id, sd_id128_t *ret);
int sd_id128_get_machine_app_specific(sd_id128_t app_id, sd_id128_t *ret);
int sd_id128_get_boot_app_specific(sd_id128_t app_id, sd_id128_t *ret);



/* Note that SD_ID128_FORMAT_VAL will evaluate the passed argument 16
 * times. It is hence not a good idea to call this macro with an
 * expensive function as parameter or an expression with side
 * effects */


/* Like SD_ID128_FORMAT_STR, but formats as UUID, not in plain format (Strictly Big Endian byte order,
 * i.e. treats everything as RFC4122 Variant 1 UUIDs, even if variant says otherwise, but matching other
 * Linux userspace behaviour.) */




#endif
