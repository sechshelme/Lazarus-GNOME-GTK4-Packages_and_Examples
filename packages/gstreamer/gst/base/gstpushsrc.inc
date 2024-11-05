/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 30-09-2024   15:21                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  PGstPushSrc = ^TGstPushSrc;
  TGstPushSrc = record
      parent : TGstBaseSrc;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

  PGstPushSrcClass = ^TGstPushSrcClass;
  TGstPushSrcClass = record
      parent_class : TGstBaseSrcClass;
      create : function (src:PGstPushSrc; buf:PPGstBuffer):TGstFlowReturn;cdecl;
      alloc : function (src:PGstPushSrc; buf:PPGstBuffer):TGstFlowReturn;cdecl;
      fill : function (src:PGstPushSrc; buf:PGstBuffer):TGstFlowReturn;cdecl;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

function gst_push_src_get_type:TGType;cdecl;external libgstbase;

// === Konventiert am: 28-9-24 14:56:24 ===

function GST_TYPE_PUSH_SRC : TGType;
function GST_PUSH_SRC(obj : Pointer) : PGstPushSrc;
function GST_PUSH_SRC_CLASS(klass : Pointer) : PGstPushSrcClass;
function GST_IS_PUSH_SRC(obj : Pointer) : Tgboolean;
function GST_IS_PUSH_SRC_CLASS(klass : Pointer) : Tgboolean;
function GST_PUSH_SRC_GET_CLASS(obj : Pointer) : PGstPushSrcClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_PUSH_SRC : TGType;
  begin
    GST_TYPE_PUSH_SRC:=gst_push_src_get_type;
  end;

function GST_PUSH_SRC(obj : Pointer) : PGstPushSrc;
begin
  Result := PGstPushSrc(g_type_check_instance_cast(obj, GST_TYPE_PUSH_SRC));
end;

function GST_PUSH_SRC_CLASS(klass : Pointer) : PGstPushSrcClass;
begin
  Result := PGstPushSrcClass(g_type_check_class_cast(klass, GST_TYPE_PUSH_SRC));
end;

function GST_IS_PUSH_SRC(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GST_TYPE_PUSH_SRC);
end;

function GST_IS_PUSH_SRC_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GST_TYPE_PUSH_SRC);
end;

function GST_PUSH_SRC_GET_CLASS(obj : Pointer) : PGstPushSrcClass;
begin
  Result := PGstPushSrcClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
