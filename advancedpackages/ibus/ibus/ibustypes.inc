{$IFDEF read_interface}


type
  PIBusModifierType = ^TIBusModifierType;
  TIBusModifierType = longint;

const
  IBUS_SHIFT_MASK = 1 shl 0;
  IBUS_LOCK_MASK = 1 shl 1;
  IBUS_CONTROL_MASK = 1 shl 2;
  IBUS_MOD1_MASK = 1 shl 3;
  IBUS_MOD2_MASK = 1 shl 4;
  IBUS_MOD3_MASK = 1 shl 5;
  IBUS_MOD4_MASK = 1 shl 6;
  IBUS_MOD5_MASK = 1 shl 7;
  IBUS_BUTTON1_MASK = 1 shl 8;
  IBUS_BUTTON2_MASK = 1 shl 9;
  IBUS_BUTTON3_MASK = 1 shl 10;
  IBUS_BUTTON4_MASK = 1 shl 11;
  IBUS_BUTTON5_MASK = 1 shl 12;
  IBUS_HANDLED_MASK = 1 shl 24;
  IBUS_FORWARD_MASK = 1 shl 25;
  IBUS_IGNORED_MASK = IBUS_FORWARD_MASK;
  IBUS_SUPER_MASK = 1 shl 26;
  IBUS_HYPER_MASK = 1 shl 27;
  IBUS_META_MASK = 1 shl 28;
  IBUS_RELEASE_MASK = 1 shl 30;
  IBUS_MODIFIER_MASK = $5f001fff;

type
  PIBusCapabilite = ^TIBusCapabilite;
  TIBusCapabilite = longint;

const
  IBUS_CAP_PREEDIT_TEXT = 1 shl 0;
  IBUS_CAP_AUXILIARY_TEXT = 1 shl 1;
  IBUS_CAP_LOOKUP_TABLE = 1 shl 2;
  IBUS_CAP_FOCUS = 1 shl 3;
  IBUS_CAP_PROPERTY = 1 shl 4;
  IBUS_CAP_SURROUNDING_TEXT = 1 shl 5;
  IBUS_CAP_OSK = 1 shl 6;
  IBUS_CAP_SYNC_PROCESS_KEY = 1 shl 7;
  IBUS_CAP_SYNC_PROCESS_KEY_V2 = IBUS_CAP_SYNC_PROCESS_KEY;

type
  PIBusPreeditFocusMode = ^TIBusPreeditFocusMode;
  TIBusPreeditFocusMode = longint;

const
  IBUS_ENGINE_PREEDIT_CLEAR = 0;
  IBUS_ENGINE_PREEDIT_COMMIT = 1;

type
  PIBusOrientation = ^TIBusOrientation;
  TIBusOrientation = longint;

const
  IBUS_ORIENTATION_HORIZONTAL = 0;
  IBUS_ORIENTATION_VERTICAL = 1;
  IBUS_ORIENTATION_SYSTEM = 2;

type
  PIBusBusNameFlag = ^TIBusBusNameFlag;
  TIBusBusNameFlag = longint;

const
  IBUS_BUS_NAME_FLAG_ALLOW_REPLACEMENT = 1 shl 0;
  IBUS_BUS_NAME_FLAG_REPLACE_EXISTING = 1 shl 1;
  IBUS_BUS_NAME_FLAG_DO_NOT_QUEUE = 1 shl 2;

type
  PIBusBusRequestNameReply = ^TIBusBusRequestNameReply;
  TIBusBusRequestNameReply = longint;

const
  IBUS_BUS_REQUEST_NAME_REPLY_PRIMARY_OWNER = 1;
  IBUS_BUS_REQUEST_NAME_REPLY_IN_QUEUE = 2;
  IBUS_BUS_REQUEST_NAME_REPLY_EXISTS = 3;
  IBUS_BUS_REQUEST_NAME_REPLY_ALREADY_OWNER = 4;

type
  PIBusBusStartServiceByNameReply = ^TIBusBusStartServiceByNameReply;
  TIBusBusStartServiceByNameReply = longint;

const
  IBUS_BUS_START_REPLY_SUCCESS = 1;
  IBUS_BUS_START_REPLY_ALREADY_RUNNING = 2;

type
  PIBusError = ^TIBusError;
  TIBusError = longint;

const
  IBUS_ERROR_NO_ENGINE = 0;
  IBUS_ERROR_NO_CONFIG = 1;
  IBUS_ERROR_FAILED = 2;

type
  TIBusRectangle = record
    x: Tgint;
    y: Tgint;
    width: Tgint;
    height: Tgint;
  end;
  PIBusRectangle = ^TIBusRectangle;

  TIBusFreeFunc = procedure(obj: Tgpointer); cdecl;

  PIBusInputPurpose = ^TIBusInputPurpose;
  TIBusInputPurpose = longint;

const
  IBUS_INPUT_PURPOSE_FREE_FORM = 0;
  IBUS_INPUT_PURPOSE_ALPHA = 1;
  IBUS_INPUT_PURPOSE_DIGITS = 2;
  IBUS_INPUT_PURPOSE_NUMBER = 3;
  IBUS_INPUT_PURPOSE_PHONE = 4;
  IBUS_INPUT_PURPOSE_URL = 5;
  IBUS_INPUT_PURPOSE_EMAIL = 6;
  IBUS_INPUT_PURPOSE_NAME = 7;
  IBUS_INPUT_PURPOSE_PASSWORD = 8;
  IBUS_INPUT_PURPOSE_PIN = 9;
  IBUS_INPUT_PURPOSE_TERMINAL = 10;

type
  PIBusInputHints = ^TIBusInputHints;
  TIBusInputHints = longint;

const
  IBUS_INPUT_HINT_NONE = 0;
  IBUS_INPUT_HINT_SPELLCHECK = 1 shl 0;
  IBUS_INPUT_HINT_NO_SPELLCHECK = 1 shl 1;
  IBUS_INPUT_HINT_WORD_COMPLETION = 1 shl 2;
  IBUS_INPUT_HINT_LOWERCASE = 1 shl 3;
  IBUS_INPUT_HINT_UPPERCASE_CHARS = 1 shl 4;
  IBUS_INPUT_HINT_UPPERCASE_WORDS = 1 shl 5;
  IBUS_INPUT_HINT_UPPERCASE_SENTENCES = 1 shl 6;
  IBUS_INPUT_HINT_INHIBIT_OSK = 1 shl 7;
  IBUS_INPUT_HINT_VERTICAL_WRITING = 1 shl 8;
  IBUS_INPUT_HINT_EMOJI = 1 shl 9;
  IBUS_INPUT_HINT_NO_EMOJI = 1 shl 10;
  IBUS_INPUT_HINT_PRIVATE = 1 shl 11;

  // === Konventiert am: 25-7-25 19:43:01 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
