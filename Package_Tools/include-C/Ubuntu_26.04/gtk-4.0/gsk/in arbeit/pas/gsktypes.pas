unit gsktypes;

interface

uses
  fp_glib2, fp_gtk4;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PGskPath = type Pointer;
  PGskPathBuilder = type Pointer;
  PGskPathMeasure = type Pointer;
  PGskPathPoint = type Pointer;
  PGskRenderer = type Pointer;
  PGskRenderNode = type Pointer;
  PPGskRenderNode = ^PGskRenderNode;
  PGskRenderReplay = type Pointer;
  PGskRoundedRect = type Pointer;
  PGskStroke = type Pointer;
  PGskTransform = type Pointer;
  PGskComponentTransfer = type Pointer;

  // === Konventiert am: 5-7-26 13:38:39 ===


implementation



end.
