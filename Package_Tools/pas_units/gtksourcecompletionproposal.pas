unit gtksourcecompletionproposal;

interface

uses
  fp_glib2, fp_GTK4;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {G_DECLARE_INTERFACE (GtkSourceCompletionProposal, gtk_source_completion_proposal, GTK_SOURCE, COMPLETION_PROPOSAL, GObject) }
type
  TGtkSourceCompletionProposal = record
  end;
  PGtkSourceCompletionProposal = ^TGtkSourceCompletionProposal;

  TGtkSourceCompletionProposalInterface = record
    parent_iface: TGTypeInterface;
    get_typed_text: function(proposal: PGtkSourceCompletionProposal): pchar; cdecl;
  end;
  PGtkSourceCompletionProposalInterface = ^TGtkSourceCompletionProposalInterface;

function gtk_source_completion_proposal_get_type: TGType; cdecl; external libgtksourceview5;
function gtk_source_completion_proposal_get_typed_text(proposal: PGtkSourceCompletionProposal): pchar; cdecl; external libgtksourceview5;

// === Konventiert am: 29-3-25 15:37:47 ===

function GTK_SOURCE_TYPE_COMPLETION_PROPOSAL: TGType;
function GTK_SOURCE_COMPLETION_PROPOSAL(obj: Pointer): PGtkSourceCompletionProposal;
function GTK_SOURCE_IS_COMPLETION_PROPOSAL(obj: Pointer): Tgboolean;
function GTK_SOURCE_COMPLETION_PROPOSAL_GET_IFACE(obj: Pointer): PGtkSourceCompletionProposalInterface;

implementation

function GTK_SOURCE_TYPE_COMPLETION_PROPOSAL: TGType;
begin
  Result := gtk_source_completion_proposal_get_type;
end;

function GTK_SOURCE_COMPLETION_PROPOSAL(obj: Pointer): PGtkSourceCompletionProposal;
begin
  Result := PGtkSourceCompletionProposal(g_type_check_instance_cast(obj, GTK_SOURCE_TYPE_COMPLETION_PROPOSAL));
end;

function GTK_SOURCE_IS_COMPLETION_PROPOSAL(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_SOURCE_TYPE_COMPLETION_PROPOSAL);
end;

function GTK_SOURCE_COMPLETION_PROPOSAL_GET_IFACE(obj: Pointer): PGtkSourceCompletionProposalInterface;
begin
  Result := g_type_interface_peek(obj, GTK_SOURCE_TYPE_COMPLETION_PROPOSAL);
end;


end.
