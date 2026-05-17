
unit bson_context;
interface

{
  Automatically converted by H2Pas 1.0.0 from bson_context.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    bson_context.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
Pbson_context_t  = ^bson_context_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright 2013 MongoDB, Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
  }
{$include <bson/bson-prelude.h>}
{$ifndef BSON_CONTEXT_H}
{$define BSON_CONTEXT_H}
{$include <bson/bson-macros.h>}
{$include <bson/bson-types.h>}
{*
 * @brief Initialize a new context with the given flags
 *
 * @param flags Flags used to configure the behavior of the context. For most
 * cases, this should be BSON_CONTEXT_NONE.
 *
 * @return A newly allocated context. Must be freed with bson_context_destroy()
 *
 * @note If you expect your pid to change without notice, such as from an
 * unexpected call to fork(), then specify BSON_CONTEXT_DISABLE_PID_CACHE in
 * `flags`.
  }

function bson_context_new(flags:Tbson_context_flags_t):Pbson_context_t;cdecl;external;
{*
 * @brief Destroy and free a bson_context_t created by bson_context_new()
  }
procedure bson_context_destroy(context:Pbson_context_t);cdecl;external;
{*
 * @brief Obtain a pointer to the application-default bson_context_t
 *
 * @note This context_t MUST NOT be passed to bson_context_destroy()
  }
function bson_context_get_default:Pbson_context_t;cdecl;external;
{$endif}
{ BSON_CONTEXT_H  }

implementation


end.
