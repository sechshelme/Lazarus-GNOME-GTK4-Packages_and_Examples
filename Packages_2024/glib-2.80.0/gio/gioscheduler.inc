
{$IFDEF read_interface}

procedure g_io_scheduler_push_job(job_func: TGIOSchedulerJobFunc; user_data: Tgpointer; notify: TGDestroyNotify; io_priority: Tgint; cancellable: PGCancellable); cdecl; external libgio2; deprecated 'GIO_DEPRECATED_IN_2_36_FOR ("GThreadPool or g_task_run_in_thread")';
procedure g_io_scheduler_cancel_all_jobs; cdecl; external libgio2; deprecated 'GIO_DEPRECATED_IN_2_36';
function g_io_scheduler_job_send_to_mainloop(job: PGIOSchedulerJob; func: TGSourceFunc; user_data: Tgpointer; notify: TGDestroyNotify): Tgboolean; cdecl; external libgio2; deprecated 'GIO_DEPRECATED_IN_2_36_FOR (g_main_context_invoke)';
procedure g_io_scheduler_job_send_to_mainloop_async(job: PGIOSchedulerJob; func: TGSourceFunc; user_data: Tgpointer; notify: TGDestroyNotify); cdecl; external libgio2; deprecated 'GIO_DEPRECATED_IN_2_36_FOR (g_main_context_invoke)';

// === Konventiert am: 21-8-24 16:23:03 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
