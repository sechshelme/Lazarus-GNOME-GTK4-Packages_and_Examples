unit vteenums;

interface

uses
  fp_glib2, fp_GTK4;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  PVteCursorBlinkMode = ^TVteCursorBlinkMode;
  TVteCursorBlinkMode = longint;

const
  VTE_CURSOR_BLINK_SYSTEM = 0;
  VTE_CURSOR_BLINK_ON = 1;
  VTE_CURSOR_BLINK_OFF = 2;

type
  PVteCursorShape = ^TVteCursorShape;
  TVteCursorShape = longint;

const
  VTE_CURSOR_SHAPE_BLOCK = 0;
  VTE_CURSOR_SHAPE_IBEAM = 1;
  VTE_CURSOR_SHAPE_UNDERLINE = 2;

type
  PVteTextBlinkMode = ^TVteTextBlinkMode;
  TVteTextBlinkMode = longint;

const
  VTE_TEXT_BLINK_NEVER = 0;
  VTE_TEXT_BLINK_FOCUSED = 1;
  VTE_TEXT_BLINK_UNFOCUSED = 2;
  VTE_TEXT_BLINK_ALWAYS = 3;

type
  PVteEraseBinding = ^TVteEraseBinding;
  TVteEraseBinding = longint;

const
  VTE_ERASE_AUTO = 0;
  VTE_ERASE_ASCII_BACKSPACE = 1;
  VTE_ERASE_ASCII_DELETE = 2;
  VTE_ERASE_DELETE_SEQUENCE = 3;
  VTE_ERASE_TTY = 4;

type
  PVtePtyError = ^TVtePtyError;
  TVtePtyError = longint;

const
  VTE_PTY_ERROR_PTY_HELPER_FAILED = 0;
  VTE_PTY_ERROR_PTY98_FAILED = 1;

type
  PVtePtyFlags = ^TVtePtyFlags;
  TVtePtyFlags = longint;

const
  VTE_PTY_NO_LASTLOG = 1 shl 0;
  VTE_PTY_NO_UTMP = 1 shl 1;
  VTE_PTY_NO_WTMP = 1 shl 2;
  VTE_PTY_NO_HELPER = 1 shl 3;
  VTE_PTY_NO_FALLBACK = 1 shl 4;
  VTE_PTY_NO_SESSION = 1 shl 5;
  VTE_PTY_NO_CTTY = 1 shl 6;
  VTE_PTY_DEFAULT = 0;

type
  PVteWriteFlags = ^TVteWriteFlags;
  TVteWriteFlags = longint;

const
  VTE_WRITE_DEFAULT = 0;

type
  PVteRegexError = ^TVteRegexError;
  TVteRegexError = longint;

const
  VTE_REGEX_ERROR_INCOMPATIBLE = G_MAXINT - 1;
  VTE_REGEX_ERROR_NOT_SUPPORTED = G_MAXINT;

type
  PVteFormat = ^TVteFormat;
  TVteFormat = longint;

const
  VTE_FORMAT_TEXT = 1;
  VTE_FORMAT_HTML = 2;

type
  PVteFeatureFlags = ^TVteFeatureFlags;
  TVteFeatureFlags = longint;

const
  VTE_FEATURE_FLAG_BIDI = 1 shl 0;
  VTE_FEATURE_FLAG_ICU = 1 shl 1;
  VTE_FEATURE_FLAG_SYSTEMD = 1 shl 2;
  VTE_FEATURE_FLAG_SIXEL = 1 shl 3;
  VTE_FEATURE_FLAGS_MASK = $FFFFFFFFFFFFFFFF;

type
  PVteAlign = ^TVteAlign;
  TVteAlign = longint;

const
  VTE_ALIGN_START = 0;
  VTE_ALIGN_CENTER = 1;
  VTE_ALIGN_END = 2;


  // === Konventiert am: 3-5-25 17:03:59 ===


implementation



end.
