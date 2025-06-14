program project1;

uses
  rtl_sdr;

type
  TRtsClass = class(TObject)
    constructor Create;
    procedure Ausgabe;
  end;

  procedure call_cp(buf: pbyte; len: Tuint32_t; ctx: pointer); cdecl;
  var
    rtsclass: TRtsClass absolute ctx;
  begin
    rtsclass.Ausgabe;
  end;

  constructor TRtsClass.Create;
  var
    dev: Prtlsdr_dev_t=nil;
  begin
    // Hier rts inizialisieren
    rtlsdr_wait_async(dev, @call_cp, self);
  end;

  procedure TRtsClass.Ausgabe;
  begin
    WriteLn('Ausgabe');
  end;


var
  rts: TRtsClass;

begin
  rts:=TRtsClass.Create;

  rts.Free;
end.
