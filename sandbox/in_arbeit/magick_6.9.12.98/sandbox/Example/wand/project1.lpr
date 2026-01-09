program project1;

uses
  MagickWand,
  animate,
  compare,
  composite,
  conjure,
  convert,
  display,
  pixel_wand,
  drawing_wand,
  identify,
  import,
  magick_image,
  magick_property,
  mogrify,
  montage,
  pixel_iterator,
  stream,
  wand_view,
  deprecate,

  fp_magiccore,
  fp_magicwand;

const
  srcPath = '/home/tux/Schreibtisch/magickwand/in.png';
  desPath = '/home/tux/Schreibtisch/magickwand/out.bmp';

  procedure handle_error(wand: PMagickWand);
  var
    severity: TExceptionType;
    description: pchar;
  begin
    description := MagickGetException(wand, @severity);
    WriteLn('Wand Error: ', description, '  (', severity, ')');
    Halt;
  end;

  procedure main;
  var
    wand: PMagickWand;
    status: TMagickBooleanType;
  begin
    MagickWandGenesis();
    wand := NewMagickWand;

    status := MagickReadImage(wand, srcPath);
    if status = MagickFalse then  begin
      handle_error(wand);
    end;

    status := MagickResizeImage(wand, 160, 120, LanczosFilter, 1.0);
    if status = MagickFalse then  begin
      handle_error(wand);
    end;

    status := MagickWriteImages(wand, desPath, MagickTrue);
    if status = MagickFalse then  begin
      handle_error(wand);
    end;

    wand := DestroyMagickWand(wand);
    MagickWandTerminus;
  end;

var
  i: PImageInfo;

begin

  main;
end.
