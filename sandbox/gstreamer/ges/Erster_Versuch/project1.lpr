program project1;

uses
  ges,
  ges_types,
  ges_utils,
  ges_timeline,

  ges_enums,
  ges_timeline_element,
  ges_extractable,
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
  begin
    gst_init(@argc, @argv);
    ges_init;

    timeline:=ges_timeline_new;
  end;


begin
  main(argc, argv);
end.
