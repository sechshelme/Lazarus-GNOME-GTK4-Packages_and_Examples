/* SPDX-License-Identifier: LGPL-2.1-or-later */
#ifndef foosdbusvtablehfoo
#define foosdbusvtablehfoo

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

#include "_sd-common.h"


typedef struct sd_bus_vtable sd_bus_vtable;

#include "sd-bus.h"

enum xxxx{
        _SD_BUS_VTABLE_START             = '<',
        _SD_BUS_VTABLE_END               = '>',
        _SD_BUS_VTABLE_METHOD            = 'M',
        _SD_BUS_VTABLE_SIGNAL            = 'S',
        _SD_BUS_VTABLE_PROPERTY          = 'P',
        _SD_BUS_VTABLE_WRITABLE_PROPERTY = 'W'
};

 enum xxxx{
        SD_BUS_VTABLE_DEPRECATED                   = 1ULL << 0,
        SD_BUS_VTABLE_HIDDEN                       = 1ULL << 1,
        SD_BUS_VTABLE_UNPRIVILEGED                 = 1ULL << 2,
        SD_BUS_VTABLE_METHOD_NO_REPLY              = 1ULL << 3,
        SD_BUS_VTABLE_PROPERTY_CONST               = 1ULL << 4,
        SD_BUS_VTABLE_PROPERTY_EMITS_CHANGE        = 1ULL << 5,
        SD_BUS_VTABLE_PROPERTY_EMITS_INVALIDATION  = 1ULL << 6,
        SD_BUS_VTABLE_PROPERTY_EXPLICIT            = 1ULL << 7,
        SD_BUS_VTABLE_SENSITIVE                    = 1ULL << 8, /* covers both directions: method call + reply */
        SD_BUS_VTABLE_ABSOLUTE_OFFSET              = 1ULL << 9,
        _SD_BUS_VTABLE_CAPABILITY_MASK             = 0xFFFFULL << 40
};

#define SD_BUS_VTABLE_CAPABILITY(x) ((uint64_t) (((x)+1) & 0xFFFF) << 40)

enum xxxx{
        _SD_BUS_VTABLE_PARAM_NAMES     = 1 << 0
};

extern const unsigned sd_bus_object_vtable_format;

/* Note: unused areas in the sd_bus_vtable[] array must be initialized to 0. The structure contains an embedded
 * union, and the compiler is NOT required to initialize the unused areas of the union when the rest of the
 * structure is initialized. Normally the array is defined as read-only data, in which case the linker places
 * it in the BSS section, which is always fully initialized, so this is not a concern. But if the array is
 * created on the stack or on the heap, care must be taken to initialize the unused areas, for examply by
 * first memsetting the whole region to zero before filling the data in. */

// xxxxxxxxxxxxxxxxxxx
/*
struct sd_bus_vtable {

         uint8_t type:8;
         uint64_t flags:56;
        union {
                struct {
                        size_t element_size;
                        uint64_t features;
                        const unsigned *vtable_format_reference;
                } start;
                struct {
                        size_t _reserved;
                } end;
                struct {
                        const char *member;
                        const char *signature;
                        const char *result;
                        sd_bus_message_handler_t handler;
                        size_t offset;
                        const char *names;
                } method;
                struct {
                        const char *member;
                        const char *signature;
                        const char *names;
                } signal;
                struct {
                        const char *member;
                        const char *signature;
                        sd_bus_property_get_t get;
                        sd_bus_property_set_t set;
                        size_t offset;
                } property;
        } x;
};
*/


#endif
