
{$IFDEF read_struct}
type
  PGtkCssSection = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_css_section_get_type: TGType; cdecl; external libgtk4;
function gtk_css_section_new(_file: PGFile; start: PGtkCssLocation; _end: PGtkCssLocation): PGtkCssSection; cdecl; external libgtk4;
function gtk_css_section_new_with_bytes(_file: PGFile; bytes: PGBytes; start: PGtkCssLocation; end_: PGtkCssLocation): PGtkCssSection; cdecl; external libgtk4;
function gtk_css_section_ref(section: PGtkCssSection): PGtkCssSection; cdecl; external libgtk4;
procedure gtk_css_section_unref(section: PGtkCssSection); cdecl; external libgtk4;
procedure gtk_css_section_print(section: PGtkCssSection; _string: PGString); cdecl; external libgtk4;
function gtk_css_section_to_string(section: PGtkCssSection): pchar; cdecl; external libgtk4;
function gtk_css_section_get_parent(section: PGtkCssSection): PGtkCssSection; cdecl; external libgtk4;
function gtk_css_section_get_file(section: PGtkCssSection): PGFile; cdecl; external libgtk4;
function gtk_css_section_get_start_location(section: PGtkCssSection): PGtkCssLocation; cdecl; external libgtk4;
function gtk_css_section_get_end_location(section: PGtkCssSection): PGtkCssLocation; cdecl; external libgtk4;

// === Konventiert am: 2-8-24 19:06:13 ===

function GTK_TYPE_CSS_SECTION: TGType;
{$ENDIF read_function}


{$IFDEF read_implementation}

function GTK_TYPE_CSS_SECTION: TGType;
begin
  GTK_TYPE_CSS_SECTION := gtk_css_section_get_type;
end;



{$ENDIF read_implementation}
