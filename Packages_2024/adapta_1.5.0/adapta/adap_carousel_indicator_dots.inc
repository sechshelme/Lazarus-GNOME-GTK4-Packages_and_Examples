{$IFDEF read_interface}


type
  TAdapCarouselIndicatorDots = record
  end;
  PAdapCarouselIndicatorDots = ^TAdapCarouselIndicatorDots;

  TAdapCarouselIndicatorDotsClass = record
    parent_class: TGtkWidgetClass;
  end;
  PAdapCarouselIndicatorDotsClass = ^TAdapCarouselIndicatorDotsClass;

function adap_carousel_indicator_dots_get_type: TGType; cdecl; external libadapta;
function adap_carousel_indicator_dots_new: PGtkWidget; cdecl; external libadapta;
function adap_carousel_indicator_dots_get_carousel(self: PAdapCarouselIndicatorDots): PAdapCarousel; cdecl; external libadapta;
procedure adap_carousel_indicator_dots_set_carousel(self: PAdapCarouselIndicatorDots; carousel: PAdapCarousel); cdecl; external libadapta;

// === Konventiert am: 4-12-25 17:01:31 ===

function ADAP_TYPE_CAROUSEL_INDICATOR_DOTS: TGType;
function ADAP_CAROUSEL_INDICATOR_DOTS(obj: Pointer): PAdapCarouselIndicatorDots;
function ADAP_IS_CAROUSEL_INDICATOR_DOTS(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function ADAP_TYPE_CAROUSEL_INDICATOR_DOTS: TGType;
begin
  Result := adap_carousel_indicator_dots_get_type;
end;

function ADAP_CAROUSEL_INDICATOR_DOTS(obj: Pointer): PAdapCarouselIndicatorDots;
begin
  Result := PAdapCarouselIndicatorDots(g_type_check_instance_cast(obj, ADAP_TYPE_CAROUSEL_INDICATOR_DOTS));
end;

function ADAP_IS_CAROUSEL_INDICATOR_DOTS(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADAP_TYPE_CAROUSEL_INDICATOR_DOTS);
end;




{$ENDIF read_implementation}
