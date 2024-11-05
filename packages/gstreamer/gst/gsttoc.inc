/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 20-09-2024   15:33                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

var
  _gst_toc_type: TGType; cvar;external libgstreamer;
  _gst_toc_entry_type: TGType; cvar;external libgstreamer;

type
  PGstTocScope = ^TGstTocScope;
  TGstTocScope = longint;

const
  GST_TOC_SCOPE_GLOBAL = 1;
  GST_TOC_SCOPE_CURRENT = 2;

type
  PGstTocEntryType = ^TGstTocEntryType;
  TGstTocEntryType = longint;

const
  GST_TOC_ENTRY_TYPE_ANGLE = -(3);
  GST_TOC_ENTRY_TYPE_VERSION = -(2);
  GST_TOC_ENTRY_TYPE_EDITION = -(1);
  GST_TOC_ENTRY_TYPE_INVALID = 0;
  GST_TOC_ENTRY_TYPE_TITLE = 1;
  GST_TOC_ENTRY_TYPE_TRACK = 2;
  GST_TOC_ENTRY_TYPE_CHAPTER = 3;

type
  PGstTocLoopType = ^TGstTocLoopType;
  TGstTocLoopType = longint;

const
  GST_TOC_LOOP_NONE = 0;
  GST_TOC_LOOP_FORWARD = 1;
  GST_TOC_LOOP_REVERSE = 2;
  GST_TOC_LOOP_PING_PONG = 3;
  GST_TOC_REPEAT_COUNT_INFINITE = -(1);

type
  TGstToc = record
  end;
  PGstToc = ^TGstToc;
  PPGstToc = ^PGstToc;

  TGstTocEntry = record
  end;
  PGstTocEntry = ^TGstTocEntry;

function gst_toc_get_type: TGType; cdecl; external libgstreamer;
function gst_toc_entry_get_type: TGType; cdecl; external libgstreamer;
function gst_toc_new(scope: TGstTocScope): PGstToc; cdecl; external libgstreamer;
function gst_toc_get_scope(toc: PGstToc): TGstTocScope; cdecl; external libgstreamer;
procedure gst_toc_set_tags(toc: PGstToc; tags: PGstTagList); cdecl; external libgstreamer;
procedure gst_toc_merge_tags(toc: PGstToc; tags: PGstTagList; mode: TGstTagMergeMode); cdecl; external libgstreamer;
function gst_toc_get_tags(toc: PGstToc): PGstTagList; cdecl; external libgstreamer;
procedure gst_toc_append_entry(toc: PGstToc; entry: PGstTocEntry); cdecl; external libgstreamer;
function gst_toc_get_entries(toc: PGstToc): PGList; cdecl; external libgstreamer;
procedure gst_toc_dump(toc: PGstToc); cdecl; external libgstreamer;

function gst_toc_find_entry(toc: PGstToc; uid: Pgchar): PGstTocEntry; cdecl; external libgstreamer;
function gst_toc_entry_get_entry_type(entry: PGstTocEntry): TGstTocEntryType; cdecl; external libgstreamer;
function gst_toc_entry_get_uid(entry: PGstTocEntry): Pgchar; cdecl; external libgstreamer;
procedure gst_toc_entry_append_sub_entry(entry: PGstTocEntry; subentry: PGstTocEntry); cdecl; external libgstreamer;
function gst_toc_entry_get_sub_entries(entry: PGstTocEntry): PGList; cdecl; external libgstreamer;
procedure gst_toc_entry_set_tags(entry: PGstTocEntry; tags: PGstTagList); cdecl; external libgstreamer;
procedure gst_toc_entry_merge_tags(entry: PGstTocEntry; tags: PGstTagList; mode: TGstTagMergeMode); cdecl; external libgstreamer;
function gst_toc_entry_get_tags(entry: PGstTocEntry): PGstTagList; cdecl; external libgstreamer;
function gst_toc_entry_is_alternative(entry: PGstTocEntry): Tgboolean; cdecl; external libgstreamer;
function gst_toc_entry_is_sequence(entry: PGstTocEntry): Tgboolean; cdecl; external libgstreamer;
procedure gst_toc_entry_set_start_stop_times(entry: PGstTocEntry; start: Tgint64; stop: Tgint64); cdecl; external libgstreamer;
function gst_toc_entry_get_start_stop_times(entry: PGstTocEntry; start: Pgint64; stop: Pgint64): Tgboolean; cdecl; external libgstreamer;
procedure gst_toc_entry_set_loop(entry: PGstTocEntry; loop_type: TGstTocLoopType; repeat_count: Tgint); cdecl; external libgstreamer;
function gst_toc_entry_get_loop(entry: PGstTocEntry; loop_type: PGstTocLoopType; repeat_count: Pgint): Tgboolean; cdecl; external libgstreamer;
function gst_toc_entry_get_toc(entry: PGstTocEntry): PGstToc; cdecl; external libgstreamer;
function gst_toc_entry_get_parent(entry: PGstTocEntry): PGstTocEntry; cdecl; external libgstreamer;
function gst_toc_entry_type_get_nick(_type: TGstTocEntryType): Pgchar; cdecl; external libgstreamer;
function gst_toc_entry_new(_type: TGstTocEntryType; uid: Pgchar): PGstTocEntry; cdecl; external libgstreamer;

procedure _gst_autoptr_toc_unref(toc: PGstToc);
procedure _gst_autoptr_toc_entry_unref(entry: PGstTocEntry);

function GST_TYPE_TOC: TGType;
function GST_TYPE_TOC_ENTRY: TGType;

function GST_TOC_ENTRY_TYPE_IS_ALTERNATIVE(entry_type: TGType): Tgboolean;
function GST_TOC_ENTRY_TYPE_IS_SEQUENCE(entry_type: TGType): Tgboolean;

function gst_toc_ref(toc: Pointer): PGstToc;
procedure gst_toc_unref(toc: Pointer);
function gst_toc_copy(toc: Pointer): PGstToc;
function gst_toc_make_writable(toc: Pointer): PGstToc;
function gst_toc_entry_ref(entry: Pointer): PGstTocEntry;
procedure gst_toc_entry_unref(entry: Pointer);
function gst_toc_entry_copy(entry: Pointer): PGstTocEntry;
function gst_toc_entry_make_writable(entry: Pointer): PGstTocEntry;


// === Konventiert am: 14-9-24 17:00:29 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}

procedure _gst_autoptr_toc_unref(toc: PGstToc);
begin
  gst_toc_unref(toc);
end;

procedure _gst_autoptr_toc_entry_unref(entry: PGstTocEntry);
begin
  gst_toc_entry_unref(entry);
end;

function GST_TYPE_TOC: TGType;
begin
  Result := _gst_toc_type;
end;

function GST_TYPE_TOC_ENTRY: TGType;
begin
  Result := _gst_toc_entry_type;
end;


function GST_TOC_ENTRY_TYPE_IS_ALTERNATIVE(entry_type: TGType): Tgboolean;
begin
  GST_TOC_ENTRY_TYPE_IS_ALTERNATIVE := entry_type < 0;
end;

function GST_TOC_ENTRY_TYPE_IS_SEQUENCE(entry_type: TGType): Tgboolean;
begin
  GST_TOC_ENTRY_TYPE_IS_SEQUENCE := entry_type > 0;
end;

function gst_toc_ref(toc: Pointer): PGstToc;
begin
  gst_toc_ref := PGstToc(gst_mini_object_ref(GST_MINI_OBJECT_CAST(toc)));
end;

procedure gst_toc_unref(toc: Pointer);
begin
  gst_mini_object_unref(GST_MINI_OBJECT_CAST(toc));
end;

function gst_toc_copy(toc: Pointer): PGstToc;
begin
  gst_toc_copy := PGstToc(gst_mini_object_copy(GST_MINI_OBJECT_CAST(toc)));
end;

function gst_toc_make_writable(toc: Pointer): PGstToc;
begin
  gst_toc_make_writable := PGstToc(gst_mini_object_make_writable(GST_MINI_OBJECT_CAST(toc)));
end;

function gst_toc_entry_ref(entry: Pointer): PGstTocEntry;
begin
  gst_toc_entry_ref := PGstTocEntry(gst_mini_object_ref(GST_MINI_OBJECT_CAST(entry)));
end;

procedure gst_toc_entry_unref(entry: Pointer);
begin
  gst_mini_object_unref(GST_MINI_OBJECT_CAST(entry));
end;

function gst_toc_entry_copy(entry: Pointer): PGstTocEntry;
begin
  gst_toc_entry_copy := PGstTocEntry(gst_mini_object_copy(GST_MINI_OBJECT_CAST(entry)));
end;

function gst_toc_entry_make_writable(entry: Pointer): PGstTocEntry;
begin
  gst_toc_entry_make_writable := PGstTocEntry(gst_mini_object_make_writable(GST_MINI_OBJECT_CAST(entry)));
end;


{$ENDIF read_implementation}
