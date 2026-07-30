
unit as_screenshot;
interface

{
  Automatically converted by H2Pas 1.0.0 from as_screenshot.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    as_screenshot.h
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
PAsContext  = ^AsContext;
PAsImage  = ^AsImage;
PAsScreenshot  = ^AsScreenshot;
PAsScreenshotClass  = ^AsScreenshotClass;
PAsScreenshotKind  = ^AsScreenshotKind;
PAsScreenshotMediaKind  = ^AsScreenshotMediaKind;
PAsVideo  = ^AsVideo;
Pgchar  = ^gchar;
PGPtrArray  = ^GPtrArray;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: t; c-basic-offset: 8 -*-
 *
 * Copyright (C) 2012-2024 Matthias Klumpp <matthias@tenstral.net>
 * Copyright (C) 2014 Richard Hughes <richard@hughsie.com>
 *
 * Licensed under the GNU Lesser General Public License Version 2.1
 *
 * This library is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, either version 2.1 of the license, or
 * (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this library.  If not, see <http://www.gnu.org/licenses/>.
  }
{$if !defined(__APPSTREAM_H) && !defined(AS_COMPILATION)}
{$error "Only <appstream.h> can be included directly."}
{$endif}
{$ifndef __AS_SCREENSHOT_H}
{$define __AS_SCREENSHOT_H}
{$include <glib-object.h>}
{$include "as-context.h"}
{$include "as-image.h"}
{$include "as-video.h"}

{ was #define dname def_expr }
function AS_TYPE_SCREENSHOT : longint; { return type might be wrong }

{G_DECLARE_DERIVABLE_TYPE (AsScreenshot, as_screenshot, AS, SCREENSHOT, GObject) }
{< private > }
type
  PAsScreenshotClass = ^TAsScreenshotClass;
  TAsScreenshotClass = record
      parent_class : TGObjectClass;
      _as_reserved1 : procedure ;cdecl;
      _as_reserved2 : procedure ;cdecl;
      _as_reserved3 : procedure ;cdecl;
      _as_reserved4 : procedure ;cdecl;
      _as_reserved5 : procedure ;cdecl;
      _as_reserved6 : procedure ;cdecl;
    end;

{*
 * AsScreenshotKind:
 * @AS_SCREENSHOT_KIND_UNKNOWN:		Type invalid or not known
 * @AS_SCREENSHOT_KIND_DEFAULT:		The primary screenshot to show by default
 * @AS_SCREENSHOT_KIND_EXTRA:		Optional screenshot
 *
 * The screenshot type.
 * }
{< private > }

  PAsScreenshotKind = ^TAsScreenshotKind;
  TAsScreenshotKind =  Longint;
  Const
    AS_SCREENSHOT_KIND_UNKNOWN = 0;
    AS_SCREENSHOT_KIND_DEFAULT = 1;
    AS_SCREENSHOT_KIND_EXTRA = 2;
    AS_SCREENSHOT_KIND_LAST = 3;
;
{*
 * AsScreenshotMediaKind:
 * @AS_SCREENSHOT_MEDIA_KIND_UNKNOWN:	Media kind is unknown
 * @AS_SCREENSHOT_MEDIA_KIND_IMAGE:	The screenshot contains images
 * @AS_SCREENSHOT_MEDIA_KIND_VIDEO:	The screenshot contains videos
 *
 * The media kind contained in this screenshot.
 * }
{< private > }
type
  PAsScreenshotMediaKind = ^TAsScreenshotMediaKind;
  TAsScreenshotMediaKind =  Longint;
  Const
    AS_SCREENSHOT_MEDIA_KIND_UNKNOWN = 0;
    AS_SCREENSHOT_MEDIA_KIND_IMAGE = 1;
    AS_SCREENSHOT_MEDIA_KIND_VIDEO = 2;
    AS_SCREENSHOT_MEDIA_KIND_LAST = 3;
;
(* Const before type ignored *)

function as_screenshot_kind_from_string(kind:Pgchar):TAsScreenshotKind;cdecl;external;
(* Const before type ignored *)
function as_screenshot_kind_to_string(kind:TAsScreenshotKind):Pgchar;cdecl;external;
function as_screenshot_is_valid(screenshot:PAsScreenshot):Tgboolean;cdecl;external;
function as_screenshot_new:PAsScreenshot;cdecl;external;
function as_screenshot_get_kind(screenshot:PAsScreenshot):TAsScreenshotKind;cdecl;external;
procedure as_screenshot_set_kind(screenshot:PAsScreenshot; kind:TAsScreenshotKind);cdecl;external;
(* Const before type ignored *)
function as_screenshot_get_environment(screenshot:PAsScreenshot):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure as_screenshot_set_environment(screenshot:PAsScreenshot; env_id:Pgchar);cdecl;external;
function as_screenshot_get_context(screenshot:PAsScreenshot):PAsContext;cdecl;external;
procedure as_screenshot_set_context(screenshot:PAsScreenshot; context:PAsContext);cdecl;external;
function as_screenshot_get_media_kind(screenshot:PAsScreenshot):TAsScreenshotMediaKind;cdecl;external;
(* Const before type ignored *)
function as_screenshot_get_caption(screenshot:PAsScreenshot):Pgchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure as_screenshot_set_caption(screenshot:PAsScreenshot; caption:Pgchar; locale:Pgchar);cdecl;external;
function as_screenshot_get_images_all(screenshot:PAsScreenshot):PGPtrArray;cdecl;external;
function as_screenshot_get_images(screenshot:PAsScreenshot):PGPtrArray;cdecl;external;
function as_screenshot_get_image(screenshot:PAsScreenshot; width:Tguint; height:Tguint; scale:Tguint):PAsImage;cdecl;external;
procedure as_screenshot_add_image(screenshot:PAsScreenshot; image:PAsImage);cdecl;external;
procedure as_screenshot_clear_images(screenshot:PAsScreenshot);cdecl;external;
function as_screenshot_get_videos_all(screenshot:PAsScreenshot):PGPtrArray;cdecl;external;
function as_screenshot_get_videos(screenshot:PAsScreenshot):PGPtrArray;cdecl;external;
procedure as_screenshot_add_video(screenshot:PAsScreenshot; video:PAsVideo);cdecl;external;
{$endif}
{ __AS_SCREENSHOT_H  }

implementation

{ was #define dname def_expr }
function AS_TYPE_SCREENSHOT : longint; { return type might be wrong }
  begin
    AS_TYPE_SCREENSHOT:=as_screenshot_get_type;
  end;


end.
