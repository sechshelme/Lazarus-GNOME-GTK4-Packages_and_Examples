{$IFDEF read_interface}


type
  TAdapCarousel = record
  end;
  PAdapCarousel = ^TAdapCarousel;

  TAdapCarouselClass = record
    parent_class: TGtkWidgetClass;
  end;
  PAdapCarouselClass = ^TAdapCarouselClass;

function adap_carousel_get_type: TGType; cdecl; external libadapta;
function adap_carousel_new: PGtkWidget; cdecl; external libadapta;
procedure adap_carousel_prepend(self: PAdapCarousel; child: PGtkWidget); cdecl; external libadapta;
procedure adap_carousel_append(self: PAdapCarousel; child: PGtkWidget); cdecl; external libadapta;
procedure adap_carousel_insert(self: PAdapCarousel; child: PGtkWidget; position: longint); cdecl; external libadapta;
procedure adap_carousel_reorder(self: PAdapCarousel; child: PGtkWidget; position: longint); cdecl; external libadapta;
procedure adap_carousel_remove(self: PAdapCarousel; child: PGtkWidget); cdecl; external libadapta;
procedure adap_carousel_scroll_to(self: PAdapCarousel; widget: PGtkWidget; animate: Tgboolean); cdecl; external libadapta;
function adap_carousel_get_nth_page(self: PAdapCarousel; n: Tguint): PGtkWidget; cdecl; external libadapta;
function adap_carousel_get_n_pages(self: PAdapCarousel): Tguint; cdecl; external libadapta;
function adap_carousel_get_position(self: PAdapCarousel): double; cdecl; external libadapta;
function adap_carousel_get_interactive(self: PAdapCarousel): Tgboolean; cdecl; external libadapta;
procedure adap_carousel_set_interactive(self: PAdapCarousel; interactive: Tgboolean); cdecl; external libadapta;
function adap_carousel_get_spacing(self: PAdapCarousel): Tguint; cdecl; external libadapta;
procedure adap_carousel_set_spacing(self: PAdapCarousel; spacing: Tguint); cdecl; external libadapta;
function adap_carousel_get_scroll_params(self: PAdapCarousel): PAdapSpringParams; cdecl; external libadapta;
procedure adap_carousel_set_scroll_params(self: PAdapCarousel; params: PAdapSpringParams); cdecl; external libadapta;
function adap_carousel_get_allow_mouse_drag(self: PAdapCarousel): Tgboolean; cdecl; external libadapta;
procedure adap_carousel_set_allow_mouse_drag(self: PAdapCarousel; allow_mouse_drag: Tgboolean); cdecl; external libadapta;
function adap_carousel_get_allow_scroll_wheel(self: PAdapCarousel): Tgboolean; cdecl; external libadapta;
procedure adap_carousel_set_allow_scroll_wheel(self: PAdapCarousel; allow_scroll_wheel: Tgboolean); cdecl; external libadapta;
function adap_carousel_get_allow_long_swipes(self: PAdapCarousel): Tgboolean; cdecl; external libadapta;
procedure adap_carousel_set_allow_long_swipes(self: PAdapCarousel; allow_long_swipes: Tgboolean); cdecl; external libadapta;
function adap_carousel_get_reveal_duration(self: PAdapCarousel): Tguint; cdecl; external libadapta;
procedure adap_carousel_set_reveal_duration(self: PAdapCarousel; reveal_duration: Tguint); cdecl; external libadapta;

// === Konventiert am: 4-12-25 17:01:27 ===

function ADAP_TYPE_CAROUSEL: TGType;
function ADAP_CAROUSEL(obj: Pointer): PAdapCarousel;
function ADAP_IS_CAROUSEL(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function ADAP_TYPE_CAROUSEL: TGType;
begin
  Result := adap_carousel_get_type;
end;

function ADAP_CAROUSEL(obj: Pointer): PAdapCarousel;
begin
  Result := PAdapCarousel(g_type_check_instance_cast(obj, ADAP_TYPE_CAROUSEL));
end;

function ADAP_IS_CAROUSEL(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADAP_TYPE_CAROUSEL);
end;


{$ENDIF read_implementation}
