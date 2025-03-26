// gcc -o main main.c -lmicrohttpd

// https://www.perplexity.ai/search/794b0fff-c7b9-499d-8628-a6a438f0c14e

// http://localhost:3000

#include <microhttpd.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#define PORT 8080

static int click_count = 0;

static const char *generate_page() {
    static char page[1024];
    snprintf(page, sizeof(page),
             "<html><body>"
             "<h1>Klick-Zähler</h1>"
             "<p>Anzahl der Klicks: %d</p>"
             "<form action='/click' method='post'>"
             "<input type='submit' value='Klicken'>"
             "</form>"
             "</body></html>",
             click_count);
    return page;
}

static enum MHD_Result answer_to_connection(void *cls, struct MHD_Connection *connection,
                                            const char *url, const char *method,
                                            const char *version, const char *upload_data,
                                            uint64_t *upload_data_size, void **con_cls) 
{
    if (strcmp(url, "/click") == 0 && strcmp(method, "POST") == 0) {
        click_count++;
        // Redirect zurück zur Hauptseite
        struct MHD_Response *response = MHD_create_response_from_buffer(0, NULL, MHD_RESPMEM_PERSISTENT);
        MHD_add_response_header(response, "Location", "/");
        int ret = MHD_queue_response(connection, MHD_HTTP_SEE_OTHER, response);
        MHD_destroy_response(response);
        return ret;
    }

    const char *page = generate_page();
    struct MHD_Response *response = MHD_create_response_from_buffer(strlen(page), (void *)page, MHD_RESPMEM_PERSISTENT);
    int ret = MHD_queue_response(connection, MHD_HTTP_OK, response);
    MHD_destroy_response(response);

    return ret;
}

int main() {
    struct MHD_Daemon *daemon;

    daemon = MHD_start_daemon(MHD_USE_AUTO | MHD_USE_INTERNAL_POLLING_THREAD,
                              PORT,
                              NULL,
                              NULL,
                              &answer_to_connection,
                              NULL,
                              MHD_OPTION_END);
    if (NULL == daemon) return 1;

    printf("Server läuft auf Port %d. Drücken Sie Enter zum Beenden.\n", PORT);
    getchar();

    MHD_stop_daemon(daemon);
    return 0;
}

