unit fp_avahi_core;

interface

uses
  fp_avahi_common;

{$DEFINE read_interface}
{$include avahi-core/core.inc}
{$include avahi-core/rr.inc}
{$include avahi-core/log.inc}
{$include avahi-core/lookup.inc}
{$include avahi-core/publish.inc}
{$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
{$include avahi-core/core.inc}
{$include avahi-core/rr.inc}
{$include avahi-core/log.inc}
{$include avahi-core/lookup.inc}
{$include avahi-core/publish.inc}
{$UNDEF read_implementation}

end.

