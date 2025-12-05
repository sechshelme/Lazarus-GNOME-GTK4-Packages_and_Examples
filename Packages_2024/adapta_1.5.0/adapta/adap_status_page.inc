{$IFDEF read_interface}


type
  TAdapStatusPage = record
  end;
  PAdapStatusPage = ^TAdapStatusPage;

  TAdapStatusPageClass = record
    parent_class: TGtkWidgetClass;
  end;
  PAdapStatusPageClass = ^TAdapStatusPageClass;

function adap_status_page_get_type: TGType; cdecl; external libadapta;
function adap_status_page_new: PGtkWidget; cdecl; external libadapta;
function adap_status_page_get_icon_name(self: PAdapStatusPage): pchar; cdecl; external libadapta;
procedure adap_status_page_set_icon_name(self: PAdapStatusPage; icon_name: pchar); cdecl; external libadapta;
function adap_status_page_get_paintable(self: PAdapStatusPage): PGdkPaintable; cdecl; external libadapta;
procedure adap_status_page_set_paintable(self: PAdapStatusPage; paintable: PGdkPaintable); cdecl; external libadapta;
function adap_status_page_get_title(self: PAdapStatusPage): pchar; cdecl; external libadapta;
procedure adap_status_page_set_title(self: PAdapStatusPage; title: pchar); cdecl; external libadapta;
function adap_status_page_get_description(self: PAdapStatusPage): pchar; cdecl; external libadapta;
procedure adap_status_page_set_description(self: PAdapStatusPage; description: pchar); cdecl; external libadapta;
function adap_status_page_get_child(self: PAdapStatusPage): PGtkWidget; cdecl; external libadapta;
procedure adap_status_page_set_child(self: PAdapStatusPage; child: PGtkWidget); cdecl; external libadapta;

// === Konventiert am: 4-12-25 17:18:49 ===

function ADAP_TYPE_STATUS_PAGE: TGType;
function ADAP_STATUS_PAGE(obj: Pointer): PAdapStatusPage;
function ADAP_IS_STATUS_PAGE(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function ADAP_TYPE_STATUS_PAGE: TGType;
begin
  Result := adap_status_page_get_type;
end;

function ADAP_STATUS_PAGE(obj: Pointer): PAdapStatusPage;
begin
  Result := PAdapStatusPage(g_type_check_instance_cast(obj, ADAP_TYPE_STATUS_PAGE));
end;

function ADAP_IS_STATUS_PAGE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADAP_TYPE_STATUS_PAGE);
end;


{$ENDIF read_implementation}
