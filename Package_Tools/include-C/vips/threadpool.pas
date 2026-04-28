unit threadpool;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_vips, object_, rect;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  TVipsThreadState = record
    parent_object: TVipsObject;
    im: PVipsImage;
    reg: PVipsRegion;
    pos: TVipsRect;
    x: longint;
    y: longint;
    stop: Tgboolean;
    a: pointer;
    stall: Tgboolean;
  end;
  PVipsThreadState = ^TVipsThreadState;

  TVipsThreadStateClass = record
    parent_class: TVipsObjectClass;
  end;
  PVipsThreadStateClass = ^TVipsThreadStateClass;
  {$ENDIF read_struct}

{$IFDEF read_function}
function vips_thread_state_set(obj: PVipsObject; a: pointer; b: pointer): pointer; cdecl; external libvips;
function vips_thread_state_get_type: TGType; cdecl; external libvips;
function vips_thread_state_new(im: PVipsImage; a: pointer): PVipsThreadState; cdecl; external libvips;
{$ENDIF read_function}

{$IFDEF read_struct}
type
  TVipsThreadStartFn = function(im: PVipsImage; a: pointer): PVipsThreadState; cdecl;
  TVipsThreadpoolAllocateFn = function(state: PVipsThreadState; a: pointer; stop: Pgboolean): longint; cdecl;
  TVipsThreadpoolWorkFn = function(state: PVipsThreadState; a: pointer): longint; cdecl;
  TVipsThreadpoolProgressFn = function(a: pointer): longint; cdecl;
  {$ENDIF read_struct}

{$IFDEF read_function}
function vips_threadpool_run(im: PVipsImage; start: TVipsThreadStartFn; allocate: TVipsThreadpoolAllocateFn; work: TVipsThreadpoolWorkFn; progress: TVipsThreadpoolProgressFn; a: pointer): longint; cdecl; external libvips;
procedure vips_get_tile_size(im: PVipsImage; tile_width: Plongint; tile_height: Plongint; n_lines: Plongint); cdecl; external libvips;

// === Konventiert am: 26-4-26 16:09:45 ===

function VIPS_TYPE_THREAD_STATE: TGType;
function VIPS_THREAD_STATE(obj: Pointer): PVipsThreadState;
function VIPS_THREAD_STATE_CLASS(klass: Pointer): PVipsThreadStateClass;
function VIPS_IS_THREAD_STATE(obj: Pointer): Tgboolean;
function VIPS_IS_THREAD_STATE_CLASS(klass: Pointer): Tgboolean;
function VIPS_THREAD_STATE_GET_CLASS(obj: Pointer): PVipsThreadStateClass;
{$ENDIF read_function}

implementation

function VIPS_TYPE_THREAD_STATE: TGType;
begin
  VIPS_TYPE_THREAD_STATE := vips_thread_state_get_type;
end;

function VIPS_THREAD_STATE(obj: Pointer): PVipsThreadState;
begin
  Result := PVipsThreadState(g_type_check_instance_cast(obj, VIPS_TYPE_THREAD_STATE));
end;

function VIPS_THREAD_STATE_CLASS(klass: Pointer): PVipsThreadStateClass;
begin
  Result := PVipsThreadStateClass(g_type_check_class_cast(klass, VIPS_TYPE_THREAD_STATE));
end;

function VIPS_IS_THREAD_STATE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, VIPS_TYPE_THREAD_STATE);
end;

function VIPS_IS_THREAD_STATE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, VIPS_TYPE_THREAD_STATE);
end;

function VIPS_THREAD_STATE_GET_CLASS(obj: Pointer): PVipsThreadStateClass;
begin
  Result := PVipsThreadStateClass(PGTypeInstance(obj)^.g_class);
end;



end.
