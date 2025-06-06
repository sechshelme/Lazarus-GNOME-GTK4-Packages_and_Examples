
unit efl_core_command_line_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_core_command_line_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_core_command_line_eo.h
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
PEfl_Core_Command_Line  = ^Efl_Core_Command_Line;
PEina_Accessor  = ^Eina_Accessor;
PEina_Array  = ^Eina_Array;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_CORE_COMMAND_LINE_EO_H_}
{$define _EFL_CORE_COMMAND_LINE_EO_H_}
{$ifndef _EFL_CORE_COMMAND_LINE_EO_CLASS_TYPE}
{$define _EFL_CORE_COMMAND_LINE_EO_CLASS_TYPE}
type
  PEfl_Core_Command_Line = ^TEfl_Core_Command_Line;
  TEfl_Core_Command_Line = TEo;
{$endif}
{$ifndef _EFL_CORE_COMMAND_LINE_EO_TYPES}
{$define _EFL_CORE_COMMAND_LINE_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief A mixin that implements standard functions for command lines.
 *
 * This object parses the command line that gets passed, later the object can
 * be accessed via accessor or the string directly.
 *
 * @ingroup Efl_Core_Command_Line
  }

{ was #define dname def_expr }
function EFL_CORE_COMMAND_LINE_MIXIN : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_core_command_line_mixin_get:PEfl_Class;cdecl;external;
{*
 * @brief A commandline that encodes arguments in a command string. This
 * command is unix shell-style, thus whitespace separates arguments unless
 * escaped. Also a semi-colon ';', ampersand '&', pipe/bar '|', hash '#',
 * bracket, square brace, brace character ('(', ')', '[', ']', '', ''),
 * exclamation mark '!',  backquote '`', greator or less than ('>' '<')
 * character unless escaped or in quotes would cause args_count/value to not be
 * generated properly, because it would force complex shell interpretation
 * which will not be supported in evaluating the arg_count/value information,
 * but the final shell may interpret this if this is executed via a
 * command-line shell. To not be a complex shell command, it should be simple
 * with paths, options and variable expansions, but nothing more complex
 * involving the above unescaped characters.
 *
 * "cat -option /path/file" "cat 'quoted argument'" "cat ~/path/escaped\
 * argument" "/bin/cat escaped\ argument @c VARIABLE" etc.
 *
 * It should not try and use "complex shell features" if you want the arg_count
 * and arg_value set to be correct after setting the command string. For
 * example none of:
 *
 * "VAR=x /bin/command && /bin/othercommand >& /dev/null" "VAR=x /bin/command
 * `/bin/othercommand` | /bin/cmd2 && cmd3 &" etc.
 *
 * If you set the command the arg_count/value property contents can change and
 * be completely re-evaluated by parsing the command string into an argument
 * array set along with interpreting escapes back into individual argument
 * strings.
 * @param[in] obj The object.
 *
 * @ingroup Efl_Core_Command_Line
  }
(* Const before type ignored *)
(* Const before type ignored *)
function efl_core_command_line_command_get(obj:PEo):Pchar;cdecl;external;
{* Get the accessor which enables access to each argument that got passed to
 * this object.
 *
 * @ingroup Efl_Core_Command_Line
  }
function efl_core_command_line_command_access(obj:PEo):PEina_Accessor;cdecl;external;
{*
 * @brief Use an array to fill this object
 *
 * Every element of a string is a argument.
 *
 * @param[in] obj The object.
 * @param[in] array An array where every array field is an argument
 *
 * @return On success @c true, @c false otherwise
 *
 * @ingroup Efl_Core_Command_Line
  }
function efl_core_command_line_command_array_set(obj:PEo; array:PEina_Array):TEina_Bool;cdecl;external;
{*
 * @brief Use a string to fill this object
 *
 * The string will be split at every unescaped ' ', every resulting substring
 * will be a new argument to the command line.
 *
 * @param[in] obj The object.
 * @param[in] str A command in form of a string
 *
 * @return On success @c true, @c false otherwise
 *
 * @ingroup Efl_Core_Command_Line
  }
(* Const before type ignored *)
function efl_core_command_line_command_string_set(obj:PEo; str:Pchar):TEina_Bool;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_CORE_COMMAND_LINE_MIXIN : longint; { return type might be wrong }
  begin
    EFL_CORE_COMMAND_LINE_MIXIN:=efl_core_command_line_mixin_get;
  end;


end.
