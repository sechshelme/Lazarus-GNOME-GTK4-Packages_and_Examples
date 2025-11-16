program project1;

uses
  fp_glib2,
  fp_geocode;

  procedure main;
  var
    nominatim: PGeocodeNominatim;
    forward: PGeocodeForward;
    locations, l: PGList;
    err: PGError = nil;
    place: PGeocodePlace;
    loc: PGeocodeLocation;
  begin
    g_printf('Ich bin ein Umlaut: öäü ÜÄÖ'#10);

    nominatim := geocode_nominatim_new('https://nominatim.openstreetmap.org/', 'MyGeocodeApp/1.0');
    forward := geocode_forward_new_for_string('Zürich');
    geocode_forward_set_backend(forward, GEOCODE_BACKEND(nominatim));

    locations := geocode_forward_search(forward, @err);
    if err <> nil then begin
      g_printerr('Fehler während Suche: %s'#10, err^.message);
      g_error_free(err);
    end else begin
      g_print('Ergebnisse gefunden:'#10);

      l := locations;
      while l <> nil do begin
        if GEOCODE_IS_PLACE(l^.data) then begin
          place := GEOCODE_PLACE(l^.data);
          loc := geocode_place_get_location(place);
          if loc <> nil then begin
            g_print('Ort: %s'#10, geocode_place_get_name(place));
            g_print('Lat: %f, Lon: %f'#10#10, geocode_location_get_latitude(loc), geocode_location_get_longitude(loc));
          end else begin
            g_print('Place hat keine zugeordnete Location.'#10);
          end;
        end else begin
          g_print('Gefundenes Objekt ist kein gültiger Platz oder Standort.'#10);
        end;
        l := l^.Next;;
      end;

      g_list_free_full(locations, @g_object_unref);

      g_object_unref(forward);
      g_object_unref(nominatim);
    end;
  end;

begin
  main;
end.
