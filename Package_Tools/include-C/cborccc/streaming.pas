unit streaming;

interface

uses
  fp_cbor, data, callbacks;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

function cbor_stream_decode(source: Tcbor_data; source_size: Tsize_t; callbacks: Pcbor_callbacks; context: pointer): Tcbor_decoder_result; cdecl; external libcbor;

// === Konventiert am: 9-4-26 17:15:47 ===


implementation



end.
