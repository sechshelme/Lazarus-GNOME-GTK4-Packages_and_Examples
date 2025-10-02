unit xb_silo_query;

interface

uses
  fp_glib2, fp_xmlb, xb_query, xb_query_context, xb_node;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function xb_silo_query(self: PXbSilo; xpath: Pgchar; limit: Tguint; error: PPGError): PGPtrArray; cdecl; external libxmlb;
function xb_silo_query_full(self: PXbSilo; query: PXbQuery; error: PPGError): PGPtrArray; cdecl; external libxmlb;
function xb_silo_query_with_context(self: PXbSilo; query: PXbQuery; context: PXbQueryContext; error: PPGError): PGPtrArray; cdecl; external libxmlb;
function xb_silo_query_first(self: PXbSilo; xpath: Pgchar; error: PPGError): PXbNode; cdecl; external libxmlb;
function xb_silo_query_first_full(self: PXbSilo; query: PXbQuery; error: PPGError): PXbNode; cdecl; external libxmlb;
function xb_silo_query_first_with_context(self: PXbSilo; query: PXbQuery; context: PXbQueryContext; error: PPGError): PXbNode; cdecl; external libxmlb;
function xb_silo_query_build_index(self: PXbSilo; xpath: Pgchar; attr: Pgchar; error: PPGError): Tgboolean; cdecl; external libxmlb;

// === Konventiert am: 1-10-25 19:42:45 ===


implementation



end.
