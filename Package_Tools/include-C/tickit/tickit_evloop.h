#ifdef __cplusplus
extern "C" {
#endif

#ifndef __TICKIT_EVLOOP_H__
#define __TICKIT_EVLOOP_H__

/*
 * The contents of this file should be considered entirely experimental, and
 * subject to any change at any time. We make no API or ABI stability
 * guarantees at this time.
 */

typedef struct TickitWatch TickitWatch; /* opaque */

struct TickitEventHooks {
  void *(*init)(Tickit *t, void *initdata);
  void  (*destroy)(void *data);
  void  (*run)(void *data, TickitRunFlags flags);
  void  (*stop)(void *data);
  bool  (*io)(void *data, int fd, TickitIOCondition cond, TickitBindFlags flags, TickitWatch *watch);
  void  (*cancel_io)(void *data, TickitWatch *watch);
  /* Below here is optional */
  bool  (*timer)(void *data, const struct timeval *at, TickitBindFlags flags, TickitWatch *watch);
  void  (*cancel_timer)(void *data, TickitWatch *watch);
  bool  (*later)(void *data, TickitBindFlags flags, TickitWatch *watch);
  void  (*cancel_later)(void *data, TickitWatch *watch);
  bool  (*signal)(void *data, int signum, TickitBindFlags flags, TickitWatch *watch);
  void  (*cancel_signal)(void *data, TickitWatch *watch);
  bool  (*process)(void *data, pid_t pid, TickitBindFlags flags, TickitWatch *watch);
  void  (*cancel_process)(void *data, TickitWatch *watch);
};

/* Helper functions for eventloop implementations */

int tickit_evloop_next_timer_msec(Tickit *t);
void tickit_evloop_invoke_timers(Tickit *t);

void *tickit_evloop_get_watch_data(TickitWatch *watch);
void  tickit_evloop_set_watch_data(TickitWatch *watch, void *data);

int  tickit_evloop_get_watch_data_int(TickitWatch *watch);
void tickit_evloop_set_watch_data_int(TickitWatch *watch, int data);

void tickit_evloop_invoke_watch(TickitWatch *watch, TickitEventFlags flags);
void tickit_evloop_invoke_iowatch(TickitWatch *watch, TickitEventFlags flags, TickitIOCondition cond);
void tickit_evloop_invoke_processwatch(TickitWatch *watch, TickitEventFlags flags, int wstatus);
void tickit_evloop_invoke_sigwatches(Tickit *t, int signum);
void tickit_evloop_sigwinch(Tickit *t);

Tickit *tickit_new_with_evloop(TickitTerm *tt, TickitEventHooks *evhooks, void *initdata);

#endif

#ifdef __cplusplus
}
#endif
