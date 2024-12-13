program project1;

uses
  ges,                                  // io.
  ges_enums,                            // io.
  ges_types,                            // io.
  ges_utils,                            // io.
  ges_timeline_element,                 // io.
  ges_extractable_,                     // io.
  ges_asset,                            // io.
  ges_track_element_asset,              // io.
  ges_container,                        // io. -> ges_timeline_element
  ges_group,                            // io. -> ges_container
  ges_timeline,                         // io. -> ges_group, ges_timeline_element, ges_project_, ges_extractable_
  ges_formatter,                        // io.
  ges_project_,                         // io. -> ges_formatter
  ges_track_element,                    // io. -> ges_timeline_element
  ges_operation,                        // io. -> ges_track_element
  ges_track,                            // io. -> ges_track_element
  ges_track_element_deprecated,         // io. -> ges_track_element
  ges_base_effect,                      // io. -> ges_operation
  ges_clip,                             // io. -> ges_track_element, ges_container, ges_base_effect
  ges_layer,                            // io. -> ges_clip
  ges_marker_list,                      // io.
  ges_meta_container,                   // io. -> ges_marker_list



  ctypes,
  fp_glib2,
  fp_gst;

  procedure main(argc: cint; argv: PPChar);
  var
    pipeline: PGstElement;
    bus: PGstBus;
    msg: PGstMessage;
    timeline: PGESTimeline;
  begin
    gst_init(@argc, @argv);
    ges_init;

    timeline:=ges_timeline_new;
  end;


begin
  main(argc, argv);
end.
