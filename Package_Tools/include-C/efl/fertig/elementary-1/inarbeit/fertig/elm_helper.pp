
unit elm_helper;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_helper.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_helper.h
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
PEfl_Event  = ^Efl_Event;
PEina_Tmpstr  = ^Eina_Tmpstr;
PElm_Regexp_Status  = ^Elm_Regexp_Status;
PElm_Validate_Content  = ^Elm_Validate_Content;
PElm_Validator_Regexp  = ^Elm_Validator_Regexp;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*
 * @defgroup Helper Helper
 * @ingroup Elementary
 *
 * The validation helper feature.
 *
 * @
  }
(* Const before type ignored *)
type
  PElm_Validate_Content = ^TElm_Validate_Content;
  TElm_Validate_Content = record
      text : Pchar;
      signal : PEina_Tmpstr;
    end;

{*
 * Data for the elm_validator_regexp_helper()
  }
{*
 * The Regexp validator data.
  }
{*
 * @brief Enumeration that defines the regex error codes
 * @since 1.14
  }
{* Regex maches to the Entrys text.  }
{* Failed to match.  }
{* Invalid regular expression.  }

  PElm_Regexp_Status = ^TElm_Regexp_Status;
  TElm_Regexp_Status =  Longint;
  Const
    ELM_REG_NOERROR = 0;
    ELM_REG_NOMATCH = 1;
    ELM_REG_BADPAT = 2;
;
{*
 * @brief Create a new regex validator.
 * General designed for validate inputed entry text.
 *
 * @param pattern The regex pattern
 * @param signal The part of signal name, which will be emitted to style
 * @return The regex validator
 *
 * @see elm_validator_regexp_free()
 * @see elm_validator_regexp_status_get()
 * @see elm_validator_regexp_helper()
 *
 * @since 1.14
  }
(* Const before type ignored *)
(* Const before type ignored *)

function elm_validator_regexp_new(pattern:Pchar; signal:Pchar):PElm_Validator_Regexp;cdecl;external;
{*
 * @brief Delete the existing regex validator.
 *
 * @param validator The given validator
 *
 * @see elm_validator_regexp_new()
 *
 * @since 1.14
  }
procedure elm_validator_regexp_free(validator:PElm_Validator_Regexp);cdecl;external;
{*
 * @brief Get the validation status.
 *
 * @param validator The given validator
 *
 * @note All return value see here: http://www.gnu.org/software/libc/manual/html_node/Regular-Expressions.html
 *
 * @since 1.14
  }
function elm_validator_regexp_status_get(validator:PElm_Validator_Regexp):TElm_Regexp_Status;cdecl;external;
{$if defined(EFL_BETA_API_SUPPORT)}
{*
 * @brief The regex validator. Used as callback to validate event.
 *
 * Example:
 * @code
 * extern Evas_Object *parent;
 * Evas_Object *entry;
 * Elm_Validator_Regexp *re;
 *
 * //add validator
 * entry = elm_entry_add(parent);
 * re = elm_validator_regexp_new("^[0-9]*$", NULL);
 * efl_event_callback_add(entry, ELM_ENTRY_EVENT_VALIDATE, elm_validator_regexp_helper, re);
 *
 * //delete validator
 * efl_event_callback_del(entry, ELM_ENTRY_EVENT_VALIDATE, elm_validator_regexp_helper, re);
 * @endcode
 *
 * @see elm_validator_regexp_new()
 * @since 1.14
  }
(* Const before type ignored *)

procedure elm_validator_regexp_helper(data:pointer; event:PEfl_Event);cdecl;external;
{$endif}
{*
 * @
  }

implementation


end.
