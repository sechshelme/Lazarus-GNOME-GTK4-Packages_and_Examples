{$IFDEF read_interface}


function xb_node_query(self: PXbNode; xpath: Pgchar; limit: Tguint; error: PPGError): PGPtrArray; cdecl; external libxmlb;
function xb_node_query_full(self: PXbNode; query: PXbQuery; error: PPGError): PGPtrArray; cdecl; external libxmlb;
function xb_node_query_with_context(self: PXbNode; query: PXbQuery; context: PXbQueryContext; error: PPGError): PGPtrArray; cdecl; external libxmlb;
function xb_node_query_first(self: PXbNode; xpath: Pgchar; error: PPGError): PXbNode; cdecl; external libxmlb;
function xb_node_query_first_full(self: PXbNode; query: PXbQuery; error: PPGError): PXbNode; cdecl; external libxmlb;
function xb_node_query_first_with_context(self: PXbNode; query: PXbQuery; context: PXbQueryContext; error: PPGError): PXbNode; cdecl; external libxmlb;
function xb_node_query_text(self: PXbNode; xpath: Pgchar; error: PPGError): Pgchar; cdecl; external libxmlb;
function xb_node_query_text_as_uint(self: PXbNode; xpath: Pgchar; error: PPGError): Tguint64; cdecl; external libxmlb;
function xb_node_query_attr(self: PXbNode; xpath: Pgchar; name: Pgchar; error: PPGError): Pgchar; cdecl; external libxmlb;
function xb_node_query_attr_as_uint(self: PXbNode; xpath: Pgchar; name: Pgchar; error: PPGError): Tguint64; cdecl; external libxmlb;
function xb_node_query_export(self: PXbNode; xpath: Pgchar; error: PPGError): Pgchar; cdecl; external libxmlb;

// === Konventiert am: 1-10-25 19:42:27 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
