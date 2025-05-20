
unit efl_config_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_config_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_config_eo.h
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
PEfl_Config  = ^Efl_Config;
PEina_Value  = ^Eina_Value;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_CONFIG_EO_H_}
{$define _EFL_CONFIG_EO_H_}
{$ifndef _EFL_CONFIG_EO_CLASS_TYPE}
{$define _EFL_CONFIG_EO_CLASS_TYPE}
type
  PEfl_Config = ^TEfl_Config;
  TEfl_Config = TEo;
{$endif}
{$ifndef _EFL_CONFIG_EO_TYPES}
{$define _EFL_CONFIG_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{* A generic configuration interface, that holds key-value pairs.
 *
 * @ingroup Efl_Config
  }

{ was #define dname def_expr }
function EFL_CONFIG_INTERFACE : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_config_interface_get:PEfl_Class;cdecl;external;
{*
 * @brief A generic configuration value, referred to by name.
 *
 * @param[in] obj The object.
 * @param[in] name Configuration option name.
 * @param[in] value Configuration option value. May be @c null if not found.
 *
 * @return @c false in case of error: value type was invalid, the config can't
 * be changed, config does not exist...
 *
 * @ingroup Efl_Config
  }
(* Const before type ignored *)
(* Const before type ignored *)
function efl_config_set(obj:PEo; name:Pchar; value:PEina_Value):TEina_Bool;cdecl;external;
{*
 * @brief A generic configuration value, referred to by name.
 *
 * @param[in] obj The object.
 * @param[in] name Configuration option name.
 *
 * @return The value. It will be empty if it doesn't exist. The caller must
 * free it after use (using @c eina_value_free() in C).
 *
 * @ingroup Efl_Config
  }
(* Const before type ignored *)
(* Const before type ignored *)
function efl_config_get(obj:PEo; name:Pchar):PEina_Value;cdecl;external;
(* Const before type ignored *)
  var
    _EFL_CONFIG_EVENT_CONFIG_CHANGED : TEfl_Event_Description;cvar;external;
{* Called when a config value has been changed for the manager object. Passed
 * string is the name of the value or NULL if all values were changed.
 * @return const char *
 *
 * @ingroup Efl_Config
  }

{ was #define dname def_expr }
function EFL_CONFIG_EVENT_CONFIG_CHANGED : longint; { return type might be wrong }

{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_CONFIG_INTERFACE : longint; { return type might be wrong }
  begin
    EFL_CONFIG_INTERFACE:=efl_config_interface_get;
  end;

{ was #define dname def_expr }
function EFL_CONFIG_EVENT_CONFIG_CHANGED : longint; { return type might be wrong }
  begin
    EFL_CONFIG_EVENT_CONFIG_CHANGED:=@(_EFL_CONFIG_EVENT_CONFIG_CHANGED);
  end;


end.
