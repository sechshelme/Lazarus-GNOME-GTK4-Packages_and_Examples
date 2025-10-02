unit xb_query_context;

interface

uses
  fp_glib2, fp_xmlb, xb_value_bindings, xb_query;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TXbQueryContext = record
    dummy0: Tgint;
    dummy1: Tguint;
    dummy2: TXbValueBindings;
    dummy3: array[0..4] of Tgpointer;
  end;
  PXbQueryContext = ^TXbQueryContext;

function xb_query_context_get_type: TGType; cdecl; external libxmlb;
procedure xb_query_context_init(self: PXbQueryContext); cdecl; external libxmlb;
procedure xb_query_context_clear(self: PXbQueryContext); cdecl; external libxmlb;
function xb_query_context_copy(self: PXbQueryContext): PXbQueryContext; cdecl; external libxmlb;
procedure xb_query_context_free(self: PXbQueryContext); cdecl; external libxmlb;
function xb_query_context_get_bindings(self: PXbQueryContext): PXbValueBindings; cdecl; external libxmlb;
function xb_query_context_get_limit(self: PXbQueryContext): Tguint; cdecl; external libxmlb;
procedure xb_query_context_set_limit(self: PXbQueryContext; limit: Tguint); cdecl; external libxmlb;
function xb_query_context_get_flags(self: PXbQueryContext): TXbQueryFlags; cdecl; external libxmlb;
procedure xb_query_context_set_flags(self: PXbQueryContext; flags: TXbQueryFlags); cdecl; external libxmlb;

// === Konventiert am: 1-10-25 19:42:37 ===


implementation



end.
