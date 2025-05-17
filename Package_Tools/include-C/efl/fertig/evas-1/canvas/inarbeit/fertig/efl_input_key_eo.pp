
unit efl_input_key_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_input_key_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_input_key_eo.h
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
PEfl_Class  = ^Efl_Class;
PEfl_Input_Key  = ^Efl_Input_Key;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_INPUT_KEY_EO_H_}
{$define _EFL_INPUT_KEY_EO_H_}
{$ifndef _EFL_INPUT_KEY_EO_CLASS_TYPE}
{$define _EFL_INPUT_KEY_EO_CLASS_TYPE}
type
  PEfl_Input_Key = ^TEfl_Input_Key;
  TEfl_Input_Key = TEo;
{$endif}
{$ifndef _EFL_INPUT_KEY_EO_TYPES}
{$define _EFL_INPUT_KEY_EO_TYPES}
{$endif}
{* Represents a single key event from a keyboard or similar device.
 *
 * @since 1.23
 *
 * @ingroup Efl_Input_Key
  }

{ was #define dname def_expr }
function EFL_INPUT_KEY_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_input_key_class_get:PEfl_Class;cdecl;external;
{*
 * @brief @c true if the key is down, @c false if it is released.
 *
 * @param[in] obj The object.
 * @param[in] val @c true if the key is pressed, @c false otherwise.
 *
 * @since 1.23
 *
 * @ingroup Efl_Input_Key
  }
procedure efl_input_key_pressed_set(obj:PEo; val:TEina_Bool);cdecl;external;
{*
 * @brief @c true if the key is down, @c false if it is released.
 *
 * @param[in] obj The object.
 *
 * @return @c true if the key is pressed, @c false otherwise.
 *
 * @since 1.23
 *
 * @ingroup Efl_Input_Key
  }
(* Const before type ignored *)
function efl_input_key_pressed_get(obj:PEo):TEina_Bool;cdecl;external;
{*
 * @brief Name string of the physical key that produced this event.
 *
 * This typically matches what is printed on the key. For example, "1" or "a".
 * Note that both "a" and "A" are obtained with the same physical key, so both
 * events will have the same @ref efl_input_key_name_get "a" but different
 * @ref efl_input_key_sym_get.
 *
 * Commonly used in keyboard remapping menus to uniquely identify a physical
 * key.
 *
 * @param[in] obj The object.
 * @param[in] val Name of the key that produced this event.
 *
 * @since 1.23
 *
 * @ingroup Efl_Input_Key
  }
(* Const before type ignored *)
procedure efl_input_key_name_set(obj:PEo; val:Pchar);cdecl;external;
{*
 * @brief Name string of the physical key that produced this event.
 *
 * This typically matches what is printed on the key. For example, "1" or "a".
 * Note that both "a" and "A" are obtained with the same physical key, so both
 * events will have the same @ref efl_input_key_name_get "a" but different
 * @ref efl_input_key_sym_get.
 *
 * Commonly used in keyboard remapping menus to uniquely identify a physical
 * key.
 *
 * @param[in] obj The object.
 *
 * @return Name of the key that produced this event.
 *
 * @since 1.23
 *
 * @ingroup Efl_Input_Key
  }
(* Const before type ignored *)
(* Const before type ignored *)
function efl_input_key_name_get(obj:PEo):Pchar;cdecl;external;
{*
 * @brief Name of the symbol produced by this key event.
 *
 * For example, "a", "A", "1" or "exclam". The same physical key can produce
 * different symbols when combined with other keys like "shift" or "alt gr".
 * For example, "a" and "A" have different @ref efl_input_key_sym_get but the
 * same @ref efl_input_key_name_get "a".
 *
 * This is the field you typically use to uniquely identify a keyboard symbol,
 * in keyboard shortcuts for example.
 *
 * @param[in] obj The object.
 * @param[in] val Symbol name produced by key event.
 *
 * @since 1.23
 *
 * @ingroup Efl_Input_Key
  }
(* Const before type ignored *)
procedure efl_input_key_sym_set(obj:PEo; val:Pchar);cdecl;external;
{*
 * @brief Name of the symbol produced by this key event.
 *
 * For example, "a", "A", "1" or "exclam". The same physical key can produce
 * different symbols when combined with other keys like "shift" or "alt gr".
 * For example, "a" and "A" have different @ref efl_input_key_sym_get but the
 * same @ref efl_input_key_name_get "a".
 *
 * This is the field you typically use to uniquely identify a keyboard symbol,
 * in keyboard shortcuts for example.
 *
 * @param[in] obj The object.
 *
 * @return Symbol name produced by key event.
 *
 * @since 1.23
 *
 * @ingroup Efl_Input_Key
  }
(* Const before type ignored *)
(* Const before type ignored *)
function efl_input_key_sym_get(obj:PEo):Pchar;cdecl;external;
{*
 * @brief A UTF8 string if this keystroke has produced a visible string to be
 * added.
 *
 * @param[in] obj The object.
 * @param[in] val Visible string produced by this key event, in UTF8.
 *
 * @since 1.23
 *
 * @ingroup Efl_Input_Key
  }
(* Const before type ignored *)
procedure efl_input_key_string_set(obj:PEo; val:Pchar);cdecl;external;
{*
 * @brief A UTF8 string if this keystroke has produced a visible string to be
 * added.
 *
 * @param[in] obj The object.
 *
 * @return Visible string produced by this key event, in UTF8.
 *
 * @since 1.23
 *
 * @ingroup Efl_Input_Key
  }
(* Const before type ignored *)
(* Const before type ignored *)
function efl_input_key_string_get(obj:PEo):Pchar;cdecl;external;
{*
 * @brief A UTF8 string if this keystroke has modified a string in the middle
 * of being composed.
 *
 * @note This string replaces the previous one.
 *
 * @param[in] obj The object.
 * @param[in] val Composed string in UTF8.
 *
 * @since 1.23
 *
 * @ingroup Efl_Input_Key
  }
(* Const before type ignored *)
procedure efl_input_key_compose_string_set(obj:PEo; val:Pchar);cdecl;external;
{*
 * @brief A UTF8 string if this keystroke has modified a string in the middle
 * of being composed.
 *
 * @note This string replaces the previous one.
 *
 * @param[in] obj The object.
 *
 * @return Composed string in UTF8.
 *
 * @since 1.23
 *
 * @ingroup Efl_Input_Key
  }
(* Const before type ignored *)
(* Const before type ignored *)
function efl_input_key_compose_string_get(obj:PEo):Pchar;cdecl;external;
{*
 * @brief Keyboard scan code of the physical key that produced this event.
 *
 * You typically do not need to use this field, because the system maps scan
 * codes to the more convenient @ref efl_input_key_name_get. Us this in
 * keyboard remapping applications or when trying to use a keyboard unknown to
 * your operating system.
 *
 * @param[in] obj The object.
 * @param[in] val Keyboard scan code.
 *
 * @since 1.23
 *
 * @ingroup Efl_Input_Key
  }
procedure efl_input_key_code_set(obj:PEo; val:longint);cdecl;external;
{*
 * @brief Keyboard scan code of the physical key that produced this event.
 *
 * You typically do not need to use this field, because the system maps scan
 * codes to the more convenient @ref efl_input_key_name_get. Us this in
 * keyboard remapping applications or when trying to use a keyboard unknown to
 * your operating system.
 *
 * @param[in] obj The object.
 *
 * @return Keyboard scan code.
 *
 * @since 1.23
 *
 * @ingroup Efl_Input_Key
  }
(* Const before type ignored *)
function efl_input_key_code_get(obj:PEo):longint;cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function EFL_INPUT_KEY_CLASS : longint; { return type might be wrong }
  begin
    EFL_INPUT_KEY_CLASS:=efl_input_key_class_get;
  end;


end.
