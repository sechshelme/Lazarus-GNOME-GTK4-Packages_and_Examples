program project1;

uses
  glib2,
  gtk2;

var
  signal: guint;
  klass: Pointer;
  obj: gpointer;

  procedure test_cb(self: PGObject; Data: gpointer);
  var
    c: PChar absolute Data;
  begin
    WriteLn(c);
  end;

begin
  obj := g_object_new(G_TYPE_OBJECT, nil);
  klass := G_OBJECT_GET_CLASS(obj);

  signal := g_signal_new('test',
    G_TYPE_FROM_CLASS(klass),
    G_SIGNAL_RUN_LAST or G_SIGNAL_NO_RECURSE or G_SIGNAL_NO_HOOKS,
    0,
    nil,
    nil,
    nil,
    G_TYPE_NONE,
    0);

  g_signal_connect(obj, 'test', G_CALLBACK(@test_cb), PChar('Signal 1'));
  g_signal_connect(obj, 'test', G_CALLBACK(@test_cb), PChar('Signal 2'));
  g_signal_connect(obj, 'test', G_CALLBACK(@test_cb), PChar('Signal 3'));

  g_signal_emit(obj, signal, 0);

end.
