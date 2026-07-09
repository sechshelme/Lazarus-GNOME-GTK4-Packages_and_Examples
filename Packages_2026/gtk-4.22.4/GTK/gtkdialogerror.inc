

  {$IFDEF read_struct}
type
  PGtkDialogError = ^TGtkDialogError;
  TGtkDialogError = longint;
const
  GTK_DIALOG_ERROR_FAILED = 0;
  GTK_DIALOG_ERROR_CANCELLED = 1;
  GTK_DIALOG_ERROR_DISMISSED = 2;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_dialog_error_quark: TGQuark; cdecl; external libgtk4;

function GTK_DIALOG_ERROR: TGQuark;
{$ENDIF read_function}

// === Konventiert am: 6-7-26 14:08:09 ===


{$IFDEF read_implementation}

function GTK_DIALOG_ERROR: TGQuark;
begin
  GTK_DIALOG_ERROR := gtk_dialog_error_quark;
end;


{$ENDIF read_implementation}
