program project1;

uses
  fp_magiccore;

const
  srcPath = '/home/tux/Schreibtisch/magickwand/in.png';

  exten = 'bmp';
  desPath = '/home/tux/Schreibtisch/magickwand/out.' + exten;

  procedure main;
  var
    exception: PExceptionInfo;
    image_info, write_info: PImageInfo;
    image, output_image: PImage;
    len: Tsize_t = 0;
    blob: pbyte;
    status: TMagickBooleanType;
  begin
    exception := AcquireExceptionInfo;

    MagickCoreGenesis(nil, MagickTrue);

    image_info := AcquireImageInfo;
    CopyMagickString(image_info^.filename, srcPath, MaxTextExtent);

    image := ReadImage(image_info, exception);
    if image = nil then begin
      WriteLn('Fehler beim Laden: ', srcPath);
      CatchException(exception);
    end else begin

      WriteLn('Format: ', image^.magick);
      WriteLn('Größe: ', image^.columns, 'x', image^.rows);
      WriteLn('Tiefe: ', image^.depth);

      image^.colors := GetNumberColors(image, nil, exception);
      WriteLn('Farben: ', image^.colors);

      write_info := CloneImageInfo(image_info);
      CopyMagickString(write_info^.filename, desPath, MaxTextExtent);

      CopyMagickString(write_info^.magick, exten, MaxTextExtent);

      WriteLn('Konvertiere zu ', write_info^.magick);

      blob := ImagesToBlob(write_info, image, @len, exception);

      if (blob <> nil) and (len > 0) then begin
        WriteLn('Blob erstellt: ', len, ' Bytes');

        output_image := BlobToImage(write_info, blob, len, exception);

        if output_image <> nil then begin
          status := WriteImage(write_info, output_image);

          if status = MagickTrue then begin
            WriteLn('✓ ERFOLG: ');
          end else begin
            WriteLn('✗ WriteImage fehlgeschlagen');
            CatchException(exception);
          end;

          DestroyImage(output_image);
        end else begin
          WriteLn('✗ BlobToImage fehlgeschlagen');
        end;

        RelinquishMagickMemory(blob);
      end else begin
        WriteLn('✗ ImagesToBlob fehlgeschlagen');
        CatchException(exception);
      end;
    end;

    if image <> nil then begin
      DestroyImageList(image);
    end;
    if image_info <> nil then begin
      DestroyImageInfo(image_info);
    end;
    if write_info <> nil then begin
      DestroyImageInfo(write_info);
    end;
    DestroyExceptionInfo(exception);
    MagickCoreTerminus();
  end;

begin
  main;
end.
