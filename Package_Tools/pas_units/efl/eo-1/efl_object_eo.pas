unit efl_object_eo;

interface

uses
  ctypes, efl, fp_eina;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}

type
  PEfl_Object = ^TEfl_Object;
  TEfl_Object = TEo;
type
  TEfl_Event_Description = record
      name : Pchar;
      unfreezable : TEina_Bool;
      legacy_is : TEina_Bool;
      restart : TEina_Bool;
    end;
  PEfl_Event_Description = ^TEfl_Event_Description;

  PEfl_Callback_Priority = ^TEfl_Callback_Priority;
  TEfl_Callback_Priority = smallint;
const
  EFL_CALLBACK_PRIORITY_BEFORE = -(100);  
  EFL_CALLBACK_PRIORITY_DEFAULT = 0;
  EFL_CALLBACK_PRIORITY_AFTER = 100;
function EFL_OBJECT_CLASS : longint; { return type might be wrong }

function efl_object_class_get:PEfl_Class;cdecl;external libeo;
procedure efl_parent_set(obj:PEo; parent:PEfl_Object);cdecl;external libeo;
function efl_parent_get(obj:PEo):PEfl_Object;cdecl;external libeo;
procedure efl_name_set(obj:PEo; name:Pchar);cdecl;external libeo;
function efl_name_get(obj:PEo):Pchar;cdecl;external libeo;
procedure efl_comment_set(obj:PEo; comment:Pchar);cdecl;external libeo;
function efl_comment_get(obj:PEo):Pchar;cdecl;external libeo;
procedure efl_debug_name_override(obj:PEo; sb:PEina_Strbuf);cdecl;external libeo;
function efl_event_global_freeze_count_get:longint;cdecl;external libeo;
function efl_event_freeze_count_get(obj:PEo):longint;cdecl;external libeo;
function efl_finalized_get(obj:PEo):TEina_Bool;cdecl;external libeo;
function efl_invalidated_get(obj:PEo):TEina_Bool;cdecl;external libeo;
function efl_invalidating_get(obj:PEo):TEina_Bool;cdecl;external libeo;
function efl_provider_find(obj:PEo; klass:PEfl_Class):PEfl_Object;cdecl;external libeo;
function efl_constructor(obj:PEo):PEfl_Object;cdecl;external libeo;
procedure efl_destructor(obj:PEo);cdecl;external libeo;
function efl_finalize(obj:PEo):PEfl_Object;cdecl;external libeo;
procedure efl_invalidate(obj:PEo);cdecl;external libeo;
{$ifdef EFL_BETA_API_SUPPORT}
function efl_name_find(obj:PEo; search:Pchar):PEfl_Object;cdecl;external libeo;
{$endif}

procedure efl_event_thaw(obj:PEo);cdecl;external libeo;
procedure efl_event_freeze(obj:PEo);cdecl;external libeo;
procedure efl_event_global_thaw;cdecl;external libeo;
procedure efl_event_global_freeze;cdecl;external libeo;
procedure efl_event_callback_stop(obj:PEo);cdecl;external libeo;
procedure efl_event_callback_forwarder_priority_add(obj:PEo; desc:PEfl_Event_Description; priority:TEfl_Callback_Priority; source:PEfl_Object);cdecl;external libeo;
procedure efl_event_callback_forwarder_del(obj:PEo; desc:PEfl_Event_Description; new_obj:PEfl_Object);cdecl;external libeo;
function efl_children_iterator_new(obj:PEo):PEina_Iterator;cdecl;external libeo;
{$ifdef EFL_BETA_API_SUPPORT}
function efl_composite_attach(obj:PEo; comp_obj:PEfl_Object):TEina_Bool;cdecl;external libeo;
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
function efl_composite_detach(obj:PEo; comp_obj:PEfl_Object):TEina_Bool;cdecl;external libeo;
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
function efl_composite_part_is(obj:PEo):TEina_Bool;cdecl;external libeo;
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
procedure efl_allow_parent_unref_set(obj:PEo; allow:TEina_Bool);cdecl;external libeo;
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
function efl_allow_parent_unref_get(obj:PEo):TEina_Bool;cdecl;external libeo;
{$endif}
function efl_provider_register(obj:PEo; klass:PEfl_Class; provider:PEfl_Object):TEina_Bool;cdecl;external libeo;
function efl_provider_unregister(obj:PEo; klass:PEfl_Class; provider:PEfl_Object):TEina_Bool;cdecl;external libeo;
  var
    _EFL_EVENT_DEL : TEfl_Event_Description;cvar;external libeo;
    _EFL_EVENT_INVALIDATE : TEfl_Event_Description;cvar;external libeo;
    _EFL_EVENT_NOREF : TEfl_Event_Description;cvar;external libeo;
    _EFL_EVENT_OWNERSHIP_UNIQUE : TEfl_Event_Description;cvar;external libeo;
    _EFL_EVENT_OWNERSHIP_SHARED : TEfl_Event_Description;cvar;external libeo;
    _EFL_EVENT_DESTRUCT : TEfl_Event_Description;cvar;external libeo;

    function EFL_EVENT_DEL : longint; { return type might be wrong }
function EFL_EVENT_INVALIDATE : longint; { return type might be wrong }
function EFL_EVENT_NOREF : longint; { return type might be wrong }
function EFL_EVENT_OWNERSHIP_UNIQUE : longint; { return type might be wrong }
function EFL_EVENT_OWNERSHIP_SHARED : longint; { return type might be wrong }
function EFL_EVENT_DESTRUCT : longint; { return type might be wrong }


// === Konventiert am: 18-5-25 13:19:06 ===


implementation


{ was #define dname def_expr }
function EFL_OBJECT_CLASS : longint; { return type might be wrong }
  begin
    EFL_OBJECT_CLASS:=efl_object_class_get;
  end;

{ was #define dname def_expr }
function EFL_EVENT_DEL : longint; { return type might be wrong }
  begin
    EFL_EVENT_DEL:=@(_EFL_EVENT_DEL);
  end;

{ was #define dname def_expr }
function EFL_EVENT_INVALIDATE : longint; { return type might be wrong }
  begin
    EFL_EVENT_INVALIDATE:=@(_EFL_EVENT_INVALIDATE);
  end;

{ was #define dname def_expr }
function EFL_EVENT_NOREF : longint; { return type might be wrong }
  begin
    EFL_EVENT_NOREF:=@(_EFL_EVENT_NOREF);
  end;

{ was #define dname def_expr }
function EFL_EVENT_OWNERSHIP_UNIQUE : longint; { return type might be wrong }
  begin
    EFL_EVENT_OWNERSHIP_UNIQUE:=@(_EFL_EVENT_OWNERSHIP_UNIQUE);
  end;

{ was #define dname def_expr }
function EFL_EVENT_OWNERSHIP_SHARED : longint; { return type might be wrong }
  begin
    EFL_EVENT_OWNERSHIP_SHARED:=@(_EFL_EVENT_OWNERSHIP_SHARED);
  end;

{ was #define dname def_expr }
function EFL_EVENT_DESTRUCT : longint; { return type might be wrong }
  begin
    EFL_EVENT_DESTRUCT:=@(_EFL_EVENT_DESTRUCT);
  end;


end.
