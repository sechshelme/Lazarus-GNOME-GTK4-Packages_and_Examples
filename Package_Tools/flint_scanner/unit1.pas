unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  crt,
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, FileUtil;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    soText: string;
    procedure checkProc(const src: string);
  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }




(*

// nm -D libflint.so | grep padic_fprint

Bei .../src/flint.h einfügen
#define FLINT_FORCE_INLINE __attribute__((weak)) extern

#define FMPZ_MOD_MPOLY_Q_INLINE __attribute__((weak)) extern
#define RADIX_INLINE __attribute__((weak)) extern
#define FQ_ZECH_POLY_INLINE __attribute__((weak)) extern
#define DLOG_INLINE __attribute__((weak)) extern
#define FQ_ZECH_MPOLY_INLINE __attribute__((weak)) extern





/home/tux/Schreibtisch/von_Git/flint/flint/src/fmpz_mod_mpoly_q.h
fmpz_mod_mpoly_q_is_fmpz_mod(const fmpz_mod_mpoly_q_t x, const fmpz_mod_mpoly_ctx_t ctx)
fmpz_mod_mpoly_q_is_fmpz_mod
not found


/home/tux/Schreibtisch/von_Git/flint/flint/src/radix.h
radix_add_1(nn_ptr res, nn_srcptr a, slong n, ulong c, const radix_t radix)
radix_add_1
not found

radix_sub_1(nn_ptr res, nn_srcptr a, slong n, ulong c, const radix_t radix)
radix_sub_1
not found



*)




const
  FlintPath='/n4800/DATEN/Programmierung/mit_GIT/Lazarus/Tutorial/fork/flint_fork/';
//  FlintPath='/home/tux/Schreibtisch/von_Git/flint/flint/';
//  FlintPath='/home/tux/Schreibtisch/von_Git/flint/flint-3.0.1/';
//  FlintPath='/home/tux/Schreibtisch/von_Git/flint/flint-3.4.0/';
//  FlintPath='/home/tux/Schreibtisch/von_Git/flint/flint-3.6.0/';

procedure TForm1.checkProc(const src: string);
var
  sa: TAnsiStringArray;
  s: string;
begin
  sa := src.Split('(');
  s := sa[0];
  sa := s.Split(' ');
  s := sa[Length(sa) - 1];

  if pos(s, soText) > 0 then begin
    //TextAttr := 7;
    //WriteLn(src);
    //TextAttr := 13;
    //WriteLn(s);
    //TextAttr := 11;
    //WriteLn('found');
    //WriteLn();
  end else begin
    TextAttr := 7;
    WriteLn(src);
    TextAttr := 13;
    WriteLn(s);
    TextAttr := 12;
    WriteLn('not found');
    WriteLn();
  end;
  TextAttr := 7;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  slFile, slHeader: TStringList;
  i, j, v, a: integer;
  s: string;
  p: SizeInt;
  soBuffer: TStringList;
  f: file;
  BytesRead: integer;
begin
  AssignFile(f, FlintPath+'libflint.so');
  Reset(f, 1);
  SetLength(soText, FileSize(f));
  BlockRead(f, soText[1], FileSize(f), BytesRead);
  CloseFile(f);

  Memo1.Clear;
  slFile := FindAllFiles(FlintPath+'src', '*.h', False);
  Memo1.Lines := slFile;



  for i := 0 to slFile.Count - 1 do begin
    slHeader := TStringList.Create;
    slHeader.LoadFromFile(slFile[i]);

       WriteLn(#10, i, '/', slFile.Count - 1, '         ', slFile[i], #10);

    for j := 0 to slHeader.Count - 1 do begin
      s := slHeader[j];
      p := pos('_INLINE ', s);
      if p > 0 then begin

        if pos('#', s) <> 1 then begin
          if pos('TEMPLATE', s) = 0 then begin
            if pos('(', s) = 0 then begin
              checkProc(slHeader[j + 1]); end else begin
              checkProc(s);
            end;
          end;
        end;
      end;

    end;
    //    slHeader.SaveToFile(slFile[i]);
    slHeader.Free;
  end;

  slFile.Free;

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Height := 1000;
  Width := 1000;
end;


end.
