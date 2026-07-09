unit gtksectionmodel;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gtk4;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  TGtkSectionModel = record
  end;
  PGtkSectionModel = ^TGtkSectionModel;

  TGtkSectionModelInterface = record
    g_iface: TGTypeInterface;
    get_section: procedure(self: PGtkSectionModel; position: Tguint; out_start: Pguint; out_end: Pguint); cdecl;
  end;
  PGtkSectionModelInterface = ^TGtkSectionModelInterface;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_section_model_get_type: TGType; cdecl; external libgtk4;
procedure gtk_section_model_get_section(self: PGtkSectionModel; position: Tguint; out_start: Pguint; out_end: Pguint); cdecl; external libgtk4;
procedure gtk_section_model_sections_changed(self: PGtkSectionModel; position: Tguint; n_items: Tguint); cdecl; external libgtk4;

// === Konventiert am: 6-7-26 16:55:33 ===

function GTK_TYPE_SECTION_MODEL: TGType;
function GTK_SECTION_MODEL(obj: Pointer): PGtkSectionModel;
function GTK_IS_SECTION_MODEL(obj: Pointer): Tgboolean;
function GTK_SECTION_MODEL_GET_IFACE(obj: Pointer): PGtkSectionModelInterface;
{$ENDIF read_function}

implementation

function GTK_TYPE_SECTION_MODEL: TGType;
begin
  Result := gtk_section_model_get_type;
end;

function GTK_SECTION_MODEL(obj: Pointer): PGtkSectionModel;
begin
  Result := PGtkSectionModel(g_type_check_instance_cast(obj, GTK_TYPE_SECTION_MODEL));
end;

function GTK_IS_SECTION_MODEL(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_SECTION_MODEL);
end;

function GTK_SECTION_MODEL_GET_IFACE(obj: Pointer): PGtkSectionModelInterface;
begin
  Result := g_type_interface_peek(obj, GTK_TYPE_SECTION_MODEL);
end;

end.
