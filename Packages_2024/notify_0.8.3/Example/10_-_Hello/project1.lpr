program project1;

uses
  fp_notify,

  fp_glib2;

  procedure main;
  var
    notif: PNotifyNotification;
  begin
    notify_init('My Notif Demo');
    notif := notify_notification_new('Notify-Demo', 'Ich bin der Nachrichten-Text, in der Nachrichten-Box !', 'info');
    notify_notification_set_urgency(notif, NOTIFY_URGENCY_NORMAL);
    notify_notification_set_timeout(notif, 5000);

    if not notify_notification_show(notif, nil) then begin
      g_printf('Fehler beim Anzeigen');
    end;

    g_object_unref(G_OBJECT(notif));
    notify_uninit();
  end;

begin
  main;
end.
