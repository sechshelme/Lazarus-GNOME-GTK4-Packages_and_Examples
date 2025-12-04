unit adap_window_title;

interface

uses
  fp_GTK4, fp_glib2, fp_adapta;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TAdapWindowTitle = record
  end;
  PAdapWindowTitle = ^TAdapWindowTitle;

  TAdapWindowTitleClass = record
    parent_class: TGtkWidgetClass;
  end;
  PAdapWindowTitleClass = ^TAdapWindowTitleClass;

function adap_window_title_get_type: TGType; cdecl; external libadapta;
function adap_window_title_new(title: pchar; subtitle: pchar): PGtkWidget; cdecl; external libadapta;
function adap_window_title_get_title(self: PAdapWindowTitle): pchar; cdecl; external libadapta;
procedure adap_window_title_set_title(self: PAdapWindowTitle; title: pchar); cdecl; external libadapta;
function adap_window_title_get_subtitle(self: PAdapWindowTitle): pchar; cdecl; external libadapta;
procedure adap_window_title_set_subtitle(self: PAdapWindowTitle; subtitle: pchar); cdecl; external libadapta;

// === Konventiert am: 4-12-25 17:27:16 ===

function ADAP_TYPE_WINDOW_TITLE: TGType;
function ADAP_WINDOW_TITLE(obj: Pointer): PAdapWindowTitle;
function ADAP_IS_WINDOW_TITLE(obj: Pointer): Tgboolean;

implementation

function ADAP_TYPE_WINDOW_TITLE: TGType;
begin
  Result := adap_window_title_get_type;
end;

function ADAP_WINDOW_TITLE(obj: Pointer): PAdapWindowTitle;
begin
  Result := PAdapWindowTitle(g_type_check_instance_cast(obj, ADAP_TYPE_WINDOW_TITLE));
end;

function ADAP_IS_WINDOW_TITLE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADAP_TYPE_WINDOW_TITLE);
end;


end.
