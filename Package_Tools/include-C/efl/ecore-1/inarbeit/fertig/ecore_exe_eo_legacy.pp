
unit ecore_exe_eo_legacy;
interface

{
  Automatically converted by H2Pas 1.0.0 from ecore_exe_eo_legacy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    ecore_exe_eo_legacy.h
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
PEfl_Object  = ^Efl_Object;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _ECORE_EXE_EO_LEGACY_H_}
{$define _ECORE_EXE_EO_LEGACY_H_}
{$ifndef _ECORE_EXE_EO_CLASS_TYPE}
{$define _ECORE_EXE_EO_CLASS_TYPE}
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
{$endif}

implementation


end.
