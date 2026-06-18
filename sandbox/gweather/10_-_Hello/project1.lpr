program project1;

uses
  gweather_version,
  gweather_enums,
  gweather_enum_types,
  gweather_location,
  gweather_info,



  fp_glib2,
  fp_gweather;

  procedure on_weather_info_updated(info: PGWeatherInfo; user_data: Tgpointer);
  var
    loop: PGMainLoop absolute user_data;
    temp_str, summary_str, humidity_str: pchar;
  begin
    temp_str := gweather_info_get_temp(info);
    summary_str := gweather_info_get_weather_summary(info);
    humidity_str := gweather_info_get_humidity(info);

    g_printf(#10'=== Aktuelles Wetter ==='#10);
    g_printf('Wetterlage:       %s'#10, summary_str);
    g_printf('Temperatur:       %s'#10, temp_str);
    g_printf('Luftfeuchtigkeit: %s'#10, humidity_str);

    g_printf('========================'#10);

    g_free(temp_str);
    g_free(summary_str);
    g_free(humidity_str);

    g_main_loop_quit(loop);
  end;


  procedure main;
  var
    loop: PGMainLoop;
    world, location: PGWeatherLocation;
    info: PGWeatherInfo;

  const
    latitude = 47.3739;
    longitude = 8.5401;

    // Koordinaten für Berlin
    //    double latitude = 52.5200;
    //    double longitude = 13.4050;

  begin
    loop := g_main_loop_new(nil, False);

    world := gweather_location_get_world;
    if world = nil then begin
      g_printf('Fehler: Ortsdatenbank konnte nicht geladen werden.'#10);
      Exit;
    end;

    location := gweather_location_find_nearest_city(world, latitude, longitude);
    if location = nil then begin
      g_printf('Fehler: Kein passender Ort in der Datenbank gefunden.'#10);
      g_object_unref(world);
      Exit;
    end;

    g_printf('Gefundener Ort: %s'#10, gweather_location_get_name(location));
    g_printf('Lade aktuelle Wetterdaten von den Servern...'#10);

    info := gweather_info_new(location);

    gweather_info_set_application_id(info, 'org.example.myweatherapp');
    gweather_info_set_contact_info(info, 'tux@gmx.com');

    gweather_info_set_enabled_providers(info, GWEATHER_PROVIDER_MET_NO or GWEATHER_PROVIDER_METAR);

    g_signal_connect(info, 'updated', G_CALLBACK(@on_weather_info_updated), loop);

    gweather_info_update(info);

    g_main_loop_run(loop);

    g_object_unref(info);
    g_object_unref(location);
    g_object_unref(world);
    g_main_loop_unref(loop);
  end;


begin
  main;
end.
