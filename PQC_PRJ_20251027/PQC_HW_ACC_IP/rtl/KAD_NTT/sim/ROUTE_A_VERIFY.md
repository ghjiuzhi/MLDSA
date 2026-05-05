# Route A Verify

## Goal

Verify `KAD_NTT_Ctrl -> top_NTT` in `PQC_PRJ_20251027` against:

1. `PQC_PRJ_20251003` hardware reference output
2. PQClean C reference output

## Testbench

Use:

- `tb_KAD_NTT_Ctrl_compare.v`

This testbench:

1. sends `1..256` into `KAD_NTT_Ctrl`
2. captures 256 output coefficients
3. writes DUT output to `dut_ntt_1027_out.txt`
4. compares against optional golden files:
   - `golden_1003_ntt_1_256.txt`
   - `golden_pqclean_ntt_1_256.txt`

## Input mode

The testbench is configured for:

- `KAD_Mode = 1'b1` : Kyber / ML-KEM path
- `Multi_Mode = 1'b1` : NTT mode

## Golden file format

Each golden file should contain exactly 256 decimal integers, one coefficient per line.

Example:

```text
123
456
789
...
```

## 1003 golden

Recommended source:

- `PQC_PRJ_20251003/PQC_HW_ACC_IP/PQC_HW_ACC_IP.srcs/sim_1/new/tb_kyber_NTT.v`

Modify that testbench to dump the 256 read-back coefficients into:

- `golden_1003_ntt_1_256.txt`

## PQClean golden

Use a clean Kyber implementation from PQClean:

- `crypto_kem/kyber512_clean`
- `crypto_kem/kyber768_clean`
- `crypto_kem/kyber1024_clean`

Pick the one whose parameter set matches your hardware.

If your hardware uses:

- modulus `q = 3329`
- degree `n = 256`
- Kyber / ML-KEM NTT

then the NTT kernel logic is Kyber-style. In practice, `kyber512_clean`, `kyber768_clean`, and `kyber1024_clean` share the same NTT core shape and differ mainly in higher-level KEM dimensions. If your hardware block is a plain 256-point Kyber NTT core, `kyber768_clean` is usually a reasonable reference only if the surrounding system also targets Kyber768; otherwise match the exact KEM variant used by your software flow.

Generate 256 NTT output coefficients for input `1..256`, then save them to:

- `golden_pqclean_ntt_1_256.txt`

## Run result

After simulation:

- DUT output: `dut_ntt_1027_out.txt`
- mismatch summary printed in transcript

## If mismatches happen

Check in this order:

1. input packing order in the testbench
2. `KAD_NTT_mem_read` bank write order
3. `top_NTT` compute result in BRAM
4. `KAD_NTT_mem_write` output packing order
