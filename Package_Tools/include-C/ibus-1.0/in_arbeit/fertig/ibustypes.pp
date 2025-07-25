
unit ibustypes;
interface

{
  Automatically converted by H2Pas 1.0.0 from ibustypes.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    ibustypes.h
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
PIBusBusNameFlag  = ^IBusBusNameFlag;
PIBusBusRequestNameReply  = ^IBusBusRequestNameReply;
PIBusBusStartServiceByNameReply  = ^IBusBusStartServiceByNameReply;
PIBusCapabilite  = ^IBusCapabilite;
PIBusError  = ^IBusError;
PIBusInputHints  = ^IBusInputHints;
PIBusInputPurpose  = ^IBusInputPurpose;
PIBusModifierType  = ^IBusModifierType;
PIBusOrientation  = ^IBusOrientation;
PIBusPreeditFocusMode  = ^IBusPreeditFocusMode;
PIBusRectangle  = ^IBusRectangle;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- mode: C; c-basic-offset: 4; indent-tabs-mode: nil; -*-  }
{ vim:set et sts=4:  }
{ ibus - The Input Bus
 * Copyright (C) 2008-2013 Peng Huang <shawn.p.huang@gmail.com>
 * Copyright (C) 2010-2022 Takao Fujiwara <takao.fujiwara1@gmail.com>
 * Copyright (C) 2008-2022 Red Hat, Inc.
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301
 * USA
  }
{$if !defined (__IBUS_H_INSIDE__) && !defined (IBUS_COMPILATION)}
{$error "Only <ibus.h> can be included directly"}
{$endif}
{$ifndef __IBUS_TYPES_H_}
{$define __IBUS_TYPES_H_}
{*
 * SECTION: ibustypes
 * @short_description: Generic types for  IBus.
 * @stability: Stable
 *
 * This section consists generic types for IBus, including shift/control key
 * modifiers,
 * and a rectangle structure.
  }
{*
 * IBusModifierType:
 * @IBUS_SHIFT_MASK: Shift  is activated.
 * @IBUS_LOCK_MASK: Cap Lock is locked.
 * @IBUS_CONTROL_MASK: Control key is activated.
 * @IBUS_MOD1_MASK: Modifier 1 (Usually Alt_L (0x40),  Alt_R (0x6c),  Meta_L (0xcd)) activated.
 * @IBUS_MOD2_MASK: Modifier 2 (Usually Num_Lock (0x4d)) activated.
 * @IBUS_MOD3_MASK: Modifier 3 activated.
 * @IBUS_MOD4_MASK: Modifier 4 (Usually Super_L (0xce),  Hyper_L (0xcf)) activated.
 * @IBUS_MOD5_MASK: Modifier 5 (ISO_Level3_Shift (0x5c),  Mode_switch (0xcb)) activated.
 * @IBUS_BUTTON1_MASK: Mouse button 1 (left) is activated.
 * @IBUS_BUTTON2_MASK: Mouse button 2 (middle) is activated.
 * @IBUS_BUTTON3_MASK: Mouse button 3 (right) is activated.
 * @IBUS_BUTTON4_MASK: Mouse button 4 (scroll up) is activated.
 * @IBUS_BUTTON5_MASK: Mouse button 5 (scroll down) is activated.
 * @IBUS_HANDLED_MASK: Handled mask indicates the event has been handled by ibus.
 * @IBUS_FORWARD_MASK: Forward mask indicates the event has been forward from ibus.
 * @IBUS_IGNORED_MASK: It is an alias of IBUS_FORWARD_MASK.
 * @IBUS_SUPER_MASK: Super (Usually Win) key is activated.
 * @IBUS_HYPER_MASK: Hyper key is activated.
 * @IBUS_META_MASK: Meta key is activated.
 * @IBUS_RELEASE_MASK: Key is released.
 * @IBUS_MODIFIER_MASK: Modifier mask for the all the masks above.
 *
 * Handles key modifier such as control, shift and alt and release event.
 * Note that nits 15 - 25 are currently unused, while bit 29 is used internally.
  }
{ The next few modifiers are used by XKB, so we skip to the end.
     * Bits 15 - 23 are currently unused. Bit 29 is used internally.
      }
{ ibus mask  }
type
  PIBusModifierType = ^TIBusModifierType;
  TIBusModifierType =  Longint;
  Const
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
;
{*
 * IBusCapabilite:
 * @IBUS_CAP_PREEDIT_TEXT: UI is capable to show pre-edit text.
 * @IBUS_CAP_AUXILIARY_TEXT: UI is capable to show auxiliary text.
 * @IBUS_CAP_LOOKUP_TABLE: UI is capable to show the lookup table.
 * @IBUS_CAP_FOCUS: UI is capable to get focus.
 * @IBUS_CAP_PROPERTY: UI is capable to have property.
 * @IBUS_CAP_SURROUNDING_TEXT: Client can provide surround text,
 *  or IME can handle surround text.
 * @IBUS_CAP_OSK: UI is owned by on-screen keyboard.
 * @IBUS_CAP_SYNC_PROCESS_KEY: Asynchronous process key events are not
 *  supported and the ibus_engine_forward_key_event() should not be
 *  used for the return value of #IBusEngine::process_key_event().
 *
 * Capability flags of UI.
  }
type
  PIBusCapabilite = ^TIBusCapabilite;
  TIBusCapabilite =  Longint;
  Const
    IBUS_CAP_PREEDIT_TEXT = 1 shl 0;
    IBUS_CAP_AUXILIARY_TEXT = 1 shl 1;
    IBUS_CAP_LOOKUP_TABLE = 1 shl 2;
    IBUS_CAP_FOCUS = 1 shl 3;
    IBUS_CAP_PROPERTY = 1 shl 4;
    IBUS_CAP_SURROUNDING_TEXT = 1 shl 5;
    IBUS_CAP_OSK = 1 shl 6;
    IBUS_CAP_SYNC_PROCESS_KEY = 1 shl 7;
    IBUS_CAP_SYNC_PROCESS_KEY_V2 = IBUS_CAP_SYNC_PROCESS_KEY;
;
{*
 * IBusPreeditFocusMode:
 * @IBUS_ENGINE_PREEDIT_CLEAR: pre-edit text is cleared.
 * @IBUS_ENGINE_PREEDIT_COMMIT: pre-edit text is committed.
 *
 * Pre-edit commit mode when the focus is lost.
  }
type
  PIBusPreeditFocusMode = ^TIBusPreeditFocusMode;
  TIBusPreeditFocusMode =  Longint;
  Const
    IBUS_ENGINE_PREEDIT_CLEAR = 0;
    IBUS_ENGINE_PREEDIT_COMMIT = 1;
;
{*
 * IBusOrientation:
 * @IBUS_ORIENTATION_HORIZONTAL: Horizontal orientation.
 * @IBUS_ORIENTATION_VERTICAL: Vertival orientation.
 * @IBUS_ORIENTATION_SYSTEM: Use ibus global orientation setup.
 *
 * Orientation of UI.
  }
type
  PIBusOrientation = ^TIBusOrientation;
  TIBusOrientation =  Longint;
  Const
    IBUS_ORIENTATION_HORIZONTAL = 0;
    IBUS_ORIENTATION_VERTICAL = 1;
    IBUS_ORIENTATION_SYSTEM = 2;
;
{*
 * IBusBusNameFlag:
 * @IBUS_BUS_NAME_FLAG_ALLOW_REPLACEMENT:
 *    same as DBUS_NAME_FLAG_ALLOW_REPLACEMENT	
 * @IBUS_BUS_NAME_FLAG_REPLACE_EXISTING:
 *    same as DBUS_NAME_FLAG_REPLACE_EXISTING
 * @IBUS_BUS_NAME_FLAG_DO_NOT_QUEUE:
 *    same as DBUS_NAME_FLAG_DO_NOT_QUEUE 
  }
type
  PIBusBusNameFlag = ^TIBusBusNameFlag;
  TIBusBusNameFlag =  Longint;
  Const
    IBUS_BUS_NAME_FLAG_ALLOW_REPLACEMENT = 1 shl 0;
    IBUS_BUS_NAME_FLAG_REPLACE_EXISTING = 1 shl 1;
    IBUS_BUS_NAME_FLAG_DO_NOT_QUEUE = 1 shl 2;
;
{*
 * IBusBusRequestNameReply:
 * @IBUS_BUS_REQUEST_NAME_REPLY_PRIMARY_OWNER:
 *    same as DBUS_REQUEST_NAME_REPLY_PRIMARY_OWNER
 * @IBUS_BUS_REQUEST_NAME_REPLY_IN_QUEUE:
 *    same as DBUS_REQUEST_NAME_REPLY_IN_QUEUE
 * @IBUS_BUS_REQUEST_NAME_REPLY_EXISTS:
 *    same as DBUS_REQUEST_NAME_REPLY_EXISTS
 * @IBUS_BUS_REQUEST_NAME_REPLY_ALREADY_OWNER:
 *    same as DBUS_REQUEST_NAME_REPLY_ALREADY_OWNER
  }
type
  PIBusBusRequestNameReply = ^TIBusBusRequestNameReply;
  TIBusBusRequestNameReply =  Longint;
  Const
    IBUS_BUS_REQUEST_NAME_REPLY_PRIMARY_OWNER = 1;
    IBUS_BUS_REQUEST_NAME_REPLY_IN_QUEUE = 2;
    IBUS_BUS_REQUEST_NAME_REPLY_EXISTS = 3;
    IBUS_BUS_REQUEST_NAME_REPLY_ALREADY_OWNER = 4;
;
{*
 * IBusBusStartServiceByNameReply:
 * @IBUS_BUS_START_REPLY_SUCCESS:
 *    same as DBUS_START_REPLY_SUCCESS
 * @IBUS_BUS_START_REPLY_ALREADY_RUNNING:
 *    same as DBUS_START_REPLY_ALREADY_RUNNING
  }
type
  PIBusBusStartServiceByNameReply = ^TIBusBusStartServiceByNameReply;
  TIBusBusStartServiceByNameReply =  Longint;
  Const
    IBUS_BUS_START_REPLY_SUCCESS = 1;
    IBUS_BUS_START_REPLY_ALREADY_RUNNING = 2;
;
{*
 * IBusError:
 * @IBUS_ERROR_NO_ENGINE:
 * There is no engine associated with input context.
 * @IBUS_ERROR_NO_CONFIG:
 * There is no config module running.
 * @IBUS_ERROR_FAILED:
 * General failure.
  }
type
  PIBusError = ^TIBusError;
  TIBusError =  Longint;
  Const
    IBUS_ERROR_NO_ENGINE = 0;
    IBUS_ERROR_NO_CONFIG = 1;
    IBUS_ERROR_FAILED = 2;
;
{*
 * IBusRectangle:
 * @x: x coordinate.
 * @y: y coordinate.
 * @width: width of the rectangle.
 * @height: height of the renctangl.
 *
 * Rectangle definition.
  }
type
  PIBusRectangle = ^TIBusRectangle;
  TIBusRectangle = record
      x : Tgint;
      y : Tgint;
      width : Tgint;
      height : Tgint;
    end;

{*
 * IBusFreeFunc:
 * @object: object to be freed.
 *
 * Free function prototype.
  }

  TIBusFreeFunc = procedure (object:Tgpointer);cdecl;
{*
 * IBusInputPurpose:
 * @IBUS_INPUT_PURPOSE_FREE_FORM: Allow any character
 * @IBUS_INPUT_PURPOSE_ALPHA: Allow only alphabetic characters
 * @IBUS_INPUT_PURPOSE_DIGITS: Allow only digits
 * @IBUS_INPUT_PURPOSE_NUMBER: Edited field expects numbers
 * @IBUS_INPUT_PURPOSE_PHONE: Edited field expects phone number
 * @IBUS_INPUT_PURPOSE_URL: Edited field expects URL
 * @IBUS_INPUT_PURPOSE_EMAIL: Edited field expects email address
 * @IBUS_INPUT_PURPOSE_NAME: Edited field expects the name of a person
 * @IBUS_INPUT_PURPOSE_PASSWORD: Like @IBUS_INPUT_PURPOSE_FREE_FORM,
 *     but characters are hidden
 * @IBUS_INPUT_PURPOSE_PIN: Like @IBUS_INPUT_PURPOSE_DIGITS, but
 *     characters are hidden
 * @IBUS_INPUT_PURPOSE_TERMINAL: Allow any character, in addition to control
 *     codes. Since 1.5.24
 *
 * Describes primary purpose of the input context.  This information
 * is particularly useful to implement intelligent behavior in
 * engines, such as automatic input-mode switch and text prediction.
 *
 * Note that the purpose is not meant to impose a totally strict rule
 * about allowed characters, and does not replace input validation.
 * It is fine for an on-screen keyboard to let the user override the
 * character set restriction that is expressed by the purpose. The
 * application is expected to validate the entry contents, even if
 * it specified a purpose.
 *
 * The difference between @IBUS_INPUT_PURPOSE_DIGITS and
 * @IBUS_INPUT_PURPOSE_NUMBER is that the former accepts only digits
 * while the latter also some punctuation (like commas or points, plus,
 * minus) and “e” or “E” as in 3.14E+000.
 *
 * This enumeration may be extended in the future; engines should
 * interpret unknown values as 'free form'.
 *
 * Since: 1.5.4
  }

  PIBusInputPurpose = ^TIBusInputPurpose;
  TIBusInputPurpose =  Longint;
  Const
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
;
{*
 * IBusInputHints:
 * @IBUS_INPUT_HINT_NONE: No special behaviour suggested
 * @IBUS_INPUT_HINT_SPELLCHECK: Suggest checking for typos
 * @IBUS_INPUT_HINT_NO_SPELLCHECK: Suggest not checking for typos
 * @IBUS_INPUT_HINT_WORD_COMPLETION: Suggest word completion
 * @IBUS_INPUT_HINT_LOWERCASE: Suggest to convert all text to lowercase
 * @IBUS_INPUT_HINT_UPPERCASE_CHARS: Suggest to capitalize all text
 * @IBUS_INPUT_HINT_UPPERCASE_WORDS: Suggest to capitalize the first
 *     character of each word
 * @IBUS_INPUT_HINT_UPPERCASE_SENTENCES: Suggest to capitalize the
 *     first word of each sentence
 * @IBUS_INPUT_HINT_INHIBIT_OSK: Suggest to not show an onscreen keyboard
 *     (e.g for a calculator that already has all the keys).
 * @IBUS_INPUT_HINT_VERTICAL_WRITING: The text is vertical. Since 1.5.11
 * @IBUS_INPUT_HINT_EMOJI: Suggest offering Emoji support. Since 1.5.24
 * @IBUS_INPUT_HINT_NO_EMOJI: Suggest not offering Emoji support. Since 1.5.24
 * @IBUS_INPUT_HINT_PRIVATE: Request that the input method should not
 *     update personalized data (like typing history). Since 1.5.26
 *
 * Describes hints that might be taken into account by engines.  Note
 * that engines may already tailor their behaviour according to the
 * #IBusInputPurpose of the entry.
 *
 * Some common sense is expected when using these flags - mixing
 * @IBUS_INPUT_HINT_LOWERCASE with any of the uppercase hints makes no sense.
 *
 * This enumeration may be extended in the future; engines should
 * ignore unknown values.
 *
 * Since: 1.5.4
  }
type
  PIBusInputHints = ^TIBusInputHints;
  TIBusInputHints =  Longint;
  Const
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
;
{$endif}

implementation


end.
