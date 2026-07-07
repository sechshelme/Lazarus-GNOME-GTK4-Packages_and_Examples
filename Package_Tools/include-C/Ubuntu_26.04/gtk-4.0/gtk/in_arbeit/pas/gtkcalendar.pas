unit gtkcalendar;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gtk4, gtkwidget;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  PGtkCalendar = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_calendar_get_type: TGType; cdecl; external libgtk4;
function gtk_calendar_new: PGtkWidget; cdecl; external libgtk4;
procedure gtk_calendar_select_day(self: PGtkCalendar; date: PGDateTime); cdecl; external libgtk4; deprecated;
procedure gtk_calendar_mark_day(calendar: PGtkCalendar; day: Tguint); cdecl; external libgtk4;
procedure gtk_calendar_unmark_day(calendar: PGtkCalendar; day: Tguint); cdecl; external libgtk4;
procedure gtk_calendar_clear_marks(calendar: PGtkCalendar); cdecl; external libgtk4;
procedure gtk_calendar_set_show_week_numbers(self: PGtkCalendar; value: Tgboolean); cdecl; external libgtk4;
function gtk_calendar_get_show_week_numbers(self: PGtkCalendar): Tgboolean; cdecl; external libgtk4;
procedure gtk_calendar_set_show_heading(self: PGtkCalendar; value: Tgboolean); cdecl; external libgtk4;
function gtk_calendar_get_show_heading(self: PGtkCalendar): Tgboolean; cdecl; external libgtk4;
procedure gtk_calendar_set_show_day_names(self: PGtkCalendar; value: Tgboolean); cdecl; external libgtk4;
function gtk_calendar_get_show_day_names(self: PGtkCalendar): Tgboolean; cdecl; external libgtk4;
procedure gtk_calendar_set_day(self: PGtkCalendar; day: longint); cdecl; external libgtk4;
function gtk_calendar_get_day(self: PGtkCalendar): longint; cdecl; external libgtk4;
procedure gtk_calendar_set_month(self: PGtkCalendar; month: longint); cdecl; external libgtk4;
function gtk_calendar_get_month(self: PGtkCalendar): longint; cdecl; external libgtk4;
procedure gtk_calendar_set_year(self: PGtkCalendar; year: longint); cdecl; external libgtk4;
function gtk_calendar_get_year(self: PGtkCalendar): longint; cdecl; external libgtk4;
procedure gtk_calendar_set_date(self: PGtkCalendar; date: PGDateTime); cdecl; external libgtk4;
function gtk_calendar_get_date(self: PGtkCalendar): PGDateTime; cdecl; external libgtk4;
function gtk_calendar_get_day_is_marked(calendar: PGtkCalendar; day: Tguint): Tgboolean; cdecl; external libgtk4;

// === Konventiert am: 6-7-26 13:53:12 ===

function GTK_TYPE_CALENDAR: TGType;
function GTK_CALENDAR(obj: Pointer): PGtkCalendar;
function GTK_IS_CALENDAR(obj: Pointer): Tgboolean;
{$ENDIF read_function}

implementation

function GTK_TYPE_CALENDAR: TGType;
begin
  GTK_TYPE_CALENDAR := gtk_calendar_get_type;
end;

function GTK_CALENDAR(obj: Pointer): PGtkCalendar;
begin
  Result := PGtkCalendar(g_type_check_instance_cast(obj, GTK_TYPE_CALENDAR));
end;

function GTK_IS_CALENDAR(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_CALENDAR);
end;



end.
