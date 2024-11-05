/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 01-10-2024   15:41                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  TGstColorBalanceChannel = record
    parent: TGObject;
    _label: Pgchar;
    min_value: Tgint;
    max_value: Tgint;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstColorBalanceChannel = ^TGstColorBalanceChannel;

  TGstColorBalanceChannelClass = record
    parent: TGObjectClass;
    value_changed: procedure(channel: PGstColorBalanceChannel; Value: Tgint); cdecl;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstColorBalanceChannelClass = ^TGstColorBalanceChannelClass;


function gst_color_balance_channel_get_type: TGType; cdecl; external libgstvideo;

// === Konventiert am: 30-9-24 19:45:18 ===

function GST_TYPE_COLOR_BALANCE_CHANNEL: TGType;
function GST_COLOR_BALANCE_CHANNEL(obj: Pointer): PGstColorBalanceChannel;
function GST_COLOR_BALANCE_CHANNEL_CLASS(klass: Pointer): PGstColorBalanceChannelClass;
function GST_IS_COLOR_BALANCE_CHANNEL(obj: Pointer): Tgboolean;
function GST_IS_COLOR_BALANCE_CHANNEL_CLASS(klass: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_COLOR_BALANCE_CHANNEL: TGType;
begin
  GST_TYPE_COLOR_BALANCE_CHANNEL := gst_color_balance_channel_get_type;
end;

function GST_COLOR_BALANCE_CHANNEL(obj: Pointer): PGstColorBalanceChannel;
begin
  Result := PGstColorBalanceChannel(g_type_check_instance_cast(obj, GST_TYPE_COLOR_BALANCE_CHANNEL));
end;

function GST_COLOR_BALANCE_CHANNEL_CLASS(klass: Pointer): PGstColorBalanceChannelClass;
begin
  Result := PGstColorBalanceChannelClass(g_type_check_class_cast(klass, GST_TYPE_COLOR_BALANCE_CHANNEL));
end;

function GST_IS_COLOR_BALANCE_CHANNEL(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_COLOR_BALANCE_CHANNEL);
end;

function GST_IS_COLOR_BALANCE_CHANNEL_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_COLOR_BALANCE_CHANNEL);
end;



{$ENDIF read_implementation}
