program project1;

// diff -U 1 /n4800/DATEN/Programmierung/mit_GIT/Lazarus/Tutorial/GNOME/Packages_2024/gtk-4.14.2/C-include/gtk/gtkslicelistmodel.h /n4800/DATEN/Programmierung/mit_GIT/Lazarus/Tutorial/GNOME/Packages_2026/gtk-4.22.4/C-include/gtk-4.0/gtk/gtkslicelistmodel.h > test.diff
uses

  gst,
  gstobject,
  gstminiobject,
  gstmemory,
  gstallocator,                     // GstMemoryFlags
  gstatomicqueue,
  gstidstr,
  gstdatetime,
  gstcapsfeatures,
  gststructure,
  gstcaps,
  gstiterator,
  gstformat,
  gstsegment,
  gstbytearrayinterface,
  gstclock,
  gstmeta,
  gsttaglist,
  gsttagsetter,
  gststreams,
  gststreamcollection,
  gsttoc,
  gsttocsetter,
  gstcontext,
  gstbuffer,
  gstbufferpool,
  gstbufferlist,
  gstquery,
    gstplugin,
  gstpluginfeature,
  gstdevice,                                   // GST_DEVICE_CLASS &  GST_DEVICE_GET_CLASS
  gstdevicemonitor,
  gstdeviceproviderfactory,
  gstdeviceprovider,
  gstmessage,
  gstevent,
  gsttaskpool,
    gsttask,
  gstpad,
  gstpadtemplate,

    gsturi,


  gstelementfactory,
  gstelement,
  gstelementmetadata,




  gstsample,




  gstbus,




  gstbin,

  gstchildproxy,
  gstconfig,
  gstcontrolbinding,
  gstcontrolsource,
  gstcpuid,
  gstdebugutils,
  gstdynamictypefactory,
  gstenumtypes,
  gsterror,
  gstghostpad,
  gstinfo,
  gstmetafactory,
  gstparamspecs,
  gstparse,
  gstpipeline,
  gstpoll,
  gstpreset,
  gstpromise,
  gstprotection,
  gstregistry,
  gstsystemclock,
  gsttracer,
  gsttracerfactory,
  gsttracerrecord,
  gsttypefind,
  gsttypefindfactory,
  gstutils,
  gstvalue,
  gstvecdeque,
  gstversion,



  fp_girepository_2,
  fp_glib_unix,
  fp_gio_unix_2,
  fp_GTK4,
  fp_glib2;

  procedure print_hello(widget: PGtkWidget; Data: Tgpointer); cdecl;
  const
    counter: integer = 0;
  var
    s: Pgchar;
  begin
    Inc(counter);
    s := g_strdup_printf('Ich wurde %d gelickt', counter);
    gtk_button_set_label(GTK_BUTTON(widget), s);
    g_free(s);
  end;


  procedure activate(app: PGtkApplication; user_data: Tgpointer); cdecl;
  var
    window, box, button: PGtkWidget;
  begin
    window := gtk_application_window_new(app);
    gtk_window_set_title(GTK_WINDOW(window), 'Window');
    gtk_window_set_default_size(GTK_WINDOW(window), 200, 200);

    box := gtk_box_new(GTK_ORIENTATION_VERTICAL, 0);
    gtk_widget_set_halign(box, GTK_ALIGN_CENTER);
    gtk_widget_set_valign(box, GTK_ALIGN_CENTER);

    gtk_window_set_child(GTK_WINDOW(window), box);
    button := gtk_button_new_with_label('Hello World');
    g_signal_connect(button, 'clicked', G_CALLBACK(@print_hello), nil);
    gtk_box_append(GTK_BOX(box), button);

    gtk_window_present(GTK_WINDOW(window));
  end;


  procedure main;
  var
    app: PGtkApplication;
  begin
    app := gtk_application_new('org.gtk.example', G_APPLICATION_DEFAULT_FLAGS);
    g_signal_connect(app, 'activate', G_CALLBACK(@activate), nil);
    g_application_run(G_APPLICATION(app), argc, argv);
    g_object_unref(app);
  end;

begin
  main;
end.
