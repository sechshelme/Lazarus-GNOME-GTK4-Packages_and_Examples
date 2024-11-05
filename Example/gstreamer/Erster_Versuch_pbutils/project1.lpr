program project1;

uses
  crt,
  Classes,
  SysUtils,
  GL,
  FileUtil,


  glib280,
  gst124,
  gst124_base,
  gst124_audio,
  gst124_video,
  gst124_pbutils,
  gst124_allocators,
  gst124_analytics,
  gst124_check,
  gst124_interfaces,
  gst124_mse,
  gst124_insertbin,
  gst124_sdp,
  gst124_webrtc,
  gst124_webrtc_nice,
  gst124_mpegts,
  gst124_tag,
  gst124_fft,
  gst124_codecparsers,
  gst124_controller,
  gst124_rtp,
  gst124_rtsp,
  gst124_wayland,
  gst124_va,
  gst124_player,
  gst124_gl,
  gst124_gl_egl,
  gst124_gl_x11,
  gst124_gl_wayland,
  gst124_gl_glprototypes,
  gst124_vulkan,
  gst124_vulkan_xcb,
  gst124_vulkan_wayland,
  gst124_net,
  gst124_cuda,
  gst124_play,
  gst124_app,
  gst124_riff,
  gst124_basecamerabinsrc,
  gst124_transcoder,
  gst124_uridownloader,
  gst124_isoff,
  gst124_sctp,
  gst124_opencv,

  GLIBTools,
  gstTools;

  function get_duration(s: string): Tguint64;
  var
    discoverer: PGstDiscoverer;
    info: PGstDiscovererInfo;
  begin
    discoverer := gst_discoverer_new(5 * GST_SECOND, nil);

    info := gst_discoverer_discover_uri(discoverer, PChar('file:' + s), nil);

    if info = nil then begin
      WriteLn('Info error !');
      Result := -1;
    end else begin
      Result := gst_discoverer_info_get_duration(info) div G_USEC_PER_SEC;
      gst_discoverer_info_unref(info);
    end;
    g_object_unref(discoverer);
  end;

  procedure WriteDuration(sl: TStringList);
  var
    i: integer;
    s: string;
    dur: Tguint64;
  begin
    for i := 0 to sl.Count - 1 do begin
      s := sl[i];
      dur := get_duration(s);
      WriteLn(GstClockToStr(dur));
      //    Application.ProcessMessages;
      //    Memo1.Lines.Add(s);
    end;
  end;

  procedure main;
  const
    path = '/home/tux/Schreibtisch/sound/test.wav';
  var
    sl: TStringList;
    obj: PGstShmAllocator;
    pipeline, mse: PGstElement;
    fft: PGstFFTF64;
    prg: TGLuint;
    riff: PGstCaps;
  begin
    gst_init(nil, nil);

    pipeline := gst_parse_launch(PChar('filesrc location="' + path + '" ! decodebin ! audioconvert  ! autoaudiosink'), nil);
    gst_element_set_state(pipeline, GST_STATE_PLAYING);

    //prg:=    CreateProgram;
    //WriteLn('GL Programm: ', prg);

    WriteLn(GST_SCTP_RECEIVE_META_API_TYPE);
    WriteLn(GST_SCTP_SEND_META_API_TYPE);
    WriteLn(GST_TYPE_OPENCV_VIDEO_FILTER);

        riff := gst_riff_create_audio_template_caps;
    if riff <> nil then begin
      WriteLn('riff io.');
    end;
    riff := gst_riff_create_audio_template_caps;
    if riff <> nil then begin
      WriteLn('riff io.');
    end;

    mse := gst_bin_get_by_interface(GST_BIN(pipeline), GST_TYPE_MSE_SRC);
    if mse = nil then begin
      WriteLn('mse error');
    end;

    fft := gst_fft_f64_new(1024, True);
    if fft = nil then begin
      WriteLn('fft error');
    end else begin
      WriteLn('fft io.');
    end;

    //    gst_check_init(nil,nil);
    //  gst_check_remove_log_filter(nil);


    WriteLn(gst_camerabin_preview_set_filter(nil, nil));


    obj := g_object_new(GST_TYPE_FRAGMENT, nil);
    if obj <> nil then begin
      WriteLn('opencv io');
    end;
    WriteLn(GST_IS_FRAGMENT(obj));
    GObjectShowProperty(obj);
    g_object_unref(obj);

    obj := g_object_new(GST_TYPE_URI_DOWNLOADER, nil);
    if obj <> nil then begin
      WriteLn('play_video io');
    end;
    WriteLn(GST_IS_URI_DOWNLOADER(obj));
    GObjectShowProperty(obj);
    g_object_unref(obj);



    obj := g_object_new(GST_TYPE_TRANSCODER, nil);
    if obj <> nil then begin
      WriteLn('play_video io');
    end;
    WriteLn(GST_IS_TRANSCODER(obj));
    GObjectShowProperty(obj);
    g_object_unref(obj);

    obj := g_object_new(GST_TYPE_BASE_CAMERA_SRC, nil);
    if obj <> nil then begin
      WriteLn('play_video io');
    end;
    WriteLn(GST_IS_BASE_CAMERA_SRC(obj));
    GObjectShowProperty(obj);
    g_object_unref(obj);


    obj := g_object_new(GST_TYPE_APP_SRC, nil);
    if obj <> nil then begin
      WriteLn('play_video io');
    end;
    WriteLn(GST_IS_APP_SRC_CLASS(obj));
    GObjectShowProperty(obj);
    g_object_unref(obj);

    obj := g_object_new(GST_TYPE_APP_SINK, nil);
    if obj <> nil then begin
      WriteLn('play_audio io');
    end;
    WriteLn(GST_IS_APP_SINK(obj));
    GObjectShowProperty(obj);
    g_object_unref(obj);


    obj := g_object_new(GST_TYPE_PLAY_VIDEO_INFO, nil);
    if obj <> nil then begin
      WriteLn('play_video io');
    end;
    WriteLn(GST_IS_PLAY_VIDEO_INFO(obj));
    GObjectShowProperty(obj);
    g_object_unref(obj);

    obj := g_object_new(GST_TYPE_PLAY_AUDIO_INFO, nil);
    if obj <> nil then begin
      WriteLn('play_audio io');
    end;
    WriteLn(GST_IS_PLAY_AUDIO_INFO(obj));
    GObjectShowProperty(obj);
    g_object_unref(obj);




    obj := g_object_new(GST_TYPE_NET_CLIENT_CLOCK, nil);
    if obj <> nil then begin
      WriteLn('io');
    end;
    WriteLn(GST_IS_NET_CLIENT_CLOCK(obj));
    GObjectShowProperty(obj);
    g_object_unref(obj);

    obj := g_object_new(GST_TYPE_VULKAN_DISPLAY_XCB, nil);
    if obj <> nil then begin
      WriteLn('io');
    end;
    WriteLn(GST_IS_VULKAN_DISPLAY_XCB(obj));
    GObjectShowProperty(obj);
    g_object_unref(obj);

    obj := g_object_new(GST_TYPE_VULKAN_DISPLAY_WAYLAND, nil);
    if obj <> nil then begin
      WriteLn('io');
    end;
    WriteLn(GST_IS_VULKAN_DISPLAY_WAYLAND(obj));
    GObjectShowProperty(obj);
    g_object_unref(obj);

    obj := g_object_new(GST_TYPE_VULKAN_COMMAND_POOL, nil);
    if obj <> nil then begin
      WriteLn('io');
    end;
    WriteLn(GST_IS_VULKAN_COMMAND_POOL(obj));
    GObjectShowProperty(obj);
    g_object_unref(obj);

    obj := g_object_new(GST_TYPE_PLAYER_G_MAIN_CONTEXT_SIGNAL_DISPATCHER, nil);
    if obj <> nil then begin
      WriteLn('io');
    end;
    WriteLn(GST_IS_PLAYER_G_MAIN_CONTEXT_SIGNAL_DISPATCHER(obj));
    GObjectShowProperty(obj);
    g_object_unref(obj);

    obj := g_object_new(GST_TYPE_VA_DMABUF_ALLOCATOR, nil);
    if obj <> nil then begin
      WriteLn('io');
    end;
    WriteLn(GST_IS_VA_DMABUF_ALLOCATOR(obj));
    GObjectShowProperty(obj);
    g_object_unref(obj);

    obj := g_object_new(GST_TYPE_TAG_XMP_WRITER, nil);
    if obj <> nil then begin
      WriteLn('io');
    end;
    WriteLn(GST_IS_WEBRTC_NICE_TRANSPORT(obj));
    GObjectShowProperty(obj);
    g_object_unref(obj);

    obj := g_object_new(GST_TYPE_RTSP_EXTENSION, nil);
    if obj <> nil then begin
      WriteLn('io');
    end;
    WriteLn(GST_IS_RTSP_EXTENSION(obj));
    GObjectShowProperty(obj);
    g_object_unref(obj);

    //    obj := g_object_new(GST_TYPE_WL_WINDOW, nil);
    if obj <> nil then begin
      WriteLn('io');
    end;
    WriteLn(GST_IS_WL_WINDOW(obj));
    //    GObjectShowProperty(obj);
    g_object_unref(obj);



    obj := g_object_new(GST_TYPE_GL_VIEW_CONVERT, nil);
    if obj <> nil then begin
      WriteLn('io');
    end;
    WriteLn(GST_IS_GL_VIEW_CONVERT(obj));
    GObjectShowProperty(obj);
    g_object_unref(obj);

    obj := g_object_new(GST_TYPE_GL_MEMORY_ALLOCATOR, nil);
    if obj <> nil then begin
      WriteLn('io');
    end;
    WriteLn(GST_IS_GL_MEMORY_ALLOCATOR(obj));
    GObjectShowProperty(obj);
    g_object_unref(obj);

    WriteLn('xxxxxxxxxxxxxxxxxxx');




    obj := g_object_new(GST_TYPE_RTP_BASE_AUDIO_PAYLOAD, nil);
    WriteLn(GST_IS_RTP_BASE_AUDIO_PAYLOAD(obj));
    //    GObjectShowProperty(obj);
    g_object_unref(obj);


    obj := g_object_new(GST_TYPE_INTERPOLATION_CONTROL_SOURCE, nil);
    WriteLn(GST_IS_INTERPOLATION_CONTROL_SOURCE(obj));
    GObjectShowProperty(obj);
    g_object_unref(obj);


    obj := g_object_new(GST_MPEG_VIDEO_META_API_TYPE, nil);
    WriteLn(GST_IS_WEBRTC_NICE_TRANSPORT(obj));
    GObjectShowProperty(obj);
    g_object_unref(obj);


    obj := g_object_new(GST_MPEGTS_PES_METADATA_META_API_TYPE, nil);
    WriteLn(GST_IS_WEBRTC_NICE_TRANSPORT(obj));
    GObjectShowProperty(obj);
    g_object_unref(obj);

    obj := g_object_new(GST_TYPE_MPEGTS_DVB_CABLE_DELIVERY_SYSTEM_DESCRIPTOR, nil);
    WriteLn(GST_IS_WEBRTC_NICE_TRANSPORT(obj));
    GObjectShowProperty(obj);
    g_object_unref(obj);


    obj := g_object_new(GST_TYPE_WEBRTC_SESSION_DESCRIPTION, nil);
    WriteLn(GST_IS_WEBRTC_NICE_TRANSPORT(obj));
    GObjectShowProperty(obj);
    g_object_unref(obj);

    obj := g_object_new(GST_TYPE_SOURCE_BUFFER, nil);
    WriteLn(GST_IS_SOURCE_BUFFER(obj));
    GObjectShowProperty(obj);
    g_object_unref(obj);

    obj := g_object_new(GST_TYPE_SOURCE_BUFFER_LIST, nil);
    WriteLn(GST_IS_SOURCE_BUFFER_LIST(obj));
    GObjectShowProperty(obj);
    g_object_unref(obj);


    obj := g_object_new(GST_TYPE_MSE_SRC, nil);
    if obj = nil then begin
      WriteLn('GST_TYPE_MSE_SRC error');
    end;
    WriteLn('foto ', GST_IS_MSE_SRC(obj));
    GObjectShowProperty(obj);
    g_object_unref(obj);

    obj := g_object_new(GST_TYPE_TEST_CLOCK, nil);
    WriteLn(GST_IS_SHM_ALLOCATOR(obj));
    GObjectShowProperty(obj);
    g_object_unref(obj);

    obj := g_object_new(GST_TYPE_SHM_ALLOCATOR, nil);
    WriteLn(GST_IS_SHM_ALLOCATOR(obj));
    GObjectShowProperty(obj);
    g_object_unref(obj);

    obj := g_object_new(GST_TYPE_FD_ALLOCATOR, nil);
    WriteLn('shm: ', obj <> nil);
    WriteLn(GST_IS_FD_ALLOCATOR(obj));
    GObjectShowProperty(obj);
    g_object_unref(obj);

    sl := FindAllFiles('/n4800/Multimedia/Music/Disco/Boney M/1981 - Boonoonoonoos', '*.flac;*.mp3', True);
    WriteDuration(sl);
    sl.Free;
    sl := FindAllFiles('/n4800/Multimedia/Music/Disco/Italo Disco/The Best Of Italo Disco Vol. 1-16', '*.flac;*.mp3', True);
    //    WriteDuration(sl);
    sl.Free;

    repeat
    until KeyPressed;
    g_object_unref(pipeline);
  end;

begin
  main;
end.
