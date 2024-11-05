/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 20-09-2024   15:33                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  PGstByteArrayInterface = ^TGstByteArrayInterface;

  TGstByteArrayInterface = record
    Data: Pguint8;
    len: Tgsize;
    resize: function(self: PGstByteArrayInterface; length: Tgsize): Tgboolean; cdecl;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;

procedure gst_byte_array_interface_init(self: PGstByteArrayInterface);
function gst_byte_array_interface_set_size(self: PGstByteArrayInterface; len: Tgsize): Tgboolean;
function gst_byte_array_interface_append(self: PGstByteArrayInterface; size: Tgsize): Pguint8;
function gst_byte_array_interface_append_data(self: PGstByteArrayInterface; Data: Pguint8; size: Tgsize): Tgboolean;


{
static inline void
gst_byte_array_interface_init (GstByteArrayInterface *self)

  memset (self, 0, sizeof (GstByteArrayInterface));

static inline gboolean
gst_byte_array_interface_set_size (GstByteArrayInterface *self, gsize length)

  if (self->resize == NULL || !self->resize (self, length))
    return FALSE;
  self->len = length;
  return TRUE;

static inline guint8 *
gst_byte_array_interface_append (GstByteArrayInterface *self, gsize size)

  gsize orig = self->len;
  if (!gst_byte_array_interface_set_size (self, self->len + size))
    return NULL;
  return self->data + orig;

static inline gboolean
gst_byte_array_interface_append_data (GstByteArrayInterface *self, const guint8 *data, gsize size)

  guint8 *ptr = gst_byte_array_interface_append (self, size);
  if (ptr == NULL)
    return FALSE;
  memcpy (ptr, data, size);
  return TRUE;
 }

// === Konventiert am: 13-9-24 16:14:15 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}

procedure gst_byte_array_interface_init(self: PGstByteArrayInterface);
begin
  FillChar(self, SizeOf(TGstByteArrayInterface), 0);
end;

function gst_byte_array_interface_set_size(self: PGstByteArrayInterface; len: Tgsize): Tgboolean;
begin
  if (self^.resize = nil) or (not self^.resize(self, len)) then begin
    exit(False);
  end;
  self^.len := len;
  Result := True;
end;

function gst_byte_array_interface_append(self: PGstByteArrayInterface; size: Tgsize): Pguint8;
var
  orig: Tgsize;
begin
  orig := self^.len;
  if not gst_byte_array_interface_set_size(self, self^.len + size) then begin
    exit(nil);
  end;
  Result := self^.Data + orig;
end;

{ xxxxxxxxxxxxxxxxxxxxxx }

function gst_byte_array_interface_append_data(self: PGstByteArrayInterface; Data: Pguint8; size: Tgsize): Tgboolean;
var
  ptr: Pguint8;
begin
  ptr := gst_byte_array_interface_append(self, size);
  if ptr = nil then begin
    Exit(False);
  end;
  Move(Data, ptr, size);   // ???
  Result := True;
end;



{$ENDIF read_implementation}
