; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -mtriple=x86_64-linux -mcpu=penryn |  FileCheck %s

define void @t0(<2 x i64>* %dst, <2 x i64> %src1, <2 x i64> %src2) nounwind readonly {
; CHECK-LABEL: t0:
; CHECK:       # BB#0:
; CHECK-NEXT:    pxor %xmm2, %xmm2
; CHECK-NEXT:    pcmpeqq %xmm2, %xmm0
; CHECK-NEXT:    pcmpeqq %xmm2, %xmm1
; CHECK-NEXT:    pcmpeqd %xmm2, %xmm2
; CHECK-NEXT:    pxor %xmm1, %xmm2
; CHECK-NEXT:    pandn %xmm2, %xmm0
; CHECK-NEXT:    movdqa %xmm0, (%rdi)
; CHECK-NEXT:    retq
  %cmp1 = icmp ne <2 x i64> %src1, zeroinitializer
  %cmp2 = icmp ne <2 x i64> %src2, zeroinitializer
  %t1 = and <2 x i1> %cmp1, %cmp2
  %t2 = sext <2 x i1> %t1 to <2 x i64>
  store <2 x i64> %t2, <2 x i64>* %dst
  ret void
}

define void @t2(<3 x i64>* %dst, <3 x i64> %src1, <3 x i64> %src2) nounwind readonly {
; CHECK-LABEL: t2:
; CHECK:       # BB#0:
; CHECK-NEXT:    movd %r9, %xmm1
; CHECK-NEXT:    movd %r8, %xmm0
; CHECK-NEXT:    punpcklqdq {{.*#+}} xmm0 = xmm0[0],xmm1[0]
; CHECK-NEXT:    movd %rdx, %xmm2
; CHECK-NEXT:    movd %rsi, %xmm1
; CHECK-NEXT:    punpcklqdq {{.*#+}} xmm1 = xmm1[0],xmm2[0]
; CHECK-NEXT:    movd %rcx, %xmm2
; CHECK-NEXT:    movq {{.*#+}} xmm3 = mem[0],zero
; CHECK-NEXT:    pxor %xmm4, %xmm4
; CHECK-NEXT:    pcmpeqq %xmm4, %xmm2
; CHECK-NEXT:    pcmpeqd %xmm5, %xmm5
; CHECK-NEXT:    pxor %xmm5, %xmm2
; CHECK-NEXT:    pcmpeqq %xmm4, %xmm1
; CHECK-NEXT:    pxor %xmm5, %xmm1
; CHECK-NEXT:    shufps {{.*#+}} xmm1 = xmm1[0,2],xmm2[0,2]
; CHECK-NEXT:    pslld $31, %xmm1
; CHECK-NEXT:    psrad $31, %xmm1
; CHECK-NEXT:    pcmpeqq %xmm4, %xmm3
; CHECK-NEXT:    pxor %xmm5, %xmm3
; CHECK-NEXT:    pcmpeqq %xmm4, %xmm0
; CHECK-NEXT:    pxor %xmm5, %xmm0
; CHECK-NEXT:    shufps {{.*#+}} xmm0 = xmm0[0,2],xmm3[0,2]
; CHECK-NEXT:    pslld $31, %xmm0
; CHECK-NEXT:    psrad $31, %xmm0
; CHECK-NEXT:    pand %xmm1, %xmm0
; CHECK-NEXT:    pmovzxdq {{.*#+}} xmm1 = xmm0[0],zero,xmm0[1],zero
; CHECK-NEXT:    psllq $63, %xmm1
; CHECK-NEXT:    psrad $31, %xmm1
; CHECK-NEXT:    pshufd {{.*#+}} xmm1 = xmm1[1,1,3,3]
; CHECK-NEXT:    pshufd {{.*#+}} xmm0 = xmm0[2,2,3,3]
; CHECK-NEXT:    psllq $63, %xmm0
; CHECK-NEXT:    psrad $31, %xmm0
; CHECK-NEXT:    pshufd {{.*#+}} xmm0 = xmm0[1,1,3,3]
; CHECK-NEXT:    movq %xmm0, 16(%rdi)
; CHECK-NEXT:    movdqa %xmm1, (%rdi)
; CHECK-NEXT:    retq
  %cmp1 = icmp ne <3 x i64> %src1, zeroinitializer
  %cmp2 = icmp ne <3 x i64> %src2, zeroinitializer
  %t1 = and <3 x i1> %cmp1, %cmp2
  %t2 = sext <3 x i1> %t1 to <3 x i64>
  store <3 x i64> %t2, <3 x i64>* %dst
  ret void
}
