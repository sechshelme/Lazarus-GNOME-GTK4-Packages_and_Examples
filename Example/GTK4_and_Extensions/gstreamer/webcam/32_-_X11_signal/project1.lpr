
program project1;

uses
  unixtype,
  ctypes,
  xlib,
  x,
  xutil,
  keysym,
  fp_glib2,
  fp_gst_app,
  fp_gst;

const
  EventMask = KeyPressMask or ExposureMask or PointerMotionMask or ButtonPressMask;

  Width = 640;
  Height = 480;

var
  pipeline, appsink: PGstElement;
  dis: PDisplay;
  scr: cint;
  gc: TGC;
  rootWin, win: TWindow;
  visual: PVisual;
  image: PXImage;
  Event: TXEvent;

  // https://stackoverflow.com/questions/69747987/gstreamer-rtsp-tee-appsink-cant-emit-signal-new-sample

  function new_prerollb(appsink: PGstAppSink; user_data: Tgpointer): TGstFlowReturn;
  var
    sample: PGstSample;
  begin
    sample := gst_app_sink_pull_preroll(appsink);
    if sample = nil then begin
      WriteLn('No sample');
      Exit(GST_FLOW_ERROR);
    end;

    g_print('Neues Preroll-Sample empfangen'#10);

    gst_sample_unref(sample);

    Exit(GST_FLOW_OK);
  end;

function on_new_sample(appsink: PGstAppSink; user_data: Tgpointer): TGstFlowReturn;
var
  image:     PXImage absolute user_data;
  sample: PGstSample;
  buffer: PGstBuffer;
  map: TGstMapInfo;
begin
  sample := gst_app_sink_pull_sample(appsink);
  if sample = nil then begin
    WriteLn('No sample');
    Exit(GST_FLOW_ERROR);
  end;

  buffer := gst_sample_get_buffer(sample);
  gst_buffer_map(buffer, @map, GST_MAP_READ);

  image^.Data := pansichar(map.Data);
  XPutImage(dis, win, gc, image, 0, 0, 0, 0, Width, Height);

  gst_buffer_unmap(buffer, @map);
  gst_sample_unref(sample);

  Exit(GST_FLOW_OK);
end;


  procedure main;
  begin
    // X11

    dis := XOpenDisplay(nil);
    if dis = nil then begin
      WriteLn('Kann nicht das Display öffnen');
      Halt(1);
    end;
    scr := DefaultScreen(dis);
    gc := DefaultGC(dis, scr);
    rootWin := RootWindow(dis, scr);
    win := XCreateSimpleWindow(dis, rootWin, 10, 10, Width, Height, 1, BlackPixel(dis, scr), WhitePixel(dis, scr));
    XStoreName(dis, win, 'Webcam-Fenster');
    XSelectInput(dis, win, EventMask);
    XMapWindow(dis, win);

    gc := XCreateGC(dis, win, 0, nil);

    visual := DefaultVisual(dis, scr);
    image := XCreateImage(dis, visual, 24, ZPixmap, 0, nil, Width, Height, 32, 0);


    // === GST

    gst_init(@argc, @argv);

    pipeline := gst_parse_launch('v4l2src ! videoconvert ! video/x-raw,format=BGRA,width=640,height=480 ! appsink name=sink emit-signals=true sync=false', nil);
    if pipeline = nil then begin
      WriteLn('pipeline error');
    end;

    appsink := gst_bin_get_by_name(GST_BIN(pipeline), 'sink');
    if appsink = nil then begin
      WriteLn('sink error');
      Halt;
    end;
    g_signal_connect(appsink, 'new-preroll', G_CALLBACK(@new_prerollb), nil);
    g_signal_connect(appsink, 'new-sample', G_CALLBACK(@on_new_sample), image);
    gst_element_set_state(pipeline, GST_STATE_PLAYING);

    while (True) do begin
      if XPending(dis) > 0 then begin
        XNextEvent(dis, @Event);
        case Event._type of
          Expose: begin
          end;
          ButtonPress: begin
            XRaiseWindow(dis, Event.xbutton.window);
          end;
          KeyPress: begin
            if XLookupKeysym(@Event.xkey, 0) = XK_Escape then begin
              Break;
            end;
          end;
        end;
      end;
    end;

    XDestroyWindow(dis, win);
    XCloseDisplay(dis);
  end;

begin
  main;
end.
