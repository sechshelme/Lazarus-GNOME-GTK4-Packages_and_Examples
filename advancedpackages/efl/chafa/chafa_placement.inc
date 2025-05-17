{$IFDEF read_interface}

type
  TChafaPlacement = record
  end;
  PChafaPlacement = ^TChafaPlacement;

function chafa_placement_new(image: PChafaImage; id: Tgint): PChafaPlacement; cdecl; external libchafa;
procedure chafa_placement_ref(placement: PChafaPlacement); cdecl; external libchafa;
procedure chafa_placement_unref(placement: PChafaPlacement); cdecl; external libchafa;
function chafa_placement_get_tuck(placement: PChafaPlacement): TChafaTuck; cdecl; external libchafa;
procedure chafa_placement_set_tuck(placement: PChafaPlacement; tuck: TChafaTuck); cdecl; external libchafa;
function chafa_placement_get_halign(placement: PChafaPlacement): TChafaAlign; cdecl; external libchafa;
procedure chafa_placement_set_halign(placement: PChafaPlacement; align: TChafaAlign); cdecl; external libchafa;
function chafa_placement_get_valign(placement: PChafaPlacement): TChafaAlign; cdecl; external libchafa;
procedure chafa_placement_set_valign(placement: PChafaPlacement; align: TChafaAlign); cdecl; external libchafa;

// === Konventiert am: 29-1-25 19:06:55 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
