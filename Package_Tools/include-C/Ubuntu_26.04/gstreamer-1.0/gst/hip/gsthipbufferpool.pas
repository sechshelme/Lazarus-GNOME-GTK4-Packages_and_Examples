unit gsthipbufferpool;

interface

uses
  fp_glib2, fp_gst, gsthipdevice;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PGstHipBufferPoolPrivate = type Pointer;

  PGstHipBufferPool = ^TGstHipBufferPool;
  TGstHipBufferPool = record
    parent: TGstBufferPool;
    device: PGstHipDevice;
    priv: PGstHipBufferPoolPrivate;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;

  PGstHipBufferPoolClass = ^TGstHipBufferPoolClass;
  TGstHipBufferPoolClass = record
    parent_class: TGstBufferPoolClass;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;

function gst_hip_buffer_pool_get_type: TGType; cdecl; external libgsthip;
function gst_hip_buffer_pool_new(device: PGstHipDevice): PGstBufferPool; cdecl; external libgsthip;

// === Konventiert am: 22-7-26 17:17:12 ===

function GST_TYPE_HIP_BUFFER_POOL: TGType;
function GST_HIP_BUFFER_POOL(obj: Pointer): PGstHipBufferPool;
function GST_HIP_BUFFER_POOL_CLASS(klass: Pointer): PGstHipBufferPoolClass;
function GST_HIP_BUFFER_POOL_GET_CLASS(obj: Pointer): PGstHipBufferPoolClass;
function GST_IS_HIP_BUFFER_POOL(obj: Pointer): Tgboolean;
function GST_IS_HIP_BUFFER_POOL_CLASS(klass: Pointer): Tgboolean;
function GST_HIP_BUFFER_POOL_CAST(obj: Pointer): PGstHipBufferPool;

implementation

function GST_TYPE_HIP_BUFFER_POOL: TGType;
begin
  Result := gst_hip_buffer_pool_get_type;
end;

function GST_HIP_BUFFER_POOL(obj: Pointer): PGstHipBufferPool;
begin
  Result := PGstHipBufferPool(g_type_check_instance_cast(obj, GST_TYPE_HIP_BUFFER_POOL));
end;

function GST_HIP_BUFFER_POOL_CLASS(klass: Pointer): PGstHipBufferPoolClass;
begin
  Result := PGstHipBufferPoolClass(g_type_check_class_cast(klass, GST_TYPE_HIP_BUFFER_POOL));
end;

function GST_HIP_BUFFER_POOL_GET_CLASS(obj: Pointer): PGstHipBufferPoolClass;
begin
  Result := PGstHipBufferPoolClass(PGTypeInstance(obj)^.g_class);
end;

function GST_IS_HIP_BUFFER_POOL(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_HIP_BUFFER_POOL);
end;

function GST_IS_HIP_BUFFER_POOL_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_HIP_BUFFER_POOL);
end;

function GST_HIP_BUFFER_POOL_CAST(obj: Pointer): PGstHipBufferPool;
begin
  Result := PGstHipBufferPool(obj);
end;

end.
