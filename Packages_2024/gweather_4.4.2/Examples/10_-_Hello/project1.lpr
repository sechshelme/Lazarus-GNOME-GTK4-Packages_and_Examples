program project1;

uses
  fp_glib2,
  fp_gweather;

type
  TAppContext = record
    loop: PGMainLoop;
    pending: integer;
  end;
  PAppContext = ^TAppContext;

  procedure on_weather_info_updated(info: PGWeatherInfo; user_data: Tgpointer); cdecl;
  var
    ctx: PAppContext absolute user_data;
    temp_str, summary_str, humidity_str: pchar;
    location: PGWeatherLocation;
  begin
    location := gweather_info_get_location(info);

    temp_str := gweather_info_get_temp(info);
    summary_str := gweather_info_get_weather_summary(info);
    humidity_str := gweather_info_get_humidity(info);

    g_printf(#10'=== Wetter für %s ==='#10, gweather_location_get_name(location));
    g_printf('Wetterlage:       %s'#10, summary_str);
    g_printf('Temperatur:       %s'#10, temp_str);
    g_printf('Luftfeuchtigkeit: %s'#10, humidity_str);
    g_printf('========================'#10);

    g_free(temp_str);
    g_free(summary_str);
    g_free(humidity_str);

    Dec(ctx^.pending);

    g_object_unref(info);

    if ctx^.pending <= 0 then begin
      g_main_loop_quit(ctx^.loop);
    end;
  end;

  procedure query_city_weather(world: PGWeatherLocation; latitude, longitude: double; ctx: PAppContext);
  var
    location: PGWeatherLocation;
    info: PGWeatherInfo;
  begin
    location := gweather_location_find_nearest_city(world, latitude, longitude);
    if location = nil then begin
      g_printf('Fehler: Kein passender Ort in der Datenbank gefunden.'#10);
      Exit;
    end;

    g_printf('Ort gefunden: %s'#10, gweather_location_get_name(location));

    info := gweather_info_new(location);

    gweather_info_set_application_id(info, 'org.example.myweatherapp');
    gweather_info_set_contact_info(info, 'tux@gmx.com');
    gweather_info_set_enabled_providers(info, GWEATHER_PROVIDER_MET_NO or GWEATHER_PROVIDER_METAR);

    Inc(ctx^.pending);
    g_signal_connect(info, 'updated', G_CALLBACK(@on_weather_info_updated), ctx);

    gweather_info_update(info);
    g_object_unref(location);
  end;

  procedure main;
  var
    loop: PGMainLoop;
    world: PGWeatherLocation;
    ctx: TAppContext;
  begin
    loop := g_main_loop_new(nil, False);

    world := gweather_location_get_world;
    if world = nil then begin
      g_printf('Fehler: Ortsdatenbank konnte nicht geladen werden.'#10);
      g_main_loop_unref(loop);
      Exit;
    end;

    ctx.loop := loop;
    ctx.pending := 0;

    g_printf('Lade aktuelle Wetterdaten von den Servern...'#10);

    // Zürich
    query_city_weather(world, 47.3739, 8.5401, @ctx);

    // Berlin
    query_city_weather(world, 52.5200, 13.4050, @ctx);

    if ctx.pending > 0 then begin
      g_main_loop_run(loop);
    end;

    g_object_unref(world);
    g_main_loop_unref(loop);
  end;

begin
  main;
end.
