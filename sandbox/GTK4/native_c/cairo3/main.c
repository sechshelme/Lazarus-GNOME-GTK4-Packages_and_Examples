


// gcc main.c -o main `pkg-config --cflags --libs gtk4 gobject-2.0`

// gcc -o main main.c `pkg-config --cflags --libs harfbuzz freetype2`

// gcc -o main main.c `pkg-config --cflags --libs gtk4` -lm

// https://www.perplexity.ai/search/gib-mir-ein-gtk4-beispiel-mit-c_0ODt3wQVGdQ_TbsHfUYw
// https://www.perplexity.ai/search/gib-mir-ein-beispiel-mit-4-gtk-Hw1mxHDXStelLjjSNkCZPA


#include <gtk/gtk.h>
#include <math.h>

typedef struct {
    double angle;
    double speed;
    GdkRGBA color;
} AnimationParams;

static gboolean on_draw(GtkWidget *widget, cairo_t *cr, gpointer user_data) {
    AnimationParams *params = (AnimationParams *)user_data;
    int width, height;

    width = gtk_widget_get_allocated_width(widget);
    height = gtk_widget_get_allocated_height(widget);

    cairo_set_source_rgb(cr, params->color.red, params->color.green, params->color.blue);
    cairo_translate(cr, width / 2, height / 2);
    cairo_rotate(cr, params->angle);
    cairo_rectangle(cr, -40, -40, 80, 80);
    cairo_fill(cr);

    return FALSE;
}

static gboolean update(gpointer user_data) {
    GtkWidget *drawing_area = GTK_WIDGET(user_data);
    AnimationParams *params = g_object_get_data(G_OBJECT(drawing_area), "params");
    
    params->angle += params->speed;
    gtk_widget_queue_draw(drawing_area);
    
    return G_SOURCE_CONTINUE;
}

static GtkWidget* create_animated_drawing_area(double speed, GdkRGBA color) {
    GtkWidget *drawing_area = gtk_drawing_area_new();
    gtk_widget_set_size_request(drawing_area, 200, 200);

    AnimationParams *params = g_new(AnimationParams, 1);
    params->angle = 0;
    params->speed = speed;
    params->color = color;

    g_object_set_data_full(G_OBJECT(drawing_area), "params", params, g_free);

    g_signal_connect(drawing_area, "draw", G_CALLBACK(on_draw), params);
    g_timeout_add(50, update, drawing_area);

    return drawing_area;
}

static void activate(GtkApplication *app, gpointer user_data) {
    GtkWidget *window;
    GtkWidget *grid;
    GtkWidget *drawing_area;
    GdkRGBA colors[4] = {
        {1.0, 0.0, 0.0, 1.0},  // Red
        {0.0, 1.0, 0.0, 1.0},  // Green
        {0.0, 0.0, 1.0, 1.0},  // Blue
        {1.0, 0.0, 1.0, 1.0}   // Purple
    };
    double speeds[4] = {0.05, 0.1, 0.15, 0.2};

    window = gtk_application_window_new(app);
    gtk_window_set_title(GTK_WINDOW(window), "Multiple Animated DrawingAreas");
    gtk_window_set_default_size(GTK_WINDOW(window), 800, 400);

    grid = gtk_grid_new();
    gtk_container_add(GTK_CONTAINER(window), grid);

    for (int i = 0; i < 4; i++) {
        drawing_area = create_animated_drawing_area(speeds[i], colors[i]);
        gtk_grid_attach(GTK_GRID(grid), drawing_area, i % 2, i / 2, 1, 1);
    }

    gtk_widget_show_all(window);
}

int main(int argc, char **argv) {
    GtkApplication *app;
    int status;

    app = gtk_application_new("org.example.animateddrawingareas", G_APPLICATION_DEFAULT_FLAGS);
    g_signal_connect(app, "activate", G_CALLBACK(activate), NULL);
    status = g_application_run(G_APPLICATION(app), argc, argv);
    g_object_unref(app);

    return status;
}

