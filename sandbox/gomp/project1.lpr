program project1;

uses
  omp,
  libgomp_g;

var
  lock_stdout: Pointer = nil;

  procedure worker(para1: pointer); cdecl;
  begin
    GOMP_critical_name_start(@lock_stdout);
    writeln('thread ', omp_get_thread_num: 5, ' / ', omp_get_num_threads: 5);
    GOMP_critical_name_end(@lock_stdout);
  end;

  procedure main;
  var
    num_proc: longint;
  begin
    num_proc := omp_get_num_procs;
    omp_set_num_threads(num_proc);
    WriteLn('Kerne: ', num_proc);
    WriteLn('Threads gesamt: ', omp_get_max_threads);

    GOMP_parallel_start(@worker, nil, num_proc);
    GOMP_critical_name_start(@lock_stdout);
    WriteLn('Hauptprozess');
    GOMP_critical_name_end(@lock_stdout);
    GOMP_parallel_end;
  end;

begin
  main;
end.
