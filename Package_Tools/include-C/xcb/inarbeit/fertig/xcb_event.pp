
unit xcb_event;
interface

{
  Automatically converted by H2Pas 1.0.0 from xcb_event.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    xcb_event.h
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
Pchar  = ^char;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2008-2009 Julien Danjou <julien@danjou.info>
 *
 * Permission is hereby granted, free of charge, to any person
 * obtaining a copy of this software and associated documentation
 * files (the "Software"), to deal in the Software without
 * restriction, including without limitation the rights to use, copy,
 * modify, merge, publish, distribute, sublicense, and/or sell copies
 * of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY
 * CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF
 * CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
 * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 *
 * Except as contained in this notice, the names of the authors or
 * their institutions shall not be used in advertising or otherwise to
 * promote the sale, use or other dealings in this Software without
 * prior written authorization from the authors.
  }
{*
 * @defgroup xcb__event_t XCB Event Functions
 *
 * These functions ease the handling of X events received.
 *
 * @
  }
{$ifndef __XCB_EVENT_H__}
{$define __XCB_EVENT_H__}
{$include <xcb/xcb.h>}
{ C++ extern C conditionnal removed }
{*
 * @brief Bit mask to find event type regardless of event source.
 *
 * Each event in the X11 protocol contains an 8-bit type code.
 * The most-significant bit in this code is set if the event was
 * generated from a SendEvent request. This mask can be used to
 * determine the type of event regardless of how the event was
 * generated. See the X11R6 protocol specification for details.
  }

const
  XCB_EVENT_RESPONSE_TYPE_MASK = $7f;  
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function XCB_EVENT_RESPONSE_TYPE(e : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function XCB_EVENT_SENT(e : longint) : longint;

{*
 * @brief Convert an event response type to a label.
 * @param type The event type.
 * @return A string with the event name, or NULL if unknown.
  }
(* Const before type ignored *)
function xcb_event_get_label(_type:Tuint8_t):Pchar;cdecl;external;
{*
 * @brief Convert an event error type to a label.
 * @param type The error type.
 * @return A string with the event name, or NULL if unknown or if the event is
 * not an error.
  }
(* Const before type ignored *)
function xcb_event_get_error_label(_type:Tuint8_t):Pchar;cdecl;external;
{*
 * @brief Convert an event request type to a label.
 * @param type The request type.
 * @return A string with the event name, or NULL if unknown or if the event is
 * not an error.
  }
(* Const before type ignored *)
function xcb_event_get_request_label(_type:Tuint8_t):Pchar;cdecl;external;
{ C++ end of extern C conditionnal removed }
{*
 * @
  }
{$endif}
{ __XCB_EVENT_H__  }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function XCB_EVENT_RESPONSE_TYPE(e : longint) : longint;
begin
  XCB_EVENT_RESPONSE_TYPE:=(e^.response_type) and XCB_EVENT_RESPONSE_TYPE_MASK;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function XCB_EVENT_SENT(e : longint) : longint;
begin
  XCB_EVENT_SENT:=(e^.response_type) and ( not (XCB_EVENT_RESPONSE_TYPE_MASK));
end;


end.
