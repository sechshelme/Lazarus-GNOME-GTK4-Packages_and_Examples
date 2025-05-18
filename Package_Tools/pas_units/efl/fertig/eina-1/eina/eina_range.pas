unit eina_range;

interface

uses
  ctypes, efl;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TEina_Range = record
    start: Tsize_t;
    length: Tsize_t;
  end;
  PEina_Range = ^TEina_Range;

  // === Konventiert am: 17-5-25 16:23:59 ===


implementation



end.
