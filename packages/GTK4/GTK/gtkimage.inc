
{$IFDEF read_interface}


type
  TGtkImage = record // _GtkImage
  end;
  PGtkImage = ^TGtkImage;

  PGtkImageType = ^TGtkImageType;
  TGtkImageType = longint;

const
  GTK_IMAGE_EMPTY = 0;
  GTK_IMAGE_ICON_NAME = 1;
  GTK_IMAGE_GICON = 2;
  GTK_IMAGE_PAINTABLE = 3;


function gtk_image_get_type: TGType; cdecl; external libgtk4;
function gtk_image_new: PGtkWidget; cdecl; external libgtk4;
function gtk_image_new_from_file(filename: PChar): PGtkWidget; cdecl; external libgtk4;
function gtk_image_new_from_resource(resource_path: PChar): PGtkWidget; cdecl; external libgtk4;
function gtk_image_new_from_pixbuf(pixbuf: PGdkPixbuf): PGtkWidget; cdecl; external libgtk4; deprecated 'GDK_DEPRECATED_IN_4_12_FOR(gtk_image_new_from_paintable)';
function gtk_image_new_from_paintable(paintable: PGdkPaintable): PGtkWidget; cdecl; external libgtk4;
function gtk_image_new_from_icon_name(icon_name: PChar): PGtkWidget; cdecl; external libgtk4;
function gtk_image_new_from_gicon(icon: PGIcon): PGtkWidget; cdecl; external libgtk4;
procedure gtk_image_clear(image: PGtkImage); cdecl; external libgtk4;
procedure gtk_image_set_from_file(image: PGtkImage; filename: PChar); cdecl; external libgtk4;
procedure gtk_image_set_from_resource(image: PGtkImage; resource_path: PChar); cdecl; external libgtk4;
procedure gtk_image_set_from_pixbuf(image: PGtkImage; pixbuf: PGdkPixbuf); cdecl; external libgtk4; deprecated 'GDK_DEPRECATED_IN_4_12_FOR(gtk_image_set_from_paintable)';
procedure gtk_image_set_from_paintable(image: PGtkImage; paintable: PGdkPaintable); cdecl; external libgtk4;
procedure gtk_image_set_from_icon_name(image: PGtkImage; icon_name: PChar); cdecl; external libgtk4;
procedure gtk_image_set_from_gicon(image: PGtkImage; icon: PGIcon); cdecl; external libgtk4;
procedure gtk_image_set_pixel_size(image: PGtkImage; pixel_size: longint); cdecl; external libgtk4;
procedure gtk_image_set_icon_size(image: PGtkImage; icon_size: TGtkIconSize); cdecl; external libgtk4;
function gtk_image_get_storage_type(image: PGtkImage): TGtkImageType; cdecl; external libgtk4;
function gtk_image_get_paintable(image: PGtkImage): PGdkPaintable; cdecl; external libgtk4;
function gtk_image_get_icon_name(image: PGtkImage): PChar; cdecl; external libgtk4;
function gtk_image_get_gicon(image: PGtkImage): PGIcon; cdecl; external libgtk4;
function gtk_image_get_pixel_size(image: PGtkImage): longint; cdecl; external libgtk4;
function gtk_image_get_icon_size(image: PGtkImage): TGtkIconSize; cdecl; external libgtk4;

// === Konventiert am: 21-7-24 16:51:33 ===

function GTK_TYPE_IMAGE: TGType;
function GTK_IMAGE(obj: Pointer): PGtkImage;
function GTK_IS_IMAGE(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GTK_TYPE_IMAGE: TGType;
begin
  GTK_TYPE_IMAGE := gtk_image_get_type;
end;

function GTK_IMAGE(obj: Pointer): PGtkImage;
begin
  Result := PGtkImage(g_type_check_instance_cast(obj, GTK_TYPE_IMAGE));
end;

function GTK_IS_IMAGE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_IMAGE);
end;



{$ENDIF read_implementation}
