unit mongoc_stream_socket;

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
{$ifndef MONGOC_STREAM_SOCKET_H}
{$define MONGOC_STREAM_SOCKET_H}
{$include "mongoc-macros.h"}
{$include "mongoc-socket.h"}
{$include "mongoc-stream.h"}
type

function mongoc_stream_socket_new(socket:Pmongoc_socket_t):Pmongoc_stream_t;cdecl;external libmongoc;
function mongoc_stream_socket_get_socket(stream:Pmongoc_stream_socket_t):Pmongoc_socket_t;cdecl;external libmongoc;
{$endif}
{ MONGOC_STREAM_SOCKET_H  }

// === Konventiert am: 15-5-26 15:14:33 ===


implementation



end.
