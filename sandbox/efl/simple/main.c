

// gcc main.c -o main `pkg-config --cflags --libs elementary`
// sudo apt install libefl-all-dev

// https://www.perplexity.ai/search/ich-probiere-gerade-mit-efl-ru-zQ6nLfQCStqq_aiEhSeXuw

#include <Elementary.h>


struct Node
{
   Eina_Inlist __in_list;
   EINA_MAGIC;
   ;;;;;;;;;;;;;

   Eina_Simple_XML_Node_Tag *parent;
   Eina_Simple_XML_Node_Type type;
};

static void
on_button_click(void *data, Evas_Object *obj, void *event_info)
{
    elm_object_text_set(obj, "Geklickt!");
}

// Callback für das Schließen des Fensters
static void
on_win_del(void *data, Evas_Object *obj, void *event_info)
{
    elm_exit(); // Beendet die Event-Loop
}

int main(int argc, char **argv)
{
    elm_init(argc, argv);

    Evas_Object *win, *box, *btn, *entry, *entry_multi;;

    // Fenster erstellen
    win = elm_win_util_standard_add("EFL Beispiel", "EFL Beispiel");
    elm_win_autodel_set(win, EINA_TRUE);

    // Callback für das Schließen des Fensters hinzufügen
    evas_object_smart_callback_add(win, "delete,request", on_win_del, NULL);

    // Box für vertikales Layout erstellen
    box = elm_box_add(win);
    evas_object_size_hint_weight_set(box, EVAS_HINT_EXPAND, EVAS_HINT_EXPAND);
    elm_win_resize_object_add(win, box);
    evas_object_show(box);

    // Button erstellen
    btn = elm_button_add(win);
    elm_object_text_set(btn, "Klick mich!");
    evas_object_smart_callback_add(btn, "clicked", on_button_click, NULL);
    evas_object_size_hint_weight_set(btn, EVAS_HINT_EXPAND, 0.0);
    evas_object_size_hint_align_set(btn, EVAS_HINT_FILL, 0.0);
    elm_box_pack_end(box, btn);
    evas_object_show(btn);

    // Entry (Textfeld) hinzufügen
    entry = elm_entry_add(win);
    elm_entry_single_line_set(entry, EINA_TRUE); // Einzelne Zeile
    elm_object_text_set(entry, "Hier Text eingeben...");
    evas_object_size_hint_weight_set(entry, EVAS_HINT_EXPAND, 0.0);
    evas_object_size_hint_align_set(entry, EVAS_HINT_FILL, 0.0);
    elm_box_pack_end(box, entry);
    evas_object_show(entry);

    // Entry (Textfeld) hinzufügen
    entry = elm_entry_add(win);
    elm_entry_single_line_set(entry, EINA_TRUE); // Einzelne Zeile
    elm_object_text_set(entry, "Hier Text eingeben...");
    evas_object_size_hint_weight_set(entry, EVAS_HINT_EXPAND, 0.0);
    evas_object_size_hint_align_set(entry, EVAS_HINT_FILL, 0.0);
    elm_box_pack_end(box, entry);
    evas_object_show(entry);

    // Mehrzeiliges Entry (Editor) hinzufügen
    entry_multi = elm_entry_add(win);
    elm_entry_single_line_set(entry_multi, EINA_FALSE); // Mehrzeilig
    elm_entry_scrollable_set(entry_multi, EINA_TRUE);   // Scrollbar aktivieren
    elm_object_text_set(entry_multi, "Mehrzeiliges Entry –\nHier kannst du mehrere Zeilen schreiben.");
    evas_object_size_hint_weight_set(entry_multi, EVAS_HINT_EXPAND, EVAS_HINT_EXPAND);
    evas_object_size_hint_align_set(entry_multi, EVAS_HINT_FILL, EVAS_HINT_FILL);
    elm_box_pack_end(box, entry_multi);
    evas_object_show(entry_multi);



    evas_object_resize(win, 640, 480);
    evas_object_show(win);

    elm_run();
    elm_shutdown();

    return 0;
}


