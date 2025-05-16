unit eina_clist;

interface

uses
  ctypes, efl;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEina_Clist = ^TEina_Clist;

  TEina_Clist = record
    next: PEina_Clist;
    prev: PEina_Clist;
  end;


  // === Konventiert am: 16-5-25 19:39:37 ===


implementation



end.
