# Web Review Guide: PQC_PRJ_20251027 KEM NTT Fix

This file is the entry point for web-based GPT/Claude review.

## Read First

1. `PQC_PRJ_20251027/PQC_HW_ACC_IP/README_KAD_NTT_REPRODUCE_20260506.md`
   - Full reproduction guide.
   - Explains every modification, why it was made, how it was verified, and how to rerun the Vivado simulation.

2. `PQC_PRJ_20251027/PQC_HW_ACC_IP/README_KAD_NTT_HANDOFF.md`
   - Older handoff/debug document.
   - Useful for understanding earlier investigation history, but the newer reproduce README is authoritative.

3. `simulation_artifacts/pqc1027_bank_maps/iter10_select_d2/iter10_final_summary.csv`
   - Final proof summary.
   - Expected result: all major checks are `PASS 256/256`.

## Final Claim

For `PQC_PRJ_20251027` KEM NTT:

- Input write-bank order matches `ML_KAD_NTT_vvv` KEM COE: `256/256 PASS`.
- Precompute bank contents match ML init COE: `256/256 PASS`.
- Compute-after bank contents match ML final bank snapshot: `256/256 PASS`.
- Final DUT output, compared as an unsigned mod-3329 multiset against PQClean C golden, is `256/256 PASS`.
- This proves no missing values and no duplicate values in the final 256-coefficient output, ignoring order.

## Important Boundary

The final output is proven as a multiset, not as a line-by-line sequence equal to PQClean C output.

If line-by-line PQClean order is required, the next task is to design and verify the final output permutation.

## Key Code Files

- `PQC_PRJ_20251027/PQC_HW_ACC_IP/rtl/KAD_NTT/rtl/KAD_NTT_mem_read.v`
- `PQC_PRJ_20251027/PQC_HW_ACC_IP/rtl/KAD_NTT/rtl/top_NTT.v`
- `PQC_PRJ_20251027/PQC_HW_ACC_IP/rtl/KAD_NTT/rtl/KAD_NTT_mem_write.v`
- `PQC_PRJ_20251027/PQC_HW_ACC_IP/PQC_HW_ACC_IP.srcs/sim_1/imports/sim/tb_KAD_NTT_Ctrl_compare.v`
- `ML_KAD_NTT_vvv/project_1/scr/sim/tb_top_NTT.v`

## Key Proof Artifacts

- `simulation_artifacts/pqc1027_bank_maps/iter10_select_d2/iter10_final_summary.csv`
- `simulation_artifacts/pqc1027_bank_maps/iter10_select_d2/dut_ntt_1027_out.txt`
- `simulation_artifacts/pqc1027_bank_maps/iter10_select_d2/dut_ntt_1027_compute_banks.txt`
- `simulation_artifacts/pqc1027_bank_maps/ml_kad_ntt_vvv_kem_probe_snapshot4_sync_read/ml_kem_ntt_final_bank_snapshot.csv`
- `tools/golden_pqclean_ntt_1_256.txt`

