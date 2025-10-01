{$IFDEF read_interface}


type
  TSoupContentSniffer = record
  end;
  PSoupContentSniffer = ^TSoupContentSniffer;

  TSoupContentSnifferClass = record
    parent_class: TGObjectClass;
  end;
  PSoupContentSnifferClass = ^TSoupContentSnifferClass;

function soup_content_sniffer_get_type: TGType; cdecl; external libsoup;
function soup_content_sniffer_new: PSoupContentSniffer; cdecl; external libsoup;
function soup_content_sniffer_sniff(sniffer: PSoupContentSniffer; msg: PSoupMessage; buffer: PGBytes; params: PPGHashTable): pchar; cdecl; external libsoup;

// === Konventiert am: 29-9-25 19:45:15 ===

function SOUP_TYPE_CONTENT_SNIFFER: TGType;
function SOUP_CONTENT_SNIFFER(obj: Pointer): PSoupContentSniffer;
function SOUP_IS_CONTENT_SNIFFER(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function SOUP_TYPE_CONTENT_SNIFFER: TGType;
begin
  Result := soup_content_sniffer_get_type;
end;

function SOUP_CONTENT_SNIFFER(obj: Pointer): PSoupContentSniffer;
begin
  Result := PSoupContentSniffer(g_type_check_instance_cast(obj, SOUP_TYPE_CONTENT_SNIFFER));
end;

function SOUP_IS_CONTENT_SNIFFER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, SOUP_TYPE_CONTENT_SNIFFER);
end;



{$ENDIF read_implementation}
