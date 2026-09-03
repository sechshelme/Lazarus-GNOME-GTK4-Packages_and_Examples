program project1;

uses
  fp_fftw3,
  fp_fftw3_mpi;

const
  N = 64;

  procedure main;
  var
    in_, out_: Pfftw_complex;
    p: Tfftw_plan;
    i, j: integer;
    freq1: double = 5.1;
    freq2: double = 15.7;
    freq3: double = 17.5;
    mag: double;

  begin
    in_ := fftw_malloc(sizeof(Tfftw_complex) * N);
    out_ := fftw_malloc(sizeof(Tfftw_complex) * N);

    for  i := 0 to N - 1 do begin
      in_[i][0] := 0.0;
      in_[i][0] += 1.0 * sin(2.0 * PI * freq1 * i / N);
      in_[i][0] += 0.5 * sin(2.0 * PI * freq2 * i / N);
      in_[i][0] += 0.5 * sin(2.0 * PI * freq3 * i / N);
//              in_[i][1] := 5.5;
      in_[i][1] := sin(2.0 * PI * 5.5 * i / N);
    end;

    p := fftw_plan_dft_1d(N, in_, out_, FFTW_FORWARD, FFTW_ESTIMATE);
    fftw_execute(p);

    WriteLn('Frequenz | Magnitude | Grafik');
    WriteLn('---------|-----------|-------------------------------------');

    for  i := 0 to N - 1 do begin
      mag := sqrt(out_[i][0] * out_[i][0] + out_[i][1] * out_[i][1]);

      Write(i: 8, ' | ', mag: 9: 2, ' | ');
      for j := 0 to Trunc(mag) - 1 do begin
        Write('#');
      end;
      WriteLn();
    end;

    fftw_destroy_plan(p);
    fftw_free(in_);
    fftw_free(out_);
  end;

begin
  main;
end.
