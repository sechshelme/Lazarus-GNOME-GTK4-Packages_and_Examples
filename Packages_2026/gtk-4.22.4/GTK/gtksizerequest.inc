

  {$IFDEF read_struct}
type
  PGtkRequestedSize = ^TGtkRequestedSize;
  TGtkRequestedSize = record
    data: Tgpointer;
    minimum_size: longint;
    natural_size: longint;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_distribute_natural_allocation(extra_space: longint; n_requested_sizes: Tguint; sizes: PGtkRequestedSize): longint; cdecl; external libgtk4;
{$ENDIF read_function}

// === Konventiert am: 6-7-26 17:10:18 ===



{$IFDEF read_implementation}



{$ENDIF read_implementation}
