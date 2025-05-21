
unit efl_task_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_task_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_task_eo.h
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
PEfl_Task  = ^Efl_Task;
PEfl_Task_Flags  = ^Efl_Task_Flags;
PEfl_Task_Priority  = ^Efl_Task_Priority;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_TASK_EO_H_}
{$define _EFL_TASK_EO_H_}
{$ifndef _EFL_TASK_EO_CLASS_TYPE}
{$define _EFL_TASK_EO_CLASS_TYPE}
type
  PEfl_Task = ^TEfl_Task;
  TEfl_Task = TEo;
{$endif}
{$ifndef _EFL_TASK_EO_TYPES}
{$define _EFL_TASK_EO_TYPES}
{* How much processor time will this task get compared to other tasks running
 * on the same processor.
 *
 * @since 1.22
 *
 * @ingroup Efl_Task_Priority
  }
{*< Neither above nor below average priority.
                                 * This is the default.
                                 *
                                 * @since 1.22  }
{*< Far below average priority.
                                 *
                                 * @since 1.22  }
{*< Below average priority.
                          *
                          * @since 1.22  }
{*< Above average priority.
                           *
                           * @since 1.22  }
{*< Far above average priority.
                           *
                           * @since 1.22  }
type
  PEfl_Task_Priority = ^TEfl_Task_Priority;
  TEfl_Task_Priority =  Longint;
  Const
    EFL_TASK_PRIORITY_NORMAL = 0;
    EFL_TASK_PRIORITY_BACKGROUND = 1;
    EFL_TASK_PRIORITY_LOW = 2;
    EFL_TASK_PRIORITY_HIGH = 3;
    EFL_TASK_PRIORITY_ULTRA = 4;
;
{* Flags to further customize task's behavior.
 *
 * @since 1.22
 *
 * @ingroup Efl_Task_Flags
  }
{*< No special flags.
                            *
                            * @since 1.22  }
{*< Task will require console input.
                                 *
                                 * @since 1.22  }
{*< Task will require console output.
                                  *
                                  * @since 1.22  }
{*< Task will not produce an exit code
                                          * upon termination.
                                          *
                                          * @since 1.22  }
{*< Exit when parent exits.
                                       *
                                       * @since 1.22  }
type
  PEfl_Task_Flags = ^TEfl_Task_Flags;
  TEfl_Task_Flags =  Longint;
  Const
    EFL_TASK_FLAGS_NONE = 0;
    EFL_TASK_FLAGS_USE_STDIN = 1;
    EFL_TASK_FLAGS_USE_STDOUT = 2;
    EFL_TASK_FLAGS_NO_EXIT_CODE_ERROR = 4;
    EFL_TASK_FLAGS_EXIT_WITH_PARENT = 8;
;
{$endif}
{* EFL's abstraction for a task (process).
 *
 * @since 1.22
 *
 * @ingroup Efl_Task
  }

{ was #define dname def_expr }
function EFL_TASK_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_task_class_get:PEfl_Class;cdecl;external;
{*
 * @brief The priority of this task.
 *
 * @param[in] obj The object.
 * @param[in] priority Desired priority.
 *
 * @since 1.22
 *
 * @ingroup Efl_Task
  }
procedure efl_task_priority_set(obj:PEo; priority:TEfl_Task_Priority);cdecl;external;
{*
 * @brief The priority of this task.
 *
 * @param[in] obj The object.
 *
 * @return Desired priority.
 *
 * @since 1.22
 *
 * @ingroup Efl_Task
  }
(* Const before type ignored *)
function efl_task_priority_get(obj:PEo):TEfl_Task_Priority;cdecl;external;
{*
 * @brief The final exit code of this task. This is the code that will be
 * produced upon task completion.
 *
 * @param[in] obj The object.
 *
 * @return The exit code.
 *
 * @since 1.22
 *
 * @ingroup Efl_Task
  }
(* Const before type ignored *)
function efl_task_exit_code_get(obj:PEo):longint;cdecl;external;
{*
 * @brief Flags to further customize task's behavior.
 *
 * @param[in] obj The object.
 * @param[in] flags Desired task flags.
 *
 * @since 1.22
 *
 * @ingroup Efl_Task
  }
procedure efl_task_flags_set(obj:PEo; flags:TEfl_Task_Flags);cdecl;external;
{*
 * @brief Flags to further customize task's behavior.
 *
 * @param[in] obj The object.
 *
 * @return Desired task flags.
 *
 * @since 1.22
 *
 * @ingroup Efl_Task
  }
(* Const before type ignored *)
function efl_task_flags_get(obj:PEo):TEfl_Task_Flags;cdecl;external;
{*
 * @brief Actually run the task.
 *
 * @param[in] obj The object.
 *
 * @return On success in starting the task, return true, otherwise false
 *
 * @since 1.22
 *
 * @ingroup Efl_Task
  }
function efl_task_run(obj:PEo):TEina_Bool;cdecl;external;
{* Request the task end (may send a signal or interrupt signal resulting in a
 * terminate event being triggered in the target task loop).
 *
 * @since 1.22
 *
 * @ingroup Efl_Task
  }
procedure efl_task_end(obj:PEo);cdecl;external;
(* Const before type ignored *)
  var
    _EFL_TASK_EVENT_EXIT : TEfl_Event_Description;cvar;external;
{* Called when the task exits. You can pick up any information you need at
 * this point such as exit_code etc.
 *
 * @since 1.22
 *
 * @ingroup Efl_Task
  }

{ was #define dname def_expr }
function EFL_TASK_EVENT_EXIT : longint; { return type might be wrong }

{$endif}

implementation

{ was #define dname def_expr }
function EFL_TASK_CLASS : longint; { return type might be wrong }
  begin
    EFL_TASK_CLASS:=efl_task_class_get;
  end;

{ was #define dname def_expr }
function EFL_TASK_EVENT_EXIT : longint; { return type might be wrong }
  begin
    EFL_TASK_EVENT_EXIT:=@(_EFL_TASK_EVENT_EXIT);
  end;


end.
