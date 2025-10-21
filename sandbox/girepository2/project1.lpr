program Project1;

uses
fp_glib2,

gitypes,
gitypelib,
gibaseinfo,

giarginfo,
gicallableinfo,
giconstantinfo,
gienuminfo,
gifieldinfo,
gifunctioninfo,
giinterfaceinfo,
giobjectinfo,
gipropertyinfo,
giregisteredtypeinfo,
girepository,
girffi,
gisignalinfo,
gistructinfo,
gitypeinfo,
giunioninfo,
giversion,
givfuncinfo,

gicallbackinfo,
giflagsinfo,
giunresolvedinfo,
givalueinfo,

fp_girepository2;

procedure main;
var
  repo: PGIRepository;
begin
//    GError *error = NULL;
    repo := g_irepository_get_default;

    if (!g_irepository_require(repo, "Gtk", "4.0", 0, &error)) {
        fprintf(stderr, "Fehler beim Laden von Gtk-4.0: %s\n", error->message);
        g_error_free(error);
        return 1;
    }

    guint n_infos = g_irepository_get_n_infos(repo, "Gtk");
    for (guint i = 0; i < n_infos; i++) {
        GIBaseInfo *info = g_irepository_get_info(repo, "Gtk", i);
        if (g_base_info_get_type(info) == GI_INFO_TYPE_OBJECT) {
            const char *name = g_base_info_get_name(info);
            printf("Klasse: %s\n", name);

            GIObjectInfo *obj_info = (GIObjectInfo *)info;
            int n_methods = g_object_info_get_n_methods(obj_info);
            printf("  Anzahl Methoden: %d\n", n_methods);

            for (int m = 0; m < n_methods; m++) {
                GIFunctionInfo *method = g_object_info_get_method(obj_info, m);
                printf("    Methode: %s\n", g_base_info_get_name((GIBaseInfo *)method));
            }
        }
        g_base_info_unref(info);
    }
end;

begin
    main;
end.

