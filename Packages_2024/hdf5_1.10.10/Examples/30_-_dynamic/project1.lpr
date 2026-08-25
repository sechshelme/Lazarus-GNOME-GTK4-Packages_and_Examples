program project1;

uses
  fp_hdf5_serial,
  fp_hdf5_serial_hl,
  fp_hdf5_openmpi;

const
  DATEINAME = '/tmp/test.h5';
  DATASET_NAME = 'mein_array';

  procedure write_hdf5;
  var
    dims: array of Thsize_t = nil;
    data: array of uint32 = nil;
    num_dims, total_elements, i: integer;
    current_indices: array of integer = nil;
    idx: integer;
    file_id, dataspace_id, dataset_id: Thid_t;

    procedure WriteData(DimIndex: integer);
    var
      i, Stellwert: integer;
    begin
      if DimIndex = num_dims then begin
        Stellwert := 0;
        for i := 0 to num_dims - 1 do begin
          Stellwert := (Stellwert * 10) + current_indices[i];
        end;

        data[idx] := Stellwert;
        Inc(idx);
        Exit;
      end;

      for i := 1 to dims[DimIndex] do begin
        current_indices[DimIndex] := i;
        WriteData(DimIndex + 1);
      end;
    end;

  begin
    num_dims := Random(5) + 1;
    SetLength(dims, num_dims);
    SetLength(current_indices, num_dims);

    total_elements := 1;
    for i := 0 to num_dims - 1 do begin
      dims[i] := Random(3) + 1;
      total_elements := total_elements * dims[i];
    end;

    SetLength(data, total_elements);

    idx := 0;
    WriteData(0);

    file_id := H5Fcreate(DATEINAME, H5F_ACC_TRUNC, H5P_DEFAULT, H5P_DEFAULT);
    if file_id < 0 then  begin
      WriteLn('Fehler beim Erstellen der Datei!');
      Exit;
    end;

    dataspace_id := H5Screate_simple(Length(dims), @dims[0], nil);
    dataset_id := H5Dcreate2(file_id, DATASET_NAME, H5T_NATIVE_UINT32_g, dataspace_id, H5P_DEFAULT, H5P_DEFAULT, H5P_DEFAULT);

    if dataset_id >= 0 then  begin
      H5Dwrite(dataset_id, H5T_NATIVE_UINT32_g, H5S_ALL, H5S_ALL, H5P_DEFAULT, @data[0]);
      H5Dclose(dataset_id);
      WriteLn('HDF5-Datei erfolgreich erstellt: dim:', num_dims, '  ctn:', total_elements);
    end;

    H5Sclose(dataspace_id);
    H5Fclose(file_id);
  end;

  procedure read_hdf5;
  var
    dims: array of Thsize_t = nil;
    file_id, dataset_id, type_id, dataspace_id: Thid_t;
    rank: longint;
    total_elements: int64;
    raw_data: PUInt32;
    i: integer;
    idx: int64;

    procedure WriteData(DimIndex: integer);
    var
      i: integer;
    begin
      if DimIndex = rank - 1 then begin
        for i := 0 to dims[DimIndex] - 1 do begin
          Write(raw_data[idx]: 6, ' ');
          Inc(idx);
        end;
        Exit;
      end;

      for i := 0 to dims[DimIndex] - 1 do begin
        WriteData(DimIndex + 1);

        if DimIndex = rank - 2 then begin
          if i < dims[DimIndex] - 1 then begin
            Write(' | ');
          end;
        end;

        if DimIndex = rank - 3 then begin
          WriteLn;
        end;

        if (i < dims[DimIndex] - 1) then begin
          if DimIndex = rank - 4 then begin
            WriteLn(StringOfChar('-', dims[rank - 1] * 7 * dims[rank - 2] + (dims[rank - 2] - 1) * 3));
          end;

          if DimIndex = rank - 5 then begin
            WriteLn;
            WriteLn(StringOfChar('=', dims[rank - 1] * 7 * dims[rank - 2] + (dims[rank - 2] - 1) * 3));
            WriteLn;
          end;

          if DimIndex = rank - 6 then begin
            WriteLn;
            WriteLn(StringOfChar('#', dims[rank - 1] * 7 * dims[rank - 2] + (dims[rank - 2] - 1) * 3));
            WriteLn;
          end;
        end;
      end;
    end;

  begin
    file_id := H5Fopen(DATEINAME, H5F_ACC_RDONLY, H5P_DEFAULT);
    if file_id < 0 then begin
      WriteLn('Fehler beim Öffnen der Datei!');
      Exit;
    end;

    dataset_id := H5Dopen2(file_id, DATASET_NAME, H5P_DEFAULT);
    if dataset_id < 0 then begin
      WriteLn('Variable nicht gefunden! ', DATASET_NAME);
      H5Fclose(file_id);
      Exit;
    end;

    type_id := H5Dget_type(dataset_id);
    if H5Tequal(type_id, H5T_NATIVE_UINT32_g) = 0 then begin
      WriteLn('Daten sind keine UINT32-Werte!');
      H5Tclose(type_id);
      H5Dclose(dataset_id);
      H5Fclose(file_id);
      Exit;
    end;
    H5Tclose(type_id);

    dataspace_id := H5Dget_space(dataset_id);
    rank := H5Sget_simple_extent_ndims(dataspace_id);
    WriteLn(#10'Gefundene Matrix: ', rank, 'D');

    SetLength(dims, rank);
    H5Sget_simple_extent_dims(dataspace_id, @dims[0], nil);

    total_elements := 1;
    Write('Dimensionen: ');
    for i := 0 to rank - 1 do begin
      total_elements := total_elements * dims[i];
      if i > 0 then begin Write(' x '); end;
      Write(dims[i]);
    end;
    WriteLn;

    raw_data := GetMem(total_elements * SizeOf(uint32));

    if raw_data <> nil then begin
      if H5Dread(dataset_id, H5T_NATIVE_UINT32_g, H5S_ALL, H5S_ALL, H5P_DEFAULT, raw_data) >= 0 then begin
        WriteLn('Inhalt der Matrix:');
        idx := 0;

        WriteData(0);
      end;

      FreeMem(raw_data);
    end;

    H5Sclose(dataspace_id);
    H5Dclose(dataset_id);
    H5Fclose(file_id);
  end;

  procedure main;
  var
    s: string = '';
  begin
    Randomize;

    repeat
      write_hdf5;
      read_hdf5;
      ReadLn(s);
    until s = 'q';
    WriteLn(#10);
  end;

begin
  main;
end.
