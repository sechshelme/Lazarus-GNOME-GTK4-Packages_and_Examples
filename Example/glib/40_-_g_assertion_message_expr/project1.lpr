program project1;

uses
  fp_glib2;

  procedure main;
  var
    i, e: integer;
  begin
    val({$I %LINE%}, i, e);
    g_assertion_message_expr(G_LOG_DOMAIN, {$I %FILE%}, i, 'error', 'gFALSE');
  end;

begin
  main;
end.
