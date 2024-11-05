/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 20-09-2024   15:33                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

function GST_BUFFER_TIMESTAMP(buf: PGstBuffer): TGstClockTime;
function GST_BUFFER_TIMESTAMP_IS_VALID(buf: PGstBuffer): TGstClockTime;

function gst_buffer_new_and_alloc(s: Tgsize): PGstBuffer;
function gst_pad_set_caps(pad: PGstPad; caps: PGstCaps): Tgboolean;


function gst_element_factory_get_longname(f : PGstElementFactory) : Pgchar;
function gst_element_factory_get_klass(f : PGstElementFactory) : Pgchar;
function gst_element_factory_get_description(f : PGstElementFactory) : Pgchar;
function gst_element_factory_get_author(f : PGstElementFactory) : Pgchar;
function gst_element_factory_get_documentation_uri(f : PGstElementFactory) : Pgchar;
function gst_element_factory_get_icon_name(f : PGstElementFactory) : Pgchar;

//function gst_pad_get_caps_reffed(p : longint) : longint;
//function gst_pad_peer_get_caps_reffed(p : longint) : longint;

procedure gst_tag_list_free(taglist : PGstTagList);


// === Konventiert am: 17-9-24 17:52:07 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function gst_buffer_new_and_alloc(s: Tgsize): PGstBuffer;
begin
  gst_buffer_new_and_alloc := gst_buffer_new_allocate(nil, s, nil);
end;

{
static inline gboolean
gst_pad_set_caps (GstPad * pad, GstCaps * caps)

  GstEvent *event;
  gboolean res = TRUE;

  g_return_val_if_fail (GST_IS_PAD (pad), FALSE);
  g_return_val_if_fail (caps != NULL && gst_caps_is_fixed (caps), FALSE);

  event = gst_event_new_caps (caps);

  if (GST_PAD_IS_SRC (pad))
    res = gst_pad_push_event (pad, event);
  else
    res = gst_pad_send_event (pad, event);

  return res;
 }


function gst_pad_set_caps(pad: PGstPad; caps: PGstCaps): Tgboolean;
var
  event: PGstEvent;
begin
  if not GST_IS_PAD(pad) then begin
    exit(False);
  end;
  if (caps <> nil) and (gst_caps_is_fixed(caps)) then begin
    exit(False);
  end;
  event := gst_event_new_caps(caps);
  if GST_PAD_IS_SRC(pad) then begin
    Result := gst_pad_push_event(pad, event);
  end else begin
    Result := gst_pad_send_event(pad, event);
  end;
end;

function gst_message_new_duration(src: PGstObject; fmt, dur: longint): PGstMessage;
begin
  gst_message_new_duration := gst_message_new_duration_changed(src);
end;

function GST_BUFFER_TIMESTAMP(buf: PGstBuffer): TGstClockTime;
begin
  Result := (GST_BUFFER_CAST(buf))^.pts;
end;

function GST_BUFFER_TIMESTAMP_IS_VALID(buf: PGstBuffer): TGstClockTime;
begin
  if GST_BUFFER_DTS_IS_VALID(buf) then begin
    Result := GST_BUFFER_DTS(buf);
  end else begin
    Result := GST_BUFFER_PTS(buf);
  end;
end;

function gst_element_factory_get_longname(f: PGstElementFactory): Pgchar;
begin
  gst_element_factory_get_longname := gst_element_factory_get_metadata(f, GST_ELEMENT_METADATA_LONGNAME);
end;

function gst_element_factory_get_klass(f: PGstElementFactory): Pgchar;
begin
  gst_element_factory_get_klass := gst_element_factory_get_metadata(f, GST_ELEMENT_METADATA_KLASS);
end;

function gst_element_factory_get_description(f: PGstElementFactory): Pgchar;
begin
  gst_element_factory_get_description := gst_element_factory_get_metadata(f, GST_ELEMENT_METADATA_DESCRIPTION);
end;

function gst_element_factory_get_author(f: PGstElementFactory): Pgchar;
begin
  gst_element_factory_get_author := gst_element_factory_get_metadata(f, GST_ELEMENT_METADATA_AUTHOR);
end;

function gst_element_factory_get_documentation_uri(f: PGstElementFactory): Pgchar;
begin
  gst_element_factory_get_documentation_uri := gst_element_factory_get_metadata(f, GST_ELEMENT_METADATA_DOC_URI);
end;

function gst_element_factory_get_icon_name(f: PGstElementFactory): Pgchar;
begin
  gst_element_factory_get_icon_name := gst_element_factory_get_metadata(f, GST_ELEMENT_METADATA_ICON_NAME);
end;

function gst_pad_get_caps_reffed(p: longint): longint;
begin
  // im C-Header fehlerhaft
  //  gst_pad_get_caps_reffed:=gst_pad_get_caps(p);
end;

function gst_pad_peer_get_caps_reffed(p: longint): longint;
begin
  // im C-Header fehlerhaft
  //  gst_pad_peer_get_caps_reffed:=gst_pad_peer_get_caps(p);
end;

procedure gst_tag_list_free(taglist: PGstTagList);
begin
  gst_tag_list_unref(taglist);
end;

{$ENDIF read_implementation}
