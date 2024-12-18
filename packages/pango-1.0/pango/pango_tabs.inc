
{$IFDEF read_interface}

type
  PPPangoTabAlign = ^PPangoTabAlign;
  PPangoTabAlign = ^TPangoTabAlign;
  TPangoTabAlign = longint;

const
  PANGO_TAB_LEFT = 0;
  PANGO_TAB_RIGHT = 1;
  PANGO_TAB_CENTER = 2;
  PANGO_TAB_DECIMAL = 3;

type
  TPangoTabArray = record
  end;
  PPangoTabArray = ^TPangoTabArray;

function pango_tab_array_new(initial_size: Tgint; positions_in_pixels: Tgboolean): PPangoTabArray; cdecl; external libpango;
function pango_tab_array_new_with_positions(size: Tgint; positions_in_pixels: Tgboolean; first_alignment: TPangoTabAlign; first_position: Tgint): PPangoTabArray; varargs; cdecl; external libpango;
function pango_tab_array_get_type: TGType; cdecl; external libpango;
function pango_tab_array_copy(src: PPangoTabArray): PPangoTabArray; cdecl; external libpango;
procedure pango_tab_array_free(tab_array: PPangoTabArray); cdecl; external libpango;
function pango_tab_array_get_size(tab_array: PPangoTabArray): Tgint; cdecl; external libpango;
procedure pango_tab_array_resize(tab_array: PPangoTabArray; new_size: Tgint); cdecl; external libpango;
procedure pango_tab_array_set_tab(tab_array: PPangoTabArray; tab_index: Tgint; alignment: TPangoTabAlign; location: Tgint); cdecl; external libpango;
procedure pango_tab_array_get_tab(tab_array: PPangoTabArray; tab_index: Tgint; alignment: PPangoTabAlign; location: Pgint); cdecl; external libpango;
procedure pango_tab_array_get_tabs(tab_array: PPangoTabArray; alignments: PPPangoTabAlign; locations: PPgint); cdecl; external libpango;
function pango_tab_array_get_positions_in_pixels(tab_array: PPangoTabArray): Tgboolean; cdecl; external libpango;
procedure pango_tab_array_set_positions_in_pixels(tab_array: PPangoTabArray; positions_in_pixels: Tgboolean); cdecl; external libpango;
function pango_tab_array_to_string(tab_array: PPangoTabArray): pchar; cdecl; external libpango;
function pango_tab_array_from_string(Text: pchar): PPangoTabArray; cdecl; external libpango;
procedure pango_tab_array_set_decimal_point(tab_array: PPangoTabArray; tab_index: longint; decimal_point: Tgunichar); cdecl; external libpango;
function pango_tab_array_get_decimal_point(tab_array: PPangoTabArray; tab_index: longint): Tgunichar; cdecl; external libpango;
procedure pango_tab_array_sort(tab_array: PPangoTabArray); cdecl; external libpango;

// === Konventiert am: 26-11-24 15:44:27 ===

function PANGO_TYPE_TAB_ARRAY: TGType;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function PANGO_TYPE_TAB_ARRAY: TGType;
begin
  PANGO_TYPE_TAB_ARRAY := pango_tab_array_get_type;
end;



{$ENDIF read_implementation}
