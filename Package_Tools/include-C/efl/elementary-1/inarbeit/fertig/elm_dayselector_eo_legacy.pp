
unit elm_dayselector_eo_legacy;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_dayselector_eo_legacy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_dayselector_eo_legacy.h
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
PEina_List  = ^Eina_List;
PElm_Dayselector  = ^Elm_Dayselector;
PElm_Dayselector_Day  = ^Elm_Dayselector_Day;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _ELM_DAYSELECTOR_EO_LEGACY_H_}
{$define _ELM_DAYSELECTOR_EO_LEGACY_H_}
{$ifndef _ELM_DAYSELECTOR_EO_CLASS_TYPE}
{$define _ELM_DAYSELECTOR_EO_CLASS_TYPE}
type
  PElm_Dayselector = ^TElm_Dayselector;
  TElm_Dayselector = TEo;
{$endif}
{$ifndef _ELM_DAYSELECTOR_EO_TYPES}
{$define _ELM_DAYSELECTOR_EO_TYPES}
{*
 * @brief Identifies the day of the week. API can call the
 * selection/unselection of day with this as a parameter.
 *
 * See also @ref elm_dayselector_day_selected_set,
 * @ref elm_dayselector_day_selected_get.
 *
 * @ingroup Elm_Dayselector
  }
{*< Indicates Sunday.  }
{*< Indicates Monday.  }
{*< Indicates Tuesday.  }
{*< Indicates Wednesday.  }
{*< Indicates Thursday.  }
{*< Indicates Friday.  }
{*< Indicates Saturday.  }
{*< Sentinel value to indicate last enum field during
                       * iteration  }
type
  PElm_Dayselector_Day = ^TElm_Dayselector_Day;
  TElm_Dayselector_Day =  Longint;
  Const
    ELM_DAYSELECTOR_SUN = 0;
    ELM_DAYSELECTOR_MON = 1;
    ELM_DAYSELECTOR_TUE = 2;
    ELM_DAYSELECTOR_WED = 3;
    ELM_DAYSELECTOR_THU = 4;
    ELM_DAYSELECTOR_FRI = 5;
    ELM_DAYSELECTOR_SAT = 6;
    ELM_DAYSELECTOR_MAX = 7;
;
{$endif}
{*
 * @brief Set the starting day of Dayselector.
 *
 * See also @ref Elm_Dayselector_Day, @ref elm_dayselector_week_start_get.
 *
 * @param[in] obj The object.
 * @param[in] day Dayselector_Day the first day that the user wants to display.
 *
 * @ingroup Elm_Dayselector_Group
  }

procedure elm_dayselector_week_start_set(obj:PElm_Dayselector; day:TElm_Dayselector_Day);cdecl;external;
{*
 * @brief Get the starting day of Dayselector.
 *
 * See also @ref Elm_Dayselector_Day, @ref elm_dayselector_week_start_set.
 *
 * @param[in] obj The object.
 *
 * @return Dayselector_Day the first day that the user wants to display.
 *
 * @ingroup Elm_Dayselector_Group
  }
(* Const before type ignored *)
function elm_dayselector_week_start_get(obj:PElm_Dayselector):TElm_Dayselector_Day;cdecl;external;
{*
 * @brief Set the weekend length of Dayselector.
 *
 * See also @ref elm_dayselector_weekend_length_get.
 *
 * @param[in] obj The object.
 * @param[in] length Weekend length, number of days as an integer.
 *
 * @ingroup Elm_Dayselector_Group
  }
procedure elm_dayselector_weekend_length_set(obj:PElm_Dayselector; length:dword);cdecl;external;
{*
 * @brief Get the weekend length of Dayselector.
 *
 * See also @ref Elm_Dayselector_Day, @ref elm_dayselector_weekend_length_set.
 *
 * @param[in] obj The object.
 *
 * @return Weekend length, number of days as an integer.
 *
 * @ingroup Elm_Dayselector_Group
  }
(* Const before type ignored *)
function elm_dayselector_weekend_length_get(obj:PElm_Dayselector):dword;cdecl;external;
{*
 * @brief Set the weekend starting day of Dayselector.
 *
 * See also @ref Elm_Dayselector_Day, @ref elm_dayselector_weekend_start_get.
 *
 * @param[in] obj The object.
 * @param[in] day Dayselector_Day the first day from where weekend starts.
 *
 * @ingroup Elm_Dayselector_Group
  }
procedure elm_dayselector_weekend_start_set(obj:PElm_Dayselector; day:TElm_Dayselector_Day);cdecl;external;
{*
 * @brief Get the weekend starting day of Dayselector.
 *
 * See also @ref Elm_Dayselector_Day, @ref elm_dayselector_weekend_start_set.
 *
 * @param[in] obj The object.
 *
 * @return Dayselector_Day the first day from where weekend starts.
 *
 * @ingroup Elm_Dayselector_Group
  }
(* Const before type ignored *)
function elm_dayselector_weekend_start_get(obj:PElm_Dayselector):TElm_Dayselector_Day;cdecl;external;
{*
 * @brief Set weekdays names to be displayed by the Dayselector.
 *
 * By default or if weekdays is @c null, weekdays abbreviations get from system
 * are displayed: E.g. for an en_US locale: "Sun, Mon, Tue, Wed, Thu, Fri, Sat"
 *
 * The first string should be related to Sunday, the second to Monday...
 *
 * See also @ref elm_dayselector_weekdays_names_get,
 * @ref elm_dayselector_weekend_start_set.
 *
 * @param[in] obj The object.
 * @param[in] weekdays Array of seven strings to be used as weekday names.
 * Warning: It must have 7 elements, or it will access invalid memory. Warning:
 * The strings must be NULL terminated ('@\0').
 *
 * @since 1.8
 *
 * @ingroup Elm_Dayselector_Group
  }
(* Const before type ignored *)
procedure elm_dayselector_weekdays_names_set(obj:PElm_Dayselector; weekdays:PPchar);cdecl;external;
{*
 * @brief Get weekdays names displayed by the calendar.
 *
 * By default, weekdays abbreviations get from system are displayed: E.g. for
 * an en_US locale: "Sun, Mon, Tue, Wed, Thu, Fri, Sat" The first string is
 * related to Sunday, the second to Monday...
 *
 * See also @ref elm_dayselector_weekdays_names_set.
 *
 * @param[in] obj The object.
 *
 * @return A list of seven strings to be used as weekday names.
 *
 * @since 1.8
 *
 * @ingroup Elm_Dayselector_Group
  }
(* Const before type ignored *)
function elm_dayselector_weekdays_names_get(obj:PElm_Dayselector):PEina_List;cdecl;external;
{*
 * @brief Set the state of given Dayselector_Day.
 *
 * See also @ref Elm_Dayselector_Day, @ref elm_dayselector_day_selected_get.
 *
 * @param[in] obj The object.
 * @param[in] day Dayselector_Day that the user want to set state.
 * @param[in] selected State of the day. @c true is selected.
 *
 * @ingroup Elm_Dayselector_Group
  }
procedure elm_dayselector_day_selected_set(obj:PElm_Dayselector; day:TElm_Dayselector_Day; selected:TEina_Bool);cdecl;external;
{*
 * @brief Get the state of given Dayselector_Day.
 *
 * See also @ref Elm_Dayselector_Day, @ref elm_dayselector_day_selected_set.
 *
 * @param[in] obj The object.
 * @param[in] day Dayselector_Day that the user want to know state.
 *
 * @return @c true on success, @c false on failure
 *
 * @ingroup Elm_Dayselector_Group
  }
(* Const before type ignored *)
function elm_dayselector_day_selected_get(obj:PElm_Dayselector; day:TElm_Dayselector_Day):TEina_Bool;cdecl;external;
{$endif}

implementation


end.
