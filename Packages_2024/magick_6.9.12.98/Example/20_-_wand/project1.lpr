program project1;

uses
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

begin
  main;
end.
