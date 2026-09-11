program project1;

uses
  apr,
  apr_version,
  apr_errno,
  apr_time,
  apr_thread_mutex,
  apr_allocator,
  apr_pools,
  apr_user,
  apr_tables,
  apr_want,
  apr_file_info,
  apr_file_io,
  apr_network_io,
  apr_poll,
  apr_atomic,
  apr_cstr,
  apr_dso,
  apr_encode,
  apr_env,
  apr_escape,
  apr_fnmatch,
  apr_general,
  apr_getopt,
  apr_proc_mutex,
  apr_global_mutex,
  apr_hash,
  apr_lib,
  apr_mmap,
  apr_perms_set,
  apr_thread_cond,
  apr_thread_proc,
  apr_thread_rwlock,
  apr_shm,
  apr_portable,
  apr_random,
  apr_signal,
  apr_skiplist,
  apr_strings,
  apr_support,

  fp_apr;

  procedure main;
  var
    main_pool, work_pool: Papr_pool_t;
    temp: PChar;
    i: Integer;
  begin
    apr_initialize;

//    apr_pool_create(@main_pool, nil);
  //  apr_pool_create(@work_pool, main_pool);

    apr_pool_create_ex(@main_pool, nil,nil,nil);
    apr_pool_create_ex(@work_pool, main_pool,nil,nil);

    for  i := 1 to 3 do begin
        temp := apr_psprintf(work_pool, 'Temporäre Daten für Durchgang %d', i);
        WriteLn('Loop ',i:3,': ', temp);

        apr_pool_clear(work_pool);
        WriteLn('   (Arbeits-Pool wurde geleert)');
    end;

    apr_pool_destroy(main_pool);
    apr_terminate;
  end;


begin
  //apr_os_thread_get(nil,nil);
  //apr_os_dso_handle_put(nil,nil,nil);
  //apr_mmap_dup(nil,nil,nil);
  //apr_thread_cond_create(nil,nil);
  //apr_global_mutex_create(nil,nil,0,nil);
  //apr_generate_random_bytes(nil,0);
  //apr_thread_mutex_create(nil,0,nil);
  //apr_dso_load(nil,nil,nil);

  main;
end.
