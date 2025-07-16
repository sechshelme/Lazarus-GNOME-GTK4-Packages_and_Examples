unit sd_bus_vtable;

interface

uses
  ctypes;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: LGPL-2.1-or-later  }
{$ifndef foosdbusvtablehfoo}
{$define foosdbusvtablehfoo}
{**
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
** }
{$include "_sd-common.h"}
type
{$include "sd-bus.h"}
type
  Txxxx =  Longint;
  Const
    _SD_BUS_VTABLE_START = '<';
    _SD_BUS_VTABLE_END = '>';
    _SD_BUS_VTABLE_METHOD = 'M';
    _SD_BUS_VTABLE_SIGNAL = 'S';
    _SD_BUS_VTABLE_PROPERTY = 'P';
    _SD_BUS_VTABLE_WRITABLE_PROPERTY = 'W';

{ covers both directions: method call + reply  }
type
  Txxxx =  Longint;
  Const
    SD_BUS_VTABLE_DEPRECATED = 1 shl 0;
    SD_BUS_VTABLE_HIDDEN = 1 shl 1;
    SD_BUS_VTABLE_UNPRIVILEGED = 1 shl 2;
    SD_BUS_VTABLE_METHOD_NO_REPLY = 1 shl 3;
    SD_BUS_VTABLE_PROPERTY_CONST = 1 shl 4;
    SD_BUS_VTABLE_PROPERTY_EMITS_CHANGE = 1 shl 5;
    SD_BUS_VTABLE_PROPERTY_EMITS_INVALIDATION = 1 shl 6;
    SD_BUS_VTABLE_PROPERTY_EXPLICIT = 1 shl 7;
    SD_BUS_VTABLE_SENSITIVE = 1 shl 8;
    SD_BUS_VTABLE_ABSOLUTE_OFFSET = 1 shl 9;
    _SD_BUS_VTABLE_CAPABILITY_MASK = $FFFF shl 40;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function SD_BUS_VTABLE_CAPABILITY(x : longint) : longint;

type
  Txxxx =  Longint;
  Const
    _SD_BUS_VTABLE_PARAM_NAMES = 1 shl 0;

  var
    sd_bus_object_vtable_format : dword;cvar;external libsystemd;
{ Note: unused areas in the sd_bus_vtable[] array must be initialized to 0. The structure contains an embedded
 * union, and the compiler is NOT required to initialize the unused areas of the union when the rest of the
 * structure is initialized. Normally the array is defined as read-only data, in which case the linker places
 * it in the BSS section, which is always fully initialized, so this is not a concern. But if the array is
 * created on the stack or on the heap, care must be taken to initialize the unused areas, for examply by
 * first memsetting the whole region to zero before filling the data in.  }
{ xxxxxxxxxxxxxxxxxxx }
{
struct sd_bus_vtable 

         uint8_t type:8;
         uint64_t flags:56;
        union 
                struct 
                        size_t element_size;
                        uint64_t features;
                        const unsigned *vtable_format_reference;
                 start;
                struct 
                        size_t _reserved;
                 end;
                struct 
                        const char *member;
                        const char *signature;
                        const char *result;
                        sd_bus_message_handler_t handler;
                        size_t offset;
                        const char *names;
                 method;
                struct 
                        const char *member;
                        const char *signature;
                        const char *names;
                 signal;
                struct 
                        const char *member;
                        const char *signature;
                        sd_bus_property_get_t get;
                        sd_bus_property_set_t set;
                        size_t offset;
                 property;
         x;
;
 }
{$endif}

// === Konventiert am: 16-7-25 19:03:45 ===


implementation


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function SD_BUS_VTABLE_CAPABILITY(x : longint) : longint;
begin
  SD_BUS_VTABLE_CAPABILITY:=(Tuint64_t((Tx(+(1))) and $FFFF)) shl 40;
end;


end.
