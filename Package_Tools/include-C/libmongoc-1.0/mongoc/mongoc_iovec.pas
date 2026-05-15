unit mongoc_iovec;

interface

uses
  fp_mongoc;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright 2014 MongoDB, Inc.
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
{$include "mongoc-prelude.h"}
{$ifndef MONGOC_IOVEC_H}
{$define MONGOC_IOVEC_H}
{$include <bson/bson.h>}
{$ifdef _WIN32}
{$include <stddef.h>}
{$else}
{$include <sys/uio.h>}
{$endif}
type
  Tiovec = Tmongoc_iovec_t;
{$endif}
{ MONGOC_IOVEC_H  }

// === Konventiert am: 15-5-26 15:15:25 ===


implementation



end.
