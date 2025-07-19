

{$include systemd/_sd_common.inc}
{$include systemd/sd_id128.inc}                          //   Tsd_id128_t = array[0..15] of Byte;   ??????????
{$include systemd/sd_bus.inc}
{$include systemd/sd_bus_vtable.inc}                     // struct und Makros entfernt
{$include systemd/sd_bus_protocol.inc}
{$include systemd/sd_daemon.inc}
{$include systemd/sd_event.inc}
{$include systemd/sd_device.inc}
{$include systemd/sd_gpt.inc}
{$include systemd/sd_hwdb.inc}
{$include systemd/sd_journal.inc}
{$include systemd/sd_login.inc}
{$include systemd/sd_messages.inc}
{$include systemd/sd_path.inc}


