
unit buffer_compat;
interface

{
  Automatically converted by H2Pas 1.0.0 from buffer_compat.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    buffer_compat.h
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
Pbyte  = ^byte;
Pchar  = ^char;
Pevbuffer  = ^evbuffer;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (c) 2007-2012 Niels Provos and Nick Mathewson
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 * 3. The name of the author may not be used to endorse or promote products
 *    derived from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR
 * IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
 * OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
 * IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT,
 * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
 * NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
 * THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
  }
{$ifndef EVENT2_BUFFER_COMPAT_H_INCLUDED_}
{$define EVENT2_BUFFER_COMPAT_H_INCLUDED_}
{$include <event2/visibility.h>}
{* @file event2/buffer_compat.h

	Obsolete and deprecated versions of the functions in buffer.h: provided
	only for backward compatibility.
  }
{*
   Obsolete alias for evbuffer_readln(buffer, NULL, EVBUFFER_EOL_ANY).

   @deprecated This function is deprecated because its behavior is not correct
      for almost any protocol, and also because it's wholly subsumed by
      evbuffer_readln().

   @param buffer the evbuffer to read from
   @return pointer to a single line, or NULL if an error occurred

 }

function evbuffer_readline(buffer:Pevbuffer):Pchar;cdecl;external;
{* Type definition for a callback that is invoked whenever data is added or
    removed from an evbuffer.

    An evbuffer may have one or more callbacks set at a time.  The order
    in which they are executed is undefined.

    A callback function may add more callbacks, or remove itself from the
    list of callbacks, or add or remove data from the buffer.  It may not
    remove another callback from the list.

    If a callback adds or removes data from the buffer or from another
    buffer, this can cause a recursive invocation of your callback or
    other callbacks.  If you ask for an infinite loop, you might just get
    one: watch out!

    @param buffer the buffer whose size has changed
    @param old_len the previous length of the buffer
    @param new_len the current length of the buffer
    @param arg a pointer to user data
 }
type

  Tevbuffer_cb = procedure (buffer:Pevbuffer; old_len:Tsize_t; new_len:Tsize_t; arg:pointer);cdecl;
{*
  Replace all callbacks on an evbuffer with a single new callback, or
  remove them.

  Subsequent calls to evbuffer_setcb() replace callbacks set by previous
  calls.  Setting the callback to NULL removes any previously set callback.

  @deprecated This function is deprecated because it clears all previous
     callbacks set on the evbuffer, which can cause confusing behavior if
     multiple parts of the code all want to add their own callbacks on a
     buffer.  Instead, use evbuffer_add(), evbuffer_del(), and
     evbuffer_setflags() to manage your own evbuffer callbacks without
     interfering with callbacks set by others.

  @param buffer the evbuffer to be monitored
  @param cb the callback function to invoke when the evbuffer is modified,
	 or NULL to remove all callbacks.
  @param cbarg an argument to be provided to the callback function
  @return 0 if successful, or -1 on error
  }

function evbuffer_setcb(buffer:Pevbuffer; cb:Tevbuffer_cb; cbarg:pointer):longint;cdecl;external;
{*
  Find a string within an evbuffer.

  @param buffer the evbuffer to be searched
  @param what the string to be searched for
  @param len the length of the search string
  @return a pointer to the beginning of the search string, or NULL if the search failed.
  }
(* Const before type ignored *)
function evbuffer_find(buffer:Pevbuffer; what:Pbyte; len:Tsize_t):Pbyte;cdecl;external;
{* deprecated in favor of calling the functions directly  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function EVBUFFER_LENGTH(x : longint) : longint;

{* deprecated in favor of calling the functions directly  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function EVBUFFER_DATA(x : longint) : longint;

{$endif}

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function EVBUFFER_LENGTH(x : longint) : longint;
begin
  EVBUFFER_LENGTH:=evbuffer_get_length(x);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function EVBUFFER_DATA(x : longint) : longint;
begin
  EVBUFFER_DATA:=evbuffer_pullup(x,-(1));
end;


end.
