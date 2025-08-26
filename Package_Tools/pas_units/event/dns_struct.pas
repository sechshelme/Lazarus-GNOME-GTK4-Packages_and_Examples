unit dns_struct;

interface

uses
  fp_event;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Tevdns_server_question = record
    _type: longint;
    _class: longint;
    name: array[0..0] of char;
  end;
  Pevdns_server_question = ^Tevdns_server_question;

  Tevdns_server_request = record
    flags: longint;
    nquestions: longint;
    questions: ^Pevdns_server_question;
  end;
  Pevdns_server_request = ^Tevdns_server_request;

  // === Konventiert am: 26-8-25 17:43:52 ===


implementation



end.
