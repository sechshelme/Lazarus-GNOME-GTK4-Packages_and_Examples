unit fp_avahi_gobject;

interface

uses
  fp_glib2, fp_avahi_common, fp_avahi_client;

{$DEFINE read_interface}
{$include avahi-gobject/ga_enums.inc}
{$include avahi-gobject/ga_client.inc}
{$include avahi-gobject/ga_service_resolver.inc}
{$include avahi-gobject/ga_entry_group.inc}
{$include avahi-gobject/ga_error.inc}
{$include avahi-gobject/ga_record_browser.inc}
{$include avahi-gobject/ga_service_browser.inc}
{$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
{$include avahi-gobject/ga_enums.inc}
{$include avahi-gobject/ga_client.inc}
{$include avahi-gobject/ga_service_resolver.inc}
{$include avahi-gobject/ga_entry_group.inc}
{$include avahi-gobject/ga_error.inc}
{$include avahi-gobject/ga_record_browser.inc}
{$include avahi-gobject/ga_service_browser.inc}
{$UNDEF read_implementation}

end.

