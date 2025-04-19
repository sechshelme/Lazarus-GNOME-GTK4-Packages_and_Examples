unit tcl;

interface

uses
  ctypes;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * tcl.h --
 *
 *	This header file describes the externally-visible facilities of the
 *	Tcl interpreter.
 *
 * Copyright (c) 1987-1994 The Regents of the University of California.
 * Copyright (c) 1993-1996 Lucent Technologies.
 * Copyright (c) 1994-1998 Sun Microsystems, Inc.
 * Copyright (c) 1998-2000 by Scriptics Corporation.
 * Copyright (c) 2002 by Kevin B. Kenny.  All rights reserved.
 *
 * See the file "license.terms" for information on usage and redistribution of
 * this file, and for a DISCLAIMER OF ALL WARRANTIES.
  }
{$ifndef _TCL}
{$define _TCL}
{
 * For C++ compilers, use extern "C"
  }
{ C++ extern C conditionnal removed }
{
 * The following defines are used to indicate the various release levels.
  }

const
  TCL_ALPHA_RELEASE = 0;  
  TCL_BETA_RELEASE = 1;  
  TCL_FINAL_RELEASE = 2;  
{
 * When version numbers change here, must also go into the following files and
 * update the version numbers:
 *
 * library/init.tcl	(1 LOC patch)
 * unix/configure.in	(2 LOC Major, 2 LOC minor, 1 LOC patch)
 * win/configure.in	(as above)
 * win/tcl.m4		(not patchlevel)
 * README.md		(sections 0 and 2, with and without separator)
 * macosx/Tcl-Common.xcconfig (not patchlevel) 1 LOC
 * win/README		(not patchlevel) (sections 0 and 2)
 * unix/tcl.spec	(1 LOC patch)
 * tools/tcl.hpj.in	(not patchlevel, for windows installer)
  }
{$if !defined(TCL_MAJOR_VERSION)}

const
  TCL_MAJOR_VERSION = 8;  
{$endif}
{$if TCL_MAJOR_VERSION != 8}
{$error "This header-file is for Tcl 8 only"}
{$endif}

const
  TCL_MINOR_VERSION = 6;  
  TCL_RELEASE_LEVEL = TCL_FINAL_RELEASE;  
  TCL_RELEASE_SERIAL = 14;  
  TCL_VERSION = '8.6';  
  TCL_PATCH_LEVEL = '8.6.14';  
{
 *----------------------------------------------------------------------------
 * The following definitions set up the proper options for Windows compilers.
 * We use this method because there is no autoconf equivalent.
  }
{$ifdef _WIN32}
{$ifndef __WIN32__}
{$define __WIN32__}
{$endif}
{$ifndef WIN32}
{$define WIN32}
{$endif}
{$endif}
{
 * Utility macros: STRINGIFY takes an argument and wraps it in "" (double
 * quotation marks), JOIN joins two arguments.
  }
{
 * A special definition used to allow this header file to be included from
 * windows resource files so that they can obtain version information.
 * RC_INVOKED is defined by default by the windows RC tool.
 *
 * Resource compilers don't like all the C stuff, like typedefs and function
 * declarations, that occur below, so block them out.
  }
{$ifndef RC_INVOKED}
{
 * Special macro to define mutexes, that doesn't do anything if we are not
 * using threads.
  }
{
 * Tcl's public routine Tcl_FSSeek() uses the values SEEK_SET, SEEK_CUR, and
 * SEEK_END, all #define'd by stdio.h .
 *
 * Also, many extensions need stdio.h, and they've grown accustomed to tcl.h
 * providing it for them rather than #include-ing it themselves as they
 * should, so also for their sake, we keep the #include to be consistent with
 * prior Tcl releases.
  }
{$include <stdio.h>}
{
 *----------------------------------------------------------------------------
 * Support for functions with a variable number of arguments.
 *
 * The following TCL_VARARGS* macros are to support old extensions
 * written for older versions of Tcl where the macros permitted
 * support for the varargs.h system as well as stdarg.h .
 *
 * New code should just directly be written to use stdarg.h conventions.
  }
{
 * Allow a part of Tcl's API to be explicitly marked as deprecated.
 *
 * Used to make TIP 330/336 generate moans even if people use the
 * compatibility macros. Change your code, guys! We won't support you forever.
  }
{
 *----------------------------------------------------------------------------
 * Macros used to declare a function to be exported by a DLL. Used by Windows,
 * maps to no-op declarations on non-Windows systems. The default build on
 * windows is for a DLL, which causes the DLLIMPORT and DLLEXPORT macros to be
 * nonempty. To build a static library, the macro STATIC_BUILD should be
 * defined.
 *
 * Note: when building static but linking dynamically to MSVCRT we must still
 *       correctly decorate the C library imported function.  Use CRTIMPORT
 *       for this purpose.  _DLL is defined by the compiler when linking to
 *       MSVCRT.
  }
{
 * These macros are used to control whether functions are being declared for
 * import or export. If a function is being declared while it is being built
 * to be included in a shared library, then it should have the DLLEXPORT
 * storage class. If is being declared for use by a module that is going to
 * link against the shared library, then it should have the DLLIMPORT storage
 * class. If the symbol is being declared for a static build or for use from a
 * stub library, then the storage class should be empty.
 *
 * The convention is that a macro called BUILD_xxxx, where xxxx is the name of
 * a library we are building, is set on the compile line for sources that are
 * to be placed in the library. When this macro is set, the storage class will
 * be set to DLLEXPORT. At the end of the header file, the storage class will
 * be reset to DLLIMPORT.
  }
{
 * The following _ANSI_ARGS_ macro is to support old extensions
 * written for older versions of Tcl where it permitted support
 * for compilers written in the pre-prototype era of C.
 *
 * New code should use prototypes.
  }
{
 * Definitions that allow this header file to be used either with or without
 * ANSI C features.
  }
{
 * Make sure extern isn't defined elsewhere.
  }
{
 *----------------------------------------------------------------------------
 * The following code is copied from winnt.h. If we don't replicate it here,
 * then <windows.h> can't be included after tcl.h, since tcl.h also defines
 * VOID. This block is skipped under Cygwin and Mingw.
  }
type
  PCHAR = ^TCHAR;
  TCHAR = char;

  PSHORT = ^TSHORT;
  TSHORT = smallint;

  PLONG = ^TLONG;
  TLONG = longint;
{
 * Miscellaneous declarations.
  }
{$ifndef _CLIENTDATA}
{$ifndef NO_VOID}
type
  PClientData = ^TClientData;
  TClientData = pointer;
{$else}
type
  PClientData = ^TClientData;
  TClientData = Plongint;
{$endif}
{$define _CLIENTDATA}
{$endif}
{
 * Darwin specific configure overrides (to support fat compiles, where
 * configure runs only once for multiple architectures):
  }
{ Cross-compiling 32-bit on a 64-bit platform? Then our
 * configure script does the wrong thing. Correct that here.
  }
{
 * Define Tcl_WideInt to be a type that is (at least) 64-bits wide, and define
 * Tcl_WideUInt to be the unsigned variant of that type (assuming that where
 * we have one, we can have the other.)
 *
 * Also defines the following macros:
 * TCL_WIDE_INT_IS_LONG - if wide ints are really longs (i.e. we're on a
 *	LP64 system such as modern Solaris or Linux ... not including Win64)
 * Tcl_WideAsLong - forgetful converter from wideInt to long.
 * Tcl_LongAsWide - sign-extending converter from long to wideInt.
 * Tcl_WideAsDouble - converter from wideInt to double.
 * Tcl_DoubleAsWide - converter from double to wideInt.
 *
 * The following invariant should hold for any long value 'longVal':
 *	longVal == Tcl_WideAsLong(Tcl_LongAsWide(longVal))
 *
 * Note on converting between Tcl_WideInt and strings. This implementation (in
 * tclObj.c) depends on the function
 * snprintf(...,"%" TCL_LL_MODIFIER "d",...).
  }
type
  PTcl_WideInt = ^TTcl_WideInt;
  TTcl_WideInt = int64;

  PTcl_WideUInt = ^TTcl_WideUInt;
  TTcl_WideUInt = qword;
{$ifdef _WIN32}
{$ifdef __BORLANDC__}
type
  Tstati64 = TTcl_StatBuf;
(*** was #elif ****){$else defined(_WIN64) || defined(_USE_64BIT_TIME_T)}
type
  T_stat64 = TTcl_StatBuf;
(*** was #elif ****){$else (defined(_MSC_VER) && (_MSC_VER < 1400)) || defined(_USE_32BIT_TIME_T)}
type
  Tstati64 = TTcl_StatBuf;
{$else}
type
  Tstat32i64 = TTcl_StatBuf;
{$endif}
{ _MSC_VER < 1400  }
(*** was #elif ****){$else defined(__CYGWIN__)}
{ Here is a 2-byte gap  }
{ Here is a 4-byte gap  }
type
  PTcl_StatBuf = ^TTcl_StatBuf;
  TTcl_StatBuf = record
      st_dev : dword;
      st_ino : word;
      st_mode : word;
      st_nlink : smallint;
      st_uid : smallint;
      st_gid : smallint;
      st_rdev : dword;
      st_size : int64;
      st_atim : record
          tv_sec : longint;
        end;
      st_mtim : record
          tv_sec : longint;
        end;
      st_ctim : record
          tv_sec : longint;
        end;
    end;
(*** was #elif ****){$else defined(HAVE_STRUCT_STAT64) && !defined(__APPLE__)}
type
  Tstat64 = TTcl_StatBuf;
{$else}
type
  Tstat = TTcl_StatBuf;
{$endif}
{
 *----------------------------------------------------------------------------
 * Data structures defined opaquely in this module. The definitions below just
 * provide dummy types. A few fields are made visible in Tcl_Interp
 * structures, namely those used for returning a string result from commands.
 * Direct access to the result field is discouraged in Tcl 8.0. The
 * interpreter result is either an object or a string, and the two values are
 * kept consistent unless some C code sets interp->result directly.
 * Programmers should use either the function Tcl_GetObjResult() or
 * Tcl_GetStringResult() to read the interpreter's result. See the SetResult
 * man page for details.
 *
 * Note: any change to the Tcl_Interp definition below must be mirrored in the
 * "real" definition in tclInt.h.
 *
 * Note: Tcl_ObjCmdProc functions do not directly set result and freeProc.
 * Instead, they set a Tcl_Obj member in the "real" structure that can be
 * accessed with Tcl_GetObjResult() and Tcl_SetObjResult().
  }
{$if !defined(TCL_NO_DEPRECATED)}
{ TIP #330: Strongly discourage extensions from using the string
     * result.  }
{$ifdef USE_INTERP_RESULT}
{ If the last command returned a string
				 * result, this points to it.  }
{ Zero means the string result is statically
				 * allocated. TCL_DYNAMIC means it was
				 * allocated with ckalloc and should be freed
				 * with ckfree. Other values give the address
				 * of function to invoke to free the result.
				 * Tcl_Eval must free it before executing next
				 * command.  }
{$else}
{ Don't use in extensions!  }
{ Don't use in extensions!  }
{$endif}
{$ifdef USE_INTERP_ERRORLINE}
{ When TCL_ERROR is returned, this gives the
				 * line number within the command where the
				 * error occurred (1 if first line).  }
{$else}
{ Don't use in extensions!  }
{$endif}
{$endif}
{ !TCL_NO_DEPRECATED  }
type
  PTcl_Interp = ^TTcl_Interp;
  TTcl_Interp = record
      result : Pchar;
      freeProc : procedure (blockPtr:Pchar);cdecl;
      resultDontUse : Pchar;
      freeProcDontUse : procedure (para1:Pchar);cdecl;
      errorLine : longint;
      errorLineDontUse : longint;
    end;

  PTcl_AsyncHandler = ^TTcl_AsyncHandler;
  TTcl_AsyncHandler = PTcl_AsyncHandler_;

  PTcl_Channel = ^TTcl_Channel;
  TTcl_Channel = PTcl_Channel_;

  PTcl_ChannelTypeVersion = ^TTcl_ChannelTypeVersion;
  TTcl_ChannelTypeVersion = PTcl_ChannelTypeVersion_;

  PTcl_Command = ^TTcl_Command;
  TTcl_Command = PTcl_Command_;

  PTcl_Condition = ^TTcl_Condition;
  TTcl_Condition = PTcl_Condition_;

  PTcl_Dict = ^TTcl_Dict;
  TTcl_Dict = PTcl_Dict_;

  PTcl_EncodingState = ^TTcl_EncodingState;
  TTcl_EncodingState = PTcl_EncodingState_;

  PTcl_Encoding = ^TTcl_Encoding;
  TTcl_Encoding = PTcl_Encoding_;

  PTcl_InterpState = ^TTcl_InterpState;
  TTcl_InterpState = PTcl_InterpState_;

  PTcl_LoadHandle = ^TTcl_LoadHandle;
  TTcl_LoadHandle = PTcl_LoadHandle_;

  PTcl_Mutex = ^TTcl_Mutex;
  TTcl_Mutex = PTcl_Mutex_;

  PTcl_Pid = ^TTcl_Pid;
  TTcl_Pid = PTcl_Pid_;

  PTcl_RegExp = ^TTcl_RegExp;
  TTcl_RegExp = PTcl_RegExp_;

  PTcl_ThreadDataKey = ^TTcl_ThreadDataKey;
  TTcl_ThreadDataKey = PTcl_ThreadDataKey_;

  PTcl_ThreadId = ^TTcl_ThreadId;
  TTcl_ThreadId = PTcl_ThreadId_;

  PTcl_TimerToken = ^TTcl_TimerToken;
  TTcl_TimerToken = PTcl_TimerToken_;

  PTcl_Trace = ^TTcl_Trace;
  TTcl_Trace = PTcl_Trace_;

  PTcl_Var = ^TTcl_Var;
  TTcl_Var = PTcl_Var_;

  PTcl_ZlibStream = ^TTcl_ZlibStream;
  TTcl_ZlibStream = PTcl_ZLibStream_;
{
 *----------------------------------------------------------------------------
 * Definition of the interface to functions implementing threads. A function
 * following this definition is given to each call of 'Tcl_CreateThread' and
 * will be called as the main fuction of the new thread created by that call.
  }
{$if defined _WIN32}
type
{$else}
type
{$endif}
{
 * Threading function return types used for abstracting away platform
 * differences when writing a Tcl_ThreadCreateProc. See the NewThread function
 * in generic/tclThreadTest.c for it's usage.
  }
{
 * Definition of values for default stacksize and the possible flags to be
 * given to Tcl_CreateThread.
  }
{ Use default size for stack.  }

const
  TCL_THREAD_STACK_DEFAULT = 0;  
{ Standard flags, default
					 * behaviour.  }
  TCL_THREAD_NOFLAGS = 0000;  
{ Mark the thread as joinable.  }
  TCL_THREAD_JOINABLE = 0001;  
{
 * Flag values passed to Tcl_StringCaseMatch.
  }
  TCL_MATCH_NOCASE = 1 shl 0;  
{
 * Flag values passed to Tcl_GetRegExpFromObj.
  }
{ BREs (convenience).  }
  TCL_REG_BASIC = 000000;  
{ EREs.  }
  TCL_REG_EXTENDED = 000001;  
{ Advanced features in EREs.  }
  TCL_REG_ADVF = 000002;  
{ AREs (which are also EREs).  }
  TCL_REG_ADVANCED = 000003;  
{ No special characters, none.  }
  TCL_REG_QUOTE = 000004;  
{ Ignore case.  }
  TCL_REG_NOCASE = 000010;  
{ Don't care about subexpressions.  }
  TCL_REG_NOSUB = 000020;  
{ Expanded format, white space &
					 * comments.  }
  TCL_REG_EXPANDED = 000040;  
{ \n doesn't match . or [^ ]  }
  TCL_REG_NLSTOP = 000100;  
{ ^ matches after \n, $ before.  }
  TCL_REG_NLANCH = 000200;  
{ Newlines are line terminators.  }
  TCL_REG_NEWLINE = 000300;  
{ Report details on partial/limited
					 * matches.  }
  TCL_REG_CANMATCH = 001000;  
{
 * Flags values passed to Tcl_RegExpExecObj.
  }
{ Beginning of string does not match ^.   }
  TCL_REG_NOTBOL = 0001;  
{ End of string does not match $.  }
  TCL_REG_NOTEOL = 0002;  
{
 * Structures filled in by Tcl_RegExpInfo. Note that all offset values are
 * relative to the start of the match string, not the beginning of the entire
 * string.
  }
{ Character offset of first character in
				 * match.  }
{ Character offset of first character after
				 * the match.  }
type
  PTcl_RegExpIndices = ^TTcl_RegExpIndices;
  TTcl_RegExpIndices = record
      start : longint;
      end : longint;
    end;
{ Number of subexpressions in the compiled
				 * expression.  }
{ Array of nsubs match offset pairs.  }
{ The offset at which a subsequent match
				 * might begin.  }
{ Reserved for later use.  }

  PTcl_RegExpInfo = ^TTcl_RegExpInfo;
  TTcl_RegExpInfo = record
      nsubs : longint;
      matches : PTcl_RegExpIndices;
      extendStart : longint;
      reserved : longint;
    end;
{
 * Picky compilers complain if this typdef doesn't appear before the struct's
 * reference in tclDecls.h.
  }

  PTcl_Stat_ = ^TTcl_Stat_;
  TTcl_Stat_ = PTcl_StatBuf;

  PTcl_OldStat_ = ^TTcl_OldStat_;
  TTcl_OldStat_ = Pstat;
{
 *----------------------------------------------------------------------------
 * When a TCL command returns, the interpreter contains a result from the
 * command. Programmers are strongly encouraged to use one of the functions
 * Tcl_GetObjResult() or Tcl_GetStringResult() to read the interpreter's
 * result. See the SetResult man page for details. Besides this result, the
 * command function returns an integer code, which is one of the following:
 *
 * TCL_OK		Command completed normally; the interpreter's result
 *			contains the command's result.
 * TCL_ERROR		The command couldn't be completed successfully; the
 *			interpreter's result describes what went wrong.
 * TCL_RETURN		The command requests that the current function return;
 *			the interpreter's result contains the function's
 *			return value.
 * TCL_BREAK		The command requests that the innermost loop be
 *			exited; the interpreter's result is meaningless.
 * TCL_CONTINUE		Go on to the next iteration of the current loop; the
 *			interpreter's result is meaningless.
  }

const
  TCL_OK = 0;  
  TCL_ERROR = 1;  
  TCL_RETURN = 2;  
  TCL_BREAK = 3;  
  TCL_CONTINUE = 4;  
  TCL_RESULT_SIZE = 200;  
{
 *----------------------------------------------------------------------------
 * Flags to control what substitutions are performed by Tcl_SubstObj():
  }
  TCL_SUBST_COMMANDS = 001;  
  TCL_SUBST_VARIABLES = 002;  
  TCL_SUBST_BACKSLASHES = 004;  
  TCL_SUBST_ALL = 007;  
{
 * Argument descriptors for math function callbacks in expressions:
  }
type
  PTcl_ValueType = ^TTcl_ValueType;
  TTcl_ValueType =  Longint;
  Const
    TCL_INT = 0;
    TCL_DOUBLE = 1;
    TCL_EITHER = 2;
    TCL_WIDE_INT = 3;
;
{ Indicates intValue or doubleValue is valid,
				 * or both.  }
{ Integer value.  }
{ Double-precision floating value.  }
{ Wide (min. 64-bit) integer value.  }
type
  PTcl_Value = ^TTcl_Value;
  TTcl_Value = record
      _type : TTcl_ValueType;
      intValue : longint;
      doubleValue : Tdouble;
      wideValue : TTcl_WideInt;
    end;
{
 * Forward declaration of Tcl_Obj to prevent an error when the forward
 * reference to Tcl_Obj is encountered in the function types declared below.
  }
  PTcl_Obj = ^TTcl_Obj;
  TTcl_Obj = record
      {undefined structure}
    end;

{
 *----------------------------------------------------------------------------
 * Function types defined by Tcl:
  }
{ ?????????????????????????? }
{
 *----------------------------------------------------------------------------
 * The following structure represents a type of object, which is a particular
 * internal representation for an object plus a set of functions that provide
 * standard operations on objects of that type.
  }
{ Name of the type, e.g. "int".  }
{ Called to free any storage for the type's
				 * internal rep. NULL if the internal rep does
				 * not need freeing.  }
{ Called to create a new object as a copy of
				 * an existing object.  }
{ Called to update the string rep from the
				 * type's internal representation.  }
{ Called to convert the object's internal rep
				 * to this type. Frees the internal rep of the
				 * old type. Returns TCL_ERROR on failure.  }

  PTcl_ObjType = ^TTcl_ObjType;
  TTcl_ObjType = record
      name : Pchar;
      freeIntRepProc : PTcl_FreeInternalRepProc;
      dupIntRepProc : PTcl_DupInternalRepProc;
      updateStringProc : PTcl_UpdateStringProc;
      setFromAnyProc : PTcl_SetFromAnyProc;
    end;
{
 * One of the following structures exists for each object in the Tcl system.
 * An object stores a value as either a string, some internal representation,
 * or both.
  }
{ When 0 the object will be freed.  }
{ This points to the first byte of the
				 * object's string representation. The array
				 * must be followed by a null byte (i.e., at
				 * offset length) but may also contain
				 * embedded null characters. The array's
				 * storage is allocated by ckalloc. NULL means
				 * the string rep is invalid and must be
				 * regenerated from the internal rep.  Clients
				 * should use Tcl_GetStringFromObj or
				 * Tcl_GetString to get a pointer to the byte
				 * array as a readonly value.  }
{ The number of bytes at *bytes, not
				 * including the terminating null.  }
{ Denotes the object's type. Always
				 * corresponds to the type of the object's
				 * internal rep. NULL indicates the object has
				 * no internal rep (has no type).  }
{ The internal representation:  }
{   - an long integer value.  }
{   - a double-precision floating value.  }
{   - another, type-specific value,
	                       not used internally any more.  }
{   - a long long value.  }
{   - internal rep as two pointers.
				 *     the main use of which is a bignum's
				 *     tightly packed fields, where the alloc,
				 *     used and signum flags are packed into
				 *     ptr2 with everything else hung off ptr1.  }
{   - internal rep as a pointer and a long,
	                       not used internally any more.  }

  PTcl_Obj = ^TTcl_Obj;
  TTcl_Obj = record
      refCount : longint;
      bytes : Pchar;
      length : longint;
      typePtr : PTcl_ObjType;
      internalRep : record
          case longint of
            0 : ( longValue : longint );
            1 : ( doubleValue : Tdouble );
            2 : ( otherValuePtr : pointer );
            3 : ( wideValue : TTcl_WideInt );
            4 : ( twoPtrValue : record
                ptr1 : pointer;
                ptr2 : pointer;
              end );
            5 : ( ptrAndLongRep : record
                ptr : pointer;
                value : dword;
              end );
          end;
    end;
{
 * Macros to increment and decrement a Tcl_Obj's reference count, and to test
 * whether an object is shared (i.e. has reference count > 1). Note: clients
 * should use Tcl_DecrRefCount() when they are finished using an object, and
 * should never call TclFreeObj() directly. TclFreeObj() is only defined and
 * made public in tcl.h to support Tcl_DecrRefCount's macro definition.
  }

procedure Tcl_IncrRefCount(objPtr:PTcl_Obj);cdecl;external libtcl8_6;
procedure Tcl_DecrRefCount(objPtr:PTcl_Obj);cdecl;external libtcl8_6;
function Tcl_IsShared(objPtr:PTcl_Obj):longint;cdecl;external libtcl8_6;
{
 *----------------------------------------------------------------------------
 * The following structure contains the state needed by Tcl_SaveResult. No-one
 * outside of Tcl should access any of these fields. This structure is
 * typically allocated on the stack.
  }
type
  PTcl_SavedResult = ^TTcl_SavedResult;
  TTcl_SavedResult = record
      result : Pchar;
      freeProc : PTcl_FreeProc;
      objResultPtr : PTcl_Obj;
      appendResult : Pchar;
      appendAvl : longint;
      appendUsed : longint;
      resultSpace : array[0..(TCL_RESULT_SIZE+1)-1] of char;
    end;
{
 *----------------------------------------------------------------------------
 * The following definitions support Tcl's namespace facility. Note: the first
 * five fields must match exactly the fields in a Namespace structure (see
 * tclInt.h).
  }
{ The namespace's name within its parent
				 * namespace. This contains no ::'s. The name
				 * of the global namespace is "" although "::"
				 * is an synonym.  }
{ The namespace's fully qualified name. This
				 * starts with ::.  }
{ Arbitrary value associated with this
				 * namespace.  }
{ Function invoked when deleting the
				 * namespace to, e.g., free clientData.  }
{ Points to the namespace that contains this
				 * one. NULL if this is the global
				 * namespace.  }

  PTcl_Namespace = ^TTcl_Namespace;
  TTcl_Namespace = record
      name : Pchar;
      fullName : Pchar;
      clientData : TClientData;
      deleteProc : PTcl_NamespaceDeleteProc;
      parentPtr : PTcl_Namespace;
    end;
{
 *----------------------------------------------------------------------------
 * The following structure represents a call frame, or activation record. A
 * call frame defines a naming context for a procedure call: its local scope
 * (for local variables) and its namespace scope (used for non-local
 * variables; often the global :: namespace). A call frame can also define the
 * naming context for a namespace eval or namespace inscope command: the
 * namespace in which the command's code should execute. The Tcl_CallFrame
 * structures exist only while procedures or namespace eval/inscope's are
 * being executed, and provide a Tcl call stack.
 *
 * A call frame is initialized and pushed using Tcl_PushCallFrame and popped
 * using Tcl_PopCallFrame. Storage for a Tcl_CallFrame must be provided by the
 * Tcl_PushCallFrame caller, and callers typically allocate them on the C call
 * stack for efficiency. For this reason, Tcl_CallFrame is defined as a
 * structure and not as an opaque token. However, most Tcl_CallFrame fields
 * are hidden since applications should not access them directly; others are
 * declared as "dummyX".
 *
 * WARNING!! The structure definition must be kept consistent with the
 * CallFrame structure in tclInt.h. If you change one, change the other.
  }

  PTcl_CallFrame = ^TTcl_CallFrame;
  TTcl_CallFrame = record
      nsPtr : PTcl_Namespace;
      dummy1 : longint;
      dummy2 : longint;
      dummy3 : pointer;
      dummy4 : pointer;
      dummy5 : pointer;
      dummy6 : longint;
      dummy7 : pointer;
      dummy8 : pointer;
      dummy9 : longint;
      dummy10 : pointer;
      dummy11 : pointer;
      dummy12 : pointer;
      dummy13 : pointer;
    end;
{
 *----------------------------------------------------------------------------
 * Information about commands that is returned by Tcl_GetCommandInfo and
 * passed to Tcl_SetCommandInfo. objProc is an objc/objv object-based command
 * function while proc is a traditional Tcl argc/argv string-based function.
 * Tcl_CreateObjCommand and Tcl_CreateCommand ensure that both objProc and
 * proc are non-NULL and can be called to execute the command. However, it may
 * be faster to call one instead of the other. The member isNativeObjectProc
 * is set to 1 if an object-based function was registered by
 * Tcl_CreateObjCommand, and to 0 if a string-based function was registered by
 * Tcl_CreateCommand. The other function is typically set to a compatibility
 * wrapper that does string-to-object or object-to-string argument conversions
 * then calls the other function.
  }
{ 1 if objProc was registered by a call to
				 * Tcl_CreateObjCommand; 0 otherwise.
				 * Tcl_SetCmdInfo does not modify this
				 * field.  }
{ Command's object-based function.  }
{ ClientData for object proc.  }
{ Command's string-based function.  }
{ ClientData for string proc.  }
{ Function to call when command is
				 * deleted.  }
{ Value to pass to deleteProc (usually the
				 * same as clientData).  }
{ Points to the namespace that contains this
				 * command. Note that Tcl_SetCmdInfo will not
				 * change a command's namespace; use
				 * TclRenameCommand or Tcl_Eval (of 'rename')
				 * to do that.  }

  PTcl_CmdInfo = ^TTcl_CmdInfo;
  TTcl_CmdInfo = record
      isNativeObjectProc : longint;
      objProc : PTcl_ObjCmdProc;
      objClientData : TClientData;
      proc : PTcl_CmdProc;
      clientData : TClientData;
      deleteProc : PTcl_CmdDeleteProc;
      deleteData : TClientData;
      namespacePtr : PTcl_Namespace;
    end;
{
 *----------------------------------------------------------------------------
 * The structure defined below is used to hold dynamic strings. The only
 * fields that clients should use are string and length, accessible via the
 * macros Tcl_DStringValue and Tcl_DStringLength.
  }

const
  TCL_DSTRING_STATIC_SIZE = 200;  
{ Points to beginning of string: either
				 * staticSpace below or a malloced array.  }
{ Number of non-NULL characters in the
				 * string.  }
{ Total number of bytes available for the
				 * string and its terminating NULL char.  }
{ Space to use in common case where string is
				 * small.  }
type
  PTcl_DString = ^TTcl_DString;
  TTcl_DString = record
      _string : Pchar;
      length : longint;
      spaceAvl : longint;
      staticSpace : array[0..(TCL_DSTRING_STATIC_SIZE)-1] of char;
    end;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function Tcl_DStringLength(dsPtr : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function Tcl_DStringValue(dsPtr : longint) : longint;

const
  Tcl_DStringTrunc = Tcl_DStringSetLength;  
{
 * Definitions for the maximum number of digits of precision that may be
 * specified in the "tcl_precision" variable, and the number of bytes of
 * buffer space required by Tcl_PrintDouble.
  }
  TCL_MAX_PREC = 17;  
  TCL_DOUBLE_SPACE = TCL_MAX_PREC+10;  
{
 * Definition for a number of bytes of buffer space sufficient to hold the
 * string representation of an integer in base 10 (assuming the existence of
 * 64-bit integers).
  }
  TCL_INTEGER_SPACE = 24;  
{
 * Flag values passed to Tcl_ConvertElement.
 * TCL_DONT_USE_BRACES forces it not to enclose the element in braces, but to
 *	use backslash quoting instead.
 * TCL_DONT_QUOTE_HASH disables the default quoting of the '#' character. It
 *	is safe to leave the hash unquoted when the element is not the first
 *	element of a list, and this flag can be used by the caller to indicate
 *	that condition.
  }
  TCL_DONT_USE_BRACES = 1;  
  TCL_DONT_QUOTE_HASH = 8;  
{
 * Flag that may be passed to Tcl_GetIndexFromObj to force it to disallow
 * abbreviated strings.
  }
  TCL_EXACT = 1;  
{
 *----------------------------------------------------------------------------
 * Flag values passed to Tcl_RecordAndEval, Tcl_EvalObj, Tcl_EvalObjv.
 * WARNING: these bit choices must not conflict with the bit choices for
 * evalFlag bits in tclInt.h!
 *
 * Meanings:
 *	TCL_NO_EVAL:		Just record this command
 *	TCL_EVAL_GLOBAL:	Execute script in global namespace
 *	TCL_EVAL_DIRECT:	Do not compile this script
 *	TCL_EVAL_INVOKE:	Magical Tcl_EvalObjv mode for aliases/ensembles
 *				o Run in iPtr->lookupNsPtr or global namespace
 *				o Cut out of error traces
 *				o Don't reset the flags controlling ensemble
 *				  error message rewriting.
 *	TCL_CANCEL_UNWIND:	Magical Tcl_CancelEval mode that causes the
 *				stack for the script in progress to be
 *				completely unwound.
 *	TCL_EVAL_NOERR:	Do no exception reporting at all, just return
 *				as the caller will report.
  }
  TCL_NO_EVAL = $010000;  
  TCL_EVAL_GLOBAL = $020000;  
  TCL_EVAL_DIRECT = $040000;  
  TCL_EVAL_INVOKE = $080000;  
  TCL_CANCEL_UNWIND = $100000;  
  TCL_EVAL_NOERR = $200000;  
{
 * Special freeProc values that may be passed to Tcl_SetResult (see the man
 * page for details):
  }

{ was #define dname def_expr }
function TCL_VOLATILE : PTcl_FreeProc;  

{ was #define dname def_expr }
function TCL_STATIC : PTcl_FreeProc;  

{ was #define dname def_expr }
function TCL_DYNAMIC : PTcl_FreeProc;  

{
 * Flag values passed to variable-related functions.
 * WARNING: these bit choices must not conflict with the bit choice for
 * TCL_CANCEL_UNWIND, above.
  }
const
  TCL_GLOBAL_ONLY = 1;  
  TCL_NAMESPACE_ONLY = 2;  
  TCL_APPEND_VALUE = 4;  
  TCL_LIST_ELEMENT = 8;  
  TCL_TRACE_READS = $10;  
  TCL_TRACE_WRITES = $20;  
  TCL_TRACE_UNSETS = $40;  
  TCL_TRACE_DESTROYED = $80;  
  TCL_INTERP_DESTROYED = $100;  
  TCL_LEAVE_ERR_MSG = $200;  
  TCL_TRACE_ARRAY = $800;  
{$ifndef TCL_REMOVE_OBSOLETE_TRACES}
{ Required to support old variable/vdelete/vinfo traces.  }

const
  TCL_TRACE_OLD_STYLE = $1000;  
{$endif}
{ Indicate the semantics of the result of a trace.  }

const
  TCL_TRACE_RESULT_DYNAMIC = $8000;  
  TCL_TRACE_RESULT_OBJECT = $10000;  
{
 * Flag values for ensemble commands.
  }
{ Flag value to say whether to allow
				 * unambiguous prefixes of commands or to
				 * require exact matches for command names.  }
  TCL_ENSEMBLE_PREFIX = $02;  
{
 * Flag values passed to command-related functions.
  }
  TCL_TRACE_RENAME = $2000;  
  TCL_TRACE_DELETE = $4000;  
  TCL_ALLOW_INLINE_COMPILATION = $20000;  
{
 * The TCL_PARSE_PART1 flag is deprecated and has no effect. The part1 is now
 * always parsed whenever the part2 is NULL. (This is to avoid a common error
 * when converting code to use the new object based APIs and forgetting to
 * give the flag)
  }
{$if !defined(TCL_NO_DEPRECATED)}

const
  TCL_PARSE_PART1 = $400;  
{$endif}
{ !TCL_NO_DEPRECATED  }
{
 * Types for linked variables:
  }

const
  TCL_LINK_INT = 1;  
  TCL_LINK_DOUBLE = 2;  
  TCL_LINK_BOOLEAN = 3;  
  TCL_LINK_STRING = 4;  
  TCL_LINK_WIDE_INT = 5;  
  TCL_LINK_CHAR = 6;  
  TCL_LINK_UCHAR = 7;  
  TCL_LINK_SHORT = 8;  
  TCL_LINK_USHORT = 9;  
  TCL_LINK_UINT = 10;  
  TCL_LINK_LONG = 11;  
  TCL_LINK_ULONG = 12;  
  TCL_LINK_FLOAT = 13;  
  TCL_LINK_WIDE_UINT = 14;  
  TCL_LINK_READ_ONLY = $80;  
{
 *----------------------------------------------------------------------------
 * Forward declarations of Tcl_HashTable and related types.
  }
type
{ ???????? cl_HashEntry *  }
{
 * This flag controls whether the hash table stores the hash of a key, or
 * recalculates it. There should be no reason for turning this flag off as it
 * is completely binary and source compatible unless you directly access the
 * bucketPtr member of the Tcl_HashTableEntry structure. This member has been
 * removed and the space used to store the hash value.
  }
{$ifndef TCL_HASH_KEY_STORE_HASH}

const
  TCL_HASH_KEY_STORE_HASH = 1;  
{$endif}
{
 * Structure definition for an entry in a hash table. No-one outside Tcl
 * should access any of these fields directly; use the macros defined below.
  }
{ Pointer to next entry in this hash bucket,
				 * or NULL for end of chain.  }
{ Pointer to table containing entry.  }
{$if TCL_HASH_KEY_STORE_HASH}
{ Hash value, stored as pointer to ensure
				 * that the offsets of the fields in this
				 * structure are not changed.  }
{$else}
{ Pointer to bucket that points to first
				 * entry in this entry's chain: used for
				 * deleting the entry.  }
{$endif}
{ Application stores something here with
				 * Tcl_SetHashValue.  }
{ Key has one of these forms:  }
{ One-word value for key.  }
{ Tcl_Obj * key value.  }
{ Multiple integer words for key. The actual
				 * size will be as large as necessary for this
				 * table's keys.  }
{ String for key. The actual size will be as
				 * large as needed to hold the key.  }
{ MUST BE LAST FIELD IN RECORD!!  }
type
  PTcl_HashEntry = ^TTcl_HashEntry;
  TTcl_HashEntry = record
      nextPtr : PTcl_HashEntry;
      tablePtr : PTcl_HashTable;
      hash : pointer;
      bucketPtr : ^PTcl_HashEntry;
      clientData : TClientData;
      key : record
          case longint of
            0 : ( oneWordValue : Pchar );
            1 : ( objPtr : PTcl_Obj );
            2 : ( words : array[0..0] of longint );
            3 : ( _string : array[0..0] of char );
          end;
    end;

{
 * Flags used in Tcl_HashKeyType.
 *
 * TCL_HASH_KEY_RANDOMIZE_HASH -
 *				There are some things, pointers for example
 *				which don't hash well because they do not use
 *				the lower bits. If this flag is set then the
 *				hash table will attempt to rectify this by
 *				randomising the bits and then using the upper
 *				N bits as the index into the table.
 * TCL_HASH_KEY_SYSTEM_HASH -	If this flag is set then all memory internally
 *                              allocated for the hash table that is not for an
 *                              entry will use the system heap.
  }

const
  TCL_HASH_KEY_RANDOMIZE_HASH = $1;  
  TCL_HASH_KEY_SYSTEM_HASH = $2;  
{
 * Structure definition for the methods associated with a hash table key type.
  }
  TCL_HASH_KEY_TYPE_VERSION = 1;  
{ Version of the table. If this structure is
				 * extended in future then the version can be
				 * used to distinguish between different
				 * structures.  }
{ Flags, see above for details.  }
{ Calculates a hash value for the key. If
				 * this is NULL then the pointer itself is
				 * used as a hash value.  }
{ Compares two keys and returns zero if they
				 * do not match, and non-zero if they do. If
				 * this is NULL then the pointers are
				 * compared.  }
{ Called to allocate memory for a new entry,
				 * i.e. if the key is a string then this could
				 * allocate a single block which contains
				 * enough space for both the entry and the
				 * string. Only the key field of the allocated
				 * Tcl_HashEntry structure needs to be filled
				 * in. If something else needs to be done to
				 * the key, i.e. incrementing a reference
				 * count then that should be done by this
				 * function. If this is NULL then Tcl_Alloc is
				 * used to allocate enough space for a
				 * Tcl_HashEntry and the key pointer is
				 * assigned to key.oneWordValue.  }
{ Called to free memory associated with an
				 * entry. If something else needs to be done
				 * to the key, i.e. decrementing a reference
				 * count then that should be done by this
				 * function. If this is NULL then Tcl_Free is
				 * used to free the Tcl_HashEntry.  }
type
  PTcl_HashKeyType = ^TTcl_HashKeyType;
  TTcl_HashKeyType = record
      version : longint;
      flags : longint;
      hashKeyProc : PTcl_HashKeyProc;
      compareKeysProc : PTcl_CompareHashKeysProc;
      allocEntryProc : PTcl_AllocHashEntryProc;
      freeEntryProc : PTcl_FreeHashEntryProc;
    end;

{
 * Structure definition for a hash table.  Must be in tcl.h so clients can
 * allocate space for these structures, but clients should never access any
 * fields in this structure.
  }

const
  TCL_SMALL_HASH_TABLE = 4;  
{ Pointer to bucket array. Each element
				 * points to first entry in bucket's hash
				 * chain, or NULL.  }
{ Bucket array used for small tables (to
				 * avoid mallocs and frees).  }
{ Total number of buckets allocated at
				 * **bucketPtr.  }
{ Total number of entries present in
				 * table.  }
{ Enlarge table when numEntries gets to be
				 * this large.  }
{ Shift count used in hashing function.
				 * Designed to use high-order bits of
				 * randomized keys.  }
{ Mask value used in hashing function.  }
{ Type of keys used in this table. It's
				 * either TCL_CUSTOM_KEYS, TCL_STRING_KEYS,
				 * TCL_ONE_WORD_KEYS, or an integer giving the
				 * number of ints that is the size of the
				 * key.  }
{ Type of the keys used in the
				 * Tcl_HashTable.  }
type
  PTcl_HashTable = ^TTcl_HashTable;
  TTcl_HashTable = record
      buckets : ^PTcl_HashEntry;
      staticBuckets : array[0..(TCL_SMALL_HASH_TABLE)-1] of PTcl_HashEntry;
      numBuckets : longint;
      numEntries : longint;
      rebuildSize : longint;
      downShift : longint;
      mask : longint;
      keyType : longint;
      findProc : function (tablePtr:PTcl_HashTable; key:Pchar):PTcl_HashEntry;cdecl;
      createProc : function (tablePtr:PTcl_HashTable; key:Pchar; newPtr:Plongint):PTcl_HashEntry;cdecl;
      typePtr : PTcl_HashKeyType;
    end;

{
 * Structure definition for information used to keep track of searches through
 * hash tables:
  }
{ Table being searched.  }
{ Index of next bucket to be enumerated after
				 * present one.  }
{ Next entry to be enumerated in the current
				 * bucket.  }

  PTcl_HashSearch = ^TTcl_HashSearch;
  TTcl_HashSearch = record
      tablePtr : PTcl_HashTable;
      nextIndex : longint;
      nextEntryPtr : PTcl_HashEntry;
    end;
{
 * Acceptable key types for hash tables:
 *
 * TCL_STRING_KEYS:		The keys are strings, they are copied into the
 *				entry.
 * TCL_ONE_WORD_KEYS:		The keys are pointers, the pointer is stored
 *				in the entry.
 * TCL_CUSTOM_TYPE_KEYS:	The keys are arbitrary types which are copied
 *				into the entry.
 * TCL_CUSTOM_PTR_KEYS:		The keys are pointers to arbitrary types, the
 *				pointer is stored in the entry.
 *
 * While maintaining binary compatibility the above have to be distinct values
 * as they are used to differentiate between old versions of the hash table
 * which don't have a typePtr and new ones which do. Once binary compatibility
 * is discarded in favour of making more wide spread changes TCL_STRING_KEYS
 * can be the same as TCL_CUSTOM_TYPE_KEYS, and TCL_ONE_WORD_KEYS can be the
 * same as TCL_CUSTOM_PTR_KEYS because they simply determine how the key is
 * accessed from the entry and not the behaviour.
  }

const
  TCL_STRING_KEYS = 0;  
  TCL_ONE_WORD_KEYS = 1;  
  TCL_CUSTOM_TYPE_KEYS = -(2);  
  TCL_CUSTOM_PTR_KEYS = -(1);  
{
 * Structure definition for information used to keep track of searches through
 * dictionaries. These fields should not be accessed by code outside
 * tclDictObj.c
  }
{ Search position for underlying hash
				 * table.  }
{ Epoch marker for dictionary being searched,
				 * or -1 if search has terminated.  }
{ Reference to dictionary being searched.  }
type
  PTcl_DictSearch = ^TTcl_DictSearch;
  TTcl_DictSearch = record
      next : pointer;
      epoch : longint;
      dictionaryPtr : TTcl_Dict;
    end;
{
 *----------------------------------------------------------------------------
 * Flag values to pass to Tcl_DoOneEvent to disable searches for some kinds of
 * events:
  }

const
  TCL_DONT_WAIT = 1 shl 1;  
  TCL_WINDOW_EVENTS = 1 shl 2;  
  TCL_FILE_EVENTS = 1 shl 3;  
  TCL_TIMER_EVENTS = 1 shl 4;  
{ WAS 0x10 ????  }
  TCL_IDLE_EVENTS = 1 shl 5;  
  TCL_ALL_EVENTS =  not (TCL_DONT_WAIT);  
{
 * The following structure defines a generic event for the Tcl event system.
 * These are the things that are queued in calls to Tcl_QueueEvent and
 * serviced later by Tcl_DoOneEvent. There can be many different kinds of
 * events with different fields, corresponding to window events, timer events,
 * etc. The structure for a particular event consists of a Tcl_Event header
 * followed by additional information specific to that event.
  }
{ Function to call to service this event.  }
{ Next in list of pending events, or NULL.  }
type
  PTcl_Event = ^TTcl_Event;
  TTcl_Event = record
      proc : PTcl_EventProc;
      nextPtr : PTcl_Event;
    end;

{
 * Positions to pass to Tcl_QueueEvent:
  }

  PTcl_QueuePosition = ^TTcl_QueuePosition;
  TTcl_QueuePosition =  Longint;
  Const
    TCL_QUEUE_TAIL = 0;
    TCL_QUEUE_HEAD = 1;
    TCL_QUEUE_MARK = 2;
;
{
 * Values to pass to Tcl_SetServiceMode to specify the behavior of notifier
 * event routines.
  }
  TCL_SERVICE_NONE = 0;  
  TCL_SERVICE_ALL = 1;  
{
 * The following structure keeps is used to hold a time value, either as an
 * absolute time (the number of seconds from the epoch) or as an elapsed time.
 * On Unix systems the epoch is Midnight Jan 1, 1970 GMT.
  }
{ Seconds.  }
{ Microseconds.  }
type
  PTcl_Time = ^TTcl_Time;
  TTcl_Time = record
      sec : longint;
      usec : longint;
    end;
{
 * TIP #233 (Virtualized Time)
  }
{
 *----------------------------------------------------------------------------
 * Bits to pass to Tcl_CreateFileHandler and Tcl_CreateChannelHandler to
 * indicate what sorts of events are of interest:
  }

const
  TCL_READABLE = 1 shl 1;  
  TCL_WRITABLE = 1 shl 2;  
  TCL_EXCEPTION = 1 shl 3;  
{
 * Flag values to pass to Tcl_OpenCommandChannel to indicate the disposition
 * of the stdio handles. TCL_STDIN, TCL_STDOUT, TCL_STDERR, are also used in
 * Tcl_GetStdChannel.
  }
  TCL_STDIN = 1 shl 1;  
  TCL_STDOUT = 1 shl 2;  
  TCL_STDERR = 1 shl 3;  
  TCL_ENFORCE_MODE = 1 shl 4;  
{
 * Bits passed to Tcl_DriverClose2Proc to indicate which side of a channel
 * should be closed.
  }
  TCL_CLOSE_READ = 1 shl 1;  
  TCL_CLOSE_WRITE = 1 shl 2;  
{
 * Value to use as the closeProc for a channel that supports the close2Proc
 * interface.
  }

{ was #define dname def_expr }
function TCL_CLOSE2PROC : PTcl_DriverCloseProc;  

{
 * Channel version tag. This was introduced in 8.3.2/8.4.
  }
{ was #define dname def_expr }
function TCL_CHANNEL_VERSION_1 : TTcl_ChannelTypeVersion;  

{ was #define dname def_expr }
function TCL_CHANNEL_VERSION_2 : TTcl_ChannelTypeVersion;  

{ was #define dname def_expr }
function TCL_CHANNEL_VERSION_3 : TTcl_ChannelTypeVersion;  

{ was #define dname def_expr }
function TCL_CHANNEL_VERSION_4 : TTcl_ChannelTypeVersion;  

{ was #define dname def_expr }
function TCL_CHANNEL_VERSION_5 : TTcl_ChannelTypeVersion;  

{
 * TIP #218: Channel Actions, Ids for Tcl_DriverThreadActionProc.
  }
const
  TCL_CHANNEL_THREAD_INSERT = 0;  
  TCL_CHANNEL_THREAD_REMOVE = 1;  
{
 * Typedefs for the various operations in a channel type:
  }
type
{
 * TIP #218, Channel Thread Actions
  }
{
 * TIP #208, File Truncation (etc.)
  }
{
 * struct Tcl_ChannelType:
 *
 * One such structure exists for each type (kind) of channel. It collects
 * together in one place all the functions that are part of the specific
 * channel type.
 *
 * It is recommend that the Tcl_Channel* functions are used to access elements
 * of this structure, instead of direct accessing.
  }
{ The name of the channel type in Tcl
				 * commands. This storage is owned by channel
				 * type.  }
{ Version of the channel type.  }
{ Function to call to close the channel, or
				 * TCL_CLOSE2PROC if the close2Proc should be
				 * used instead.  }
{ Function to call for input on channel.  }
{ Function to call for output on channel.  }
{ Function to call to seek on the channel.
				 * May be NULL.  }
{ Set an option on a channel.  }
{ Get an option from a channel.  }
{ Set up the notifier to watch for events on
				 * this channel.  }
{ Get an OS handle from the channel or NULL
				 * if not supported.  }
{ Function to call to close the channel if
				 * the device supports closing the read &
				 * write sides independently.  }
{ Set blocking mode for the raw channel. May
				 * be NULL.  }
{
     * Only valid in TCL_CHANNEL_VERSION_2 channels or later.
      }
{ Function to call to flush a channel. May be
				 * NULL.  }
{ Function to call to handle a channel event.
				 * This will be passed up the stacked channel
				 * chain.  }
{
     * Only valid in TCL_CHANNEL_VERSION_3 channels or later.
      }
{ Function to call to seek on the channel
				 * which can handle 64-bit offsets. May be
				 * NULL, and must be NULL if seekProc is
				 * NULL.  }
{
     * Only valid in TCL_CHANNEL_VERSION_4 channels or later.
     * TIP #218, Channel Thread Actions.
      }
{ Function to call to notify the driver of
				 * thread specific activity for a channel. May
				 * be NULL.  }
{
     * Only valid in TCL_CHANNEL_VERSION_5 channels or later.
     * TIP #208, File Truncation.
      }
{ Function to call to truncate the underlying
				 * file to a particular length. May be NULL if
				 * the channel does not support truncation.  }

  PTcl_ChannelType = ^TTcl_ChannelType;
  TTcl_ChannelType = record
      typeName : Pchar;
      version : TTcl_ChannelTypeVersion;
      closeProc : PTcl_DriverCloseProc;
      inputProc : PTcl_DriverInputProc;
      outputProc : PTcl_DriverOutputProc;
      seekProc : PTcl_DriverSeekProc;
      setOptionProc : PTcl_DriverSetOptionProc;
      getOptionProc : PTcl_DriverGetOptionProc;
      watchProc : PTcl_DriverWatchProc;
      getHandleProc : PTcl_DriverGetHandleProc;
      close2Proc : PTcl_DriverClose2Proc;
      blockModeProc : PTcl_DriverBlockModeProc;
      flushProc : PTcl_DriverFlushProc;
      handlerProc : PTcl_DriverHandlerProc;
      wideSeekProc : PTcl_DriverWideSeekProc;
      threadActionProc : PTcl_DriverThreadActionProc;
      truncateProc : PTcl_DriverTruncateProc;
    end;
{
 * The following flags determine whether the blockModeProc above should set
 * the channel into blocking or nonblocking mode. They are passed as arguments
 * to the blockModeProc function in the above structure.
  }
{ Put channel into blocking mode.  }

const
  TCL_MODE_BLOCKING = 0;  
{ Put channel into nonblocking
					 * mode.  }
  TCL_MODE_NONBLOCKING = 1;  
{
 *----------------------------------------------------------------------------
 * Enum for different types of file paths.
  }
type
  PTcl_PathType = ^TTcl_PathType;
  TTcl_PathType =  Longint;
  Const
    TCL_PATH_ABSOLUTE = 0;
    TCL_PATH_RELATIVE = 1;
    TCL_PATH_VOLUME_RELATIVE = 2;
;
{
 * The following structure is used to pass glob type data amongst the various
 * glob routines and Tcl_FSMatchInDirectory.
  }
{ Corresponds to bcdpfls as in 'find -t'.  }
{ Corresponds to file permissions.  }
{ Acceptable Mac type.  }
{ Acceptable Mac creator.  }
type
  PTcl_GlobTypeData = ^TTcl_GlobTypeData;
  TTcl_GlobTypeData = record
      _type : longint;
      perm : longint;
      macType : PTcl_Obj;
      macCreator : PTcl_Obj;
    end;
{
 * Type and permission definitions for glob command.
  }

const
  TCL_GLOB_TYPE_BLOCK = 1 shl 0;  
  TCL_GLOB_TYPE_CHAR = 1 shl 1;  
  TCL_GLOB_TYPE_DIR = 1 shl 2;  
  TCL_GLOB_TYPE_PIPE = 1 shl 3;  
  TCL_GLOB_TYPE_FILE = 1 shl 4;  
  TCL_GLOB_TYPE_LINK = 1 shl 5;  
  TCL_GLOB_TYPE_SOCK = 1 shl 6;  
  TCL_GLOB_TYPE_MOUNT = 1 shl 7;  
  TCL_GLOB_PERM_RONLY = 1 shl 0;  
  TCL_GLOB_PERM_HIDDEN = 1 shl 1;  
  TCL_GLOB_PERM_R = 1 shl 2;  
  TCL_GLOB_PERM_W = 1 shl 3;  
  TCL_GLOB_PERM_X = 1 shl 4;  
{
 * Flags for the unload callback function.
  }
  TCL_UNLOAD_DETACH_FROM_INTERPRETER = 1 shl 0;  
  TCL_UNLOAD_DETACH_FROM_PROCESS = 1 shl 1;  
{
 * Typedefs for the various filesystem operations:
  }
type
{ ??????????????  Obj *  }
{ ??????????????  Obj *  }
{ We have to declare the utime structure here.  }
  Putimbuf = ^Tutimbuf;
  Tutimbuf = record
      {undefined structure}
    end;

{ ??????????????  char ** }
{ ??????????????  Obj *  }
{ ??????????????  Obj *  }
{ ??????????????  Obj *  }
{ ??????????????  Obj *  }

  PTcl_FSVersion = ^TTcl_FSVersion;
  TTcl_FSVersion = PTcl_FSVersion_;
{
 *----------------------------------------------------------------------------
 * Data structures related to hooking into the filesystem
  }
{
 * Filesystem version tag.  This was introduced in 8.4.
  }

{ was #define dname def_expr }
function TCL_FILESYSTEM_VERSION_1 : TTcl_FSVersion;  

{
 * struct Tcl_Filesystem:
 *
 * One such structure exists for each type (kind) of filesystem. It collects
 * together the functions that form the interface for a particulr the
 * filesystem. Tcl always accesses the filesystem through one of these
 * structures.
 *
 * Not all entries need be non-NULL; any which are NULL are simply ignored.
 * However, a complete filesystem should provide all of these functions. The
 * explanations in the structure show the importance of each function.
  }
{ The name of the filesystem.  }
{ Length of this structure, so future binary
				 * compatibility can be assured.  }
{ Version of the filesystem type.  }
{ Determines whether the pathname is in this
				 * filesystem. This is the most important
				 * filesystem function.  }
{ Duplicates the internal handle of the node.
				 * If it is NULL, the filesystem is less
				 * performant.  }
{ Frees the internal handle of the node.  NULL
				 * only if there is no need to free resources
				 * used for the internal handle.  }
{ Converts the internal handle to a normalized
				 * path.  NULL if the filesystem creates nodes
				 * having no pathname.  }
{ Creates an internal handle for a pathname.
				 * May be NULL if pathnames have no internal
				 * handle or if pathInFilesystemProc always
				 * immediately creates an internal
				 * representation for pathnames in the
				 * filesystem.  }
{ Normalizes a path.  Should be implemented if
				 * the filesystems supports multiple paths to
				 * the same node.  }
{ Determines the type of a path in this
				 * filesystem. May be NULL.  }
{ Produces the separator character(s) for this
				 * filesystem. Must not be NULL.  }
{ Called by 'Tcl_FSStat()'.  Provided by any
				 * reasonable filesystem.  }
{ Called by 'Tcl_FSAccess()'.  Implemented by
				 * any reasonable filesystem.  }
{ Called by 'Tcl_FSOpenFileChannel()'.
				 * Provided by any reasonable filesystem.  }
{ Called by 'Tcl_FSMatchInDirectory()'.  NULL
				 * if the filesystem does not support glob or
				 * recursive copy.  }
{ Called by 'Tcl_FSUtime()', by 'file
				 *  mtime' to set (not read) times, 'file
				 *  atime', and the open-r/open-w/fcopy variant
				 *  of 'file copy'.  }
{ Called by 'Tcl_FSLink()'. NULL if reading or
				 *  creating links is not supported.  }
{ Lists filesystem volumes added by this
				 * filesystem. NULL if the filesystem does not
				 * use volumes.  }
{ List all valid attributes strings.  NULL if
				 * the filesystem does not support the 'file
				 * attributes' command.  Can be used to attach
				 * arbitrary additional data to files in a
				 * filesystem.  }
{ Called by 'Tcl_FSFileAttrsGet()' and by
				 * 'file attributes'.  }
{ Called by 'Tcl_FSFileAttrsSet()' and by
				 * 'file attributes'.   }
{ Called by 'Tcl_FSCreateDirectory()'.  May be
				 * NULL if the filesystem is read-only.  }
{ Called by 'Tcl_FSRemoveDirectory()'.  May be
				 * NULL if the filesystem is read-only.  }
{ Called by 'Tcl_FSDeleteFile()' May be NULL
				 * if the filesystem is is read-only.  }
{ Called by 'Tcl_FSCopyFile()'.  If NULL, for
				 * a copy operation at the script level (not
				 * C) Tcl uses open-r, open-w and fcopy.  }
{ Called by 'Tcl_FSRenameFile()'. If NULL, for
				 * a rename operation at the script level (not
				 * C) Tcl performs a copy operation followed
				 * by a delete operation.  }
{ Called by 'Tcl_FSCopyDirectory()'. If NULL,
				 * for a copy operation at the script level
				 * (not C) Tcl recursively creates directories
				 * and copies files.  }
{ Called by 'Tcl_FSLstat()'. If NULL, Tcl
				 * attempts to use 'statProc' instead.  }
{ Called by 'Tcl_FSLoadFile()'. If NULL, Tcl
				 * performs a copy to a temporary file in the
				 * native filesystem and then calls
				 * Tcl_FSLoadFile() on that temporary copy.  }
{ Called by 'Tcl_FSGetCwd()'.  Normally NULL.
				 * Usually only called once:  If 'getcwd' is
				 * called before 'chdir' is ever called.  }
{ Called by 'Tcl_FSChdir()'.  For a virtual
				 * filesystem, chdirProc just returns zero
				 * (success) if the pathname is a valid
				 * directory, and some other value otherwise.
				 * For A real filesystem, chdirProc performs
				 * the correct action, e.g.  calls the system
				 * 'chdir' function. If not implemented, then
				 * 'cd' and 'pwd' fail for a pathname in this
				 * filesystem. On success Tcl stores the
				 * pathname for use by GetCwd.  If NULL, Tcl
				 * performs records the pathname as the new
				 * current directory if it passes a series of
				 * directory access checks.  }
type
  PTcl_Filesystem = ^TTcl_Filesystem;
  TTcl_Filesystem = record
      typeName : Pchar;
      structureLength : longint;
      version : TTcl_FSVersion;
      pathInFilesystemProc : PTcl_FSPathInFilesystemProc;
      dupInternalRepProc : PTcl_FSDupInternalRepProc;
      freeInternalRepProc : PTcl_FSFreeInternalRepProc;
      internalToNormalizedProc : PTcl_FSInternalToNormalizedProc;
      createInternalRepProc : PTcl_FSCreateInternalRepProc;
      normalizePathProc : PTcl_FSNormalizePathProc;
      filesystemPathTypeProc : PTcl_FSFilesystemPathTypeProc;
      filesystemSeparatorProc : PTcl_FSFilesystemSeparatorProc;
      statProc : PTcl_FSStatProc;
      accessProc : PTcl_FSAccessProc;
      openFileChannelProc : PTcl_FSOpenFileChannelProc;
      matchInDirectoryProc : PTcl_FSMatchInDirectoryProc;
      utimeProc : PTcl_FSUtimeProc;
      linkProc : PTcl_FSLinkProc;
      listVolumesProc : PTcl_FSListVolumesProc;
      fileAttrStringsProc : PTcl_FSFileAttrStringsProc;
      fileAttrsGetProc : PTcl_FSFileAttrsGetProc;
      fileAttrsSetProc : PTcl_FSFileAttrsSetProc;
      createDirectoryProc : PTcl_FSCreateDirectoryProc;
      removeDirectoryProc : PTcl_FSRemoveDirectoryProc;
      deleteFileProc : PTcl_FSDeleteFileProc;
      copyFileProc : PTcl_FSCopyFileProc;
      renameFileProc : PTcl_FSRenameFileProc;
      copyDirectoryProc : PTcl_FSCopyDirectoryProc;
      lstatProc : PTcl_FSLstatProc;
      loadFileProc : PTcl_FSLoadFileProc;
      getCwdProc : PTcl_FSGetCwdProc;
      chdirProc : PTcl_FSChdirProc;
    end;
{
 * The following definitions are used as values for the 'linkAction' flag to
 * Tcl_FSLink, or the linkProc of any filesystem. Any combination of flags can
 * be given. For link creation, the linkProc should create a link which
 * matches any of the types given.
 *
 * TCL_CREATE_SYMBOLIC_LINK -	Create a symbolic or soft link.
 * TCL_CREATE_HARD_LINK -	Create a hard link.
  }

const
  TCL_CREATE_SYMBOLIC_LINK = $01;  
  TCL_CREATE_HARD_LINK = $02;  
{
 *----------------------------------------------------------------------------
 * The following structure represents the Notifier functions that you can
 * override with the Tcl_SetNotifier call.
  }
type
  PTcl_NotifierProcs = ^TTcl_NotifierProcs;
  TTcl_NotifierProcs = record
      setTimerProc : PTcl_SetTimerProc;
      waitForEventProc : PTcl_WaitForEventProc;
      createFileHandlerProc : PTcl_CreateFileHandlerProc;
      deleteFileHandlerProc : PTcl_DeleteFileHandlerProc;
      initNotifierProc : PTcl_InitNotifierProc;
      finalizeNotifierProc : PTcl_FinalizeNotifierProc;
      alertNotifierProc : PTcl_AlertNotifierProc;
      serviceModeHookProc : PTcl_ServiceModeHookProc;
    end;
{
 *----------------------------------------------------------------------------
 * The following data structures and declarations are for the new Tcl parser.
 *
 * For each word of a command, and for each piece of a word such as a variable
 * reference, one of the following structures is created to describe the
 * token.
  }
{ Type of token, such as TCL_TOKEN_WORD; see
				 * below for valid types.  }
{ First character in token.  }
{ Number of bytes in token.  }
{ If this token is composed of other tokens,
				 * this field tells how many of them there are
				 * (including components of components, etc.).
				 * The component tokens immediately follow
				 * this one.  }

  PTcl_Token = ^TTcl_Token;
  TTcl_Token = record
      _type : longint;
      start : Pchar;
      size : longint;
      numComponents : longint;
    end;
{
 * Type values defined for Tcl_Token structures. These values are defined as
 * mask bits so that it's easy to check for collections of types.
 *
 * TCL_TOKEN_WORD -		The token describes one word of a command,
 *				from the first non-blank character of the word
 *				(which may be " or ) up to but not including
 *				the space, semicolon, or bracket that
 *				terminates the word. NumComponents counts the
 *				total number of sub-tokens that make up the
 *				word. This includes, for example, sub-tokens
 *				of TCL_TOKEN_VARIABLE tokens.
 * TCL_TOKEN_SIMPLE_WORD -	This token is just like TCL_TOKEN_WORD except
 *				that the word is guaranteed to consist of a
 *				single TCL_TOKEN_TEXT sub-token.
 * TCL_TOKEN_TEXT -		The token describes a range of literal text
 *				that is part of a word. NumComponents is
 *				always 0.
 * TCL_TOKEN_BS -		The token describes a backslash sequence that
 *				must be collapsed. NumComponents is always 0.
 * TCL_TOKEN_COMMAND -		The token describes a command whose result
 *				must be substituted into the word. The token
 *				includes the enclosing brackets. NumComponents
 *				is always 0.
 * TCL_TOKEN_VARIABLE -		The token describes a variable substitution,
 *				including the dollar sign, variable name, and
 *				array index (if there is one) up through the
 *				right parentheses. NumComponents tells how
 *				many additional tokens follow to represent the
 *				variable name. The first token will be a
 *				TCL_TOKEN_TEXT token that describes the
 *				variable name. If the variable is an array
 *				reference then there will be one or more
 *				additional tokens, of type TCL_TOKEN_TEXT,
 *				TCL_TOKEN_BS, TCL_TOKEN_COMMAND, and
 *				TCL_TOKEN_VARIABLE, that describe the array
 *				index; numComponents counts the total number
 *				of nested tokens that make up the variable
 *				reference, including sub-tokens of
 *				TCL_TOKEN_VARIABLE tokens.
 * TCL_TOKEN_SUB_EXPR -		The token describes one subexpression of an
 *				expression, from the first non-blank character
 *				of the subexpression up to but not including
 *				the space, brace, or bracket that terminates
 *				the subexpression. NumComponents counts the
 *				total number of following subtokens that make
 *				up the subexpression; this includes all
 *				subtokens for any nested TCL_TOKEN_SUB_EXPR
 *				tokens. For example, a numeric value used as a
 *				primitive operand is described by a
 *				TCL_TOKEN_SUB_EXPR token followed by a
 *				TCL_TOKEN_TEXT token. A binary subexpression
 *				is described by a TCL_TOKEN_SUB_EXPR token
 *				followed by the TCL_TOKEN_OPERATOR token for
 *				the operator, then TCL_TOKEN_SUB_EXPR tokens
 *				for the left then the right operands.
 * TCL_TOKEN_OPERATOR -		The token describes one expression operator.
 *				An operator might be the name of a math
 *				function such as "abs". A TCL_TOKEN_OPERATOR
 *				token is always preceded by one
 *				TCL_TOKEN_SUB_EXPR token for the operator's
 *				subexpression, and is followed by zero or more
 *				TCL_TOKEN_SUB_EXPR tokens for the operator's
 *				operands. NumComponents is always 0.
 * TCL_TOKEN_EXPAND_WORD -	This token is just like TCL_TOKEN_WORD except
 *				that it marks a word that began with the
 *				literal character prefix "*". This word is
 *				marked to be expanded - that is, broken into
 *				words after substitution is complete.
  }

const
  TCL_TOKEN_WORD = 1;  
  TCL_TOKEN_SIMPLE_WORD = 2;  
  TCL_TOKEN_TEXT = 4;  
  TCL_TOKEN_BS = 8;  
  TCL_TOKEN_COMMAND = 16;  
  TCL_TOKEN_VARIABLE = 32;  
  TCL_TOKEN_SUB_EXPR = 64;  
  TCL_TOKEN_OPERATOR = 128;  
  TCL_TOKEN_EXPAND_WORD = 256;  
{
 * Parsing error types. On any parsing error, one of these values will be
 * stored in the error field of the Tcl_Parse structure defined below.
  }
  TCL_PARSE_SUCCESS = 0;  
  TCL_PARSE_QUOTE_EXTRA = 1;  
  TCL_PARSE_BRACE_EXTRA = 2;  
  TCL_PARSE_MISSING_BRACE = 3;  
  TCL_PARSE_MISSING_BRACKET = 4;  
  TCL_PARSE_MISSING_PAREN = 5;  
  TCL_PARSE_MISSING_QUOTE = 6;  
  TCL_PARSE_MISSING_VAR_BRACE = 7;  
  TCL_PARSE_SYNTAX = 8;  
  TCL_PARSE_BAD_NUMBER = 9;  
{
 * A structure of the following type is filled in by Tcl_ParseCommand. It
 * describes a single command parsed from an input string.
  }
  NUM_STATIC_TOKENS = 20;  
{ Pointer to # that begins the first of one
				 * or more comments preceding the command.  }
{ Number of bytes in comments (up through
				 * newline character that terminates the last
				 * comment). If there were no comments, this
				 * field is 0.  }
{ First character in first word of
				 * command.  }
{ Number of bytes in command, including first
				 * character of first word, up through the
				 * terminating newline, close bracket, or
				 * semicolon.  }
{ Total number of words in command. May be
				 * 0.  }
{ Pointer to first token representing the
				 * words of the command. Initially points to
				 * staticTokens, but may change to point to
				 * malloc-ed space if command exceeds space in
				 * staticTokens.  }
{ Total number of tokens in command.  }
{ Total number of tokens available at
				 * *tokenPtr.  }
{ One of the parsing error types defined
				 * above.  }
{
     * The fields below are intended only for the private use of the parser.
     * They should not be used by functions that invoke Tcl_ParseCommand.
      }
{ The original command string passed to
				 * Tcl_ParseCommand.  }
{ Points to the character just after the last
				 * one in the command string.  }
{ Interpreter to use for error reporting, or
				 * NULL.  }
{ Points to character in string that
				 * terminated most recent token. Filled in by
				 * ParseTokens. If an error occurs, points to
				 * beginning of region where the error
				 * occurred (e.g. the open brace if the close
				 * brace is missing).  }
{ This field is set to 1 by Tcl_ParseCommand
				 * if the command appears to be incomplete.
				 * This information is used by
				 * Tcl_CommandComplete.  }
{ Initial space for tokens for command. This
				 * space should be large enough to accommodate
				 * most commands; dynamic space is allocated
				 * for very large commands that don't fit
				 * here.  }
type
  PTcl_Parse = ^TTcl_Parse;
  TTcl_Parse = record
      commentStart : Pchar;
      commentSize : longint;
      commandStart : Pchar;
      commandSize : longint;
      numWords : longint;
      tokenPtr : PTcl_Token;
      numTokens : longint;
      tokensAvailable : longint;
      errorType : longint;
      _string : Pchar;
      end : Pchar;
      interp : PTcl_Interp;
      term : Pchar;
      incomplete : longint;
      staticTokens : array[0..(NUM_STATIC_TOKENS)-1] of TTcl_Token;
    end;
{
 *----------------------------------------------------------------------------
 * The following structure represents a user-defined encoding. It collects
 * together all the functions that are used by the specific encoding.
  }
{ The name of the encoding, e.g. "euc-jp".
				 * This name is the unique key for this
				 * encoding type.  }
{ Function to convert from external encoding
				 * into UTF-8.  }
{ Function to convert from UTF-8 into
				 * external encoding.  }
{ If non-NULL, function to call when this
				 * encoding is deleted.  }
{ Arbitrary value associated with encoding
				 * type. Passed to conversion functions.  }
{ Number of zero bytes that signify
				 * end-of-string in this encoding. This number
				 * is used to determine the source string
				 * length when the srcLen argument is
				 * negative. Must be 1 or 2.  }

  PTcl_EncodingType = ^TTcl_EncodingType;
  TTcl_EncodingType = record
      encodingName : Pchar;
      toUtfProc : PTcl_EncodingConvertProc;
      fromUtfProc : PTcl_EncodingConvertProc;
      freeProc : PTcl_EncodingFreeProc;
      clientData : TClientData;
      nullSize : longint;
    end;
{
 * The following definitions are used as values for the conversion control
 * flags argument when converting text from one character set to another:
 *
 * TCL_ENCODING_START -		Signifies that the source buffer is the first
 *				block in a (potentially multi-block) input
 *				stream. Tells the conversion function to reset
 *				to an initial state and perform any
 *				initialization that needs to occur before the
 *				first byte is converted. If the source buffer
 *				contains the entire input stream to be
 *				converted, this flag should be set.
 * TCL_ENCODING_END -		Signifies that the source buffer is the last
 *				block in a (potentially multi-block) input
 *				stream. Tells the conversion routine to
 *				perform any finalization that needs to occur
 *				after the last byte is converted and then to
 *				reset to an initial state. If the source
 *				buffer contains the entire input stream to be
 *				converted, this flag should be set.
 * TCL_ENCODING_STOPONERROR -	If set, the converter returns immediately upon
 *				encountering an invalid byte sequence or a
 *				source character that has no mapping in the
 *				target encoding. If clear, the converter
 *				substitues the problematic character(s) with
 *				one or more "close" characters in the
 *				destination buffer and then continues to
 *				convert the source.
 * TCL_ENCODING_NO_TERMINATE - 	If set, Tcl_externalToUtf does not append a
 *				terminating NUL byte.  Since it does not need
 *				an extra byte for a terminating NUL, it fills
 *				all dstLen bytes with encoded UTF-8 content if
 *				needed.  If clear, a byte is reserved in the
 *				dst space for NUL termination, and a
 *				terminating NUL is appended.
 * TCL_ENCODING_CHAR_LIMIT -	If set and dstCharsPtr is not NULL, then
 *				Tcl_externalToUtf takes the initial value of
 *				*dstCharsPtr as a limit of the maximum number
 *				of chars to produce in the encoded UTF-8
 *				content.  Otherwise, the number of chars
 *				produced is controlled only by other limiting
 *				factors.
  }

const
  TCL_ENCODING_START = $01;  
  TCL_ENCODING_END = $02;  
  TCL_ENCODING_STOPONERROR = $04;  
  TCL_ENCODING_NO_TERMINATE = $08;  
  TCL_ENCODING_CHAR_LIMIT = $10;  
{
 * The following definitions are the error codes returned by the conversion
 * routines:
 *
 * TCL_OK -			All characters were converted.
 * TCL_CONVERT_NOSPACE -	The output buffer would not have been large
 *				enough for all of the converted data; as many
 *				characters as could fit were converted though.
 * TCL_CONVERT_MULTIBYTE -	The last few bytes in the source string were
 *				the beginning of a multibyte sequence, but
 *				more bytes were needed to complete this
 *				sequence. A subsequent call to the conversion
 *				routine should pass the beginning of this
 *				unconverted sequence plus additional bytes
 *				from the source stream to properly convert the
 *				formerly split-up multibyte sequence.
 * TCL_CONVERT_SYNTAX -		The source stream contained an invalid
 *				character sequence. This may occur if the
 *				input stream has been damaged or if the input
 *				encoding method was misidentified. This error
 *				is reported only if TCL_ENCODING_STOPONERROR
 *				was specified.
 * TCL_CONVERT_UNKNOWN -	The source string contained a character that
 *				could not be represented in the target
 *				encoding. This error is reported only if
 *				TCL_ENCODING_STOPONERROR was specified.
  }
  TCL_CONVERT_MULTIBYTE = -(1);  
  TCL_CONVERT_SYNTAX = -(2);  
  TCL_CONVERT_UNKNOWN = -(3);  
  TCL_CONVERT_NOSPACE = -(4);  
{
 * The maximum number of bytes that are necessary to represent a single
 * Unicode character in UTF-8. The valid values should be 3, 4 or 6. If 3 or
 * 4, then Tcl_UniChar must be 2-bytes in size (UCS-2) (the default). If 6,
 * then Tcl_UniChar must be 4-bytes in size (UCS-4). At this time UCS-2 mode
 * is the default and recommended mode. UCS-4 is experimental and not
 * recommended. It works for the core, but most extensions expect UCS-2.
  }
{$ifndef TCL_UTF_MAX}

const
  TCL_UTF_MAX = 3;  
{$endif}
{
 * This represents a Unicode character. Any changes to this should also be
 * reflected in regcustom.h.
  }
{$if TCL_UTF_MAX > 4}
{
     * unsigned int isn't 100% accurate as it should be a strict 4-byte value.
     * The size of this value must be reflected correctly in regcustom.h.
     * XXX: Tcl is currently UCS-2 and planning UTF-16 for the Unicode
     * XXX: string rep that Tcl_UniChar represents.  Changing the size
     * XXX: of Tcl_UniChar is /not/ supported.
      }
type
  PTcl_UniChar = ^TTcl_UniChar;
  TTcl_UniChar = dword;
{$else}
type
  PTcl_UniChar = ^TTcl_UniChar;
  TTcl_UniChar = word;
{$endif}
{
 *----------------------------------------------------------------------------
 * TIP #59: The following structure is used in calls 'Tcl_RegisterConfig' to
 * provide the system with the embedded configuration data.
  }
{ Configuration key to register. ASCII
				 * encoded, thus UTF-8.  }
{ The value associated with the key. System
				 * encoding.  }
type
  PTcl_Config = ^TTcl_Config;
  TTcl_Config = record
      key : Pchar;
      value : Pchar;
    end;
{
 *----------------------------------------------------------------------------
 * Flags for TIP#143 limits, detailing which limits are active in an
 * interpreter. Used for Tcl_Add,RemoveLimitHandler type argument.
  }

const
  TCL_LIMIT_COMMANDS = $01;  
  TCL_LIMIT_TIME = $02;  
{
 * Structure containing information about a limit handler to be called when a
 * command- or time-limit is exceeded by an interpreter.
  }
type
{
 *----------------------------------------------------------------------------
 * Override definitions for libtommath.
  }
{$define MP_INT_DECLARED}

  Pmp_digit = ^Tmp_digit;
  Tmp_digit = dword;
{$define MP_DIGIT_DECLARED}
{
 *----------------------------------------------------------------------------
 * Definitions needed for Tcl_ParseArgvObj routines.
 * Based on tkArgv.c.
 * Modifications from the original are copyright (c) Sam Bromley 2006
  }
{ Indicates the option type; see below.  }
{ The key string that flags the option in the
				 * argv array.  }
{ Value to be used in setting dst; usage
				 * depends on type. }
{ Address of value to be modified; usage
				 * depends on type. }
{ Documentation message describing this
				 * option.  }
{ Word to pass to function callbacks.  }

  PTcl_ArgvInfo = ^TTcl_ArgvInfo;
  TTcl_ArgvInfo = record
      _type : longint;
      keyStr : Pchar;
      srcPtr : pointer;
      dstPtr : pointer;
      helpStr : Pchar;
      clientData : TClientData;
    end;
{
 * Legal values for the type field of a Tcl_ArgInfo: see the user
 * documentation for details.
  }

const
  TCL_ARGV_CONSTANT = 15;  
  TCL_ARGV_INT = 16;  
  TCL_ARGV_STRING = 17;  
  TCL_ARGV_REST = 18;  
  TCL_ARGV_FLOAT = 19;  
  TCL_ARGV_FUNC = 20;  
  TCL_ARGV_GENFUNC = 21;  
  TCL_ARGV_HELP = 22;  
  TCL_ARGV_END = 23;  
{
 * Types of callback functions for the TCL_ARGV_FUNC and TCL_ARGV_GENFUNC
 * argument types:
  }
type
{
 * Shorthand for commonly used argTable entries.
  }
{
 *----------------------------------------------------------------------------
 * Definitions needed for Tcl_Zlib routines. [TIP #234]
 *
 * Constants for the format flags describing what sort of data format is
 * desired/expected for the Tcl_ZlibDeflate, Tcl_ZlibInflate and
 * Tcl_ZlibStreamInit functions.
  }

const
  TCL_ZLIB_FORMAT_RAW = 1;  
  TCL_ZLIB_FORMAT_ZLIB = 2;  
  TCL_ZLIB_FORMAT_GZIP = 4;  
  TCL_ZLIB_FORMAT_AUTO = 8;  
{
 * Constants that describe whether the stream is to operate in compressing or
 * decompressing mode.
  }
  TCL_ZLIB_STREAM_DEFLATE = 16;  
  TCL_ZLIB_STREAM_INFLATE = 32;  
{
 * Constants giving compression levels. Use of TCL_ZLIB_COMPRESS_DEFAULT is
 * recommended.
  }
  TCL_ZLIB_COMPRESS_NONE = 0;  
  TCL_ZLIB_COMPRESS_FAST = 1;  
  TCL_ZLIB_COMPRESS_BEST = 9;  
  TCL_ZLIB_COMPRESS_DEFAULT = -(1);  
{
 * Constants for types of flushing, used with Tcl_ZlibFlush.
  }
  TCL_ZLIB_NO_FLUSH = 0;  
  TCL_ZLIB_FLUSH = 2;  
  TCL_ZLIB_FULLFLUSH = 3;  
  TCL_ZLIB_FINALIZE = 4;  
{
 *----------------------------------------------------------------------------
 * Definitions needed for the Tcl_LoadFile function. [TIP #416]
  }
  TCL_LOAD_GLOBAL = 1;  
  TCL_LOAD_LAZY = 2;  
{
 *----------------------------------------------------------------------------
 * Single public declaration for NRE.
  }
type
{
 *----------------------------------------------------------------------------
 * The following constant is used to test for older versions of Tcl in the
 * stubs tables.
  }

{ was #define dname def_expr }
function TCL_STUB_MAGIC : longint;  

{
 * The following function is required to be defined in all stubs aware
 * extensions. The function is actually implemented in the stub library, not
 * the main Tcl library, although there is a trivial implementation in the
 * main library in case an extension is statically linked into an application.
  }
function Tcl_InitStubs(interp:PTcl_Interp; version:Pchar; exact:longint):Pchar;cdecl;external libtcl8_6;
function TclTomMathInitializeStubs(interp:PTcl_Interp; version:Pchar; epoch:longint; revision:longint):Pchar;cdecl;external libtcl8_6;
{
 * When not using stubs, make it a macro.
  }
{$ifndef USE_TCL_STUBS}
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function Tcl_InitStubs(interp,version,exact : longint) : longint;

{$endif}
{
 * Public functions that are not accessible via the stubs table.
 * Tcl_GetMemoryInfo is needed for AOLserver. [Bug 1868171]
  }

procedure Tcl_MainEx(argc:longint; argv:PPchar; appInitProc:PTcl_AppInitProc; interp:PTcl_Interp);cdecl;external libtcl8_6;
function Tcl_PkgInitStubsCheck(interp:PTcl_Interp; version:Pchar; exact:longint):Pchar;cdecl;external libtcl8_6;
procedure Tcl_GetMemoryInfo(dsPtr:PTcl_DString);cdecl;external libtcl8_6;
{
 *----------------------------------------------------------------------------
 * Include the public function declarations that are accessible via the stubs
 * table.
  }
{$include "tclDecls.h"}
{
 * Include platform specific public function declarations that are accessible
 * via the stubs table. Make all TclOO symbols MODULE_SCOPE (which only
 * has effect on building it as a shared library). See ticket [3010352].
  }
{$if defined(BUILD_tcl)}
{$undef TCLAPI}

const
  TCLAPI = MODULE_SCOPE;  
{$endif}
{$include "tclPlatDecls.h"}
{
 *----------------------------------------------------------------------------
 * The following declarations either map ckalloc and ckfree to malloc and
 * free, or they map them to functions with all sorts of debugging hooks
 * defined in tclCkalloc.c.
  }
{
 * If we are not using the debugging allocator, we should call the Tcl_Alloc,
 * et al. routines in order to guarantee that every module is using the same
 * memory allocator both inside and outside of the Tcl library.
  }
{$endif}
{ !TCL_MEM_DEBUG  }
{
 * Macros and definitions that help to debug the use of Tcl objects. When
 * TCL_MEM_DEBUG is defined, the Tcl_New declarations are overridden to call
 * debugging versions of the object creation functions.
  }
{
 *----------------------------------------------------------------------------
 * Macros for clients to use to access fields of hash entries:
  }
{
 * Macros to use for clients to use to invoke find and create functions for
 * hash tables:
  }
{
 *----------------------------------------------------------------------------
 * Deprecated Tcl functions:
  }
{$ifndef TCL_NO_DEPRECATED}
{
 * These function have been renamed. The old names are deprecated, but we
 * define these macros for backwards compatibility.
  }

const
  Tcl_Ckalloc = Tcl_Alloc;  
  Tcl_Ckfree = Tcl_Free;  
  Tcl_Ckrealloc = Tcl_Realloc;  
  Tcl_Return = Tcl_SetResult;  
  Tcl_TildeSubst = Tcl_TranslateFileName;  
{$if !defined(__APPLE__) /* On OSX, there is a conflict with "mach/mach.h" */}

const
  panic = Tcl_Panic;  
{$endif}

const
  panicVA = Tcl_PanicVA;  
{$endif}
{ !TCL_NO_DEPRECATED  }
{
 *----------------------------------------------------------------------------
 * Convenience declaration of Tcl_AppInit for backwards compatibility. This
 * function is not *implemented* by the tcl library, so the storage class is
 * neither DLLEXPORT nor DLLIMPORT.
  }
  var
    Tcl_AppInit : TTcl_AppInitProc;cvar;external libtcl8_6;
{$endif}
{ RC_INVOKED  }
{
 * end block for C++
  }
{ C++ end of extern C conditionnal removed }
{$endif}
{ _TCL  }
{
 * Local Variables:
 * mode: c
 * c-basic-offset: 4
 * fill-column: 78
 * End:
  }

// === Konventiert am: 15-4-25 13:25:48 ===


implementation


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function Tcl_DStringLength(dsPtr : longint) : longint;
begin
  Tcl_DStringLength:=dsPtr^.length;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function Tcl_DStringValue(dsPtr : longint) : longint;
begin
  Tcl_DStringValue:=dsPtr^._string;
end;

{ was #define dname def_expr }
function TCL_VOLATILE : PTcl_FreeProc;
  begin
    TCL_VOLATILE:=PTcl_FreeProc(1);
  end;

{ was #define dname def_expr }
function TCL_STATIC : PTcl_FreeProc;
  begin
    TCL_STATIC:=PTcl_FreeProc(0);
  end;

{ was #define dname def_expr }
function TCL_DYNAMIC : PTcl_FreeProc;
  begin
    TCL_DYNAMIC:=PTcl_FreeProc(3);
  end;

{ was #define dname def_expr }
function TCL_CLOSE2PROC : PTcl_DriverCloseProc;
  begin
    TCL_CLOSE2PROC:=PTcl_DriverCloseProc(1);
  end;

{ was #define dname def_expr }
function TCL_CHANNEL_VERSION_1 : TTcl_ChannelTypeVersion;
  begin
    TCL_CHANNEL_VERSION_1:=TTcl_ChannelTypeVersion($1);
  end;

{ was #define dname def_expr }
function TCL_CHANNEL_VERSION_2 : TTcl_ChannelTypeVersion;
  begin
    TCL_CHANNEL_VERSION_2:=TTcl_ChannelTypeVersion($2);
  end;

{ was #define dname def_expr }
function TCL_CHANNEL_VERSION_3 : TTcl_ChannelTypeVersion;
  begin
    TCL_CHANNEL_VERSION_3:=TTcl_ChannelTypeVersion($3);
  end;

{ was #define dname def_expr }
function TCL_CHANNEL_VERSION_4 : TTcl_ChannelTypeVersion;
  begin
    TCL_CHANNEL_VERSION_4:=TTcl_ChannelTypeVersion($4);
  end;

{ was #define dname def_expr }
function TCL_CHANNEL_VERSION_5 : TTcl_ChannelTypeVersion;
  begin
    TCL_CHANNEL_VERSION_5:=TTcl_ChannelTypeVersion($5);
  end;

{ was #define dname def_expr }
function TCL_FILESYSTEM_VERSION_1 : TTcl_FSVersion;
  begin
    TCL_FILESYSTEM_VERSION_1:=TTcl_FSVersion($1);
  end;

{ was #define dname def_expr }
function TCL_STUB_MAGIC : longint;
  begin
    TCL_STUB_MAGIC:=longint($FCA3BACF);
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function Tcl_InitStubs(interp,version,exact : longint) : longint;
begin
  Tcl_InitStubs:=Tcl_PkgInitStubsCheck(interp,version,exact);
end;


end.
