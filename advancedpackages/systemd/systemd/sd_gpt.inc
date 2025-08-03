  {$IFDEF read_interface}


const
  SD_GPT_ROOT_ALPHA: Tsd_id128_t = (bytes: ($65, $23, $f8, $ae, $3e, $b1, $4e, $2a, $a0, $5a, $18, $b6, $95, $ae, $65, $6f));
  SD_GPT_ROOT_ARC: Tsd_id128_t = (bytes: ($d2, $7f, $46, $ed, $29, $19, $4c, $b8, $bd, $25, $95, $31, $f3, $c1, $65, $34));
  SD_GPT_ROOT_ARM: Tsd_id128_t = (bytes: ($69, $da, $d7, $10, $2c, $e4, $4e, $3c, $b1, $6c, $21, $a1, $d4, $9a, $be, $d3));
  SD_GPT_ROOT_ARM64: Tsd_id128_t = (bytes: ($b9, $21, $b0, $45, $1d, $f0, $41, $c3, $af, $44, $4c, $6f, $28, $0d, $3f, $ae));
  SD_GPT_ROOT_IA64: Tsd_id128_t = (bytes: ($99, $3d, $8d, $3d, $f8, $0e, $42, $25, $85, $5a, $9d, $af, $8e, $d7, $ea, $97));
  SD_GPT_ROOT_LOONGARCH64: Tsd_id128_t = (bytes: ($77, $05, $58, $00, $79, $2c, $4f, $94, $b3, $9a, $98, $c9, $1b, $76, $2b, $b6));
  SD_GPT_ROOT_MIPS: Tsd_id128_t = (bytes: ($e9, $43, $45, $44, $6e, $2c, $47, $cc, $ba, $e2, $12, $d6, $de, $af, $b4, $4c));
  SD_GPT_ROOT_MIPS64: Tsd_id128_t = (bytes: ($d1, $13, $af, $76, $80, $ef, $41, $b4, $bd, $b6, $0c, $ff, $4d, $3d, $4a, $25));
  SD_GPT_ROOT_MIPS_LE: Tsd_id128_t = (bytes: ($37, $c5, $8c, $8a, $d9, $13, $41, $56, $a2, $5f, $48, $b1, $b6, $4e, $07, $f0));
  SD_GPT_ROOT_MIPS64_LE: Tsd_id128_t = (bytes: ($70, $0b, $da, $43, $7a, $34, $45, $07, $b1, $79, $ee, $b9, $3d, $7a, $7c, $a3));
  SD_GPT_ROOT_PARISC: Tsd_id128_t = (bytes: ($1a, $ac, $db, $3b, $54, $44, $41, $38, $bd, $9e, $e5, $c2, $23, $9b, $23, $46));
  SD_GPT_ROOT_PPC: Tsd_id128_t = (bytes: ($1d, $e3, $f1, $ef, $fa, $98, $47, $b5, $8d, $cd, $4a, $86, $0a, $65, $4d, $78));
  SD_GPT_ROOT_PPC64: Tsd_id128_t = (bytes: ($91, $2a, $de, $1d, $a8, $39, $49, $13, $89, $64, $a1, $0e, $ee, $08, $fb, $d2));
  SD_GPT_ROOT_PPC64_LE: Tsd_id128_t = (bytes: ($c3, $1c, $45, $e6, $3f, $39, $41, $2e, $80, $fb, $48, $09, $c4, $98, $05, $99));
  SD_GPT_ROOT_RISCV32: Tsd_id128_t = (bytes: ($60, $d5, $a7, $fe, $8e, $7d, $43, $5c, $b7, $14, $3d, $d8, $16, $21, $44, $e1));
  SD_GPT_ROOT_RISCV64: Tsd_id128_t = (bytes: ($72, $ec, $70, $a6, $cf, $74, $40, $e6, $bd, $49, $4b, $da, $08, $e8, $f2, $24));
  SD_GPT_ROOT_S390: Tsd_id128_t = (bytes: ($08, $a7, $ac, $ea, $62, $4c, $4a, $20, $91, $e8, $6e, $0f, $a6, $7d, $23, $f9));
  SD_GPT_ROOT_S390X: Tsd_id128_t = (bytes: ($5e, $ea, $d9, $a9, $fe, $09, $4a, $1e, $a1, $d7, $52, $0d, $00, $53, $13, $06));
  SD_GPT_ROOT_TILEGX: Tsd_id128_t = (bytes: ($c5, $0c, $dd, $70, $38, $62, $4c, $c3, $90, $e1, $80, $9a, $8c, $93, $ee, $2c));
  SD_GPT_ROOT_X86: Tsd_id128_t = (bytes: ($44, $47, $95, $40, $f2, $97, $41, $b2, $9a, $f7, $d1, $31, $d5, $f0, $45, $8a));
  SD_GPT_ROOT_X86_64: Tsd_id128_t = (bytes: ($4f, $68, $bc, $e3, $e8, $cd, $4d, $b1, $96, $e7, $fb, $ca, $f9, $84, $b7, $09));

  SD_GPT_USR_ALPHA: Tsd_id128_t = (bytes: ($e1, $8c, $f0, $8c, $33, $ec, $4c, $0d, $82, $46, $c6, $c6, $fb, $3d, $a0, $24));
  SD_GPT_USR_ARC: Tsd_id128_t = (bytes: ($79, $78, $a6, $83, $63, $16, $49, $22, $bb, $ee, $38, $bf, $f5, $a2, $fe, $cc));
  SD_GPT_USR_ARM: Tsd_id128_t = (bytes: ($7d, $03, $59, $a3, $02, $b3, $4f, $0a, $86, $5c, $65, $44, $03, $e7, $06, $25));
  SD_GPT_USR_ARM64: Tsd_id128_t = (bytes: ($b0, $e0, $10, $50, $ee, $5f, $43, $90, $94, $9a, $91, $01, $b1, $71, $04, $e9));
  SD_GPT_USR_IA64: Tsd_id128_t = (bytes: ($43, $01, $d2, $a6, $4e, $3b, $4b, $2a, $bb, $94, $9e, $0b, $2c, $42, $25, $ea));
  SD_GPT_USR_LOONGARCH64: Tsd_id128_t = (bytes: ($e6, $11, $c7, $02, $57, $5c, $4c, $be, $9a, $46, $43, $4f, $a0, $bf, $7e, $3f));
  SD_GPT_USR_MIPS: Tsd_id128_t = (bytes: ($77, $3b, $2a, $bc, $2a, $99, $43, $98, $8b, $f5, $03, $ba, $ac, $40, $d0, $2b));
  SD_GPT_USR_MIPS64: Tsd_id128_t = (bytes: ($57, $e1, $39, $58, $73, $31, $43, $65, $8e, $6e, $35, $ee, $ee, $17, $c6, $1b));
  SD_GPT_USR_MIPS_LE: Tsd_id128_t = (bytes: ($0f, $48, $68, $e9, $99, $52, $47, $06, $97, $9f, $3e, $d3, $a4, $73, $e9, $47));
  SD_GPT_USR_MIPS64_LE: Tsd_id128_t = (bytes: ($c9, $7c, $1f, $32, $ba, $06, $40, $b4, $9f, $22, $23, $60, $61, $b0, $8a, $a8));
  SD_GPT_USR_PARISC: Tsd_id128_t = (bytes: ($dc, $4a, $44, $80, $69, $17, $42, $62, $a4, $ec, $db, $93, $84, $94, $9f, $25));
  SD_GPT_USR_PPC: Tsd_id128_t = (bytes: ($7d, $14, $fe, $c5, $cc, $71, $41, $5d, $9d, $6c, $06, $bf, $0b, $3c, $3e, $af));
  SD_GPT_USR_PPC64: Tsd_id128_t = (bytes: ($2c, $97, $39, $e2, $f0, $68, $46, $b3, $9f, $d0, $01, $c5, $a9, $af, $bc, $ca));
  SD_GPT_USR_PPC64_LE: Tsd_id128_t = (bytes: ($15, $bb, $03, $af, $77, $e7, $4d, $4a, $b1, $2b, $c0, $d0, $84, $f7, $49, $1c));
  SD_GPT_USR_RISCV32: Tsd_id128_t = (bytes: ($b9, $33, $fb, $22, $5c, $3f, $4f, $91, $af, $90, $e2, $bb, $0f, $a5, $07, $02));
  SD_GPT_USR_RISCV64: Tsd_id128_t = (bytes: ($be, $ae, $c3, $4b, $84, $42, $43, $9b, $a4, $0b, $98, $43, $81, $ed, $09, $7d));
  SD_GPT_USR_S390: Tsd_id128_t = (bytes: ($cd, $0f, $86, $9b, $d0, $fb, $4c, $a0, $b1, $41, $9e, $a8, $7c, $c7, $8d, $66));
  SD_GPT_USR_S390X: Tsd_id128_t = (bytes: ($8a, $4f, $57, $70, $50, $aa, $4e, $d3, $87, $4a, $99, $b7, $10, $db, $6f, $ea));
  SD_GPT_USR_TILEGX: Tsd_id128_t = (bytes: ($55, $49, $70, $29, $c7, $c1, $44, $cc, $aa, $39, $81, $5e, $d1, $55, $86, $30));
  SD_GPT_USR_X86: Tsd_id128_t = (bytes: ($75, $25, $0d, $76, $8c, $c6, $45, $8e, $bd, $66, $bd, $47, $cc, $81, $a8, $12));
  SD_GPT_USR_X86_64: Tsd_id128_t = (bytes: ($84, $84, $68, $0c, $95, $21, $48, $c6, $9c, $11, $b0, $72, $06, $56, $f6, $9e));

  SD_GPT_ROOT_ALPHA_VERITY: Tsd_id128_t = (bytes: ($fc, $56, $d9, $e9, $e6, $e5, $4c, $06, $be, $32, $e7, $44, $07, $ce, $09, $a5));
  SD_GPT_ROOT_ARC_VERITY: Tsd_id128_t = (bytes: ($24, $b2, $d9, $75, $0f, $97, $45, $21, $af, $a1, $cd, $53, $1e, $42, $1b, $8d));
  SD_GPT_ROOT_ARM_VERITY: Tsd_id128_t = (bytes: ($73, $86, $cd, $f2, $20, $3c, $47, $a9, $a4, $98, $f2, $ec, $ce, $45, $a2, $d6));
  SD_GPT_ROOT_ARM64_VERITY: Tsd_id128_t = (bytes: ($df, $33, $00, $ce, $d6, $9f, $4c, $92, $97, $8c, $9b, $fb, $0f, $38, $d8, $20));
  SD_GPT_ROOT_IA64_VERITY: Tsd_id128_t = (bytes: ($86, $ed, $10, $d5, $b6, $07, $45, $bb, $89, $57, $d3, $50, $f2, $3d, $05, $71));
  SD_GPT_ROOT_LOONGARCH64_VERITY: Tsd_id128_t = (bytes: ($f3, $39, $3b, $22, $e9, $af, $46, $13, $a9, $48, $9d, $3b, $fb, $d0, $c5, $35));
  SD_GPT_ROOT_MIPS_VERITY: Tsd_id128_t = (bytes: ($7a, $43, $07, $99, $f7, $11, $4c, $7e, $8e, $5b, $1d, $68, $5b, $d4, $86, $07));
  SD_GPT_ROOT_MIPS64_VERITY: Tsd_id128_t = (bytes: ($57, $95, $36, $f8, $6a, $33, $40, $55, $a9, $5a, $df, $2d, $5e, $2c, $42, $a8));
  SD_GPT_ROOT_MIPS_LE_VERITY: Tsd_id128_t = (bytes: ($d7, $d1, $50, $d2, $2a, $04, $4a, $33, $8f, $12, $16, $65, $12, $05, $ff, $7b));
  SD_GPT_ROOT_MIPS64_LE_VERITY: Tsd_id128_t = (bytes: ($16, $b4, $17, $f8, $3e, $06, $4f, $57, $8d, $d2, $9b, $52, $32, $f4, $1a, $a6));
  SD_GPT_ROOT_PARISC_VERITY: Tsd_id128_t = (bytes: ($d2, $12, $a4, $30, $fb, $c5, $49, $f9, $a9, $83, $a7, $fe, $ef, $2b, $8d, $0e));
  SD_GPT_ROOT_PPC64_LE_VERITY: Tsd_id128_t = (bytes: ($90, $6b, $d9, $44, $45, $89, $4a, $ae, $a4, $e4, $dd, $98, $39, $17, $44, $6a));
  SD_GPT_ROOT_PPC64_VERITY: Tsd_id128_t = (bytes: ($92, $25, $a9, $a3, $3c, $19, $4d, $89, $b4, $f6, $ee, $ff, $88, $f1, $76, $31));
  SD_GPT_ROOT_PPC_VERITY: Tsd_id128_t = (bytes: ($98, $cf, $e6, $49, $15, $88, $46, $dc, $b2, $f0, $ad, $d1, $47, $42, $49, $25));
  SD_GPT_ROOT_RISCV32_VERITY: Tsd_id128_t = (bytes: ($ae, $02, $53, $be, $11, $67, $40, $07, $ac, $68, $43, $92, $6c, $14, $c5, $de));
  SD_GPT_ROOT_RISCV64_VERITY: Tsd_id128_t = (bytes: ($b6, $ed, $55, $82, $44, $0b, $42, $09, $b8, $da, $5f, $f7, $c4, $19, $ea, $3d));
  SD_GPT_ROOT_S390_VERITY: Tsd_id128_t = (bytes: ($7a, $c6, $3b, $47, $b2, $5c, $46, $3b, $8d, $f8, $b4, $a9, $4e, $6c, $90, $e1));
  SD_GPT_ROOT_S390X_VERITY: Tsd_id128_t = (bytes: ($b3, $25, $bf, $be, $c7, $be, $4a, $b8, $83, $57, $13, $9e, $65, $2d, $2f, $6b));
  SD_GPT_ROOT_TILEGX_VERITY: Tsd_id128_t = (bytes: ($96, $60, $61, $ec, $28, $e4, $4b, $2e, $b4, $a5, $1f, $0a, $82, $5a, $1d, $84));
  SD_GPT_ROOT_X86_64_VERITY: Tsd_id128_t = (bytes: ($2c, $73, $57, $ed, $eb, $d2, $46, $d9, $ae, $c1, $23, $d4, $37, $ec, $2b, $f5));
  SD_GPT_ROOT_X86_VERITY: Tsd_id128_t = (bytes: ($d1, $3c, $5d, $3b, $b5, $d1, $42, $2a, $b2, $9f, $94, $54, $fd, $c8, $9d, $76));

  SD_GPT_USR_ALPHA_VERITY: Tsd_id128_t = (bytes: ($8c, $ce, $0d, $25, $c0, $d0, $4a, $44, $bd, $87, $46, $33, $1b, $f1, $df, $67));
  SD_GPT_USR_ARC_VERITY: Tsd_id128_t = (bytes: ($fc, $a0, $59, $8c, $d8, $80, $45, $91, $8c, $16, $4e, $da, $05, $c7, $34, $7c));
  SD_GPT_USR_ARM_VERITY: Tsd_id128_t = (bytes: ($c2, $15, $d7, $51, $7b, $cd, $46, $49, $be, $90, $66, $27, $49, $0a, $4c, $05));
  SD_GPT_USR_ARM64_VERITY: Tsd_id128_t = (bytes: ($6e, $11, $a4, $e7, $fb, $ca, $4d, $ed, $b9, $e9, $e1, $a5, $12, $bb, $66, $4e));
  SD_GPT_USR_IA64_VERITY: Tsd_id128_t = (bytes: ($6a, $49, $1e, $03, $3b, $e7, $45, $45, $8e, $38, $83, $32, $0e, $0e, $a8, $80));
  SD_GPT_USR_LOONGARCH64_VERITY: Tsd_id128_t = (bytes: ($f4, $6b, $2c, $26, $59, $ae, $48, $f0, $91, $06, $c5, $0e, $d4, $7f, $67, $3d));
  SD_GPT_USR_MIPS_VERITY: Tsd_id128_t = (bytes: ($6e, $5a, $1b, $c8, $d2, $23, $49, $b7, $bc, $a8, $37, $a5, $fc, $ce, $b9, $96));
  SD_GPT_USR_MIPS64_VERITY: Tsd_id128_t = (bytes: ($81, $cf, $9d, $90, $74, $58, $4d, $f4, $8d, $cf, $c8, $a3, $a4, $04, $f0, $9b));
  SD_GPT_USR_MIPS_LE_VERITY: Tsd_id128_t = (bytes: ($46, $b9, $8d, $8d, $b5, $5c, $4e, $8f, $aa, $b3, $37, $fc, $a7, $f8, $07, $52));
  SD_GPT_USR_MIPS64_LE_VERITY: Tsd_id128_t = (bytes: ($3c, $3d, $61, $fe, $b5, $f3, $41, $4d, $bb, $71, $87, $39, $a6, $94, $a4, $ef));
  SD_GPT_USR_PARISC_VERITY: Tsd_id128_t = (bytes: ($58, $43, $d6, $18, $ec, $37, $48, $d7, $9f, $12, $ce, $a8, $e0, $87, $68, $b2));
  SD_GPT_USR_PPC64_LE_VERITY: Tsd_id128_t = (bytes: ($ee, $2b, $99, $83, $21, $e8, $41, $53, $86, $d9, $b6, $90, $1a, $54, $d1, $ce));
  SD_GPT_USR_PPC64_VERITY: Tsd_id128_t = (bytes: ($bd, $b5, $28, $a5, $a2, $59, $47, $5f, $a8, $7d, $da, $53, $fa, $73, $6a, $07));
  SD_GPT_USR_PPC_VERITY: Tsd_id128_t = (bytes: ($df, $76, $5d, $00, $27, $0e, $49, $e5, $bc, $75, $f4, $7b, $b2, $11, $8b, $09));
  SD_GPT_USR_RISCV32_VERITY: Tsd_id128_t = (bytes: ($cb, $1e, $e4, $e3, $8c, $d0, $41, $36, $a0, $a4, $aa, $61, $a3, $2e, $87, $30));
  SD_GPT_USR_RISCV64_VERITY: Tsd_id128_t = (bytes: ($8f, $10, $56, $be, $9b, $05, $47, $c4, $81, $d6, $be, $53, $12, $8e, $5b, $54));
  SD_GPT_USR_S390_VERITY: Tsd_id128_t = (bytes: ($b6, $63, $c6, $18, $e7, $bc, $4d, $6d, $90, $aa, $11, $b7, $56, $bb, $17, $97));
  SD_GPT_USR_S390X_VERITY: Tsd_id128_t = (bytes: ($31, $74, $1c, $c4, $1a, $2a, $41, $11, $a5, $81, $e0, $0b, $44, $7d, $2d, $06));
  SD_GPT_USR_TILEGX_VERITY: Tsd_id128_t = (bytes: ($2f, $b4, $bf, $56, $07, $fa, $42, $da, $81, $32, $6b, $13, $9f, $20, $26, $ae));
  SD_GPT_USR_X86_64_VERITY: Tsd_id128_t = (bytes: ($77, $ff, $5f, $63, $e7, $b6, $46, $33, $ac, $f4, $15, $65, $b8, $64, $c0, $e6));
  SD_GPT_USR_X86_VERITY: Tsd_id128_t = (bytes: ($8f, $46, $1b, $0d, $14, $ee, $4e, $81, $9a, $a9, $04, $9b, $6f, $b9, $7a, $bd));

  SD_GPT_ROOT_ALPHA_VERITY_SIG: Tsd_id128_t = (bytes: ($d4, $64, $95, $b7, $a0, $53, $41, $4f, $80, $f7, $70, $0c, $99, $92, $1e, $f8));
  SD_GPT_ROOT_ARC_VERITY_SIG: Tsd_id128_t = (bytes: ($14, $3a, $70, $ba, $cb, $d3, $4f, $06, $91, $9f, $6c, $05, $68, $3a, $78, $bc));
  SD_GPT_ROOT_ARM_VERITY_SIG: Tsd_id128_t = (bytes: ($42, $b0, $45, $5f, $eb, $11, $49, $1d, $98, $d3, $56, $14, $5b, $a9, $d0, $37));
  SD_GPT_ROOT_ARM64_VERITY_SIG: Tsd_id128_t = (bytes: ($6d, $b6, $9d, $e6, $29, $f4, $47, $58, $a7, $a5, $96, $21, $90, $f0, $0c, $e3));
  SD_GPT_ROOT_IA64_VERITY_SIG: Tsd_id128_t = (bytes: ($e9, $8b, $36, $ee, $32, $ba, $48, $82, $9b, $12, $0c, $e1, $46, $55, $f4, $6a));
  SD_GPT_ROOT_LOONGARCH64_VERITY_SIG: Tsd_id128_t = (bytes: ($5a, $fb, $67, $eb, $ec, $c8, $4f, $85, $ae, $8e, $ac, $1e, $7c, $50, $e7, $d0));
  SD_GPT_ROOT_MIPS_VERITY_SIG: Tsd_id128_t = (bytes: ($bb, $a2, $10, $a2, $9c, $5d, $45, $ee, $9e, $87, $ff, $2c, $cb, $d0, $02, $d0));
  SD_GPT_ROOT_MIPS64_VERITY_SIG: Tsd_id128_t = (bytes: ($43, $ce, $94, $d4, $0f, $3d, $49, $99, $82, $50, $b9, $de, $af, $d9, $8e, $6e));
  SD_GPT_ROOT_MIPS_LE_VERITY_SIG: Tsd_id128_t = (bytes: ($c9, $19, $cc, $1f, $44, $56, $4e, $ff, $91, $8c, $f7, $5e, $94, $52, $5c, $a5));
  SD_GPT_ROOT_MIPS64_LE_VERITY_SIG: Tsd_id128_t = (bytes: ($90, $4e, $58, $ef, $5c, $65, $4a, $31, $9c, $57, $6a, $f5, $fc, $7c, $5d, $e7));
  SD_GPT_ROOT_PARISC_VERITY_SIG: Tsd_id128_t = (bytes: ($15, $de, $61, $70, $65, $d3, $43, $1c, $91, $6e, $b0, $dc, $d8, $39, $3f, $25));
  SD_GPT_ROOT_PPC64_LE_VERITY_SIG: Tsd_id128_t = (bytes: ($d4, $a2, $36, $e7, $e8, $73, $4c, $07, $bf, $1d, $bf, $6c, $f7, $f1, $c3, $c6));
  SD_GPT_ROOT_PPC64_VERITY_SIG: Tsd_id128_t = (bytes: ($f5, $e2, $c2, $0c, $45, $b2, $4f, $fa, $bc, $e9, $2a, $60, $73, $7e, $1a, $af));
  SD_GPT_ROOT_PPC_VERITY_SIG: Tsd_id128_t = (bytes: ($1b, $31, $b5, $aa, $ad, $d9, $46, $3a, $b2, $ed, $bd, $46, $7f, $c8, $57, $e7));
  SD_GPT_ROOT_RISCV32_VERITY_SIG: Tsd_id128_t = (bytes: ($3a, $11, $2a, $75, $87, $29, $43, $80, $b4, $cf, $76, $4d, $79, $93, $44, $48));
  SD_GPT_ROOT_RISCV64_VERITY_SIG: Tsd_id128_t = (bytes: ($ef, $e0, $f0, $87, $ea, $8d, $44, $69, $82, $1a, $4c, $2a, $96, $a8, $38, $6a));
  SD_GPT_ROOT_S390_VERITY_SIG: Tsd_id128_t = (bytes: ($34, $82, $38, $8e, $42, $54, $43, $5a, $a2, $41, $76, $6a, $06, $5f, $99, $60));
  SD_GPT_ROOT_S390X_VERITY_SIG: Tsd_id128_t = (bytes: ($c8, $01, $87, $a5, $73, $a3, $49, $1a, $90, $1a, $01, $7c, $3f, $a9, $53, $e9));
  SD_GPT_ROOT_TILEGX_VERITY_SIG: Tsd_id128_t = (bytes: ($b3, $67, $14, $39, $97, $b0, $4a, $53, $90, $f7, $2d, $5a, $8f, $3a, $d4, $7b));
  SD_GPT_ROOT_X86_64_VERITY_SIG: Tsd_id128_t = (bytes: ($41, $09, $2b, $05, $9f, $c8, $45, $23, $99, $4f, $2d, $ef, $04, $08, $b1, $76));
  SD_GPT_ROOT_X86_VERITY_SIG: Tsd_id128_t = (bytes: ($59, $96, $fc, $05, $10, $9c, $48, $de, $80, $8b, $23, $fa, $08, $30, $b6, $76));

  SD_GPT_USR_ALPHA_VERITY_SIG: Tsd_id128_t = (bytes: ($5c, $6e, $1c, $76, $07, $6a, $45, $7a, $a0, $fe, $f3, $b4, $cd, $21, $ce, $6e));
  SD_GPT_USR_ARC_VERITY_SIG: Tsd_id128_t = (bytes: ($94, $f9, $a9, $a1, $99, $71, $42, $7a, $a4, $00, $50, $cb, $29, $7f, $0f, $35));
  SD_GPT_USR_ARM_VERITY_SIG: Tsd_id128_t = (bytes: ($d7, $ff, $81, $2f, $37, $d1, $49, $02, $a8, $10, $d7, $6b, $a5, $7b, $97, $5a));
  SD_GPT_USR_ARM64_VERITY_SIG: Tsd_id128_t = (bytes: ($c2, $3c, $e4, $ff, $44, $bd, $4b, $00, $b2, $d4, $b4, $1b, $34, $19, $e0, $2a));
  SD_GPT_USR_IA64_VERITY_SIG: Tsd_id128_t = (bytes: ($8d, $e5, $8b, $c2, $2a, $43, $46, $0d, $b1, $4e, $a7, $6e, $4a, $17, $b4, $7f));
  SD_GPT_USR_LOONGARCH64_VERITY_SIG: Tsd_id128_t = (bytes: ($b0, $24, $f3, $15, $d3, $30, $44, $4c, $84, $61, $44, $bb, $de, $52, $4e, $99));
  SD_GPT_USR_MIPS_VERITY_SIG: Tsd_id128_t = (bytes: ($97, $ae, $15, $8d, $f2, $16, $49, $7b, $80, $57, $f7, $f9, $05, $77, $0f, $54));
  SD_GPT_USR_MIPS64_VERITY_SIG: Tsd_id128_t = (bytes: ($05, $81, $6c, $e2, $dd, $40, $4a, $c6, $a6, $1d, $37, $d3, $2d, $c1, $ba, $7d));
  SD_GPT_USR_MIPS_LE_VERITY_SIG: Tsd_id128_t = (bytes: ($3e, $23, $ca, $0b, $a4, $bc, $4b, $4e, $80, $87, $5a, $b6, $a2, $6a, $a8, $a9));
  SD_GPT_USR_MIPS64_LE_VERITY_SIG: Tsd_id128_t = (bytes: ($f2, $c2, $c7, $ee, $ad, $cc, $43, $51, $b5, $c6, $ee, $98, $16, $b6, $6e, $16));
  SD_GPT_USR_PARISC_VERITY_SIG: Tsd_id128_t = (bytes: ($45, $0d, $d7, $d1, $32, $24, $45, $ec, $9c, $f2, $a4, $3a, $34, $6d, $71, $ee));
  SD_GPT_USR_PPC64_LE_VERITY_SIG: Tsd_id128_t = (bytes: ($c8, $bf, $bd, $1e, $26, $8e, $45, $21, $8b, $ba, $bf, $31, $4c, $39, $95, $57));
  SD_GPT_USR_PPC64_VERITY_SIG: Tsd_id128_t = (bytes: ($0b, $88, $88, $63, $d7, $f8, $4d, $9e, $97, $66, $23, $9f, $ce, $4d, $58, $af));
  SD_GPT_USR_PPC_VERITY_SIG: Tsd_id128_t = (bytes: ($70, $07, $89, $1d, $d3, $71, $4a, $80, $86, $a4, $5c, $b8, $75, $b9, $30, $2e));
  SD_GPT_USR_RISCV32_VERITY_SIG: Tsd_id128_t = (bytes: ($c3, $83, $6a, $13, $31, $37, $45, $ba, $b5, $83, $b1, $6c, $50, $fe, $5e, $b4));
  SD_GPT_USR_RISCV64_VERITY_SIG: Tsd_id128_t = (bytes: ($d2, $f9, $00, $0a, $7a, $18, $45, $3f, $b5, $cd, $4d, $32, $f7, $7a, $7b, $32));
  SD_GPT_USR_S390_VERITY_SIG: Tsd_id128_t = (bytes: ($17, $44, $0e, $4f, $a8, $d0, $46, $7f, $a4, $6e, $39, $12, $ae, $6e, $f2, $c5));
  SD_GPT_USR_S390X_VERITY_SIG: Tsd_id128_t = (bytes: ($3f, $32, $48, $16, $66, $7b, $46, $ae, $86, $ee, $9b, $0c, $0c, $6c, $11, $b4));
  SD_GPT_USR_TILEGX_VERITY_SIG: Tsd_id128_t = (bytes: ($4e, $de, $75, $e2, $6c, $cc, $4c, $c8, $b9, $c7, $70, $33, $4b, $08, $75, $10));
  SD_GPT_USR_X86_64_VERITY_SIG: Tsd_id128_t = (bytes: ($e7, $bb, $33, $fb, $06, $cf, $4e, $81, $82, $73, $e5, $43, $b4, $13, $e2, $e2));
  SD_GPT_USR_X86_VERITY_SIG: Tsd_id128_t = (bytes: ($97, $4a, $71, $c0, $de, $41, $43, $c3, $be, $5d, $5c, $5c, $cd, $1a, $d2, $c0));

  SD_GPT_ESP: Tsd_id128_t = (bytes: ($c1, $2a, $73, $28, $f8, $1f, $11, $d2, $ba, $4b, $00, $a0, $c9, $3e, $c9, $3b));
  SD_GPT_ESP_STR = 'c12a7328-f81f-11d2-ba4b-00a0c93ec93b';
  SD_GPT_XBOOTLDR: Tsd_id128_t = (bytes: ($bc, $13, $c2, $ff, $59, $e6, $42, $62, $a3, $52, $b2, $75, $fd, $6f, $71, $72));
  SD_GPT_XBOOTLDR_STR = 'bc13c2ff-59e6-4262-a352-b275fd6f7172';
  SD_GPT_SWAP: Tsd_id128_t = (bytes: ($06, $57, $fd, $6d, $a4, $ab, $43, $c4, $84, $e5, $09, $33, $c8, $4b, $4f, $4f));
  SD_GPT_SWAP_STR = '0657fd6d-a4ab-43c4-84e5-0933c84b4f4f';
  SD_GPT_HOME: Tsd_id128_t = (bytes: ($93, $3a, $c7, $e1, $2e, $b4, $4f, $13, $b8, $44, $0e, $14, $e2, $ae, $f9, $15));
  SD_GPT_HOME_STR = '933ac7e1-2eb4-4f13-b844-0e14e2aef915';
  SD_GPT_SRV: Tsd_id128_t = (bytes: ($3b, $8f, $84, $25, $20, $e0, $4f, $3b, $90, $7f, $1a, $25, $a7, $6f, $98, $e8));
  SD_GPT_SRV_STR = '3b8f8425-20e0-4f3b-907f-1a25a76f98e8';
  SD_GPT_VAR: Tsd_id128_t = (bytes: ($4d, $21, $b0, $16, $b5, $34, $45, $c2, $a9, $fb, $5c, $16, $e0, $91, $fd, $2d));
  SD_GPT_VAR_STR = '4d21b016-b534-45c2-a9fb-5c16e091fd2d';
  SD_GPT_TMP: Tsd_id128_t = (bytes: ($7e, $c6, $f5, $57, $3b, $c5, $4a, $ca, $b2, $93, $16, $ef, $5d, $f6, $39, $d1));
  SD_GPT_TMP_STR = '7ec6f557-3bc5-4aca-b293-16ef5df639d1';
  SD_GPT_USER_HOME: Tsd_id128_t = (bytes: ($77, $3f, $91, $ef, $66, $d4, $49, $b5, $bd, $83, $d6, $83, $bf, $40, $ad, $16));
  SD_GPT_USER_HOME_STR = '773f91ef-66d4-49b5-bd83-d683bf40ad16';
  SD_GPT_LINUX_GENERIC: Tsd_id128_t = (bytes: ($0f, $c6, $3d, $af, $84, $83, $47, $72, $8e, $79, $3d, $69, $d8, $47, $7d, $e4));
  SD_GPT_LINUX_GENERIC_STR = '0fc63daf-8483-4772-8e79-3d69d8477de4';

var

  { Alpha: __alpha__ -> CPUALPHA }
  {$IFDEF CPUALPHA}
  SD_GPT_ROOT_NATIVE: Tsd_id128_t absolute SD_GPT_ROOT_ALPHA;
  SD_GPT_ROOT_NATIVE_VERITY: Tsd_id128_t absolute SD_GPT_ROOT_ALPHA_VERITY;
  SD_GPT_ROOT_NATIVE_VERITY_SIG: Tsd_id128_t absolute SD_GPT_ROOT_ALPHA_VERITY_SIG;
  SD_GPT_USR_NATIVE: Tsd_id128_t absolute SD_GPT_USR_ALPHA;
  SD_GPT_USR_NATIVE_VERITY: Tsd_id128_t absolute SD_GPT_USR_ALPHA_VERITY;
  SD_GPT_USR_NATIVE_VERITY_SIG: Tsd_id128_t absolute SD_GPT_USR_ALPHA_VERITY_SIG;
  {$ENDIF}

  { ARC: __arc__ -> CPUARC }
  {$IFDEF CPUARC}
  SD_GPT_ROOT_NATIVE: Tsd_id128_t absolute SD_GPT_ROOT_ARC;
  SD_GPT_ROOT_NATIVE_VERITY: Tsd_id128_t absolute SD_GPT_ROOT_ARC_VERITY;
  SD_GPT_ROOT_NATIVE_VERITY_SIG: Tsd_id128_t absolute SD_GPT_ROOT_ARC_VERITY_SIG;
  SD_GPT_USR_NATIVE: Tsd_id128_t absolute SD_GPT_USR_ARC;
  SD_GPT_USR_NATIVE_VERITY: Tsd_id128_t absolute SD_GPT_USR_ARC_VERITY;
  SD_GPT_USR_NATIVE_VERITY_SIG: Tsd_id128_t absolute SD_GPT_USR_ARC_VERITY_SIG;
  {$ENDIF}

  { ARM: __aarch64__ -> CPUAARCH64, __arm__ -> CPUARM }
  {$IF defined(CPUAARCH64) and defined(ENDIAN_LITTLE)}
  SD_GPT_ROOT_NATIVE: Tsd_id128_t absolute SD_GPT_ROOT_ARM64;
  SD_GPT_ROOT_SECONDARY: Tsd_id128_t absolute SD_GPT_ROOT_ARM;
  SD_GPT_ROOT_NATIVE_VERITY: Tsd_id128_t absolute SD_GPT_ROOT_ARM64_VERITY;
  SD_GPT_ROOT_SECONDARY_VERITY: Tsd_id128_t absolute SD_GPT_ROOT_ARM_VERITY;
  SD_GPT_ROOT_NATIVE_VERITY_SIG: Tsd_id128_t absolute SD_GPT_ROOT_ARM64_VERITY_SIG;
  SD_GPT_ROOT_SECONDARY_VERITY_SIG: Tsd_id128_t absolute SD_GPT_ROOT_ARM_VERITY_SIG;
  SD_GPT_USR_NATIVE: Tsd_id128_t absolute SD_GPT_USR_ARM64;
  SD_GPT_USR_SECONDARY: Tsd_id128_t absolute SD_GPT_USR_ARM;
  SD_GPT_USR_NATIVE_VERITY: Tsd_id128_t absolute SD_GPT_USR_ARM64_VERITY;
  SD_GPT_USR_SECONDARY_VERITY: Tsd_id128_t absolute SD_GPT_USR_ARM_VERITY;
  SD_GPT_USR_NATIVE_VERITY_SIG: Tsd_id128_t absolute SD_GPT_USR_ARM64_VERITY_SIG;
  SD_GPT_USR_SECONDARY_VERITY_SIG: Tsd_id128_t absolute SD_GPT_USR_ARM_VERITY_SIG;
  {$ELSEIF defined(CPUARM) and defined(ENDIAN_LITTLE)}
  SD_GPT_ROOT_NATIVE: Tsd_id128_t absolute SD_GPT_ROOT_ARM;
  SD_GPT_ROOT_NATIVE_VERITY: Tsd_id128_t absolute SD_GPT_ROOT_ARM_VERITY;
  SD_GPT_ROOT_NATIVE_VERITY_SIG: Tsd_id128_t absolute SD_GPT_ROOT_ARM_VERITY_SIG;
  SD_GPT_USR_NATIVE: Tsd_id128_t absolute SD_GPT_USR_ARM;
  SD_GPT_USR_NATIVE_VERITY: Tsd_id128_t absolute SD_GPT_USR_ARM_VERITY;
  SD_GPT_USR_NATIVE_VERITY_SIG: Tsd_id128_t absolute SD_GPT_USR_ARM_VERITY_SIG;
  {$ENDIF}

  { IA-64: __ia64__ -> CPUIA64 }
  {$IFDEF CPUIA64}
  SD_GPT_ROOT_NATIVE: Tsd_id128_t absolute SD_GPT_ROOT_IA64;
  SD_GPT_ROOT_NATIVE_VERITY: Tsd_id128_t absolute SD_GPT_ROOT_IA64_VERITY;
  SD_GPT_ROOT_NATIVE_VERITY_SIG: Tsd_id128_t absolute SD_GPT_ROOT_IA64_VERITY_SIG;
  SD_GPT_USR_NATIVE: Tsd_id128_t absolute SD_GPT_USR_IA64;
  SD_GPT_USR_NATIVE_VERITY: Tsd_id128_t absolute SD_GPT_USR_IA64_VERITY;
  SD_GPT_USR_NATIVE_VERITY_SIG: Tsd_id128_t absolute SD_GPT_USR_IA64_VERITY_SIG;
  {$ENDIF}

  { LoongArch: __loongarch_lp64 -> CPULOONGARCH64 }
  {$IFDEF CPULOONGARCH64}
  SD_GPT_ROOT_NATIVE: Tsd_id128_t absolute SD_GPT_ROOT_LOONGARCH64;
  SD_GPT_ROOT_NATIVE_VERITY: Tsd_id128_t absolute SD_GPT_ROOT_LOONGARCH64_VERITY;
  SD_GPT_ROOT_NATIVE_VERITY_SIG: Tsd_id128_t absolute SD_GPT_ROOT_LOONGARCH64_VERITY_SIG;
  SD_GPT_USR_NATIVE: Tsd_id128_t absolute SD_GPT_USR_LOONGARCH64;
  SD_GPT_USR_NATIVE_VERITY: Tsd_id128_t absolute SD_GPT_USR_LOONGARCH64_VERITY;
  SD_GPT_USR_NATIVE_VERITY_SIG: Tsd_id128_t absolute SD_GPT_USR_LOONGARCH64_VERITY_SIG;
  {$ENDIF}

  { MIPS: __mips__ -> CPUMIPS, __mips64 -> CPU64 }
  {$IF defined(CPUMIPS)}
  {$IF defined(ENDIAN_BIG)}
  {$IF defined(CPU64)}// MIPS64 Big Endian
  SD_GPT_ROOT_NATIVE: Tsd_id128_t absolute SD_GPT_ROOT_MIPS64;
  SD_GPT_ROOT_NATIVE_VERITY: Tsd_id128_t absolute SD_GPT_ROOT_MIPS64_VERITY;
  SD_GPT_ROOT_NATIVE_VERITY_SIG: Tsd_id128_t absolute SD_GPT_ROOT_MIPS64_VERITY_SIG;
  SD_GPT_USR_NATIVE: Tsd_id128_t absolute SD_GPT_USR_MIPS64;
  SD_GPT_USR_NATIVE_VERITY: Tsd_id128_t absolute SD_GPT_USR_MIPS64_VERITY;
  SD_GPT_USR_NATIVE_VERITY_SIG: Tsd_id128_t absolute SD_GPT_USR_MIPS64_VERITY_SIG;
  {$ELSE}// MIPS32 Big Endian
  SD_GPT_ROOT_NATIVE: Tsd_id128_t absolute SD_GPT_ROOT_MIPS;
  SD_GPT_ROOT_NATIVE_VERITY: Tsd_id128_t absolute SD_GPT_ROOT_MIPS_VERITY;
  SD_GPT_ROOT_NATIVE_VERITY_SIG: Tsd_id128_t absolute SD_GPT_ROOT_MIPS_VERITY_SIG;
  SD_GPT_USR_NATIVE: Tsd_id128_t absolute SD_GPT_USR_MIPS;
  SD_GPT_USR_NATIVE_VERITY: Tsd_id128_t absolute SD_GPT_USR_MIPS_VERITY;
  SD_GPT_USR_NATIVE_VERITY_SIG: Tsd_id128_t absolute SD_GPT_USR_MIPS_VERITY_SIG;
  {$ENDIF}
  {$ELSEIF defined(ENDIAN_LITTLE)}
  {$IF defined(CPU64)}// MIPS64 Little Endian
  SD_GPT_ROOT_NATIVE: Tsd_id128_t absolute SD_GPT_ROOT_MIPS64_LE;
  SD_GPT_ROOT_NATIVE_VERITY: Tsd_id128_t absolute SD_GPT_ROOT_MIPS64_LE_VERITY;
  SD_GPT_ROOT_NATIVE_VERITY_SIG: Tsd_id128_t absolute SD_GPT_ROOT_MIPS64_LE_VERITY_SIG;
  SD_GPT_USR_NATIVE: Tsd_id128_t absolute SD_GPT_USR_MIPS64_LE;
  SD_GPT_USR_NATIVE_VERITY: Tsd_id128_t absolute SD_GPT_USR_MIPS64_LE_VERITY;
  SD_GPT_USR_NATIVE_VERITY_SIG: Tsd_id128_t absolute SD_GPT_USR_MIPS64_LE_VERITY_SIG;
  {$ELSE}// MIPS32 Little Endian
  SD_GPT_ROOT_NATIVE: Tsd_id128_t absolute SD_GPT_ROOT_MIPS_LE;
  SD_GPT_ROOT_NATIVE_VERITY: Tsd_id128_t absolute SD_GPT_ROOT_MIPS_LE_VERITY;
  SD_GPT_ROOT_NATIVE_VERITY_SIG: Tsd_id128_t absolute SD_GPT_ROOT_MIPS_LE_VERITY_SIG;
  SD_GPT_USR_NATIVE: Tsd_id128_t absolute SD_GPT_USR_MIPS_LE;
  SD_GPT_USR_NATIVE_VERITY: Tsd_id128_t absolute SD_GPT_USR_MIPS_LE_VERITY;
  SD_GPT_USR_NATIVE_VERITY_SIG: Tsd_id128_t absolute SD_GPT_USR_MIPS_LE_VERITY_SIG;
  {$ENDIF}
  {$ENDIF}
  {$ENDIF}

  { PA-RISC: __parisc__ -> CPUHPPA }
  {$IFDEF CPUHPPA}
  SD_GPT_ROOT_NATIVE: Tsd_id128_t absolute SD_GPT_ROOT_PARISC;
  SD_GPT_ROOT_NATIVE_VERITY: Tsd_id128_t absolute SD_GPT_ROOT_PARISC_VERITY;
  SD_GPT_ROOT_NATIVE_VERITY_SIG: Tsd_id128_t absolute SD_GPT_ROOT_PARISC_VERITY_SIG;
  SD_GPT_USR_NATIVE: Tsd_id128_t absolute SD_GPT_USR_PARISC;
  SD_GPT_USR_NATIVE_VERITY: Tsd_id128_t absolute SD_GPT_USR_PARISC_VERITY;
  SD_GPT_USR_NATIVE_VERITY_SIG: Tsd_id128_t absolute SD_GPT_USR_PARISC_VERITY_SIG;
  {$ENDIF}

  { PowerPC: __powerpc__ -> CPUPPC32, __powerpc64__ -> CPUPPC64 }
  {$IF defined(CPUPPC64) and defined(ENDIAN_LITTLE)}
  SD_GPT_ROOT_NATIVE: Tsd_id128_t absolute SD_GPT_ROOT_PPC64_LE;
  SD_GPT_ROOT_NATIVE_VERITY: Tsd_id128_t absolute SD_GPT_ROOT_PPC64_LE_VERITY;
  SD_GPT_ROOT_NATIVE_VERITY_SIG: Tsd_id128_t absolute SD_GPT_ROOT_PPC64_LE_VERITY_SIG;
  SD_GPT_USR_NATIVE: Tsd_id128_t absolute SD_GPT_USR_PPC64_LE;
  SD_GPT_USR_NATIVE_VERITY: Tsd_id128_t absolute SD_GPT_USR_PPC64_LE_VERITY;
  SD_GPT_USR_NATIVE_VERITY_SIG: Tsd_id128_t absolute SD_GPT_USR_PPC64_LE_VERITY_SIG;
  {$ELSEIF defined(CPUPPC64) and defined(ENDIAN_BIG)}
  SD_GPT_ROOT_NATIVE: Tsd_id128_t absolute SD_GPT_ROOT_PPC64;
  SD_GPT_ROOT_NATIVE_VERITY: Tsd_id128_t absolute SD_GPT_ROOT_PPC64_VERITY;
  SD_GPT_ROOT_NATIVE_VERITY_SIG: Tsd_id128_t absolute SD_GPT_ROOT_PPC64_VERITY_SIG;
  SD_GPT_USR_NATIVE: Tsd_id128_t absolute SD_GPT_USR_PPC64;
  SD_GPT_USR_NATIVE_VERITY: Tsd_id128_t absolute SD_GPT_USR_PPC64_VERITY;
  SD_GPT_USR_NATIVE_VERITY_SIG: Tsd_id128_t absolute SD_GPT_USR_PPC64_VERITY_SIG;
  {$ELSEIF defined(CPUPPC32)}
  SD_GPT_ROOT_NATIVE: Tsd_id128_t absolute SD_GPT_ROOT_PPC;
  SD_GPT_ROOT_NATIVE_VERITY: Tsd_id128_t absolute SD_GPT_ROOT_PPC_VERITY;
  SD_GPT_ROOT_NATIVE_VERITY_SIG: Tsd_id128_t absolute SD_GPT_ROOT_PPC_VERITY_SIG;
  SD_GPT_USR_NATIVE: Tsd_id128_t absolute SD_GPT_USR_PPC;
  SD_GPT_USR_NATIVE_VERITY: Tsd_id128_t absolute SD_GPT_USR_PPC_VERITY;
  SD_GPT_USR_NATIVE_VERITY_SIG: Tsd_id128_t absolute SD_GPT_USR_PPC_VERITY_SIG;
  {$ENDIF}

  { RISC-V: __riscv, __riscv_xlen:Tsd_id128_t absolute 32 -> CPURV32; __riscv_xlen:Tsd_id128_t absolute 64 -> CPURV64 }
  {$IFDEF CPURV32}
  SD_GPT_ROOT_NATIVE: Tsd_id128_t absolute SD_GPT_ROOT_RISCV32;
  SD_GPT_ROOT_NATIVE_VERITY: Tsd_id128_t absolute SD_GPT_ROOT_RISCV32_VERITY;
  SD_GPT_ROOT_NATIVE_VERITY_SIG: Tsd_id128_t absolute SD_GPT_ROOT_RISCV32_VERITY_SIG;
  SD_GPT_USR_NATIVE: Tsd_id128_t absolute SD_GPT_USR_RISCV32;
  SD_GPT_USR_NATIVE_VERITY: Tsd_id128_t absolute SD_GPT_USR_RISCV32_VERITY;
  SD_GPT_USR_NATIVE_VERITY_SIG: Tsd_id128_t absolute SD_GPT_USR_RISCV32_VERITY_SIG;
  {$ELSEIFDEF CPURV64}
  SD_GPT_ROOT_NATIVE: Tsd_id128_t absolute SD_GPT_ROOT_RISCV64;
  SD_GPT_ROOT_NATIVE_verity: Tsd_id128_t absolute SD_GPT_ROOT_RISCV64_VERITY;
  SD_GPT_ROOT_NATIVE_VERITY_SIG: Tsd_id128_t absolute SD_GPT_ROOT_RISCV64_VERITY_SIG;
  SD_GPT_USR_NATIVE: Tsd_id128_t absolute SD_GPT_USR_RISCV64;
  SD_GPT_USR_NATIVE_VERITY: Tsd_id128_t absolute SD_GPT_USR_RISCV64_VERITY;
  SD_GPT_USR_NATIVE_VERITY_SIG: Tsd_id128_t absolute SD_GPT_USR_RISCV64_VERITY_SIG;
  {$ENDIF}

  { S390: __s390__ -> CPUS390, __s390x__ -> CPUS390X }
  {$IFDEF CPUS390X}
  SD_GPT_ROOT_NATIVE: Tsd_id128_t absolute SD_GPT_ROOT_S390X;
  SD_GPT_ROOT_NATIVE_VERITY: Tsd_id128_t absolute SD_GPT_ROOT_S390X_VERITY;
  SD_GPT_ROOT_NATIVE_VERITY_SIG: Tsd_id128_t absolute SD_GPT_ROOT_S390X_VERITY_SIG;
  SD_GPT_USR_NATIVE: Tsd_id128_t absolute SD_GPT_USR_S390X;
  SD_GPT_USR_NATIVE_VERITY: Tsd_id128_t absolute SD_GPT_USR_S390X_VERITY;
  SD_GPT_USR_NATIVE_VERITY_SIG: Tsd_id128_t absolute SD_GPT_USR_S390X_VERITY_SIG;
  {$ELSEIFDEF CPUS390}
  SD_GPT_ROOT_NATIVE: Tsd_id128_t absolute SD_GPT_ROOT_S390;
  SD_GPT_ROOT_NATIVE_VERITY: Tsd_id128_t absolute SD_GPT_ROOT_S390_VERITY;
  SD_GPT_ROOT_NATIVE_VERITY_SIG: Tsd_id128_t absolute SD_GPT_ROOT_S390_VERITY_SIG;
  SD_GPT_USR_NATIVE: Tsd_id128_t absolute SD_GPT_USR_S390;
  SD_GPT_USR_NATIVE_VERITY: Tsd_id128_t absolute SD_GPT_USR_S390_VERITY;
  SD_GPT_USR_NATIVE_VERITY_SIG: Tsd_id128_t absolute SD_GPT_USR_S390_VERITY_SIG;
  {$ENDIF}

  { TILE-Gx: __tilegx__ -> Kein FPC-Define }
  { Free Pascal unterstützt die TILE-Gx Architektur derzeit nicht mit einem spezifischen Define. }
  {$IFDEF CPUTILEGX}
  SD_GPT_ROOT_NATIVE: Tsd_id128_t absolute SD_GPT_ROOT_TILEGX;
  SD_GPT_ROOT_NATIVE_VERITY: Tsd_id128_t absolute SD_GPT_ROOT_TILEGX_VERITY;
  SD_GPT_ROOT_NATIVE_VERITY_SIG: Tsd_id128_t absolute SD_GPT_ROOT_TILEGX_VERITY_SIG;
  SD_GPT_USR_NATIVE: Tsd_id128_t absolute SD_GPT_USR_TILEGX;
  SD_GPT_USR_NATIVE_VERITY: Tsd_id128_t absolute SD_GPT_USR_TILEGX_VERITY;
  SD_GPT_USR_NATIVE_VERITY_SIG: Tsd_id128_t absolute SD_GPT_USR_TILEGX_VERITY_SIG;
  {$ENDIF}

  { x86: __x86_64__ -> CPUX86_64, __i386__ -> CPUI386 }
  {$IFDEF CPUX86_64}
  SD_GPT_ROOT_NATIVE: Tsd_id128_t absolute SD_GPT_ROOT_X86_64;
  SD_GPT_ROOT_SECONDARY: Tsd_id128_t absolute SD_GPT_ROOT_X86;
  SD_GPT_ROOT_NATIVE_VERITY: Tsd_id128_t absolute SD_GPT_ROOT_X86_64_VERITY;
  SD_GPT_ROOT_SECONDARY_VERITY: Tsd_id128_t absolute SD_GPT_ROOT_X86_VERITY;
  SD_GPT_ROOT_NATIVE_VERITY_SIG: Tsd_id128_t absolute SD_GPT_ROOT_X86_64_VERITY_SIG;
  SD_GPT_ROOT_SECONDARY_VERITY_SIG: Tsd_id128_t absolute SD_GPT_ROOT_X86_VERITY_SIG;
  SD_GPT_USR_NATIVE: Tsd_id128_t absolute SD_GPT_USR_X86_64;
  SD_GPT_USR_SECONDARY: Tsd_id128_t absolute SD_GPT_USR_X86;
  SD_GPT_USR_NATIVE_VERITY: Tsd_id128_t absolute SD_GPT_USR_X86_64_VERITY;
  SD_GPT_USR_SECONDARY_VERITY: Tsd_id128_t absolute SD_GPT_USR_X86_VERITY;
  SD_GPT_USR_NATIVE_VERITY_SIG: Tsd_id128_t absolute SD_GPT_USR_X86_64_VERITY_SIG;
  SD_GPT_USR_SECONDARY_VERITY_SIG: Tsd_id128_t absolute SD_GPT_USR_X86_VERITY_SIG;
  {$ENDIF}
  {$IFDEF CPUI386}
  SD_GPT_ROOT_NATIVE: Tsd_id128_t absolute SD_GPT_ROOT_X86;
  SD_GPT_ROOT_NATIVE_VERITY: Tsd_id128_t absolute SD_GPT_ROOT_X86_VERITY;
  SD_GPT_ROOT_NATIVE_VERITY_SIG: Tsd_id128_t absolute SD_GPT_ROOT_X86_VERITY_SIG;
  SD_GPT_USR_NATIVE: Tsd_id128_t absolute SD_GPT_USR_X86;
  SD_GPT_USR_NATIVE_VERITY: Tsd_id128_t absolute SD_GPT_USR_X86_VERITY;
  SD_GPT_USR_NATIVE_VERITY_SIG: Tsd_id128_t absolute SD_GPT_USR_X86_VERITY_SIG;
  {$ENDIF}

const
  SD_GPT_FLAG_REQUIRED_PARTITION = (uint64(1)) shl 0;
  SD_GPT_FLAG_NO_BLOCK_IO_PROTOCOL = (uint64(1)) shl 1;
  SD_GPT_FLAG_LEGACY_BIOS_BOOTABLE = (uint64(1)) shl 2;
  SD_GPT_FLAG_READ_ONLY = (uint64(1)) shl 60;
  SD_GPT_FLAG_NO_AUTO = (uint64(1)) shl 63;
  SD_GPT_FLAG_GROWFS = (uint64(1)) shl 59;


  // === Konventiert am: 16-7-25 19:04:02 ===


  {$ENDIF read_interface}


  {$IFDEF read_implementation}



  {$ENDIF read_implementation}
