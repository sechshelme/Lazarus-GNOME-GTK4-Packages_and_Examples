{$IFDEF read_interface}


type
  Twl_object = record
    iface: Pwl_interface;
    impl: pointer;
    id: Tuint32_t;
  end;
  Pwl_object = ^Twl_object;

  Twl_resource = record
    obj: Twl_object;
    destroy: Twl_resource_destroy_func_t;
    link: Twl_list;
    destroy_signal: Twl_signal;
    client: Pwl_client;
    data: pointer;
  end;
  Pwl_resource = ^Twl_resource;

function wl_client_add_resource(client: Pwl_client; resource: Pwl_resource): Tuint32_t; cdecl; external libwayland_server;
function wl_client_add_object(client: Pwl_client; iface: Pwl_interface; impl: pointer; id: Tuint32_t; data: pointer): Pwl_resource; cdecl; external libwayland_server;
function wl_client_new_object(client: Pwl_client; iface: Pwl_interface; impl: pointer; data: pointer): Pwl_resource; cdecl; external libwayland_server;
function wl_display_add_global(display: Pwl_display; iface: Pwl_interface; data: pointer; bind: Twl_global_bind_func_t): Pwl_global; cdecl; external libwayland_server;
procedure wl_display_remove_global(display: Pwl_display; global: Pwl_global); cdecl; external libwayland_server;

// === Konventiert am: 10-6-26 17:05:55 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
