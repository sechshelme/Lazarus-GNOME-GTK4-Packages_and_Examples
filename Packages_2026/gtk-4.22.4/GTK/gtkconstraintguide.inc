

  {$IFDEF read_struct}
type
  PGtkConstraintGuide = type Pointer;

  TGtkConstraintGuideClass = record
    parent_class: TGObjectClass;
  end;
  PGtkConstraintGuideClass = ^TGtkConstraintGuideClass;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_constraint_guide_get_type: TGType; cdecl; external libgtk4;
function gtk_constraint_guide_new: PGtkConstraintGuide; cdecl; external libgtk4;
procedure gtk_constraint_guide_set_min_size(guide: PGtkConstraintGuide; width: longint; height: longint); cdecl; external libgtk4;
procedure gtk_constraint_guide_get_min_size(guide: PGtkConstraintGuide; width: Plongint; height: Plongint); cdecl; external libgtk4;
procedure gtk_constraint_guide_set_nat_size(guide: PGtkConstraintGuide; width: longint; height: longint); cdecl; external libgtk4;
procedure gtk_constraint_guide_get_nat_size(guide: PGtkConstraintGuide; width: Plongint; height: Plongint); cdecl; external libgtk4;
procedure gtk_constraint_guide_set_max_size(guide: PGtkConstraintGuide; width: longint; height: longint); cdecl; external libgtk4;
procedure gtk_constraint_guide_get_max_size(guide: PGtkConstraintGuide; width: Plongint; height: Plongint); cdecl; external libgtk4;
function gtk_constraint_guide_get_strength(guide: PGtkConstraintGuide): TGtkConstraintStrength; cdecl; external libgtk4;
procedure gtk_constraint_guide_set_strength(guide: PGtkConstraintGuide; strength: TGtkConstraintStrength); cdecl; external libgtk4;
procedure gtk_constraint_guide_set_name(guide: PGtkConstraintGuide; name: pchar); cdecl; external libgtk4;
function gtk_constraint_guide_get_name(guide: PGtkConstraintGuide): pchar; cdecl; external libgtk4;

// === Konventiert am: 6-7-26 14:08:52 ===

function GTK_TYPE_CONSTRAINT_GUIDE: TGType;
function GTK_CONSTRAINT_GUIDE(obj: Pointer): PGtkConstraintGuide;
function GTK_IS_CONSTRAINT_GUIDE(obj: Pointer): Tgboolean;
{$ENDIF read_function}


{$IFDEF read_implementation}

function GTK_TYPE_CONSTRAINT_GUIDE: TGType;
begin
  Result := gtk_constraint_guide_get_type;
end;

function GTK_CONSTRAINT_GUIDE(obj: Pointer): PGtkConstraintGuide;
begin
  Result := PGtkConstraintGuide(g_type_check_instance_cast(obj, GTK_TYPE_CONSTRAINT_GUIDE));
end;

function GTK_IS_CONSTRAINT_GUIDE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_CONSTRAINT_GUIDE);
end;

{$ENDIF read_implementation}
