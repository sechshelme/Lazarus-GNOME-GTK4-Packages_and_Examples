

  {$IFDEF read_struct}
type
  PGstByteArrayInterface = ^TGstByteArrayInterface;
  TGstByteArrayInterface = record
    data: Pguint8;
    len: Tgsize;
    resize: function(self: PGstByteArrayInterface; length: Tgsize): Tgboolean; cdecl;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
procedure gst_byte_array_interface_init(self: PGstByteArrayInterface);
function gst_byte_array_interface_set_size(self: PGstByteArrayInterface; len: Tgsize): Tgboolean;
function gst_byte_array_interface_append(self: PGstByteArrayInterface; size: Tgsize): Pguint8;
function gst_byte_array_interface_append_data(self: PGstByteArrayInterface; Data: Pguint8; size: Tgsize): Tgboolean;
{$ENDIF read_function}

// === Konventiert am: 10-7-26 19:46:31 ===



{$IFDEF read_implementation}

procedure gst_byte_array_interface_init(self: PGstByteArrayInterface); inline;
begin
  FillChar(self^, SizeOf(TGstByteArrayInterface), 0);
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
  Result := Pguint8(pbyte(self^.Data) + orig);
end;

function gst_byte_array_interface_append_data(self: PGstByteArrayInterface; Data: Pguint8; size: Tgsize): Tgboolean;
var
  ptr: Pguint8;
begin
  ptr := gst_byte_array_interface_append(self, size);
  if ptr = nil then begin
    Exit(False);
  end;
  Move(Data^, ptr^, size);
  Result := True;
end;

{$ENDIF read_implementation}
