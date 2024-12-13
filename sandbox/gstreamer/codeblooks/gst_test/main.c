// gcc main.c -o main `pkg-config --cflags --libs gstreamer-1.0 gstreamer-video-1.0 gstreamer-codecparsers-1.0 gst-editing-services-1.0``

// https://www.perplexity.ai/search/was-ist-gstreamer-ges-wX90wJ5VRxiFB.rAgZ2KoQ
// https://www.perplexity.ai/search/gib-mir-ein-gst-ges-beispiel-i-QPk0EXx2QIurXML0bNS8cg

#include <ges/ges.h>
#include <gst/gst.h>

#include <ges/ges.h>
#include <gst/gst.h>

static void bus_message_cb(GstBus *bus, GstMessage *message, GMainLoop *mainloop) {
    switch (GST_MESSAGE_TYPE(message)) {
        case GST_MESSAGE_EOS:
            g_print("Ende des Streams\n");
            g_main_loop_quit(mainloop);
            break;
        case GST_MESSAGE_ERROR: {
            gchar *debug;
            GError *error;
            gst_message_parse_error(message, &error, &debug);
            g_printerr("Fehler: %s\n", error->message);
            g_error_free(error);
            g_free(debug);
            g_main_loop_quit(mainloop);
            break;
        }
        default:
            break;
    }
}

int main(int argc, char **argv) {
    GESTimeline *timeline;
    GESTrack *audio_track;
    GESLayer *layer;
    GESUriClipAsset *asset;
    GESClip *clip;
    GESPipeline *ges_pipeline;
    GstElement *pipeline;
    GstBus *bus;
    GMainLoop *mainloop;

    /* Initialisierung von GStreamer und GES */
    gst_init(&argc, &argv);
    ges_init();

    /* Timeline und Audio-Track erstellen */
    timeline = ges_timeline_new();
    audio_track = ges_track_new(GES_TRACK_TYPE_AUDIO, gst_caps_new_empty_simple("audio/x-raw"));
    ges_timeline_add_track(timeline, audio_track);

    /* Layer zur Timeline hinzufügen */
    layer = ges_layer_new();
    ges_timeline_add_layer(timeline, layer);

    /* MP3-Datei als Asset laden */
    gchar *uri = gst_filename_to_uri("/home/tux/Schreibtisch/sound/test.mp3", NULL);
    asset = ges_uri_clip_asset_request_sync(uri, NULL);
    if (!asset) {
        g_printerr("Konnte die Datei nicht laden: \n");
        g_free(uri);
        return -1;
    }

    /* Clip aus dem Asset erstellen und zur Layer hinzufügen */
    clip = ges_layer_add_asset(layer, GES_ASSET(asset), 0, 0, GST_CLOCK_TIME_NONE, GES_TRACK_TYPE_AUDIO);
    if (!clip) {
        g_printerr("Konnte Clip nicht erstellen\n");
        g_free(uri);
        return -1;
    }
    g_free(uri);

    /* Pipeline erstellen und Timeline setzen */
    ges_pipeline = ges_pipeline_new();
    if (!ges_pipeline_set_timeline(ges_pipeline, timeline)) {
        g_printerr("Konnte Timeline nicht setzen\n");
        return -1;
    }

//    pipeline = GST_PIPELINE(ges_pipeline_get_pipeline(ges_pipeline));
pipeline = GST_PIPELINE(ges_pipeline);

    /* Bus für Nachrichten überwachen */
    bus = gst_element_get_bus(GST_ELEMENT(pipeline));
    gst_bus_add_signal_watch(bus);

    /* Haupt-Event-Loop erstellen */
    mainloop = g_main_loop_new(NULL, FALSE);

    /* Callback für Nachrichten registrieren */
    g_signal_connect(bus, "message", G_CALLBACK(bus_message_cb), mainloop);

    /* Wiedergabe starten */
    gst_element_set_state(GST_ELEMENT(pipeline), GST_STATE_PLAYING);

    /* Haupt-Event-Loop starten */
    g_main_loop_run(mainloop);

    /* Ressourcen freigeben */
    gst_element_set_state(GST_ELEMENT(pipeline), GST_STATE_NULL);
    gst_object_unref(bus);
    g_main_loop_unref(mainloop);
    gst_object_unref(pipeline);

    return 0;
va_list vl;
}
