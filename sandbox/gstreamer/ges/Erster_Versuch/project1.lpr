program project1;

uses
  ges,
  ges_enums,
  ges_types,
  ges_utils,
  ges_timeline,

  ges_formatter,
  ges_project_,
  ges_group,
  ges_operation,
  ges_base_effect,
  ges_container,
  ges_clip,
  ges_layer,
  ges_timeline_element,
  ges_extractable_,
  ges_asset,
  ges_track,
  ges_track_element,
  ges_track_element_deprecated,
  ges_track_element_asset,



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
