program project1;

uses
  event_config,
  util,
  event,

  fp_event;

begin

end.



//
//// gcc main.c -o main -levent
//
//#include <event2/event.h>
//#include <stdio.h>
//
//struct event_base *base;
//struct event *timer_event;
//int count = 0;
//
//void timer_cb(evutil_socket_t fd, short what, void *arg) {
//    printf("Timer triggered %d times\n", ++count);
//    if (count == 5) {
//        printf("Reached 5 triggers, stopping event loop.\n");
//        event_base_loopbreak(base);
//    }
//}
//
//int main() {
//    base = event_base_new();
//    struct timeval one_sec = {1, 0};
//    timer_event = event_new(base, -1, EV_PERSIST, timer_cb, NULL);
//    event_add(timer_event, &one_sec);
//    event_base_dispatch(base);
//    event_free(timer_event);
//    event_base_free(base);
//    return 0;
//}
//
