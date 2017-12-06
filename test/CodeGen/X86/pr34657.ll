; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc %s -O2 -mtriple=x86_64-unknown-unknown -mattr=+avx512f,+avx512bw -o - | FileCheck %s 

define <112 x i8> @pr34657() local_unnamed_addr {
; CHECK-LABEL: pr34657
; CHECK:       # BB#0: # %entry
; CHECK-NEXT:    vmovups (%rax), %xmm0
; CHECK-NEXT:    vmovups (%rax), %ymm1
; CHECK-NEXT:    vinsertf64x4 $1, %ymm0, %zmm1, %zmm0
; CHECK-NEXT:    vmovups (%rax), %zmm2
; CHECK-NEXT:    vmovaps %ymm1, 64(%rdi)
; CHECK-NEXT:    vmovaps %zmm2, (%rdi)
; CHECK-NEXT:    vextractf32x4 $2, %zmm0, 96(%rdi)
; CHECK-NEXT:    movq %rdi, %rax
; CHECK-NEXT:    vzeroupper
; CHECK-NEXT:    retq
entry:
  %wide.vec51 = load <112 x i8>, <112 x i8>* undef, align 2
  ret <112 x i8> %wide.vec51
}
