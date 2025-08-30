program project1;

// export http_proxy="http://proxy.example.com:8080"

uses
  fp_glib2,
  fp_proxy;

  procedure ShowProxy;
  var
    pf: PpxProxyFactory;
    proxies: PPChar;
    i: integer = 0;
  begin
    pf := px_proxy_factory_new;
    if pf <> nil then begin
      proxies := px_proxy_factory_get_proxies(pf, 'http://www.example.com');

      if proxies <> nil then begin
        while proxies[i] <> nil do begin
          g_printf('Proxy: %s'#10, proxies[i]);
          Inc(i);
        end;
        px_proxy_factory_free_proxies(proxies);
      end;
      px_proxy_factory_free(pf);
    end;
  end;

  procedure main;
  begin
    ShowProxy;
    g_setenv('http_proxy', 'http://proxy.example.com:8080', gTRUE);
    ShowProxy;
  end;

begin
  main;
end.
