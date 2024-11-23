/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 23-11-2024   13:43                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  TGUnixInputStreamPrivate = record
  end;
  PGUnixInputStreamPrivate = ^TGUnixInputStreamPrivate;

  TGUnixInputStream = record
    parent_instance: TGInputStream;
    priv: PGUnixInputStreamPrivate;
  end;
  PGUnixInputStream = ^TGUnixInputStream;

  TGUnixInputStreamClass = record
    parent_class: TGInputStreamClass;
    _g_reserved1: procedure; cdecl;
    _g_reserved2: procedure; cdecl;
    _g_reserved3: procedure; cdecl;
    _g_reserved4: procedure; cdecl;
    _g_reserved5: procedure; cdecl;
  end;
  PGUnixInputStreamClass = ^TGUnixInputStreamClass;

function g_unix_input_stream_get_type: TGType; cdecl; external libgio2;
function g_unix_input_stream_new(fd: Tgint; close_fd: Tgboolean): PGInputStream; cdecl; external libgio2;
procedure g_unix_input_stream_set_close_fd(stream: PGUnixInputStream; close_fd: Tgboolean); cdecl; external libgio2;
function g_unix_input_stream_get_close_fd(stream: PGUnixInputStream): Tgboolean; cdecl; external libgio2;
function g_unix_input_stream_get_fd(stream: PGUnixInputStream): Tgint; cdecl; external libgio2;

// === Konventiert am: 20-11-24 15:19:35 ===

function G_TYPE_UNIX_INPUT_STREAM: TGType;
function G_UNIX_INPUT_STREAM(obj: Pointer): PGUnixInputStream;
function G_UNIX_INPUT_STREAM_CLASS(klass: Pointer): PGUnixInputStreamClass;
function G_IS_UNIX_INPUT_STREAM(obj: Pointer): Tgboolean;
function G_IS_UNIX_INPUT_STREAM_CLASS(klass: Pointer): Tgboolean;
function G_UNIX_INPUT_STREAM_GET_CLASS(obj: Pointer): PGUnixInputStreamClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function G_TYPE_UNIX_INPUT_STREAM: TGType;
begin
  G_TYPE_UNIX_INPUT_STREAM := g_unix_input_stream_get_type;
end;

function G_UNIX_INPUT_STREAM(obj: Pointer): PGUnixInputStream;
begin
  Result := PGUnixInputStream(g_type_check_instance_cast(obj, G_TYPE_UNIX_INPUT_STREAM));
end;

function G_UNIX_INPUT_STREAM_CLASS(klass: Pointer): PGUnixInputStreamClass;
begin
  Result := PGUnixInputStreamClass(g_type_check_class_cast(klass, G_TYPE_UNIX_INPUT_STREAM));
end;

function G_IS_UNIX_INPUT_STREAM(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_UNIX_INPUT_STREAM);
end;

function G_IS_UNIX_INPUT_STREAM_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, G_TYPE_UNIX_INPUT_STREAM);
end;

function G_UNIX_INPUT_STREAM_GET_CLASS(obj: Pointer): PGUnixInputStreamClass;
begin
  Result := PGUnixInputStreamClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
