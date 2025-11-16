program project1;

uses
geocode_enum_types,
geocode_location,
geocode_bounding_box,
geocode_backend,
geocode_place,           // geocode_location, geocode_bounding_box
geocode_forward,         // geocode_bounding_box, geocode_backend
geocode_reverse,         // geocode_backend, geocode_location, geocode_place
geocode_error,
geocode_nominatim,
geocode_mock_backend,

  fp_glib2,
fp_geocode;

procedure main;
var
  nominatim: PGeocodeNominatim;
  forward: PGeocodeForward;
  locations: PGList;
  err: PGError=nil;
begin
//  GError *error = NULL;

  // Nominatim backend mit URL und User-Agent erzeugen
  nominatim := geocode_nominatim_new(      'https://nominatim.openstreetmap.org/',      'MyGeocodeApp/1.0'  );

  // Forward-Objekt mit Suchstring erzeugen
  forward := geocode_forward_new_for_string('steg');

  // Backend manuell setzen
  geocode_forward_set_backend(forward, GEOCODE_BACKEND(nominatim));

  // Suche ausführen
  locations := geocode_forward_search(forward, @err);

  if error<>nil then begin
      g_printerr('Fehler während Suche: %s'#10, err^.message);
      g_error_free(err);

  end  else if locations = nil then
      g_print('Keine Ergebnisse gefunden (leere Liste).'#10);
   else
      g_print('Ergebnisse gefunden:'#10);

for (GList *l = locations; l != NULL; l = l->next) {
  if (GEOCODE_IS_PLACE(l->data)) {
      GeocodePlace *place = GEOCODE_PLACE(l->data);
      GeocodeLocation *loc = geocode_place_get_location(place);
      if (loc != NULL) {
          g_print("Ort: %s\n", geocode_place_get_name(place));
          g_print("Lat: %f, Lon: %f\n",
              geocode_location_get_latitude(loc),
              geocode_location_get_longitude(loc));
      } else {
          g_print("Place hat keine zugeordnete Location.\n");
      }
  } else {
      g_print("Gefundenes Objekt ist kein gültiger Platz oder Standort.\n");
  }
}

      g_list_free_full(locations, g_object_unref);
  }

  g_object_unref(forward);
  g_object_unref(nominatim);
end;

begin
  main;
end.

