unit gtksourcescheduler;

interface

uses
  fp_glib2, fp_GTK4;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type

  TGtkSourceSchedulerCallback = function(deadline: Tgint64; user_data: Tgpointer): Tgboolean; cdecl;

function gtk_source_scheduler_add(callback: TGtkSourceSchedulerCallback; user_data: Tgpointer): Tgsize; cdecl; external libgtksourceview5;
function gtk_source_scheduler_add_full(callback: TGtkSourceSchedulerCallback; user_data: Tgpointer; notify: TGDestroyNotify): Tgsize; cdecl; external libgtksourceview5;
procedure gtk_source_scheduler_remove(handler_id: Tgsize); cdecl; external libgtksourceview5;

// === Konventiert am: 29-3-25 17:24:59 ===

procedure GtkSourceSchedulerClear(HandlerIdPtr: Pgsize); inline;



implementation

procedure GtkSourceSchedulerClear(HandlerIdPtr: Pgsize);
var
  Val: Tgsize;
begin
  Val := HandlerIdPtr^;
  if Val <> 0 then  begin
    HandlerIdPtr^ := 0;
    gtk_source_scheduler_remove(Val);
  end;
end;

end.
