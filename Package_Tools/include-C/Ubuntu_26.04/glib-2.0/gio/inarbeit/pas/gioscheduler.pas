unit gioscheduler;

interface

uses
  fp_glib2, giotypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


procedure g_io_scheduler_push_job(job_func: TGIOSchedulerJobFunc; user_data: Tgpointer; notify: TGDestroyNotify; io_priority: Tgint; cancellable: PGCancellable); cdecl; external libgio2; deprecated;
procedure g_io_scheduler_cancel_all_jobs; cdecl; external libgio2; deprecated;
function g_io_scheduler_job_send_to_mainloop(job: PGIOSchedulerJob; func: TGSourceFunc; user_data: Tgpointer; notify: TGDestroyNotify): Tgboolean; cdecl; external libgio2; deprecated;
procedure g_io_scheduler_job_send_to_mainloop_async(job: PGIOSchedulerJob; func: TGSourceFunc; user_data: Tgpointer; notify: TGDestroyNotify); cdecl; external libgio2; deprecated;

// === Konventiert am: 26-6-26 19:34:54 ===


implementation



end.
