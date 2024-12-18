unit G_DECLARE_Tools;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils;

type
  T_G_DECLARE = (
    is_G_DECLARE_none = -1,
    is_G_DECLARE_FINAL_TYPE,
    is_G_DECLARE_DERIVABLE_TYPE,
    is_G_DECLARE_INTERFACE,
    is_GDK_DECLARE_INTERNAL_TYPE,
    is_GES_DECLARE_TYPE);

var
  G_DECLARE: T_G_DECLARE;
  Str_G_DECLARE_INTERFACE: string;

var
  G_DECLARE_define_Count: integer = 0;

function Find_G_DECLARE(sl: TStringList): T_G_DECLARE;
function ConvertSLMacro_from_G_DECLARE: TStringList;



implementation

function Find_G_DECLARE(sl: TStringList): T_G_DECLARE;
var
  i, j: integer;
  declare: TStringArray = (
    ('G_DECLARE_FINAL_TYPE'),
    ('G_DECLARE_DERIVABLE_TYPE'),
    ('G_DECLARE_INTERFACE'),
    ('GDK_DECLARE_INTERNAL_TYPE'),
    ('GES_DECLARE_TYPE'));
begin
  Result := is_G_DECLARE_none;
  Str_G_DECLARE_INTERFACE := '';
  for j := 0 to Length(declare) - 1 do begin
    for  i := 0 to sl.Count - 1 do begin
      if pos(declare[j], sl[i]) > 0 then begin
        Str_G_DECLARE_INTERFACE := sl[i];
        Result := T_G_DECLARE(j);
        Break;
      end;
    end;
  end;
end;

function ConvertSLMacro_from_G_DECLARE: TStringList;
  // {G_DECLARE_FINAL_TYPE      (GtkFontDialog,      gtk_font_dialog,      GTK, FONT_DIALOG,      GObject)};     // Einfach
  // {G_DECLARE_DERIVABLE_TYPE  (GtkFilter,          gtk_filter,           GTK, FILTER,           GObject) }     // Komplett
  // {G_DECLARE_INTERFACE       (GtkNative,          gtk_native,           GTK, NATIVE,           GtkWidget)};   // Interface
  // {GDK_DECLARE_INTERNAL_TYPE (GtkMnemonicTrigger, gtk_mnemonic_trigger, GTK, MNEMONIC_TRIGGER, GtkShortcutTrigger) }

  // {GES_DECLARE_TYPE          (Timeline,           timeline,                  TIMELINE) };
var
  sa: TAnsiStringArray;
  i: integer;
begin
  Result := TStringList.Create;

  Str_G_DECLARE_INTERFACE := StringReplace(Str_G_DECLARE_INTERFACE, '{', '', [rfReplaceAll]);
  Str_G_DECLARE_INTERFACE := StringReplace(Str_G_DECLARE_INTERFACE, ' ', '', [rfReplaceAll]);

  sa := Str_G_DECLARE_INTERFACE.Split([',', '(', ')']);
  if G_DECLARE = is_GES_DECLARE_TYPE then begin
    sa[1] := 'GES' + sa[1];
    sa[2] := 'ges_' + sa[2];
    Insert('GES', sa, 3);
  end;

  case G_DECLARE of
    is_G_DECLARE_none: begin
      G_DECLARE_define_Count := 0;
    end;
    is_G_DECLARE_FINAL_TYPE: begin
      G_DECLARE_define_Count := 3;
    end;
    is_G_DECLARE_DERIVABLE_TYPE: begin
      G_DECLARE_define_Count := 6;
    end;
    is_G_DECLARE_INTERFACE: begin
      G_DECLARE_define_Count := 4;
    end;
    is_GDK_DECLARE_INTERNAL_TYPE: begin
      G_DECLARE_define_Count := 6;
    end;
    is_GES_DECLARE_TYPE: begin
      G_DECLARE_define_Count := 6;
    end;
  end;

  for i := 0 to Length(sa) - 1 do begin
    WriteLn(i: 2, '  ', sa[i]);
  end;
  WriteLn();
  Result.Add('function ' + sa[3] + '_TYPE_' + sa[4] + ': TGType;');
  Result.Add('begin');
  Result.Add('  Result := ' + sa[2] + '_get_type;');
  Result.Add('end;');
  Result.Add('');

  Result.Add('function ' + sa[3] + '_' + sa[4] + '(obj: Pointer): P' + sa[1] + ';');
  Result.Add('begin');
  Result.Add('  Result := P' + sa[1] + '(g_type_check_instance_cast(obj, ' + sa[3] + '_TYPE_' + sa[4] + '));');
  Result.Add('end;');
  Result.Add('');

  Result.Add('function ' + sa[3] + '_IS_' + sa[4] + '(obj: Pointer): Tgboolean;');
  Result.Add('begin');
  Result.Add('  Result := g_type_check_instance_is_a(obj, ' + sa[3] + '_TYPE_' + sa[4] + ');');
  Result.Add('end;');
  Result.Add('');

  if G_DECLARE in [is_G_DECLARE_DERIVABLE_TYPE, is_GDK_DECLARE_INTERNAL_TYPE, is_GES_DECLARE_TYPE] then begin
    Result.Add('function ' + sa[3] + '_' + sa[4] + '_CLASS(klass: Pointer): P' + sa[1] + 'Class;');
    Result.Add('begin');
    Result.Add('  Result := P' + sa[1] + 'Class(g_type_check_class_cast(klass, ' + sa[3] + '_TYPE_' + sa[4] + '));');
    Result.Add('end;');
    Result.Add('');

    Result.Add('function ' + sa[3] + '_IS_' + sa[4] + '_CLASS(klass: Pointer): Tgboolean;');
    Result.Add('begin');
    Result.Add('  Result := g_type_check_class_is_a(klass, ' + sa[3] + '_TYPE_' + sa[4] + ');');
    Result.Add('end;');
    Result.Add('');

    Result.Add('function ' + sa[3] + '_' + sa[4] + '_GET_CLASS(obj: Pointer): P' + sa[1] + 'Class;');
    Result.Add('begin');
    Result.Add('  Result := P' + sa[1] + 'Class(PGTypeInstance(obj)^.g_class);');
    Result.Add('end;');
    Result.Add('');
  end;

  if G_DECLARE = is_G_DECLARE_INTERFACE then begin
    Result.Add('function ' + sa[3] + '_' + sa[4] + '_GET_IFACE(obj: Pointer): P' + sa[1] + 'Interface;');
    Result.Add('begin');

    Result.Add('  Result := g_type_interface_peek(obj, ' + sa[3] + '_TYPE_' + sa[4] + ');');

    Result.Add('end;');
    Result.Add('');
  end;

  Result.Add('type ');
  if G_DECLARE = is_G_DECLARE_FINAL_TYPE then begin
    Result.Add('  T' + sa[1] + ' = record');
    Result.Add('  end;');
    Result.Add('  P' + sa[1] + ' = ^T' + sa[1] + ';');
    Result.Add('');

    Result.Add('  T' + sa[1] + 'Class = record');
    Result.Add('    parent_class: T' + sa[5] + 'Class;');
    Result.Add('  end;');
    Result.Add('  P' + sa[1] + 'Class = ^T' + sa[1] + 'Class;');
    Result.Add('');
  end;
  if G_DECLARE = is_G_DECLARE_DERIVABLE_TYPE then begin
    Result.Add('  T' + sa[1] + ' = record');
    Result.Add('    parent_instance: T' + sa[5]);
    Result.Add('  end;');
    Result.Add('  P' + sa[1] + ' = ^T' + sa[1] + ';');
    Result.Add('');

    Result.Add('  T' + sa[1] + 'Class = record');
    Result.Add('  end;');
    Result.Add('  P' + sa[1] + 'Class = ^T' + sa[1] + 'Class;');
    Result.Add('');
  end;
  if G_DECLARE = is_G_DECLARE_INTERFACE then begin
    Result.Add('  T' + sa[1] + ' = record');
    Result.Add('  end;');
    Result.Add('  P' + sa[1] + ' = ^T' + sa[1] + ';');
    Result.Add('');

    Result.Add('  T' + sa[1] + 'Interface = record');
    Result.Add('  end;');
    Result.Add('  P' + sa[1] + 'Interface = ^T' + sa[1] + 'Interface;');
    Result.Add('');
  end;
  if G_DECLARE = is_GDK_DECLARE_INTERNAL_TYPE then begin
    Result.Add('  T' + sa[1] + ' = record');
    Result.Add('  end;');
    Result.Add('  P' + sa[1] + ' = ^T' + sa[1] + ';');
    Result.Add('');

    Result.Add('  T' + sa[1] + 'Class = record');
    Result.Add('  end;');
    Result.Add('  P' + sa[1] + 'Class = ^T' + sa[1] + 'Class;');
    Result.Add('');
  end;
  if G_DECLARE = is_GES_DECLARE_TYPE then begin
    Result.Add('  T' + sa[1] + 'Private = record');
    Result.Add('  end;');
    Result.Add('  P' + sa[1] + 'Private = ^T' + sa[1] + 'Private;');
    Result.Add('');
  end;

  Result.Add('function ' + sa[2] + '_get_type: TGType; cdecl; external libgxxxxxxx;');
  Result.Add('');
end;



end.
