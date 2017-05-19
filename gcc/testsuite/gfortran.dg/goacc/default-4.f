! OpenACC default clause inside data construct.

! { dg-additional-options "-fdump-tree-gimple" } 

      SUBROUTINE F1
      IMPLICIT NONE
      INTEGER :: F1_A = 2
      REAL, DIMENSION (2) :: F1_B

!$ACC DATA COPYIN (F1_A) COPYOUT (F1_B)
! { dg-final { scan-tree-dump-times "omp target oacc_data map\\(force_to:f1_a \[^\\)\]+\\) map\\(force_from:f1_b" 1 "gimple" } }
!$ACC KERNELS
! { dg-final { scan-tree-dump-times "omp target oacc_kernels map\\(tofrom:f1_b \[^\\)\]+\\) map\\(tofrom:f1_a" 1 "gimple" } }
      F1_B(1) = F1_A;
!$ACC END KERNELS
!$ACC PARALLEL
! { dg-final { scan-tree-dump-times "omp target oacc_parallel map\\(tofrom:f1_b \[^\\)\]+\\) map\\(tofrom:f1_a" 1 "gimple" } }
      F1_B(1) = F1_A;
!$ACC END PARALLEL
!$ACC END DATA
      END SUBROUTINE F1

      SUBROUTINE F2
      IMPLICIT NONE
      INTEGER :: F2_A = 2
      REAL, DIMENSION (2) :: F2_B

!$ACC DATA COPYIN (F2_A) COPYOUT (F2_B)
! { dg-final { scan-tree-dump-times "omp target oacc_data map\\(force_to:f2_a \[^\\)\]+\\) map\\(force_from:f2_b" 1 "gimple" } }
!$ACC KERNELS DEFAULT (NONE)
! { dg-final { scan-tree-dump-times "omp target oacc_kernels default\\(none\\) map\\(tofrom:f2_b \[^\\)\]+\\) map\\(tofrom:f2_a" 1 "gimple" } }
      F2_B(1) = F2_A;
!$ACC END KERNELS
!$ACC PARALLEL DEFAULT (NONE)
! { dg-final { scan-tree-dump-times "omp target oacc_parallel default\\(none\\) map\\(tofrom:f2_b \[^\\)\]+\\) map\\(tofrom:f2_a" 1 "gimple" } }
      F2_B(1) = F2_A;
!$ACC END PARALLEL
!$ACC END DATA
      END SUBROUTINE F2
