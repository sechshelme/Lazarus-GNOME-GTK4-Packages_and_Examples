
{$IFDEF read_interface}


function gtk_css_parser_error_get_type: TGType; cdecl; external libgtk4;
function gtk_css_parser_warning_get_type: TGType; cdecl; external libgtk4;


// === Konventiert am: 2-8-24 19:05:19 ===

function GTK_TYPE_CSS_PARSER_WARNING: TGType;
function GTK_TYPE_CSS_PARSER_ERROR: TGType;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GTK_TYPE_CSS_PARSER_ERROR: TGType;
begin
  GTK_TYPE_CSS_PARSER_ERROR := gtk_css_parser_error_get_type;
end;

function GTK_TYPE_CSS_PARSER_WARNING: TGType;
begin
  GTK_TYPE_CSS_PARSER_WARNING := gtk_css_parser_warning_get_type;
end;


{$ENDIF read_implementation}
