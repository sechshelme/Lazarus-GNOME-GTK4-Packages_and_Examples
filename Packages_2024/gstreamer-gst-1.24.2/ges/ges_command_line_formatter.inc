{$IFDEF read_interface}

  {GES_DECLARE_TYPE (CommandLineFormatter, command_line_formatter, COMMAND_LINE_FORMATTER); }
type
  TGESCommandLineFormatterPrivate = record
  end;
  PGESCommandLineFormatterPrivate = ^TGESCommandLineFormatterPrivate;

  TGESCommandLineFormatterClass = record
    parent_class: TGESFormatterClass;
  end;
  PGESCommandLineFormatterClass = ^TGESCommandLineFormatterClass;

  TGESCommandLineFormatter = record
    parent_instance: TGESFormatter;
    priv: PGESCommandLineFormatterPrivate;
  end;
  PGESCommandLineFormatter = ^TGESCommandLineFormatter;

function ges_command_line_formatter_get_type: TGType; cdecl; external libges;
function ges_command_line_formatter_get_help(nargs: Tgint; commands: PPgchar): Pgchar; cdecl; external libges;
function ges_command_line_formatter_get_timeline_uri(timeline: PGESTimeline): Pgchar; cdecl; external libges;

// === Konventiert am: 13-12-24 16:37:48 ===

function GES_TYPE_COMMAND_LINE_FORMATTER: TGType;
function GES_COMMAND_LINE_FORMATTER(obj: Pointer): PGESCommandLineFormatter;
function GES_IS_COMMAND_LINE_FORMATTER(obj: Pointer): Tgboolean;
function GES_COMMAND_LINE_FORMATTER_CLASS(klass: Pointer): PGESCommandLineFormatterClass;
function GES_IS_COMMAND_LINE_FORMATTER_CLASS(klass: Pointer): Tgboolean;
function GES_COMMAND_LINE_FORMATTER_GET_CLASS(obj: Pointer): PGESCommandLineFormatterClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

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




{$ENDIF read_implementation}
