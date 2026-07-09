

{$IFDEF read_struct}
type
  PGtkAccessibleHyperlink = type Pointer;

  TGtkAccessibleHyperlinkClass = record
    parent_class: TGObjectClass;
  end;
  PGtkAccessibleHyperlinkClass = ^TGtkAccessibleHyperlinkClass;


  PGtkAccessibleHypertext = type Pointer;

  PGtkAccessibleHypertextInterface = ^TGtkAccessibleHypertextInterface;
  TGtkAccessibleHypertextInterface = record
      g_iface : TGTypeInterface;
      get_n_links : function (self:PGtkAccessibleHypertext):dword;cdecl;
      get_link : function (self:PGtkAccessibleHypertext; index:dword):PGtkAccessibleHyperlink;cdecl;
      get_link_at : function (self:PGtkAccessibleHypertext; offset:dword):dword;cdecl;
    end;
  {$ENDIF read_struct}

  {$IFDEF read_function}
function gtk_accessible_hyperlink_get_type: TGType; cdecl; external libgtk4;
function gtk_accessible_hypertext_get_type: TGType; cdecl; external libgtk4;
function gtk_accessible_hyperlink_new(parent:PGtkAccessibleHypertext; index:dword; uri:Pchar; bounds:PGtkAccessibleTextRange):PGtkAccessibleHyperlink;cdecl;external libgtk4;
procedure gtk_accessible_hyperlink_set_platform_state(self:PGtkAccessibleHyperlink; state:TGtkAccessiblePlatformState; enabled:Tgboolean);cdecl;external libgtk4;

// === Konventiert am: 5-7-26 16:28:43 ===

function GTK_TYPE_ACCESSIBLE_HYPERTEXT: TGType;
function GTK_ACCESSIBLE_HYPERTEXT(obj: Pointer): PGtkAccessibleHypertext;
function GTK_IS_ACCESSIBLE_HYPERTEXT(obj: Pointer): Tgboolean;
function GTK_ACCESSIBLE_HYPERTEXT_GET_IFACE(obj: Pointer): PGtkAccessibleHypertextInterface;
{$ENDIF read_function}


{$IFDEF read_implementation}

function GTK_TYPE_ACCESSIBLE_HYPERLINK: TGType;
begin
  Result := gtk_accessible_hyperlink_get_type;
end;

function GTK_ACCESSIBLE_HYPERLINK(obj: Pointer): PGtkAccessibleHyperlink;
begin
  Result := PGtkAccessibleHyperlink(g_type_check_instance_cast(obj, GTK_TYPE_ACCESSIBLE_HYPERLINK));
end;

function GTK_IS_ACCESSIBLE_HYPERLINK(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_ACCESSIBLE_HYPERLINK);
end;


function GTK_TYPE_ACCESSIBLE_HYPERTEXT: TGType;
begin
  Result := gtk_accessible_hypertext_get_type;
end;

function GTK_ACCESSIBLE_HYPERTEXT(obj: Pointer): PGtkAccessibleHypertext;
begin
  Result := PGtkAccessibleHypertext(g_type_check_instance_cast(obj, GTK_TYPE_ACCESSIBLE_HYPERTEXT));
end;

function GTK_IS_ACCESSIBLE_HYPERTEXT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_ACCESSIBLE_HYPERTEXT);
end;

function GTK_ACCESSIBLE_HYPERTEXT_GET_IFACE(obj: Pointer): PGtkAccessibleHypertextInterface;
begin
  Result := g_type_interface_peek(obj, GTK_TYPE_ACCESSIBLE_HYPERTEXT);
end;

{$ENDIF read_implementation}
