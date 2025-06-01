{$IFDEF read_interface}


function elm_layout_icon_get(_ly: PEvas_Object): PEvas_Object;
function elm_layout_end_get(_ly: PEvas_Object): PEvas_Object;


// === Konventiert am: 1-6-25 13:41:36 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function elm_layout_icon_get(_ly: PEvas_Object): PEvas_Object;
begin
  elm_layout_icon_get := elm_layout_content_get(_ly, 'elm.swallow.icon');
end;

function elm_layout_end_get(_ly: PEvas_Object): PEvas_Object;
begin
  elm_layout_end_get := elm_layout_content_get(_ly, 'elm.swallow.end');
end;


{$ENDIF read_implementation}
