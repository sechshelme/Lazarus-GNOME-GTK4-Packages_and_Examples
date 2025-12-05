{$IFDEF read_interface}


type
  TAdapCarouselIndicatorLines = record
  end;
  PAdapCarouselIndicatorLines = ^TAdapCarouselIndicatorLines;

  TAdapCarouselIndicatorLinesClass = record
    parent_class: TGtkWidgetClass;
  end;
  PAdapCarouselIndicatorLinesClass = ^TAdapCarouselIndicatorLinesClass;

function adap_carousel_indicator_lines_get_type: TGType; cdecl; external libadapta;
function adap_carousel_indicator_lines_new: PGtkWidget; cdecl; external libadapta;
function adap_carousel_indicator_lines_get_carousel(self: PAdapCarouselIndicatorLines): PAdapCarousel; cdecl; external libadapta;
procedure adap_carousel_indicator_lines_set_carousel(self: PAdapCarouselIndicatorLines; carousel: PAdapCarousel); cdecl; external libadapta;

// === Konventiert am: 4-12-25 17:01:34 ===

function ADAP_TYPE_CAROUSEL_INDICATOR_LINES: TGType;
function ADAP_CAROUSEL_INDICATOR_LINES(obj: Pointer): PAdapCarouselIndicatorLines;
function ADAP_IS_CAROUSEL_INDICATOR_LINES(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function ADAP_TYPE_CAROUSEL_INDICATOR_LINES: TGType;
begin
  Result := adap_carousel_indicator_lines_get_type;
end;

function ADAP_CAROUSEL_INDICATOR_LINES(obj: Pointer): PAdapCarouselIndicatorLines;
begin
  Result := PAdapCarouselIndicatorLines(g_type_check_instance_cast(obj, ADAP_TYPE_CAROUSEL_INDICATOR_LINES));
end;

function ADAP_IS_CAROUSEL_INDICATOR_LINES(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADAP_TYPE_CAROUSEL_INDICATOR_LINES);
end;


{$ENDIF read_implementation}
