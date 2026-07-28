unit ges_command_line_formatter;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gst, ges_enums, ges_types, ges_formatter;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  PGESCommandLineFormatter = type Pointer;

  PGESCommandLineFormatterClass = ^TGESCommandLineFormatterClass;
  TGESCommandLineFormatterClass = record
    parent_class: TGESFormatterClass;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function ges_command_line_formatter_get_type: TGType; cdecl; external libges;
function ges_command_line_formatter_get_help(nargs: Tgint; commands: PPgchar): Pgchar; cdecl; external libges;
function ges_command_line_formatter_get_timeline_uri(timeline: PGESTimeline): Pgchar; cdecl; external libges;

// === Konventiert am: 27-7-26 19:55:17 ===

function GES_TYPE_COMMAND_LINE_FORMATTER: TGType;
function GES_COMMAND_LINE_FORMATTER(obj: Pointer): PGESCommandLineFormatter;
function GES_IS_COMMAND_LINE_FORMATTER(obj: Pointer): Tgboolean;
function GES_COMMAND_LINE_FORMATTER_CLASS(klass: Pointer): PGESCommandLineFormatterClass;
function GES_IS_COMMAND_LINE_FORMATTER_CLASS(klass: Pointer): Tgboolean;
function GES_COMMAND_LINE_FORMATTER_GET_CLASS(obj: Pointer): PGESCommandLineFormatterClass;
{$ENDIF read_function}

implementation

function GES_TYPE_COMMAND_LINE_FORMATTER: TGType;
begin
  Result := ges_command_line_formatter_get_type;
end;

function GES_COMMAND_LINE_FORMATTER(obj: Pointer): PGESCommandLineFormatter;
begin
  Result := PGESCommandLineFormatter(g_type_check_instance_cast(obj, GES_TYPE_COMMAND_LINE_FORMATTER));
end;

function GES_IS_COMMAND_LINE_FORMATTER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GES_TYPE_COMMAND_LINE_FORMATTER);
end;

function GES_COMMAND_LINE_FORMATTER_CLASS(klass: Pointer): PGESCommandLineFormatterClass;
begin
  Result := PGESCommandLineFormatterClass(g_type_check_class_cast(klass, GES_TYPE_COMMAND_LINE_FORMATTER));
end;

function GES_IS_COMMAND_LINE_FORMATTER_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GES_TYPE_COMMAND_LINE_FORMATTER);
end;

function GES_COMMAND_LINE_FORMATTER_GET_CLASS(obj: Pointer): PGESCommandLineFormatterClass;
begin
  Result := PGESCommandLineFormatterClass(PGTypeInstance(obj)^.g_class);
end;

end.
