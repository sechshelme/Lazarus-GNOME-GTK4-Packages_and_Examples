program project1;

uses
  elf,
  elf_fdpic,
  elf_linux,
  gelf,
  libelf,
  link,
  link_bits,

  fp_elf64;

  procedure main;
  begin
    if (argc != 2) {
        fprintf(stderr, "Usage: %s <elf-file>\n", argv[0]);
        return 1;
    }

    if (elf_version(EV_CURRENT) == EV_NONE) {
        fprintf(stderr, "ELF library initialization failed.\n");
        return 1;
    }

    int fd = open(argv[1], O_RDONLY);
    if (fd < 0) {
        perror("Failed to open ELF file");
        return 1;
    }

    Elf *elf = elf_begin(fd, ELF_C_READ, NULL);
    if (!elf) {
        fprintf(stderr, "elf_begin() failed: %s\n", elf_errmsg(-1));
        close(fd);
        return 1;
    }

    size_t shstrndx;
    if (elf_getshdrstrndx(elf, &shstrndx) != 0) {
        fprintf(stderr, "elf_getshdrstrndx() failed: %s\n", elf_errmsg(-1));
        elf_end(elf);
        close(fd);
        return 1;
    }

    Elf_Scn *scn = NULL;
    while ((scn = elf_nextscn(elf, scn)) != NULL) {
        GElf_Shdr shdr;
        if (gelf_getshdr(scn, &shdr) != &shdr) {
            fprintf(stderr, "gelf_getshdr() failed: %s\n", elf_errmsg(-1));
            elf_end(elf);
            close(fd);
            return 1;
        }

        if (shdr.sh_type == SHT_SYMTAB || shdr.sh_type == SHT_DYNSYM) {
            Elf_Data *data = elf_getdata(scn, NULL);
            int count = shdr.sh_size / shdr.sh_entsize;
            printf("Symbol table: %d entries\n", count);

            for (int i = 0; i < count; i++) {
                GElf_Sym sym;
                if (gelf_getsym(data, i, &sym) != &sym) {
                    fprintf(stderr, "gelf_getsym() failed: %s\n", elf_errmsg(-1));
                    continue;
                }
                const char *name = elf_strptr(elf, shdr.sh_link, sym.st_name);
                if (name && name[0] != '\0') {
                    printf("%s: 0x%08jx\n", name, (uintmax_t)sym.st_value);
                }
            }
        }
    }

    elf_end(elf);
    close(fd);

    return 0;

  end;


begin
  main;
end.
