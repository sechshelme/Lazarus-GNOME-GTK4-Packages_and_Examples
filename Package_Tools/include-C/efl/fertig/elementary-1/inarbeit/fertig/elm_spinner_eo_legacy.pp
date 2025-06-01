
unit elm_spinner_eo_legacy;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_spinner_eo_legacy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    elm_spinner_eo_legacy.h
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
PElm_Spinner  = ^Elm_Spinner;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _ELM_SPINNER_EO_LEGACY_H_}
{$define _ELM_SPINNER_EO_LEGACY_H_}
{$ifndef _ELM_SPINNER_EO_CLASS_TYPE}
{$define _ELM_SPINNER_EO_CLASS_TYPE}
type
  PElm_Spinner = ^TElm_Spinner;
  TElm_Spinner = TEo;
{$endif}
{$ifndef _ELM_SPINNER_EO_TYPES}
{$define _ELM_SPINNER_EO_TYPES}
{$endif}
{*
 * @brief Control whether the spinner should wrap when it reaches its minimum
 * or maximum value.
 *
 * Disabled by default. If disabled, when the user tries to increment the
 * value, but displayed value plus step value is bigger than maximum value, the
 * new value will be the maximum value. The same happens when the user tries to
 * decrement it, but the value less step is less than minimum value. In this
 * case, the new displayed value will be the minimum value.
 *
 * When wrap is enabled, when the user tries to increment the value, but
 * displayed value plus step value is bigger than maximum value, the new value
 * will be the minimum value. When the the user tries to decrement it, but the
 * value less step is less than minimum value, the new displayed value will be
 * the maximum value.
 *
 * E.g.: @c min = 10 @c max = 50 @c step = 20 @c displayed = 20
 *
 * When the user decrement value (using left or bottom arrow), it will displays
 * $50.
 *
 * @param[in] obj The object.
 * @param[in] wrap @c true to enable wrap or @c false to disable it.
 *
 * @ingroup Elm_Spinner_Group
  }

procedure elm_spinner_wrap_set(obj:PElm_Spinner; wrap:TEina_Bool);cdecl;external;
{*
 * @brief Control whether the spinner should wrap when it reaches its minimum
 * or maximum value.
 *
 * Disabled by default. If disabled, when the user tries to increment the
 * value, but displayed value plus step value is bigger than maximum value, the
 * new value will be the maximum value. The same happens when the user tries to
 * decrement it, but the value less step is less than minimum value. In this
 * case, the new displayed value will be the minimum value.
 *
 * When wrap is enabled, when the user tries to increment the value, but
 * displayed value plus step value is bigger than maximum value, the new value
 * will be the minimum value. When the the user tries to decrement it, but the
 * value less step is less than minimum value, the new displayed value will be
 * the maximum value.
 *
 * E.g.: @c min = 10 @c max = 50 @c step = 20 @c displayed = 20
 *
 * When the user decrement value (using left or bottom arrow), it will displays
 * $50.
 *
 * @param[in] obj The object.
 *
 * @return @c true to enable wrap or @c false to disable it.
 *
 * @ingroup Elm_Spinner_Group
  }
(* Const before type ignored *)
function elm_spinner_wrap_get(obj:PElm_Spinner):TEina_Bool;cdecl;external;
{*
 * @brief Control the interval on time updates for a user mouse button hold on
 * spinner widgets' arrows.
 *
 * This interval value is decreased while the user holds the mouse pointer
 * either incrementing or decrementing spinner's value.
 *
 * This helps the user to get to a given value distant from the current one
 * easier/faster, as it will start to change quicker and quicker on mouse
 * button holds.
 *
 * The calculation for the next change interval value, starting from the one
 * set with this call, is the previous interval divided by $1.05, so it
 * decreases a little bit.
 *
 * The default starting interval value for automatic changes is $0.85 seconds.
 *
 * @param[in] obj The object.
 * @param[in] interval The (first) interval value in seconds.
 *
 * @ingroup Elm_Spinner_Group
  }
procedure elm_spinner_interval_set(obj:PElm_Spinner; interval:Tdouble);cdecl;external;
{*
 * @brief Control the interval on time updates for a user mouse button hold on
 * spinner widgets' arrows.
 *
 * This interval value is decreased while the user holds the mouse pointer
 * either incrementing or decrementing spinner's value.
 *
 * This helps the user to get to a given value distant from the current one
 * easier/faster, as it will start to change quicker and quicker on mouse
 * button holds.
 *
 * The calculation for the next change interval value, starting from the one
 * set with this call, is the previous interval divided by $1.05, so it
 * decreases a little bit.
 *
 * The default starting interval value for automatic changes is $0.85 seconds.
 *
 * @param[in] obj The object.
 *
 * @return The (first) interval value in seconds.
 *
 * @ingroup Elm_Spinner_Group
  }
(* Const before type ignored *)
function elm_spinner_interval_get(obj:PElm_Spinner):Tdouble;cdecl;external;
{*
 * @brief Control the round value for rounding
 *
 * Sets the rounding value used for value rounding in the spinner.
 *
 * @param[in] obj The object.
 * @param[in] rnd The rounding value
 *
 * @ingroup Elm_Spinner_Group
  }
procedure elm_spinner_round_set(obj:PElm_Spinner; rnd:longint);cdecl;external;
{*
 * @brief Control the round value for rounding
 *
 * Sets the rounding value used for value rounding in the spinner.
 *
 * @param[in] obj The object.
 *
 * @return The rounding value
 *
 * @ingroup Elm_Spinner_Group
  }
(* Const before type ignored *)
function elm_spinner_round_get(obj:PElm_Spinner):longint;cdecl;external;
{*
 * @brief Control whether the spinner can be directly edited by the user or
 * not.
 *
 * Spinner objects can have edition disabled, in which state they will be
 * changed only by arrows. Useful for contexts where you don't want your users
 * to interact with it writing the value. Specially when using special values,
 * the user can see real value instead of special label on edition.
 *
 * It's enabled by default.
 *
 * @param[in] obj The object.
 * @param[in] editable @c true to allow users to edit it or @c false to don't
 * allow users to edit it directly.
 *
 * @ingroup Elm_Spinner_Group
  }
procedure elm_spinner_editable_set(obj:PElm_Spinner; editable:TEina_Bool);cdecl;external;
{*
 * @brief Control whether the spinner can be directly edited by the user or
 * not.
 *
 * Spinner objects can have edition disabled, in which state they will be
 * changed only by arrows. Useful for contexts where you don't want your users
 * to interact with it writing the value. Specially when using special values,
 * the user can see real value instead of special label on edition.
 *
 * It's enabled by default.
 *
 * @param[in] obj The object.
 *
 * @return @c true to allow users to edit it or @c false to don't allow users
 * to edit it directly.
 *
 * @ingroup Elm_Spinner_Group
  }
(* Const before type ignored *)
function elm_spinner_editable_get(obj:PElm_Spinner):TEina_Bool;cdecl;external;
{*
 * @brief Control the base for rounding
 *
 * Rounding works as follows:
 *
 * rounded_val = base + (double)(((value - base) / round) * round)
 *
 * Where rounded_val, value and base are doubles, and round is an integer.
 *
 * This means that things will be rounded to increments (or decrements) of
 * "round" starting from value @c base. The default base for rounding is 0.
 *
 * Example: round = 3, base = 2 Values: ..., -2, 0, 2, 5, 8, 11, 14, ...
 *
 * Example: round = 2, base = 5.5 Values: ..., -0.5, 1.5, 3.5, 5.5, 7.5, 9.5,
 * 11.5, ...
 *
 * @param[in] obj The object.
 * @param[in] base The base value
 *
 * @ingroup Elm_Spinner_Group
  }
procedure elm_spinner_base_set(obj:PElm_Spinner; base:Tdouble);cdecl;external;
{*
 * @brief Control the base for rounding
 *
 * Rounding works as follows:
 *
 * rounded_val = base + (double)(((value - base) / round) * round)
 *
 * Where rounded_val, value and base are doubles, and round is an integer.
 *
 * This means that things will be rounded to increments (or decrements) of
 * "round" starting from value @c base. The default base for rounding is 0.
 *
 * Example: round = 3, base = 2 Values: ..., -2, 0, 2, 5, 8, 11, 14, ...
 *
 * Example: round = 2, base = 5.5 Values: ..., -0.5, 1.5, 3.5, 5.5, 7.5, 9.5,
 * 11.5, ...
 *
 * @param[in] obj The object.
 *
 * @return The base value
 *
 * @ingroup Elm_Spinner_Group
  }
(* Const before type ignored *)
function elm_spinner_base_get(obj:PElm_Spinner):Tdouble;cdecl;external;
{*
 * @brief Control the format string of the displayed label.
 *
 * If @c NULL, this sets the format to "%.0f". If not it sets the format string
 * for the label text. The label text is provided a floating point value, so
 * the label text can display up to 1 floating point value. Note that this is
 * optional.
 *
 * Use a format string such as "%1.2f meters" for example, and it will display
 * values like: "3.14 meters" for a value equal to 3.14159.
 *
 * Default is "%0.f".
 *
 * @param[in] obj The object.
 * @param[in] fmt The format string for the label display.
 *
 * @ingroup Elm_Spinner_Group
  }
(* Const before type ignored *)
procedure elm_spinner_label_format_set(obj:PElm_Spinner; fmt:Pchar);cdecl;external;
{*
 * @brief Control the format string of the displayed label.
 *
 * If @c NULL, this sets the format to "%.0f". If not it sets the format string
 * for the label text. The label text is provided a floating point value, so
 * the label text can display up to 1 floating point value. Note that this is
 * optional.
 *
 * Use a format string such as "%1.2f meters" for example, and it will display
 * values like: "3.14 meters" for a value equal to 3.14159.
 *
 * Default is "%0.f".
 *
 * @param[in] obj The object.
 *
 * @return The format string for the label display.
 *
 * @ingroup Elm_Spinner_Group
  }
(* Const before type ignored *)
(* Const before type ignored *)
function elm_spinner_label_format_get(obj:PElm_Spinner):Pchar;cdecl;external;
{*
 * @brief Control special string to display in the place of the numerical
 * value.
 *
 * It's useful for cases when a user should select an item that is better
 * indicated by a label than a value. For example, weekdays or months.
 *
 * @note If another label was previously set to @c value, it will be replaced
 * by the new label.
 *
 * @param[in] obj The object.
 * @param[in] value The value to be replaced.
 * @param[in] label The label to be used.
 *
 * @ingroup Elm_Spinner_Group
  }
(* Const before type ignored *)
procedure elm_spinner_special_value_add(obj:PElm_Spinner; value:Tdouble; _label:Pchar);cdecl;external;
{$endif}

implementation


end.
