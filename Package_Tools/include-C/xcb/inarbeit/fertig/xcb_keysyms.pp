
unit xcb_keysyms;
interface

{
  Automatically converted by H2Pas 1.0.0 from xcb_keysyms.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    xcb_keysyms.h
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
Pxcb_connection_t  = ^xcb_connection_t;
Pxcb_key_press_event_t  = ^xcb_key_press_event_t;
Pxcb_key_release_event_t  = ^xcb_key_release_event_t;
Pxcb_key_symbols_t  = ^xcb_key_symbols_t;
Pxcb_keycode_t  = ^xcb_keycode_t;
Pxcb_mapping_notify_event_t  = ^xcb_mapping_notify_event_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef __XCB_KEYSYMS_H__}
{$define __XCB_KEYSYMS_H__}
{$include <xcb/xcb.h>}
{ C++ extern C conditionnal removed }
type
  TXCBKeySymbols = Txcb_key_symbols_t;

function xcb_key_symbols_alloc(c:Pxcb_connection_t):Pxcb_key_symbols_t;cdecl;external;
procedure xcb_key_symbols_free(syms:Pxcb_key_symbols_t);cdecl;external;
function xcb_key_symbols_get_keysym(syms:Pxcb_key_symbols_t; keycode:Txcb_keycode_t; col:longint):Txcb_keysym_t;cdecl;external;
{*
 * @brief Get the keycodes attached to a keysyms.
 * There can be several value, so what is returned is an array of keycode
 * terminated by XCB_NO_SYMBOL. You are responsible to free it.
 * Be aware that this function can be slow. It will convert all
 * combinations of all available keycodes to keysyms to find the ones that
 * match.
 * @param syms Key symbols.
 * @param keysym The keysym to look for.
 * @return A XCB_NO_SYMBOL terminated array of keycode, or NULL if nothing is found.
  }
function xcb_key_symbols_get_keycode(syms:Pxcb_key_symbols_t; keysym:Txcb_keysym_t):Pxcb_keycode_t;cdecl;external;
function xcb_key_press_lookup_keysym(syms:Pxcb_key_symbols_t; event:Pxcb_key_press_event_t; col:longint):Txcb_keysym_t;cdecl;external;
function xcb_key_release_lookup_keysym(syms:Pxcb_key_symbols_t; event:Pxcb_key_release_event_t; col:longint):Txcb_keysym_t;cdecl;external;
function xcb_refresh_keyboard_mapping(syms:Pxcb_key_symbols_t; event:Pxcb_mapping_notify_event_t):longint;cdecl;external;
{ TODO:  need XLookupString equivalent  }
{ Tests for classes of symbols  }
function xcb_is_keypad_key(keysym:Txcb_keysym_t):longint;cdecl;external;
function xcb_is_private_keypad_key(keysym:Txcb_keysym_t):longint;cdecl;external;
function xcb_is_cursor_key(keysym:Txcb_keysym_t):longint;cdecl;external;
function xcb_is_pf_key(keysym:Txcb_keysym_t):longint;cdecl;external;
function xcb_is_function_key(keysym:Txcb_keysym_t):longint;cdecl;external;
function xcb_is_misc_function_key(keysym:Txcb_keysym_t):longint;cdecl;external;
function xcb_is_modifier_key(keysym:Txcb_keysym_t):longint;cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}
{ __XCB_KEYSYMS_H__  }

implementation


end.
