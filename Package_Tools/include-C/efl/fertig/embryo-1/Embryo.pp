
unit Embryo;
interface

{
  Automatically converted by H2Pas 1.0.0 from Embryo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    Embryo.h
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
Pdword  = ^dword;
PEmbryo_Cell  = ^Embryo_Cell;
PEmbryo_Error  = ^Embryo_Error;
PEmbryo_Float_Cell  = ^Embryo_Float_Cell;
PEmbryo_Function  = ^Embryo_Function;
PEmbryo_Program  = ^Embryo_Program;
PEmbryo_Status  = ^Embryo_Status;
PEmbryo_UCell  = ^Embryo_UCell;
PEmbryo_Version  = ^Embryo_Version;
Pword  = ^word;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*
@brief Embryo Library

These routines are used for Embryo.

@page embryo_main Embryo

@date 2004 (created)
@note based on Compuphase (http://www.compuphase.com) PAWN language.

@section embryo_toc Table of Contents

@li @ref embryo_main_intro
@li @ref embryo_main_compiling
@li @ref embryo_main_next_steps

@section embryo_main_intro Introduction

Embryo is a tiny library designed to interpret limited Small programs
compiled by the included compiler, @c embryo_cc.  It is mostly a cleaned
up and smaller version of the original Small abstract machine.  The
compiler is mostly untouched.

Small was renamed to Pawn.
For more information about the Pawn language, see
@htmlonly <a href=http://www.compuphase.com/pawn/pawn.htm>Pawn</a>
@endhtmlonly
@latexonly http://www.compuphase.com/pawn/pawn.htm @endlatexonly
For the basics about the Small language, see @ref Small_Page.

@section embryo_main_compiling How to compile

Embryo is a library your application links to. The procedure for this
is very simple. You simply have to compile your application with the
appropriate compiler flags that the @p pkg-config script outputs. For
example:

Compiling C or C++ files into object files:

@verbatim
gcc -c -o main.o main.c `pkg-config --cflags embryo`
@endverbatim

Linking object files into a binary executable:

@verbatim
gcc -o my_application main.o `pkg-config --libs embryo`
@endverbatim

See @ref pkgconfig

@section embryo_main_next_steps Next Steps

After you understood what Embryo is and installed it in your system you
should proceed understanding the programming interface.

Recommended reading:

@li @ref Embryo_Program_Creation_Group to create Embryo from memory or file.
@li @ref Embryo_Func_Group to expose functions to Embryo.
@li @ref Embryo_Program_VM_Group to push pop virtual machine.
@li @ref Embryo_Run_Group to run it.



@todo Clean up compiler code.
@todo Proper overview of the operation of the interpreter, that is how
      the heap, stack, virtual machines, etc fit together.

@page Small_Page Brief Introduction to Small

This section describes the basics of Small, as compiled and interpreted
with Embryo.

This summary assumes that you are familar with C.  For a full list of
differences between C and Small, again, see the full documentation.

@section Small_Variables_Section Variables

@subsection Small_Type_Subsection Types

There is only one type, known as the "cell", which can hold an integer.

@subsection Small_Scope_Subsection Scope

The scope and usage of a variable depends on its declaration.

@li A local variable is normally declared with the @c new keyword. E.g.
    @code new variable @endcode
@li A static function variable is defined within a function with the
    @c static keyword.
@li A global static variable is one that is only available within the
    file it was declared in.  Again, use the @c static keyword, but outside
    of any function.
@li A stock variable is one that may not be compiled into a program if it
    is not used.  It is declared using @c stock.
@li A public variable is one that can be read by the host program using
    @ref embryo_program_variable_find.  It is declared using @c public
    keyword.

Remember that the keywords above are to be used on their own.  That is,
for example: @code public testvar @endcode not:
@code new public testvar @endcode

@subsection Small_Constants_Subsection Constants

You can declare constants in two ways:
@li Using the preprocessor macro @c \#define.
@li By inserting @c const between the keyword and variable name of a
    variable declaration.  For example, to declare the variable @c var1
    constant, you type @code new const var1 = 2 @endcode  Now @c var1
    cannot be changed.

@subsection Small_Arrays_Subsection Arrays

To declare an array, append square brackets to the end of the variable
name.  The following examples show how to declare arrays.  Note the
use of the ellipsis operator, which bases the array based on the last two
declared values:

@code
new msg[] = "A message."
new ints[] = 1, 3, 4
new ints2[20] = 1, 3         // All other elements 0.
new ints3[10] = 1, ...       // All elements = 1
new ints4[10] = 10, 20, ...  // Elements = 10 -> 100.
                               // The difference can be negative.
new ints5[3][3] = 1, 2, 3, 4, 5, 6, 7, 8, 9
@endcode

@note Array initialisers need to be constant.

@section Small_Func_Calls_Section Function Calls

A typical function declaration is as follows:

@code
testfunc(param) 
  // Do something ...
  // over a couple of lines.

@endcode

You can pass by reference.  That is, the parameter you pass is changed
outside of the function.  For example:

@code
testfunc(&param) 
  param = 10
  // The passed variable will be set to 10 outside of the function.

@endcode

To pass an array:

@code
testfunc(param[]) 
  // Do something to the array

@endcode

@note Arrays are passed by reference.

@section Small_Control_Subsection Control Structures.

Small has the following control structures, which similar to their C
counterparts:
@li @code if (expression) statement1 else statement2 @endcode
@li @code switch (expression) 
  case 0:
    statement1 // Can only be one statement.  Look Ma, no breaks!
  case 1..3:   // For values between 1 and 3 inclusive.
    statement2
  default:     // Optional
    statement3

@endcode
@li @code while(expression) statement @endcode
@li @code do statement while (expression) @endcode
@li @code for (init_expression; before_iter_test_expression; after_iter_expression) statement @endcode

@section Small_Preprocessor_Section Preprocessor

The following preprocessor directives are available:
@li @code #assert constant_expression @endcode
@li @code #define pattern replacement @endcode
@li @code #define pattern(%1,%2,...) replacement @endcode
@li @code #include filename @endcode
@li @code #if constant_expression
  // Various bits of code
#else
  // Other bits of code
#endif
@endcode
@li @code #undef pattern @endcode


@page Available_Native_Calls_Page Available Calls

Embryo provides a minimal set of native calls that can be used within
any Embryo script.  Those calls are detailed here.

@note Some of the "core" functions here are also described in the full
      Small documentation given

@todo Finish this section.

@section Args_ANC_Section Argument Functions

@subsection Numargs_Desc numargs

Returns the number of arguments passed to a function.  Useful
when dealing with variable argument lists.

@subsection Getargs_Desc getarg(arg, index=0)

Retrieves the argument number @c arg.  If the argument is an array,
use @c index to specify the index of the array to return.

@subsection Setargs_Desc setargs(arg, index=0, value)

Sets the argument number @c arg to the given @c arg.  @c index specifies
the index of @c arg to set if @c arg is an array.

@section String_ANC_Section String Functions

Functions that work on strings.

@subsection Atoi_Desc atoi

Translates an number in string form into an integer.

@subsection Fnmatch_Desc fnmatch

Buggered if I know what this does?

@subsection Strcmp_Desc strcmp

String comparing function.


@section Float_ANC_Section Float Functions

@subsection Float_Desc float

@subsection Atof_Desc atof

@subsection Float_Mul_Desc float_mul

@subsection Float_Div_Desc float_div

@subsection Float_Add_Desc float_add

@subsection Float_Sub_Desc float_sub

@subsection Fract_Desc fract

@subsection Round_Desc round

@subsection Float_Cmp_Desc float_cmp

@subsection Sqrt_Desc sqrt

@subsection Pow_Desc pow

@subsection Log_Desc log

@subsection Sin_Desc sin

@subsection Cos_Desc cos

@subsection Tan_Desc tan

@subsection Abs_Desc abs

Returns the absolute value of the given float.

@section Time_ANC_Section Time Functions

@subsection Seconds_Desc seconds()

@subsection Date_Desc date


@section Rand_ANC_Section Random Functions

@subsection Rand_Desc rand()

Returns a random integer.

@subsection Randf_Desc randf()

Returns a random float.

@file Embryo.h
@brief Embryo virtual machine library.

This file includes the routines needed for Embryo library interaction.
This is the @e only file you need to include.

 }
{ The following definitions are in Embryo.h, but I did not want to }
{ mess up the formatting of the file }
{*
  @def EMBRYO_FUNCTION_NONE
  An invalid/non-existent function.
 }
{*
  @def EMBRYO_FUNCTION_MAIN
  Start at program entry point.  For use with @ref embryo_program_run.
 }
{*
  @def EMBRYO_FUNCTION_CONT
  Continue from last address.  For use with @ref embryo_program_run.
 }
{*
  @def EMBRYO_PROGRAM_OK
  Program was run successfully.
 }
{*
  @def EMBRYO_PROGRAM_SLEEP
  The program's execution was interrupted by a Small @c sleep command.
 }
{*
  @def EMBRYO_PROGRAM_FAIL
  An error in the program caused it to fail.
 }
{$ifndef _EMBRYO_H}
{$define _EMBRYO_H}
{$include <Efl_Config.h>}
{$ifdef extern}
{$undef extern}
{$endif}
{ C++ extern C conditionnal removed }

const
  EMBRYO_VERSION_MAJOR = EFL_VERSION_MAJOR;  
  EMBRYO_VERSION_MINOR = EFL_VERSION_MINOR;  
{*
    * @typedef Embryo_Version
    * Represents the current version of Embryo
     }
{* < major (binary or source incompatible changes)  }
{* < minor (new features, bugfixes, major improvements version)  }
{* < micro (bugfix, internal improvements, no new features version)  }
{* < git revision (0 if a proper release or the git revision number Embryo is built from)  }
type
  PEmbryo_Version = ^TEmbryo_Version;
  TEmbryo_Version = record
      major : longint;
      minor : longint;
      micro : longint;
      revision : longint;
    end;
  var
    embryo_version : PEmbryo_Version;cvar;external;
{ potential error values  }
{ reserve the first 15 error codes for exit codes of the abstract machine  }
{* Forced exit  }
{* Assertion failed  }
{* Stack/heap collision  }
{* Index out of bounds  }
{* Invalid memory access  }
{* Invalid instruction  }
{* Stack underflow  }
{* Heap underflow  }
{* No callback, or invalid callback  }
{* Native function failed  }
{* Divide by zero  }
{* Go into sleepmode - code can be restarted  }
{* Out of memory  }
{* Invalid file format  }
{* File is for a newer version of the Embryo_Program  }
{* Function not found  }
{* Invalid index parameter (bad entry point)  }
{* Debugger cannot run  }
{* Embryo_Program not initialized (or doubly initialized)  }
{* Unable to set user data field (table full)  }
{* Cannot initialize the JIT  }
{* Parameter error  }
{* Domain error, expression result does not fit in range  }
type
  PEmbryo_Error = ^TEmbryo_Error;
  TEmbryo_Error =  Longint;
  Const
    EMBRYO_ERROR_NONE = 0;
    EMBRYO_ERROR_EXIT = 1;
    EMBRYO_ERROR_ASSERT = 2;
    EMBRYO_ERROR_STACKERR = 3;
    EMBRYO_ERROR_BOUNDS = 4;
    EMBRYO_ERROR_MEMACCESS = 5;
    EMBRYO_ERROR_INVINSTR = 6;
    EMBRYO_ERROR_STACKLOW = 7;
    EMBRYO_ERROR_HEAPLOW = 8;
    EMBRYO_ERROR_CALLBACK = 9;
    EMBRYO_ERROR_NATIVE = 10;
    EMBRYO_ERROR_DIVIDE = 11;
    EMBRYO_ERROR_SLEEP = 12;
    EMBRYO_ERROR_MEMORY = 16;
    EMBRYO_ERROR_FORMAT = 17;
    EMBRYO_ERROR_VERSION = 18;
    EMBRYO_ERROR_NOTFOUND = 19;
    EMBRYO_ERROR_INDEX = 20;
    EMBRYO_ERROR_DEBUG = 21;
    EMBRYO_ERROR_INIT = 22;
    EMBRYO_ERROR_USERDATA = 23;
    EMBRYO_ERROR_INIT_JIT = 24;
    EMBRYO_ERROR_PARAMS = 25;
    EMBRYO_ERROR_DOMAIN = 26;
;
{ program run return values  }
type
  PEmbryo_Status = ^TEmbryo_Status;
  TEmbryo_Status =  Longint;
  Const
    EMBRYO_PROGRAM_FAIL = 0;
    EMBRYO_PROGRAM_OK = 1;
    EMBRYO_PROGRAM_SLEEP = 2;
    EMBRYO_PROGRAM_BUSY = 3;
    EMBRYO_PROGRAM_TOOLONG = 4;
;
type
  PEmbryo_UCell = ^TEmbryo_UCell;
  TEmbryo_UCell = dword;

  PEmbryo_Cell = ^TEmbryo_Cell;
  TEmbryo_Cell = longint;
{* An invalid cell reference  }

const
  EMBRYO_CELL_NONE = $7fffffff;  
type

  PEmbryo_Function = ^TEmbryo_Function;
  TEmbryo_Function = longint;
{ possible function type values that are enumerated  }
{ An invalid/non existent function  }

const
  EMBRYO_FUNCTION_NONE = $7fffffff;  
{ Start at program entry point  }
  EMBRYO_FUNCTION_MAIN = -(1);  
{ Continue from last address  }
  EMBRYO_FUNCTION_CONT = -(2);  
type
  PEmbryo_Float_Cell = ^TEmbryo_Float_Cell;
  TEmbryo_Float_Cell = record
      case longint of
        0 : ( f : single );
        1 : ( c : TEmbryo_Cell );
      end;
{$if defined _MSC_VER || defined __SUNPRO_C}
{* Float to Embryo_Cell  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function EMBRYO_FLOAT_TO_CELL(f : longint) : longint;

{* Embryo_Cell to float  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function EMBRYO_CELL_TO_FLOAT(c : longint) : longint;

{$else}
{* Float to Embryo_Cell  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function EMBRYO_FLOAT_TO_CELL(f : longint) : longint;

{* Embryo_Cell to float  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function EMBRYO_CELL_TO_FLOAT(c : longint) : longint;

{$endif}
{*
    * @defgroup Embryo_Library_Group Library Maintenance Functions
    * @ingroup Embryo
    *
    * Functions that start up and shutdown the Embryo library.
     }
{*
 * Initialises the Embryo library.
 * @return  The number of times the library has been initialised without being
 *          shut down.
 * @ingroup Embryo_Library_Group
  }

function embryo_init:longint;cdecl;external;
{*
 * Shuts down the Embryo library.
 * @return  The number of times the library has been initialised without being
 *          shutdown.
 * @ingroup Embryo_Library_Group
  }
function embryo_shutdown:longint;cdecl;external;
{*
    * @defgroup Embryo_Program_Creation_Group Program Creation and Destruction Functions
    * @ingroup Embryo
    *
    * Functions that set up programs, and destroy them.
     }
{*
 * Creates a new Embryo program, with bytecode data that can be freed.
 * @param   data Pointer to the bytecode of the program.
 * @param   size Number of bytes of bytecode.
 * @return  A new Embryo program.
 * @ingroup Embryo_Program_Creation_Group
  }
function embryo_program_new(data:pointer; size:longint):PEmbryo_Program;cdecl;external;
{*
 * Creates a new Embryo program, with bytecode data that cannot be
 * freed.
 * @param   data Pointer to the bytecode of the program.
 * @param   size Number of bytes of bytecode.
 * @return  A new Embryo program.
 * @ingroup Embryo_Program_Creation_Group
  }
function embryo_program_const_new(data:pointer; size:longint):PEmbryo_Program;cdecl;external;
{*
 * Creates a new Embryo program based on the bytecode data stored in the
 * given file.
 * @param   file Filename of the given file.
 * @return  A new Embryo program.
 * @ingroup Embryo_Program_Creation_Group
  }
(* Const before type ignored *)
function embryo_program_load(file:Pchar):PEmbryo_Program;cdecl;external;
{*
 * Frees the given Embryo program.
 * @param   ep The given program.
 * @ingroup Embryo_Program_Creation_Group
  }
procedure embryo_program_free(ep:PEmbryo_Program);cdecl;external;
{*
 * @defgroup Embryo_Func_Group Function Functions
 * @ingroup Embryo
 *
 * Functions that deal with Embryo program functions.
  }
{*
 * Adds a native program call to the given Embryo program.
 * @param   ep   The given Embryo program.
 * @param   name The name for the call used in the script.
 * @param   func The function to use when the call is made.
 * @ingroup Embryo_Func_Group
  }
(* Const before type ignored *)
procedure embryo_program_native_call_add(ep:PEmbryo_Program; name:Pchar; func:function (ep:PEmbryo_Program; params:PEmbryo_Cell):TEmbryo_Cell);cdecl;external;
{*
 * @defgroup Embryo_Program_VM_Group Virtual Machine Functions
 * @ingroup Embryo
 *
 * Functions that deal with creating and destroying virtual machine sessions
 * for a given program.
 *
 * A given embryo program can have multiple virtual machine sessions running.
 * This is useful when you have a native call that in turn calls a function in
 * the embryo program.  The native call can start a new virtual machine
 * session to run the function it needs.  Once completed, the session can be
 * popped off the program's stack, and the native call can return its value
 * to the old session.
 *
 * A new virtual machine session is created by pushing a new virtual machine
 * onto the session stack of a program using @ref embryo_program_vm_push.
 * The current virtual machine session can be destroyed by calling
 * @ref embryo_program_vm_pop.
  }
{*
 * Resets the current virtual machine session of the given program.
 * @param   ep The given program.
 * @ingroup Embryo_Program_VM_Group
  }
procedure embryo_program_vm_reset(ep:PEmbryo_Program);cdecl;external;
{*
 * Starts a new virtual machine session for the given program.
 *
 * See @ref Embryo_Program_VM_Group for more information about how this works.
 *
 * @param   ep The given program.
 * @ingroup Embryo_Program_VM_Group
  }
procedure embryo_program_vm_push(ep:PEmbryo_Program);cdecl;external;
{*
 * Frees the current virtual machine session associated with the given program.
 *
 * See @ref Embryo_Program_VM_Group for more information about how this works.
 * Note that you will need to retrieve any return data or data on the stack
 * before you pop.
 *
 * @param   ep The given program.
 * @ingroup Embryo_Program_VM_Group
  }
procedure embryo_program_vm_pop(ep:PEmbryo_Program);cdecl;external;
{*
 * @defgroup Embryo_Swap_Group Byte Swapping Functions
 * @ingroup Embryo
 *
 * Functions that are used to ensure that integers passed to the
 * virtual machine are in small endian format.  These functions are
 * used to ensure that the virtual machine operates correctly on big
 * endian machines.
  }
{*
 * Ensures that the given unsigned short integer is in the small
 * endian format.
 * @param   v Pointer to the given integer.
 * @ingroup Embryo_Swap_Group
  }
procedure embryo_swap_16(v:Pword);cdecl;external;
{*
 * Ensures that the given unsigned integer is in the small endian
 * format.
 * @param   v Pointer to the given integer.
 * @ingroup Embryo_Swap_Group
  }
procedure embryo_swap_32(v:Pdword);cdecl;external;
{*
 * Returns the function in the given program with the given name.
 * @param   ep The given program.
 * @param   name The given function name.
 * @return  The function if successful.  Otherwise, @c EMBRYO_FUNCTION_NONE.
 * @ingroup Embryo_Func_Group
  }
(* Const before type ignored *)
function embryo_program_function_find(ep:PEmbryo_Program; name:Pchar):TEmbryo_Function;cdecl;external;
{*
 * @defgroup Embryo_Public_Variable_Group Public Variable Access Functions
 * @ingroup Embryo
 *
 * In an Embryo program, a global variable can be declared public, as
 * described in @ref Small_Scope_Subsection.  The functions here allow
 * the host program to access these public variables.
  }
{*
 * Retrieves the location of the public variable in the given program
 * with the given name.
 * @param   ep   The given program.
 * @param   name The given name.
 * @return  The address of the variable if found.  @c EMBRYO_CELL_NONE
 *          otherwise.
 * @ingroup Embryo_Public_Variable_Group
  }
(* Const before type ignored *)
function embryo_program_variable_find(ep:PEmbryo_Program; name:Pchar):TEmbryo_Cell;cdecl;external;
{*
 * Retrieves the number of public variables in the given program.
 * @param   ep The given program.
 * @return  The number of public variables.
 * @ingroup Embryo_Public_Variable_Group
  }
function embryo_program_variable_count_get(ep:PEmbryo_Program):longint;cdecl;external;
{*
 * Retrieves the location of the public variable in the given program
 * with the given identifier.
 * @param   ep  The given program.
 * @param   num The identifier of the public variable.
 * @return  The virtual machine address of the variable if found.
 *          @c EMBRYO_CELL_NONE otherwise.
 * @ingroup Embryo_Public_Variable_Group
  }
function embryo_program_variable_get(ep:PEmbryo_Program; num:longint):TEmbryo_Cell;cdecl;external;
{*
 * @defgroup Embryo_Error_Group Error Functions
 * @ingroup Embryo
 *
 * Functions that set and retrieve error codes in Embryo programs.
  }
{*
 * Sets the error code for the given program to the given code.
 * @param   ep The given program.
 * @param   error The given error code.
 * @ingroup Embryo_Error_Group
  }
procedure embryo_program_error_set(ep:PEmbryo_Program; error:TEmbryo_Error);cdecl;external;
{*
 * Retrieves the current error code for the given program.
 * @param   ep The given program.
 * @return  The current error code.
 * @ingroup Embryo_Error_Group
  }
function embryo_program_error_get(ep:PEmbryo_Program):TEmbryo_Error;cdecl;external;
{*
 * @defgroup Embryo_Program_Data_Group Program Data Functions
 * @ingroup Embryo
 *
 * Functions that set and retrieve data associated with the given
 * program.
  }
{*
 * Sets the data associated to the given program.
 * @param   ep   The given program.
 * @param   data New bytecode data.
 * @ingroup Embryo_Program_Data_Group
  }
procedure embryo_program_data_set(ep:PEmbryo_Program; data:pointer);cdecl;external;
{*
 * Retrieves the data associated to the given program.
 * @param   ep The given program.
 * @ingroup Embryo_Program_Data_Group
  }
function embryo_program_data_get(ep:PEmbryo_Program):pointer;cdecl;external;
{*
 * Retrieves a string describing the given error code.
 * @param   error The given error code.
 * @return  String describing the given error code.  If the given code is not
 *          known, the string "(unknown)" is returned.
 * @ingroup Embryo_Error_Group
  }
(* Const before type ignored *)
function embryo_error_string_get(error:TEmbryo_Error):Pchar;cdecl;external;
{*
 * @defgroup Embryo_Data_String_Group Embryo Data String Functions
 * @ingroup Embryo
 *
 * Functions that operate on strings in the memory of a virtual machine.
  }
{*
 * Retrieves the length of the string starting at the given cell.
 * @param   ep       The program the cell is part of.
 * @param   str_cell Pointer to the first cell of the string.
 * @return  The length of the string.  @c 0 is returned if there is an error.
 * @ingroup Embryo_Data_String_Group
  }
function embryo_data_string_length_get(ep:PEmbryo_Program; str_cell:PEmbryo_Cell):longint;cdecl;external;
{*
 * Copies the string starting at the given cell to the given buffer.
 * @param   ep       The program the cell is part of.
 * @param   str_cell Pointer to the first cell of the string.
 * @param   dst      The given buffer.
 * @ingroup Embryo_Data_String_Group
  }
procedure embryo_data_string_get(ep:PEmbryo_Program; str_cell:PEmbryo_Cell; dst:Pchar);cdecl;external;
{*
 * Copies string in the given buffer into the virtual machine memory
 * starting at the given cell.
 * @param ep       The program the cell is part of.
 * @param src      The given buffer.
 * @param str_cell Pointer to the first cell to copy the string to.
 * @ingroup Embryo_Data_String_Group
  }
(* Const before type ignored *)
procedure embryo_data_string_set(ep:PEmbryo_Program; src:Pchar; str_cell:PEmbryo_Cell);cdecl;external;
{*
 * Retreives a pointer to the address in the virtual machine given by the
 * given cell.
 * @param   ep   The program whose virtual machine address is being queried.
 * @param   addr The given cell.
 * @return  A pointer to the cell at the given address.
 * @ingroup Embryo_Data_String_Group
  }
function embryo_data_address_get(ep:PEmbryo_Program; addr:TEmbryo_Cell):PEmbryo_Cell;cdecl;external;
{*
 * @defgroup Embryo_Heap_Group Heap Functions
 * @ingroup Embryo
 *
 * The heap is an area of memory that can be allocated for program
 * use at runtime.  The heap functions here change the amount of heap
 * memory available.
  }
{*
 * Increases the size of the heap of the given virtual machine by the given
 * number of Embryo_Cells.
 * @param   ep    The program with the given virtual machine.
 * @param   cells The given number of Embryo_Cells.
 * @return  The address of the new memory region on success.
 *          @c EMBRYO_CELL_NONE otherwise.
 * @ingroup Embryo_Heap_Group
  }
function embryo_data_heap_push(ep:PEmbryo_Program; cells:longint):TEmbryo_Cell;cdecl;external;
{*
 * Decreases the size of the heap of the given virtual machine down to the
 * given size.
 * @param   ep      The program with the given virtual machine.
 * @param   down_to The given size.
 * @ingroup Embryo_Heap_Group
  }
procedure embryo_data_heap_pop(ep:PEmbryo_Program; down_to:TEmbryo_Cell);cdecl;external;
{*
 * @defgroup Embryo_Run_Group Program Run Functions
 * @ingroup Embryo
 *
 * Functions that are involved in actually running functions in an
 * Embryo program.
  }
{*
 * Returns the number of virtual machines are running for the given program.
 * @param   ep The given program.
 * @return  The number of virtual machines running.
 * @ingroup Embryo_Run_Group
  }
function embryo_program_recursion_get(ep:PEmbryo_Program):longint;cdecl;external;
{*
 * Runs the given function of the given Embryo program in the current
 * virtual machine.  The parameter @p fn can be found using
 * @ref embryo_program_function_find.
 *
 * @note For Embryo to be able to run a function, it must have been
 *       declared @c public in the Small source code.
 *
 * @param   ep The given program.
 * @param   func The given function.  Normally "main", in which case the
 *             constant @c EMBRYO_FUNCTION_MAIN can be used.
 * @return  @c EMBRYO_PROGRAM_OK on success.  @c EMBRYO_PROGRAM_SLEEP if the
 *          program is halted by the Small @c sleep call.
 *          @c EMBRYO_PROGRAM_FAIL if there is an error.
 *          @c EMBRYO_PROGRAM_TOOLONG if the program executes for longer than
 *          it is allowed to in abstract machine instruction count.
 * @ingroup Embryo_Run_Group
  }
function embryo_program_run(ep:PEmbryo_Program; func:TEmbryo_Function):TEmbryo_Status;cdecl;external;
{*
 * Retreives the return value of the last called function of the given
 * program.
 * @param   ep The given program.
 * @return  An Embryo_Cell representing the return value of the function
 *          that was last called.
 * @ingroup Embryo_Run_Group
  }
function embryo_program_return_value_get(ep:PEmbryo_Program):TEmbryo_Cell;cdecl;external;
{*
 * Sets the maximum number of abstract machine cycles any given program run
 * can execute before being put to sleep and returning.
 *
 * @param   ep The given program.
 * @param   max The number of machine cycles as a limit.
 *
 * This sets the maximum number of abstract machine (virtual machine)
 * instructions that a single run of an embryo function (even if its main)
 * can use before embryo embryo_program_run() reutrns with the value
 * EMBRYO_PROGRAM_TOOLONG. If the function fully executes within this number
 * of cycles, embryo_program_run() will return as normal with either
 * EMBRYO_PROGRAM_OK, EMBRYO_PROGRAM_FAIL or EMBRYO_PROGRAM_SLEEP. If the
 * run exceeds this instruction count, then EMBRYO_PROGRAM_TOOLONG will be
 * returned indicating the program exceeded its run count. If the app wishes
 * to continue running this anyway - it is free to process its own events or
 * whatever it wants and continue the function by calling
 * embryo_program_run(program, EMBRYO_FUNCTION_CONT); which will start the
 * run again until the instruction count is reached. This can keep being done
 * to allow the calling program to still be able to control things outside the
 * embryo function being called. If the maximum run cycle count is 0 then the
 * program is allowed to run forever only returning when it is done.
 *
 * It is important to note that abstract machine cycles are NOT the same as
 * the host machine cpu cycles. They are not fixed in runtime per cycle, so
 * this is more of a helper tool than a way to HARD-FORCE a script to only
 * run for a specific period of time. If the cycle count is set to something
 * low like 5000 or 1000, then every 1000 (or 5000) cycles control will be
 * returned to the calling process where it can check a timer to see if a
 * physical runtime limit has been elapsed and then abort running further
 * assuming a "runaway script" or keep continuing the script run. This
 * limits resolution to only that many cycles which do not take a determined
 * amount of time to execute, as this varies from cpu to cpu and also depends
 * on how loaded the system is. Making the max cycle run too low will
 * impact performance requiring the abstract machine to do setup and teardown
 * cycles too often comapred to cycles actually executed.
 *
 * Also note it does NOT include nested abstract machines. IF this abstract
 * machine run calls embryo script that calls a native function that in turn
 * calls more embryo script, then the 2nd (and so on) levels are not included
 * in this run count. They can set their own max instruction count values
 * separately.
 *
 * The default max cycle run value is 0 in any program until set with this
 * function.
 *
 * @ingroup Embryo_Run_Group
  }
procedure embryo_program_max_cycle_run_set(ep:PEmbryo_Program; max:longint);cdecl;external;
{*
 * Retreives the maximum number of abstract machine cycles a program is allowed
 * to run.
 * @param   ep The given program.
 * @return  The number of cycles a run cycle is allowed to run for this
 *          program.
 *
 * This returns the value set by embryo_program_max_cycle_run_set(). See
 * embryo_program_max_cycle_run_set() for more information.
 *
 * @ingroup Embryo_Run_Group
  }
function embryo_program_max_cycle_run_get(ep:PEmbryo_Program):longint;cdecl;external;
{*
 * @defgroup Embryo_Parameter_Group Function Parameter Functions
 * @ingroup Embryo
 *
 * Functions that set parameters for the next function that is called.
  }
{*
 * Pushes an Embryo_Cell onto the function stack to use as a parameter for
 * the next function that is called in the given program.
 * @param   ep   The given program.
 * @param   cell The Embryo_Cell to push onto the stack.
 * @return  @c 1 if successful.  @c 0 otherwise.
 * @ingroup Embryo_Parameter_Group
  }
function embryo_parameter_cell_push(ep:PEmbryo_Program; cell:TEmbryo_Cell):longint;cdecl;external;
{*
 * Pushes a string onto the function stack to use as a parameter for the
 * next function that is called in the given program.
 * @param   ep The given program.
 * @param   str The string to push onto the stack.
 * @return  @c 1 if successful.  @c 0 otherwise.
 * @ingroup Embryo_Parameter_Group
  }
(* Const before type ignored *)
function embryo_parameter_string_push(ep:PEmbryo_Program; str:Pchar):longint;cdecl;external;
{*
 * Pushes an array of Embryo_Cells onto the function stack to be used as
 * parameters for the next function that is called in the given program.
 * @param   ep    The given program.
 * @param   cells The array of Embryo_Cells.
 * @param   num   The number of cells in @p cells.
 * @return  @c 1 if successful.  @c 0 otherwise.
 * @ingroup Embryo_Parameter_Group
  }
function embryo_parameter_cell_array_push(ep:PEmbryo_Program; cells:PEmbryo_Cell; num:longint):longint;cdecl;external;

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function EMBRYO_FLOAT_TO_CELL(f : longint) : longint;
begin
  EMBRYO_FLOAT_TO_CELL:=(PEmbryo_Float_Cell(@(f)))^.c;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function EMBRYO_CELL_TO_FLOAT(c : longint) : longint;
begin
  EMBRYO_CELL_TO_FLOAT:=(PEmbryo_Float_Cell(@(c)))^.f;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function EMBRYO_FLOAT_TO_CELL(f : longint) : longint;
begin
  EMBRYO_FLOAT_TO_CELL:=(TEmbryo_Float_Cell(f)).c;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function EMBRYO_CELL_TO_FLOAT(c : longint) : longint;
begin
  EMBRYO_CELL_TO_FLOAT:=(TEmbryo_Float_Cell(c)).f;
end;


end.
