unit efl_loop_fd_eo;

interface

uses
  efl, fp_eo, fp_eina, fp_efl;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Loop_Fd = ^TEfl_Loop_Fd;
  TEfl_Loop_Fd = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_LOOP_FD_CLASS: PEfl_Class;

function efl_loop_fd_class_get: PEfl_Class; cdecl; external libecore;
procedure efl_loop_fd_set(obj: PEo; fd: longint); cdecl; external libecore;
function efl_loop_fd_get(obj: PEo): longint; cdecl; external libecore;
procedure efl_loop_fd_file_set(obj: PEo; fd: longint); cdecl; external libecore;
function efl_loop_fd_file_get(obj: PEo): longint; cdecl; external libecore;

var
  _EFL_LOOP_FD_EVENT_READ: TEfl_Event_Description; cvar;external libecore;
  _EFL_LOOP_FD_EVENT_WRITE: TEfl_Event_Description; cvar;external libecore;
  _EFL_LOOP_FD_EVENT_ERROR: TEfl_Event_Description; cvar;external libecore;

function EFL_LOOP_FD_EVENT_READ: PEfl_Event_Description;
function EFL_LOOP_FD_EVENT_WRITE: PEfl_Event_Description;
function EFL_LOOP_FD_EVENT_ERROR: PEfl_Event_Description;
{$endif}

// === Konventiert am: 21-5-25 15:43:59 ===


implementation


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_LOOP_FD_CLASS: PEfl_Class;
begin
  EFL_LOOP_FD_CLASS := efl_loop_fd_class_get;
end;

function EFL_LOOP_FD_EVENT_READ: PEfl_Event_Description;
begin
  EFL_LOOP_FD_EVENT_READ := @(_EFL_LOOP_FD_EVENT_READ);
end;

function EFL_LOOP_FD_EVENT_WRITE: PEfl_Event_Description;
begin
  EFL_LOOP_FD_EVENT_WRITE := @(_EFL_LOOP_FD_EVENT_WRITE);
end;

function EFL_LOOP_FD_EVENT_ERROR: PEfl_Event_Description;
begin
  EFL_LOOP_FD_EVENT_ERROR := @(_EFL_LOOP_FD_EVENT_ERROR);
end;
{$endif}


end.
