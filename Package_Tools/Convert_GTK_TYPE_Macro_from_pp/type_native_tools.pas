unit TYPE_Native_Tools;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils;

procedure ConvertTYPE;

implementation

uses
  Unit1;

procedure ConvertTYPE;
var
  i: integer;
  index: integer = 0;
  s, sUp, sLow, sMix: string;
  saUpCase, saLowCase, saMixCase: TAnsiStringArray;
  sl: TStringList;
begin
  //  Edit1.Text := 'GTK_COLUMN_VIEW_COLUMN';  // Als test

  sl := TStringList.Create;

  s := Form1.Edit1.Text;
  saUpCase := s.Split('_');
  if Length(saUpCase) < 2 then begin
    exit;
  end;

  // UpCase
  sUp := '';
  for i := 1 to Length(saUpCase) - 1 do begin
    sUp += saUpCase[i] + '_';
  end;
  Delete(sUp, Length(sUp), 1);

  // LowCase
  SetLength(saLowCase, Length(saUpCase));
  for i := 0 to Length(saLowCase) - 1 do begin
    saLowCase[i] := LowerCase(saUpCase[i]);
  end;

  sLow := '';
  for i := 1 to Length(saLowCase) - 1 do begin
    sLow += saLowCase[i] + '_';
  end;
  Delete(sLow, Length(sLow), 1);

  // MixCase
  SetLength(saMixCase, Length(saUpCase));
  for i := 0 to Length(saMixCase) - 1 do begin
    saMixCase[i] := LowerCase(saUpCase[i]);
  end;
  saMixCase[0][1] := UpCase(saMixCase[0][1]);

  sMix := '';
  for i := 1 to Length(saLowCase) - 1 do begin
    s := saLowCase[i];
    s[1] := UpCase(s[1]);
    sMix += s;
  end;

  sl.Add('');
  sl.Add('implementation');
  sl.Add('');


  if Form1.CheckBox1.Checked then begin;
    s := 'function ' + saUpCase[0] + '_TYPE_' + sUp + ': TGType;';
    sl.Insert(index, s);
    sl.Add(s);
    sl.Add('begin');
    sl.Add('  Result := ' + saLowCase[0] + '_' + sLow + '_get_type;');
    sl.Add('end;');
    sl.Add('');
    Inc(index);
  end;

  if Form1.CheckBox2.Checked then begin;
    s := 'function ' + saUpCase[0] + '_' + sUp + '(obj: Pointer): P' + saMixCase[0] + sMix + ';';
    sl.Insert(index, s);
    sl.Add(s);
    sl.Add('begin');
    sl.Add('  Result := P' + saMixCase[0] + sMix + '(g_type_check_instance_cast(obj, ' + saUpCase[0] + '_TYPE_' + sUp + '));');
    sl.Add('end;');
    sl.Add('');
    Inc(index);
  end;

  if Form1.CheckBox3.Checked then begin;
    s := 'function ' + saUpCase[0] + '_' + sUp + '_CLASS(klass: Pointer): P' + saMixCase[0] + sMix + 'Class;';
    sl.Insert(index, s);
    sl.Add(s);
    sl.Add('begin');
    sl.Add('  Result := P' + saMixCase[0] + sMix + 'Class(g_type_check_class_cast(klass, ' + saUpCase[0] + '_TYPE_' + sUp + '));');
    sl.Add('end;');
    sl.Add('');
    Inc(index);
  end;

  if Form1.CheckBox4.Checked then begin;
    s := 'function ' + saUpCase[0] + '_IS_' + sUp + '(obj: Pointer): Tgboolean;';
    sl.Insert(index, s);
    sl.Add(s);
    sl.Add('begin');
    sl.Add('  Result := g_type_check_instance_is_a(obj, ' + saUpCase[0] + '_TYPE_' + sUp + ');');
    sl.Add('end;');
    sl.Add('');
    Inc(index);
  end;

  if Form1.CheckBox5.Checked then begin;
    s := 'function ' + saUpCase[0] + '_IS_' + sUp + '_CLASS(klass: Pointer): Tgboolean;';
    sl.Insert(index, s);
    sl.Add(s);
    sl.Add('begin');
    sl.Add('  Result := g_type_check_class_is_a(klass, ' + saUpCase[0] + '_TYPE_' + sUp + ');');
    sl.Add('end;');
    sl.Add('');
    Inc(index);
  end;

  if Form1.CheckBox6.Checked then begin;
    s := 'function ' + saUpCase[0] + '_' + sUp + '_GET_CLASS(obj: Pointer): P' + saMixCase[0] + sMix + 'Class;';
    sl.Insert(index, s);
    sl.Add(s);
    sl.Add('begin');
    sl.Add('  Result := P' + saMixCase[0] + sMix + 'Class(PGTypeInstance(obj)^.g_class);');
    sl.Add('end;');
    sl.Add('');
    Inc(index);
  end;

  if Form1.CheckBox7.Checked then begin;
    s := 'function ' + saUpCase[0] + '_' + sUp + '_GET_IFACE(inst: Pointer): P' + saMixCase[0] + sMix + 'Interface;';
    sl.Insert(index, s);
    sl.Add(s);
    sl.Add('begin');
    sl.Add('  Result := g_type_interface_peek(inst, ' + saUpCase[0] + '_TYPE_' + sUp + ');');;
    sl.Add('end;');
    sl.Add('');
    Inc(index);
  end;

  Form1.Memo1.Lines := sl;
  sl.Free;
end;


end.
