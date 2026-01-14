program project1;

{$I-}

uses
  fp_glib2,
  fp_microhttpd;

  procedure printFeatures;
  const
    feature_names: array of pchar = (
      'MHD_FEATURE_MESSAGES',
      'MHD_FEATURE_TLS / MHD_FEATURE_SSL',
      'MHD_FEATURE_HTTPS_CERT_CALLBACK',
      'MHD_FEATURE_IPv6',
      'MHD_FEATURE_IPv6_ONLY',
      'MHD_FEATURE_POLL',
      'MHD_FEATURE_EPOLL',
      'MHD_FEATURE_SHUTDOWN_LISTEN_SOCKET',
      'MHD_FEATURE_SOCKETPAIR',
      'MHD_FEATURE_TCP_FASTOPEN',
      'MHD_FEATURE_BASIC_AUTH',
      'MHD_FEATURE_DIGEST_AUTH',
      'MHD_FEATURE_POSTPROCESSOR',
      'MHD_FEATURE_HTTPS_KEY_PASSWORD',
      'MHD_FEATURE_LARGE_FILE',
      'MHD_FEATURE_THREAD_NAMES / MHD_THREAD_NAMES',
      'MHD_FEATURE_UPGRADE',
      'MHD_FEATURE_RESPONSES_SHARED_FD',
      'MHD_FEATURE_AUTODETECT_BIND_PORT',
      'MHD_FEATURE_AUTOSUPPRESS_SIGPIPE',
      'MHD_FEATURE_SENDFILE',
      'MHD_FEATURE_THREADS',
      'MHD_FEATURE_HTTPS_CERT_CALLBACK2',
      'MHD_FEATURE_HTTPS_COOKIE_PARSING',
      'MHD_FEATURE_DIGEST_AUTH_RFC2069',
      'MHD_FEATURE_DIGEST_AUTH_MD5',
      'MHD_FEATURE_DIGEST_AUTH_SHA256',
      'MHD_FEATURE_DIGEST_AUTH_SHA512_256',
      'MHD_FEATURE_DIGEST_AUTH_AUTH_INT',
      'MHD_FEATURE_DIGEST_AUTH_ALGO_SESSION',
      'MHD_FEATURE_DIGEST_AUTH_USERHASH',
      'MHD_FEATURE_EXTERN_HASH',
      'MHD_FEATURE_DEBUG_BUILD',
      'MHD_FEATURE_FLEXIBLE_FD_SETSIZE');
  var
    i: integer;
    isFeature: TMHD_Result;
  begin
    for i := 0 to Length(feature_names) - 1 do begin
      isFeature := MHD_is_feature_supported(i);
      if isFeature = MHD_YES then begin
        g_printf('  %-50s: (True)'#10, feature_names[i]);
      end else begin
        g_printf('  %-50s: (False)'#10, feature_names[i]);
      end;
    end;
  end;

  procedure main;
  begin
    g_printf('Version: %s'#10#10, MHD_get_version);
    g_printf('Features:'#10);

    printFeatures;
  end;

begin
  main;
end.
