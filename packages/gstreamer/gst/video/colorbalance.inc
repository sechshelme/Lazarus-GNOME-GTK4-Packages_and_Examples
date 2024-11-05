/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 01-10-2024   15:41                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  PGstColorBalanceType = ^TGstColorBalanceType;
  TGstColorBalanceType = longint;

const
  GST_COLOR_BALANCE_HARDWARE = 0;
  GST_COLOR_BALANCE_SOFTWARE = 1;

type
  TGstColorBalance = record
  end;
  PGstColorBalance = ^TGstColorBalance;

  TGstColorBalanceInterface = record
    iface: TGTypeInterface;
    list_channels: function(balance: PGstColorBalance): PGList; cdecl;
    set_value: procedure(balance: PGstColorBalance; channel: PGstColorBalanceChannel; Value: Tgint); cdecl;
    get_value: function(balance: PGstColorBalance; channel: PGstColorBalanceChannel): Tgint; cdecl;
    get_balance_type: function(balance: PGstColorBalance): TGstColorBalanceType; cdecl;
    value_changed: procedure(balance: PGstColorBalance; channel: PGstColorBalanceChannel; Value: Tgint); cdecl;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstColorBalanceInterface = ^TGstColorBalanceInterface;

function gst_color_balance_get_type: TGType; cdecl; external libgstvideo;
function gst_color_balance_list_channels(balance: PGstColorBalance): PGList; cdecl; external libgstvideo;
procedure gst_color_balance_set_value(balance: PGstColorBalance; channel: PGstColorBalanceChannel; Value: Tgint); cdecl; external libgstvideo;
function gst_color_balance_get_value(balance: PGstColorBalance; channel: PGstColorBalanceChannel): Tgint; cdecl; external libgstvideo;
function gst_color_balance_get_balance_type(balance: PGstColorBalance): TGstColorBalanceType; cdecl; external libgstvideo;
procedure gst_color_balance_value_changed(balance: PGstColorBalance; channel: PGstColorBalanceChannel; Value: Tgint); cdecl; external libgstvideo;

// === Konventiert am: 30-9-24 19:15:19 ===

function GST_TYPE_COLOR_BALANCE: TGType;
function GST_COLOR_BALANCE(obj: Pointer): PGstColorBalance;
function GST_IS_COLOR_BALANCE(obj: Pointer): Tgboolean;
function GST_COLOR_BALANCE_GET_INTERFACE(obj: Pointer): PGstColorBalanceInterface;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_COLOR_BALANCE: TGType;
begin
  GST_TYPE_COLOR_BALANCE := gst_color_balance_get_type;
end;

function GST_COLOR_BALANCE(obj: Pointer): PGstColorBalance;
begin
  Result := PGstColorBalance(g_type_check_instance_cast(obj, GST_TYPE_COLOR_BALANCE));
end;

function GST_IS_COLOR_BALANCE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_COLOR_BALANCE);
end;

function GST_COLOR_BALANCE_GET_INTERFACE(obj: Pointer): PGstColorBalanceInterface;
begin
  Result := g_type_interface_peek(obj, GST_TYPE_COLOR_BALANCE);
end;



{$ENDIF read_implementation}
