unit gtksourcetypes;

interface

uses
  fp_glib2, fp_GTK4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}

type
  TGtkSourceView = record
    parent_instance: TGtkTextView;
  end;
  PGtkSourceView = ^TGtkSourceView;

  TGtkSourceCompletion = record
  end;
  PGtkSourceCompletion = ^TGtkSourceCompletion;

  TGtkSourceCompletionProvider = record
  end;
  PGtkSourceCompletionProvider = ^TGtkSourceCompletionProvider;

  TGtkSourceGutterLines = record
  end;
  PGtkSourceGutterLines = ^TGtkSourceGutterLines;


// === Konventiert am: 29-3-25 15:26:52 ===


implementation



end.
