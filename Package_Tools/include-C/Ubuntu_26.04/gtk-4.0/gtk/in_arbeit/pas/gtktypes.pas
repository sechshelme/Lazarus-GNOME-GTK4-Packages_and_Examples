unit gtktypes;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gtk4;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$IFDEF read_struct}
type
  PGtkSnapshot = PGdkSnapshot;


  PGtkAdjustment = type Pointer;
  PGtkATContext = type Pointer;
  PGtkBitset = type Pointer;                       // blank
  PGtkBuilder = type Pointer;
  PGtkBuilderScope = type Pointer;                 // blank
  PGtkCssStyleChange = type Pointer;               // blank
  PGtkEventController = type Pointer;              // blank
  PGtkGesture = type Pointer;
//  PGtkLayoutManager = type Pointer;                // full
  PGtkListItem = type Pointer;
  PGtkListItemFactory = type Pointer;
  PGtkNative = type Pointer;                       // blank
  PGtkRequisition = type Pointer;
  PGtkRoot = type Pointer;                         // blank
  PGtkScrollInfo = type Pointer;
  PGtkSettings = type Pointer;                     // blank
  PGtkShortcut = type Pointer;                     // blank
  PGtkShortcutAction = type Pointer;
  PGtkShortcutTrigger = type Pointer;
  PGdkSnapshot = type Pointer;
  PGtkStyleContext = type Pointer;                 // deprecated full
  PGtkTooltip = type Pointer;
  //  PGtkWidget = type Pointer;                       // full
  //  PGtkWindow = type Pointer;                       // full



  // zum berabeiten und löschen !
  Tdouble = double;
  TGtkShortcutFunc = pointer;

  PGtkWindowGroup = Pointer;                       // full
  PGtkApplication = Pointer;                       // full
  PGtkLayoutManager = Pointer;                     // full

  PGtkAccessible = type Pointer;                   // deprecated blank
  PGtkShortcutsWindow = type Pointer;              // blank
  PPGtkAccessible = ^PGtkAccessible;


  {$ENDIF read_struct}

{$IFDEF read_function}
function GTK_INVALID_LIST_POSITION: Tguint;
{$ENDIF read_function}


// === Konventiert am: 6-7-26 16:45:06 ===


implementation


function GTK_INVALID_LIST_POSITION: Tguint;
begin
  GTK_INVALID_LIST_POSITION := Tguint($ffffffff);
end;


end.
