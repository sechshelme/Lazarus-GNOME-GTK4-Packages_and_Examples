

// gcc main.c -o main -lssh

// https://www.perplexity.ai/search/was-kann-man-mit-der-libssh-ma-Z6s_nen.SsCrMl2hbqgxtQ

#include <stdio.h>
#include <libssh/libssh.h>

int main(void) {
    ssh_session session;
    ssh_channel channel;
    int rc;
    char buffer[256];
    int nbytes;

    // SSH-Session anlegen und verbinden
    session = ssh_new();
    if (session == NULL) return 1;
    ssh_options_set(session, SSH_OPTIONS_HOST, "localhost");
    ssh_options_set(session, SSH_OPTIONS_USER, "tux"); // <--- Benutzername anpassen

    rc = ssh_connect(session);
    if (rc != SSH_OK) {
        fprintf(stderr, "Fehler beim Verbinden: %s\n", ssh_get_error(session));
        ssh_free(session);
        return 1;
    }

    // Authentifizierung mit Passwort
    rc = ssh_userauth_password(session, NULL, "123456"); // <--- Passwort anpassen
    if (rc != SSH_AUTH_SUCCESS) {
        fprintf(stderr, "Authentifizierung fehlgeschlagen: %s\n", ssh_get_error(session));
        ssh_disconnect(session);
        ssh_free(session);
        return 1;
    }

    // Channel öffnen und Befehl ausführen
    channel = ssh_channel_new(session);
    if (channel == NULL) return 1;
    rc = ssh_channel_open_session(channel);
    if (rc != SSH_OK) return 1;
    rc = ssh_channel_request_exec(channel, "ls");
    if (rc != SSH_OK) return 1;

    // Ausgabe lesen und anzeigen
    nbytes = ssh_channel_read(channel, buffer, sizeof(buffer), 0);
    while (nbytes > 0) {
        fwrite(buffer, 1, nbytes, stdout);
        nbytes = ssh_channel_read(channel, buffer, sizeof(buffer), 0);
    }

    // Aufräumen
    ssh_channel_send_eof(channel);
    ssh_channel_close(channel);
    ssh_channel_free(channel);
    ssh_disconnect(session);
    ssh_free(session);

    return 0;
}

