unit ges_container;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gst, ges_enums, ges_types, ges_timeline_element;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_enum}
type
  PGESChildrenControlMode = ^TGESChildrenControlMode;
  TGESChildrenControlMode = longint;
const
  GES_CHILDREN_UPDATE = 0;
  GES_CHILDREN_IGNORE_NOTIFIES = 1;
  GES_CHILDREN_UPDATE_OFFSETS = 2;
  GES_CHILDREN_UPDATE_ALL_VALUES = 3;
  GES_CHILDREN_LAST = 4;
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PGESContainerClass = ^TGESContainerClass;
  TGESContainerClass = record
    parent_class: TGESTimelineElementClass;
    child_added: procedure(container: PGESContainer; element: PGESTimelineElement); cdecl;
    child_removed: procedure(container: PGESContainer; element: PGESTimelineElement); cdecl;
    add_child: function(container: PGESContainer; element: PGESTimelineElement): Tgboolean; cdecl;
    remove_child: function(container: PGESContainer; element: PGESTimelineElement): Tgboolean; cdecl;
    ungroup: function(container: PGESContainer; recursive: Tgboolean): PGList; cdecl;
    group: function(containers: PGList): PGESContainer; cdecl;
    edit: function(container: PGESContainer; layers: PGList; new_layer_priority: Tgint; mode: TGESEditMode; edge: TGESEdge;
      position: Tguint64): Tgboolean; cdecl;
    grouping_priority: Tguint;
    _ges_reserved: array[0..(GES_PADDING_LARGE) - 1] of Tgpointer;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function ges_container_get_type: TGType; cdecl; external libges;
function ges_container_get_children(container: PGESContainer; recursive: Tgboolean): PGList; cdecl; external libges;
function ges_container_add(container: PGESContainer; child: PGESTimelineElement): Tgboolean; cdecl; external libges;
function ges_container_remove(container: PGESContainer; child: PGESTimelineElement): Tgboolean; cdecl; external libges;
function ges_container_ungroup(container: PGESContainer; recursive: Tgboolean): PGList; cdecl; external libges;
function ges_container_group(containers: PGList): PGESContainer; cdecl; external libges;
function ges_container_edit(container: PGESContainer; layers: PGList; new_layer_priority: Tgint; mode: TGESEditMode; edge: TGESEdge;
  position: Tguint64): Tgboolean; cdecl; external libges; deprecated;

// === Konventiert am: 27-7-26 19:55:12 ===

function GES_TYPE_CONTAINER: TGType;
function GES_CONTAINER(obj: Pointer): PGESContainer;
function GES_IS_CONTAINER(obj: Pointer): Tgboolean;
function GES_CONTAINER_CLASS(klass: Pointer): PGESContainerClass;
function GES_IS_CONTAINER_CLASS(klass: Pointer): Tgboolean;
function GES_CONTAINER_GET_CLASS(obj: Pointer): PGESContainerClass;
{$ENDIF read_function}


implementation

function GES_TYPE_CONTAINER: TGType;
begin
  Result := ges_container_get_type;
end;

function GES_CONTAINER(obj: Pointer): PGESContainer;
begin
  Result := PGESContainer(g_type_check_instance_cast(obj, GES_TYPE_CONTAINER));
end;

function GES_IS_CONTAINER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GES_TYPE_CONTAINER);
end;

function GES_CONTAINER_CLASS(klass: Pointer): PGESContainerClass;
begin
  Result := PGESContainerClass(g_type_check_class_cast(klass, GES_TYPE_CONTAINER));
end;

function GES_IS_CONTAINER_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GES_TYPE_CONTAINER);
end;

function GES_CONTAINER_GET_CLASS(obj: Pointer): PGESContainerClass;
begin
  Result := PGESContainerClass(PGTypeInstance(obj)^.g_class);
end;

end.
