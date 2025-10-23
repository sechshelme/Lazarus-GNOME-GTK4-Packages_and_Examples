
{$IFDEF read_interface}


function pango_markup_parser_new(accel_marker: Tgunichar): PGMarkupParseContext; cdecl; external libpango;
function pango_markup_parser_finish(context: PGMarkupParseContext; attr_list: PPPangoAttrList; Text: PPchar; accel_char: Pgunichar; error: PPGError): Tgboolean; cdecl; external libpango;
function pango_parse_markup(markup_text: pchar; length: longint; accel_marker: Tgunichar; attr_list: PPPangoAttrList; Text: PPchar;
  accel_char: Pgunichar; error: PPGError): Tgboolean; cdecl; external libpango;

// === Konventiert am: 26-11-24 15:50:34 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
