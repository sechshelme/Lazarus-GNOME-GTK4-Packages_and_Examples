
unit Ecore_Getopt;
interface

{
  Automatically converted by H2Pas 1.0.0 from Ecore_Getopt.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    Ecore_Getopt.h
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
Pbyte  = ^byte;
Pchar  = ^char;
Pdouble  = ^double;
Pdword  = ^dword;
PEcore_Getopt  = ^Ecore_Getopt;
PEcore_Getopt_Action  = ^Ecore_Getopt_Action;
PEcore_Getopt_Desc  = ^Ecore_Getopt_Desc;
PEcore_Getopt_Desc_Arg_Requirement  = ^Ecore_Getopt_Desc_Arg_Requirement;
PEcore_Getopt_Desc_Callback  = ^Ecore_Getopt_Desc_Callback;
PEcore_Getopt_Desc_Store  = ^Ecore_Getopt_Desc_Store;
PEcore_Getopt_Type  = ^Ecore_Getopt_Type;
PEcore_Getopt_Value  = ^Ecore_Getopt_Value;
PEina_List  = ^Eina_List;
PFILE  = ^FILE;
Plongint  = ^longint;
Psmallint  = ^smallint;
Pword  = ^word;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _ECORE_GETOPT_H}
{$define _ECORE_GETOPT_H}
{$include <stdio.h>}
{$include <Eina.h>}
{*
 * @ingroup Ecore
 * @defgroup Ecore_Getopt_Group Ecore Getopt
 *
 * This group contains powerful getopt replacement.
 *
 * This replacement handles both short (-X) or long options (--ABC)
 * options, with various actions supported, like storing one value and
 * already converting to required type, counting number of
 * occurrences, setting true or false values, show help, license,
 * copyright and even support user-defined callbacks.
 *
 * It is provided a set of C Pre Processor macros so definition is
 * straightforward.
 *
 * Values will be stored elsewhere indicated by an array of pointers
 * to values, it is given in separate to parser description so you can
 * use multiple values with the same parser.
 *
 * @
  }
{ C++ extern C conditionnal removed }
{*
 * @typedef Ecore_Getopt_Action
 * @brief Enumeration for defining the actions to do when parsing command line
 * parameters.
  }
{*< Store a value  }
{*< Store a const  }
{*< Store TRUE  }
{*< Store FALSE  }
{*< Store a choice between several values  }
{*< Allocate and store a new value of type Ecore_Getopt_Type  }
{*< Store a count number  }
{*< Call a callback  }
{*< Show help text  }
{*< Show version  }
{*< Show copyright  }
{*< Show license  }
{*< Stop parsing options  }
type
  PEcore_Getopt_Action = ^TEcore_Getopt_Action;
  TEcore_Getopt_Action =  Longint;
  Const
    ECORE_GETOPT_ACTION_STORE = 0;
    ECORE_GETOPT_ACTION_STORE_CONST = 1;
    ECORE_GETOPT_ACTION_STORE_TRUE = 2;
    ECORE_GETOPT_ACTION_STORE_FALSE = 3;
    ECORE_GETOPT_ACTION_CHOICE = 4;
    ECORE_GETOPT_ACTION_APPEND = 5;
    ECORE_GETOPT_ACTION_COUNT = 6;
    ECORE_GETOPT_ACTION_CALLBACK = 7;
    ECORE_GETOPT_ACTION_HELP = 8;
    ECORE_GETOPT_ACTION_VERSION = 9;
    ECORE_GETOPT_ACTION_COPYRIGHT = 10;
    ECORE_GETOPT_ACTION_LICENSE = 11;
    ECORE_GETOPT_ACTION_BREAK = 12;
    ECORE_GETOPT_ACTION_CATEGORY = 13;
;
{*
 * @typedef Ecore_Getopt_Type
 * @brief Enumeration for defining the type of the values to store when using
 * append action.
  }
{*< Value of type string  }
{*< Value of type boolean  }
{*< Value of type short  }
{*< Value of type int  }
{*< Value of type long  }
{*< Value of type unsigned short  }
{*< Value of type unsigned int  }
{*< Value of type unsigned long  }
{*< Value of type double  }
type
  PEcore_Getopt_Type = ^TEcore_Getopt_Type;
  TEcore_Getopt_Type =  Longint;
  Const
    ECORE_GETOPT_TYPE_STR = 0;
    ECORE_GETOPT_TYPE_BOOL = 1;
    ECORE_GETOPT_TYPE_SHORT = 2;
    ECORE_GETOPT_TYPE_INT = 3;
    ECORE_GETOPT_TYPE_LONG = 4;
    ECORE_GETOPT_TYPE_USHORT = 5;
    ECORE_GETOPT_TYPE_UINT = 6;
    ECORE_GETOPT_TYPE_ULONG = 7;
    ECORE_GETOPT_TYPE_DOUBLE = 8;
;
{*
 * @typedef Ecore_Getopt_Desc_Arg_Requirement
 * @brief Enumeration for defining if the command line options require an
 * argument.
  }
{*< Argument is not required  }
{*< Argument is required  }
{*< Argument is optional  }
type
  PEcore_Getopt_Desc_Arg_Requirement = ^TEcore_Getopt_Desc_Arg_Requirement;
  TEcore_Getopt_Desc_Arg_Requirement =  Longint;
  Const
    ECORE_GETOPT_DESC_ARG_REQUIREMENT_NO = 0;
    ECORE_GETOPT_DESC_ARG_REQUIREMENT_YES = 1;
    ECORE_GETOPT_DESC_ARG_REQUIREMENT_OPTIONAL = 3;
;
type
{$ifndef _ECORE_GETOPT_PREDEF}
type

const
  _ECORE_GETOPT_PREDEF = 1;  
{$endif}
{$ifndef _ECORE_GETOPT_DESC_PREDEF}
type

const
  _ECORE_GETOPT_DESC_PREDEF = 1;  
{$endif}
{$ifndef _ECORE_GETOPT_VALUE_PREDEF}
type
  PEcore_Getopt_Value = ^TEcore_Getopt_Value;
  TEcore_Getopt_Value = TEcore_Getopt_Value;

const
  _ECORE_GETOPT_VALUE_PREDEF = 1;  
{$endif}
{*
 * @union _Ecore_Getopt_Value
 * @brief Union listing the types of parameters that can take Getopt values.
  }
{*< String pointer  }
{*< Boolean pointer  }
{*< Short pointer  }
{*< Int pointer  }
{*< Long pointer  }
{*< Unsigned short pointer  }
{*< Unsigned int pointer  }
{*< Unsigned long pointer  }
{*< Double pointer  }
{*< List pointer  }
{*< Void pointer  }
type
  PEcore_Getopt_Value = ^TEcore_Getopt_Value;
  TEcore_Getopt_Value = record
      case longint of
        0 : ( strp : ^Pchar );
        1 : ( boolp : Pbyte );
        2 : ( shortp : Psmallint );
        3 : ( intp : Plongint );
        4 : ( longp : Plongint );
        5 : ( ushortp : Pword );
        6 : ( uintp : Pdword );
        7 : ( ulongp : Pdword );
        8 : ( doublep : Pdouble );
        9 : ( listp : ^PEina_List );
        10 : ( ptrp : ^pointer );
      end;

{*
 * @struct _Ecore_Getopt_Desc_Store
 * @brief Structure used when action is ECORE_GETOPT_ACTION_STORE. It contains
 * information about the value to store.
  }
{*< type of data being handled  }
{*< option argument requirement  }
(* Const before type ignored *)
{*< String value  }
{*< Boolean value  }
{*< Short value  }
{*< Int value  }
{*< Long value  }
{*< Unsigned short value  }
{*< Unsigned int value  }
{*< Unsigned long value  }
{*< Double value  }
{*< value of data being handled  }
  PEcore_Getopt_Desc_Store = ^TEcore_Getopt_Desc_Store;
  TEcore_Getopt_Desc_Store = record
      _type : TEcore_Getopt_Type;
      arg_req : TEcore_Getopt_Desc_Arg_Requirement;
      def : record
          case longint of
            0 : ( strv : Pchar );
            1 : ( boolv : TEina_Bool );
            2 : ( shortv : smallint );
            3 : ( intv : longint );
            4 : ( longv : longint );
            5 : ( ushortv : word );
            6 : ( uintv : dword );
            7 : ( ulongv : dword );
            8 : ( doublev : Tdouble );
          end;
    end;

{*
 * @struct _Ecore_Getopt_Desc_Callback
 * @brief Structure used when action is ECORE_GETOPT_ACTION_CALLBACK. It
 * contains information about the callback to call.
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
{*< function to call as a callback  }
(* Const before type ignored *)
{*< data to pass to the callback  }
{*< option argument requirement  }
(* Const before type ignored *)
  PEcore_Getopt_Desc_Callback = ^TEcore_Getopt_Desc_Callback;
  TEcore_Getopt_Desc_Callback = record
      func : function (parser:PEcore_Getopt; desc:PEcore_Getopt_Desc; str:Pchar; data:pointer; storage:PEcore_Getopt_Value):TEina_Bool;cdecl;
      data : pointer;
      arg_req : TEcore_Getopt_Desc_Arg_Requirement;
      def : Pchar;
    end;

{*
 * @struct _Ecore_Getopt_Desc
 * @brief Structure that describe an option of the command line.
  }
{*< used with a single dash  }
(* Const before type ignored *)
{*< used with double dashes  }
(* Const before type ignored *)
{*< used by --help/ecore_getopt_help()  }
(* Const before type ignored *)
{*< used by ecore_getopt_help() with nargs > 0  }
{*< define how to handle it  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before declarator ignored *)
{ NULL terminated.  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
{*< Action parameter  }
  PEcore_Getopt_Desc = ^TEcore_Getopt_Desc;
  TEcore_Getopt_Desc = record
      shortname : char;
      longname : Pchar;
      help : Pchar;
      metavar : Pchar;
      action : TEcore_Getopt_Action;
      action_param : record
          case longint of
            0 : ( store : TEcore_Getopt_Desc_Store );
            1 : ( store_const : pointer );
            2 : ( choices : ^Pchar );
            3 : ( append_type : TEcore_Getopt_Type );
            4 : ( callback : TEcore_Getopt_Desc_Callback );
            5 : ( dummy : pointer );
          end;
    end;

{*
 * @struct _Ecore_Getopt
 * @brief Structure that contains information on all command line options.
  }
(* Const before type ignored *)
{*< to be used when ecore_app_args_get() fails  }
(* Const before type ignored *)
{*< usage example, %%prog is replaced by @ref prog  }
(* Const before type ignored *)
{*< if exists, --version will work  }
(* Const before type ignored *)
{*< if exists, --copyright will work  }
(* Const before type ignored *)
{*< if exists, --license will work  }
(* Const before type ignored *)
{*< long description, possible multiline  }
{*< fail on errors  }
(* Const before type ignored *)
{*< A table that contains the description of all the other options (NULL terminated). }
  PEcore_Getopt = ^TEcore_Getopt;
  TEcore_Getopt = record
      prog : Pchar;
      usage : Pchar;
      version : Pchar;
      copyright : Pchar;
      license : Pchar;
      description : Pchar;
      flag0 : word;
      descs : PEcore_Getopt_Desc;
    end;


const
  bm_TEcore_Getopt_strict = $1;
  bp_TEcore_Getopt_strict = 0;

function strict(var a : TEcore_Getopt) : TEina_Bool;
procedure set_strict(var a : TEcore_Getopt; __strict : TEina_Bool);
{*
 * @brief Definition for filling Ecore_Getopt_Desc table with an callback action and argument requirements.
 *
 * @param shortname The option short name.
 * @param longname The option long name.
 * @param help The help message concerning this option.
 * @param metavar The metavar message concerning the parameter of the option.
 * @param callback_func The callback function to call.
 * @param callback_data The data to pass to the callback.
 * @param argument_requirement The required arguments to this option.
 * @param default_value The default values for these arguments.
  }
{*
 * @brief Definition for filling Ecore_Getopt_Desc table with a help action.
 *
 * @param shortname The help option short name.
 * @param longname The help option long name.
  }
{*
 * Shows nicely formatted help message for the given parser.
 *
 * @param fp The file the message will be printed on.
 * @param info The structure containing information about command line options.
 *
 * @see ecore_getopt_help_category()
  }
(* Const before type ignored *)

procedure ecore_getopt_help(fp:PFILE; info:PEcore_Getopt);cdecl;external;
{*
 * Shows help for a single category (along with program usage and description).
 *
 * @param fp The file the message will be printed on.
 * @param info The structure containing information about command line options.
 * @param category The category to print.
 *
 * @return @c EINA_TRUE when the category exists, @c EINA_FALSE otherwise.
 *
 * @see ecore_getopt_help()
  }
(* Const before type ignored *)
(* Const before type ignored *)
function ecore_getopt_help_category(fp:PFILE; info:PEcore_Getopt; category:Pchar):TEina_Bool;cdecl;external;
{*
 * Checks parser for duplicate entries, print them out.
 *
 * @return @c EINA_TRUE if there are duplicates, @c EINA_FALSE otherwise.
 * @param parser The parser to be checked.
  }
(* Const before type ignored *)
function ecore_getopt_parser_has_duplicates(parser:PEcore_Getopt):TEina_Bool;cdecl;external;
{*
 * Parses command line parameters.
 *
 * Walks the command line parameters and parse them based on @a parser
 * description, doing actions based on @c parser->descs->action, like
 * showing help text, license, copyright, storing values in values and
 * so on.
 *
 * It is expected that values is of the same size than @c parser->descs,
 * options that do not need a value it will be left untouched.
 *
 * All values are expected to be initialized before use. Options with
 * action @c ECORE_GETOPT_ACTION_STORE and non required arguments
 * (others than @c ECORE_GETOPT_DESC_ARG_REQUIREMENT_YES), are expected
 * to provide a value in @c def to be used.
 *
 * The following actions will store @c 1 on value as a boolean
 * (@c value->boolp) if it's not @c NULL to indicate these actions were
 * executed:
 *   - @c ECORE_GETOPT_ACTION_HELP
 *   - @c ECORE_GETOPT_ACTION_VERSION
 *   - @c ECORE_GETOPT_ACTION_COPYRIGHT
 *   - @c ECORE_GETOPT_ACTION_LICENSE
 *
 * Just @c ECORE_GETOPT_ACTION_APPEND will allocate memory and thus
 * need to be freed. For consistency between all of appended subtypes,
 * @c eina_list->data will contain an allocated memory with the value,
 * that is, for @c ECORE_GETOPT_TYPE_STR it will contain a copy of the
 * argument, @c ECORE_GETOPT_TYPE_INT a pointer to an allocated
 * integer and so on.
 *
 * If parser is in strict mode (see @c Ecore_Getopt->strict), then any
 * error will abort parsing and @c -1 is returned. Otherwise it will try
 * to continue as far as possible.
 *
 * This function may reorder @a argv elements.
 *
 * Translation of help strings (description), metavar, usage, license
 * and copyright may be translated, standard/global gettext() call
 * will be applied on them if ecore was compiled with such support.
 *
 * This function will @b not parse positional arguments! If these are
 * declared (metavar is defined with both shortname and longname being
 * empty), then you must call ecore_getopt_parse_positional() with the
 * last argument (@c start) being the result of this function. This is
 * done so you can have "quit options", those that once called you
 * want to exit without doing further parsing, as is the case with
 * help, license, copyright, version and eventually others you may
 * define.
 *
 * @param parser Description of how to work.
 * @param values Where to store values, it is assumed that this is a vector
 *        of the same size as @c parser->descs. Values should be previously
 *        initialized.
 * @param argc How many elements in @a argv. If not provided it will be
 *        retrieved with ecore_app_args_get().
 * @param argv Command line parameters.
 *
 * @return Index of first non-option parameter or @c -1 on error.
 *
 * @see ecore_getopt_parse_positional()
  }
(* Const before type ignored *)
function ecore_getopt_parse(parser:PEcore_Getopt; values:PEcore_Getopt_Value; argc:longint; argv:PPchar):longint;cdecl;external;
{*
 * Parses command line positional parameters.
 *
 * Walks the command line positional parameters (those that do not
 * start with "-" or "--") and parse them based on @a parser
 * description, doing actions based on @c parser->descs->action, like
 * storing values of some type.
 *
 * It is expected that @a values is of the same size than @c
 * parser->descs, same as with ecore_getopt_parse().
 *
 * All values are expected to be initialized before use.
 *
 * Unlike the ecore_getopt_parse(), only the following options are
 * supported:
 *  - @c ECORE_GETOPT_ACTION_STORE
 *  - @c ECORE_GETOPT_ACTION_CHOICE
 *  - @c ECORE_GETOPT_ACTION_APPEND
 *  - @c ECORE_GETOPT_ACTION_CALLBACK
 *
 * There is a special case for @c ECORE_GETOPT_ACTION_APPEND as it
 * will consume all remaining elements. It is also special in the
 * sense that it will allocate memory and thus need to be freed. For
 * consistency between all of appended subtypes, @c eina_list->data
 * will contain an allocated memory with the value, that is, for @c
 * ECORE_GETOPT_TYPE_STR it will contain a copy of the argument, @c
 * ECORE_GETOPT_TYPE_INT a pointer to an allocated integer and so on.
 *
 * If parser is in strict mode (see @c Ecore_Getopt->strict), then any
 * error will abort parsing and @c -1 is returned. Otherwise it will try
 * to continue as far as possible.
 *
 * Translation of help strings (description) and metavar may be done,
 * standard/global gettext() call will be applied on them if ecore was
 * compiled with such support.
 *
 * @param parser Description of how to work.
 * @param values Where to store values, it is assumed that this is a vector
 *        of the same size as @c parser->descs. Values should be previously
 *        initialized.
 * @param argc How many elements in @a argv. If not provided it will be
 *        retrieved with ecore_app_args_get().
 * @param argv Command line parameters.
 * @param start The initial position argument to look at, usually the
 *        return of ecore_getopt_parse(). If less than 1, will try to
 *        find it automatically.
 *
 * @return Index of first non-option parameter or @c -1 on error. If the
 *         last positional argument is of action @c
 *         ECORE_GETOPT_ACTION_APPEND then it will be the same as @a argc.
  }
(* Const before type ignored *)
function ecore_getopt_parse_positional(parser:PEcore_Getopt; values:PEcore_Getopt_Value; argc:longint; argv:PPchar; start:longint):longint;cdecl;external;
{*
 * Utilities to free list and nodes allocated by @a ECORE_GETOPT_ACTION_APPEND.
 *
 * @param list Pointer to list to be freed.
 * @return always @c NULL, so you can easily make your list head @c NULL.
  }
function ecore_getopt_list_free(list:PEina_List):PEina_List;cdecl;external;
{*
 * Helper ecore_getopt callback to parse geometry (x:y:w:h).
 *
 * @param parser This parameter isn't in use.
 * @param desc This parameter isn't in use.
 * @param str Geometry value
 * @param data This parameter isn't in use.
 * @param storage Must be a pointer to @c Eina_Rectangle and will be used to
 * store the four values passed in the given string.
 * @return @c EINA_TRUE on success, @c EINA_FALSE on incorrect geometry value.
 *
 * This is a helper function to be used with ECORE_GETOPT_CALLBACK_*().
 *
 * @c callback_data value is ignored, you can safely use @c NULL.
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function ecore_getopt_callback_geometry_parse(parser:PEcore_Getopt; desc:PEcore_Getopt_Desc; str:Pchar; data:pointer; storage:PEcore_Getopt_Value):TEina_Bool;cdecl;external;
{*
 * Helper ecore_getopt callback to parse geometry size (WxH).
 *
 * @param parser This parameter isn't in use.
 * @param desc This parameter isn't in use.
 * @param str size value
 * @param data This parameter isn't in use.
 * @param storage Must be a pointer to @c Eina_Rectangle and will be used to
 * store the two values passed in the given string and @c 0 in the x and y
 * fields.
 * @return @c EINA_TRUE on success, @c EINA_FALSE on incorrect size value.
 *
 * @c callback_data value is ignored, you can safely use @c NULL.
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function ecore_getopt_callback_size_parse(parser:PEcore_Getopt; desc:PEcore_Getopt_Desc; str:Pchar; data:pointer; storage:PEcore_Getopt_Value):TEina_Bool;cdecl;external;
{$endif}
{ _ECORE_GETOPT_H  }

implementation

function strict(var a : TEcore_Getopt) : TEina_Bool;
begin
  strict:=(a.flag0 and bm_TEcore_Getopt_strict) shr bp_TEcore_Getopt_strict;
end;

procedure set_strict(var a : TEcore_Getopt; __strict : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__strict shl bp_TEcore_Getopt_strict) and bm_TEcore_Getopt_strict);
end;


end.
