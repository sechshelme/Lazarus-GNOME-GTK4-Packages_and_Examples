
unit Eolian;
interface

{
  Automatically converted by H2Pas 1.0.0 from Eolian.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    Eolian.h
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
PEina_Iterator  = ^Eina_Iterator;
PEina_List  = ^Eina_List;
PEina_Stringshare  = ^Eina_Stringshare;
PEolian_Binary_Operator  = ^Eolian_Binary_Operator;
PEolian_Class  = ^Eolian_Class;
PEolian_Class_Type  = ^Eolian_Class_Type;
PEolian_Constant  = ^Eolian_Constant;
PEolian_Constructor  = ^Eolian_Constructor;
PEolian_Doc_Token  = ^Eolian_Doc_Token;
PEolian_Doc_Token_Type  = ^Eolian_Doc_Token_Type;
PEolian_Documentation  = ^Eolian_Documentation;
PEolian_Enum_Type_Field  = ^Eolian_Enum_Type_Field;
PEolian_Error  = ^Eolian_Error;
PEolian_Event  = ^Eolian_Event;
PEolian_Expression  = ^Eolian_Expression;
PEolian_Expression_Mask  = ^Eolian_Expression_Mask;
PEolian_Expression_Type  = ^Eolian_Expression_Type;
PEolian_Function  = ^Eolian_Function;
PEolian_Function_Parameter  = ^Eolian_Function_Parameter;
PEolian_Function_Type  = ^Eolian_Function_Type;
PEolian_Implement  = ^Eolian_Implement;
PEolian_Object  = ^Eolian_Object;
PEolian_Object_Scope  = ^Eolian_Object_Scope;
PEolian_Object_Type  = ^Eolian_Object_Type;
PEolian_Parameter_Direction  = ^Eolian_Parameter_Direction;
PEolian_Part  = ^Eolian_Part;
PEolian_State  = ^Eolian_State;
PEolian_Struct_Type_Field  = ^Eolian_Struct_Type_Field;
PEolian_Type  = ^Eolian_Type;
PEolian_Type_Builtin_Type  = ^Eolian_Type_Builtin_Type;
PEolian_Type_Type  = ^Eolian_Type_Type;
PEolian_Typedecl  = ^Eolian_Typedecl;
PEolian_Typedecl_Type  = ^Eolian_Typedecl_Type;
PEolian_Unary_Operator  = ^Eolian_Unary_Operator;
PEolian_Unit  = ^Eolian_Unit;
PEolian_Value  = ^Eolian_Value;
PEolian_Value_Union  = ^Eolian_Value_Union;
Ptype  = ^type;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef EOLIAN_H}
{$define EOLIAN_H}
{$include "extern.h"}
{ C++ extern C conditionnal removed }
{$include <Eina.h>}
{*
 * @page eolian_main Eolian
 *
 * @date 2014 (created)
 *
 * @section eolian_toc Table of Contents
 *
 * @li @ref eolian_main_intro
 * @li @ref eolian_main_compiling
 * @li @ref eolian_main_next_steps
 *
 * @section eolian_main_intro Introduction
 *
 * The Eolian EO file parser and code generator.

 * @section eolian_main_compiling How to compile
 *
 * Eolian is a library your application links to. The procedure for this is
 * very simple. You simply have to compile your application with the
 * appropriate compiler flags that the @c pkg-config script outputs. For
 * example:
 *
 * Compiling C or C++ files into object files:
 *
 * @verbatim
   gcc -c -o main.o main.c `pkg-config --cflags eolian`
   @endverbatim
 *
 * Linking object files into a binary executable:
 *
 * @verbatim
   gcc -o my_application main.o `pkg-config --libs eolian`
   @endverbatim
 *
 * See @ref pkgconfig
 *
 * @section eolian_main_next_steps Next Steps
 *
 * After you understood what Eolian is and installed it in your system
 * you should proceed understanding the programming interface.
 *
 * Recommended reading:
 *
 * @li @ref Eolian
 *
 * @addtogroup Eolian
 * @
  }
{ The maximum format version supported by this version of Eolian  }

const
  EOLIAN_FILE_FORMAT_VERSION = 1;  
{ State information
 *
 * Possible to cast to Eolian_Unit and use as such, as this represents
 * a master unit as well as other state.
 *
 * @ingroup Eolian
  }
type
{ Any Eolian object
 *
 * @see Eolian_Object_Type
 *
 * @ingroup Eolian
  }
{ Class type used to extract information on classes
 *
 * @ingroup Eolian
  }
{ Function Id used to extract information on class functions
 *
 * @ingroup Eolian
  }
{ Part information
 *
 * @ingroup Eolian
  }
{ Parameter/return type.
 *
 * @ingroup Eolian
  }
{ Type declaration.
 *
 * @ingroup Eolian
  }
{ Class function parameter information
 *
 * @ingroup Eolian
  }
{ Class implement information
 *
 * @ingroup Eolian
  }
{ Class constructor information
 *
 * @ingroup Eolian
  }
{ Event information
 *
 * @ingroup Eolian
  }
{ Expression information
 *
 * @ingroup Eolian
  }
{ Constant information
 *
 * @ingroup Eolian
  }
{ Error information
 *
 * @ingroup Eolian
  }
{ Struct field information
 *
 * @ingroup Eolian
  }
{ Enum field information
 *
 * @ingroup Eolian
  }
{ Documentation information
 *
 * @ingroup Eolian
  }
{ Unit information
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
{ was #define dname(params) para_def_expr }
{ argument types are unknown }

function EOLIAN_CAST(_type,expr : longint) : Ptype;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function EOLIAN_OBJECT(expr : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function EOLIAN_UNIT(expr : longint) : longint;

(* Const before type ignored *)
type

  TEolian_Panic_Cb = procedure (state:PEolian_State; msg:PEina_Stringshare);cdecl;
(* Const before type ignored *)
(* Const before type ignored *)

  TEolian_Error_Cb = procedure (obj:PEolian_Object; msg:Pchar; data:pointer);cdecl;

  PEolian_Object_Type = ^TEolian_Object_Type;
  TEolian_Object_Type =  Longint;
  Const
    EOLIAN_OBJECT_UNKNOWN = 0;
    EOLIAN_OBJECT_CLASS = 1;
    EOLIAN_OBJECT_TYPEDECL = 2;
    EOLIAN_OBJECT_STRUCT_FIELD = 3;
    EOLIAN_OBJECT_ENUM_FIELD = 4;
    EOLIAN_OBJECT_TYPE = 5;
    EOLIAN_OBJECT_CONSTANT = 6;
    EOLIAN_OBJECT_EXPRESSION = 7;
    EOLIAN_OBJECT_FUNCTION = 8;
    EOLIAN_OBJECT_FUNCTION_PARAMETER = 9;
    EOLIAN_OBJECT_EVENT = 10;
    EOLIAN_OBJECT_PART = 11;
    EOLIAN_OBJECT_IMPLEMENT = 12;
    EOLIAN_OBJECT_CONSTRUCTOR = 13;
    EOLIAN_OBJECT_DOCUMENTATION = 14;
    EOLIAN_OBJECT_ERROR = 15;
;
type
  PEolian_Function_Type = ^TEolian_Function_Type;
  TEolian_Function_Type =  Longint;
  Const
    EOLIAN_UNRESOLVED = 0;
    EOLIAN_PROPERTY = 1;
    EOLIAN_PROP_SET = 2;
    EOLIAN_PROP_GET = 3;
    EOLIAN_METHOD = 4;
    EOLIAN_FUNCTION_POINTER = 5;
;
type
  PEolian_Parameter_Direction = ^TEolian_Parameter_Direction;
  TEolian_Parameter_Direction =  Longint;
  Const
    EOLIAN_PARAMETER_UNKNOWN = 0;
    EOLIAN_PARAMETER_IN = 1;
    EOLIAN_PARAMETER_OUT = 2;
    EOLIAN_PARAMETER_INOUT = 3;
;
type
  PEolian_Class_Type = ^TEolian_Class_Type;
  TEolian_Class_Type =  Longint;
  Const
    EOLIAN_CLASS_UNKNOWN_TYPE = 0;
    EOLIAN_CLASS_REGULAR = 1;
    EOLIAN_CLASS_ABSTRACT = 2;
    EOLIAN_CLASS_MIXIN = 3;
    EOLIAN_CLASS_INTERFACE = 4;
;
type
  PEolian_Object_Scope = ^TEolian_Object_Scope;
  TEolian_Object_Scope =  Longint;
  Const
    EOLIAN_SCOPE_UNKNOWN = 0;
    EOLIAN_SCOPE_PUBLIC = 1;
    EOLIAN_SCOPE_PRIVATE = 2;
    EOLIAN_SCOPE_PROTECTED = 3;
;
type
  PEolian_Typedecl_Type = ^TEolian_Typedecl_Type;
  TEolian_Typedecl_Type =  Longint;
  Const
    EOLIAN_TYPEDECL_UNKNOWN = 0;
    EOLIAN_TYPEDECL_STRUCT = 1;
    EOLIAN_TYPEDECL_STRUCT_OPAQUE = 2;
    EOLIAN_TYPEDECL_ENUM = 3;
    EOLIAN_TYPEDECL_ALIAS = 4;
    EOLIAN_TYPEDECL_FUNCTION_POINTER = 5;
;
{$ifdef EFL_BETA_API_SUPPORT}
{$endif}
type
  PEolian_Type_Type = ^TEolian_Type_Type;
  TEolian_Type_Type =  Longint;
  Const
    EOLIAN_TYPE_UNKNOWN_TYPE = 0;
    EOLIAN_TYPE_VOID = 1;
    EOLIAN_TYPE_REGULAR = 2;
    EOLIAN_TYPE_CLASS = 3;
    EOLIAN_TYPE_ERROR = 4;
    EOLIAN_TYPE_UNDEFINED = 5;
;
{$ifdef EFL_BETA_API_SUPPORT}
{$else}
{ Placeholder when using release API only. Done to prevent offsetting the value below. }
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{$endif}
type
  PEolian_Type_Builtin_Type = ^TEolian_Type_Builtin_Type;
  TEolian_Type_Builtin_Type =  Longint;
  Const
    EOLIAN_TYPE_BUILTIN_INVALID = 0;
    EOLIAN_TYPE_BUILTIN_BYTE = 1;
    EOLIAN_TYPE_BUILTIN_UBYTE = 2;
    EOLIAN_TYPE_BUILTIN_CHAR = 3;
    EOLIAN_TYPE_BUILTIN_SHORT = 4;
    EOLIAN_TYPE_BUILTIN_USHORT = 5;
    EOLIAN_TYPE_BUILTIN_INT = 6;
    EOLIAN_TYPE_BUILTIN_UINT = 7;
    EOLIAN_TYPE_BUILTIN_LONG = 8;
    EOLIAN_TYPE_BUILTIN_ULONG = 9;
    EOLIAN_TYPE_BUILTIN_LLONG = 10;
    EOLIAN_TYPE_BUILTIN_ULLONG = 11;
    EOLIAN_TYPE_BUILTIN_INT8 = 12;
    EOLIAN_TYPE_BUILTIN_UINT8 = 13;
    EOLIAN_TYPE_BUILTIN_INT16 = 14;
    EOLIAN_TYPE_BUILTIN_UINT16 = 15;
    EOLIAN_TYPE_BUILTIN_INT32 = 16;
    EOLIAN_TYPE_BUILTIN_UINT32 = 17;
    EOLIAN_TYPE_BUILTIN_INT64 = 18;
    EOLIAN_TYPE_BUILTIN_UINT64 = 19;
    EOLIAN_TYPE_BUILTIN_INT128 = 20;
    EOLIAN_TYPE_BUILTIN_UINT128 = 21;
    EOLIAN_TYPE_BUILTIN_SIZE = 22;
    EOLIAN_TYPE_BUILTIN_SSIZE = 23;
    EOLIAN_TYPE_BUILTIN_INTPTR = 24;
    EOLIAN_TYPE_BUILTIN_UINTPTR = 25;
    EOLIAN_TYPE_BUILTIN_PTRDIFF = 26;
    EOLIAN_TYPE_BUILTIN_TIME = 27;
    EOLIAN_TYPE_BUILTIN_FLOAT = 28;
    EOLIAN_TYPE_BUILTIN_DOUBLE = 29;
    EOLIAN_TYPE_BUILTIN_BOOL = 30;
    EOLIAN_TYPE_BUILTIN_SLICE = 31;
    EOLIAN_TYPE_BUILTIN_RW_SLICE = 32;
    EOLIAN_TYPE_BUILTIN_VOID = 33;
    EOLIAN_TYPE_BUILTIN_ACCESSOR = 34;
    EOLIAN_TYPE_BUILTIN_ARRAY = 35;
    EOLIAN_TYPE_BUILTIN_FUTURE = 36;
    EOLIAN_TYPE_BUILTIN_ITERATOR = 37;
    EOLIAN_TYPE_BUILTIN_LIST = 38;
    EOLIAN_TYPE_BUILTIN_BETA_PLACEHOLDER1 = 39;
    EOLIAN_TYPE_BUILTIN_ANY_VALUE = 40;
    EOLIAN_TYPE_BUILTIN_ANY_VALUE_REF = 41;
    EOLIAN_TYPE_BUILTIN_BINBUF = 42;
    EOLIAN_TYPE_BUILTIN_EVENT = 43;
    EOLIAN_TYPE_BUILTIN_MSTRING = 44;
    EOLIAN_TYPE_BUILTIN_STRING = 45;
    EOLIAN_TYPE_BUILTIN_STRINGSHARE = 46;
    EOLIAN_TYPE_BUILTIN_STRBUF = 47;
    EOLIAN_TYPE_BUILTIN_HASH = 48;
    EOLIAN_TYPE_BUILTIN_VOID_PTR = 49;
;
type
  PEolian_Expression_Type = ^TEolian_Expression_Type;
  TEolian_Expression_Type =  Longint;
  Const
    EOLIAN_EXPR_UNKNOWN = 0;
    EOLIAN_EXPR_INT = 1;
    EOLIAN_EXPR_UINT = 2;
    EOLIAN_EXPR_LONG = 3;
    EOLIAN_EXPR_ULONG = 4;
    EOLIAN_EXPR_LLONG = 5;
    EOLIAN_EXPR_ULLONG = 6;
    EOLIAN_EXPR_FLOAT = 7;
    EOLIAN_EXPR_DOUBLE = 8;
    EOLIAN_EXPR_STRING = 9;
    EOLIAN_EXPR_CHAR = 10;
    EOLIAN_EXPR_NULL = 11;
    EOLIAN_EXPR_BOOL = 12;
    EOLIAN_EXPR_NAME = 13;
    EOLIAN_EXPR_UNARY = 14;
    EOLIAN_EXPR_BINARY = 15;
;
type
  PEolian_Expression_Mask = ^TEolian_Expression_Mask;
  TEolian_Expression_Mask =  Longint;
  Const
    EOLIAN_MASK_SINT = 1 shl 0;
    EOLIAN_MASK_UINT = 1 shl 1;
    EOLIAN_MASK_INT = EOLIAN_MASK_SINT or EOLIAN_MASK_UINT;
    EOLIAN_MASK_FLOAT = 1 shl 2;
    EOLIAN_MASK_BOOL = 1 shl 3;
    EOLIAN_MASK_STRING = 1 shl 4;
    EOLIAN_MASK_CHAR = 1 shl 5;
    EOLIAN_MASK_NULL = 1 shl 6;
    EOLIAN_MASK_SIGNED = EOLIAN_MASK_SINT or EOLIAN_MASK_FLOAT;
    EOLIAN_MASK_NUMBER = EOLIAN_MASK_INT or EOLIAN_MASK_FLOAT;
    EOLIAN_MASK_ALL = (((EOLIAN_MASK_NUMBER or EOLIAN_MASK_BOOL) or EOLIAN_MASK_STRING) or EOLIAN_MASK_CHAR) or EOLIAN_MASK_NULL;
;
(* Const before type ignored *)
type
  PEolian_Value_Union = ^TEolian_Value_Union;
  TEolian_Value_Union = record
      case longint of
        0 : ( c : char );
        1 : ( b : TEina_Bool );
        2 : ( s : Pchar );
        3 : ( i : longint );
        4 : ( u : dword );
        5 : ( l : longint );
        6 : ( ul : dword );
        7 : ( ll : int64 );
        8 : ( ull : qword );
        9 : ( f : single );
        10 : ( d : Tdouble );
      end;

  PEolian_Value = ^TEolian_Value;
  TEolian_Value = record
      _type : TEolian_Expression_Type;
      value : TEolian_Value_Union;
    end;
{ + int, float  }
{ - int, float  }
{ * int, float  }
{ / int, float  }
{ % int  }
{ == all types  }
{ != all types  }
{ >  int, float  }
{ <  int, float  }
{ >= int, float  }
{ <= int, float  }
{ && all types  }
{ || all types  }
{ &  int  }
{ |  int  }
{ ^  int  }
{ << int  }
{ >> int  }

  PEolian_Binary_Operator = ^TEolian_Binary_Operator;
  TEolian_Binary_Operator =  Longint;
  Const
    EOLIAN_BINOP_INVALID = 0;
    EOLIAN_BINOP_ADD = 1;
    EOLIAN_BINOP_SUB = 2;
    EOLIAN_BINOP_MUL = 3;
    EOLIAN_BINOP_DIV = 4;
    EOLIAN_BINOP_MOD = 5;
    EOLIAN_BINOP_EQ = 6;
    EOLIAN_BINOP_NQ = 7;
    EOLIAN_BINOP_GT = 8;
    EOLIAN_BINOP_LT = 9;
    EOLIAN_BINOP_GE = 10;
    EOLIAN_BINOP_LE = 11;
    EOLIAN_BINOP_AND = 12;
    EOLIAN_BINOP_OR = 13;
    EOLIAN_BINOP_BAND = 14;
    EOLIAN_BINOP_BOR = 15;
    EOLIAN_BINOP_BXOR = 16;
    EOLIAN_BINOP_LSH = 17;
    EOLIAN_BINOP_RSH = 18;
;
{ - sint  }
{ + sint  }
{ ! int, float, bool  }
{ ~ int  }
type
  PEolian_Unary_Operator = ^TEolian_Unary_Operator;
  TEolian_Unary_Operator =  Longint;
  Const
    EOLIAN_UNOP_INVALID = 0;
    EOLIAN_UNOP_UNM = 1;
    EOLIAN_UNOP_UNP = 2;
    EOLIAN_UNOP_NOT = 3;
    EOLIAN_UNOP_BNOT = 4;
;
type
  PEolian_Doc_Token_Type = ^TEolian_Doc_Token_Type;
  TEolian_Doc_Token_Type =  Longint;
  Const
    EOLIAN_DOC_TOKEN_UNKNOWN = 0;
    EOLIAN_DOC_TOKEN_TEXT = 1;
    EOLIAN_DOC_TOKEN_REF = 2;
    EOLIAN_DOC_TOKEN_MARK_NOTE = 3;
    EOLIAN_DOC_TOKEN_MARK_WARNING = 4;
    EOLIAN_DOC_TOKEN_MARK_REMARK = 5;
    EOLIAN_DOC_TOKEN_MARK_TODO = 6;
    EOLIAN_DOC_TOKEN_MARKUP_MONOSPACE = 7;
;
(* Const before type ignored *)
type
  PEolian_Doc_Token = ^TEolian_Doc_Token;
  TEolian_Doc_Token = record
      _type : TEolian_Doc_Token_Type;
      text : Pchar;
      text_end : Pchar;
    end;
{
 * @brief Init Eolian.
 *
 * @ingroup Eolian
  }

function eolian_init:longint;cdecl;external;
{
 * @brief Shutdown Eolian.
 *
 * @ingroup Eolian
  }
function eolian_shutdown:longint;cdecl;external;
{
 * @brief Get the Eolian file format version.
 *
 * This is the same as the #EOLIAN_FILE_FORMAT_VERSION macro, but allows
 * retrieval of the version at runtime, so it can be used by FFI based
 * bindings in dynamic languages to do runtime checks and so on.
  }
function eolian_file_format_version_get:word;cdecl;external;
{
 * @brief Create a new Eolian state.
 *
 * This creates a new Eolian state that consists of a "master unit" with
 * the same address (therefore, you can cast it to Eolian_Unit) plus extra
 * state information.
 *
 * You need to free this with eolian_free once you're done.
 *
 * This will assign a default panic function, which printers the error
 * message passed to it into the standard Eolian log.
 *
 * @see eolian_state_panic_cb_set
 *
 * @return A new state (or NULL on failure).
 *
 * @ingroup Eolian
  }
function eolian_state_new:PEolian_State;cdecl;external;
{
 * @brief Free an Eolian state.
 *
 * You can use this to free an Eolian state.
 *
 * If the input is NULL, this function has no effect.
 *
 * @param[in] state the state to free
 *
  }
procedure eolian_state_free(state:PEolian_State);cdecl;external;
{
 * @brief Set the panic function for the state.
 *
 * When an unrecoverable error happens in an Eolian API call, the panic
 * function is called. The default panic function for a state just prints
 * the error message into the standard Eolian log. After the panic function
 * is called, Eolian forcibly exits (`exit(EXIT_FAILURE)`). If you don't
 * want this, you can override the panic function and never return from
 * it (by doing a long jump, or throwing an exception in C++).
 *
 * Unrecoverable errors include cases such as internal errors and memory
 * allocation failures. Standard parse errors etc. are not considered
 * unrecoverable, so they are not handled using the panic mechanism.
 *
 * After a panic, the Eolian state is left valid; the library does its
 * best at trying to provide it back to you in the same condition as it
 * was before the failing call.
 *
 * If you set a panic function and jump, you're responsible for the error
 * message and have to delete it with eina_stringshare_del.
 *
 * If you want to catch error messages that are standard (such as parse
 * errors), there is another, separate mechanism in place.
 *
 * @return The old panic callback.
 *
 * @see eolian_state_error_cb_set
  }
function eolian_state_panic_cb_set(state:PEolian_State; cb:TEolian_Panic_Cb):TEolian_Panic_Cb;cdecl;external;
{
 * @brief Set the error function for the state.
 *
 * When a regular error (such as parse error) happens, you can use this
 * callback to catch the error. There is no jump involved and the outer
 * function will fail normally and safely. You are provided with the
 * object the error happened on (for line/column/file/other information)
 * as well as the error message. Additionally, a data pointer is passed
 * in so you can pass some of the information into local memory somewhere.
 *
 * @return The old error callback.
 *
 * @see eolian_state_panic_cb_set
 * @see eolian_state_error_data_set
  }
function eolian_state_error_cb_set(state:PEolian_State; cb:TEolian_Error_Cb):TEolian_Error_Cb;cdecl;external;
{
 * @brief Set a data pointer to be passed to the error function.
 *
 * By default, the data is `NULL`. You can use this to set a data pointer
 * to be passed. This is useful to e.g. expose some local memory so you can
 * write back from the callback without using globals.
 *
 * @return The old data pointer.
 *
 * @see eolian_state_error_cb_set
  }
function eolian_state_error_data_set(state:PEolian_State; data:pointer):pointer;cdecl;external;
{
 * @brief Get the type of an Eolian object.
 *
 * Most handles returned by Eolian somewhere are Eolian_Objects. You can cast
 * them to Eolian_Object, store or manipulate them and then use this function
 * to check their type in order to for example cast it back.
 *
 * @see eolian_object_unit_get
 * @see eolian_object_file_get
 * @see eolian_object_line_get
 * @see eolian_object_column_get
 * @see eolian_object_name_get
 * @see eolian_object_c_name_get
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
function eolian_object_type_get(obj:PEolian_Object):TEolian_Object_Type;cdecl;external;
{
 * @brief Get the unit the object comes from.
 *
 * This returns the unit the object is located in.
 *
 * @see eolian_object_file_get
 * @see eolian_object_type_get
 * @see eolian_object_line_get
 * @see eolian_object_column_get
 * @see eolian_object_name_get
 * @see eolian_object_c_name_get
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eolian_object_unit_get(obj:PEolian_Object):PEolian_Unit;cdecl;external;
{
 * @brief Get the name of the file the object comes from.
 *
 * This returns the name of the file the object was declared in. It's not
 * a full path, just the file name.
 *
 * @see eolian_object_unit_get
 * @see eolian_object_type_get
 * @see eolian_object_line_get
 * @see eolian_object_column_get
 * @see eolian_object_name_get
 * @see eolian_object_c_name_get
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eolian_object_file_get(obj:PEolian_Object):Pchar;cdecl;external;
{
 * @brief Get the line the object was declared at.
 *
 * This returns the line number in the file the object was declared at.
 *
 * @see eolian_object_unit_get
 * @see eolian_object_type_get
 * @see eolian_object_file_get
 * @see eolian_object_column_get
 * @see eolian_object_name_get
 * @see eolian_object_c_name_get
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
function eolian_object_line_get(obj:PEolian_Object):longint;cdecl;external;
{
 * @brief Get the column the object was declared at.
 *
 * This returns the column number in the file the object was declared at,
 * that means which character on the line. It is Unicode-aware, Eolian
 * assumes all input files are encoded in UTF-8, so this is really the
 * code point number, not the byte number.
 *
 * @see eolian_object_unit_get
 * @see eolian_object_type_get
 * @see eolian_object_file_get
 * @see eolian_object_line_get
 * @see eolian_object_name_get
 * @see eolian_object_c_name_get
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
function eolian_object_column_get(obj:PEolian_Object):longint;cdecl;external;
{
 * @brief Get the name of an object.
 *
 * This name is the full name of the object, if named at all.
 * For toplevel file declarations, this will be the fully namespaced
 * name, for things like params this will be just the name itself.
 *
 * @see eolian_object_unit_get
 * @see eolian_object_type_get
 * @see eolian_object_file_get
 * @see eolian_object_line_get
 * @see eolian_object_column_get
 * @see eolian_object_short_name_get
 * @see eolian_object_namespaces_get
 * @see eolian_object_c_name_get
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eolian_object_name_get(obj:PEolian_Object):Pchar;cdecl;external;
{
 * @brief Get the C name of an object.
 *
 * This is the full name, but for C. It is typically derived from the
 * regular full name, with namespaces flattened to underscores, but
 * some things may be explicitly renamed. Only classes, types (both
 * declarations and instances) and constants have C names, as others
 * are never referred to by name directly in C.
 *
 * @see eolian_object_unit_get
 * @see eolian_object_type_get
 * @see eolian_object_file_get
 * @see eolian_object_line_get
 * @see eolian_object_column_get
 * @see eolian_object_short_name_get
 * @see eolian_object_namespaces_get
 * @see eolian_object_name_get
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eolian_object_c_name_get(obj:PEolian_Object):Pchar;cdecl;external;
{
 * @brief Get the short name of an object.
 *
 * This means a name without namespaces. If the object's name is not
 * namespaced in the first place, this is equivalent to getting the full name.
 * So for `Foo.Bar.baz` this is `baz`, for `foo` it's again just `foo`.
 *
 * @see eolian_object_name_get
 * @see eolian_object_namespaces_get
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eolian_object_short_name_get(obj:PEolian_Object):Pchar;cdecl;external;
{
 * @brief Get a list of namespaces for the object.
 *
 * Each item of the iterator is the next more inner namespace. So for
 * example if the full name is `Foo.Bar.baz`, the iterator will first
 * give you `Foo` and then `Bar`.
 *
 * @see eolian_object_name_get
 * @see eolian_object_short_name_get
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
function eolian_object_namespaces_get(obj:PEolian_Object):PEina_Iterator;cdecl;external;
{
 * @brief Get whether an object is beta.
 *
 * This applies to toplevel objects (classes, types) as well as some
 * others such as functions and events.
 *
 * @param[in] obj The object.
 * @return EINA_TRUE and EINA_FALSE respectively
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
function eolian_object_is_beta(obj:PEolian_Object):TEina_Bool;cdecl;external;
{
 * @brief Scan the given directory for .eo and .eot files.
 *
 * You need to add every directory you plan to use .eo/.eot files from.
 * The directory is scanned recursively, so all of its sub-directories
 * are also added.
 *
 * @param[in] state The Eolian state.
 * @param[in] dir the directory to scan
 * @return EINA_TRUE on success, EINA_FALSE otherwise.
 *
 * @see eolian_state_system_directory_add
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
function eolian_state_directory_add(state:PEolian_State; dir:Pchar):TEina_Bool;cdecl;external;
{
 * @brief Scan the system directory for .eo and .eot files.
 *
 * This is just like eolian_state_directory_add, except it uses the system
 * directory. The system directory is determined from the prefix of the
 * Eolian library. Typically it tends to be $PREFIX/share/eolian.
 *
 * @param[in] state The Eolian state.
 *
 * @return EINA_TRUE on success, EINA_FALSE otherwise.
 *
 * @see eolian_state_directory_add
 *
 * @ingroup Eolian
  }
function eolian_state_system_directory_add(state:PEolian_State):TEina_Bool;cdecl;external;
{
 * @brief Get an iterator to all .eo file names with paths.
 *
 * @param[in] state The Eolian state.
 *
 * @see eolian_state_eo_files_get
 * @see eolian_state_eot_file_paths_get
 * @see eolian_state_eot_files_get
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
function eolian_state_eo_file_paths_get(state:PEolian_State):PEina_Iterator;cdecl;external;
{
 * @brief Get an iterator to all .eot file names with paths.
 *
 * @param[in] state The Eolian state.
 *
 * @see eolian_state_eo_files_get
 * @see eolian_state_eo_file_paths_get
 * @see eolian_state_eot_files_get
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
function eolian_state_eot_file_paths_get(state:PEolian_State):PEina_Iterator;cdecl;external;
{
 * @brief Get an iterator to all .eo file names (without paths).
 *
 * @param[in] state The Eolian state.
 *
 * @see eolian_state_eo_file_paths_get
 * @see eolian_state_eot_file_paths_get
 * @see eolian_state_eot_files_get
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
function eolian_state_eo_files_get(state:PEolian_State):PEina_Iterator;cdecl;external;
{
 * @brief Get an iterator to all .eot file names (without paths).
 *
 * @param[in] state The Eolian state.
 *
 * @see eolian_state_eo_file_paths_get
 * @see eolian_stete_eot_file_paths_get
 * @see eolian_state_eo_files_get
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
function eolian_state_eot_files_get(state:PEolian_State):PEina_Iterator;cdecl;external;
{
 * @brief Parse the given .eo or .eot file and fill the database.
 *
 * The input must be a file name from a directory that was previously
 * scanned with eolian_state_directory_add().
 *
 * @param[in] state The Eolian state.
 * @param[in] filename The name of the file to parse.
 * @return The unit corresponding to the parsed file or NULL.
 *
 * @see eolian_state_directory_add
 * @see eolian_state_file_path_parse
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eolian_state_file_parse(state:PEolian_State; filename:Pchar):PEolian_Unit;cdecl;external;
{
 * @brief Parse the given .eo or .eot file and fill the database.
 *
 * The input is a file path. Its directory is scanned first, and then
 * the file itself is parsed and a unit handle is returned.
 *
 * @param[in] state The Eolian state.
 * @param[in] filepath Path to the file to parse.
 * @return The unit corresponding to the parsed file or NULL.
 *
 * @see eolian_state_directory_add
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eolian_state_file_path_parse(state:PEolian_State; filepath:Pchar):PEolian_Unit;cdecl;external;
{
 * @brief Parse all known eo files.
 *
 * @param[in] state The Eolian state.
 *
 * @return EINA_TRUE on success, EINA_FALSE otherwise.
 *
 * @see eolian_state_directory_add
 * @see eolian_state_all_eot_files_parse
 *
 * @ingroup Eolian
  }
function eolian_state_all_eo_files_parse(state:PEolian_State):TEina_Bool;cdecl;external;
{
 * @brief Parse all known eot files.
 *
 * @param[in] state The Eolian state.
 *
 * @return EINA_TRUE on success, EINA_FALSE otherwise.
 *
 * @see eolian_state_directory_add
 * @see eolian_state_all_eo_files_parse
 *
 * @ingroup Eolian
  }
function eolian_state_all_eot_files_parse(state:PEolian_State):TEina_Bool;cdecl;external;
{
 * @brief Perform additional checks on the state.
 *
 * This function performs additional checks that aren't crucial for the
 * database integrity (that's checked as a part of the regular parse process,
 * so the database is guaranteed to be valid), but are important for proper
 * correctness. It is recommended that all available .eot and .eo files are
 * parsed when running this.
 *
 * The set of available checks will expand over time.
 *
 * @return EINA_TRUE on success, EINA_FALSE otherwise.
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
function eolian_state_check(state:PEolian_State):TEina_Bool;cdecl;external;
{
 * @brief Get an Eolian unit by file name.
 *
 * For any .eo or .eot file (must be within a directory previously scanned
 * by eolian_state_directory_add or eolian_state_system_directory_add), get
 * its corresponding unit.
 *
 * This only works if the file has been previously parsed.
 *
 * @param[in] state The Eolian state.
 * @param[in] file The file name.
 *
 * @see eolian_state_units_get
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function eolian_state_unit_by_file_get(state:PEolian_State; file_name:Pchar):PEolian_Unit;cdecl;external;
{
 * @brief Get an iterator to all Eolian units in a state.
 *
 * This means units of all files that have been parsed so far.
 *
 * @param[in] state The Eolian state.
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
function eolian_state_units_get(state:PEolian_State):PEina_Iterator;cdecl;external;
{
 * @brief Get the state associated with the unit.
 *
 * Technically you can cast away the const to make the state mutable
 * again, it's the same pointer after all. But this is considered a
 * bad practice, because you're only supposed to use mutable objects
 * at the very beginning and then just read.
 *
 * @param[in] unit The unit.
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eolian_unit_state_get(unit:PEolian_Unit):PEolian_State;cdecl;external;
{
 * @brief Get the children (dependencies) of a unit.
 *
 * The iterator is obviously again to `const Eolian_Unit *`.
 *
 * @param[in] unit The unit.
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
function eolian_unit_children_get(unit:PEolian_Unit):PEina_Iterator;cdecl;external;
{
 * @brief Get the file name a unit is associated with.
 *
 * This will be `NULL` if not associated with a file (like the master unit
 * within `Eolian_State`).
 *
 * @param[in] unit The unit.
 *
 * @see eolian_unit_file_path_get
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eolian_unit_file_get(unit:PEolian_Unit):Pchar;cdecl;external;
{
 * @brief Get the full file path a unit is associated with.
 *
 * This will be `NULL` if not associated with a file (like the master unit
 * within `Eolian_State`).
 *
 * @param[in] unit The unit.
 *
 * @see eolian_unit_file_get
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eolian_unit_file_path_get(unit:PEolian_Unit):Pchar;cdecl;external;
{
 * @brief Get the version of the unit.
 *
 * This is 1 by default, unless overridden. Returns 0 when an invalid
 * unit is passed.
 *
 * @param[in] unit The unit.
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
function eolian_unit_version_get(unit:PEolian_Unit):word;cdecl;external;
{
 * @brief Get an object in a unit by name.
 *
 * Only objects declared directly within the file can be retrieved, i.e.
 * classes, typedecls and constants.
 *
 * @param[in] unit The unit.
 * @param[in] name The fully namespaced object name.
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function eolian_unit_object_by_name_get(unit:PEolian_Unit; name:Pchar):PEolian_Object;cdecl;external;
{
 * @brief Get all objects in the unit.
 *
 * The order is not necessarily the declaration order. Only objects declared
 * directly within the file can be retrieved, i.e. classes, typedecls and
 * constants.
 *
 * @param[in] unit The unit.
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
function eolian_unit_objects_get(unit:PEolian_Unit):PEina_Iterator;cdecl;external;
{
 * @brief Get a class within a unit by name.
 *
 * @param[in] unit The unit.
 * @param[in] class_name The full name of the class.
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function eolian_unit_class_by_name_get(unit:PEolian_Unit; class_name:Pchar):PEolian_Class;cdecl;external;
{
 * @brief Get an iterator to all the classes stored into a unit.
 *
 * @param[in] unit The Eolian unit.
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
function eolian_unit_classes_get(unit:PEolian_Unit):PEina_Iterator;cdecl;external;
{
 * @brief Get a constant in a unit by name.
 *
 * @param[in] unit The unit.
 * @param[in] name the name of the constant
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function eolian_unit_constant_by_name_get(unit:PEolian_Unit; name:Pchar):PEolian_Constant;cdecl;external;
{
 * @brief Get an error declaration in a unit by name.
 *
 * @param[in] unit The unit.
 * @param[in] name the name of the error
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function eolian_unit_error_by_name_get(unit:PEolian_Unit; name:Pchar):PEolian_Error;cdecl;external;
{
 * @brief Get an iterator to all constants in the Eolian database.
 *
 * @return the iterator or NULL
 *
 * Thanks to internal caching, this is an O(1) operation.
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
function eolian_unit_constants_get(unit:PEolian_Unit):PEina_Iterator;cdecl;external;
{
 * @brief Get an iterator to all error declarations in the Eolian database.
 *
 * @return the iterator or NULL
 *
 * Thanks to internal caching, this is an O(1) operation.
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
function eolian_unit_errors_get(unit:PEolian_Unit):PEina_Iterator;cdecl;external;
{
 * @brief Get an alias type declaration within a unit by name.
 *
 * @param[in] unit The unit.
 * @param[in] name The name of the alias.
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function eolian_unit_alias_by_name_get(unit:PEolian_Unit; name:Pchar):PEolian_Typedecl;cdecl;external;
{
 * @brief Get a struct declaration within a unit by name.
 *
 * @param[in] unit The unit.
 * @param[in] name The name of the alias.
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function eolian_unit_struct_by_name_get(unit:PEolian_Unit; name:Pchar):PEolian_Typedecl;cdecl;external;
{
 * @brief Get an enum declaration within a unit by name.
 *
 * @param[in] unit The unit.
 * @param[in] name The name of the alias.
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function eolian_unit_enum_by_name_get(unit:PEolian_Unit; name:Pchar):PEolian_Typedecl;cdecl;external;
{
 * @brief Get an iterator to all aliases in the Eolian database.
 *
 * @param[in] unit The unit.
 *
 * Thanks to internal caching, this is an O(1) operation.
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
function eolian_unit_aliases_get(unit:PEolian_Unit):PEina_Iterator;cdecl;external;
{
 * @brief Get an iterator to all structs in the Eolian database.
 *
 * @param[in] unit The unit.
 *
 * Thanks to internal caching, this is an O(1) operation.
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
function eolian_unit_structs_get(unit:PEolian_Unit):PEina_Iterator;cdecl;external;
{
 * @brief Get an iterator to all enums in the Eolian database.
 *
 * @param[in] unit The unit.
 *
 * Thanks to internal caching, this is an O(1) operation.
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
function eolian_unit_enums_get(unit:PEolian_Unit):PEina_Iterator;cdecl;external;
{
 * @brief A helper function to get an object in a state by name.
 *
 * @see eolian_unit_object_by_name_get
 *
 * @ingroup Eolian
  }
{
static inline const Eolian_Object *
eolian_state_object_by_name_get(const Eolian_State *state, const char *name)

   return eolian_unit_object_by_name_get(EOLIAN_UNIT(state), name);

 }
{
 * @brief Get a list of objects from a file.
 *
 * The list follows declaration order in the file. Only objects declared
 * directly within the file can be retrieved, i.e. classes, typedecls and
 * constants.
 *
 * @param[in] state The state.
 * @param[in] file_name The file name.
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eolian_state_objects_by_file_get(state:PEolian_State; file_name:Pchar):PEina_Iterator;cdecl;external;
{
 * @brief A helper function to get all objects in a state.
 *
 * @see eolian_unit_objects_get
 *
 * @ingroup Eolian
  }
{
static inline Eina_Iterator *
eolian_state_objects_get(const Eolian_State *state)

   return eolian_unit_objects_get(EOLIAN_UNIT(state));

 }
{
 * @brief A helper function to get a class in a state by name.
 *
 * @see eolian_unit_class_by_name_get
 *
 * @ingroup Eolian
  }
{
static inline const Eolian_Class *
eolian_state_class_by_name_get(const Eolian_State *state, const char *class_name)

   return eolian_unit_class_by_name_get(EOLIAN_UNIT(state), class_name);

 }
{
 * @brief Get a class within a state by file name (class_name.eo).
 *
 * @param[in] state The state.
 * @param[in] file_name The full name of the class.
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function eolian_state_class_by_file_get(state:PEolian_State; file_name:Pchar):PEolian_Class;cdecl;external;
{
 * @brief A helper function to get all classes in a state.
 *
 * @see eolian_unit_classes_get
 *
 * @ingroup Eolian
static inline Eina_Iterator *
eolian_state_classes_get(const Eolian_State *state)

   return eolian_unit_classes_get(EOLIAN_UNIT(state));

  }
{
 * @brief A helper function to get a constant in a state by name.
 *
 * @see eolian_unit_constant_by_name_get
 *
 * @ingroup Eolian
  }
{
static inline const Eolian_Constant *
eolian_state_constant_by_name_get(const Eolian_State *state, const char *name)

   return eolian_unit_constant_by_name_get(EOLIAN_UNIT(state), name);


static inline const Eolian_Error *
eolian_state_error_by_name_get(const Eolian_State *state, const char *name)

   return eolian_unit_error_by_name_get(EOLIAN_UNIT(state), name);

  }
{
 * @brief Get an iterator to all constants contained in a file.
 *
 * @param[in] state The state.
 * @param[in] file_name The file name.
 * @return the iterator or NULL
 *
 * Thanks to internal caching, this is an O(1) operation.
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eolian_state_constants_by_file_get(state:PEolian_State; file_name:Pchar):PEina_Iterator;cdecl;external;
{
 * @brief Get an iterator to all error declarations contained in a file.
 *
 * @param[in] state The state.
 * @param[in] file_name The file name.
 * @return the iterator or NULL
 *
 * Thanks to internal caching, this is an O(1) operation.
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eolian_state_errors_by_file_get(state:PEolian_State; file_name:Pchar):PEina_Iterator;cdecl;external;
{
 * @brief A helper function to get all constants in a state.
 *
 * @see eolian_unit_constants_get
 *
 * @ingroup Eolian
static inline Eina_Iterator *
eolian_state_constants_get(const Eolian_State *state)

   return eolian_unit_constants_get(EOLIAN_UNIT(state));

static inline Eina_Iterator *
eolian_state_errors_get(const Eolian_State *state)

   return eolian_unit_errors_get(EOLIAN_UNIT(state));

static inline const Eolian_Typedecl *
eolian_state_alias_by_name_get(const Eolian_State *state, const char *name)

   return eolian_unit_alias_by_name_get(EOLIAN_UNIT(state), name);

static inline const Eolian_Typedecl *
eolian_state_struct_by_name_get(const Eolian_State *state, const char *name)

   return eolian_unit_struct_by_name_get(EOLIAN_UNIT(state), name);

static inline const Eolian_Typedecl *
eolian_state_enum_by_name_get(const Eolian_State *state, const char *name)

   return eolian_unit_enum_by_name_get(EOLIAN_UNIT(state), name);

  }
{
 * @brief Get an iterator to all aliases contained in a file.
 *
 * @param[in] state The state.
 * @param[in] file_name The file name.
 *
 * Thanks to internal caching, this is an O(1) operation.
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eolian_state_aliases_by_file_get(state:PEolian_State; file_name:Pchar):PEina_Iterator;cdecl;external;
{
 * @brief Get an iterator to all named structs contained in a file.
 *
 * @param[in] state The state.
 * @param[in] file_name The file name.
 *
 * Thanks to internal caching, this is an O(1) operation.
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eolian_state_structs_by_file_get(state:PEolian_State; file_name:Pchar):PEina_Iterator;cdecl;external;
{
 * @brief Get an iterator to all enums contained in a file.
 *
 * @param[in] state The state.
 * @param[in] file_name The file name.
 *
 * Thanks to internal caching, this is an O(1) operation.
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eolian_state_enums_by_file_get(state:PEolian_State; file_name:Pchar):PEina_Iterator;cdecl;external;
{
 * @brief A helper function to get all aliases in a state.
 *
 * @see eolian_unit_aliases_get
 *
 * @ingroup Eolian
static inline Eina_Iterator *
eolian_state_aliases_get(const Eolian_State *state)

   return eolian_unit_aliases_get(EOLIAN_UNIT(state));


static inline Eina_Iterator *
eolian_state_structs_get(const Eolian_State *state)

   return eolian_unit_structs_get(EOLIAN_UNIT(state));

static inline Eina_Iterator *
eolian_state_enums_get(const Eolian_State *state)

   return eolian_unit_enums_get(EOLIAN_UNIT(state));


static inline const char *
eolian_class_name_get(const Eolian_Class *klass)

   return eolian_object_name_get(EOLIAN_OBJECT(klass));


static inline const char *
eolian_class_c_name_get(const Eolian_Class *klass)

   return eolian_object_c_name_get(EOLIAN_OBJECT(klass));


static inline const char *
eolian_class_short_name_get(const Eolian_Class *klass)

   return eolian_object_short_name_get(EOLIAN_OBJECT(klass));


static inline Eina_Iterator *
eolian_class_namespaces_get(const Eolian_Class *klass)

   return eolian_object_namespaces_get(EOLIAN_OBJECT(klass));

  }
{
 * @brief Returns the class type of the given class
 *
 * @param[in] klass the class
 * @return the class type
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
function eolian_class_type_get(klass:PEolian_Class):TEolian_Class_Type;cdecl;external;
{
 * @brief Returns the documentation of a class.
 *
 * @param[in] klass the class
 * @return the documentation of a class
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eolian_class_documentation_get(klass:PEolian_Class):PEolian_Documentation;cdecl;external;
{
 * @brief Returns the C function prefix of a class
 *
 * @param[in] klass the class
 * @return the eo prefix
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eolian_class_c_prefix_get(klass:PEolian_Class):Pchar;cdecl;external;
{
 * @brief Returns the C event prefix of a class
 *
 * @param[in] klass the class
 * @return the event prefix
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eolian_class_event_c_prefix_get(klass:PEolian_Class):Pchar;cdecl;external;
{
 * @brief Returns the data type of a class
 *
 * @param[in] klass the class
 * @return the data type
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eolian_class_data_type_get(klass:PEolian_Class):Pchar;cdecl;external;
{
 * @brief Get the parent class of a class
 *
 * This is the class the class inherits from. It only applies to classes,
 * as Eo follows a single-inheritance model with interfaces. This will be
 * NULL for any non-class (i.e. interface or mixin).
 *
 * @param[in] klass the class
 * @return the parent
 *
 * @see eolian_class_extensions_get
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eolian_class_parent_get(klass:PEolian_Class):PEolian_Class;cdecl;external;
{
 * @brief Returns an iterator to the required classes of this mixin
 *
 * For none mixins this will return an empty iterator, for mixins this returns a iterator that
 * carries all the classes that are required by this passed mixin.
 *
 * @param[in] klass the class
 * @return the iterator
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
function eolian_class_requires_get(klass:PEolian_Class):PEina_Iterator;cdecl;external;
{
 * @brief Returns an iterator to the class extensions
 *
 * For regular classes, extensions are interfaces/mixins for the class, i.e.
 * everything past the parent class. For interfaces/mixins, this is everything
 * in the inherits list.
 *
 * @param[in] klass the class
 * @return the iterator
 *
 * @see eolian_class_parent_get
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
function eolian_class_extensions_get(klass:PEolian_Class):PEina_Iterator;cdecl;external;
{
 * @brief Returns an iterator to functions of a class.
 *
 * @param[in] klass the class
 * @param[in] func_type type of the functions to insert into the list.
 * @return the iterator
 *
 * Acceptable inputs are EOLIAN_PROPERTY or EOLIAN_METHOD.
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
function eolian_class_functions_get(klass:PEolian_Class; func_type:TEolian_Function_Type):PEina_Iterator;cdecl;external;
{
 * @brief Returns the type of a function
 *
 * @param[in] function_id Id of the function
 * @return the function type
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
function eolian_function_type_get(function_id:PEolian_Function):TEolian_Function_Type;cdecl;external;
{
 * @brief Returns the scope of a function
 *
 * @param[in] function_id Id of the function
 * @param[in] ftype The type of function to get the scope for
 * @return the function scope
 *
 * Acceptable input types are METHOD, PROP_GET and PROP_SET.
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
function eolian_function_scope_get(function_id:PEolian_Function; ftype:TEolian_Function_Type):TEolian_Object_Scope;cdecl;external;
{
 * @brief A helper function to get the name of a function.
 *
 * @see eolian_object_name_get
 *
 * @ingroup Eolian
static inline const char *
eolian_function_name_get(const Eolian_Function *fid)

   return eolian_object_name_get(EOLIAN_OBJECT(fid));

  }
{
 * @brief Returns the full C name of a function.
 *
 * @param[in] function_id Id of the function
 * @param[in] ftype The type of function to get the name for
 * @return the function name
 *
 * It's here because the C API names are deduplicated (prefix of function and
 * suffix of prefix merge if applicable) and this helps generators not write
 * the same code over and over.
 *
 * If the given type is PROP_GET or PROPERTY, a "_get" suffix will be applied,
 * and "_set" for PROP_SET.
 *
 * Also, you're responsible for deleting the stringshare.
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
function eolian_function_full_c_name_get(function_id:PEolian_Function; ftype:TEolian_Function_Type):PEina_Stringshare;cdecl;external;
{
 * @brief Get a function in a class by its name and type
 *
 * @param[in] klass the class
 * @param[in] func_name name of the function
 * @param[in] f_type type of the function
 * @return the function id if found, NULL otherwise.
 *
 * Providing EOLIAN_UNRESOLVED finds any func, EOLIAN_PROPERTY any property,
 * EOLIAN_METHOD any method, EOLIAN_PROP_GET properties with either only a getter
 * or full property, EOLIAN_PROP_SET either only a setter or full property.
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function eolian_class_function_by_name_get(klass:PEolian_Class; func_name:Pchar; f_type:TEolian_Function_Type):PEolian_Function;cdecl;external;
{
 * @brief Returns the implement for a function.
 *
 * @param[in] function_id Id of the function
 * @return the implement or NULL.
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eolian_function_implement_get(function_id:PEolian_Function):PEolian_Implement;cdecl;external;
{
 * @brief Get whether a function is a static method/property.
 *
 * @param[in] function_id Id of the function
 * @return EINA_TRUE and EINA_FALSE respectively
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
function eolian_function_is_static(function_id:PEolian_Function):TEina_Bool;cdecl;external;
{
 * @brief Get whether a function is beta.
 *
 * @see eolian_object_is_beta
 *
 * @ingroup Eolian
static inline Eina_Bool
eolian_function_is_beta(const Eolian_Function *function_id)

   return eolian_object_is_beta(EOLIAN_OBJECT(function_id));

  }
{
 * @brief Indicates if a function is a constructing function of a given class.
 *
 * @param[in] klass the class
 * @param[in] function_id Id of the function
 * @return EINA_TRUE and EINA_FALSE respectively
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eolian_function_is_constructor(function_id:PEolian_Function; klass:PEolian_Class):TEina_Bool;cdecl;external;
{
 * @brief Returns an iterator to the parameter handles for a method/ctor/dtor.
 *
 * @param[in] function_id Id of the function
 * @return the iterator
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
function eolian_function_parameters_get(function_id:PEolian_Function):PEina_Iterator;cdecl;external;
{
 * @brief Returns an iterator to the keys params of a given function.
 *
 * @param[in] function_id Id of the function
 * @param[in] ftype The function type, for property get/set distinction.
 * @return the iterator
 *
 * Acceptable input types are PROP_GET and PROP_SET.
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
function eolian_property_keys_get(foo_id:PEolian_Function; ftype:TEolian_Function_Type):PEina_Iterator;cdecl;external;
{
 * @brief Returns an iterator to the values params of a given function.
 *
 * @param[in] function_id Id of the function
 * @param[in] ftype The function type, for property get/set distinction.
 * @return the iterator
 *
 * Acceptable input types are PROP_GET and PROP_SET.
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
function eolian_property_values_get(foo_id:PEolian_Function; ftype:TEolian_Function_Type):PEina_Iterator;cdecl;external;
{
 * @brief Get direction of a parameter
 *
 * @param[in] param_desc parameter handle
 * @return the direction of the parameter
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
function eolian_parameter_direction_get(param:PEolian_Function_Parameter):TEolian_Parameter_Direction;cdecl;external;
{
 * @brief Get type of a parameter
 *
 * @param[in] param_desc parameter handle
 * @return the type of the parameter
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eolian_parameter_type_get(param:PEolian_Function_Parameter):PEolian_Type;cdecl;external;
{
 * @brief Get the default value of a parameter
 *
 * @param[in] param_desc parameter handle
 * @return the value or NULL
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eolian_parameter_default_value_get(param:PEolian_Function_Parameter):PEolian_Expression;cdecl;external;
{
 * @brief A helper function to get the name of a function parameter.
 *
 * @see eolian_object_name_get
 *
 * @ingroup Eolian
static inline const char *
eolian_parameter_name_get(const Eolian_Function_Parameter *param)

   return eolian_object_name_get(EOLIAN_OBJECT(param));

  }
{
 * @brief Get documentation of a parameter
 *
 * @param[in] param_desc parameter handle
 * @return the documentation of the parameter or NULL
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eolian_parameter_documentation_get(param:PEolian_Function_Parameter):PEolian_Documentation;cdecl;external;
{
 * @brief Indicates if a parameter is optional.
 *
 * @param[in] param_desc parameter handle
 * @return EINA_TRUE if optional, EINA_FALSE otherwise
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
function eolian_parameter_is_optional(param_desc:PEolian_Function_Parameter):TEina_Bool;cdecl;external;
{
 * @brief Get whether a parameter is by reference.
 *
 * @param[in] param_desc parameter handle
 * @return EINA_TRUE and EINA_FALSE respectively
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
function eolian_parameter_is_by_ref(param_desc:PEolian_Function_Parameter):TEina_Bool;cdecl;external;
{
 * @brief Get whether a parameter is moved into the callee.
 *
 * @param[in] param_desc parameter handle
 * @return EINA_TRUE and EINA_FALSE respectively
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
function eolian_parameter_is_move(param_desc:PEolian_Function_Parameter):TEina_Bool;cdecl;external;
{
 * @brief Get the full C type name of the given parameter.
 *
 * @param[in] param_desc parameter handle
 * @param[in] as_return if true, it will be treated as a return type
 * @return The C type name assuming @c param_desc is not NULL.
 *
 * You're responsible for the stringshare. The @c as_return argument is meant
 * for properties, where the first out-param gets made into a return, which
 * has different typing characteristics.
 *
 * @see eolian_type_c_type_get
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
function eolian_parameter_c_type_get(param_desc:PEolian_Function_Parameter; as_return:TEina_Bool):PEina_Stringshare;cdecl;external;
{
 * @brief Get the return type of a function.
 *
 * @param[in] function_id id of the function
 * @param[in] ftype type of the function
 * @return the return type of the function
 *
 * The type of the function is needed because a given function can represent a
 * property, that can be set and get functions.
 *
 * Acceptable input types are METHOD, PROP_GET and PROP_SET.
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eolian_function_return_type_get(function_id:PEolian_Function; ftype:TEolian_Function_Type):PEolian_Type;cdecl;external;
{
 * @brief Get the return default value of a function.
 *
 * @param[in] function_id id of the function
 * @param[in] ftype type of the function
 * @return the return default value of the function
 *
 * The return default value is needed to return an appropriate
 * value if an error occurs (eo_do failure...).
 * The default value is not mandatory, so NULL can be returned.
 *
 * Acceptable input types are METHOD, PROP_GET and PROP_SET.
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eolian_function_return_default_value_get(foo_id:PEolian_Function; ftype:TEolian_Function_Type):PEolian_Expression;cdecl;external;
{
 * @brief Get the return docs of a function.
 *
 * @param[in] function_id id of the function
 * @param[in] ftype type of the function
 * @return the return docs of the function
 *
 * The type of the function is needed because a given function can represent a
 * property, that can be set and get functions.
 *
 * Acceptable input types are METHOD, PROP_GET and PROP_SET.
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eolian_function_return_documentation_get(foo_id:PEolian_Function; ftype:TEolian_Function_Type):PEolian_Documentation;cdecl;external;
{
 * @brief Indicates if a function return should allow being unused.
 *
 * @param[in] function_id id of the function
 * @param[in] ftype type of the function
 * @return EINA_TRUE if it can be unused, EINA_FALSE otherwise.
 *
 * The type of the function is needed because a given function can represent a
 * property, that can be set and get functions.
 *
 * Acceptable input types are METHOD, PROP_GET and PROP_SET.
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
function eolian_function_return_allow_unused(foo_id:PEolian_Function; ftype:TEolian_Function_Type):TEina_Bool;cdecl;external;
{
 * @brief Get whether a parameter is by reference.
 *
 * @param[in] function_id id of the function
 * @param[in] ftype type of the function
 * @return EINA_TRUE and EINA_FALSE respectively
 *
 * The type of the function is needed because a given function can represent a
 * property, that can be set and get functions.
 *
 * Acceptable input types are METHOD, PROP_GET and PROP_SET.
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
function eolian_function_return_is_by_ref(foo_id:PEolian_Function; ftype:TEolian_Function_Type):TEina_Bool;cdecl;external;
{
 * @brief Get whether a parameter is moved into the callee.
 *
 * @param[in] function_id id of the function
 * @param[in] ftype type of the function
 * @return EINA_TRUE and EINA_FALSE respectively
 *
 * The type of the function is needed because a given function can represent a
 * property, that can be set and get functions.
 *
 * Acceptable input types are METHOD, PROP_GET and PROP_SET.
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
function eolian_function_return_is_move(foo_id:PEolian_Function; ftype:TEolian_Function_Type):TEina_Bool;cdecl;external;
{
 * @brief Get the full C type name of the return value.
 *
 * @param[in] function_id id of the function
 * @param[in] ftype type of the function
 * @return The C type name.
 *
 * You're responsible for the stringshare.
 *
 * @see eolian_type_c_type_get
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
function eolian_function_return_c_type_get(foo_id:PEolian_Function; ftype:TEolian_Function_Type):PEina_Stringshare;cdecl;external;
{
 * @brief Indicates if a function object is const.
 *
 * @param[in] function_id id of the function
 * @return EINA_TRUE if the object is const, EINA_FALSE otherwise
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
function eolian_function_object_is_const(function_id:PEolian_Function):TEina_Bool;cdecl;external;
{
 * @brief Return the Eolian class associated to the function.
 *
 * @param[in] function_id id of the function
 * @return the class, NULL otherwise
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eolian_function_class_get(function_id:PEolian_Function):PEolian_Class;cdecl;external;
{
 * @brief A helper function to get the full name of an implement.
 *
 * @see eolian_object_name_get
 *
 * @ingroup Eolian
static inline const char *
eolian_implement_name_get(const Eolian_Implement *impl)

   return eolian_object_name_get(EOLIAN_OBJECT(impl));

  }
{
 * @brief Get the class of an overriding function (implement).
 *
 * This is always the class specified in the implement name, i.e. if a class
 * B overrides a method from a class A, the returned class will be A. There
 * is another API to get the overriding class.
 *
 * @param[in] impl the handle of the implement
 * @return the class handle or NULL.
 *
 * @see eolian_implement_implementing_class_get
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eolian_implement_class_get(impl:PEolian_Implement):PEolian_Class;cdecl;external;
{
 * @brief Get the implementing class of an overriding function (implement).
 *
 * This is always the class that is implementing the function, override or
 * not. That is, if class B overrides a method from class A, this will return
 * the B class. There is another API to get the original class.
 *
 * @param[in] impl the handle of the implement
 * @return the class handle or NULL.
 *
 * @see eolian_implement_class_get
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eolian_implement_implementing_class_get(impl:PEolian_Implement):PEolian_Class;cdecl;external;
{
 * @brief Get the function of an implement.
 *
 * @param[in] impl the handle of the implement
 * @param[out] func_type the function type.
 * @return the function handle or NULL.
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eolian_implement_function_get(impl:PEolian_Implement; func_type:PEolian_Function_Type):PEolian_Function;cdecl;external;
{
 * @brief Returns a documentation for an implement.
 *
 * @param[in] impl the handle of the implement
 * @param[in] f_type The function type, for property get/set distinction.
 * @return the documentation or NULL.
 *
 * Acceptable input types are METHOD, PROP_GET and PROP_SET.
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eolian_implement_documentation_get(impl:PEolian_Implement; f_type:TEolian_Function_Type):PEolian_Documentation;cdecl;external;
{
 * @brief Get whether an implement is tagged with @auto.
 *
 * @param[in] impl the handle of the implement
 * @param[in] f_type The function type, for property get/set distinction.
 * @return EINA_TRUE when it is, EINA_FALSE when it's not.
 *
 * Acceptable input types are METHOD, PROP_GET and PROP_SET.
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
function eolian_implement_is_auto(impl:PEolian_Implement; f_type:TEolian_Function_Type):TEina_Bool;cdecl;external;
{
 * @brief Get whether an implement is tagged with @empty.
 *
 * @param[in] impl the handle of the implement
 * @param[in] f_type The function type, for property get/set distinction.
 * @return EINA_TRUE when it is, EINA_FALSE when it's not.
 *
 * Acceptable input types are METHOD, PROP_GET and PROP_SET.
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
function eolian_implement_is_empty(impl:PEolian_Implement; f_type:TEolian_Function_Type):TEina_Bool;cdecl;external;
{
 * @brief Get whether an implement is pure virtual.
 *
 * @param[in] impl the handle of the implement
 * @param[in] f_type The function type, for property get/set distinction.
 * @return EINA_TRUE when it is, EINA_FALSE when it's not.
 *
 * Acceptable input types are METHOD, PROP_GET and PROP_SET.
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
function eolian_implement_is_pure_virtual(impl:PEolian_Implement; f_type:TEolian_Function_Type):TEina_Bool;cdecl;external;
{
 * @brief Get whether an implement references a property getter.
 *
 * @param[in] impl the handle of the implement
 * @return EINA_TRUE when it does, EINA_FALSE when it's not.
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
function eolian_implement_is_prop_get(impl:PEolian_Implement):TEina_Bool;cdecl;external;
{
 * @brief Get whether an implement references a property setter.
 *
 * @param[in] impl the handle of the implement
 * @return EINA_TRUE when it does, EINA_FALSE when it's not.
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
function eolian_implement_is_prop_set(impl:PEolian_Implement):TEina_Bool;cdecl;external;
{
 * @brief Get an iterator to implements of a class.
 *
 * @param[in] klass the class.
 * @return the iterator
 *
 * Implements include fields specified in the "implements" section of your Eo
 * file (i.e. overriding and pure virtual/auto/empty functions) and all other
 * methods/properties of your class (local only) that are not specified
 * within that section.
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
function eolian_class_implements_get(klass:PEolian_Class):PEina_Iterator;cdecl;external;
{
 * @brief A helper function to get the full name of a constructor.
 *
 * @see eolian_object_name_get
 *
 * @ingroup Eolian
static inline const char *
eolian_constructor_name_get(const Eolian_Constructor *ctor)

   return eolian_object_name_get(EOLIAN_OBJECT(ctor));

  }
{
 * @brief Get the class of a constructing function.
 *
 * @param[in] ctor the handle of the constructor
 * @return the class handle or NULL.
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eolian_constructor_class_get(ctor:PEolian_Constructor):PEolian_Class;cdecl;external;
{
 * @brief Get the function of a constructing function.
 *
 * @param[in] ctor the handle of the constructor
 * @return the function handle or NULL.
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eolian_constructor_function_get(ctor:PEolian_Constructor):PEolian_Function;cdecl;external;
{
 * @brief Checks if a constructor is tagged optional.
 *
 * @param[in] ctor the handle of the constructor
 * @return EINA_TRUE if optional, EINA_FALSE if not (or if input is NULL).
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
function eolian_constructor_is_optional(ctor:PEolian_Constructor):TEina_Bool;cdecl;external;
{
 * @brief Get an iterator to the constructing functions defined in a class.
 *
 * @param[in] klass the class.
 * @return the iterator
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
function eolian_class_constructors_get(klass:PEolian_Class):PEina_Iterator;cdecl;external;
{
 * @brief Get an iterator to the events defined in a class.
 *
 * @param[in] klass the class.
 * @return an iterator over const Eolian_Event* objects
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
function eolian_class_events_get(klass:PEolian_Class):PEina_Iterator;cdecl;external;
{
 * @brief A helper function to get the name of an event.
 *
 * @see eolian_object_name_get
 *
 * @ingroup Eolian
static inline const char *
eolian_event_name_get(const Eolian_Event *event)

   return eolian_object_name_get(EOLIAN_OBJECT(event));

  }
{
 * @brief Get the type of an event.
 *
 * @param[in] event the event handle
 * @return the type or NULL
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eolian_event_type_get(event:PEolian_Event):PEolian_Type;cdecl;external;
{
 * @brief Get the class of an event.
 *
 * @param[in] event the event handle
 * @return the class or NULL
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eolian_event_class_get(event:PEolian_Event):PEolian_Class;cdecl;external;
{
 * @brief Get the documentation of an event.
 *
 * @param[in] event the event handle
 * @return the documentation or NULL
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eolian_event_documentation_get(event:PEolian_Event):PEolian_Documentation;cdecl;external;
{
 * @brief Returns the scope of an event
 *
 * @param[in] event the event handle
 * @return the event scope
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
function eolian_event_scope_get(event:PEolian_Event):TEolian_Object_Scope;cdecl;external;
{
 * @brief Get whether an event is beta.
 *
 * @see eolian_object_is_beta
 *
 * @ingroup Eolian
static inline Eina_Bool
eolian_event_is_beta(const Eolian_Event *event)

   return eolian_object_is_beta(EOLIAN_OBJECT(event));

  }
{
 * @brief Get whether an event is hot (unfreezable).
 *
 * @param[in] event the event handle
 * @return EINA_TRUE and EINA_FALSE respectively
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
function eolian_event_is_hot(event:PEolian_Event):TEina_Bool;cdecl;external;
{
 * @brief Get whether an event is a restartable event.
 *
 * @param[in] event the event handle
 * @return EINA_TRUE and EINA_FALSE respectively
 *
 * In case of nested call, restartable event will start processing from where
 * they where in the parent callback call skipping all the previously executed
 * callback. Especially useful for nested main loop use case.
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
function eolian_event_is_restart(event:PEolian_Event):TEina_Bool;cdecl;external;
{
 * @brief Get an iterator to the parts defined in a class.
 *
 * @param[in] klass the class.
 * @return an iterator over const Eolian_Part* objects
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
function eolian_class_parts_get(klass:PEolian_Class):PEina_Iterator;cdecl;external;
{
 * @brief Returns the C macro name used to refer to an event
 *
 * @param[in] event the event handle
 * @return the event C macro
 *
 * You're responsible for deleting the stringshare.
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
function eolian_event_c_macro_get(event:PEolian_Event):PEina_Stringshare;cdecl;external;
{
 * @brief A helper function to get the name of a part.
 *
 * @see eolian_object_name_get
 *
 * @ingroup Eolian
static inline const char *
eolian_part_name_get(const Eolian_Part *part)

   return eolian_object_name_get(EOLIAN_OBJECT(part));

  }
{
 * @brief Get the type of a part.
 *
 * @param[in] part the part handle
 * @return the type or NULL
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eolian_part_class_get(part:PEolian_Part):PEolian_Class;cdecl;external;
{
 * @brief Get the documentation of an part.
 *
 * @param[in] part the part handle
 * @return the documentation or NULL
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eolian_part_documentation_get(part:PEolian_Part):PEolian_Documentation;cdecl;external;
{
 * @brief Get whether a part is beta.
 *
 * @see eolian_object_is_beta
 *
 * @ingroup Eolian
static inline Eina_Bool
eolian_part_is_beta(const Eolian_Part *part)

   return eolian_object_is_beta(EOLIAN_OBJECT(part));

  }
{
 * @brief Get an event in a class by its name
 *
 * @param[in] klass the class
 * @param[in] event_name name of the event
 * @return the Eolian_Event if found, NULL otherwise.
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function eolian_class_event_by_name_get(klass:PEolian_Class; event_name:Pchar):PEolian_Event;cdecl;external;
{
 * @brief Indicates if the class constructor has to invoke
 * a non-generated class constructor function.
 *
 * @param[in] klass the class.
 * @return EINA_TRUE if the invocation is needed, EINA_FALSE otherwise.
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
function eolian_class_ctor_enable_get(klass:PEolian_Class):TEina_Bool;cdecl;external;
{
 * @brief Indicates if the class destructor has to invoke
 * a non-generated class destructor function.
 *
 * @param[in] klass the class.
 * @return EINA_TRUE if the invocation is needed, EINA_FALSE otherwise.
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
function eolian_class_dtor_enable_get(klass:PEolian_Class):TEina_Bool;cdecl;external;
{
 * @brief Returns the name of the C function used to get the Efl_Class pointer.
 *
 * @param[in] klass the class.
 * @return a stringshare containing the func name or NULL on error.
 *
 * You have to delete the stringshare manually.
 *
 * @see eolian_class_c_name_get
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
function eolian_class_c_get_function_name_get(klass:PEolian_Class):PEina_Stringshare;cdecl;external;
{
 * @brief Get the C macro of the class.
 *
 * @param[in] klass the class
 * @return the C symbol
 *
 * This is the name by which the class is accessed in C environment, in format
 * CLASS_NAME_SUFFIX where SUFFIX is CLASS, MIXIN or INTERFACE. You're responsible
 * for the stringshare afterwards.
 *
 * @see eolian_class_c_get_function_name_get
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
function eolian_class_c_macro_get(klass:PEolian_Class):PEina_Stringshare;cdecl;external;
{
 * @brief Get the C data type of the class.
 *
 * @param[in] klass the class
 * @return the C data type
 *
 * This will sanitize the data type of the class for C usage; if it's "null",
 * this returns "void"; if it's actually explicitly set, it returns the sanitized
 * version of the string, otherwise it returns Class_Name_Data. Keep in mind that
 * this does not add an asterisk (it doesn't return a pointer type name). You're
 * responsible for the stringshare afterwards.
 *
 * @see eolian_class_c_get_function_name_get
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
function eolian_class_c_data_type_get(klass:PEolian_Class):PEina_Stringshare;cdecl;external;
{
 * @brief Get whether a class is beta.
 *
 * @see eolian_object_is_beta
 *
 * @ingroup Eolian
static inline Eina_Bool
eolian_class_is_beta(const Eolian_Class *klass)

   return eolian_object_is_beta(EOLIAN_OBJECT(klass));

  }
{
 * @brief Get the type of a type declaration.
 *
 * @param[in] tp the type declaration.
 * @return an Eolian_Typedecl_Type.
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
function eolian_typedecl_type_get(tp:PEolian_Typedecl):TEolian_Typedecl_Type;cdecl;external;
{
 * @brief Get an iterator to all fields of a struct type.
 *
 * @param[in] tp the type declaration.
 * @return the iterator when @c tp is EOLIAN_TYPEDECL_STRUCT, NULL otherwise.
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
function eolian_typedecl_struct_fields_get(tp:PEolian_Typedecl):PEina_Iterator;cdecl;external;
{
 * @brief Get a field of a struct type.
 *
 * @param[in] tp the type declaration.
 * @param[in] field the field name.
 * @return the field when @c tp is EOLIAN_TYPEDECL_STRUCT, @c field is not NULL
 * and the field exists, NULL otherwise.
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function eolian_typedecl_struct_field_get(tp:PEolian_Typedecl; field:Pchar):PEolian_Struct_Type_Field;cdecl;external;
{
 * @brief A helper function to get the name of a struct field.
 *
 * @see eolian_object_name_get
 *
 * @ingroup Eolian
static inline const char *
eolian_typedecl_struct_field_name_get(const Eolian_Struct_Type_Field *field)

   return eolian_object_name_get(EOLIAN_OBJECT(field));

  }
{
 * @brief Get the documentation of a field of a struct type.
 *
 * @param[in] fl the field.
 * @return the documentation.
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eolian_typedecl_struct_field_documentation_get(fl:PEolian_Struct_Type_Field):PEolian_Documentation;cdecl;external;
{
 * @brief Get the type of a field of a struct type.
 *
 * @param[in] fl the field.
 * @return the type.
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eolian_typedecl_struct_field_type_get(fl:PEolian_Struct_Type_Field):PEolian_Type;cdecl;external;
{
 * @brief Get whether a struct field is by reference.
 *
 * @param[in] fl the field.
 * @return EINA_TRUE and EINA_FALSE respectively
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
function eolian_typedecl_struct_field_is_by_ref(fl:PEolian_Struct_Type_Field):TEina_Bool;cdecl;external;
{
 * @brief Get whether a struct field is moved with the struct.
 *
 * @param[in] fl the field.
 * @return EINA_TRUE and EINA_FALSE respectively
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
function eolian_typedecl_struct_field_is_move(fl:PEolian_Struct_Type_Field):TEina_Bool;cdecl;external;
{
 * @brief Get the full C type name of the struct field.
 *
 * @param[in] fl the field.
 * @return The C type name.
 *
 * You're responsible for the stringshare.
 *
 * @see eolian_type_c_type_get
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
function eolian_typedecl_struct_field_c_type_get(fl:PEolian_Struct_Type_Field):PEina_Stringshare;cdecl;external;
{
 * @brief Get an iterator to all fields of an enum type.
 *
 * @param[in] tp the type declaration.
 * @return the iterator when @c tp is EOLIAN_TYPEDECL_ENUM, NULL otherwise.
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
function eolian_typedecl_enum_fields_get(tp:PEolian_Typedecl):PEina_Iterator;cdecl;external;
{
 * @brief Get a field of an enum type.
 *
 * @param[in] tp the type declaration.
 * @param[in] field the field name.
 * @return the field when @c tp is EOLIAN_TYPEDECL_ENUM, @c field is not NULL,
 * field exists and has a value set, NULL otherwise.
 *
 * Keep in mind that this can return NULL for an existing field, particularly
 * when the field has no value set (i.e. increments by 1 over previous value).
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function eolian_typedecl_enum_field_get(tp:PEolian_Typedecl; field:Pchar):PEolian_Enum_Type_Field;cdecl;external;
{
 * @brief A helper function to get the name of an enum field.
 *
 * @see eolian_object_name_get
 *
 * @ingroup Eolian
static inline const char *
eolian_typedecl_enum_field_name_get(const Eolian_Enum_Type_Field *field)

   return eolian_object_name_get(EOLIAN_OBJECT(field));

  }
{
 * @brief Get the C constant name used to refer to a particular enum field.
 *
 * The user of the API is responsible for the resulting stringshare.
 *
 * @param[in] fl the field.
 * @return the name.
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
function eolian_typedecl_enum_field_c_constant_get(fl:PEolian_Enum_Type_Field):PEina_Stringshare;cdecl;external;
{
 * @brief Get the documentation of a field of an enum type.
 *
 * @param[in] fl the field.
 * @return the documentation.
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eolian_typedecl_enum_field_documentation_get(fl:PEolian_Enum_Type_Field):PEolian_Documentation;cdecl;external;
{
 * @brief Get the value of a field of an enum type.
 *
 * When the @c force parameter is EINA_FALSE, this will only return values for
 * fields which are explicitly specified in the eo file, otherwise it will
 * return a valid expression for any field.
 *
 * @param[in] fl the field.
 * @param[in] force force the value retrieval.
 * @return the expression.
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eolian_typedecl_enum_field_value_get(fl:PEolian_Enum_Type_Field; force:TEina_Bool):PEolian_Expression;cdecl;external;
{
 * @brief Get the documentation of a struct/alias type.
 *
 * @param[in] tp the type declaration.
 * @return the documentation when @c tp is EOLIAN_TYPE_STRUCT or
 * EOLIAN_TYPE_STRUCT_OPAQUE, NULL otherwise.
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eolian_typedecl_documentation_get(tp:PEolian_Typedecl):PEolian_Documentation;cdecl;external;
{
 * @brief Get the base type of an alias declaration.
 *
 * @param[in] tp the type declaration.
 * @return the base type when @c tp is an alias, NULL otherwise.
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eolian_typedecl_base_type_get(tp:PEolian_Typedecl):PEolian_Type;cdecl;external;
{
 * @brief Get the lowest base type of an alias stack.
 *
 * If the given typedecl is an alias, it returns the result of
 * eolian_type_aliased_base_get on its base type. Otherwise this returns NULL.
 *
 * @param[in] tp the type declaration.
 * @return the lowest alias base or the given type.
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eolian_typedecl_aliased_base_get(tp:PEolian_Typedecl):PEolian_Type;cdecl;external;
{
 * @brief Check if a struct or alias type declaration is extern.
 *
 * @param[in] tp the type declaration.
 * @return EINA_TRUE if it's extern, EINA_FALSE otherwise.
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
function eolian_typedecl_is_extern(tp:PEolian_Typedecl):TEina_Bool;cdecl;external;
{
 * @brief Get whether a typedecl is beta.
 *
 * @see eolian_object_is_beta
 *
 * @ingroup Eolian
static inline Eina_Bool
eolian_typedecl_is_beta(const Eolian_Typedecl *tp)

   return eolian_object_is_beta(EOLIAN_OBJECT(tp));

  }
{
 * @brief Get the full C type name of the given type.
 *
 * @param[in] tp the type declaration.
 * @return The C type name assuming @c tp is not NULL.
 *
 * You're responsible for deleting the stringshare.
 *
 * @see eolian_type_c_type_get
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
function eolian_typedecl_c_type_get(tp:PEolian_Typedecl):PEina_Stringshare;cdecl;external;
{
 * @brief A helper function to get the full name of a typedecl.
 *
 * @see eolian_object_name_get
 *
 * @ingroup Eolian
static inline const char *
eolian_typedecl_name_get(const Eolian_Typedecl *tp)

   return eolian_object_name_get(EOLIAN_OBJECT(tp));


static inline const char *
eolian_typedecl_c_name_get(const Eolian_Typedecl *tp)

   return eolian_object_c_name_get(EOLIAN_OBJECT(tp));


static inline const char *
eolian_typedecl_short_name_get(const Eolian_Typedecl *tp)

   return eolian_object_short_name_get(EOLIAN_OBJECT(tp));


static inline Eina_Iterator *
eolian_typedecl_namespaces_get(const Eolian_Typedecl *tp)

   return eolian_object_namespaces_get(EOLIAN_OBJECT(tp));

  }
{
 * @brief Get the name of the function used to free this type declaration.
 *
 * @param[in] tp the type declaration.
 * @return the free func name.
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eolian_typedecl_free_func_get(tp:PEolian_Typedecl):Pchar;cdecl;external;
{
 * @brief Get the function object for this function pointer type.
 *
 * @param[in] tp the type.
 * @return the function or NULL;
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eolian_typedecl_function_pointer_get(tp:PEolian_Typedecl):PEolian_Function;cdecl;external;
{
 * @brief Get the type of a type.
 *
 * @param[in] tp the type.
 * @return an Eolian_Type_Type.
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
function eolian_type_type_get(tp:PEolian_Type):TEolian_Type_Type;cdecl;external;
{
 * @brief Get the builtin type of a type.
 *
 * @param[in] tp the type.
 * @return an Eolian_Type_Builtin_Type.
 *
 * If the input type is NULL or it's not a builtin, EOLIAN_TYPE_BUILTIN_INVALID
 * is returned.
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
function eolian_type_builtin_type_get(tp:PEolian_Type):TEolian_Type_Builtin_Type;cdecl;external;
{
 * @brief Get the base type of a type.
 *
 * Only applies to "complex" ordinary types, i.e. this is the first inner
 * type in <>.
 *
 * @param[in] tp the type.
 * @return the base type or NULL.
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eolian_type_base_type_get(tp:PEolian_Type):PEolian_Type;cdecl;external;
{
 * @brief Get the next inner type of a complex type.
 *
 * The inner types of a complex type form a chain. Therefore, you first retrieve
 * the first one via eolian_type_base_type_get and then get the next one via
 * this API function called on the first inner type if necessary. Another use
 * for this is with errors, specifying error(Foo, Bar, ...) makes a chain.
 *
 * @param[in] tp the type.
 * @return the next type or NULL.
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eolian_type_next_type_get(tp:PEolian_Type):PEolian_Type;cdecl;external;
{
 * @brief Get the declaration a regular type points to.
 *
 * This tries to look up alias, struct and enum in that order.
 *
 * @param[in] tp the type.
 * @return the pointed to type decalration or NULL.
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eolian_type_typedecl_get(tp:PEolian_Type):PEolian_Typedecl;cdecl;external;
{
 * @brief Get the lowest base type of an alias stack.
 *
 * If this is a regular type, it first tries to retrieve its base declaration
 * using eolian_type_typedecl_get and if the retrieved base is an alias, returns
 * a call of eolian_typedecl_aliased_base_get function on it. Otherwise it
 * returns the given type. This is useful in order to retrieve what an aliased
 * type actually is while still having convenience. Keep in mind that this stops
 * if the found type is actually a pointer (has a ptr() on it).
 *
 * @param[in] tp the type.
 * @return the lowest alias base or the given type.
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eolian_type_aliased_base_get(tp:PEolian_Type):PEolian_Type;cdecl;external;
{
 * @brief Get the class associated with an EOLIAN_TYPE_CLASS type.
 *
 * @param[in] tp the type.
 * @return the class or NULL.
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eolian_type_class_get(tp:PEolian_Type):PEolian_Class;cdecl;external;
{
 * @brief Get the error declaration associated with an EOLIAN_TYPE_ERROR type.
 *
 * @param[in] tp the type.
 * @return the error or NULL.
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eolian_type_error_get(tp:PEolian_Type):PEolian_Error;cdecl;external;
{
 * @brief Get whether the given type is moved with its parent type.
 *
 * This is only used for inner types of owning containers, i.e. arrays,
 * lists, hashes and futures. View containers (accessors and iterators)
 * are not allowed to own their contents (the Eolian syntax will not let
 * you use the <tt>@move</tt> tag there).
 *
 * @param[in] tp the type.
 * @return EINA_TRUE when the type is marked move, EINA_FALSE otherwise.
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
function eolian_type_is_move(tp:PEolian_Type):TEina_Bool;cdecl;external;
{
 * @brief Get whether the given type is const.
 *
 * @param[in] tp the type.
 * @return EINA_TRUE when the type is const, EINA_FALSE otherwise.
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
function eolian_type_is_const(tp:PEolian_Type):TEina_Bool;cdecl;external;
{
 * @brief Get the full C type name of the given type.
 *
 * @param[in] tp the type.
 * @return The C type name assuming @c tp is not NULL.
 *
 * You're responsible for the stringshare.
 *
 * @see eolian_typedecl_c_type_get
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
function eolian_type_c_type_get(tp:PEolian_Type):PEina_Stringshare;cdecl;external;
{
 * @brief A helper function to get the full name of a type.
 *
 * @see eolian_object_name_get
 *
 * @ingroup Eolian
static inline const char *
eolian_type_name_get(const Eolian_Type *tp)

   return eolian_object_name_get(EOLIAN_OBJECT(tp));


static inline const char *
eolian_type_c_name_get(const Eolian_Type *tp)

   return eolian_object_c_name_get(EOLIAN_OBJECT(tp));


static inline const char *
eolian_type_short_name_get(const Eolian_Type *tp)

   return eolian_object_short_name_get(EOLIAN_OBJECT(tp));


static inline Eina_Iterator *
eolian_type_namespaces_get(const Eolian_Type *tp)

   return eolian_object_namespaces_get(EOLIAN_OBJECT(tp));

  }
{
 * @brief Evaluate an Eolian expression.
 *
 * @param[in] expr the expression.
 * @param[in] mask the mask of allowed values (can combine with bitwise OR).
 * @return the value, its type is set to EOLIAN_EXPR_UNKNOWN on error.
 *
 * Represents value types from Eolian_Expression_Type. Booleans
 * are represented as unsigned char, strings as a stringshare.
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
function eolian_expression_eval(expr:PEolian_Expression; m:TEolian_Expression_Mask):TEolian_Value;cdecl;external;
{
 * @brief Evaluate an Eolian expression into an out-param.
 *
 * @param[in] expr the expression.
 * @param[in] mask the mask of allowed values (can combine with bitwise OR).
 * @param[out] the value to fill
 * @return EINA_TRUE on success, EINA_FALSE on failure
 *
 * This is like eolian_expression_eval, except it writes into an out-param
 * and returns whether it succeeded or failed. On failure, no write is
 * guaranteed.
 *
 * @since 1.25
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
function eolian_expression_eval_fill(expr:PEolian_Expression; m:TEolian_Expression_Mask; val:PEolian_Value):TEina_Bool;cdecl;external;
{
 * @brief Convert the result of expression evaluation to a literal as in how
 * it would appear in C (e.g. strings are quoted and escaped).
 *
 * @param[in] v the value.
 * @return a stringshare containing the literal (quoted and escaped as needed)
 * or NULL.
 *
 * For e.g. strings this only uses a subset of regular C escape sequences
 * so that interoperability is wider than just C (no octal escapes). For
 * languages that differ too much, you can write an equivalent function
 * yourself.
 * Also, you're responsible for deleting the stringshare.
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
function eolian_expression_value_to_literal(v:PEolian_Value):PEina_Stringshare;cdecl;external;
{
 * @brief Serialize an expression.
 *
 * @param[in] expr the expression.
 * @return the serialized expression or NULL.
 *
 * This serializes the expression into the original form as written in the .eo
 * file (but with parens on binary operators explicitly specifying precedence).
 * Keep in mind that it cannot be used alone pasted into C code as it doesn't
 * resolve namespaces and enum field names.
 * Also, you're responsible for deleting the stringshare.
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
function eolian_expression_serialize(expr:PEolian_Expression):PEina_Stringshare;cdecl;external;
{
 * @brief Get the type of an expression.
 *
 * @param[in] expr the expression.
 * @return the expression type.
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
function eolian_expression_type_get(expr:PEolian_Expression):TEolian_Expression_Type;cdecl;external;
{
 * @brief Get the binary operator of an expression.
 *
 * @param[in] expr the expression.
 * @return the binary operator, EOLIAN_BINOP_INVALID on failure.
 *
 * This only works on binary expressions, otherwise it returns
 * EOLIAN_BINOP_INVALID.
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
function eolian_expression_binary_operator_get(expr:PEolian_Expression):TEolian_Binary_Operator;cdecl;external;
{
 * @brief Get the lhs (left hand side) of a binary expression.
 *
 * @param[in] expr the expression.
 * @return the expression or NULL.
 *
 * This only works on binary expressions, otherwise it returns NULL.
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eolian_expression_binary_lhs_get(expr:PEolian_Expression):PEolian_Expression;cdecl;external;
{
 * @brief Get the rhs (right hand side) of a binary expression.
 *
 * @param[in] expr the expression.
 * @return the expression or NULL.
 *
 * This only works on binary expressions, otherwise it returns NULL.
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eolian_expression_binary_rhs_get(expr:PEolian_Expression):PEolian_Expression;cdecl;external;
{
 * @brief Get the unary operator of an expression.
 *
 * @param[in] expr the expression.
 * @return the unary operator, EOLIAN_UNOP_INVALID on failure.
 *
 * This only works on unary expressions, otherwise it returns
 * EOLIAN_UNOP_INVALID.
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
function eolian_expression_unary_operator_get(expr:PEolian_Expression):TEolian_Unary_Operator;cdecl;external;
{
 * @brief Get the expression of an unary expression.
 *
 * @param[in] expr the expression.
 * @return the expression or NULL.
 *
 * This only works on unary expressions, otherwise it returns NULL.
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eolian_expression_unary_expression_get(expr:PEolian_Expression):PEolian_Expression;cdecl;external;
{
 * @brief Get the value of an expression.
 *
 * @param[in] expr the expression.
 * @return the value.
 *
 * Keep in mind that this doesn't evaluate anything. That's why it only works
 * on expressions that actually hold values (not unknown, not binary, not
 * unary). For some types of expressions (enum, name), this stores the actual
 * name (in the value.s field). Resources for this are held by the database.
 * Don't attempt to free the string or anything like that.
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
function eolian_expression_value_get(expr:PEolian_Expression):TEolian_Value;cdecl;external;
{
 * @brief Get the value of an expression into an out-param.
 *
 * @param[in] expr the expression.
 * @param[out] val the value to fill.
 * @return EINA_TRUE on success, EINA_FALSE on failure
 *
 * This is like eolian_expression_value_get, but it fills an out-param. On
 * failure, nothing is guaranteed to be filled.
 *
 * @since 1.25
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
function eolian_expression_value_get_fill(expr:PEolian_Expression; val:PEolian_Value):TEina_Bool;cdecl;external;
{
 * @brief Get the documentation of a constant.
 *
 * @param[in] var the constant.
 * @return the documentation or NULL.
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eolian_constant_documentation_get(var:PEolian_Constant):PEolian_Documentation;cdecl;external;
{
 * @brief Get the base type of a constant.
 *
 * @param[in] var the constant.
 * @return the base type or NULL.
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eolian_constant_type_get(var:PEolian_Constant):PEolian_Type;cdecl;external;
{
 * @brief Get the value of a constant.
 *
 * @param[in] var the constant.
 * @return the value or NULL.
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eolian_constant_value_get(var:PEolian_Constant):PEolian_Expression;cdecl;external;
{
 * @brief A helper function to get the full name of a constant.
 *
 * @see eolian_object_name_get
 *
 * @ingroup Eolian
static inline const char *
eolian_constant_name_get(const Eolian_Constant *tp)

   return eolian_object_name_get(EOLIAN_OBJECT(tp));


static inline const char *
eolian_constant_c_name_get(const Eolian_Constant *tp)

   return eolian_object_c_name_get(EOLIAN_OBJECT(tp));


static inline const char *
eolian_constant_short_name_get(const Eolian_Constant *tp)

   return eolian_object_short_name_get(EOLIAN_OBJECT(tp));


static inline Eina_Iterator *
eolian_constant_namespaces_get(const Eolian_Constant *tp)

   return eolian_object_namespaces_get(EOLIAN_OBJECT(tp));

  }
{
 * @brief Check if a constant is extern.
 *
 * @param[in] var the constant.
 * @return EINA_TRUE if it's extern, EINA_FALSE otherwise.
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
function eolian_constant_is_extern(var:PEolian_Constant):TEina_Bool;cdecl;external;
{
 * @brief Get whether a constant is beta.
 *
 * @see eolian_object_is_beta
 *
 * @ingroup Eolian
static inline Eina_Bool
eolian_constant_is_beta(const Eolian_Constant *var)

   return eolian_object_is_beta(EOLIAN_OBJECT(var));

  }
{
 * @brief Get the message of an error declaration.
 *
 * @param[in] err the error.
 * @return the message or NULL.
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eolian_error_message_get(err:PEolian_Error):Pchar;cdecl;external;
{
 * @brief Get the documentation of an error declaration.
 *
 * @param[in] err the error declaration.
 * @return the documentation or NULL.
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eolian_error_documentation_get(err:PEolian_Error):PEolian_Documentation;cdecl;external;
{
 * @brief A helper function to get the full name of an error declaration.
 *
 * @see eolian_object_name_get
 *
 * @ingroup Eolian
static inline const char *
eolian_error_name_get(const Eolian_Error *err)

   return eolian_object_name_get(EOLIAN_OBJECT(err));


static inline const char *
eolian_error_c_name_get(const Eolian_Error *err)

   return eolian_object_c_name_get(EOLIAN_OBJECT(err));


static inline const char *
eolian_error_short_name_get(const Eolian_Error *err)

   return eolian_object_short_name_get(EOLIAN_OBJECT(err));


static inline Eina_Iterator *
eolian_error_namespaces_get(const Eolian_Error *err)

   return eolian_object_namespaces_get(EOLIAN_OBJECT(err));


static inline Eina_Bool
eolian_error_is_beta(const Eolian_Error *err)

   return eolian_object_is_beta(EOLIAN_OBJECT(err));

  }
{
 * @brief Check if an error declaration is extern.
 *
 * @param[in] err the errpr decůaratopm.
 * @return EINA_TRUE if it's extern, EINA_FALSE otherwise.
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
function eolian_error_is_extern(err:PEolian_Error):TEina_Bool;cdecl;external;
{
 * @brief Get the summary of the documentation.
 *
 * This should never return NULL unless the input is invalid.
 *
 * @param[in] doc the documentation
 * @return the summary or NULL
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eolian_documentation_summary_get(doc:PEolian_Documentation):Pchar;cdecl;external;
{
 * @brief Get the description of the documentation.
 *
 * This can return NULL if the description wasn't specified or
 * if the input is wrong.
 *
 * @param[in] doc the documentation
 * @return the description or NULL
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eolian_documentation_description_get(doc:PEolian_Documentation):Pchar;cdecl;external;
{
 * @brief Get the "since" tag of the documentation.
 *
 * This can return NULL if the tag wasn't specified or
 * if the input is wrong.
 *
 * @param[in] doc the documentation
 * @return the description or NULL
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eolian_documentation_since_get(doc:PEolian_Documentation):Pchar;cdecl;external;
{
 * @brief Split a documentation string into individual paragraphs.
 *
 * The items of the resulting list are strings that are fred with free().
 *
 * @param[in] doc the documentation string
 * @return a list of allocated strings containing paragraphs
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
function eolian_documentation_string_split(doc:Pchar):PEina_List;cdecl;external;
{
 * @brief Tokenize a documentation paragraph.
 *
 * This gradually splits the string into pieces (text, references, paragraph
 * separators etc.) so that it can be more easily turned into a representation
 * you want. On failure, token is initialized with EOLIAN_DOC_TOKEN_UNKNOWN.
 *
 * The function never allocates any memory and doesn't hold any state, instead
 * the returned continuation has to be passed as first param on next iteration
 * and you have to make sure the input data stays valid until you're completely
 * done.
 *
 * The input string is assumed to be a single paragraph with all unnecessary
 * whitespace already trimmed.
 *
 * If the given token is NULL, it will still tokenize, but without saving anything.
 *
 * @param[in] doc the documentation string
 * @param[out] ret the token
 * @return a continuation of the input string
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eolian_documentation_tokenize(doc:Pchar; ret:PEolian_Doc_Token):Pchar;cdecl;external;
{
 * @brief Initialize a documentation token into an empty state.
 *
 * @param[in] tok the token
 * @return the token type
  }
procedure eolian_doc_token_init(tok:PEolian_Doc_Token);cdecl;external;
{
 * @brief Get the type of a documentation token.
 *
 * @param[in] tok the token
 * @return the token type
  }
(* Const before type ignored *)
function eolian_doc_token_type_get(tok:PEolian_Doc_Token):TEolian_Doc_Token_Type;cdecl;external;
{
 * @brief Get the text of a documentation token.
 *
 * Works on every token type, but for unknown tokens it returns NULL.
 * You need to free the text once you're done using normal free().
 * This makes sure all escapes in the original doc comments are properly
 * removed so you can use the string as-is.
 *
 * @param[in] tok the token
 * @return the token text
  }
(* Const before type ignored *)
function eolian_doc_token_text_get(tok:PEolian_Doc_Token):Pchar;cdecl;external;
{
 * @brief Get the thing that a reference token references.
 *
 * Returns EOLIAN_OBJECT_UNKNOWN on failure (when not ref token or
 * invalid ref, but invalid refs don't happen when database is valid).
 *
 * When the reference is a class, alias, struct, enum or var, the first data arg
 * is filled. When it's a func, the first data is class and second data is
 * the respective Eolian_Implement, when it's an event the first data is class
 * and the second data is the event, when it's a struct field or enum field
 * the first data is is the struct/enum and the second data is the field.
 *
 * @param[in] tok the token
 * @param[in] state the state to look in
 * @param[out] data the primary data
 * @param[out] data2 the secondary data
 * @return the kind of reference this is
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function eolian_doc_token_ref_resolve(tok:PEolian_Doc_Token; state:PEolian_State; data:PPEolian_Object; data2:PPEolian_Object):TEolian_Object_Type;cdecl;external;
{$ifdef EFL_BETA_API_SUPPORT}
{
 * @brief Get the legacy prefix of enum field names. When not specified,
 * enum name is used. (BETA)
 *
 * @param[in] tp the type declaration.
 * @return the legacy prefix or NULL.
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eolian_typedecl_enum_legacy_prefix_get(tp:PEolian_Typedecl):Pchar;cdecl;external;
{
 * @brief Get whether the given type is a reference.
 *
 * @param[in] tp the type.
 * @return EINA_TRUE when the type is marked ref, EINA_FALSE otherwise.
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
function eolian_type_is_ptr(tp:PEolian_Type):TEina_Bool;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{*
 * @
  }
{$endif}

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function EOLIAN_CAST(_type,expr : longint) : Ptype;
begin
  EOLIAN_CAST:=Ptype(expr);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function EOLIAN_OBJECT(expr : longint) : longint;
begin
  EOLIAN_OBJECT:=EOLIAN_CAST(Eolian_Object,expr);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function EOLIAN_UNIT(expr : longint) : longint;
begin
  EOLIAN_UNIT:=EOLIAN_CAST(Eolian_Unit,expr);
end;


end.
