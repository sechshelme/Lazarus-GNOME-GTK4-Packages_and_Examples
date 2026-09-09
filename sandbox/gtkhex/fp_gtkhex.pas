unit fp_gtkhex;

interface

uses
  fp_glib2, fp_GTK4;

const
  {$IFDEF Linux}
  libgtk4hex = 'gtkhex-4';
  {$ENDIF}

  {$IFDEF windows}
  libgtk4hex = 'libgtkhex-4-1.dll';
  {$ENDIF}

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  // ==== hex-buffer-iface.h

type
  PHexBuffer = type Pointer;

  THexBufferNewFunc = function(file_: PGFile): PHexBuffer; cdecl;

  PHexBufferInterface = ^THexBufferInterface;
  THexBufferInterface = record
    parent_iface: TGTypeInterface;
    get_data: function(self: PHexBuffer; offset: Tgint64; len: Tsize_t): pchar; cdecl;
    get_byte: function(self: PHexBuffer; offset: Tgint64): char; cdecl;
    set_data: function(self: PHexBuffer; offset: Tgint64; len: Tsize_t; rep_len: Tsize_t; data: pchar): Tgboolean; cdecl;
    get_file: function(self: PHexBuffer): PGFile; cdecl;
    set_file: function(self: PHexBuffer; file_: PGFile): Tgboolean; cdecl;
    read: function(self: PHexBuffer): Tgboolean; cdecl;
    read_async: procedure(self: PHexBuffer; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl;
    read_finish: function(self: PHexBuffer; result: PGAsyncResult; error: PPGError): Tgboolean; cdecl;
    write_to_file: function(self: PHexBuffer; file_: PGFile): Tgboolean; cdecl;
    write_to_file_async: procedure(self: PHexBuffer; file_: PGFile; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl;
    write_to_file_finish: function(self: PHexBuffer; result: PGAsyncResult; error: PPGError): Tgboolean; cdecl;
    get_payload_size: function(self: PHexBuffer): Tgint64; cdecl;
    padding: array[0..11] of Tgpointer;
  end;

function hex_buffer_get_type: TGType; cdecl; external libgtk4hex;
function hex_buffer_get_data(self: PHexBuffer; offset: Tgint64; len: Tsize_t): pchar; cdecl; external libgtk4hex;
function hex_buffer_get_byte(self: PHexBuffer; offset: Tgint64): char; cdecl; external libgtk4hex;
function hex_buffer_set_data(self: PHexBuffer; offset: Tgint64; len: Tsize_t; rep_len: Tsize_t; data: pchar): Tgboolean; cdecl; external libgtk4hex;
function hex_buffer_set_file(self: PHexBuffer; file_: PGFile): Tgboolean; cdecl; external libgtk4hex;
function hex_buffer_read(self: PHexBuffer): Tgboolean; cdecl; external libgtk4hex;
procedure hex_buffer_read_async(buf: PHexBuffer; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libgtk4hex;
function hex_buffer_read_finish(buf: PHexBuffer; result: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libgtk4hex;
function hex_buffer_write_to_file(self: PHexBuffer; file_: PGFile): Tgboolean; cdecl; external libgtk4hex;
procedure hex_buffer_write_to_file_async(self: PHexBuffer; file_: PGFile; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libgtk4hex;
function hex_buffer_write_to_file_finish(self: PHexBuffer; result: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libgtk4hex;
function hex_buffer_get_payload_size(self: PHexBuffer): Tgint64; cdecl; external libgtk4hex;
function hex_buffer_util_get_file_size(file_: PGFile): Tgint64; cdecl; external libgtk4hex;
function hex_buffer_util_new(plugin: pchar; file_: PGFile): PHexBuffer; cdecl; external libgtk4hex;


// ==== hex-document.h

type
  PHexChangeType = ^THexChangeType;
  THexChangeType = longint;
const
  HEX_CHANGE_STRING = 0;
  HEX_CHANGE_BYTE = 1;

type
  PHexSearchFlags = ^THexSearchFlags;
  THexSearchFlags = longint;
const
  HEX_SEARCH_NONE = 0;
  HEX_SEARCH_REGEX = 1 shl 0;
  HEX_SEARCH_IGNORE_CASE = 1 shl 1;

type
  PHexDocumentFindData = ^THexDocumentFindData;
  THexDocumentFindData = record
    found: Tgboolean;
    start: Tgint64;
    what: pchar;
    len: Tsize_t;
    flags: THexSearchFlags;
    offset: Tgint64;
    found_len: Tsize_t;
    found_msg: pchar;
    not_found_msg: pchar;
    padding1: array[0..4] of Tgpointer;
    padding2: array[0..4] of Tgint64;
    padding3: array[0..4] of longint;
  end;

type
  PHexChangeData = ^THexChangeData;
  THexChangeData = record
    start: Tgint64;
    end_: Tgint64;
    rep_len: Tsize_t;
    lower_nibble: Tgboolean;
    insert: Tgboolean;
    _type: THexChangeType;
    v_string: pchar;
    v_byte: char;
    padding1: array[0..4] of Tgpointer;
    padding2: array[0..4] of Tgint64;
    padding3: array[0..4] of longint;
  end;

type
  PHexDocument = type Pointer;

  THexDocumentClass = record
    parent_class: TGObjectClass;
  end;
  PHexDocumentClass = ^THexDocumentClass;

function hex_document_get_type: TGType; cdecl; external libgtk4hex;
function hex_document_find_data_get_type: TGType; cdecl; external libgtk4hex;
function hex_change_data_get_type: TGType; cdecl; external libgtk4hex;
function hex_document_new: PHexDocument; cdecl; external libgtk4hex;
function hex_document_new_from_file(file_: PGFile): PHexDocument; cdecl; external libgtk4hex;
procedure hex_document_set_data(doc: PHexDocument; offset: Tgint64; len: Tsize_t; rep_len: Tsize_t; data: pchar;
  undoable: Tgboolean); cdecl; external libgtk4hex;
procedure hex_document_set_byte(doc: PHexDocument; val: char; offset: Tgint64; insert: Tgboolean; undoable: Tgboolean); cdecl; external libgtk4hex;
procedure hex_document_set_nibble(doc: PHexDocument; val: char; offset: Tgint64; lower_nibble: Tgboolean; insert: Tgboolean;
  undoable: Tgboolean); cdecl; external libgtk4hex;
procedure hex_document_delete_data(doc: PHexDocument; offset: Tgint64; len: Tsize_t; undoable: Tgboolean); cdecl; external libgtk4hex;
procedure hex_document_read_async(doc: PHexDocument; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libgtk4hex;
function hex_document_read_finish(doc: PHexDocument; result: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libgtk4hex;
function hex_document_write(doc: PHexDocument): Tgboolean; cdecl; external libgtk4hex;
function hex_document_write_to_file(doc: PHexDocument; file_: PGFile): Tgboolean; cdecl; external libgtk4hex;
procedure hex_document_write_to_file_async(doc: PHexDocument; file_: PGFile; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libgtk4hex;
procedure hex_document_write_async(doc: PHexDocument; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libgtk4hex;
function hex_document_write_finish(doc: PHexDocument; result: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libgtk4hex;
function hex_document_export_html(doc: PHexDocument; html_path: pchar; base_name: pchar; start: Tgint64; end_: Tgint64;
  cpl: Tguint; lpp: Tguint; cpw: Tguint): Tgboolean; cdecl; external libgtk4hex;
function hex_document_has_changed(doc: PHexDocument): Tgboolean; cdecl; external libgtk4hex;
procedure hex_document_changed(doc: PHexDocument; change_data: Tgpointer; push_undo: Tgboolean); cdecl; external libgtk4hex;
procedure hex_document_set_max_undo(doc: PHexDocument; max_undo: longint); cdecl; external libgtk4hex;
function hex_document_undo(doc: PHexDocument): Tgboolean; cdecl; external libgtk4hex;
function hex_document_redo(doc: PHexDocument): Tgboolean; cdecl; external libgtk4hex;
function hex_document_compare_data(doc: PHexDocument; what: pchar; pos: Tgint64; len: Tsize_t): longint; cdecl; external libgtk4hex;
function hex_document_compare_data_full(doc: PHexDocument; find_data: PHexDocumentFindData; pos: Tgint64): longint; cdecl; external libgtk4hex;
function hex_document_find_forward(doc: PHexDocument; start: Tgint64; what: pchar; len: Tsize_t; offset: Pgint64): Tgboolean; cdecl; external libgtk4hex;
function hex_document_find_forward_full(doc: PHexDocument; find_data: PHexDocumentFindData): Tgboolean; cdecl; external libgtk4hex;
procedure hex_document_find_forward_async(doc: PHexDocument; start: Tgint64; what: pchar; len: Tsize_t; offset: Pgint64;
  found_msg: pchar; not_found_msg: pchar; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libgtk4hex;
procedure hex_document_find_forward_full_async(doc: PHexDocument; find_data: PHexDocumentFindData; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libgtk4hex;
function hex_document_find_backward(doc: PHexDocument; start: Tgint64; what: pchar; len: Tsize_t; offset: Pgint64): Tgboolean; cdecl; external libgtk4hex;
function hex_document_find_backward_full(doc: PHexDocument; find_data: PHexDocumentFindData): Tgboolean; cdecl; external libgtk4hex;
procedure hex_document_find_backward_async(doc: PHexDocument; start: Tgint64; what: pchar; len: Tsize_t; offset: Pgint64;
  found_msg: pchar; not_found_msg: pchar; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libgtk4hex;
procedure hex_document_find_backward_full_async(doc: PHexDocument; find_data: PHexDocumentFindData; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libgtk4hex;
function hex_document_find_finish(doc: PHexDocument; result: PGAsyncResult): PHexDocumentFindData; cdecl; external libgtk4hex;
function hex_document_can_undo(doc: PHexDocument): Tgboolean; cdecl; external libgtk4hex;
function hex_document_can_redo(doc: PHexDocument): Tgboolean; cdecl; external libgtk4hex;
function hex_document_get_file_size(doc: PHexDocument): Tgint64; cdecl; external libgtk4hex;
function hex_document_get_file(doc: PHexDocument): PGFile; cdecl; external libgtk4hex;
function hex_document_set_file(doc: PHexDocument; file_: PGFile): Tgboolean; cdecl; external libgtk4hex;
function hex_document_get_undo_data(doc: PHexDocument): PHexChangeData; cdecl; external libgtk4hex;
function hex_document_get_buffer(doc: PHexDocument): PHexBuffer; cdecl; external libgtk4hex;
function hex_document_set_buffer(doc: PHexDocument; buf: PHexBuffer): Tgboolean; cdecl; external libgtk4hex;

function hex_document_find_data_new: PHexDocumentFindData; cdecl; external libgtk4hex;
function hex_document_find_data_copy(data: PHexDocumentFindData): PHexDocumentFindData; cdecl; external libgtk4hex;


// ==== gtkhex-paste-data.h

type
  PHexPasteData = type Pointer;

  THexPasteDataClass = record
    parent_class: TGObjectClass;
  end;
  PHexPasteDataClass = ^THexPasteDataClass;

function hex_paste_data_get_type: TGType; cdecl; external libgtk4hex;
function hex_paste_data_new(doc_data: pchar; elems: longint): PHexPasteData; cdecl; external libgtk4hex;
function hex_paste_data_get_string(self: PHexPasteData): pchar; cdecl; external libgtk4hex;
function hex_paste_data_get_doc_data(self: PHexPasteData): pchar; cdecl; external libgtk4hex;
function hex_paste_data_get_elems(self: PHexPasteData): longint; cdecl; external libgtk4hex;

// ==== gtkhex.h

type
  PHexWidgetGroupType = ^THexWidgetGroupType;
  THexWidgetGroupType = longint;
const
  HEX_WIDGET_GROUP_BYTE = 1;
  HEX_WIDGET_GROUP_WORD = 2;
  HEX_WIDGET_GROUP_LONG = 4;
  HEX_WIDGET_GROUP_QUAD = 8;

type
  PHexWidget = type Pointer;

  THexWidgetClass = record
    parent_class: TGtkWidgetClass;
  end;
  PHexWidgetClass = ^THexWidgetClass;

type
  PHexWidgetMark = type Pointer;

  THexWidgetMarkClass = record
    parent_class: TGObjectClass;
  end;
  PHexWidgetMarkClass = ^THexWidgetMarkClass;

  PHexWidgetAutoHighlight = type Pointer;

function hex_widget_get_type: TGType; cdecl; external libgtk4hex;
function hex_widget_mark_get_type: TGType; cdecl; external libgtk4hex;
function hex_widget_autohighlight_get_type: TGType; cdecl; external libgtk4hex;
function hex_widget_new(owner: PHexDocument): PGtkWidget; cdecl; external libgtk4hex;
procedure hex_widget_set_cursor(gh: PHexWidget; index: Tgint64); cdecl; external libgtk4hex;
procedure hex_widget_set_cursor_by_row_and_col(gh: PHexWidget; col_x: longint; line_y: Tgint64); cdecl; external libgtk4hex;
procedure hex_widget_set_nibble(gh: PHexWidget; lower_nibble: Tgboolean); cdecl; external libgtk4hex;
function hex_widget_get_cursor(gh: PHexWidget): Tgint64; cdecl; external libgtk4hex;
function hex_widget_get_byte(gh: PHexWidget; offset: Tgint64): Tguchar; cdecl; external libgtk4hex;
procedure hex_widget_set_group_type(gh: PHexWidget; gt: THexWidgetGroupType); cdecl; external libgtk4hex;
function hex_widget_get_group_type(gh: PHexWidget): THexWidgetGroupType; cdecl; external libgtk4hex;
procedure hex_widget_show_offsets(gh: PHexWidget; show: Tgboolean); cdecl; external libgtk4hex;
procedure hex_widget_show_hex_column(self: PHexWidget; show: Tgboolean); cdecl; external libgtk4hex;
procedure hex_widget_show_ascii_column(self: PHexWidget; show: Tgboolean); cdecl; external libgtk4hex;
function hex_widget_get_insert_mode(gh: PHexWidget): Tgboolean; cdecl; external libgtk4hex;
procedure hex_widget_set_insert_mode(gh: PHexWidget; insert: Tgboolean); cdecl; external libgtk4hex;
procedure hex_widget_set_geometry(gh: PHexWidget; cpl: longint; vis_lines: longint); cdecl; external libgtk4hex;
procedure hex_widget_copy_to_clipboard(gh: PHexWidget); cdecl; external libgtk4hex;
procedure hex_widget_cut_to_clipboard(gh: PHexWidget); cdecl; external libgtk4hex;
procedure hex_widget_paste_from_clipboard(gh: PHexWidget); cdecl; external libgtk4hex;
procedure hex_widget_set_selection(gh: PHexWidget; start: Tgint64; end_: Tgint64); cdecl; external libgtk4hex;
function hex_widget_get_selection(gh: PHexWidget; start: Pgint64; end_: Pgint64): Tgboolean; cdecl; external libgtk4hex;
procedure hex_widget_clear_selection(gh: PHexWidget); cdecl; external libgtk4hex;
procedure hex_widget_delete_selection(gh: PHexWidget); cdecl; external libgtk4hex;
procedure hex_widget_zero_selection(gh: PHexWidget); cdecl; external libgtk4hex;
procedure hex_widget_set_fade_zeroes(self: PHexWidget; fade: Tgboolean); cdecl; external libgtk4hex;
function hex_widget_get_fade_zeroes(self: PHexWidget): Tgboolean; cdecl; external libgtk4hex;
function hex_widget_insert_autohighlight(gh: PHexWidget; search: pchar; len: longint): PHexWidgetAutoHighlight; cdecl; external libgtk4hex;
function hex_widget_insert_autohighlight_full(self: PHexWidget; search: pchar; len: longint; flags: THexSearchFlags): PHexWidgetAutoHighlight; cdecl; external libgtk4hex;
procedure hex_widget_delete_autohighlight(gh: PHexWidget; ahl: PHexWidgetAutoHighlight); cdecl; external libgtk4hex;
function hex_widget_get_adjustment(gh: PHexWidget): PGtkAdjustment; cdecl; external libgtk4hex;
function hex_widget_get_document(gh: PHexWidget): PHexDocument; cdecl; external libgtk4hex;
function hex_widget_add_mark(self: PHexWidget; start: Tgint64; end_: Tgint64; color: PGdkRGBA): PHexWidgetMark; cdecl; external libgtk4hex;
procedure hex_widget_delete_mark(self: PHexWidget; mark: PHexWidgetMark); cdecl; external libgtk4hex;
procedure hex_widget_goto_mark(self: PHexWidget; mark: PHexWidgetMark); cdecl; external libgtk4hex;
procedure hex_widget_set_mark_custom_color(self: PHexWidget; mark: PHexWidgetMark; color: PGdkRGBA); cdecl; external libgtk4hex;
procedure hex_widget_mark_get_custom_color(mark: PHexWidgetMark; color: PGdkRGBA); cdecl; external libgtk4hex;
function hex_widget_mark_get_have_custom_color(mark: PHexWidgetMark): Tgboolean; cdecl; external libgtk4hex;
function hex_widget_mark_get_start_offset(mark: PHexWidgetMark): Tgint64; cdecl; external libgtk4hex;
function hex_widget_mark_get_end_offset(mark: PHexWidgetMark): Tgint64; cdecl; external libgtk4hex;

// === Konventiert am: 9-9-26 16:56:26 ===


// ==== hex-buffer-iface.h

function HEX_TYPE_BUFFER: TGType;
function HEX_BUFFER(obj: Pointer): PHexBuffer;
function HEX_IS_BUFFER(obj: Pointer): Tgboolean;
function HEX_BUFFER_GET_IFACE(obj: Pointer): PHexBufferInterface;


// ==== hex-document.h

function HEX_TYPE_DOCUMENT: TGType;
function HEX_DOCUMENT(obj: Pointer): PHexDocument;
function HEX_IS_DOCUMENT(obj: Pointer): Tgboolean;

function HEX_TYPE_DOCUMENT_FIND_DATA: TGType;
function HEX_TYPE_CHANGE_DATA: TGType;


// ==== gtkhex-paste-data.h

function HEX_TYPE_PASTE_DATA: TGType;
function HEX_PASTE_DATA(obj: Pointer): PHexPasteData;
function HEX_IS_PASTE_DATA(obj: Pointer): Tgboolean;


// ==== gtkhex.h

function HEX_TYPE_WIDGET: TGType;
function HEX_WIDGET(obj: Pointer): PHexWidget;
function HEX_IS_WIDGET(obj: Pointer): Tgboolean;

function HEX_TYPE_WIDGET_MARK: TGType;
function HEX_WIDGET_MARK(obj: Pointer): PHexWidgetMark;
function HEX_IS_WIDGET_MARK(obj: Pointer): Tgboolean;

function HEX_TYPE_WIDGET_AUTOHIGHLIGHT: TGType;


implementation

// ==== hex-buffer-iface.h

function HEX_TYPE_BUFFER: TGType;
begin
  Result := hex_buffer_get_type;
end;

function HEX_BUFFER(obj: Pointer): PHexBuffer;
begin
  Result := PHexBuffer(g_type_check_instance_cast(obj, HEX_TYPE_BUFFER));
end;

function HEX_IS_BUFFER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, HEX_TYPE_BUFFER);
end;

function HEX_BUFFER_GET_IFACE(obj: Pointer): PHexBufferInterface;
begin
  Result := g_type_interface_peek(obj, HEX_TYPE_BUFFER);
end;


// ==== hex-document.h

function HEX_TYPE_DOCUMENT: TGType;
begin
  Result := hex_document_get_type;
end;

function HEX_DOCUMENT(obj: Pointer): PHexDocument;
begin
  Result := PHexDocument(g_type_check_instance_cast(obj, HEX_TYPE_DOCUMENT));
end;

function HEX_IS_DOCUMENT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, HEX_TYPE_DOCUMENT);
end;


function HEX_TYPE_DOCUMENT_FIND_DATA: TGType;
begin
  HEX_TYPE_DOCUMENT_FIND_DATA := hex_document_find_data_get_type;
end;

function HEX_TYPE_CHANGE_DATA: TGType;
begin
  HEX_TYPE_CHANGE_DATA := hex_change_data_get_type;
end;


// ==== gtkhex-paste-data.h

function HEX_TYPE_PASTE_DATA: TGType;
begin
  Result := hex_paste_data_get_type;
end;

function HEX_PASTE_DATA(obj: Pointer): PHexPasteData;
begin
  Result := PHexPasteData(g_type_check_instance_cast(obj, HEX_TYPE_PASTE_DATA));
end;

function HEX_IS_PASTE_DATA(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, HEX_TYPE_PASTE_DATA);
end;


// ==== gtkhex.h

function HEX_TYPE_WIDGET: TGType;
begin
  Result := hex_widget_get_type;
end;

function HEX_WIDGET(obj: Pointer): PHexWidget;
begin
  Result := PHexWidget(g_type_check_instance_cast(obj, HEX_TYPE_WIDGET));
end;

function HEX_IS_WIDGET(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, HEX_TYPE_WIDGET);
end;


function HEX_TYPE_WIDGET_MARK: TGType;
begin
  Result := hex_widget_mark_get_type;
end;

function HEX_WIDGET_MARK(obj: Pointer): PHexWidgetMark;
begin
  Result := PHexWidgetMark(g_type_check_instance_cast(obj, HEX_TYPE_WIDGET_MARK));
end;

function HEX_IS_WIDGET_MARK(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, HEX_TYPE_WIDGET_MARK);
end;


function HEX_TYPE_WIDGET_AUTOHIGHLIGHT: TGType;
begin
  HEX_TYPE_WIDGET_AUTOHIGHLIGHT := hex_widget_autohighlight_get_type;
end;

end.
