program project1;

uses
  omp,
  libgomp_g;

  function printf(__format: pchar): longint; cdecl; varargs; external libc;


  procedure worker(para1: pointer); cdecl;
  begin
    printf('Thread %d von %d'#10, omp_get_thread_num, omp_get_num_threads);
  end;

  procedure main;
  begin
    omp_set_num_threads(4);
    printf('Threads gesamt: %d'#10, omp_get_max_threads);

    GOMP_parallel_start(@worker, nil, 4);
    worker(nil);
    GOMP_parallel_end;
  end;

begin
  main;
end.
