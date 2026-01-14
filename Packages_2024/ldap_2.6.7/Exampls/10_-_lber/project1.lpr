program project1;

uses
  fp_lber;

  procedure main;
  const
    input_id: Tber_int_t = 12345;
    input_name = 'OpenLDAP LBER Test';
  var
    ber_write1, ber_read1: PBerElement;
    bv_data: Pberval = nil;
    output_id: Tber_int_t;
    output_name: pchar;

  begin
    WriteLn('--- 1. Initialisierung und Kodierung ---');

    ber_write1 := ber_alloc_t(LBER_USE_DER);

    if ber_write1 = nil then begin
      WriteLn('Fehler bei ber_alloc_t');
      Exit;;
    end;

    if ber_printf(ber_write1, '{is}', input_id, input_name) = -1 then begin
      WriteLn('Fehler bei ber_printf');
      ber_free(ber_write1, 1);
      Exit;
    end;

    WriteLn('Kodiert: Integer=', input_id, ', String=', input_id, input_name);

    if ber_flatten(ber_write1, @bv_data) = -1 then begin
      WriteLn('Fehler bei ber_flatten');
      ber_free(ber_write1, 1);
      Exit;
    end;

    ber_free(ber_write1, 1);
    WriteLn('Daten erfolgreich kodiert. Größe: ', bv_data^.bv_len, ' Bytes');

    WriteLn(#10'--- 2. Dekodierung ---');

    ber_read1 := ber_init(bv_data);

    if ber_read1 = nil then begin
      WriteLn('Fehler bei ber_init');
      Exit;
    end;

    if ber_scanf(ber_read1, '{ia}', @output_id, @output_name) = LBER_ERROR then begin
      WriteLn('Fehler bei ber_scanf');
      ber_free(ber_read1, 1);
      Exit;
    end;

    WriteLn('Dekodiert: Integer=', output_id, ', String=', output_name);

    ber_memfree(output_name);
    ber_free(ber_read1, 1);
    ber_bvfree(bv_data);
  end;

begin
  main;
end.
