unit fp_poll;

interface

uses
  clib;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  // /usr/include/x86_64-linux-gnu/sys/poll.h

const
  _SYS_POLL_H = 1;

type
  Pnfds_t = ^Tnfds_t;
  Tnfds_t = dword;

  Tpollfd = record
    fd: longint;
    events: smallint;
    revents: smallint;
  end;
  Ppollfd = ^Tpollfd;

function poll(__fds: Ppollfd; __nfds: Tnfds_t; __timeout: longint): longint; cdecl; external libc;
function ppoll(__fds: Ppollfd; __nfds: Tnfds_t; __timeout: Ptimespec; __ss: Psigset_t): longint; cdecl; external libc;


// /usr/include/x86_64-linux-gnu/bits/epoll.h

const
  POLLIN = $001;
  POLLPRI = $002;
  POLLOUT = $004;

const
  POLLRDNORM = $040;
  POLLRDBAND = $080;
  POLLWRNORM = $100;
  POLLWRBAND = $200;

const
  POLLMSG = $400;
  POLLREMOVE = $1000;
  POLLRDHUP = $2000;

const
  POLLERR = $008;
  POLLHUP = $010;
  POLLNVAL = $020;


  // /usr/include/x86_64-linux-gnu/sys/epoll.h

type
  TEPOLL_EVENTS = longint;

const
  EPOLLIN = $001;
  EPOLLPRI = $002;
  EPOLLOUT = $004;
  EPOLLRDNORM = $040;
  EPOLLRDBAND = $080;
  EPOLLWRNORM = $100;
  EPOLLWRBAND = $200;
  EPOLLMSG = $400;
  EPOLLERR = $008;
  EPOLLHUP = $010;
  EPOLLRDHUP = $2000;
  EPOLLEXCLUSIVE = 1 shl 28;
  EPOLLWAKEUP = 1 shl 29;
  EPOLLONESHOT = 1 shl 30;
  EPOLLET = 1 shl 31;

const
  EPOLL_CTL_ADD = 1;
  EPOLL_CTL_DEL = 2;
  EPOLL_CTL_MOD = 3;

type
  Tepoll_data = record
    case longint of
      0: (ptr: pointer);
      1: (fd: longint);
      2: (u32: Tuint32_t);
      3: (u64: Tuint64_t);
  end;
  Pepoll_data = ^Tepoll_data;

  Tepoll_data_t = Tepoll_data;
  Pepoll_data_t = ^Tepoll_data_t;

  Tepoll_event = record
    events: Tuint32_t;
    data: Tepoll_data_t;
  end;
  Pepoll_event = ^Tepoll_event;

function epoll_create(__size: longint): longint; cdecl; external libc;
function epoll_create1(__flags: longint): longint; cdecl; external libc;
function epoll_ctl(__epfd: longint; __op: longint; __fd: longint; __event: Pepoll_event): longint; cdecl; external libc;
function epoll_wait(__epfd: longint; __events: Pepoll_event; __maxevents: longint; __timeout: longint): longint; cdecl; external libc;
function epoll_pwait(__epfd: longint; __events: Pepoll_event; __maxevents: longint; __timeout: longint; __ss: Psigset_t): longint; cdecl; external libc;
function epoll_pwait2(__epfd: longint; __events: Pepoll_event; __maxevents: longint; __timeout: Ptimespec; __ss: Psigset_t): longint; cdecl; external libc;


// /usr/include/x86_64-linux-gnu/bits/epoll.h

const
  EPOLL_CLOEXEC = 02000000;



  // === Konventiert am: 14-9-25 15:12:46 ===


implementation



end.
