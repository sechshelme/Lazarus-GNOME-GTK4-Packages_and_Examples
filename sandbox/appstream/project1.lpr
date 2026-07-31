program project1;

uses
  as_enum_types,
  as_context,
  as_agreement_section,
  as_agreement,
  as_checksum,
  as_bundle,
  as_artifact,
  as_branding,
  as_launchable,
  as_developer,
  as_image,
  as_video,
  as_screenshot,
  as_icon,
  as_provided,
  as_issue,
  as_release,
  as_release_list,
  as_translation,
  as_suggested,
  as_category,
  as_content_rating,
  as_relation,
  as_relation_check_result,
  as_reference,
  as_review,
  as_component,
  as_component_box,
  as_pool,
  as_system_info,
  as_category_gi,
  as_metadata,
  as_spdx,
  as_utils,
  as_validator_issue,
  as_validator,
  as_vercmp,
  as_version,




  fp_glib2,
  fp_GTK4, fp_appstream;

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
    window, box, button, lab: PGtkWidget;
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
