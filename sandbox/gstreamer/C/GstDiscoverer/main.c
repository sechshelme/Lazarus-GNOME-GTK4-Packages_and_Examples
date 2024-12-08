// gcc -o main main.c `pkg-config --cflags --libs gstreamer-1.0 gstreamer-pbutils-1.0`

#include <gst/gst.h>
#include <gst/pbutils/gstdiscoverer.h>

int main(int argc, char *argv[]) {
    GstDiscoverer *discoverer;
    GstDiscovererInfo *info;
    GstClockTime duration;

    gst_init(&argc, &argv);

    if (argc != 2) {
        g_printerr("Usage: %s <file>\n", argv[0]);
//        return -1;
    }

    discoverer = gst_discoverer_new(5 * GST_SECOND, 0);

    info = gst_discoverer_discover_uri(discoverer, "file:/home/tux/Schreibtisch/sound/test.mp3", 0);



    if (info) {
        duration = gst_discoverer_info_get_duration(info);
        if (duration != GST_CLOCK_TIME_NONE) {
            g_print("Dauer: %.2f Sekunden\n", (double)duration / GST_SECOND);
        } else {
            g_print("Dauer konnte nicht ermittelt werden.\n");
        }

        // Speicher freigeben
        gst_discoverer_info_unref(info);
    } else {
        g_printerr("Fehler beim Analysieren der Datei: %s\n", argv[1]);
    }

    g_object_unref(discoverer);
    return 0;
}
