
unit ecore_exe_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from ecore_exe_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    ecore_exe_eo.h
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
PEcore_Exe  = ^Ecore_Exe;
PEcore_Exe_Event_Data  = ^Ecore_Exe_Event_Data;
PEcore_Exe_Event_Data_Line  = ^Ecore_Exe_Event_Data_Line;
PEcore_Exe_Flags  = ^Ecore_Exe_Flags;
PEfl_Class  = ^Efl_Class;
PEfl_Object  = ^Efl_Object;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _ECORE_EXE_EO_H_}
{$define _ECORE_EXE_EO_H_}
{$ifndef _ECORE_EXE_EO_CLASS_TYPE}
{$define _ECORE_EXE_EO_CLASS_TYPE}
{*
 * @struct Ecore_Exe
 * Opaque handle to manage Ecore Exe objects.
  }
type
  PEcore_Exe = ^TEcore_Exe;
  TEcore_Exe = TEo;
{$endif}
{$ifndef _ECORE_EXE_EO_TYPES}
{$define _ECORE_EXE_EO_TYPES}
{* A structure which stores information on lines data from a child process.
 *
 * @ingroup Ecore_Exe_Event_Data
  }
{*< The bytes of a line of buffered data  }
{*< The size of the line buffer in bytes  }
type
  PEcore_Exe_Event_Data_Line = ^TEcore_Exe_Event_Data_Line;
  TEcore_Exe_Event_Data_Line = record
      line : Pchar;
      size : longint;
    end;
{* Ecore exe event data structure
 *
 * @ingroup Ecore_Exe
  }
{*< The handle to the process. FIXME: should actually be
                    * Ecore.Exe, workaround cyclic  }
{*< The raw binary data from the child process received  }
{*< The size of this data in bytes  }
{*< An array of line data if line buffered.
                                     * The last one has its line member set to
                                     * @c NULL  }

  PEcore_Exe_Event_Data = ^TEcore_Exe_Event_Data;
  TEcore_Exe_Event_Data = record
      exe : PEfl_Object;
      data : pointer;
      size : longint;
      lines : PEcore_Exe_Event_Data_Line;
    end;
{* Flags for executing a child with its stdin and/or stdout piped back.
 *
 * @ingroup Ecore
  }
{*< No exe flags at all  }
{*< Exe Pipe Read mask  }
{*< Exe Pipe Write mask  }
{*< Exe Pipe error mask  }
{*< Reads are buffered until a newline
                                          * and split 1 line per
                                          * Ecore_Exe_Event_Data_Line  }
{*< Errors are buffered until a
                                            * newline and split 1 line per
                                            * Ecore_Exe_Event_Data_Line  }
{*< stdout and stderr are buffered automatically  }
{*< FIXME: Exe is restarted if it dies  }
{*< Use /bin/sh to run the command.  }
{*< Do not use setsid() to set the executed
                               * process as its own session leader  }
{*< Makes child receive SIGTERM when parent
                                     * dies.  }
{*< Try and isolate stdin/out and err of the
                               * process so it isn't shared with the parent.  }

  PEcore_Exe_Flags = ^TEcore_Exe_Flags;
  TEcore_Exe_Flags =  Longint;
  Const
    ECORE_EXE_NONE = 0;
    ECORE_EXE_PIPE_READ = 1;
    ECORE_EXE_PIPE_WRITE = 2;
    ECORE_EXE_PIPE_ERROR = 4;
    ECORE_EXE_PIPE_READ_LINE_BUFFERED = 8;
    ECORE_EXE_PIPE_ERROR_LINE_BUFFERED = 16;
    ECORE_EXE_PIPE_AUTO = 32;
    ECORE_EXE_RESPAWN = 64;
    ECORE_EXE_USE_SH = 128;
    ECORE_EXE_NOT_LEADER = 256;
    ECORE_EXE_TERM_WITH_PARENT = 512;
    ECORE_EXE_ISOLATE_IO = 1024;
;
{$endif}
{*
 * @brief Ecore.Exe is responsible for managing portable process spawning.
 *
 * With this module you are able to spawn, pause and quit spawned processes.
 * Interaction between your process and those spawned is possible using pipes
 * or signals.
 *
 * @ingroup Ecore_Exe
  }

{ was #define dname def_expr }
function ECORE_EXE_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function ecore_exe_class_get:PEfl_Class;cdecl;external;
{*
 * @brief Controls the command that's executed. FIXME: May need a split/rename.
 *
 * @param[in] obj The object.
 * @param[in] exe_cmd The command to execute.
 * @param[in] flags The execution flags.
 *
 * @ingroup Ecore_Exe
  }
(* Const before type ignored *)
procedure ecore_obj_exe_command_set(obj:PEo; exe_cmd:Pchar; flags:TEcore_Exe_Flags);cdecl;external;
{*
 * @brief Controls the command that's executed. FIXME: May need a split/rename.
 *
 * @param[in] obj The object.
 * @param[out] exe_cmd The command to execute.
 * @param[out] flags The execution flags.
 *
 * @ingroup Ecore_Exe
  }
(* Const before type ignored *)
(* Const before type ignored *)
procedure ecore_obj_exe_command_get(obj:PEo; exe_cmd:PPchar; flags:PEcore_Exe_Flags);cdecl;external;
(* Const before type ignored *)
  var
    _ECORE_EXE_EVENT_DATA_GET : TEfl_Event_Description;cvar;external;
{* Data received event from the child process
 * @return Ecore_Exe_Event_Data
 *
 * @ingroup Ecore_Exe
  }
(* Const before type ignored *)
    _ECORE_EXE_EVENT_DATA_ERROR : TEfl_Event_Description;cvar;external;
{* Error received event from the child process
 * @return Ecore_Exe_Event_Data
 *
 * @ingroup Ecore_Exe
  }

{ was #define dname def_expr }
function ECORE_EXE_EVENT_DATA_GET : longint; { return type might be wrong }

{ was #define dname def_expr }
function ECORE_EXE_EVENT_DATA_ERROR : longint; { return type might be wrong }

{$endif}

implementation

{ was #define dname def_expr }
function ECORE_EXE_CLASS : longint; { return type might be wrong }
  begin
    ECORE_EXE_CLASS:=ecore_exe_class_get;
  end;

{ was #define dname def_expr }
function ECORE_EXE_EVENT_DATA_GET : longint; { return type might be wrong }
  begin
    ECORE_EXE_EVENT_DATA_GET:=@(_ECORE_EXE_EVENT_DATA_GET);
  end;

{ was #define dname def_expr }
function ECORE_EXE_EVENT_DATA_ERROR : longint; { return type might be wrong }
  begin
    ECORE_EXE_EVENT_DATA_ERROR:=@(_ECORE_EXE_EVENT_DATA_ERROR);
  end;


end.
