unit gtktypes;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}

type
  PGtkSnapshot = PGdkSnapshot;


PGtkAdjustment=type Pointer;
PGtkATContext=type Pointer;
PGtkBitset=type Pointer;
PGtkBuilder=type Pointer;
PGtkBuilderScope=type Pointer;
PGtkCssStyleChange=type Pointer;
PGtkEventController=type Pointer;
PGtkGesture=type Pointer;
PGtkLayoutManager=type Pointer;
PGtkListItem=type Pointer;
PGtkListItemFactory=type Pointer;
PGtkNative=type Pointer;
PGtkRequisition=type Pointer;
PGtkRoot=type Pointer;
PGtkScrollInfo=type Pointer;
PGtkSettings=type Pointer;
PGtkShortcut=type Pointer;
PGtkShortcutAction=type Pointer;
PGtkShortcutTrigger=type Pointer;
PGdkSnapshot=type Pointer;
PGtkStyleContext=type Pointer;
PGtkTooltip=type Pointer;
PGtkWidget=type Pointer;
PGtkWindow=type Pointer;


  function GTK_INVALID_LIST_POSITION : Tguint;


// === Konventiert am: 6-7-26 16:45:06 ===


implementation


function GTK_INVALID_LIST_POSITION : Tguint;
  begin
    GTK_INVALID_LIST_POSITION:=Tguint($ffffffff);
  end;


end.
