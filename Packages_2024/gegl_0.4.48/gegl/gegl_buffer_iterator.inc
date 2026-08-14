

  {$IFDEF read_enum}
const
  GEGL_BUFFER_READ = GEGL_ACCESS_READ;
  GEGL_BUFFER_WRITE = GEGL_ACCESS_WRITE;
  GEGL_BUFFER_READWRITE = GEGL_ACCESS_READWRITE;
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PGeglBufferIteratorItem = ^TGeglBufferIteratorItem;
  TGeglBufferIteratorItem = record
    data: Tgpointer;
    roi: TGeglRectangle;
  end;

  PGeglBufferIteratorPriv = type Pointer;

  PGeglBufferIterator = ^TGeglBufferIterator;
  TGeglBufferIterator = record
    length: Tgint;
    priv: PGeglBufferIteratorPriv;
    items: PGeglBufferIteratorItem;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gegl_buffer_iterator_empty_new(max_slots: longint): PGeglBufferIterator; cdecl; external libgegl;
function gegl_buffer_iterator_new(buffer: PGeglBuffer; roi: PGeglRectangle; level: Tgint; format: PBabl; access_mode: TGeglAccessMode;
  abyss_policy: TGeglAbyssPolicy; max_slots: Tgint): PGeglBufferIterator; cdecl; external libgegl;
function gegl_buffer_iterator_add(iterator: PGeglBufferIterator; buffer: PGeglBuffer; roi: PGeglRectangle; level: Tgint; format: PBabl;
  access_mode: TGeglAccessMode; abyss_policy: TGeglAbyssPolicy): Tgint; cdecl; external libgegl;
procedure gegl_buffer_iterator_stop(iterator: PGeglBufferIterator); cdecl; external libgegl;
function gegl_buffer_iterator_next(iterator: PGeglBufferIterator): Tgboolean; cdecl; external libgegl;
{$ENDIF read_function}

// === Konventiert am: 12-8-26 14:48:11 ===



{$IFDEF read_implementation}



{$ENDIF read_implementation}
