unit colorbalancechannel;

interface

uses
  fp_glib2, fp_gst;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PGstColorBalanceChannel = ^TGstColorBalanceChannel;
  TGstColorBalanceChannel = record
    parent: TGObject;
    _label: Pgchar;
    min_value: Tgint;
    max_value: Tgint;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;

  PGstColorBalanceChannelClass = ^TGstColorBalanceChannelClass;
  TGstColorBalanceChannelClass = record
    parent: TGObjectClass;
    value_changed: procedure(channel: PGstColorBalanceChannel; value: Tgint); cdecl;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;

function gst_color_balance_channel_get_type: TGType; cdecl; external libgstvideo;

// === Konventiert am: 15-7-26 13:22:58 ===

function GST_TYPE_COLOR_BALANCE_CHANNEL: TGType;
function GST_COLOR_BALANCE_CHANNEL(obj: Pointer): PGstColorBalanceChannel;
function GST_COLOR_BALANCE_CHANNEL_CLASS(klass: Pointer): PGstColorBalanceChannelClass;
function GST_IS_COLOR_BALANCE_CHANNEL(obj: Pointer): Tgboolean;
function GST_IS_COLOR_BALANCE_CHANNEL_CLASS(klass: Pointer): Tgboolean;

implementation

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

end.
