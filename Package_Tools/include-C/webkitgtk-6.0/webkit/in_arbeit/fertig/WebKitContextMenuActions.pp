
unit WebKitContextMenuActions;
interface

{
  Automatically converted by H2Pas 1.0.0 from WebKitContextMenuActions.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    WebKitContextMenuActions.h
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
PWebKitContextMenuAction  = ^WebKitContextMenuAction;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2012 Igalia S.L.
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Library General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Library General Public License for more details.
 *
 * You should have received a copy of the GNU Library General Public License
 * along with this library; see the file COPYING.LIB.  If not, write to
 * the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
 * Boston, MA 02110-1301, USA.
  }
{$if !defined(__WEBKIT_H_INSIDE__) && !defined(__WEBKIT_WEB_PROCESS_EXTENSION_H_INSIDE__) && !defined(BUILDING_WEBKIT)}
{$error "Only <webkit/webkit.h> can be included directly."}
{$endif}
{$include <glib.h>}
{$ifndef WebKitContextMenuActions_h}
{$define WebKitContextMenuActions_h}
{*
 * WebKitContextMenuAction:
 * @WEBKIT_CONTEXT_MENU_ACTION_NO_ACTION: No action, used by separator menu items.
 * @WEBKIT_CONTEXT_MENU_ACTION_OPEN_LINK: Open current link.
 * @WEBKIT_CONTEXT_MENU_ACTION_OPEN_LINK_IN_NEW_WINDOW: Open current link in a new window.
 * @WEBKIT_CONTEXT_MENU_ACTION_DOWNLOAD_LINK_TO_DISK: Download link destination.
 * @WEBKIT_CONTEXT_MENU_ACTION_COPY_LINK_TO_CLIPBOARD: Copy link location to the clipboard.
 * @WEBKIT_CONTEXT_MENU_ACTION_OPEN_IMAGE_IN_NEW_WINDOW: Open current image in a new window.
 * @WEBKIT_CONTEXT_MENU_ACTION_DOWNLOAD_IMAGE_TO_DISK: Download current image.
 * @WEBKIT_CONTEXT_MENU_ACTION_COPY_IMAGE_TO_CLIPBOARD: Copy current image to the clipboard.
 * @WEBKIT_CONTEXT_MENU_ACTION_COPY_IMAGE_URL_TO_CLIPBOARD: Copy current image location to the clipboard.
 * @WEBKIT_CONTEXT_MENU_ACTION_OPEN_FRAME_IN_NEW_WINDOW: Open current frame in a new window.
 * @WEBKIT_CONTEXT_MENU_ACTION_GO_BACK: Load the previous history item.
 * @WEBKIT_CONTEXT_MENU_ACTION_GO_FORWARD: Load the next history item.
 * @WEBKIT_CONTEXT_MENU_ACTION_STOP: Stop any ongoing loading operation.
 * @WEBKIT_CONTEXT_MENU_ACTION_RELOAD: Reload the contents of current view.
 * @WEBKIT_CONTEXT_MENU_ACTION_COPY: Copy current selection the clipboard.
 * @WEBKIT_CONTEXT_MENU_ACTION_CUT: Cut current selection to the clipboard.
 * @WEBKIT_CONTEXT_MENU_ACTION_PASTE: Paste clipboard contents.
 * @WEBKIT_CONTEXT_MENU_ACTION_DELETE: Delete current selection.
 * @WEBKIT_CONTEXT_MENU_ACTION_SELECT_ALL: Select all text.
 * @WEBKIT_CONTEXT_MENU_ACTION_INPUT_METHODS: Input methods menu.
 * @WEBKIT_CONTEXT_MENU_ACTION_UNICODE: Unicode menu.
 * @WEBKIT_CONTEXT_MENU_ACTION_SPELLING_GUESS: A proposed replacement for a misspelled word.
 * @WEBKIT_CONTEXT_MENU_ACTION_NO_GUESSES_FOUND: An indicator that spellchecking found no proposed replacements.
 * @WEBKIT_CONTEXT_MENU_ACTION_IGNORE_SPELLING: Causes the spellchecker to ignore the word for this session.
 * @WEBKIT_CONTEXT_MENU_ACTION_LEARN_SPELLING: Causes the spellchecker to add the word to the dictionary.
 * @WEBKIT_CONTEXT_MENU_ACTION_IGNORE_GRAMMAR: Ignore grammar.
 * @WEBKIT_CONTEXT_MENU_ACTION_FONT_MENU: Font options menu.
 * @WEBKIT_CONTEXT_MENU_ACTION_BOLD: Bold.
 * @WEBKIT_CONTEXT_MENU_ACTION_ITALIC: Italic.
 * @WEBKIT_CONTEXT_MENU_ACTION_UNDERLINE: Underline.
 * @WEBKIT_CONTEXT_MENU_ACTION_OUTLINE: Outline.
 * @WEBKIT_CONTEXT_MENU_ACTION_INSPECT_ELEMENT: Open current element in the inspector.
 * @WEBKIT_CONTEXT_MENU_ACTION_OPEN_VIDEO_IN_NEW_WINDOW: Open current video element in a new window.
 * @WEBKIT_CONTEXT_MENU_ACTION_OPEN_AUDIO_IN_NEW_WINDOW: Open current audio element in a new window.
 * @WEBKIT_CONTEXT_MENU_ACTION_COPY_VIDEO_LINK_TO_CLIPBOARD: Copy video link location in to the clipboard.
 * @WEBKIT_CONTEXT_MENU_ACTION_COPY_AUDIO_LINK_TO_CLIPBOARD: Copy audio link location in to the clipboard.
 * @WEBKIT_CONTEXT_MENU_ACTION_TOGGLE_MEDIA_CONTROLS: Enable or disable media controls.
 * @WEBKIT_CONTEXT_MENU_ACTION_TOGGLE_MEDIA_LOOP: Enable or disable media loop.
 * @WEBKIT_CONTEXT_MENU_ACTION_ENTER_VIDEO_FULLSCREEN: Show current video element in fullscreen mode.
 * @WEBKIT_CONTEXT_MENU_ACTION_MEDIA_PLAY: Play current media element.
 * @WEBKIT_CONTEXT_MENU_ACTION_MEDIA_PAUSE: Pause current media element.
 * @WEBKIT_CONTEXT_MENU_ACTION_MEDIA_MUTE: Mute current media element.
 * @WEBKIT_CONTEXT_MENU_ACTION_DOWNLOAD_VIDEO_TO_DISK: Download video to disk. Since 2.2
 * @WEBKIT_CONTEXT_MENU_ACTION_DOWNLOAD_AUDIO_TO_DISK: Download audio to disk. Since 2.2
 * @WEBKIT_CONTEXT_MENU_ACTION_INSERT_EMOJI: Insert an emoji. Since 2.26
 * @WEBKIT_CONTEXT_MENU_ACTION_PASTE_AS_PLAIN_TEXT: Paste clipboard contents as plain text. Since 2.30
 * @WEBKIT_CONTEXT_MENU_ACTION_CUSTOM: Custom action defined by applications.
 *
 * Enum values used to denote the stock actions for
 * #WebKitContextMenuItem<!-- -->s
  }
type
  PWebKitContextMenuAction = ^TWebKitContextMenuAction;
  TWebKitContextMenuAction =  Longint;
  Const
    WEBKIT_CONTEXT_MENU_ACTION_NO_ACTION = 0;
    WEBKIT_CONTEXT_MENU_ACTION_OPEN_LINK = 1;
    WEBKIT_CONTEXT_MENU_ACTION_OPEN_LINK_IN_NEW_WINDOW = 2;
    WEBKIT_CONTEXT_MENU_ACTION_DOWNLOAD_LINK_TO_DISK = 3;
    WEBKIT_CONTEXT_MENU_ACTION_COPY_LINK_TO_CLIPBOARD = 4;
    WEBKIT_CONTEXT_MENU_ACTION_OPEN_IMAGE_IN_NEW_WINDOW = 5;
    WEBKIT_CONTEXT_MENU_ACTION_DOWNLOAD_IMAGE_TO_DISK = 6;
    WEBKIT_CONTEXT_MENU_ACTION_COPY_IMAGE_TO_CLIPBOARD = 7;
    WEBKIT_CONTEXT_MENU_ACTION_COPY_IMAGE_URL_TO_CLIPBOARD = 8;
    WEBKIT_CONTEXT_MENU_ACTION_OPEN_FRAME_IN_NEW_WINDOW = 9;
    WEBKIT_CONTEXT_MENU_ACTION_GO_BACK = 10;
    WEBKIT_CONTEXT_MENU_ACTION_GO_FORWARD = 11;
    WEBKIT_CONTEXT_MENU_ACTION_STOP = 12;
    WEBKIT_CONTEXT_MENU_ACTION_RELOAD = 13;
    WEBKIT_CONTEXT_MENU_ACTION_COPY = 14;
    WEBKIT_CONTEXT_MENU_ACTION_CUT = 15;
    WEBKIT_CONTEXT_MENU_ACTION_PASTE = 16;
    WEBKIT_CONTEXT_MENU_ACTION_DELETE = 17;
    WEBKIT_CONTEXT_MENU_ACTION_SELECT_ALL = 18;
    WEBKIT_CONTEXT_MENU_ACTION_INPUT_METHODS = 19;
    WEBKIT_CONTEXT_MENU_ACTION_UNICODE = 20;
    WEBKIT_CONTEXT_MENU_ACTION_SPELLING_GUESS = 21;
    WEBKIT_CONTEXT_MENU_ACTION_NO_GUESSES_FOUND = 22;
    WEBKIT_CONTEXT_MENU_ACTION_IGNORE_SPELLING = 23;
    WEBKIT_CONTEXT_MENU_ACTION_LEARN_SPELLING = 24;
    WEBKIT_CONTEXT_MENU_ACTION_IGNORE_GRAMMAR = 25;
    WEBKIT_CONTEXT_MENU_ACTION_FONT_MENU = 26;
    WEBKIT_CONTEXT_MENU_ACTION_BOLD = 27;
    WEBKIT_CONTEXT_MENU_ACTION_ITALIC = 28;
    WEBKIT_CONTEXT_MENU_ACTION_UNDERLINE = 29;
    WEBKIT_CONTEXT_MENU_ACTION_OUTLINE = 30;
    WEBKIT_CONTEXT_MENU_ACTION_INSPECT_ELEMENT = 31;
    WEBKIT_CONTEXT_MENU_ACTION_OPEN_VIDEO_IN_NEW_WINDOW = 32;
    WEBKIT_CONTEXT_MENU_ACTION_OPEN_AUDIO_IN_NEW_WINDOW = 33;
    WEBKIT_CONTEXT_MENU_ACTION_COPY_VIDEO_LINK_TO_CLIPBOARD = 34;
    WEBKIT_CONTEXT_MENU_ACTION_COPY_AUDIO_LINK_TO_CLIPBOARD = 35;
    WEBKIT_CONTEXT_MENU_ACTION_TOGGLE_MEDIA_CONTROLS = 36;
    WEBKIT_CONTEXT_MENU_ACTION_TOGGLE_MEDIA_LOOP = 37;
    WEBKIT_CONTEXT_MENU_ACTION_ENTER_VIDEO_FULLSCREEN = 38;
    WEBKIT_CONTEXT_MENU_ACTION_MEDIA_PLAY = 39;
    WEBKIT_CONTEXT_MENU_ACTION_MEDIA_PAUSE = 40;
    WEBKIT_CONTEXT_MENU_ACTION_MEDIA_MUTE = 41;
    WEBKIT_CONTEXT_MENU_ACTION_DOWNLOAD_VIDEO_TO_DISK = 42;
    WEBKIT_CONTEXT_MENU_ACTION_DOWNLOAD_AUDIO_TO_DISK = 43;
    WEBKIT_CONTEXT_MENU_ACTION_INSERT_EMOJI = 44;
    WEBKIT_CONTEXT_MENU_ACTION_PASTE_AS_PLAIN_TEXT = 45;
    WEBKIT_CONTEXT_MENU_ACTION_CUSTOM = 10000;
;
{$endif}

implementation


end.
