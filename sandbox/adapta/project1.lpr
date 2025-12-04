program project1;

uses
  //adap_about_dialog,
  //adap_about_window,
  //adap_action_row,
  //adap_alert_dialog,
  //adap_animation,
  //adap_animation_target,
  //adap_animation_util,
  adap_application,
  //adap_application_window,
  //adap_avatar,
  //adap_banner,
  //adap_bin,
  //adap_breakpoint,
  //adap_breakpoint_bin,
  //adap_button_content,
  //adap_carousel,
  //adap_carousel_indicator_dots,
  //adap_carousel_indicator_lines,
  //adap_clamp,
  //adap_clamp_layout,
  //adap_clamp_scrollable,
  //adap_combo_row,
  //adap_dialog,
  //adap_easing,
  //adap_entry_row,
  //adap_enum_list_model,
  //adap_enums,
  //adap_expander_row,
  //adap_flap,
  //adap_fold_threshold_policy,
  //adap_header_bar,
  //adap_leaflet,
  //adap_length_unit,
  //adap_main,
  //adap_message_dialog,
  //adap_navigation_direction,
  //adap_navigation_split_view,
  //adap_navigation_view,
  //adap_overlay_split_view,
  //adap_password_entry_row,
  //adap_preferences_dialog,
  //adap_preferences_group,
  //adap_preferences_page,
  //adap_preferences_row,
  //adap_preferences_window,
  //adap_spin_row,
  //adap_split_button,
  //adap_spring_animation,
  //adap_spring_params,
  //adap_squeezer,
  //adap_status_page,
  //adap_style_manager,
  //adap_swipeable,
  //adap_swipe_tracker,
  //adap_switch_row,
  //adap_tab_bar,
  //adap_tab_button,
  //adap_tab_overview,
  //adap_tab_view,
  //adap_timed_animation,
  //adap_toast,
  //adap_toast_overlay,
  //adap_toolbar_view,
  //adap_version,
  //adap_view_stack,
  //adap_view_switcher,
  //adap_view_switcher_bar,
  //adap_view_switcher_title,
  //adap_window,
  //adap_window_title,

   fp_adapta,


  ctypes,
  SysUtils,
  fp_glib2,
  fp_GTK4;

  procedure print_hello(widget: PGtkWidget; Data: Tgpointer); cdecl;
  const
    counter: cint = 0;
  begin
    g_print('Hello World'#10);

    Inc(counter);
    gtk_button_set_label(GTK_BUTTON(widget), PChar('Ich wurde ' + IntToStr(counter) + ' gelickt'));
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


  function main(argc: cint; argv: PPChar): cint;
  var
//    app: PGtkApplication;
app:    PAdapApplication;
    status: longint;
  begin
//    app := gtk_application_new('org.gtk.example', G_APPLICATION_DEFAULT_FLAGS);
    app := adap_application_new('de.example.libadapta', G_APPLICATION_DEFAULT_FLAGS);
    g_signal_connect(app, 'activate', G_CALLBACK(@activate), nil);
    status := g_application_run(G_APPLICATION(app), argc, argv);
    g_object_unref(app);

    Exit(status);
  end;

begin
  main(argc, argv);
end.
