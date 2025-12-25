unit fp_avahi_glib;

interface

uses
  fp_glib2, fp_avahi_common;

  // ==== avahi-glib/glib-malloc.h

function avahi_glib_allocator: PAvahiAllocator; cdecl; external libavahi_glib;


// ==== avahi-glib/glib-watch.h

type
  PAvahiGLibPoll = type Pointer;

function avahi_glib_poll_new(context: PGMainContext; priority: Tgint): PAvahiGLibPoll; cdecl; external libavahi_glib;
procedure avahi_glib_poll_free(g: PAvahiGLibPoll); cdecl; external libavahi_glib;
function avahi_glib_poll_get(g: PAvahiGLibPoll): PAvahiPoll; cdecl; external libavahi_glib;


implementation

end.
