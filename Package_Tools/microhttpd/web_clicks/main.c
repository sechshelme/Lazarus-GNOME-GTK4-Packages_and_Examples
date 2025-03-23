

// gcc -o main main.c -lmicrohttpd

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <microhttpd.h>

#define PORT 3000
#define FILENAME "clickCount.txt"

static int clickCount = 0;

static int answer_to_connection(void *cls, struct MHD_Connection *connection,
                                const char *url, const char *method,
                                const char *version, const char *upload_data,
                                size_t *upload_data_size, void **con_cls) {
    const char *page;
    struct MHD_Response *response;
    int ret;

          printf("%s\n", url);

    if (strcmp(url, "/click") == 0) {
        clickCount++;
        FILE *f = fopen(FILENAME, "w");
        if (f) {
            fprintf(f, "%d", clickCount);
            fclose(f);
        }
        char count_str[20];
        snprintf(count_str, sizeof(count_str), "Klicks: %d", clickCount);
        response = MHD_create_response_from_buffer(strlen(count_str), (void*)count_str, MHD_RESPMEM_MUST_COPY);
        MHD_add_response_header(response, "Content-Type", "text/plain");
    } else {
        char html[1000];
        snprintf(html, sizeof(html),
                 "<html><body>"
                 "<h1>Klick-Zähler</h1>"
                 "<button onclick=\"handleClick()\">Klick mich!</button>"
                 "<p id=\"count\">Klicks: %d</p>"
                 "<script>"
                 "function handleClick() {"
                 "  fetch('/click')"
                 "    .then(response => response.text())"
                 "    .then(data => document.getElementById('count').textContent = data);"
                 "}"
                 "</script>"
                 "</body></html>", clickCount);
        response = MHD_create_response_from_buffer(strlen(html), (void*)html, MHD_RESPMEM_MUST_COPY);
        MHD_add_response_header(response, "Content-Type", "text/html; charset=utf-8");
    }

    ret = MHD_queue_response(connection, MHD_HTTP_OK, response);
    MHD_destroy_response(response);

    return ret;
}

int main() {
    struct MHD_Daemon *daemon;

    FILE *f = fopen(FILENAME, "r");
    if (f) {
        fscanf(f, "%d", &clickCount);
        fclose(f);
    }

    daemon = MHD_start_daemon(MHD_USE_THREAD_PER_CONNECTION, PORT, NULL, NULL,
                              &answer_to_connection, NULL, MHD_OPTION_END);
    if (daemon == NULL) return 1;

    printf("Server läuft auf http://localhost:%d/\n", PORT);

    getchar();

    MHD_stop_daemon(daemon);
    return 0;
}

