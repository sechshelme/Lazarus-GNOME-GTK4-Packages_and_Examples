program project1;

uses
  fp_glib2,
  fp_GTK4,

  adw_enums,                      // io.
  adw_length_unit,                // io.
  adw_overlay_split_view,         // io. -> adw_length_unit
  adw_breakpoint,                 // io. -> adw_length_unit
  adw_clamp_scrollable,           // io. -> adw_length_unit
  adw_clamp,                      // io. -> adw_length_unit
  adw_clamp_layout,               // io. -> adw_length_unit
  adw_dialog,                     // io. -> adw_breakpoint
  adw_about_dialog,               // io. -> adw_dialog
  adw_alert_dialog,               // io. -> adw_dialog
  adw_message_dialog,             // io. -> adw_alert_dialog
  adw_application_window,         // io. -> adw_breakpoint, adw_dialog
  adw_toolbar_view,               // io.
  adw_header_bar,                 // io.
  adw_style_manager,              // io.
  adw_application,                // io.  > adw_style_manager
  adw_window,                     // io. -> adw_breakpoint, adw_dialog
  adw_about_window,               // io. -> adw_window
  adw_tab_view,                   // io.
  adw_tab_overview,               // io. -> adw_tab_view
  adw_tab_bar,                    // io. -> adw_tab_view
  adw_tab_button,                 // io. -> adw_tab_view
  adw_version,                    // io.
  adw_navigation_direction,       // io.
  adw_spring_params,              // io.
  adw_fold_threshold_policy,      // io.
  adw_leaflet,                    // io. -> adw_fold_threshold_policy, adw_spring_params, adw_navigation_direction
  adw_flap,                       // io. -> adw_spring_params, adw_fold_threshold_policy
  adw_navigation_view,            // io.
  adw_squeezer,                   // io. -> adw_fold_threshold_policy
  adw_view_stack,                 // io.
  adw_view_switcher_title,        // io. -> adw_view_stack
  adw_view_switcher,              // io. -> adw_view_stack
  adw_view_switcher_bar,          // io. -> adw_view_stack
  adw_preferences_row,            // io.
  adw_expander_row,               // io. -> adw_preferences_row
  adw_carousel,                   // io. -> adw_spring_params
  adw_carousel_indicator_lines,   // io. -> adw_carousel
  adw_carousel_indicator_dots,    // io. -> adw_carousel
  adw_navigation_split_view,      // io. -> adw_navigation_view, adw_length_unit
  adw_toast,                      // io.
  adw_toast_overlay,              // io. -> adw_toast
  adw_preferences_group,          // io.
  adw_preferences_page,           // io. -> adw_preferences_group
  adw_preferences_window,         // io. -> adw_window, adw_preferences_page, adw_navigation_view, adw_toast
  adw_action_row,                 // io. -> adw_preferences_row
  adw_combo_row,                  // io. -> adw_action_row
  adw_spin_row,                   // io. -> adw_action_row
  adw_switch_row,                 // io. -> adw_action_row
  adw_entry_row,                  // io. -> adw_preferences_row
  adw_password_entry_row,         // io. -> adw_entry_row
  adw_split_button,               // io.
  adw_animation_target,           // io.
  adw_animation,                  // io. -> adw_animation_target
  adw_spring_animation,           // io. -> adw_spring_params, adw_animation_target, adw_animation
  adw_swipeable,                  // io. -> adw_navigation_direction
  adw_swipe_tracker,              // io. -> adw_swipeable
  adw_preferences_dialog,         // io. -> adw_dialog, adw_preferences_page, adw_navigation_view, adw_toast
  adw_easing,                     // io.
  adw_timed_animation,            // io. -> adw_animation_target, adw_animation, adw_easing
  adw_avatar,                     // io.
  adw_status_page,                // io.
  adw_banner,                     // io.
  adw_breakpoint_bin,             // io. -> adw_breakpoint
  adw_button_content,             // io.
  adw_enum_list_model,            // io.
  adw_window_title,               // io.
  adw_bin,                        // io.
  adw_animation_util,             // io.
  adw_main,                       // io.


  ctypes;

  procedure quit_clicked_cp(widget: PGtkWidget; Data: Tgpointer); cdecl;
  var
    app: PGtkApplication absolute Data;
  begin
    g_application_quit(G_APPLICATION(app));
  end;

  procedure activate(app: PGtkApplication; user_data: Tgpointer);
  var
    window, toolbar_view, header_bar, label_, box, button: PGtkWidget;
  begin
    //    window := gtk_application_window_new(app);
    window := adw_application_window_new(app);
    toolbar_view := adw_toolbar_view_new;
    header_bar := adw_header_bar_new;

    box := gtk_box_new(GTK_ORIENTATION_VERTICAL, 0);

    label_ := gtk_label_new('Hello World');
    gtk_box_append(GTK_BOX(box), label_);

    button := gtk_button_new_with_label('Quit');
    gtk_box_append(GTK_BOX(box), button);
    g_signal_connect(button, 'clicked', G_CALLBACK(@quit_clicked_cp), app);

    adw_toolbar_view_add_top_bar(ADW_TOOLBAR_VIEW.ADW_TOOLBAR_VIEW(toolbar_view), header_bar);
    adw_toolbar_view_set_content(ADW_TOOLBAR_VIEW.ADW_TOOLBAR_VIEW(toolbar_view), box);

    gtk_window_set_title(GTK_WINDOW(window), 'Window');
    gtk_window_set_default_size(GTK_WINDOW(window), 200, 200);

    adw_application_window_set_content(adw_application_window.ADW_APPLICATION_WINDOW(window), toolbar_view);
    gtk_window_present(GTK_WINDOW(window));
  end;


  function main(argc: cint; argv: PPChar): cint;
  var
    status: longint;
    app: PAdwApplication;
  begin
    //    app := gtk_application_new('org.gtk.example', G_APPLICATION_DEFAULT_FLAGS);
    app := adw_application_new('org.example.Hello', 0);

    g_signal_connect(app, 'activate', G_CALLBACK(@activate), nil);
    status := g_application_run(G_APPLICATION(app), argc, argv);
    g_object_unref(app);

    Exit(status);
  end;

begin
  main(argc, argv);
end.
