
{$IFDEF read_struct}
type
  PGtkPaperSize = type Pointer;
  {$ENDIF read_struct}

  {$IFDEF read_enum}
const
  GTK_PAPER_NAME_A3 = 'iso_a3';
  GTK_PAPER_NAME_A4 = 'iso_a4';
  GTK_PAPER_NAME_A5 = 'iso_a5';
  GTK_PAPER_NAME_B5 = 'iso_b5';
  GTK_PAPER_NAME_LETTER = 'na_letter';
  GTK_PAPER_NAME_EXECUTIVE = 'na_executive';
  GTK_PAPER_NAME_LEGAL = 'na_legal';
  {$ENDIF read_enum}

{$IFDEF read_function}
function gtk_paper_size_get_type: TGType; cdecl; external libgtk4;
function gtk_paper_size_new(name: pchar): PGtkPaperSize; cdecl; external libgtk4;
function gtk_paper_size_new_from_ppd(ppd_name: pchar; ppd_display_name: pchar; width: double; height: double): PGtkPaperSize; cdecl; external libgtk4;
function gtk_paper_size_new_from_ipp(ipp_name: pchar; width: double; height: double): PGtkPaperSize; cdecl; external libgtk4;
function gtk_paper_size_new_custom(name: pchar; display_name: pchar; width: double; height: double; unit_: TGtkUnit): PGtkPaperSize; cdecl; external libgtk4;
function gtk_paper_size_copy(other: PGtkPaperSize): PGtkPaperSize; cdecl; external libgtk4;
procedure gtk_paper_size_free(size: PGtkPaperSize); cdecl; external libgtk4;
function gtk_paper_size_is_equal(size1: PGtkPaperSize; size2: PGtkPaperSize): Tgboolean; cdecl; external libgtk4;
function gtk_paper_size_get_paper_sizes(include_custom: Tgboolean): PGList; cdecl; external libgtk4;
function gtk_paper_size_get_name(size: PGtkPaperSize): pchar; cdecl; external libgtk4;
function gtk_paper_size_get_display_name(size: PGtkPaperSize): pchar; cdecl; external libgtk4;
function gtk_paper_size_get_ppd_name(size: PGtkPaperSize): pchar; cdecl; external libgtk4;
function gtk_paper_size_get_width(size: PGtkPaperSize; unit_: TGtkUnit): double; cdecl; external libgtk4;
function gtk_paper_size_get_height(size: PGtkPaperSize; unit_: TGtkUnit): double; cdecl; external libgtk4;
function gtk_paper_size_is_custom(size: PGtkPaperSize): Tgboolean; cdecl; external libgtk4;
function gtk_paper_size_is_ipp(size: PGtkPaperSize): Tgboolean; cdecl; external libgtk4;
procedure gtk_paper_size_set_size(size: PGtkPaperSize; width: double; height: double; unit_: TGtkUnit); cdecl; external libgtk4;
function gtk_paper_size_get_default_top_margin(size: PGtkPaperSize; unit_: TGtkUnit): double; cdecl; external libgtk4;
function gtk_paper_size_get_default_bottom_margin(size: PGtkPaperSize; unit_: TGtkUnit): double; cdecl; external libgtk4;
function gtk_paper_size_get_default_left_margin(size: PGtkPaperSize; unit_: TGtkUnit): double; cdecl; external libgtk4;
function gtk_paper_size_get_default_right_margin(size: PGtkPaperSize; unit_: TGtkUnit): double; cdecl; external libgtk4;
function gtk_paper_size_get_default: pchar; cdecl; external libgtk4;
function gtk_paper_size_new_from_key_file(key_file: PGKeyFile; group_name: pchar; error: PPGError): PGtkPaperSize; cdecl; external libgtk4;
procedure gtk_paper_size_to_key_file(size: PGtkPaperSize; key_file: PGKeyFile; group_name: pchar); cdecl; external libgtk4;
function gtk_paper_size_new_from_gvariant(variant: PGVariant): PGtkPaperSize; cdecl; external libgtk4;
function gtk_paper_size_to_gvariant(paper_size: PGtkPaperSize): PGVariant; cdecl; external libgtk4;

// === Konventiert am: 9-7-26 17:18:55 ===

function GTK_TYPE_PAPER_SIZE: TGType;
{$ENDIF read_function}

{$IFDEF read_implementation}

function GTK_TYPE_PAPER_SIZE: TGType;
begin
  GTK_TYPE_PAPER_SIZE := gtk_paper_size_get_type;
end;

{$ENDIF read_implementation}
