program project1;

// export http_proxy="http://proxy.example.com:8080"

uses
  pcap_inttypes,
  vlan,
  usb,
  socket_,
  sll,


  bluetooth,
  can_socketcan,
  dlt,
  ipnet,
  namedb,
  nflog,

  bpf,
  pcap,




  fp_pcap;

  procedure ShowProxy;
  var
    pf: PpxProxyFactory;
    proxies: PPChar;
    i: integer = 0;
  begin
    pf := px_proxy_factory_new;
    if pf <> nil then begin
      proxies := px_proxy_factory_get_proxies(pf, 'http://www.example.com');

      if proxies <> nil then begin
        while proxies[i] <> nil do begin
          g_printf('Proxy: %s'#10, proxies[i]);
          Inc(i);
        end;
        px_proxy_factory_free_proxies(proxies);
      end;
      px_proxy_factory_free(pf);
    end;
  end;

  procedure main;
  begin
    ShowProxy;
    g_setenv('http_proxy', 'http://proxy.example.com:8080', gTRUE);
    ShowProxy;
  end;

begin
  main;
end.
// gcc main.c -o main -lpcap(*
#include <pcap.h>
#include <stdio.h>
#include <stdlib.h>

#include <arpa/inet.h>
#include <netinet/ip.h>
#include <netinet/if_ether.h>

void packet_handler(u_char *args, const struct pcap_pkthdr *header, const u_char *packet) {
//    printf("Packet captured: length %d\n", header->len);


    struct ethhdr *eth = (struct ethhdr *)packet;
if (ntohs(eth - > h_proto) = = ETH_P_IP) {
        struct iphdr *ip = (struct iphdr *)(packet + sizeof(struct ethhdr));

        char src_ip[INET_ADDRSTRLEN];
        char dst_ip[INET_ADDRSTRLEN];

        inet_ntop(AF_INET, &(ip->saddr), src_ip, INET_ADDRSTRLEN);
        inet_ntop(AF_INET, &(ip->daddr), dst_ip, INET_ADDRSTRLEN);

        printf("IP Packet: %s -> %s, length: %d bytes\n", src_ip, dst_ip, header->len);
    }else {
        printf("Nicht-IP Paket, EtherType: 0x%x\n", ntohs(eth->h_proto));
    }}
int main() {
    pcap_if_t *alldevs, *d;
    pcap_t *handle;
    char errbuf[PCAP_ERRBUF_SIZE];
    int i = 0;
    int dev_num;

    if (pcap_findalldevs(&alldevs, errbuf) == -1) {
        fprintf(stderr, "Error finding devices: %s\n", errbuf);
        return 1;
    }

    printf("Available devices:\n");
    for (d = alldevs; d != NULL; d = d->next) {
        printf("%d. %s", ++i, d->name);
        if (d->description)
            printf(" - %s", d->description);
        printf("\n");
    }

    printf("Select device number: ");
    scanf("%d", &dev_num);

    // Find the selected device
    d = alldevs;
    for (int j = 1; j < dev_num && d != NULL; j++) {
        d = d->next;
    }
    if (d == NULL) {
        fprintf(stderr, "Invalid device number.\n");
        pcap_freealldevs(alldevs);
        return 1;
    }

    // Open the selected device for live capture
    handle = pcap_open_live(d->name, BUFSIZ, 1, 1000, errbuf);
    if (handle == NULL) {
        fprintf(stderr, "Could not open device %s: %s\n", d->name, errbuf);
        pcap_freealldevs(alldevs);
        return 1;
    }

    printf("Listening on %s...\n", d->name);
    pcap_loop(handle, -1, packet_handler, NULL);

    pcap_close(handle);
    pcap_freealldevs(alldevs);
    return 0;
} * )
