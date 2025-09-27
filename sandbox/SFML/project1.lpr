program project1;

uses
  fp_csfml;

  procedure main;
  var
    window: PsfRenderWindow;
    mode: TsfVideoMode = (width: 640; height: 480; bitsPerPixel: 32);
    ev: TsfEvent;
    texture: PsfTexture;
    sprite: PsfSprite;
    spritePosition: TsfVector2f = (x: 200; y: 200);
    font: PsfFont;
    text: PsfText;
    music: PsfMusic;
  begin
    window := sfRenderWindow_create(mode, 'SFML window', sfResize or sfClose, nil);
    texture := sfTexture_createFromFile('sfml_logo.png', nil);

    sprite := sfSprite_create;
    sfSprite_setTexture(sprite, texture, sfTrue);
    sfSprite_setPosition(sprite, spritePosition);

    font := sfFont_createFromFile('tuffy.ttf');

    text := sfText_create;
    sfText_setString(text, 'Hello, SFML!');
    sfText_setFont(text, font);
    sfText_setCharacterSize(text, 50);

    music := sfMusic_createFromFile('doodle_pop.ogg');

    sfMusic_play(music);

    while sfRenderWindow_isOpen(window) do begin
      while sfRenderWindow_pollEvent(window, @ev) do begin
        if ev._type = sfEvtClosed then begin
          sfRenderWindow_close(window);
        end;
      end;

      sfRenderWindow_clear(window, sfBlack);
      sfRenderWindow_drawSprite(window, sprite, nil);
      sfRenderWindow_drawText(window, text, nil);
      sfRenderWindow_display(window);
    end;

    sfMusic_destroy(music);
    sfText_destroy(text);
    sfFont_destroy(font);
    sfSprite_destroy(sprite);
    sfTexture_destroy(texture);
    sfRenderWindow_destroy(window);
  end;

begin
  main;
end.
