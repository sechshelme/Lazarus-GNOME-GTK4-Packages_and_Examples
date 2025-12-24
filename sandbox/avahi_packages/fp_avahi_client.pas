unit fp_avahi_client;

interface

uses
  fp_avahi_common;

{$DEFINE read_interface}
{$include avahi-client/client.inc}
{$include avahi-client/lookup.inc}
{$include avahi-client/publish.inc}
{$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
{$include avahi-client/client.inc}
{$include avahi-client/lookup.inc}
{$include avahi-client/publish.inc}
{$UNDEF read_implementation}

end.

