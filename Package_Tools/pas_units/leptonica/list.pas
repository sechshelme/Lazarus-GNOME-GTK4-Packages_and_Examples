unit list;

interface

uses
  fp_lept;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PDoubleLinkedList = ^TDoubleLinkedList;
  TDoubleLinkedList = record
    prev: PDoubleLinkedList;
    next: PDoubleLinkedList;
    data: pointer;
  end;

  TDLLIST = TDoubleLinkedList;
  PDLLIST = ^TDLLIST;
  PPDLLIST = ^PDLLIST;

  // === Konventiert am: 17-8-25 13:40:21 ===


implementation



end.
