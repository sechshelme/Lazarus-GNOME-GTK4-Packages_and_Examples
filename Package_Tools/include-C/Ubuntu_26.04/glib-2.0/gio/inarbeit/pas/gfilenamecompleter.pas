unit gfilenamecompleter;

interface

uses
  fp_glib2, giotypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PGFilenameCompleterClass = ^TGFilenameCompleterClass;
  TGFilenameCompleterClass = record
    parent_class: TGObjectClass;
    got_completion_data: procedure(filename_completer: PGFilenameCompleter); cdecl;
    _g_reserved1: procedure; cdecl;
    _g_reserved2: procedure; cdecl;
    _g_reserved3: procedure; cdecl;
  end;

function g_filename_completer_get_type: TGType; cdecl; external libgio2;
function g_filename_completer_new: PGFilenameCompleter; cdecl; external libgio2;
function g_filename_completer_get_completion_suffix(completer: PGFilenameCompleter; initial_text: pchar): pchar; cdecl; external libgio2;
function g_filename_completer_get_completions(completer: PGFilenameCompleter; initial_text: pchar): PPchar; cdecl; external libgio2;
procedure g_filename_completer_set_dirs_only(completer: PGFilenameCompleter; dirs_only: Tgboolean); cdecl; external libgio2;

// === Konventiert am: 26-6-26 19:27:47 ===

function G_TYPE_FILENAME_COMPLETER: TGType;
function G_FILENAME_COMPLETER(obj: Pointer): PGFilenameCompleter;
function G_FILENAME_COMPLETER_CLASS(klass: Pointer): PGFilenameCompleterClass;
function G_IS_FILENAME_COMPLETER(obj: Pointer): Tgboolean;
function G_IS_FILENAME_COMPLETER_CLASS(klass: Pointer): Tgboolean;
function G_FILENAME_COMPLETER_GET_CLASS(obj: Pointer): PGFilenameCompleterClass;

implementation

function G_TYPE_FILENAME_COMPLETER: TGType;
begin
  G_TYPE_FILENAME_COMPLETER := g_filename_completer_get_type;
end;

function G_FILENAME_COMPLETER(obj: Pointer): PGFilenameCompleter;
begin
  Result := PGFilenameCompleter(g_type_check_instance_cast(obj, G_TYPE_FILENAME_COMPLETER));
end;

function G_FILENAME_COMPLETER_CLASS(klass: Pointer): PGFilenameCompleterClass;
begin
  Result := PGFilenameCompleterClass(g_type_check_class_cast(klass, G_TYPE_FILENAME_COMPLETER));
end;

function G_IS_FILENAME_COMPLETER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_FILENAME_COMPLETER);
end;

function G_IS_FILENAME_COMPLETER_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, G_TYPE_FILENAME_COMPLETER);
end;

function G_FILENAME_COMPLETER_GET_CLASS(obj: Pointer): PGFilenameCompleterClass;
begin
  Result := PGFilenameCompleterClass(PGTypeInstance(obj)^.g_class);
end;


end.
