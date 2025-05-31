{$IFDEF read_interface}


procedure efl_access_attributes_list_free(list: PEina_List); cdecl; external libelementary;
procedure efl_access_attribute_free(attr: PEfl_Access_Attribute); cdecl; external libelementary;

procedure efl_access_i18n_name_changed_signal_emit(obj : PEfl_Access_Object);
procedure efl_access_description_changed_signal_emit(obj : PEfl_Access_Object);
procedure efl_access_parent_changed_signal_emit(obj : PEfl_Access_Object);
procedure efl_access_role_changed_signal_emit(obj : PEfl_Access_Object);
procedure efl_access_value_changed_signal_emit(obj : PEfl_Access_Object);
procedure efl_access_active_descendant_changed_signal_emit(obj:PEfl_Access_Object; child : Pointer);
procedure efl_access_visible_data_changed_signal_emit(obj : PEfl_Access_Object);
procedure efl_access_added(obj : PEfl_Access_Object);
procedure efl_access_removed(obj : PEfl_Access_Object);

// === Konventiert am: 30-5-25 14:00:22 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


procedure efl_access_i18n_name_changed_signal_emit(obj: PEfl_Access_Object);
begin
  efl_access_object_event_emit(obj, EFL_ACCESS_OBJECT_EVENT_PROPERTY_CHANGED, pchar('i18n_name'));
end;

procedure efl_access_description_changed_signal_emit(obj: PEfl_Access_Object);
begin
  efl_access_object_event_emit(obj, EFL_ACCESS_OBJECT_EVENT_PROPERTY_CHANGED, pchar('description'));
end;

procedure efl_access_parent_changed_signal_emit(obj: PEfl_Access_Object);
begin
  efl_access_object_event_emit(obj, EFL_ACCESS_OBJECT_EVENT_PROPERTY_CHANGED, pchar('parent'));
end;

procedure efl_access_role_changed_signal_emit(obj: PEfl_Access_Object);
begin
  efl_access_object_event_emit(obj, EFL_ACCESS_OBJECT_EVENT_PROPERTY_CHANGED, pchar('role'));
end;

procedure efl_access_value_changed_signal_emit(obj: PEfl_Access_Object);
begin
  efl_access_object_event_emit(obj, EFL_ACCESS_OBJECT_EVENT_PROPERTY_CHANGED, pchar('value'));
end;

procedure efl_access_active_descendant_changed_signal_emit(obj: PEfl_Access_Object; child: Pointer);
begin
  efl_access_object_event_emit(obj, EFL_ACCESS_OBJECT_EVENT_ACTIVE_DESCENDANT_CHANGED, child);
end;

procedure efl_access_visible_data_changed_signal_emit(obj: PEfl_Access_Object);
begin
  efl_access_object_event_emit(obj, EFL_ACCESS_OBJECT_EVENT_VISIBLE_DATA_CHANGED, nil);
end;

procedure efl_access_added(obj: PEfl_Access_Object);
begin
  efl_access_object_event_emit(obj, EFL_ACCESS_OBJECT_EVENT_ADDED, nil);
end;

procedure efl_access_removed(obj: PEfl_Access_Object);
begin
  efl_access_object_event_emit(obj, EFL_ACCESS_OBJECT_EVENT_REMOVED, nil);
end;




{$ENDIF read_implementation}
