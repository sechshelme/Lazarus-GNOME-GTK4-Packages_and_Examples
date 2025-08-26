program project1;

uses
  event_config,
  util,
  event,

  buffer,

  buffer_compat,
  bufferevent,
  bufferevent_compat,
  bufferevent_ssl,
  bufferevent_struct,
  dns,
  dns_compat,
  dns_struct,




  fp_time,
  fp_stdio,
  fp_event;

  procedure timer_cb(para1: Tevutil_socket_t; para2: smallint; para3: pointer); cdecl;
  var
    base: Pevent_base absolute para3;
  const
    count: integer = 0;
  begin
    Inc(count);
    printf('Timer triggered %d times'#10, count);
    if count >= 5 then begin
      printf('Reached 5 triggers, stopping event loop.'#10);
      event_base_loopbreak(base);
    end;
  end;

  procedure main;
  var
    timer_event: Pevent;
    one_sec: Ttimeval = (tv_sec: 1; tv_usec: 0);
    base: Pevent_base;
  begin
    base := event_base_new;
    timer_event := event_new(base, -1, EV_PERSIST, @timer_cb, base);
    event_add(timer_event, @one_sec);
    event_base_dispatch(base);
    event_free(timer_event);
    event_base_free(base);
  end;

begin
  main;
end.
