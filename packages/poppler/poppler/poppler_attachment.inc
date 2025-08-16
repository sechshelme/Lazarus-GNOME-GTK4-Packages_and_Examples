{$IFDEF read_interface}


type
  TPopplerAttachmentSaveFunc = function(buf: Pgchar; count: Tgsize; data: Tgpointer; error: PPGError): Tgboolean; cdecl;

  TPopplerAttachment = record
    parent: TGObject;
    name: Pgchar;
    description: Pgchar;
    size: Tgsize;
    mtime: TGTime;
    ctime: TGTime;
    checksum: PGString;
  end;
  PPopplerAttachment = ^TPopplerAttachment;

  TPopplerAttachmentClass = record
    parent_class: TGObjectClass;
  end;
  PPopplerAttachmentClass = ^TPopplerAttachmentClass;

function poppler_attachment_get_type: TGType; cdecl; external poppler_glib;
function poppler_attachment_get_checksum(attachment: PPopplerAttachment): PGString; cdecl; external poppler_glib;
function poppler_attachment_get_ctime(attachment: PPopplerAttachment): PGDateTime; cdecl; external poppler_glib;
function poppler_attachment_get_description(attachment: PPopplerAttachment): Pgchar; cdecl; external poppler_glib;
function poppler_attachment_get_mtime(attachment: PPopplerAttachment): PGDateTime; cdecl; external poppler_glib;
function poppler_attachment_get_name(attachment: PPopplerAttachment): Pgchar; cdecl; external poppler_glib;
function poppler_attachment_get_size(attachment: PPopplerAttachment): Tgsize; cdecl; external poppler_glib;
function poppler_attachment_save(attachment: PPopplerAttachment; filename: pchar; error: PPGError): Tgboolean; cdecl; external poppler_glib;

{$ifndef windows}
function poppler_attachment_save_to_fd(attachment: PPopplerAttachment; fd: longint; error: PPGError): Tgboolean; cdecl; external poppler_glib;
{$endif}

function poppler_attachment_save_to_callback(attachment: PPopplerAttachment; save_func: TPopplerAttachmentSaveFunc; user_data: Tgpointer; error: PPGError): Tgboolean; cdecl; external poppler_glib;

// === Konventiert am: 15-8-25 16:53:57 ===

function POPPLER_TYPE_ATTACHMENT: TGType;
function POPPLER_ATTACHMENT(obj: Pointer): PPopplerAttachment;
function POPPLER_IS_ATTACHMENT(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function POPPLER_TYPE_ATTACHMENT: TGType;
begin
  POPPLER_TYPE_ATTACHMENT := poppler_attachment_get_type;
end;

function POPPLER_ATTACHMENT(obj: Pointer): PPopplerAttachment;
begin
  Result := PPopplerAttachment(g_type_check_instance_cast(obj, POPPLER_TYPE_ATTACHMENT));
end;

function POPPLER_IS_ATTACHMENT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, POPPLER_TYPE_ATTACHMENT);
end;



{$ENDIF read_implementation}
