program project1;
uses
x509,
ssl;     // Makros entfernt





//#include <stdio.h>
//#include <openssl/ssl.h>
//#include <openssl/err.h>
//#include <arpa/inet.h>
//#include <netdb.h>
//#include <unistd.h>

print main() {
//    SSL_library_init();
//    SSL_load_error_strings();
//    OpenSSL_add_all_algorithms();

    SSL_CTX *ctx = SSL_CTX_new(TLS_client_method());
    if (!ctx) {
        ERR_print_errors_fp(stderr);
        return 1;
    }

    SSL *ssl = SSL_new(ctx);

    int sock = socket(AF_INET, SOCK_STREAM, 0);
    struct hostent *host = gethostbyname("www.example.com");
    struct sockaddr_in addr;
    addr.sin_family = AF_INET;
    addr.sin_port = htons(443);
    addr.sin_addr = *((struct in_addr*)host->h_addr);
    connect(sock, (struct sockaddr*)&addr, sizeof(addr));

    SSL_set_fd(ssl, sock);
    if (SSL_connect(ssl) != 1) {
        ERR_print_errors_fp(stderr);
    } else {
        const char* req = "GET / HTTP/1.0\r\nHost: www.example.com\r\n\r\n";
        SSL_write(ssl, req, strlen(req));
        char buf[4096];
        int bytes;
        while ((bytes = SSL_read(ssl, buf, sizeof(buf)-1)) > 0) {
            buf[bytes] = 0;
            printf("%s", buf);
        }
    }

    SSL_free(ssl);
    close(sock);
    SSL_CTX_free(ctx);
    EVP_cleanup();
    return 0;
}
begin

end.

