unit macro;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils,
  Forms, Controls, StdCtrls, Dialogs, ExtCtrls,
  LazarusPackageIntf, SrcEditorIntf, MenuIntf;

procedure Register;

type
  TMacroForm = class(TForm)
    constructor CreateNew(TheOwner: TComponent; num: integer); override;
  private
    procedure btnClick(Sender: TObject);
    procedure CreateButton(x, y: integer; cap, macros_Str: pchar);
  public
  end;

implementation

constructor TMacroForm.CreateNew(TheOwner: TComponent; num: integer);
begin
  inherited CreateNew(TheOwner, 0);

  Left := Screen.Width div 3 * 2;
  Top := Screen.Height div 3 * 2;
  Width := 420;
  Height := 130;

  CreateButton(0, 0, 'IFDEF read_enum', '{$IFDEF read_enum}');
  CreateButton(1, 0, 'ENDIF read_enum', '{$ENDIF read_enum}');
  CreateButton(2, 0, 'DEFINE read_enum', '{$DEFINE read_enum}');
  CreateButton(3, 0, 'UNDEF read_enum', '{$UNDEF read_enum}');

  CreateButton(0, 1, 'IFDEF read_struct', '{$IFDEF read_struct}');
  CreateButton(1, 1, 'ENDIF read_struct', '{$ENDIF read_struct}');
  CreateButton(2, 1, 'DEFINE read_struct', '{$DEFINE read_struct}');
  CreateButton(3, 1, 'UNDEF read_struct', '{$UNDEF read_struct}');

  CreateButton(0, 2, 'IFDEF read_func', '{$IFDEF read_function}');
  CreateButton(1, 2, 'ENDIF read_func', '{$ENDIF read_function}');
  CreateButton(2, 2, 'DEFINE read_func', '{$DEFINE read_function}');
  CreateButton(3, 2, 'UNDEF read_func', '{$UNDEF read_function}');

  CreateButton(0, 3, 'IFDEF read_impl', '{$IFDEF read_implementation}');
  CreateButton(1, 3, 'ENDIF read_impl', '{$ENDIF read_implementation}');
  CreateButton(2, 3, 'DEFINE read_impl', '{$DEFINE read_implementation}');
  CreateButton(3, 3, 'UNDEF read_impl', '{$UNDEF read_implementation}');
end;

procedure TMacroForm.btnClick(Sender: TObject);
var
  Editor: TSourceEditorInterface;
begin
  Editor := SourceEditorManagerIntf.ActiveEditor;

  if Editor <> nil then  begin
    Editor.Selection := pchar(TComponent(Sender).Tag) + #10;
  end;
end;

procedure TMacroForm.CreateButton(x, y: integer; cap, macros_Str: pchar);
var
  btn: TButton;
begin
  btn := TButton.Create(Self);
  btn.Caption := cap;
  btn.Parent := Self;
  btn.Width := 100;
  btn.Left := x * 100 + 5;
  btn.Top := y * 25 + 5;

  btn.OnClick := @btnClick;
  btn.Tag := PtrInt(macros_Str);
end;

procedure ShowMacroDialog(Sender: TObject);
const
  form: TMacroForm = nil;
begin
  if form = nil then begin
    form := TMacroForm.CreateNew(nil, 0);
  end;
  form.Show;
end;

procedure Macro_Key_Register;
begin
  RegisterIdeMenuCommand(mnuTools, 'Create Macro', 'Create Macro...', nil, @ShowMacroDialog);
end;

procedure Register;
begin
  RegisterUnit('macro', @Macro_Key_Register);
end;

end.
