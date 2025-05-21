
unit efl_core_proc_env_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_core_proc_env_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_core_proc_env_eo.h
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
PEfl_Class  = ^Efl_Class;
PEfl_Core_Env  = ^Efl_Core_Env;
PEfl_Core_Proc_Env  = ^Efl_Core_Proc_Env;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_CORE_PROC_ENV_EO_H_}
{$define _EFL_CORE_PROC_ENV_EO_H_}
{$ifndef _EFL_CORE_PROC_ENV_EO_CLASS_TYPE}
{$define _EFL_CORE_PROC_ENV_EO_CLASS_TYPE}
type
  PEfl_Core_Proc_Env = ^TEfl_Core_Proc_Env;
  TEfl_Core_Proc_Env = TEo;
{$endif}
{$ifndef _EFL_CORE_PROC_ENV_EO_TYPES}
{$define _EFL_CORE_PROC_ENV_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}

{ was #define dname def_expr }
function EFL_CORE_PROC_ENV_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_core_proc_env_class_get:PEfl_Class;cdecl;external;
{*
 * @brief Get a instance of this object
 *
 * The object will apply the environment operations onto this process.
 *
 * @ingroup Efl_Core_Proc_Env
  }
function efl_env_self:PEfl_Core_Env;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_CORE_PROC_ENV_CLASS : longint; { return type might be wrong }
  begin
    EFL_CORE_PROC_ENV_CLASS:=efl_core_proc_env_class_get;
  end;


end.
