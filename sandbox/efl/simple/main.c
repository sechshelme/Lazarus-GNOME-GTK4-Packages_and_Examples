

// gcc main.c -o main `pkg-config --cflags --libs elementary`
// sudo apt install libefl-all-dev

// https://www.perplexity.ai/search/ich-probiere-gerade-mit-efl-ru-zQ6nLfQCStqq_aiEhSeXuw


#include <Elementary.h>

// Callback für den ersten Button
static void
on_button_click(void *data, Evas_Object *obj, void *event_info)
{
    elm_object_text_set(obj, "Geklickt!");
}

// Callback für den zweiten Button (Beenden)
static void
on_exit_button_click(void *data, Evas_Object *obj, void *event_info)
{
    elm_exit(); // Beendet die Event-Loop
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

    Evas_Object *win, *box, *btn1, *btn2;

    // Fenster erstellen
    win = elm_win_util_standard_add("EFL Beispiel", "EFL Beispiel");
    elm_win_autodel_set(win, EINA_TRUE);

    // Callback für das Schließen des Fensters hinzufügen
    evas_object_smart_callback_add(win, "delete,request", on_win_del, NULL);

    // Box als Container für die Buttons
    box = elm_box_add(win);
    evas_object_size_hint_weight_set(box, EVAS_HINT_EXPAND, EVAS_HINT_EXPAND);
    elm_win_resize_object_add(win, box);
    evas_object_show(box);

    // Erster Button
    btn1 = elm_button_add(win);
    elm_object_text_set(btn1, "Klick mich!");
    evas_object_smart_callback_add(btn1, "clicked", on_button_click, NULL);
    evas_object_size_hint_weight_set(btn1, EVAS_HINT_EXPAND, 0.0);
    elm_box_pack_end(box, btn1);
    evas_object_show(btn1);

    // Zweiter Button (Beenden)
    btn2 = elm_button_add(win);
    elm_object_text_set(btn2, "Beenden");
    evas_object_smart_callback_add(btn2, "clicked", on_exit_button_click, NULL);
    evas_object_size_hint_weight_set(btn2, EVAS_HINT_EXPAND, 0.0);
    elm_box_pack_end(box, btn2);
    evas_object_show(btn2);

    evas_object_resize(win, 240, 120);
    evas_object_show(win);

    elm_run();
    elm_shutdown();

    return 0;

    _efl_class_creation_lock();
}

