program project1;

//#include <glib.h>
//#include <gio/gio.h>
//#include <geocode-glib/geocode-location.h>
//#include <geocode-glib/geocode-place.h>
//#include <geocode-glib/geocode-forward.h>
//#include <geocode-glib/geocode-reverse.h>
//#include <geocode-glib/geocode-bounding-box.h>
//#include <geocode-glib/geocode-error.h>
//#include <geocode-glib/geocode-enum-types.h>
//#include <geocode-glib/geocode-backend.h>
//#include <geocode-glib/geocode-nominatim.h>
//#include <geocode-glib/geocode-mock-backend.h>

uses
geocode_backend,
geocode_bounding_box,
geocode_enum_types,
geocode_error,
geocode_forward,
geocode_location,
geocode_mock_backend,
geocode_nominatim,
geocode_place,
geocode_reverse,



  fp_glib2;

procedure main;
begin
  GError *error = NULL;

  // Nominatim backend mit URL und User-Agent erzeugen
  GeocodeNominatim *nominatim = geocode_nominatim_new(
      "https://nominatim.openstreetmap.org/",
      "MyGeocodeApp/1.0"
  );

  // Forward-Objekt mit Suchstring erzeugen
  GeocodeForward *forward = geocode_forward_new_for_string("steg");

  // Backend manuell setzen
  geocode_forward_set_backend(forward, GEOCODE_BACKEND(nominatim));

  // Suche ausführen
  GList *locations = geocode_forward_search(forward, &error);

  if (error) {
      g_printerr("Fehler während Suche: %s\n", error->message);
      g_error_free(error);
  } else if (locations == NULL) {
      g_print("Keine Ergebnisse gefunden (leere Liste).\n");
  } else {
      g_print("Ergebnisse gefunden:\n");

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

