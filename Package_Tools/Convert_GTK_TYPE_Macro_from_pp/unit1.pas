unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  Native_Tools, G_DECLARE_Tools;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    CheckBox7: TCheckBox;
    Convert: TButton;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    CheckGroup1: TCheckGroup;
    Edit1: TEdit;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    ListBox1: TListBox;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure ConvertClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RadioButton1Change(Sender: TObject);
    procedure RadioButton2Change(Sender: TObject);
  private
    SourcePath, DestPath: string;
    procedure Form1DropFiles(Sender: TObject; const FileNames: array of string);
    procedure Delete_Const(sl: TStringList);
  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

type
  TSource = record
    libs,
    units: string;
  end;
  TSources = array of TSource;

const
  Sources: TSources = (
    (libs: 'libglib2'; units: 'common_GLIB, gtypes'),
    (libs: 'libgobject2_0'; units: 'common_GLIB, gtypes'),
    (libs: 'libgio2'; units: 'common_GLIB, gtypes, gerror, gtype, giotypes, gobject, gioenums'),
    (libs: 'libgtk4'; units: 'glib2, common_GTK'),

    (libs: 'libgstreamer'; units: 'glib280, common_GST, gstobject'),
    (libs: 'libgstpbutils'; units: 'glib280, gst124'),
    (libs: 'libgstbase'; units: 'glib280, gst124'),
    (libs: 'libgstaudio'; units: 'glib280, gst124'),
    (libs: 'libgstvideo'; units: 'glib280, gst124'),
    (libs: 'libgstallocators'; units: 'glib280, gst124'),
    (libs: 'libgstanalytics'; units: 'glib280, gst124'),
    (libs: 'libgstcheck'; units: 'glib280, gst124'),
    (libs: 'libgstphotography'; units: 'glib280, gst124'),
    (libs: 'libgstmse'; units: 'glib280, gst124'),
    (libs: 'libgstinsertbin'; units: 'glib280, gst124'),
    (libs: 'libgstwebrtc'; units: 'glib280, gst124'),
    (libs: 'libgstwebrtcnice'; units: 'glib280, gst124'),
    (libs: 'libgstsdp'; units: 'glib280, gst124'),
    (libs: 'libgstmpegts'; units: 'glib280, gst124'),
    (libs: 'libgsttag'; units: 'glib280, gst124'),
    (libs: 'libgstfft'; units: 'glib280, gst124'),
    (libs: 'libgstcodecparsers'; units: 'glib280, gst124'),
    (libs: 'libgstcontroller'; units: 'glib280, gst124'),
    (libs: 'libgstrtp'; units: 'glib280, gst124'),
    (libs: 'libgstrtsp'; units: 'glib280, gst124'),
    (libs: 'libgstwayland'; units: 'glib280, gst124'),
    (libs: 'libgstva'; units: 'glib280, gst124'),
    (libs: 'libgstplayer'; units: 'glib280, gst124'),
    (libs: 'libgstgl'; units: 'glib280, gst124'),
    (libs: 'libgstvulkan'; units: 'glib280, gst124'),
    (libs: 'libgstnet'; units: 'glib280, gst124'),
    (libs: 'libgstcuda'; units: 'glib280, gst124'),
    (libs: 'libgstplay'; units: 'glib280, gst124'),
    (libs: 'libgstapp'; units: 'glib280, gst124'),
    (libs: 'libgstriff'; units: 'glib280, gst124'),
    (libs: 'libgsttranscoder'; units: 'glib280, gst124'),
    (libs: 'libgsturidownloader'; units: 'glib280, gst124'),
    (libs: 'libgstsctp'; units: 'glib280, gst124'),
    (libs: 'libgstopencv'; units: 'glib280, gst124'),
    (libs: 'libgstisoff'; units: 'glib280, gst124'),
    (libs: 'libgdk_pixbuf2'; units: 'glib280, gdk_pixbuf_core'),
    (libs: 'libgdk_pixbuf_xlib2'; units: 'glib280'),

    (libs: 'libpixman'; units: 'ctypes'),
    (libs: 'libgraphene'; units: 'ctypes, graphene'),
    (libs: 'libpango'; units: 'fp_cairo, fp_glib2'),
    (libs: 'libges'; units: 'fp_glib2, fp_gst, ges_enums, ges_types'),

    (libs: 'libharfbuzzgobject'; units: 'fp_glib2, hb_common'),
    (libs: 'libharfbuzzset'; units: 'fp_glib2, hb_common'),
    (libs: 'libharfbuzzcairo'; units: 'fp_glib2, hb_common'),
    (libs: 'libharfbuzzicu'; units: 'fp_glib2, hb_common'),
    (libs: 'libharfbuzz'; units: 'fp_glib2, hb_common'),

    (libs: 'libwebkit'; units: 'fp_glib2, fp_GTK4, WebKit'),
    (libs: 'libjavascriptcoregtk'; units: 'fp_glib2'),

    (libs: 'libadwaita'; units: 'fp_glib2, fp_GTK4'),
    (libs: 'libvte_2_91_gtk4 '; units: 'fp_glib2, fp_GTK4'),
    (libs: 'libgtksourceview5'; units: 'fp_glib2, fp_GTK4'),

    (libs: 'libxml2'; units: 'ctypes, xml2_common'),
    (libs: 'libmicrohttpd'; units: 'ctypes'),
    (libs: 'libchafa'; units: 'fp_glib2'),

    (libs: 'libtk8_6'; units: 'ctypes'),
    (libs: 'libtkstub8_6'; units: 'ctypes'),
    (libs: 'libtcl8_6'; units: 'ctypes'),
    (libs: 'libtclstub8_6'; units: 'ctypes'),

    (libs: 'libttommath'; units: 'ctypes'),
    (libs: 'libgmp'; units: 'ctypes'),


    (libs: 'libnewt'; units: 'ctypes'),
    (libs: 'libtickit'; units: 'ctypes'),
    (libs: 'libcdk'; units: 'ctypes, ncurses, cdk'),

    (libs: 'libsixel'; units: 'ctypes'),

    (libs: 'librtlsdr'; units: 'ctypes'),


    (libs: 'libevas'; units: 'ctypes, efl'),
    (libs: 'libeina'; units: 'ctypes, efl'),
    (libs: 'libeo'; units: 'ctypes, efl'),
    (libs: 'libefl'; units: 'efl, fp_eo, fp_eina'),
    (libs: 'libemile'; units: 'efl, fp_eo, fp_eina'),
    (libs: 'libecore'; units: 'efl, fp_eo, fp_eina, fp_efl'),
    (libs: 'libecore_file'; units: 'efl, fp_eo, fp_eina, fp_efl'),
    (libs: 'libecore_eva'; units: 'efl, fp_eo, fp_eina, fp_efl'),
    (libs: 'libedje'; units: 'efl, fp_eo, fp_eina, fp_efl, fp_evas'),
    (libs: 'libeet'; units: 'efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_edje'),
    (libs: 'libethumb'; units: 'efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_edje'),
    (libs: 'libelementary'; units: 'efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary'),
    (libs: 'libecore_con'; units: 'efl, fp_eo, fp_eina, fp_efl, fp_ecore'),
    (libs: 'libeldbus'; units: 'efl, fp_eo, fp_eina, fp_efl, fp_ecore'),
    (libs: 'libefreet'; units: 'efl, fp_eo, fp_eina, fp_efl, fp_ecore'),
    (libs: 'libemotion'; units: 'efl, fp_eo, fp_eina, fp_efl, fp_ecore'),
    (libs: 'libeio'; units: 'efl, fp_eo, fp_eina, fp_efl, fp_ecore'),
    (libs: 'libeeze'; units: 'efl, fp_eo, fp_eina, fp_efl, fp_ecore'),
    (libs: 'libeolian'; units: 'efl, fp_eo, fp_eina, fp_efl, fp_ecore'),
    (libs: 'libecore_audio'; units: 'efl, fp_eo, fp_eina, fp_efl, fp_ecore'),
    (libs: 'libecore_x'; units: 'efl, fp_eo, fp_eina, fp_efl, fp_ecore'),
    (libs: 'libefl_canvas_wl'; units: 'efl, fp_eo, fp_eina, fp_efl, fp_ecore'),
    (libs: 'libecore_drm2'; units: 'efl, fp_eo, fp_eina, fp_efl, fp_ecore'),
    (libs: 'libecore_fb'; units: 'efl, fp_eo, fp_eina, fp_efl, fp_ecore'),

    (libs: 'libecore_imf'; units: 'efl, fp_eo, fp_eina, fp_efl, fp_ecore'),
    (libs: 'libecore_imf_evas'; units: 'efl, fp_eo, fp_eina, fp_efl, fp_ecore'),
    (libs: 'libecore_input'; units: 'efl, fp_eo, fp_eina, fp_efl, fp_ecore'),
    (libs: 'libecore_input_evas'; units: 'efl, fp_eo, fp_eina, fp_efl, fp_ecore'),
    (libs: 'libecore_ipc'; units: 'efl, fp_eo, fp_eina, fp_efl, fp_ecore'),
    (libs: 'libecore_wl2'; units: 'efl, fp_eo, fp_eina, fp_efl, fp_ecore'),
    (libs: 'libelput'; units: 'efl, fp_eo, fp_eina, fp_efl, fp_ecore'),
    (libs: 'libembryo'; units: 'efl, fp_eo, fp_eina, fp_efl, fp_ecore'),
    (libs: 'libethumb_client'; units: 'efl, fp_eo, fp_eina, fp_efl, fp_ecore'),

    (libs: 'libshaderc'; units: 'ctypes'),
    (libs: 'libglfw'; units: 'ctypes'),
    (libs: 'libglut'; units: 'ctypes'),
    (libs: 'libGLEW'; units: 'ctypes'),

    (libs: 'libmgl'; units: 'ctypes'),

    (libs: 'libpciaccess'; units: 'ctypes'),
    (libs: 'libpci'; units: 'ctypes'),

    (libs: 'libgnutls'; units: 'ctypes'),
    (libs: 'libcurl'; units: 'ctypes'),

    (libs: 'libpam'; units: 'ctypes'),
    (libs: 'libpamc'; units: 'ctypes'),
    (libs: 'libpam_misc'; units: 'ctypes'),
    (libs: 'libsystemd'; units: 'ctypes'),


    (libs: 'libc'; units: 'ctypes'),

    (libs: 'libibus'; units: 'fp_glib2, ibus'),

    (libs: 'libgraphite2'; units: 'ctypes'),
    (libs: 'libfontconfig'; units: 'ctypes'),
    (libs: 'libdbus_1 '; units: 'ctypes'),
    (libs: 'libraw '; units: 'ctypes'),
    (libs: 'libudev '; units: 'ctypes'),




    (libs: ''; units: ''));


procedure TForm1.Form1DropFiles(Sender: TObject; const FileNames: array of string);
begin
  SourcePath := FileNames[0];
  WriteLn('pfad: ', SourcePath);
  if ExtractFileExt(SourcePath) <> '.pp' then begin
    WriteLn('Keine "*.pp" Datei !');
    SourcePath := '';
  end else begin
    Label1.Caption := SourcePath;
    DestPath := ChangeFileExt(SourcePath, '.pas');
    Memo1.Lines.LoadFromFile(SourcePath);
    Memo1.SelStart := 20000;
  end;
end;

procedure TForm1.Delete_Const(sl: TStringList);
var
  deleteString: TStringArray = (
    ('(* Const before type ignored *)'),
    ('(* Const before declarator ignored *)'));
  j, i: integer;
begin
  for j := 0 to Length(deleteString) - 1 do begin
    for i := sl.Count - 1 downto 0 do begin
      if sl[i] = deleteString[j] then begin
        SL.Delete(i);
      end;
    end;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  i: integer;
begin
  top := 10;
  Left := 10;
  Width := 1200;
  Height := 800;
  AllowDropFiles := True;
  OnDropFiles := @Form1DropFiles;

  RadioButton1Change(Sender); // Alle Checkboxen aus

  for i := 0 to Length(Sources) - 1 do begin
    ListBox1.Items.Add(Sources[i].libs);
  end;

  ListBox1.ItemIndex := ListBox1.Count - 2;

  CheckBox1.Caption := 'GTK_TYPE_WINDOW';
  CheckBox2.Caption := 'GTK_WINDOW(obj)';
  CheckBox3.Caption := 'GTK_WINDOW_CLASS(klass)';
  CheckBox4.Caption := 'GTK_IS_WINDOW(obj)';
  CheckBox5.Caption := 'GTK_IS_WINDOW_CLASS(klass)';
  CheckBox6.Caption := 'GTK_WINDOW_GET_CLASS(obj)';
  CheckBox7.Caption := 'GTK_WINDOW_GET_IFACE(obj)';
end;

procedure TForm1.RadioButton1Change(Sender: TObject);
begin
  CheckBox1.Checked := False;
  CheckBox2.Checked := False;
  CheckBox3.Checked := False;
  CheckBox4.Checked := False;
  CheckBox5.Checked := False;
  CheckBox6.Checked := False;
  CheckBox7.Checked := False;
end;

procedure TForm1.RadioButton2Change(Sender: TObject);
begin
  CheckBox1.Checked := True;
  CheckBox2.Checked := True;
  CheckBox3.Checked := True;
  CheckBox4.Checked := True;
  CheckBox5.Checked := True;
  CheckBox6.Checked := True;
  CheckBox7.Checked := False;
end;

procedure TForm1.ConvertClick(Sender: TObject);
var
  sl, slMacro: TStringList;
  p, i, j, maxCount: integer;
  libs, units: string;

  procedure DeleteLines(p, Count: integer);
  var
    i: integer;
  begin
    for i := 0 to Count - 1 do begin
      sl.Delete(p);
    end;
  end;

begin
  if not FileExists(SourcePath) then begin
    WriteLn('Datei nicht gefunden !');
    Exit;
  end;
  sl := TStringList.Create;
  sl.LoadFromFile(SourcePath);

  sl.Text := StringReplace(sl.Text, '(o : longint)', '(obj : longint)', [rfReplaceAll]);
  sl.Text := StringReplace(sl.Text, '(_object : longint)', '(obj : longint)', [rfReplaceAll]);
  sl.Text := StringReplace(sl.Text, '(object : longint)', '(obj : longint)', [rfReplaceAll]);
  sl.Text := StringReplace(sl.Text, '(k : longint)', '(klass : longint)', [rfReplaceAll]);
  sl.Text := StringReplace(sl.Text, '(c : longint)', '(klass : longint)', [rfReplaceAll]);
  sl.Text := StringReplace(sl.Text, '(_class : longint)', '(klass : longint)', [rfReplaceAll]);
  sl.Text := StringReplace(sl.Text, '(vtable : longint)', '(klass : longint)', [rfReplaceAll]);
  sl.Text := StringReplace(sl.Text, '(inst : longint)', '(obj : longint)', [rfReplaceAll]);
  sl.Text := StringReplace(sl.Text, '(module : longint)', '(obj : longint)', [rfReplaceAll]);

  sl.Text := StringReplace(sl.Text, '(clock : longint)', '(obj : longint)', [rfReplaceAll]);
  sl.Text := StringReplace(sl.Text, '(cclass : longint)', '(klass : longint)', [rfReplaceAll]);

  sl.Text := StringReplace(sl.Text, '(bus : longint)', '(obj : longint)', [rfReplaceAll]);
  sl.Text := StringReplace(sl.Text, '(bclass : longint)', '(klass : longint)', [rfReplaceAll]);

  sl.Text := StringReplace(sl.Text, '(pool : longint)', '(obj : longint)', [rfReplaceAll]);
  sl.Text := StringReplace(sl.Text, '(pclass : longint)', '(klass : longint)', [rfReplaceAll]);

  sl.Text := StringReplace(sl.Text, '(task : longint)', '(obj : longint)', [rfReplaceAll]);
  sl.Text := StringReplace(sl.Text, '(tclass : longint)', '(klass : longint)', [rfReplaceAll]);


  sl.Delete(0);
  sl.Insert(1, '');

  repeat
    sl.Delete(4);
  until sl[4] = '{$IFDEF FPC}';

  libs := Sources[ListBox1.ItemIndex].libs;
  units := Sources[ListBox1.ItemIndex].units;

  sl.Text := StringReplace(sl.Text, 'external;', 'external ' + libs + ';', [rfReplaceAll]);
  sl.Insert(4, 'uses' + #10 + '  ' + units + ';' + #10);

  p := 0;
  repeat
    Inc(p);
  until (pos('{ was #define dname def_expr }', sl[p]) = 1) or (p >= sl.Count - 1);
  if p >= sl.Count - 1 then begin
    p := 0;
    RadioButton1Change(Sender); // Alle Checkboxen aus
  end;

  G_DECLARE := Find_G_DECLARE(sl);
  if G_DECLARE <> is_G_DECLARE_none then begin
    RadioButton1Change(Sender); // Alle Checkboxen aus
    DeleteLines(p, 3);
  end;
  WriteLn('G_DECLARE: ', G_DECLARE);

  maxCount := 0;
  if CheckBox1.Checked then begin
    Inc(maxCount);
    DeleteLines(p, 3);
  end;
  if CheckBox2.Checked then begin
    Inc(maxCount);
    DeleteLines(p, 5);
  end;
  if CheckBox3.Checked then begin
    Inc(maxCount);
    DeleteLines(p, 5);
  end;
  if CheckBox4.Checked then begin
    Inc(maxCount);
    DeleteLines(p, 5);
  end;
  if CheckBox5.Checked then begin
    Inc(maxCount);
    DeleteLines(p, 5);
  end;
  if CheckBox6.Checked then begin
    Inc(maxCount);
    DeleteLines(p, 5);
  end;
  if CheckBox7.Checked then begin
    Inc(maxCount);
    DeleteLines(p, 5);
  end;

  repeat
    Inc(p);
  until pos('implementation', sl[p]) = 1;
  Inc(p, 3);


  if G_DECLARE <> is_G_DECLARE_none then begin
    slMacro := ConvertSLMacro_from_G_DECLARE;
  end else begin
    slMacro := TStringList.Create;
    for j := 0 to maxCount - 1 do begin
      for i := 0 to 4 do begin
        slMacro.Add(sl[p + i + j * 8]);
      end;
    end;
    ConvertSLMacro_from_Native(slMacro);
  end;

  WriteLn(slMacro.Text);

  Dec(p, 2);

  if (CheckBox1.Checked) or (G_DECLARE <> is_G_DECLARE_none) then begin
    DeleteLines(p, 6);
  end;
  if CheckBox2.Checked then begin
    DeleteLines(p, 8);
  end;
  if CheckBox3.Checked then begin
    DeleteLines(p, 8);
  end;
  if CheckBox4.Checked then begin
    DeleteLines(p, 8);
  end;
  if CheckBox5.Checked then begin
    DeleteLines(p, 8);
  end;
  if CheckBox6.Checked then begin
    DeleteLines(p, 8);
  end;
  if CheckBox7.Checked then begin
    DeleteLines(p, 8);
  end;

  p := 0;
  repeat
    Inc(p);
  until pos('implementation', sl[p]) = 1;


  sl.Insert(p + 2, slMacro.Text);
  sl.Insert(p - 1, '');
  sl.Insert(p - 1, '// === Konventiert am: ' + DateTimeToStr(now) + ' ===');
  sl.Insert(p - 1, '');

  // Nicht getestet, geändert wegen eines Fehlers ????
  //  for i := 0 to G_DECLARE_define_Count - 1 do begin
  if G_DECLARE <> is_G_DECLARE_none then begin
    maxCount := G_DECLARE_define_Count;
  end;
  // ????

  for i := 0 to maxCount - 1 do begin
    sl.Insert(p + i + 2, slMacro[i * 5]);
  end;

  Delete_Const(sl);
  Memo1.Lines := sl;
  Memo1.SelStart := 20000;

  sl.SaveToFile(DestPath);
  sl.Free;
  slMacro.Free;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  sl, slMacro: TStringList;
begin
  sl := TStringList.Create;
  sl.Add(Edit1.Text);
  G_DECLARE := Find_G_DECLARE(sl);
  WriteLn(G_DECLARE);
  WriteLn();

  slMacro := ConvertSLMacro_from_G_DECLARE;
  Memo1.Lines := slMacro;

  slMacro.Free;
  sl.Free;
end;

end.
