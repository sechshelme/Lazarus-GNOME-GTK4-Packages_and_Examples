{$IFDEF read_interface}


  {$ifdef EFL_BETA_API_SUPPORT}
type
  PEfl_Net_Ssl_Verify_Mode = ^TEfl_Net_Ssl_Verify_Mode;
  TEfl_Net_Ssl_Verify_Mode = longint;

const
  EFL_NET_SSL_VERIFY_MODE_NONE = 0;
  EFL_NET_SSL_VERIFY_MODE_OPTIONAL = 1;
  EFL_NET_SSL_VERIFY_MODE_REQUIRED = 2;
  {$endif}

  {$ifdef EFL_BETA_API_SUPPORT}
type
  PEfl_Net_Ssl_Cipher = ^TEfl_Net_Ssl_Cipher;
  TEfl_Net_Ssl_Cipher = longint;

const
  EFL_NET_SSL_CIPHER_AUTO = 0;
  EFL_NET_SSL_CIPHER_TLSV1 = 1;
  EFL_NET_SSL_CIPHER_TLSV1_1 = 2;
  EFL_NET_SSL_CIPHER_TLSV1_2 = 3;
  {$endif}

  // === Konventiert am: 9-6-25 17:21:07 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
