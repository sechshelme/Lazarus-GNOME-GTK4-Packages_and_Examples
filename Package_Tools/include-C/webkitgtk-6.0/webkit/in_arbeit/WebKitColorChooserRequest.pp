
unit WebKitColorChooserRequest;
interface

{
  Automatically converted by H2Pas 1.0.0 from WebKitColorChooserRequest.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    WebKitColorChooserRequest.h
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
PGdkRectangle  = ^GdkRectangle;
PGdkRGBA  = ^GdkRGBA;
PWebKitColorChooserRequest  = ^WebKitColorChooserRequest;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2015 Igalia S.L.
 * Copyright (c) 2012, Samsung Electronics
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 * * Redistributions of source code must retain the above copyright notice, this
 *   list of conditions and the following disclaimer.
 * * Redistributions in binary form must reproduce the above copyright notice,
 *   this list of conditions and the following disclaimer in the documentation
 *   and/or other materials provided with the distribution.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
 * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGE.
  }
{$if !defined(__WEBKIT_H_INSIDE__) && !defined(BUILDING_WEBKIT)}
{$error "Only <webkit/webkit.h> can be included directly."}
{$endif}
{$ifndef WebKitColorChooserRequest_h}
{$define WebKitColorChooserRequest_h}
{$include <gtk/gtk.h>}
{$include <webkit/WebKitDefines.h>}

{ was #define dname def_expr }
function WEBKIT_TYPE_COLOR_CHOOSER_REQUEST : longint; { return type might be wrong }

{WEBKIT_DECLARE_FINAL_TYPE (WebKitColorChooserRequest, webkit_color_chooser_request, WEBKIT, COLOR_CHOOSER_REQUEST, GObject) }
procedure webkit_color_chooser_request_get_rgba(request:PWebKitColorChooserRequest; rgba:PGdkRGBA);cdecl;external;
(* Const before type ignored *)
procedure webkit_color_chooser_request_set_rgba(request:PWebKitColorChooserRequest; rgba:PGdkRGBA);cdecl;external;
procedure webkit_color_chooser_request_get_element_rectangle(request:PWebKitColorChooserRequest; rect:PGdkRectangle);cdecl;external;
procedure webkit_color_chooser_request_finish(request:PWebKitColorChooserRequest);cdecl;external;
procedure webkit_color_chooser_request_cancel(request:PWebKitColorChooserRequest);cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function WEBKIT_TYPE_COLOR_CHOOSER_REQUEST : longint; { return type might be wrong }
  begin
    WEBKIT_TYPE_COLOR_CHOOSER_REQUEST:=webkit_color_chooser_request_get_type;
  end;


end.
