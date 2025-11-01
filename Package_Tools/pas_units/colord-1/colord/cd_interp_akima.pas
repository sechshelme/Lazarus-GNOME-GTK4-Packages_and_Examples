unit cd_interp_akima;

interface

uses
  fp_glib2, fp_colord, cd_interp;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



type
  TCdInterpAkimaClass = record
    parent_class: TCdInterpClass;
  end;
  PCdInterpAkimaClass = ^TCdInterpAkimaClass;

  TCdInterpAkima = record
    parent_instance: TCdInterp;
  end;
  PCdInterpAkima = ^TCdInterpAkima;

function cd_interp_akima_get_type: TGType; cdecl; external libcolord;
function cd_interp_akima_new: PCdInterp; cdecl; external libcolord;

// === Konventiert am: 1-11-25 16:07:41 ===

function CD_TYPE_INTERP_AKIMA: TGType;
function CD_INTERP_AKIMA(obj: Pointer): PCdInterpAkima;
function CD_IS_INTERP_AKIMA(obj: Pointer): Tgboolean;
function CD_INTERP_AKIMA_CLASS(klass: Pointer): PCdInterpAkimaClass;
function CD_IS_INTERP_AKIMA_CLASS(klass: Pointer): Tgboolean;
function CD_INTERP_AKIMA_GET_CLASS(obj: Pointer): PCdInterpAkimaClass;

implementation

function CD_TYPE_INTERP_AKIMA: TGType;
begin
  Result := cd_interp_akima_get_type;
end;

function CD_INTERP_AKIMA(obj: Pointer): PCdInterpAkima;
begin
  Result := PCdInterpAkima(g_type_check_instance_cast(obj, CD_TYPE_INTERP_AKIMA));
end;

function CD_IS_INTERP_AKIMA(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, CD_TYPE_INTERP_AKIMA);
end;

function CD_INTERP_AKIMA_CLASS(klass: Pointer): PCdInterpAkimaClass;
begin
  Result := PCdInterpAkimaClass(g_type_check_class_cast(klass, CD_TYPE_INTERP_AKIMA));
end;

function CD_IS_INTERP_AKIMA_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, CD_TYPE_INTERP_AKIMA);
end;

function CD_INTERP_AKIMA_GET_CLASS(obj: Pointer): PCdInterpAkimaClass;
begin
  Result := PCdInterpAkimaClass(PGTypeInstance(obj)^.g_class);
end;



end.
