program project1;

uses
  fp_glib2;

var
  signal: Tguint;
  klass: Pointer;
  obj: Tgpointer;

  procedure test_cb(self: PGObject; Data: Tgpointer);
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
