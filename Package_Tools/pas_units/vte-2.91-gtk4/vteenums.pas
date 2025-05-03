unit vteenums;

interface

uses
  fp_glib2, fp_GTK4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2001,2002,2003,2009,2010 Red Hat, Inc.
 *
 * This library is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published
 * by the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this library.  If not, see <https://www.gnu.org/licenses/>.
  }
(** unsupported pragma#pragma once*)
{$if !defined (__VTE_VTE_H_INSIDE__) && !defined (VTE_COMPILATION)}
{$error "Only <vte/vte.h> can be included directly."}
{$endif}
{$include <glib.h>}
{*
 * VteCursorBlinkMode:
 * @VTE_CURSOR_BLINK_SYSTEM: Follow GTK+ settings for cursor blinking.
 * @VTE_CURSOR_BLINK_ON: Cursor blinks.
 * @VTE_CURSOR_BLINK_OFF: Cursor does not blink.
 *
 * An enumerated type which can be used to indicate the cursor blink mode
 * for the terminal.
  }
type
  PVteCursorBlinkMode = ^TVteCursorBlinkMode;
  TVteCursorBlinkMode =  Longint;
  Const
    VTE_CURSOR_BLINK_SYSTEM = 0;
    VTE_CURSOR_BLINK_ON = 1;
    VTE_CURSOR_BLINK_OFF = 2;
;
{*
 * VteCursorShape:
 * @VTE_CURSOR_SHAPE_BLOCK: Draw a block cursor.  This is the default.
 * @VTE_CURSOR_SHAPE_IBEAM: Draw a vertical bar on the left side of character.
 * This is similar to the default cursor for other GTK+ widgets.
 * @VTE_CURSOR_SHAPE_UNDERLINE: Draw a horizontal bar below the character.
 *
 * An enumerated type which can be used to indicate what should the terminal
 * draw at the cursor position.
  }
type
  PVteCursorShape = ^TVteCursorShape;
  TVteCursorShape =  Longint;
  Const
    VTE_CURSOR_SHAPE_BLOCK = 0;
    VTE_CURSOR_SHAPE_IBEAM = 1;
    VTE_CURSOR_SHAPE_UNDERLINE = 2;
;
{*
 * VteTextBlinkMode:
 * @VTE_TEXT_BLINK_NEVER: Do not blink the text.
 * @VTE_TEXT_BLINK_FOCUSED: Allow blinking text only if the terminal is focused.
 * @VTE_TEXT_BLINK_UNFOCUSED: Allow blinking text only if the terminal is unfocused.
 * @VTE_TEXT_BLINK_ALWAYS: Allow blinking text. This is the default.
 *
 * An enumerated type which can be used to indicate whether the terminal allows
 * the text contents to be blinked.
 *
 * Since: 0.52
  }
type
  PVteTextBlinkMode = ^TVteTextBlinkMode;
  TVteTextBlinkMode =  Longint;
  Const
    VTE_TEXT_BLINK_NEVER = 0;
    VTE_TEXT_BLINK_FOCUSED = 1;
    VTE_TEXT_BLINK_UNFOCUSED = 2;
    VTE_TEXT_BLINK_ALWAYS = 3;
;
{*
 * VteEraseBinding:
 * @VTE_ERASE_AUTO: For backspace, attempt to determine the right value from the terminal's IO settings.  For delete, use the control sequence.
 * @VTE_ERASE_ASCII_BACKSPACE: Send an ASCII backspace character (0x08).
 * @VTE_ERASE_ASCII_DELETE: Send an ASCII delete character (0x7F).
 * @VTE_ERASE_DELETE_SEQUENCE: Send the "@@7" control sequence.
 * @VTE_ERASE_TTY: Send terminal's "erase" setting.
 *
 * An enumerated type which can be used to indicate which string the terminal
 * should send to an application when the user presses the Delete or Backspace
 * keys.
  }
type
  PVteEraseBinding = ^TVteEraseBinding;
  TVteEraseBinding =  Longint;
  Const
    VTE_ERASE_AUTO = 0;
    VTE_ERASE_ASCII_BACKSPACE = 1;
    VTE_ERASE_ASCII_DELETE = 2;
    VTE_ERASE_DELETE_SEQUENCE = 3;
    VTE_ERASE_TTY = 4;
;
{*
 * VtePtyError:
 * @VTE_PTY_ERROR_PTY_HELPER_FAILED: Obsolete. Deprecated: 0.42
 * @VTE_PTY_ERROR_PTY98_FAILED: failure when using PTY98 to allocate the PTY
  }
type
  PVtePtyError = ^TVtePtyError;
  TVtePtyError =  Longint;
  Const
    VTE_PTY_ERROR_PTY_HELPER_FAILED = 0;
    VTE_PTY_ERROR_PTY98_FAILED = 1;
;
{*
 * VtePtyFlags:
 * @VTE_PTY_NO_LASTLOG: Unused. Deprecated: 0.38
 * @VTE_PTY_NO_UTMP: Unused. Deprecated: 0.38
 * @VTE_PTY_NO_WTMP: Unused. Deprecated: 0.38
 * @VTE_PTY_NO_HELPER: Unused. Deprecated: 0.38
 * @VTE_PTY_NO_FALLBACK: Unused. Deprecated: 0.38
 * @VTE_PTY_NO_SESSION: Do not start a new session for the child in
 *   vte_pty_child_setup(). See man:setsid(2) for more information. Since: 0.58
 * @VTE_PTY_NO_CTTY: Do not set the PTY as the controlling TTY for the child
 *   in vte_pty_child_setup(). See man:tty_ioctl(4) for more information. Since: 0.58
 * @VTE_PTY_DEFAULT: the default flags
  }
type
  PVtePtyFlags = ^TVtePtyFlags;
  TVtePtyFlags =  Longint;
  Const
    VTE_PTY_NO_LASTLOG = 1 shl 0;
    VTE_PTY_NO_UTMP = 1 shl 1;
    VTE_PTY_NO_WTMP = 1 shl 2;
    VTE_PTY_NO_HELPER = 1 shl 3;
    VTE_PTY_NO_FALLBACK = 1 shl 4;
    VTE_PTY_NO_SESSION = 1 shl 5;
    VTE_PTY_NO_CTTY = 1 shl 6;
    VTE_PTY_DEFAULT = 0;
;
{*
 * VteWriteFlags:
 * @VTE_WRITE_DEFAULT: Write contents as UTF-8 text.  This is the default.
 *
 * A flag type to determine how terminal contents should be written
 * to an output stream.
  }
type
  PVteWriteFlags = ^TVteWriteFlags;
  TVteWriteFlags =  Longint;
  Const
    VTE_WRITE_DEFAULT = 0;
;
{*
 * VteRegexError:
 * @VTE_REGEX_ERROR_INCOMPATIBLE: The PCRE2 library was built without
 *   Unicode support which is required for VTE
 * @VTE_REGEX_ERROR_NOT_SUPPORTED: Regexes are not supported because VTE was
 *   built without PCRE2 support
 *
 * An enum type for regex errors. In addition to the values listed above,
 * any PCRE2 error values may occur.
 *
 * Since: 0.46
  }
{ Negative values are PCRE2 errors  }
{ VTE specific values  }
type
  PVteRegexError = ^TVteRegexError;
  TVteRegexError =  Longint;
  Const
    VTE_REGEX_ERROR_INCOMPATIBLE = G_MAXINT-1;
    VTE_REGEX_ERROR_NOT_SUPPORTED = G_MAXINT;
;
{*
 * VteFormat:
 * @VTE_FORMAT_TEXT: Export as plain text
 * @VTE_FORMAT_HTML: Export as HTML formatted text
 *
 * An enumeration type that can be used to specify the format the selection
 * should be copied to the clipboard in.
 *
 * Since: 0.50
  }
type
  PVteFormat = ^TVteFormat;
  TVteFormat =  Longint;
  Const
    VTE_FORMAT_TEXT = 1;
    VTE_FORMAT_HTML = 2;
;
{*
 * VteFeatureFlags:
 * @VTE_FEATURE_FLAG_BIDI: whether VTE was built with bidirectional text support
 * @VTE_FEATURE_FLAG_ICU: whether VTE was built with ICU support
 * @VTE_FEATURE_FLAG_SYSTEMD: whether VTE was built with systemd support
 * @VTE_FEATURE_FLAG_SIXEL: whether VTE was built with SIXEL support
 * @VTE_FEATURE_FLAGS_MASK: mask of all feature flags
 *
 * An enumeration type for features.
 *
 * Since: 0.62
  }
{< skip > }{ force enum to 64 bit  }
type
  PVteFeatureFlags = ^TVteFeatureFlags;
  TVteFeatureFlags =  Longint;
  Const
    VTE_FEATURE_FLAG_BIDI = 1 shl 0;
    VTE_FEATURE_FLAG_ICU = 1 shl 1;
    VTE_FEATURE_FLAG_SYSTEMD = 1 shl 2;
    VTE_FEATURE_FLAG_SIXEL = 1 shl 3;
    VTE_FEATURE_FLAGS_MASK = $FFFFFFFFFFFFFFFF;
;
{*
 * VteAlign:
 * @VTE_ALIGN_START: align to left/top
 * @VTE_ALIGN_CENTER: align to centre
 * @VTE_ALIGN_END: align to right/bottom
 *
 * An enumeration type that can be used to specify how the terminal
 * uses extra allocated space.
 *
 * Since: 0.76
  }
type
  PVteAlign = ^TVteAlign;
  TVteAlign =  Longint;
  Const
    VTE_ALIGN_START = 0;
    VTE_ALIGN_CENTER = 1;
    VTE_ALIGN_END = 2;
;

// === Konventiert am: 3-5-25 17:03:59 ===


implementation



end.
