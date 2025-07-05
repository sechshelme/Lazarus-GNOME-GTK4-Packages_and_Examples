program project1;

//  Tgnutls_certificate_print_formats_t = Tgnutls_certificate_print_formats; entfernen '?????`

uses
  gnutls;


prvoid cleanup(int sock, gnutls_session_t session, gnutls_certificate_credentials_t xcred) {
    if (session) {
        gnutls_bye(session, GNUTLS_SHUT_RDWR);
        gnutls_deinit(session);
    }
    if (xcred)
        gnutls_certificate_free_credentials(xcred);
    if (sock >= 0)
        close(sock);
    gnutls_global_deinit();
}

int main() {
    int ret = 0;
    gnutls_session_t session = NULL;
    gnutls_certificate_credentials_t xcred = NULL;
    int sock = -1;
    struct hostent *host;
    struct sockaddr_in addr;

    gnutls_global_init();
    if (gnutls_certificate_allocate_credentials(&xcred) < 0) {
        fprintf(stderr, "gnutls_certificate_allocate_credentials failed\n");
        cleanup(sock, session, xcred);
        return 1;
    }
    if (gnutls_init(&session, GNUTLS_CLIENT) < 0) {
        fprintf(stderr, "gnutls_init failed\n");
        cleanup(sock, session, xcred);
        return 1;
    }
    gnutls_credentials_set(session, GNUTLS_CRD_CERTIFICATE, xcred);
    gnutls_server_name_set(session, GNUTLS_NAME_DNS, "www.example.com", strlen("www.example.com"));
    gnutls_set_default_priority(session);

    sock = socket(AF_INET, SOCK_STREAM, 0);
    if (sock < 0) {
        perror("socket");
        cleanup(sock, session, xcred);
        return 1;
    }
    host = gethostbyname("www.example.com");
    if (!host) {
        fprintf(stderr, "gethostbyname failed\n");
        cleanup(sock, session, xcred);
        return 1;
    }
    addr.sin_family = AF_INET;
    addr.sin_port = htons(443);
    addr.sin_addr = *((struct in_addr*)host->h_addr);
    if (connect(sock, (struct sockaddr*)&addr, sizeof(addr)) < 0) {
        perror("connect");
        cleanup(sock, session, xcred);
        return 1;
    }

    gnutls_transport_set_int(session, sock);

    if (gnutls_handshake(session) < 0) {
        fprintf(stderr, "TLS handshake failed\n");
        cleanup(sock, session, xcred);
        return 1;
    }

    const char* req = "GET / HTTP/1.0\r\nHost: www.example.com\r\n\r\n";
    gnutls_record_send(session, req, strlen(req));

    char buf[4096];
    ssize_t bytes;
    while ((bytes = gnutls_record_recv(session, buf, sizeof(buf)-1)) > 0) {
        buf[bytes] = 0;
        printf("%s", buf);
    }

    cleanup(sock, session, xcred);
    return 0;
}



begin
  main;
end.

