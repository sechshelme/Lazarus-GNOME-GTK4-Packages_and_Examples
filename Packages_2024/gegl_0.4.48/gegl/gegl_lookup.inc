

  {$IFDEF read_enum}
const
  GEGL_LOOKUP_MAX_ENTRIES = 819200;
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  TGeglLookupFunction = function(value: Tgfloat; data: Tgpointer): Tgfloat; cdecl;

  PGeglLookup = ^TGeglLookup;
  TGeglLookup = record
    _function: TGeglLookupFunction;
    data: Tgpointer;
    shift: Tgint;
    positive_min: Tguint32;
    positive_max: Tguint32;
    negative_min: Tguint32;
    negative_max: Tguint32;
    bitmask: array[0..(GEGL_LOOKUP_MAX_ENTRIES div 32) - 1] of Tguint32;
    table: Pgfloat;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gegl_lookup_new_full(_function: TGeglLookupFunction; data: Tgpointer; start: Tgfloat; end_: Tgfloat; precision: Tgfloat): PGeglLookup; cdecl; external libgegl;
function gegl_lookup_new(_function: TGeglLookupFunction; data: Tgpointer): PGeglLookup; cdecl; external libgegl;
procedure gegl_lookup_free(lookup: PGeglLookup); cdecl; external libgegl;
{$ENDIF read_function}

// === Konventiert am: 12-8-26 15:11:58 ===



{$IFDEF read_implementation}



{$ENDIF read_implementation}
