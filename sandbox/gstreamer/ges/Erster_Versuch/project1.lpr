program project1;

uses
  ges,
  ges_utils,
  ges_timeline,






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
