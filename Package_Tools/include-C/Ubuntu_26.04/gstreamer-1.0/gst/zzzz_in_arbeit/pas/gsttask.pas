unit gsttask;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gst, gstobject, gsttaskpool;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_enum}
type
  PGstTaskState = ^TGstTaskState;
  TGstTaskState = longint;
const
  GST_TASK_STARTED = 0;
  GST_TASK_STOPPED = 1;
  GST_TASK_PAUSED = 2;
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PGstTask = ^TGstTask;

  TGstTaskFunction = procedure(user_data: Tgpointer); cdecl;
  TGstTaskThreadFunc = procedure(task: PGstTask; thread: PGThread; user_data: Tgpointer); cdecl;

  PGstTaskPrivate = type Pointer;

  TGstTask = record
    obj: TGstObject;
    state: TGstTaskState;
    cond: TGCond;
    lock: PGRecMutex;
    func: TGstTaskFunction;
    user_data: Tgpointer;
    notify: TGDestroyNotify;
    running: Tgboolean;
    thread: PGThread;
    priv: PGstTaskPrivate;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;

  PGstTaskClass = ^TGstTaskClass;
  TGstTaskClass = record
    parent_class: TGstObjectClass;
    pool: PGstTaskPool;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
procedure gst_task_cleanup_all; cdecl; external libgstreamer;
function gst_task_get_type: TGType; cdecl; external libgstreamer;
function gst_task_new(func: TGstTaskFunction; user_data: Tgpointer; notify: TGDestroyNotify): PGstTask; cdecl; external libgstreamer;
procedure gst_task_set_lock(task: PGstTask; mutex: PGRecMutex); cdecl; external libgstreamer;
function gst_task_get_pool(task: PGstTask): PGstTaskPool; cdecl; external libgstreamer;
procedure gst_task_set_pool(task: PGstTask; pool: PGstTaskPool); cdecl; external libgstreamer;
procedure gst_task_set_enter_callback(task: PGstTask; enter_func: TGstTaskThreadFunc; user_data: Tgpointer; notify: TGDestroyNotify); cdecl; external libgstreamer;
procedure gst_task_set_leave_callback(task: PGstTask; leave_func: TGstTaskThreadFunc; user_data: Tgpointer; notify: TGDestroyNotify); cdecl; external libgstreamer;
function gst_task_get_state(task: PGstTask): TGstTaskState; cdecl; external libgstreamer;
function gst_task_set_state(task: PGstTask; state: TGstTaskState): Tgboolean; cdecl; external libgstreamer;
function gst_task_start(task: PGstTask): Tgboolean; cdecl; external libgstreamer;
function gst_task_stop(task: PGstTask): Tgboolean; cdecl; external libgstreamer;
function gst_task_pause(task: PGstTask): Tgboolean; cdecl; external libgstreamer;
function gst_task_resume(task: PGstTask): Tgboolean; cdecl; external libgstreamer;
function gst_task_join(task: PGstTask): Tgboolean; cdecl; external libgstreamer;

// === Konventiert am: 11-7-26 15:33:23 ===

function GST_TASK_CAST(task: Pointer): PGstTask;
function GST_TASK_STATE(task: Pointer): TGstTaskState;
function GST_TASK_GET_COND(task: Pointer): PGCond;
procedure GST_TASK_WAIT(task: Pointer);
procedure GST_TASK_SIGNAL(task: Pointer);
procedure GST_TASK_BROADCAST(task: Pointer);
function GST_TASK_GET_LOCK(task: Pointer): PGRecMutex;
{$ENDIF read_function}

implementation

function GST_TASK_CAST(task: Pointer): PGstTask;
begin
  GST_TASK_CAST := PGstTask(task);
end;

function GST_TASK_STATE(task: Pointer): TGstTaskState;
begin
  GST_TASK_STATE := (GST_TASK_CAST(task))^.state;
end;

function GST_TASK_GET_COND(task: Pointer): PGCond;
begin
  GST_TASK_GET_COND := @((GST_TASK_CAST(task))^.cond);
end;

procedure GST_TASK_WAIT(task: Pointer);
begin
  g_cond_wait(GST_TASK_GET_COND(task), GST_OBJECT_GET_LOCK(task));
end;

procedure GST_TASK_SIGNAL(task: Pointer);
begin
  g_cond_signal(GST_TASK_GET_COND(task));
end;

procedure GST_TASK_BROADCAST(task: Pointer);
begin
  g_cond_broadcast(GST_TASK_GET_COND(task));
end;

function GST_TASK_GET_LOCK(task: Pointer): PGRecMutex;
begin
  GST_TASK_GET_LOCK := (GST_TASK_CAST(task))^.lock;
end;

end.
