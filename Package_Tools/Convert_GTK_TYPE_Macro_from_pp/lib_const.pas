unit lib_const;

interface

type
  TSource = record
    libs,
    units: string;
  end;
  TSources = array of TSource;

const
  Sources: TSources = (
    (libs: 'libglib2'; units: 'common_GLIB, gtypes'),
    (libs: 'libgobject2_0'; units: 'common_GLIB, gtypes'),
    (libs: 'libgio2'; units: 'common_GLIB, gtypes, gerror, gtype, giotypes, gobject, gioenums'),
    (libs: 'libgtk4'; units: 'glib2, common_GTK'),

    (libs: 'libgstreamer'; units: 'glib280, common_GST, gstobject'),
    (libs: 'libgstpbutils'; units: 'glib280, gst124'),
    (libs: 'libgstbase'; units: 'glib280, gst124'),
    (libs: 'libgstaudio'; units: 'glib280, gst124'),
    (libs: 'libgstvideo'; units: 'glib280, gst124'),
    (libs: 'libgstallocators'; units: 'glib280, gst124'),
    (libs: 'libgstanalytics'; units: 'glib280, gst124'),
    (libs: 'libgstcheck'; units: 'glib280, gst124'),
    (libs: 'libgstphotography'; units: 'glib280, gst124'),
    (libs: 'libgstmse'; units: 'glib280, gst124'),
    (libs: 'libgstinsertbin'; units: 'glib280, gst124'),
    (libs: 'libgstwebrtc'; units: 'glib280, gst124'),
    (libs: 'libgstwebrtcnice'; units: 'glib280, gst124'),
    (libs: 'libgstsdp'; units: 'glib280, gst124'),
    (libs: 'libgstmpegts'; units: 'glib280, gst124'),
    (libs: 'libgsttag'; units: 'glib280, gst124'),
    (libs: 'libgstfft'; units: 'glib280, gst124'),
    (libs: 'libgstcodecparsers'; units: 'glib280, gst124'),
    (libs: 'libgstcontroller'; units: 'glib280, gst124'),
    (libs: 'libgstrtp'; units: 'glib280, gst124'),
    (libs: 'libgstrtsp'; units: 'glib280, gst124'),
    (libs: 'libgstwayland'; units: 'glib280, gst124'),
    (libs: 'libgstva'; units: 'glib280, gst124'),
    (libs: 'libgstplayer'; units: 'glib280, gst124'),
    (libs: 'libgstgl'; units: 'glib280, gst124'),
    (libs: 'libgstvulkan'; units: 'glib280, gst124'),
    (libs: 'libgstnet'; units: 'glib280, gst124'),
    (libs: 'libgstcuda'; units: 'glib280, gst124'),
    (libs: 'libgstplay'; units: 'glib280, gst124'),
    (libs: 'libgstapp'; units: 'glib280, gst124'),
    (libs: 'libgstriff'; units: 'glib280, gst124'),
    (libs: 'libgsttranscoder'; units: 'glib280, gst124'),
    (libs: 'libgsturidownloader'; units: 'glib280, gst124'),
    (libs: 'libgstsctp'; units: 'glib280, gst124'),
    (libs: 'libgstopencv'; units: 'glib280, gst124'),
    (libs: 'libgstisoff'; units: 'glib280, gst124'),
    (libs: 'libgdk_pixbuf2'; units: 'glib280, gdk_pixbuf_core'),
    (libs: 'libgdk_pixbuf_xlib2'; units: 'glib280'),

    (libs: 'libpixman'; units: 'ctypes'),
    (libs: 'libgraphene'; units: 'ctypes, graphene'),
    (libs: 'libpango'; units: 'fp_cairo, fp_glib2'),
    (libs: 'libges'; units: 'fp_glib2, fp_gst, ges_enums, ges_types'),

    (libs: 'libharfbuzzgobject'; units: 'fp_glib2, hb_common'),
    (libs: 'libharfbuzzset'; units: 'fp_glib2, hb_common'),
    (libs: 'libharfbuzzcairo'; units: 'fp_glib2, hb_common'),
    (libs: 'libharfbuzzicu'; units: 'fp_glib2, hb_common'),
    (libs: 'libharfbuzz'; units: 'fp_glib2, hb_common'),

    (libs: 'libwebkit'; units: 'fp_glib2, fp_GTK4, WebKit'),
    (libs: 'libjavascriptcoregtk'; units: 'fp_glib2'),

    (libs: 'libadwaita'; units: 'fp_glib2, fp_GTK4'),
    (libs: 'libvte_2_91_gtk4 '; units: 'fp_glib2, fp_GTK4'),
    (libs: 'libgtksourceview5'; units: 'fp_glib2, fp_GTK4'),

    (libs: 'libxml2'; units: 'ctypes, xml2_common'),
    (libs: 'libmicrohttpd'; units: 'ctypes'),
    (libs: 'libchafa'; units: 'fp_glib2'),

    (libs: 'libtk8_6'; units: 'ctypes'),
    (libs: 'libtkstub8_6'; units: 'ctypes'),
    (libs: 'libtcl8_6'; units: 'ctypes'),
    (libs: 'libtclstub8_6'; units: 'ctypes'),

    (libs: 'libttommath'; units: 'ctypes'),
    (libs: 'libgmp'; units: 'ctypes'),


    (libs: 'libnewt'; units: 'ctypes'),
    (libs: 'libtickit'; units: 'ctypes'),
    (libs: 'libcdk'; units: 'ctypes, ncurses, cdk'),

    (libs: 'libsixel'; units: 'ctypes'),

    (libs: 'librtlsdr'; units: 'ctypes'),


    (libs: 'libevas'; units: 'ctypes, efl'),
    (libs: 'libeina'; units: 'ctypes, efl'),
    (libs: 'libeo'; units: 'ctypes, efl'),
    (libs: 'libefl'; units: 'efl, fp_eo, fp_eina'),
    (libs: 'libemile'; units: 'efl, fp_eo, fp_eina'),
    (libs: 'libecore'; units: 'efl, fp_eo, fp_eina, fp_efl'),
    (libs: 'libecore_file'; units: 'efl, fp_eo, fp_eina, fp_efl'),
    (libs: 'libecore_eva'; units: 'efl, fp_eo, fp_eina, fp_efl'),
    (libs: 'libedje'; units: 'efl, fp_eo, fp_eina, fp_efl, fp_evas'),
    (libs: 'libeet'; units: 'efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_edje'),
    (libs: 'libethumb'; units: 'efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_edje'),
    (libs: 'libelementary'; units: 'efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary'),
    (libs: 'libecore_con'; units: 'efl, fp_eo, fp_eina, fp_efl, fp_ecore'),
    (libs: 'libeldbus'; units: 'efl, fp_eo, fp_eina, fp_efl, fp_ecore'),
    (libs: 'libefreet'; units: 'efl, fp_eo, fp_eina, fp_efl, fp_ecore'),
    (libs: 'libemotion'; units: 'efl, fp_eo, fp_eina, fp_efl, fp_ecore'),
    (libs: 'libeio'; units: 'efl, fp_eo, fp_eina, fp_efl, fp_ecore'),
    (libs: 'libeeze'; units: 'efl, fp_eo, fp_eina, fp_efl, fp_ecore'),
    (libs: 'libeolian'; units: 'efl, fp_eo, fp_eina, fp_efl, fp_ecore'),
    (libs: 'libecore_audio'; units: 'efl, fp_eo, fp_eina, fp_efl, fp_ecore'),
    (libs: 'libecore_x'; units: 'efl, fp_eo, fp_eina, fp_efl, fp_ecore'),
    (libs: 'libefl_canvas_wl'; units: 'efl, fp_eo, fp_eina, fp_efl, fp_ecore'),
    (libs: 'libecore_drm2'; units: 'efl, fp_eo, fp_eina, fp_efl, fp_ecore'),
    (libs: 'libecore_fb'; units: 'efl, fp_eo, fp_eina, fp_efl, fp_ecore'),

    (libs: 'libecore_imf'; units: 'efl, fp_eo, fp_eina, fp_efl, fp_ecore'),
    (libs: 'libecore_imf_evas'; units: 'efl, fp_eo, fp_eina, fp_efl, fp_ecore'),
    (libs: 'libecore_input'; units: 'efl, fp_eo, fp_eina, fp_efl, fp_ecore'),
    (libs: 'libecore_input_evas'; units: 'efl, fp_eo, fp_eina, fp_efl, fp_ecore'),
    (libs: 'libecore_ipc'; units: 'efl, fp_eo, fp_eina, fp_efl, fp_ecore'),
    (libs: 'libecore_wl2'; units: 'efl, fp_eo, fp_eina, fp_efl, fp_ecore'),
    (libs: 'libelput'; units: 'efl, fp_eo, fp_eina, fp_efl, fp_ecore'),
    (libs: 'libembryo'; units: 'efl, fp_eo, fp_eina, fp_efl, fp_ecore'),
    (libs: 'libethumb_client'; units: 'efl, fp_eo, fp_eina, fp_efl, fp_ecore'),

    (libs: 'libshaderc'; units: 'ctypes'),
    (libs: 'libglfw'; units: 'ctypes'),
    (libs: 'libglut'; units: 'ctypes'),
    (libs: 'libGLEW'; units: 'ctypes'),
    (libs: 'libGLX'; units: 'ctypes'),
    (libs: 'libGLXEW'; units: 'ctypes'),

    (libs: 'libmgl'; units: 'ctypes'),

    (libs: 'libpciaccess'; units: 'ctypes'),
    (libs: 'libpci'; units: 'ctypes'),

    (libs: 'libgnutls'; units: 'ctypes'),
    (libs: 'libcurl'; units: 'ctypes'),

    (libs: 'libpam'; units: 'ctypes'),
    (libs: 'libpamc'; units: 'ctypes'),
    (libs: 'libpam_misc'; units: 'ctypes'),
    (libs: 'libsystemd'; units: 'ctypes'),



    (libs: 'libibus'; units: 'fp_glib2, ibus'),

    (libs: 'libgraphite2'; units: 'ctypes'),
    (libs: 'libfontconfig'; units: 'ctypes'),
    (libs: 'libdbus_1 '; units: 'ctypes'),
    (libs: 'libraw '; units: 'ctypes'),
    (libs: 'libudev '; units: 'ctypes'),

    (libs: 'libpoppler_glib'; units: 'fp_glib2, fp_cairo'),

    (libs: 'libtesseract'; units: 'ctypes'),
    (libs: 'libleptb'; units: 'fp_lept'),

    (libs: 'libgslcblas'; units: 'fp_gsl'),
    (libs: 'libgsl'; units: 'fp_gsl'),

    (libs: 'libhidapi_hidraw'; units: 'ctypes'),
    (libs: 'libhidapi_libusb'; units: 'ctypes'),

    (libs: 'libevent'; units: 'fp_event'),
    (libs: 'libreadline'; units: 'fp_readline'),
    (libs: 'libportal'; units: 'fp_glib2, fp_portal'),

    (libs: 'libproxy'; units: 'fp_glib2'),
    (libs: 'libpcap'; units: 'ctypes'),
    (libs: 'libfuse3'; units: 'fp_fuse'),

    (libs: 'libpeas2'; units: 'fp_glib2, fp_peas2'),


    (libs: 'libltdl'; units: 'fp_ltdl'),
    (libs: 'libelf'; units: 'fp_elf'),
    (libs: 'libtcod'; units: 'fp_tcod'),
    (libs: 'libinput'; units: 'fp_libudev'),

    (libs: 'libc'; units: 'ctypes'),

    (libs: 'libsndfile'; units: 'ctypes'),

    (libs: 'libjsonglib'; units: 'fp_json_glib'),
    (libs: 'libgsound'; units: 'fp_glib2'),
    (libs: 'libgmime3'; units: 'fp_glib2, fp_gmime3'),

    (libs: 'libsfml_audio'; units: 'fp_sfml'),
    (libs: 'libsfml_graphics'; units: 'fp_sfml'),
    (libs: 'libsfml_network'; units: 'fp_sfml'),
    (libs: 'libsfml_system'; units: 'fp_sfml'),
    (libs: 'libsfml_window'; units: 'fp_sfml'),

    (libs: 'libcanberra'; units: 'fp_canberra'),
    (libs: 'libgbm'; units: 'ctypes'),
    (libs: 'libsoup'; units: 'fp_glib2, fp_soup'),
    (libs: 'libxmlb'; units: 'fp_glib2, fp_xmlb'),

    (libs: 'libvlc'; units: 'fp_vlc'),
    (libs: 'libxcbxxx'; units: 'fp_xcb'),

    (libs: 'libgirepository2'; units: 'fp_glib2, fp_girepository, gitypes, gibaseinfo'),

    (libs: 'libffi'; units: 'ctypes'),

    (libs: 'libgtop2'; units: 'fp_glib2, fp_libgtop2'),

    (libs: 'libcolord_gtk'; units: 'fp_glib2, fp_GTK4, fp_colord'),
    (libs: 'libcolord'; units: 'fp_glib2, fp_colord'),

    (libs: 'libexpat'; units: 'fp_libexpat'),
    (libs: 'libmxml'; units: 'ctypes'),

    (libs: 'libamd'; units: 'fp_suitesparse'),
    (libs: 'libbtf'; units: 'fp_suitesparse'),
    (libs: 'libcamd'; units: 'fp_suitesparse'),
    (libs: 'libccolamd'; units: 'fp_suitesparse'),
    (libs: 'libcholmod'; units: 'fp_suitesparse'),
    (libs: 'libcolamd'; units: 'fp_suitesparse'),
    (libs: 'libklu'; units: 'fp_suitesparse'),
    (libs: 'libklu_cholmod'; units: 'fp_suitesparse'),
    (libs: 'libldl'; units: 'fp_suitesparse'),
    (libs: 'libumfpack'; units: 'fp_suitesparse'),

    (libs: 'libespeak_ng'; units: 'ctypes'),
    (libs: 'liblapacke'; units: 'ctypes'),

    (libs: 'libopenblas'; units: 'ctypes'),
    (libs: 'libusb'; units: 'ctypes'),

    (libs: 'libportmidi'; units: 'ctypes'),


    (libs: ''; units: ''));

implementation

end.
