unit fp_sqlite3ext;

interface

uses
  ctypes;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


type
  Tsqlite3_api_routines = record
      aggregate_context : function (para1:Psqlite3_context; nBytes:longint):pointer;cdecl;
      aggregate_count : function (para1:Psqlite3_context):longint;cdecl;
      bind_blob : function (para1:Psqlite3_stmt; para2:longint; para3:pointer; n:longint; para5:procedure (para1:pointer)):longint;cdecl;
      bind_double : function (para1:Psqlite3_stmt; para2:longint; para3:Tdouble):longint;cdecl;
      bind_int : function (para1:Psqlite3_stmt; para2:longint; para3:longint):longint;cdecl;
      bind_int64 : function (para1:Psqlite3_stmt; para2:longint; para3:Tsqlite_int64):longint;cdecl;
      bind_null : function (para1:Psqlite3_stmt; para2:longint):longint;cdecl;
      bind_parameter_count : function (para1:Psqlite3_stmt):longint;cdecl;
      bind_parameter_index : function (para1:Psqlite3_stmt; zName:Pchar):longint;cdecl;
      bind_parameter_name : function (para1:Psqlite3_stmt; para2:longint):Pchar;cdecl;
      bind_text : function (para1:Psqlite3_stmt; para2:longint; para3:Pchar; n:longint; para5:procedure (para1:pointer)):longint;cdecl;
      bind_text16 : function (para1:Psqlite3_stmt; para2:longint; para3:pointer; para4:longint; para5:procedure (para1:pointer)):longint;cdecl;
      bind_value : function (para1:Psqlite3_stmt; para2:longint; para3:Psqlite3_value):longint;cdecl;
      busy_handler : function (para1:Psqlite3; para2:function (para1:pointer; para2:longint):longint; para3:pointer):longint;cdecl;
      busy_timeout : function (para1:Psqlite3; ms:longint):longint;cdecl;
      changes : function (para1:Psqlite3):longint;cdecl;
      close : function (para1:Psqlite3):longint;cdecl;
      collation_needed : function (para1:Psqlite3; para2:pointer; para3:procedure (para1:pointer; para2:Psqlite3; eTextRep:longint; para4:Pchar)):longint;cdecl;
      collation_needed16 : function (para1:Psqlite3; para2:pointer; para3:procedure (para1:pointer; para2:Psqlite3; eTextRep:longint; para4:pointer)):longint;cdecl;
      column_blob : function (para1:Psqlite3_stmt; iCol:longint):pointer;cdecl;
      column_bytes : function (para1:Psqlite3_stmt; iCol:longint):longint;cdecl;
      column_bytes16 : function (para1:Psqlite3_stmt; iCol:longint):longint;cdecl;
      column_count : function (pStmt:Psqlite3_stmt):longint;cdecl;
      column_database_name : function (para1:Psqlite3_stmt; para2:longint):Pchar;cdecl;
      column_database_name16 : function (para1:Psqlite3_stmt; para2:longint):pointer;cdecl;
      column_decltype : function (para1:Psqlite3_stmt; i:longint):Pchar;cdecl;
      column_decltype16 : function (para1:Psqlite3_stmt; para2:longint):pointer;cdecl;
      column_double : function (para1:Psqlite3_stmt; iCol:longint):Tdouble;cdecl;
      column_int : function (para1:Psqlite3_stmt; iCol:longint):longint;cdecl;
      column_int64 : function (para1:Psqlite3_stmt; iCol:longint):Tsqlite_int64;cdecl;
      column_name : function (para1:Psqlite3_stmt; para2:longint):Pchar;cdecl;
      column_name16 : function (para1:Psqlite3_stmt; para2:longint):pointer;cdecl;
      column_origin_name : function (para1:Psqlite3_stmt; para2:longint):Pchar;cdecl;
      column_origin_name16 : function (para1:Psqlite3_stmt; para2:longint):pointer;cdecl;
      column_table_name : function (para1:Psqlite3_stmt; para2:longint):Pchar;cdecl;
      column_table_name16 : function (para1:Psqlite3_stmt; para2:longint):pointer;cdecl;
      column_text : function (para1:Psqlite3_stmt; iCol:longint):Pbyte;cdecl;
      column_text16 : function (para1:Psqlite3_stmt; iCol:longint):pointer;cdecl;
      column_type : function (para1:Psqlite3_stmt; iCol:longint):longint;cdecl;
      column_value : function (para1:Psqlite3_stmt; iCol:longint):Psqlite3_value;cdecl;
      commit_hook : function (para1:Psqlite3; para2:function (para1:pointer):longint; para3:pointer):pointer;cdecl;
      complete : function (sql:Pchar):longint;cdecl;
      complete16 : function (sql:pointer):longint;cdecl;
      create_collation : function (para1:Psqlite3; para2:Pchar; para3:longint; para4:pointer; para5:function (para1:pointer; para2:longint; para3:pointer; para4:longint; para5:pointer):longint):longint;cdecl;
      create_collation16 : function (para1:Psqlite3; para2:pointer; para3:longint; para4:pointer; para5:function (para1:pointer; para2:longint; para3:pointer; para4:longint; para5:pointer):longint):longint;cdecl;
      create_function : function (para1:Psqlite3; para2:Pchar; para3:longint; para4:longint; para5:pointer; 
                   xFunc:procedure (para1:Psqlite3_context; para2:longint; para3:PPsqlite3_value); xStep:procedure (para1:Psqlite3_context; para2:longint; para3:PPsqlite3_value); xFinal:procedure (para1:Psqlite3_context)):longint;cdecl;
      create_function16 : function (para1:Psqlite3; para2:pointer; para3:longint; para4:longint; para5:pointer; 
                   xFunc:procedure (para1:Psqlite3_context; para2:longint; para3:PPsqlite3_value); xStep:procedure (para1:Psqlite3_context; para2:longint; para3:PPsqlite3_value); xFinal:procedure (para1:Psqlite3_context)):longint;cdecl;
      create_module : function (para1:Psqlite3; para2:Pchar; para3:Psqlite3_module; para4:pointer):longint;cdecl;
      data_count : function (pStmt:Psqlite3_stmt):longint;cdecl;
      db_handle : function (para1:Psqlite3_stmt):Psqlite3;cdecl;
      declare_vtab : function (para1:Psqlite3; para2:Pchar):longint;cdecl;
      enable_shared_cache : function (para1:longint):longint;cdecl;
      errcode : function (db:Psqlite3):longint;cdecl;
      errmsg : function (para1:Psqlite3):Pchar;cdecl;
      errmsg16 : function (para1:Psqlite3):pointer;cdecl;
      exec : function (para1:Psqlite3; para2:Pchar; para3:Tsqlite3_callback; para4:pointer; para5:PPchar):longint;cdecl;
      expired : function (para1:Psqlite3_stmt):longint;cdecl;
      finalize : function (pStmt:Psqlite3_stmt):longint;cdecl;
      free : procedure (para1:pointer);cdecl;
      free_table : procedure (result:PPchar);cdecl;
      get_autocommit : function (para1:Psqlite3):longint;cdecl;
      get_auxdata : function (para1:Psqlite3_context; para2:longint):pointer;cdecl;
      get_table : function (para1:Psqlite3; para2:Pchar; para3:PPPchar; para4:Plongint; para5:Plongint; 
                   para6:PPchar):longint;cdecl;
      global_recover : function :longint;cdecl;
      interruptx : procedure (para1:Psqlite3);cdecl;
      last_insert_rowid : function (para1:Psqlite3):Tsqlite_int64;cdecl;
      libversion : function :Pchar;cdecl;
      libversion_number : function :longint;cdecl;
      malloc : function (para1:longint):pointer;cdecl;
      mprintf : function (para1:Pchar; args:array of const):Pchar;cdecl;
      open : function (para1:Pchar; para2:PPsqlite3):longint;cdecl;
      open16 : function (para1:pointer; para2:PPsqlite3):longint;cdecl;
      prepare : function (para1:Psqlite3; para2:Pchar; para3:longint; para4:PPsqlite3_stmt; para5:PPchar):longint;cdecl;
      prepare16 : function (para1:Psqlite3; para2:pointer; para3:longint; para4:PPsqlite3_stmt; para5:Ppointer):longint;cdecl;
      profile : function (para1:Psqlite3; para2:procedure (para1:pointer; para2:Pchar; para3:Tsqlite_uint64); para3:pointer):pointer;cdecl;
      progress_handler : procedure (para1:Psqlite3; para2:longint; para3:function (para1:pointer):longint; para4:pointer);cdecl;
      realloc : function (para1:pointer; para2:longint):pointer;cdecl;
      reset : function (pStmt:Psqlite3_stmt):longint;cdecl;
      result_blob : procedure (para1:Psqlite3_context; para2:pointer; para3:longint; para4:procedure (para1:pointer));cdecl;
      result_double : procedure (para1:Psqlite3_context; para2:Tdouble);cdecl;
      result_error : procedure (para1:Psqlite3_context; para2:Pchar; para3:longint);cdecl;
      result_error16 : procedure (para1:Psqlite3_context; para2:pointer; para3:longint);cdecl;
      result_int : procedure (para1:Psqlite3_context; para2:longint);cdecl;
      result_int64 : procedure (para1:Psqlite3_context; para2:Tsqlite_int64);cdecl;
      result_null : procedure (para1:Psqlite3_context);cdecl;
      result_text : procedure (para1:Psqlite3_context; para2:Pchar; para3:longint; para4:procedure (para1:pointer));cdecl;
      result_text16 : procedure (para1:Psqlite3_context; para2:pointer; para3:longint; para4:procedure (para1:pointer));cdecl;
      result_text16be : procedure (para1:Psqlite3_context; para2:pointer; para3:longint; para4:procedure (para1:pointer));cdecl;
      result_text16le : procedure (para1:Psqlite3_context; para2:pointer; para3:longint; para4:procedure (para1:pointer));cdecl;
      result_value : procedure (para1:Psqlite3_context; para2:Psqlite3_value);cdecl;
      rollback_hook : function (para1:Psqlite3; para2:procedure (para1:pointer); para3:pointer):pointer;cdecl;
      set_authorizer : function (para1:Psqlite3; para2:function (para1:pointer; para2:longint; para3:Pchar; para4:Pchar; para5:Pchar; 
                              para6:Pchar):longint; para3:pointer):longint;cdecl;
      set_auxdata : procedure (para1:Psqlite3_context; para2:longint; para3:pointer; para4:procedure (para1:pointer));cdecl;
      xsnprintf : function (para1:longint; para2:Pchar; para3:Pchar; args:array of const):Pchar;cdecl;
      step : function (para1:Psqlite3_stmt):longint;cdecl;
      table_column_metadata : function (para1:Psqlite3; para2:Pchar; para3:Pchar; para4:Pchar; para5:PPchar; 
                   para6:PPchar; para7:Plongint; para8:Plongint; para9:Plongint):longint;cdecl;
      thread_cleanup : procedure ;cdecl;
      total_changes : function (para1:Psqlite3):longint;cdecl;
      trace : function (para1:Psqlite3; xTrace:procedure (para1:pointer; para2:Pchar); para3:pointer):pointer;cdecl;
      transfer_bindings : function (para1:Psqlite3_stmt; para2:Psqlite3_stmt):longint;cdecl;
      update_hook : function (para1:Psqlite3; para2:procedure (para1:pointer; para2:longint; para3:Pchar; para4:Pchar; para5:Tsqlite_int64); para3:pointer):pointer;cdecl;
      user_data : function (para1:Psqlite3_context):pointer;cdecl;
      value_blob : function (para1:Psqlite3_value):pointer;cdecl;
      value_bytes : function (para1:Psqlite3_value):longint;cdecl;
      value_bytes16 : function (para1:Psqlite3_value):longint;cdecl;
      value_double : function (para1:Psqlite3_value):Tdouble;cdecl;
      value_int : function (para1:Psqlite3_value):longint;cdecl;
      value_int64 : function (para1:Psqlite3_value):Tsqlite_int64;cdecl;
      value_numeric_type : function (para1:Psqlite3_value):longint;cdecl;
      value_text : function (para1:Psqlite3_value):Pbyte;cdecl;
      value_text16 : function (para1:Psqlite3_value):pointer;cdecl;
      value_text16be : function (para1:Psqlite3_value):pointer;cdecl;
      value_text16le : function (para1:Psqlite3_value):pointer;cdecl;
      value_type : function (para1:Psqlite3_value):longint;cdecl;
      vmprintf : function (para1:Pchar; para2:Tva_list):Pchar;cdecl;
      overload_function : function (para1:Psqlite3; zFuncName:Pchar; nArg:longint):longint;cdecl;
      prepare_v2 : function (para1:Psqlite3; para2:Pchar; para3:longint; para4:PPsqlite3_stmt; para5:PPchar):longint;cdecl;
      prepare16_v2 : function (para1:Psqlite3; para2:pointer; para3:longint; para4:PPsqlite3_stmt; para5:Ppointer):longint;cdecl;
      clear_bindings : function (para1:Psqlite3_stmt):longint;cdecl;
      create_module_v2 : function (para1:Psqlite3; para2:Pchar; para3:Psqlite3_module; para4:pointer; xDestroy:procedure (para1:pointer)):longint;cdecl;
      bind_zeroblob : function (para1:Psqlite3_stmt; para2:longint; para3:longint):longint;cdecl;
      blob_bytes : function (para1:Psqlite3_blob):longint;cdecl;
      blob_close : function (para1:Psqlite3_blob):longint;cdecl;
      blob_open : function (para1:Psqlite3; para2:Pchar; para3:Pchar; para4:Pchar; para5:Tsqlite3_int64; 
                   para6:longint; para7:PPsqlite3_blob):longint;cdecl;
      blob_read : function (para1:Psqlite3_blob; para2:pointer; para3:longint; para4:longint):longint;cdecl;
      blob_write : function (para1:Psqlite3_blob; para2:pointer; para3:longint; para4:longint):longint;cdecl;
      create_collation_v2 : function (para1:Psqlite3; para2:Pchar; para3:longint; para4:pointer; para5:function (para1:pointer; para2:longint; para3:pointer; para4:longint; para5:pointer):longint; 
                   para6:procedure (para1:pointer)):longint;cdecl;
      file_control : function (para1:Psqlite3; para2:Pchar; para3:longint; para4:pointer):longint;cdecl;
      memory_highwater : function (para1:longint):Tsqlite3_int64;cdecl;
      memory_used : function :Tsqlite3_int64;cdecl;
      mutex_alloc : function (para1:longint):Psqlite3_mutex;cdecl;
      mutex_enter : procedure (para1:Psqlite3_mutex);cdecl;
      mutex_free : procedure (para1:Psqlite3_mutex);cdecl;
      mutex_leave : procedure (para1:Psqlite3_mutex);cdecl;
      mutex_try : function (para1:Psqlite3_mutex):longint;cdecl;
      open_v2 : function (para1:Pchar; para2:PPsqlite3; para3:longint; para4:Pchar):longint;cdecl;
      release_memory : function (para1:longint):longint;cdecl;
      result_error_nomem : procedure (para1:Psqlite3_context);cdecl;
      result_error_toobig : procedure (para1:Psqlite3_context);cdecl;
      sleep : function (para1:longint):longint;cdecl;
      soft_heap_limit : procedure (para1:longint);cdecl;
      vfs_find : function (para1:Pchar):Psqlite3_vfs;cdecl;
      vfs_register : function (para1:Psqlite3_vfs; para2:longint):longint;cdecl;
      vfs_unregister : function (para1:Psqlite3_vfs):longint;cdecl;
      xthreadsafe : function :longint;cdecl;
      result_zeroblob : procedure (para1:Psqlite3_context; para2:longint);cdecl;
      result_error_code : procedure (para1:Psqlite3_context; para2:longint);cdecl;
      test_control : function (para1:longint; args:array of const):longint;cdecl;
      randomness : procedure (para1:longint; para2:pointer);cdecl;
      context_db_handle : function (para1:Psqlite3_context):Psqlite3;cdecl;
      extended_result_codes : function (para1:Psqlite3; para2:longint):longint;cdecl;
      limit : function (para1:Psqlite3; para2:longint; para3:longint):longint;cdecl;
      next_stmt : function (para1:Psqlite3; para2:Psqlite3_stmt):Psqlite3_stmt;cdecl;
      sql : function (para1:Psqlite3_stmt):Pchar;cdecl;
      status : function (para1:longint; para2:Plongint; para3:Plongint; para4:longint):longint;cdecl;
      backup_finish : function (para1:Psqlite3_backup):longint;cdecl;
      backup_init : function (para1:Psqlite3; para2:Pchar; para3:Psqlite3; para4:Pchar):Psqlite3_backup;cdecl;
      backup_pagecount : function (para1:Psqlite3_backup):longint;cdecl;
      backup_remaining : function (para1:Psqlite3_backup):longint;cdecl;
      backup_step : function (para1:Psqlite3_backup; para2:longint):longint;cdecl;
      compileoption_get : function (para1:longint):Pchar;cdecl;
      compileoption_used : function (para1:Pchar):longint;cdecl;
      create_function_v2 : function (para1:Psqlite3; para2:Pchar; para3:longint; para4:longint; para5:pointer; 
                   xFunc:procedure (para1:Psqlite3_context; para2:longint; para3:PPsqlite3_value); xStep:procedure (para1:Psqlite3_context; para2:longint; para3:PPsqlite3_value); xFinal:procedure (para1:Psqlite3_context); xDestroy:procedure (para1:pointer)):longint;cdecl;
      db_config : function (para1:Psqlite3; para2:longint; args:array of const):longint;cdecl;
      db_mutex : function (para1:Psqlite3):Psqlite3_mutex;cdecl;
      db_status : function (para1:Psqlite3; para2:longint; para3:Plongint; para4:Plongint; para5:longint):longint;cdecl;
      extended_errcode : function (para1:Psqlite3):longint;cdecl;
      log : procedure (para1:longint; para2:Pchar; args:array of const);cdecl;
      soft_heap_limit64 : function (para1:Tsqlite3_int64):Tsqlite3_int64;cdecl;
      sourceid : function :Pchar;cdecl;
      stmt_status : function (para1:Psqlite3_stmt; para2:longint; para3:longint):longint;cdecl;
      strnicmp : function (para1:Pchar; para2:Pchar; para3:longint):longint;cdecl;
      unlock_notify : function (para1:Psqlite3; para2:procedure (para1:Ppointer; para2:longint); para3:pointer):longint;cdecl;
      wal_autocheckpoint : function (para1:Psqlite3; para2:longint):longint;cdecl;
      wal_checkpoint : function (para1:Psqlite3; para2:Pchar):longint;cdecl;
      wal_hook : function (para1:Psqlite3; para2:function (para1:pointer; para2:Psqlite3; para3:Pchar; para4:longint):longint; para3:pointer):pointer;cdecl;
      blob_reopen : function (para1:Psqlite3_blob; para2:Tsqlite3_int64):longint;cdecl;
      vtab_config : function (para1:Psqlite3; op:longint; args:array of const):longint;cdecl;
      vtab_on_conflict : function (para1:Psqlite3):longint;cdecl;
      close_v2 : function (para1:Psqlite3):longint;cdecl;
      db_filename : function (para1:Psqlite3; para2:Pchar):Pchar;cdecl;
      db_readonly : function (para1:Psqlite3; para2:Pchar):longint;cdecl;
      db_release_memory : function (para1:Psqlite3):longint;cdecl;
      errstr : function (para1:longint):Pchar;cdecl;
      stmt_busy : function (para1:Psqlite3_stmt):longint;cdecl;
      stmt_readonly : function (para1:Psqlite3_stmt):longint;cdecl;
      stricmp : function (para1:Pchar; para2:Pchar):longint;cdecl;
      uri_boolean : function (para1:Pchar; para2:Pchar; para3:longint):longint;cdecl;
      uri_int64 : function (para1:Pchar; para2:Pchar; para3:Tsqlite3_int64):Tsqlite3_int64;cdecl;
      uri_parameter : function (para1:Pchar; para2:Pchar):Pchar;cdecl;
      xvsnprintf : function (para1:longint; para2:Pchar; para3:Pchar; para4:Tva_list):Pchar;cdecl;
      wal_checkpoint_v2 : function (para1:Psqlite3; para2:Pchar; para3:longint; para4:Plongint; para5:Plongint):longint;cdecl;
      auto_extension : function (para1:procedure ):longint;cdecl;
      bind_blob64 : function (para1:Psqlite3_stmt; para2:longint; para3:pointer; para4:Tsqlite3_uint64; para5:procedure (para1:pointer)):longint;cdecl;
      bind_text64 : function (para1:Psqlite3_stmt; para2:longint; para3:Pchar; para4:Tsqlite3_uint64; para5:procedure (para1:pointer); 
                   para6:byte):longint;cdecl;
      cancel_auto_extension : function (para1:procedure ):longint;cdecl;
      load_extension : function (para1:Psqlite3; para2:Pchar; para3:Pchar; para4:PPchar):longint;cdecl;
      malloc64 : function (para1:Tsqlite3_uint64):pointer;cdecl;
      msize : function (para1:pointer):Tsqlite3_uint64;cdecl;
      realloc64 : function (para1:pointer; para2:Tsqlite3_uint64):pointer;cdecl;
      reset_auto_extension : procedure ;cdecl;
      result_blob64 : procedure (para1:Psqlite3_context; para2:pointer; para3:Tsqlite3_uint64; para4:procedure (para1:pointer));cdecl;
      result_text64 : procedure (para1:Psqlite3_context; para2:Pchar; para3:Tsqlite3_uint64; para4:procedure (para1:pointer); para5:byte);cdecl;
      strglob : function (para1:Pchar; para2:Pchar):longint;cdecl;
      value_dup : function (para1:Psqlite3_value):Psqlite3_value;cdecl;
      value_free : procedure (para1:Psqlite3_value);cdecl;
      result_zeroblob64 : function (para1:Psqlite3_context; para2:Tsqlite3_uint64):longint;cdecl;
      bind_zeroblob64 : function (para1:Psqlite3_stmt; para2:longint; para3:Tsqlite3_uint64):longint;cdecl;
      value_subtype : function (para1:Psqlite3_value):dword;cdecl;
      result_subtype : procedure (para1:Psqlite3_context; para2:dword);cdecl;
      status64 : function (para1:longint; para2:Psqlite3_int64; para3:Psqlite3_int64; para4:longint):longint;cdecl;
      strlike : function (para1:Pchar; para2:Pchar; para3:dword):longint;cdecl;
      db_cacheflush : function (para1:Psqlite3):longint;cdecl;
      system_errno : function (para1:Psqlite3):longint;cdecl;
      trace_v2 : function (para1:Psqlite3; para2:dword; para3:function (para1:dword; para2:pointer; para3:pointer; para4:pointer):longint; para4:pointer):longint;cdecl;
      expanded_sql : function (para1:Psqlite3_stmt):Pchar;cdecl;
      set_last_insert_rowid : procedure (para1:Psqlite3; para2:Tsqlite3_int64);cdecl;
      prepare_v3 : function (para1:Psqlite3; para2:Pchar; para3:longint; para4:dword; para5:PPsqlite3_stmt; 
                   para6:PPchar):longint;cdecl;
      prepare16_v3 : function (para1:Psqlite3; para2:pointer; para3:longint; para4:dword; para5:PPsqlite3_stmt; 
                   para6:Ppointer):longint;cdecl;
      bind_pointer : function (para1:Psqlite3_stmt; para2:longint; para3:pointer; para4:Pchar; para5:procedure (para1:pointer)):longint;cdecl;
      result_pointer : procedure (para1:Psqlite3_context; para2:pointer; para3:Pchar; para4:procedure (para1:pointer));cdecl;
      value_pointer : function (para1:Psqlite3_value; para2:Pchar):pointer;cdecl;
      vtab_nochange : function (para1:Psqlite3_context):longint;cdecl;
      value_nochange : function (para1:Psqlite3_value):longint;cdecl;
      vtab_collation : function (para1:Psqlite3_index_info; para2:longint):Pchar;cdecl;
      keyword_count : function :longint;cdecl;
      keyword_name : function (para1:longint; para2:PPchar; para3:Plongint):longint;cdecl;
      keyword_check : function (para1:Pchar; para2:longint):longint;cdecl;
      str_new : function (para1:Psqlite3):Psqlite3_str;cdecl;
      str_finish : function (para1:Psqlite3_str):Pchar;cdecl;
      str_appendf : procedure (para1:Psqlite3_str; zFormat:Pchar; args:array of const);cdecl;
      str_vappendf : procedure (para1:Psqlite3_str; zFormat:Pchar; para3:Tva_list);cdecl;
      str_append : procedure (para1:Psqlite3_str; zIn:Pchar; N:longint);cdecl;
      str_appendall : procedure (para1:Psqlite3_str; zIn:Pchar);cdecl;
      str_appendchar : procedure (para1:Psqlite3_str; N:longint; C:char);cdecl;
      str_reset : procedure (para1:Psqlite3_str);cdecl;
      str_errcode : function (para1:Psqlite3_str):longint;cdecl;
      str_length : function (para1:Psqlite3_str):longint;cdecl;
      str_value : function (para1:Psqlite3_str):Pchar;cdecl;
      create_window_function : function (para1:Psqlite3; para2:Pchar; para3:longint; para4:longint; para5:pointer; 
                   xStep:procedure (para1:Psqlite3_context; para2:longint; para3:PPsqlite3_value); xFinal:procedure (para1:Psqlite3_context); xValue:procedure (para1:Psqlite3_context); xInv:procedure (para1:Psqlite3_context; para2:longint; para3:PPsqlite3_value); xDestroy:procedure (para1:pointer)):longint;cdecl;
      normalized_sql : function (para1:Psqlite3_stmt):Pchar;cdecl;
      stmt_isexplain : function (para1:Psqlite3_stmt):longint;cdecl;
      value_frombind : function (para1:Psqlite3_value):longint;cdecl;
      drop_modules : function (para1:Psqlite3; para2:PPchar):longint;cdecl;
      hard_heap_limit64 : function (para1:Tsqlite3_int64):Tsqlite3_int64;cdecl;
      uri_key : function (para1:Pchar; para2:longint):Pchar;cdecl;
      filename_database : function (para1:Pchar):Pchar;cdecl;
      filename_journal : function (para1:Pchar):Pchar;cdecl;
      filename_wal : function (para1:Pchar):Pchar;cdecl;
      create_filename : function (para1:Pchar; para2:Pchar; para3:Pchar; para4:longint; para5:PPchar):Pchar;cdecl;
      free_filename : procedure (para1:Pchar);cdecl;
      database_file_object : function (para1:Pchar):Psqlite3_file;cdecl;
      txn_state : function (para1:Psqlite3; para2:Pchar):longint;cdecl;
      changes64 : function (para1:Psqlite3):Tsqlite3_int64;cdecl;
      total_changes64 : function (para1:Psqlite3):Tsqlite3_int64;cdecl;
      autovacuum_pages : function (para1:Psqlite3; para2:function (para1:pointer; para2:Pchar; para3:dword; para4:dword; para5:dword):dword; para3:pointer; para4:procedure (para1:pointer)):longint;cdecl;
      error_offset : function (para1:Psqlite3):longint;cdecl;
      vtab_rhs_value : function (para1:Psqlite3_index_info; para2:longint; para3:PPsqlite3_value):longint;cdecl;
      vtab_distinct : function (para1:Psqlite3_index_info):longint;cdecl;
      vtab_in : function (para1:Psqlite3_index_info; para2:longint; para3:longint):longint;cdecl;
      vtab_in_first : function (para1:Psqlite3_value; para2:PPsqlite3_value):longint;cdecl;
      vtab_in_next : function (para1:Psqlite3_value; para2:PPsqlite3_value):longint;cdecl;
      deserialize : function (para1:Psqlite3; para2:Pchar; para3:Pbyte; para4:Tsqlite3_int64; para5:Tsqlite3_int64; 
                   para6:dword):longint;cdecl;
      serialize : function (para1:Psqlite3; para2:Pchar; para3:Psqlite3_int64; para4:dword):Pbyte;cdecl;
      db_name : function (para1:Psqlite3; para2:longint):Pchar;cdecl;
      value_encoding : function (para1:Psqlite3_value):longint;cdecl;
      is_interrupted : function (para1:Psqlite3):longint;cdecl;
      stmt_explain : function (para1:Psqlite3_stmt; para2:longint):longint;cdecl;
      get_clientdata : function (para1:Psqlite3; para2:Pchar):pointer;cdecl;
      set_clientdata : function (para1:Psqlite3; para2:Pchar; para3:pointer; para4:procedure (para1:pointer)):longint;cdecl;
    end;
  Psqlite3_api_routines = ^Tsqlite3_api_routines;

  Tsqlite3_loadext_entry = function (db:Psqlite3; pzErrMsg:PPchar; pThunk:Psqlite3_api_routines):longint;cdecl;

const
  sqlite3_aggregate_context = sqlite3_api^.aggregate_context;  

const
  sqlite3_aggregate_count = sqlite3_api^.aggregate_count;  
{$endif}

const
  sqlite3_bind_blob = sqlite3_api^.bind_blob;  
  sqlite3_bind_double = sqlite3_api^.bind_double;  
  sqlite3_bind_int = sqlite3_api^.bind_int;  
  sqlite3_bind_int64 = sqlite3_api^.bind_int64;  
  sqlite3_bind_null = sqlite3_api^.bind_null;  
  sqlite3_bind_parameter_count = sqlite3_api^.bind_parameter_count;  
  sqlite3_bind_parameter_index = sqlite3_api^.bind_parameter_index;  
  sqlite3_bind_parameter_name = sqlite3_api^.bind_parameter_name;  
  sqlite3_bind_text = sqlite3_api^.bind_text;  
  sqlite3_bind_text16 = sqlite3_api^.bind_text16;  
  sqlite3_bind_value = sqlite3_api^.bind_value;  
  sqlite3_busy_handler = sqlite3_api^.busy_handler;  
  sqlite3_busy_timeout = sqlite3_api^.busy_timeout;  
  sqlite3_changes = sqlite3_api^.changes;  
  sqlite3_close = sqlite3_api^.close;  
  sqlite3_collation_needed = sqlite3_api^.collation_needed;  
  sqlite3_collation_needed16 = sqlite3_api^.collation_needed16;  
  sqlite3_column_blob = sqlite3_api^.column_blob;  
  sqlite3_column_bytes = sqlite3_api^.column_bytes;  
  sqlite3_column_bytes16 = sqlite3_api^.column_bytes16;  
  sqlite3_column_count = sqlite3_api^.column_count;  
  sqlite3_column_database_name = sqlite3_api^.column_database_name;  
  sqlite3_column_database_name16 = sqlite3_api^.column_database_name16;  
  sqlite3_column_decltype = sqlite3_api^.column_decltype;  
  sqlite3_column_decltype16 = sqlite3_api^.column_decltype16;  
  sqlite3_column_double = sqlite3_api^.column_double;  
  sqlite3_column_int = sqlite3_api^.column_int;  
  sqlite3_column_int64 = sqlite3_api^.column_int64;  
  sqlite3_column_name = sqlite3_api^.column_name;  
  sqlite3_column_name16 = sqlite3_api^.column_name16;  
  sqlite3_column_origin_name = sqlite3_api^.column_origin_name;  
  sqlite3_column_origin_name16 = sqlite3_api^.column_origin_name16;  
  sqlite3_column_table_name = sqlite3_api^.column_table_name;  
  sqlite3_column_table_name16 = sqlite3_api^.column_table_name16;  
  sqlite3_column_text = sqlite3_api^.column_text;  
  sqlite3_column_text16 = sqlite3_api^.column_text16;  
  sqlite3_column_type = sqlite3_api^.column_type;  
  sqlite3_column_value = sqlite3_api^.column_value;  
  sqlite3_commit_hook = sqlite3_api^.commit_hook;  
  sqlite3_complete = sqlite3_api^.complete;  
  sqlite3_complete16 = sqlite3_api^.complete16;  
  sqlite3_create_collation = sqlite3_api^.create_collation;  
  sqlite3_create_collation16 = sqlite3_api^.create_collation16;  
  sqlite3_create_function = sqlite3_api^.create_function;  
  sqlite3_create_function16 = sqlite3_api^.create_function16;  
  sqlite3_create_module = sqlite3_api^.create_module;  
  sqlite3_create_module_v2 = sqlite3_api^.create_module_v2;  
  sqlite3_data_count = sqlite3_api^.data_count;  
  sqlite3_db_handle = sqlite3_api^.db_handle;  
  sqlite3_declare_vtab = sqlite3_api^.declare_vtab;  
  sqlite3_enable_shared_cache = sqlite3_api^.enable_shared_cache;  
  sqlite3_errcode = sqlite3_api^.errcode;  
  sqlite3_errmsg = sqlite3_api^.errmsg;  
  sqlite3_errmsg16 = sqlite3_api^.errmsg16;  
  sqlite3_exec = sqlite3_api^.exec;  
{$ifndef SQLITE_OMIT_DEPRECATED}

const
  sqlite3_expired = sqlite3_api^.expired;  
{$endif}

const
  sqlite3_finalize = sqlite3_api^.finalize;  
  sqlite3_free = sqlite3_api^.free;  
  sqlite3_free_table = sqlite3_api^.free_table;  
  sqlite3_get_autocommit = sqlite3_api^.get_autocommit;  
  sqlite3_get_auxdata = sqlite3_api^.get_auxdata;  
  sqlite3_get_table = sqlite3_api^.get_table;  
{$ifndef SQLITE_OMIT_DEPRECATED}

const
  sqlite3_global_recover = sqlite3_api^.global_recover;  
{$endif}

const
  sqlite3_interrupt = sqlite3_api^.interruptx;  
  sqlite3_last_insert_rowid = sqlite3_api^.last_insert_rowid;  
  sqlite3_libversion = sqlite3_api^.libversion;  
  sqlite3_libversion_number = sqlite3_api^.libversion_number;  
  sqlite3_malloc = sqlite3_api^.malloc;  
  sqlite3_mprintf = sqlite3_api^.mprintf;  
  sqlite3_open = sqlite3_api^.open;  
  sqlite3_open16 = sqlite3_api^.open16;  
  sqlite3_prepare = sqlite3_api^.prepare;  
  sqlite3_prepare16 = sqlite3_api^.prepare16;  
  sqlite3_prepare_v2 = sqlite3_api^.prepare_v2;  
  sqlite3_prepare16_v2 = sqlite3_api^.prepare16_v2;  
  sqlite3_profile = sqlite3_api^.profile;  
  sqlite3_progress_handler = sqlite3_api^.progress_handler;  
  sqlite3_realloc = sqlite3_api^.realloc;  
  sqlite3_reset = sqlite3_api^.reset;  
  sqlite3_result_blob = sqlite3_api^.result_blob;  
  sqlite3_result_double = sqlite3_api^.result_double;  
  sqlite3_result_error = sqlite3_api^.result_error;  
  sqlite3_result_error16 = sqlite3_api^.result_error16;  
  sqlite3_result_int = sqlite3_api^.result_int;  
  sqlite3_result_int64 = sqlite3_api^.result_int64;  
  sqlite3_result_null = sqlite3_api^.result_null;  
  sqlite3_result_text = sqlite3_api^.result_text;  
  sqlite3_result_text16 = sqlite3_api^.result_text16;  
  sqlite3_result_text16be = sqlite3_api^.result_text16be;  
  sqlite3_result_text16le = sqlite3_api^.result_text16le;  
  sqlite3_result_value = sqlite3_api^.result_value;  
  sqlite3_rollback_hook = sqlite3_api^.rollback_hook;  
  sqlite3_set_authorizer = sqlite3_api^.set_authorizer;  
  sqlite3_set_auxdata = sqlite3_api^.set_auxdata;  
  sqlite3_snprintf = sqlite3_api^.xsnprintf;  
  sqlite3_step = sqlite3_api^.step;  
  sqlite3_table_column_metadata = sqlite3_api^.table_column_metadata;  
  sqlite3_thread_cleanup = sqlite3_api^.thread_cleanup;  
  sqlite3_total_changes = sqlite3_api^.total_changes;  
  sqlite3_trace = sqlite3_api^.trace;  
{$ifndef SQLITE_OMIT_DEPRECATED}

const
  sqlite3_transfer_bindings = sqlite3_api^.transfer_bindings;  
{$endif}

const
  sqlite3_update_hook = sqlite3_api^.update_hook;  
  sqlite3_user_data = sqlite3_api^.user_data;  
  sqlite3_value_blob = sqlite3_api^.value_blob;  
  sqlite3_value_bytes = sqlite3_api^.value_bytes;  
  sqlite3_value_bytes16 = sqlite3_api^.value_bytes16;  
  sqlite3_value_double = sqlite3_api^.value_double;  
  sqlite3_value_int = sqlite3_api^.value_int;  
  sqlite3_value_int64 = sqlite3_api^.value_int64;  
  sqlite3_value_numeric_type = sqlite3_api^.value_numeric_type;  
  sqlite3_value_text = sqlite3_api^.value_text;  
  sqlite3_value_text16 = sqlite3_api^.value_text16;  
  sqlite3_value_text16be = sqlite3_api^.value_text16be;  
  sqlite3_value_text16le = sqlite3_api^.value_text16le;  
  sqlite3_value_type = sqlite3_api^.value_type;  
  sqlite3_vmprintf = sqlite3_api^.vmprintf;  
  sqlite3_vsnprintf = sqlite3_api^.xvsnprintf;  
  sqlite3_overload_function = sqlite3_api^.overload_function;  
  sqlite3_prepare_v2 = sqlite3_api^.prepare_v2;  
  sqlite3_prepare16_v2 = sqlite3_api^.prepare16_v2;  
  sqlite3_clear_bindings = sqlite3_api^.clear_bindings;  
  sqlite3_bind_zeroblob = sqlite3_api^.bind_zeroblob;  
  sqlite3_blob_bytes = sqlite3_api^.blob_bytes;  
  sqlite3_blob_close = sqlite3_api^.blob_close;  
  sqlite3_blob_open = sqlite3_api^.blob_open;  
  sqlite3_blob_read = sqlite3_api^.blob_read;  
  sqlite3_blob_write = sqlite3_api^.blob_write;  
  sqlite3_create_collation_v2 = sqlite3_api^.create_collation_v2;  
  sqlite3_file_control = sqlite3_api^.file_control;  
  sqlite3_memory_highwater = sqlite3_api^.memory_highwater;  
  sqlite3_memory_used = sqlite3_api^.memory_used;  
  sqlite3_mutex_alloc = sqlite3_api^.mutex_alloc;  
  sqlite3_mutex_enter = sqlite3_api^.mutex_enter;  
  sqlite3_mutex_free = sqlite3_api^.mutex_free;  
  sqlite3_mutex_leave = sqlite3_api^.mutex_leave;  
  sqlite3_mutex_try = sqlite3_api^.mutex_try;  
  sqlite3_open_v2 = sqlite3_api^.open_v2;  
  sqlite3_release_memory = sqlite3_api^.release_memory;  
  sqlite3_result_error_nomem = sqlite3_api^.result_error_nomem;  
  sqlite3_result_error_toobig = sqlite3_api^.result_error_toobig;  
  sqlite3_sleep = sqlite3_api^.sleep;  
  sqlite3_soft_heap_limit = sqlite3_api^.soft_heap_limit;  
  sqlite3_vfs_find = sqlite3_api^.vfs_find;  
  sqlite3_vfs_register = sqlite3_api^.vfs_register;  
  sqlite3_vfs_unregister = sqlite3_api^.vfs_unregister;  
  sqlite3_threadsafe = sqlite3_api^.xthreadsafe;  
  sqlite3_result_zeroblob = sqlite3_api^.result_zeroblob;  
  sqlite3_result_error_code = sqlite3_api^.result_error_code;  
  sqlite3_test_control = sqlite3_api^.test_control;  
  sqlite3_randomness = sqlite3_api^.randomness;  
  sqlite3_context_db_handle = sqlite3_api^.context_db_handle;  
  sqlite3_extended_result_codes = sqlite3_api^.extended_result_codes;  
  sqlite3_limit = sqlite3_api^.limit;  
  sqlite3_next_stmt = sqlite3_api^.next_stmt;  
  sqlite3_sql = sqlite3_api^.sql;  
  sqlite3_status = sqlite3_api^.status;  
  sqlite3_backup_finish = sqlite3_api^.backup_finish;  
  sqlite3_backup_init = sqlite3_api^.backup_init;  
  sqlite3_backup_pagecount = sqlite3_api^.backup_pagecount;  
  sqlite3_backup_remaining = sqlite3_api^.backup_remaining;  
  sqlite3_backup_step = sqlite3_api^.backup_step;  
  sqlite3_compileoption_get = sqlite3_api^.compileoption_get;  
  sqlite3_compileoption_used = sqlite3_api^.compileoption_used;  
  sqlite3_create_function_v2 = sqlite3_api^.create_function_v2;  
  sqlite3_db_config = sqlite3_api^.db_config;  
  sqlite3_db_mutex = sqlite3_api^.db_mutex;  
  sqlite3_db_status = sqlite3_api^.db_status;  
  sqlite3_extended_errcode = sqlite3_api^.extended_errcode;  
  sqlite3_log = sqlite3_api^.log;  
  sqlite3_soft_heap_limit64 = sqlite3_api^.soft_heap_limit64;  
  sqlite3_sourceid = sqlite3_api^.sourceid;  
  sqlite3_stmt_status = sqlite3_api^.stmt_status;  
  sqlite3_strnicmp = sqlite3_api^.strnicmp;  
  sqlite3_unlock_notify = sqlite3_api^.unlock_notify;  
  sqlite3_wal_autocheckpoint = sqlite3_api^.wal_autocheckpoint;  
  sqlite3_wal_checkpoint = sqlite3_api^.wal_checkpoint;  
  sqlite3_wal_hook = sqlite3_api^.wal_hook;  
  sqlite3_blob_reopen = sqlite3_api^.blob_reopen;  
  sqlite3_vtab_config = sqlite3_api^.vtab_config;  
  sqlite3_vtab_on_conflict = sqlite3_api^.vtab_on_conflict;  
{ Version 3.7.16 and later  }
  sqlite3_close_v2 = sqlite3_api^.close_v2;  
  sqlite3_db_filename = sqlite3_api^.db_filename;  
  sqlite3_db_readonly = sqlite3_api^.db_readonly;  
  sqlite3_db_release_memory = sqlite3_api^.db_release_memory;  
  sqlite3_errstr = sqlite3_api^.errstr;  
  sqlite3_stmt_busy = sqlite3_api^.stmt_busy;  
  sqlite3_stmt_readonly = sqlite3_api^.stmt_readonly;  
  sqlite3_stricmp = sqlite3_api^.stricmp;  
  sqlite3_uri_boolean = sqlite3_api^.uri_boolean;  
  sqlite3_uri_int64 = sqlite3_api^.uri_int64;  
  sqlite3_uri_parameter = sqlite3_api^.uri_parameter;  
  sqlite3_uri_vsnprintf = sqlite3_api^.xvsnprintf;  
  sqlite3_wal_checkpoint_v2 = sqlite3_api^.wal_checkpoint_v2;  
{ Version 3.8.7 and later  }
  sqlite3_auto_extension = sqlite3_api^.auto_extension;  
  sqlite3_bind_blob64 = sqlite3_api^.bind_blob64;  
  sqlite3_bind_text64 = sqlite3_api^.bind_text64;  
  sqlite3_cancel_auto_extension = sqlite3_api^.cancel_auto_extension;  
  sqlite3_load_extension = sqlite3_api^.load_extension;  
  sqlite3_malloc64 = sqlite3_api^.malloc64;  
  sqlite3_msize = sqlite3_api^.msize;  
  sqlite3_realloc64 = sqlite3_api^.realloc64;  
  sqlite3_reset_auto_extension = sqlite3_api^.reset_auto_extension;  
  sqlite3_result_blob64 = sqlite3_api^.result_blob64;  
  sqlite3_result_text64 = sqlite3_api^.result_text64;  
  sqlite3_strglob = sqlite3_api^.strglob;  
{ Version 3.8.11 and later  }
  sqlite3_value_dup = sqlite3_api^.value_dup;  
  sqlite3_value_free = sqlite3_api^.value_free;  
  sqlite3_result_zeroblob64 = sqlite3_api^.result_zeroblob64;  
  sqlite3_bind_zeroblob64 = sqlite3_api^.bind_zeroblob64;  
{ Version 3.9.0 and later  }
  sqlite3_value_subtype = sqlite3_api^.value_subtype;  
  sqlite3_result_subtype = sqlite3_api^.result_subtype;  
{ Version 3.10.0 and later  }
  sqlite3_status64 = sqlite3_api^.status64;  
  sqlite3_strlike = sqlite3_api^.strlike;  
  sqlite3_db_cacheflush = sqlite3_api^.db_cacheflush;  
{ Version 3.12.0 and later  }
  sqlite3_system_errno = sqlite3_api^.system_errno;  
{ Version 3.14.0 and later  }
  sqlite3_trace_v2 = sqlite3_api^.trace_v2;  
  sqlite3_expanded_sql = sqlite3_api^.expanded_sql;  
{ Version 3.18.0 and later  }
  sqlite3_set_last_insert_rowid = sqlite3_api^.set_last_insert_rowid;  
{ Version 3.20.0 and later  }
  sqlite3_prepare_v3 = sqlite3_api^.prepare_v3;  
  sqlite3_prepare16_v3 = sqlite3_api^.prepare16_v3;  
  sqlite3_bind_pointer = sqlite3_api^.bind_pointer;  
  sqlite3_result_pointer = sqlite3_api^.result_pointer;  
  sqlite3_value_pointer = sqlite3_api^.value_pointer;  
{ Version 3.22.0 and later  }
  sqlite3_vtab_nochange = sqlite3_api^.vtab_nochange;  
  sqlite3_value_nochange = sqlite3_api^.value_nochange;  
  sqlite3_vtab_collation = sqlite3_api^.vtab_collation;  
{ Version 3.24.0 and later  }
  sqlite3_keyword_count = sqlite3_api^.keyword_count;  
  sqlite3_keyword_name = sqlite3_api^.keyword_name;  
  sqlite3_keyword_check = sqlite3_api^.keyword_check;  
  sqlite3_str_new = sqlite3_api^.str_new;  
  sqlite3_str_finish = sqlite3_api^.str_finish;  
  sqlite3_str_appendf = sqlite3_api^.str_appendf;  
  sqlite3_str_vappendf = sqlite3_api^.str_vappendf;  
  sqlite3_str_append = sqlite3_api^.str_append;  
  sqlite3_str_appendall = sqlite3_api^.str_appendall;  
  sqlite3_str_appendchar = sqlite3_api^.str_appendchar;  
  sqlite3_str_reset = sqlite3_api^.str_reset;  
  sqlite3_str_errcode = sqlite3_api^.str_errcode;  
  sqlite3_str_length = sqlite3_api^.str_length;  
  sqlite3_str_value = sqlite3_api^.str_value;  
{ Version 3.25.0 and later  }
  sqlite3_create_window_function = sqlite3_api^.create_window_function;  
{ Version 3.26.0 and later  }
  sqlite3_normalized_sql = sqlite3_api^.normalized_sql;  
{ Version 3.28.0 and later  }
  sqlite3_stmt_isexplain = sqlite3_api^.stmt_isexplain;  
  sqlite3_value_frombind = sqlite3_api^.value_frombind;  
{ Version 3.30.0 and later  }
  sqlite3_drop_modules = sqlite3_api^.drop_modules;  
{ Version 3.31.0 and later  }
  sqlite3_hard_heap_limit64 = sqlite3_api^.hard_heap_limit64;  
  sqlite3_uri_key = sqlite3_api^.uri_key;  
  sqlite3_filename_database = sqlite3_api^.filename_database;  
  sqlite3_filename_journal = sqlite3_api^.filename_journal;  
  sqlite3_filename_wal = sqlite3_api^.filename_wal;  
{ Version 3.32.0 and later  }
  sqlite3_create_filename = sqlite3_api^.create_filename;  
  sqlite3_free_filename = sqlite3_api^.free_filename;  
  sqlite3_database_file_object = sqlite3_api^.database_file_object;  
{ Version 3.34.0 and later  }
  sqlite3_txn_state = sqlite3_api^.txn_state;  
{ Version 3.36.1 and later  }
  sqlite3_changes64 = sqlite3_api^.changes64;  
  sqlite3_total_changes64 = sqlite3_api^.total_changes64;  
{ Version 3.37.0 and later  }
  sqlite3_autovacuum_pages = sqlite3_api^.autovacuum_pages;  
{ Version 3.38.0 and later  }
  sqlite3_error_offset = sqlite3_api^.error_offset;  
  sqlite3_vtab_rhs_value = sqlite3_api^.vtab_rhs_value;  
  sqlite3_vtab_distinct = sqlite3_api^.vtab_distinct;  
  sqlite3_vtab_in = sqlite3_api^.vtab_in;  
  sqlite3_vtab_in_first = sqlite3_api^.vtab_in_first;  
  sqlite3_vtab_in_next = sqlite3_api^.vtab_in_next;  
{ Version 3.39.0 and later  }
{$ifndef SQLITE_OMIT_DESERIALIZE}

const
  sqlite3_deserialize = sqlite3_api^.deserialize;  
  sqlite3_serialize = sqlite3_api^.serialize;  
{$endif}

const
  sqlite3_db_name = sqlite3_api^.db_name;  
{ Version 3.40.0 and later  }
  sqlite3_value_encoding = sqlite3_api^.value_encoding;  
{ Version 3.41.0 and later  }
  sqlite3_is_interrupted = sqlite3_api^.is_interrupted;  
{ Version 3.43.0 and later  }
  sqlite3_stmt_explain = sqlite3_api^.stmt_explain;  
{ Version 3.44.0 and later  }
  sqlite3_get_clientdata = sqlite3_api^.get_clientdata;  
  sqlite3_set_clientdata = sqlite3_api^.set_clientdata;  
{$endif}
{ !defined(SQLITE_CORE) && !defined(SQLITE_OMIT_LOAD_EXTENSION)  }
{$endif}
{ SQLITE3EXT_H  }

// === Konventiert am: 1-12-25 19:27:55 ===


implementation



end.
