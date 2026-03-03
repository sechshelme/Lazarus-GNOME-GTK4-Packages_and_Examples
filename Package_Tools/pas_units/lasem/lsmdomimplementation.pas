unit lsmdomimplementation;

interface

uses
  fp_glib2, fp_lasem, lsmdomnode;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TLsmDomDocumentCreateFunction = function: PLsmDomDocument; cdecl;

function lsm_dom_implementation_create_document(namespace_uri: pchar; qualified_name: pchar): PLsmDomDocument; cdecl; external liblasem;
procedure lsm_dom_implementation_cleanup; cdecl; external liblasem;

// === Konventiert am: 3-3-26 15:37:25 ===


implementation



end.
