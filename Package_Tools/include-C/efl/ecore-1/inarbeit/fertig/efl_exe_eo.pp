
unit efl_exe_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_exe_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_exe_eo.h
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
PEfl_Exe  = ^Efl_Exe;
PEfl_Exe_Flags  = ^Efl_Exe_Flags;
PEfl_Exe_Signal  = ^Efl_Exe_Signal;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_EXE_EO_H_}
{$define _EFL_EXE_EO_H_}
{$ifndef _EFL_EXE_EO_CLASS_TYPE}
{$define _EFL_EXE_EO_CLASS_TYPE}
type
  PEfl_Exe = ^TEfl_Exe;
  TEfl_Exe = TEo;
{$endif}
{$ifndef _EFL_EXE_EO_TYPES}
{$define _EFL_EXE_EO_TYPES}
{$ifdef EFL_BETA_API_SUPPORT}
{* Signal is a notification, a message sent by either operating system or some
 * application to our program. Signals are a mechanism for one-way asynchronous
 * notifications. A signal may be sent from the kernel to a process, from a
 * process to another process, or from a process to itself. Signal typically
 * alert a process to some event, such as a segmentation fault, or the user
 * pressing Ctrl-C.
 *
 * @ingroup Efl_Exe_Signal
  }
{*< Terminal interrupt.  }
{*< Terminal quit.  }
{*< Termination.  }
{*< Kill(can't be caught or ignored).  }
{*< Continue executing, if stopped.  }
{*< Stop executing(can't be caught or ignored).  }
{*< Hangup.  }
{*< User defined signal 1.  }
{*< User defined signal 2.  }
type
  PEfl_Exe_Signal = ^TEfl_Exe_Signal;
  TEfl_Exe_Signal =  Longint;
  Const
    EFL_EXE_SIGNAL_INT = 0;
    EFL_EXE_SIGNAL_QUIT = 1;
    EFL_EXE_SIGNAL_TERM = 2;
    EFL_EXE_SIGNAL_KILL = 3;
    EFL_EXE_SIGNAL_CONT = 4;
    EFL_EXE_SIGNAL_STOP = 5;
    EFL_EXE_SIGNAL_HUP = 6;
    EFL_EXE_SIGNAL_USR1 = 7;
    EFL_EXE_SIGNAL_USR2 = 8;
;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{* Flags to customize process behavior.
 *
 * @ingroup Efl_Exe_Flags
  }
{*< No special flags.  }
{*< Process will be executed in its own
                                   * session.  }
{*< All console IO will be hidden.  }
{*< Makes child receive SIGTERM when
                                      * parent dies.  }
type
  PEfl_Exe_Flags = ^TEfl_Exe_Flags;
  TEfl_Exe_Flags =  Longint;
  Const
    EFL_EXE_FLAGS_NONE = 0;
    EFL_EXE_FLAGS_GROUP_LEADER = 1;
    EFL_EXE_FLAGS_HIDE_IO = 4;
    EFL_EXE_FLAGS_TERM_WITH_PARENT = 8;
;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{* This is a specialized @ref Efl_Task which abstracts an operating system
 * process. This class provides a way to start a task by running an executable
 * file (specified using the @ref Efl_Core_Command_Line interface) and further
 * customize its execution flags (@Efl.Exe.exe_flags) and environment variables
 * (@Efl.Exe.env). It also allows communicating with the process through
 * signals (@Efl.Exe.signal).
 *
 * @ingroup Efl_Exe
  }

{ was #define dname def_expr }
function EFL_EXE_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_exe_class_get:PEfl_Class;cdecl;external;
{*
 * @brief Send a signal to this process.
 *
 * @param[in] obj The object.
 * @param[in] sig Signal number to send.
 *
 * @ingroup Efl_Exe
  }
procedure efl_exe_signal(obj:PEo; sig:TEfl_Exe_Signal);cdecl;external;
{*
 * @brief Customize the process' behavior.
 *
 * @param[in] obj The object.
 * @param[in] flags Flags.
 *
 * @ingroup Efl_Exe
  }
procedure efl_exe_flags_set(obj:PEo; flags:TEfl_Exe_Flags);cdecl;external;
{*
 * @brief Customize the process' behavior.
 *
 * @param[in] obj The object.
 *
 * @return Flags.
 *
 * @ingroup Efl_Exe
  }
(* Const before type ignored *)
function efl_exe_flags_get(obj:PEo):TEfl_Exe_Flags;cdecl;external;
{*
 * @brief The signal this process emitted upon exiting, if any.
 *
 * @param[in] obj The object.
 *
 * @return The exit signal, or -1 if no exit signal happened.
 *
 * @ingroup Efl_Exe
  }
(* Const before type ignored *)
function efl_exe_exit_signal_get(obj:PEo):longint;cdecl;external;
{*
 * @brief The pid of the process, which is only accessible after the object has
 * been finalized.
 *
 * @param[in] obj The object.
 *
 * @return The pid, or 0 on failure.
 *
 * @since 1.24
 *
 * @ingroup Efl_Exe
  }
(* Const before type ignored *)
function efl_exe_pid_get(obj:PEo):longint;cdecl;external;
{*
 * @brief If @c env is @c NULL then the process created by this object is going
 * to inherit the environment of this process.
 *
 * In case @c env is not @c NULL then the environment variables declared in
 * this object will represent the environment passed to the new process.
 *
 * @param[in] obj The object.
 * @param[in] env @c env will be referenced until this object does not need it
 * anymore.
 *
 * @ingroup Efl_Exe
  }
procedure efl_exe_env_set(obj:PEo; env:PEfl_Core_Env);cdecl;external;
{*
 * @brief If @c env is @c NULL then the process created by this object is going
 * to inherit the environment of this process.
 *
 * In case @c env is not @c NULL then the environment variables declared in
 * this object will represent the environment passed to the new process.
 *
 * @param[in] obj The object.
 *
 * @return @c env will be referenced until this object does not need it
 * anymore.
 *
 * @ingroup Efl_Exe
  }
(* Const before type ignored *)
function efl_exe_env_get(obj:PEo):PEfl_Core_Env;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_EXE_CLASS : longint; { return type might be wrong }
  begin
    EFL_EXE_CLASS:=efl_exe_class_get;
  end;


end.
