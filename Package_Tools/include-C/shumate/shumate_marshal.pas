unit shumate_marshal;

interface

uses
  fp_GTK4, fp_glib2, fp_shumate;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


procedure _shumate_marshal_VOID__DOUBLE_DOUBLE_BOXED(closure: PGClosure; return_value: PGValue; n_param_values: Tguint; param_values: PGValue; invocation_hint: Tgpointer;
  marshal_data: Tgpointer); cdecl; external libshumate;
procedure _shumate_marshal_VOID__UINT_UINT(closure: PGClosure; return_value: PGValue; n_param_values: Tguint; param_values: PGValue; invocation_hint: Tgpointer;
  marshal_data: Tgpointer); cdecl; external libshumate;
procedure _shumate_marshal_VOID__OBJECT_OBJECT(closure: PGClosure; return_value: PGValue; n_param_values: Tguint; param_values: PGValue; invocation_hint: Tgpointer;
  marshal_data: Tgpointer); cdecl; external libshumate;

// === Konventiert am: 6-5-26 15:48:57 ===


implementation



end.
