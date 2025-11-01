//////////////////////////////////////////////
// ZicsrH.S
//
// Written jgong@g.hmc.edu 26 October 2025
//
// Purpose: Functional coverage tests for CSRs in hypervisor mode
//
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
//////////////////////////////////////////////

// General notes:
// Use csrrw/csrrs/csrrc t6, csr, rs1     when modifying a CSR to also check the old value.

#include "WALLY-init-lib.h"

main:

    # set up fast trap handler for uncompressed illegal instructions
    # because Zicsr tests will throw a lot of illegal instruction traps while attempting to access CSRs
    # This cuts the instruction count and runtime by nearly 2x
    # However, don't blindly use this handler in other privileged tests
    la t0, trap_handler_fastuncompressedillegalinstr
    csrw mtvec, t0


///////////////////////////////////////////
// M-Mode Tests
///////////////////////////////////////////

///////////////////////////////////////////
// cp_hcsr_access
///////////////////////////////////////////
cp_hcsr_access_m:

    # mtval2 
    li t0, -1
    csrw mtval2, t0       # write all 1s
    csrr t1, mtval2       # read back
    csrw mtval2, x0       # write all 0s
    csrr t1, mtval2
    csrrs t1, mtval2, t0  # set all bits
    csrrc t1, mtval2, t0  # clear all bits

    # mtinst 
    li t0, -1
    csrw mtinst, t0
    csrr t1, mtinst
    csrw mtinst, x0
    csrr t1, mtinst
    csrrs t1, mtinst, t0
    csrrc t1, mtinst, t0

    # hstatus 
    li t0, -1
    csrw hstatus, t0
    csrr t1, hstatus
    csrw hstatus, x0
    csrr t1, hstatus
    csrrs t1, hstatus, t0
    csrrc t1, hstatus, t0

    # hedeleg 
    li t0, -1
    csrw hedeleg, t0
    csrr t1, hedeleg
    csrw hedeleg, x0
    csrr t1, hedeleg
    csrrs t1, hedeleg, t0
    csrrc t1, hedeleg, t0

    # hideleg 
    li t0, -1
    csrw hideleg, t0
    csrr t1, hideleg
    csrw hideleg, x0
    csrr t1, hideleg
    csrrs t1, hideleg, t0
    csrrc t1, hideleg, t0

    # hie 
    li t0, -1
    csrw hie, t0
    csrr t1, hie
    csrw hie, x0
    csrr t1, hie
    csrrs t1, hie, t0
    csrrc t1, hie, t0

    # hcounteren 
    li t0, -1
    csrw hcounteren, t0
    csrr t1, hcounteren
    csrw hcounteren, x0
    csrr t1, hcounteren
    csrrs t1, hcounteren, t0
    csrrc t1, hcounteren, t0

    # hgeie 
    li t0, -1
    csrw hgeie, t0
    csrr t1, hgeie
    csrw hgeie, x0
    csrr t1, hgeie
    csrrs t1, hgeie, t0
    csrrc t1, hgeie, t0

    # henvcfg 
    li t0, -1
    csrw henvcfg, t0
    csrr t1, henvcfg
    csrw henvcfg, x0
    csrr t1, henvcfg
    csrrs t1, henvcfg, t0
    csrrc t1, henvcfg, t0

    # htval 
    li t0, -1
    csrw htval, t0
    csrr t1, htval
    csrw htval, x0
    csrr t1, htval
    csrrs t1, htval, t0
    csrrc t1, htval, t0

    # hip 
    li t0, -1
    csrw hip, t0
    csrr t1, hip
    csrw hip, x0
    csrr t1, hip
    csrrs t1, hip, t0
    csrrc t1, hip, t0

    # hvip 
    li t0, -1
    csrw hvip, t0
    csrr t1, hvip
    csrw hvip, x0
    csrr t1, hvip
    csrrs t1, hvip, t0
    csrrc t1, hvip, t0

    # htinst 
    li t0, -1
    csrw htinst, t0
    csrr t1, htinst
    csrw htinst, x0
    csrr t1, htinst
    csrrs t1, htinst, t0
    csrrc t1, htinst, t0

    # hgatp 
    li t0, -1
    csrw hgatp, t0
    csrr t1, hgatp
    csrw hgatp, x0
    csrr t1, hgatp
    csrrs t1, hgatp, t0
    csrrc t1, hgatp, t0

    # hgeip 
    # read ONLY
    csrr t1, hgeip

    # htimedelta 
    li t0, -1
    csrw htimedelta, t0
    csrr t1, htimedelta
    csrw htimedelta, x0
    csrr t1, htimedelta
    csrrs t1, htimedelta, t0
    csrrc t1, htimedelta, t0

    # hedelegh 
    li t0, -1
    csrw hedelegh, t0
    csrr t1, hedelegh
    csrw hedelegh, x0
    csrr t1, hedelegh
    csrrs t1, hedelegh, t0
    csrrc t1, hedelegh, t0

    # htimedeltah 
    li t0, -1
    csrw htimedeltah, t0
    csrr t1, htimedeltah
    csrw htimedeltah, x0
    csrr t1, htimedeltah
    csrrs t1, htimedeltah, t0
    csrrc t1, htimedeltah, t0

    # henvcfgh 
    li t0, -1
    csrw henvcfgh, t0
    csrr t1, henvcfgh
    csrw henvcfgh, x0
    csrr t1, henvcfgh
    csrrs t1, henvcfgh, t0
    csrrc t1, henvcfgh, t0

    # vsstatus 
    li t0, -1
    csrw vsstatus, t0
    csrr t1, vsstatus
    csrw vsstatus, x0
    csrr t1, vsstatus
    csrrs t1, vsstatus, t0
    csrrc t1, vsstatus, t0

    # vsie 
    li t0, -1
    csrw vsie, t0
    csrr t1, vsie
    csrw vsie, x0
    csrr t1, vsie
    csrrs t1, vsie, t0
    csrrc t1, vsie, t0

    # vstval 
    li t0, -1
    csrw vstval, t0
    csrr t1, vstval
    csrw vstval, x0
    csrr t1, vstval
    csrrs t1, vstval, t0
    csrrc t1, vstval, t0

    # vsip 
    li t0, -1
    csrw vsip, t0
    csrr t1, vsip
    csrw vsip, x0
    csrr t1, vsip
    csrrs t1, vsip, t0
    csrrc t1, vsip, t0

    # vstvec 
    li t0, -1
    csrw vstvec, t0
    csrr t1, vstvec
    csrw vstvec, x0
    csrr t1, vstvec
    csrrs t1, vstvec, t0
    csrrc t1, vstvec, t0

    # vsscratch 
    li t0, -1
    csrw vsscratch, t0
    csrr t1, vsscratch
    csrw vsscratch, x0
    csrr t1, vsscratch
    csrrs t1, vsscratch, t0
    csrrc t1, vsscratch, t0

    # vsepc 
    li t0, -1
    csrw vsepc, t0
    csrr t1, vsepc
    csrw vsepc, x0
    csrr t1, vsepc
    csrrs t1, vsepc, t0
    csrrc t1, vsepc, t0

    # vscause
    li t0, -1
    csrw vscause, t0
    csrr t1, vscause
    csrw vscause, x0
    csrr t1, vscause
    csrrs t1, vscause, t0
    csrrc t1, vscause, t0

    # vsatp
    li t0, -1
    csrw vsatp, t0
    csrr t1, vsatp
    csrw vsatp, x0
    csrr t1, vsatp
    csrrs t1, vsatp, t0
    csrrc t1, vsatp, t0

    # hedelegh
    li t0, -1
    csrw hedelegh, t0
    csrr t1, hedelegh
    csrw hedelegh, x0
    csrr t1, hedelegh
    csrrs t1, hedelegh, t0
    csrrc t1, hedelegh, t0

    # htimedeltah
    li t0, -1
    csrw htimedeltah, t0
    csrr t1, htimedeltah
    csrw htimedeltah, x0
    csrr t1, htimedeltah
    csrrs t1, htimedeltah, t0
    csrrc t1, htimedeltah, t0

    # henvcfgh
    li t0, -1
    csrw henvcfgh, t0
    csrr t1, henvcfgh
    csrw henvcfgh, x0
    csrr t1, henvcfgh
    csrrs t1, henvcfgh, t0
    csrrc t1, henvcfgh, t0

    # vstimecmph
    li t0, -1
    csrw vstimecmph, t0
    csrr t1, vstimecmph
    csrw vstimecmph, x0
    csrr t1, vstimecmph
    csrrs t1, vstimecmph, t0
    csrrc t1, vstimecmph, t0


//////////////////////////////
// cp_hcsrwalk
//////////////////////////////
# set and clear each bit of Machine H-Extension CSR

# mtval2
cp_hscsrwalk_mtval2_m:
    csrr t6, mtval2  # save mtval2
    li t0, 1         # 1 in LSB
    li t1, -1        # all 1s
#ifdef __riscv_xlen
    #if __riscv_xlen == 64
        li t2, 0b1111
        slli t2, t2, 60
    #elif __riscv_xlen == 32
        li t2, 0b1
        slli t2, t2, 31
    #endif
    not t2, t2
#else
    ERROR: __riscv_xlen not defined
#endif

2:
    csrrc x0, mtval2, t1    # clear all bits
    csrrs t3, mtval2, t0    # set walking 1
    slli t0, t0, 1          # shift left
    bleu t0, t2, 2b         # repeat until all bits are set
li t0, 1
3:
    csrrc x0, mtval2, t0    # clear walking 1
    slli t0, t0, 1          # walk 1
    bleu t0, t2, 3b         # repeat until all bits are set
csrrw t3, mtval2, t6        # restore mtval2

# mtinst
cp_hscsrwalk_mtinst_m:
    csrr t6, mtinst  # save mtinst
    li t0, 1         # 1 in LSB
    li t1, -1        # all 1s
#ifdef __riscv_xlen
    #if __riscv_xlen == 64
        li t2, 0b1111
        slli t2, t2, 60
    #elif __riscv_xlen == 32
        li t2, 0b1
        slli t2, t2, 31
    #endif
    not t2, t2
#else
    ERROR: __riscv_xlen not defined
#endif

2:
    csrrc x0, mtinst, t1    # clear all bits
    csrrs t3, mtinst, t0    # set walking 1
    slli t0, t0, 1          # shift left
    bleu t0, t2, 2b         # repeat until all bits are set
li t0, 1
3:
    csrrc x0, mtinst, t0    # clear walking 1
    slli t0, t0, 1          # walk 1
    bleu t0, t2, 3b         # repeat until all bits are set
csrrw t3, mtinst, t6        # restore mtinst

//////////////////////////////
// cp_replica
//////////////////////////////

# write different random values into S-mode CSRs and their VS-mode replicas

# generating random values from timer and cycle counter
cp_replica_m:
    rdcycle t0      # read cycle counter
    rdtime t1       # read time counter
    xor t0, t0, t1
    slli t0, t0, 5
    xor t0, t0, t1  # first random value
    slli t1, t0, 8
    xor t1, t1, t0  # second random value

# save csr registers
    csrr t4, sstatus
    csrr t5, vsstatus
    csrr t6, sie
    csrr t7, vsie
    csrr t8, stvec
    csrr t9, vstvec
    csrr s0, sscratch
    csrr s1, vsscratch
    csrr s2, sepc
    csrr s3, vsepc
    csrr s4, scause
    csrr s5, vscause
    csrr s6, stval
    csrr s7, vstval
    csrr s8, sip
    csrr s9, vsip
    csrr s10, satp
    csrr s11, vsatp

# writing random values

    csrw sstatus, t0
    csrw sie, t0
    csrw stvec, t0
    csrw sscratch, t0
    csrw sepc, t0
    csrw scause, t0
    csrw stval, t0
    csrw sip, t0
    csrw satp, t0

    csrw vsstatus, t1
    csrw vsie, t1
    csrw vstvec, t1
    csrw vsscratch, t1
    csrw vsepc, t1
    csrw vscause, t1
    csrw vstval, t1
    csrw vsip, t1
    csrw vsatp, t1

# reading back values
    csrr t2, sstatus
    csrr t3, sie
    csrr t4, stvec
    csrr t5, sscratch
    csrr t6, sepc
    csrr t7, scause
    csrr t8, stval
    csrr t9, sip
    csrr s0, satp

    csrr t2, vsstatus
    csrr t3, vsie
    csrr t4, vstvec
    csrr t5, vsscratch
    csrr t6, vsepc
    csrr t7, vscause
    csrr t8, vstval
    csrr t9, vsip
    csrr s0, vsatp

//////////////////////////////
// cp_mtvala
//////////////////////////////

cp_mtvala_m:
# writing 1s to mtval
    li t0, -1
    csrw mtval, t0
    csrr t1, mtval 


///////////////////////////////////////////
// HS-Mode Tests
///////////////////////////////////////////

///////////////////////////////////////////
// cp_hcsr_access
///////////////////////////////////////////

cp_hcsr_access_hs:

# hstatus
    li t0, -1
    csrw hstatus, t0
    csrr t1, hstatus
    csrw hstatus, x0
    csrr t1, hstatus
    csrrs t1, hstatus, t0
    csrrc t1, hstatus, t0

# hedeleg
    li t0, -1
    csrw hedeleg, t0
    csrr t1, hedeleg
    csrw hedeleg, x0
    csrr t1, hedeleg
    csrrs t1, hedeleg, t0
    csrrc t1, hedeleg, t0

# hideleg
    li t0, -1
    csrw hideleg, t0
    csrr t1, hideleg
    csrw hideleg, x0
    csrr t1, hideleg
    csrrs t1, hideleg, t0
    csrrc t1, hideleg, t0

# hie
    li t0, -1
    csrw hie, t0
    csrr t1, hie
    csrw hie, x0
    csrr t1, hie
    csrrs t1, hie, t0
    csrrc t1, hie, t0

# hcounteren
    li t0, -1
    csrw hcounteren, t0
    csrr t1, hcounteren
    csrw hcounteren, x0
    csrr t1, hcounteren
    csrrs t1, hcounteren, t0
    csrrc t1, hcounteren, t0

# hgeie
    li t0, -1
    csrw hgeie, t0
    csrr t1, hgeie
    csrw hgeie, x0
    csrr t1, hgeie
    csrrs t1, hgeie, t0
    csrrc t1, hgeie, t0

# henvcfg
    li t0, -1
    csrw henvcfg, t0
    csrr t1, henvcfg
    csrw henvcfg, x0
    csrr t1, henvcfg
    csrrs t1, henvcfg, t0
    csrrc t1, henvcfg, t0

# htval
    li t0, -1
    csrw htval, t0
    csrr t1, htval
    csrw htval, x0
    csrr t1, htval
    csrrs t1, htval, t0
    csrrc t1, htval, t0

# hip
    li t0, -1
    csrw hip, t0
    csrr t1, hip
    csrw hip, x0
    csrr t1, hip
    csrrs t1, hip, t0
    csrrc t1, hip, t0

# hvip
    li t0, -1
    csrw hvip, t0
    csrr t1, hvip
    csrw hvip, x0
    csrr t1, hvip
    csrrs t1, hvip, t0
    csrrc t1, hvip, t0

# htinst
    li t0, -1
    csrw htinst, t0
    csrr t1, htinst
    csrw htinst, x0
    csrr t1, htinst
    csrrs t1, htinst, t0
    csrrc t1, htinst, t0

# hgatp
    li t0, -1
    csrw hgatp, t0
    csrr t1, hgatp
    csrw hgatp, x0
    csrr t1, hgatp
    csrrs t1, hgatp, t0
    csrrc t1, hgatp, t0

# hgeip (read-only)
    csrr t1, hgeip

# htimedelta
    li t0, -1
    csrw htimedelta, t0
    csrr t1, htimedelta
    csrw htimedelta, x0
    csrr t1, htimedelta
    csrrs t1, htimedelta, t0
    csrrc t1, htimedelta, t0

# hedelegh
    li t0, -1
    csrw hedelegh, t0
    csrr t1, hedelegh
    csrw hedelegh, x0
    csrr t1, hedelegh
    csrrs t1, hedelegh, t0
    csrrc t1, hedelegh, t0

# htimedeltah
    li t0, -1
    csrw htimedeltah, t0
    csrr t1, htimedeltah
    csrw htimedeltah, x0
    csrr t1, htimedeltah
    csrrs t1, htimedeltah, t0
    csrrc t1, htimedeltah, t0

# henvcfgh
    li t0, -1
    csrw henvcfgh, t0
    csrr t1, henvcfgh
    csrw henvcfgh, x0
    csrr t1, henvcfgh
    csrrs t1, henvcfgh, t0
    csrrc t1, henvcfgh, t0

# vsstatus
    li t0, -1
    csrw vsstatus, t0
    csrr t1, vsstatus
    csrw vsstatus, x0
    csrr t1, vsstatus
    csrrs t1, vsstatus, t0
    csrrc t1, vsstatus, t0

# vsie
    li t0, -1
    csrw vsie, t0
    csrr t1, vsie
    csrw vsie, x0
    csrr t1, vsie
    csrrs t1, vsie, t0
    csrrc t1, vsie, t0


# vstval
	li t0, -1
	csrw vstval, t0
	csrr t1, vstval
	csrw vstval, x0
	csrr t1, vstval
	csrrs t1, vstval, t0
	csrrc t1, vstval, t0

# vsip
	li t0, -1
	csrw vsip, t0
	csrr t1, vsip
	csrw vsip, x0
	csrr t1, vsip
	csrrs t1, vsip, t0
	csrrc t1, vsip, t0

# vstvec
	li t0, -1
	csrw vstvec, t0
	csrr t1, vstvec
	csrw vstvec, x0
	csrr t1, vstvec
	csrrs t1, vstvec, t0
	csrrc t1, vstvec, t0

# vsscratch
	li t0, -1
	csrw vsscratch, t0
	csrr t1, vsscratch
	csrw vsscratch, x0
	csrr t1, vsscratch
	csrrs t1, vsscratch, t0
	csrrc t1, vsscratch, t0

# vsepc
	li t0, -1
	csrw vsepc, t0
	csrr t1, vsepc
	csrw vsepc, x0
	csrr t1, vsepc
	csrrs t1, vsepc, t0
	csrrc t1, vsepc, t0

# vscause
	li t0, -1
	csrw vscause, t0
	csrr t1, vscause
	csrw vscause, x0
	csrr t1, vscause
	csrrs t1, vscause, t0
	csrrc t1, vscause, t0

# vsatp
	li t0, -1
	csrw vsatp, t0
	csrr t1, vsatp
	csrw vsatp, x0
	csrr t1, vsatp
	csrrs t1, vsatp, t0
	csrrc t1, vsatp, t0

# vstimecmph
	li t0, -1
	csrw vstimecmph, t0
	csrr t1, vstimecmph
	csrw vstimecmph, x0
	csrr t1, vstimecmph
	csrrs t1, vstimecmph, t0
	csrrc t1, vstimecmph, t0

///////////////////////////////////////////
// cp_hcsrwalk
///////////////////////////////////////////

# set and clear each bit of HS/VS H-Extension, exclude hstatus and vsstatus

# hedeleg
cp_hscsrwalk_hedeleg_hs:
    csrr t6, hedeleg  # save hedeleg
    li t0, 1         # 1 in LSB
    li t1, -1        # all 1s
#ifdef __riscv_xlen
    #if __riscv_xlen == 64
        li t2, 0b1111
        slli t2, t2, 60
    #elif __riscv_xlen == 32
        li t2, 0b1
        slli t2, t2, 31
    #endif
    not t2, t2
#else
    ERROR: __riscv_xlen not defined
#endif

2:
    csrrc x0, hedeleg, t1    # clear all bits
    csrrs t3, hedeleg, t0    # set walking 1
    slli t0, t0, 1          # shift left
    bleu t0, t2, 2b         # repeat until all bits are set
li t0, 1
3:
    csrrc x0, hedeleg, t0    # clear walking 1
    slli t0, t0, 1          # walk 1
    bleu t0, t2, 3b         # repeat until all bits are set
csrrw t3, hedeleg, t6        # restore hedeleg

# hideleg
cp_hscsrwalk_hideleg_hs:
    csrr t6, hideleg  # save hideleg
    li t0, 1         # 1 in LSB
    li t1, -1        # all 1s
#ifdef __riscv_xlen
    #if __riscv_xlen == 64
        li t2, 0b1111
        slli t2, t2, 60
    #elif __riscv_xlen == 32
        li t2, 0b1
        slli t2, t2, 31
    #endif
    not t2, t2
#else
    ERROR: __riscv_xlen not defined
#endif

2:
    csrrc x0, hideleg, t1    # clear all bits
    csrrs t3, hideleg, t0    # set walking 1
    slli t0, t0, 1          # shift left
    bleu t0, t2, 2b         # repeat until all bits are set
li t0, 1
3:
    csrrc x0, hideleg, t0    # clear walking 1
    slli t0, t0, 1          # walk 1
    bleu t0, t2, 3b         # repeat until all bits are set
csrrw t3, hideleg, t6        # restore hideleg

# hie
cp_hscsrwalk_hie_hs:
    csrr t6, hie  # save hie
    li t0, 1         # 1 in LSB
    li t1, -1        # all 1s
#ifdef __riscv_xlen
    #if __riscv_xlen == 64
        li t2, 0b1111
        slli t2, t2, 60
    #elif __riscv_xlen == 32
        li t2, 0b1
        slli t2, t2, 31
    #endif
    not t2, t2
#else
    ERROR: __riscv_xlen not defined
#endif

2:
    csrrc x0, hie, t1    # clear all bits
    csrrs t3, hie, t0    # set walking 1
    slli t0, t0, 1          # shift left
    bleu t0, t2, 2b         # repeat until all bits are set
li t0, 1
3:
    csrrc x0, hie, t0    # clear walking 1
    slli t0, t0, 1          # walk 1
    bleu t0, t2, 3b         # repeat until all bits are set
csrrw t3, hie, t6        # restore hie

# hcounteren
cp_hscsrwalk_hcounteren_hs:
    csrr t6, hcounteren  # save hcounteren
    li t0, 1         # 1 in LSB
    li t1, -1        # all 1s
#ifdef __riscv_xlen
    #if __riscv_xlen == 64
        li t2, 0b1111
        slli t2, t2, 60
    #elif __riscv_xlen == 32
        li t2, 0b1
        slli t2, t2, 31
    #endif
    not t2, t2
#else
    ERROR: __riscv_xlen not defined
#endif

2:
    csrrc x0, hcounteren, t1    # clear all bits
    csrrs t3, hcounteren, t0    # set walking 1
    slli t0, t0, 1          # shift left
    bleu t0, t2, 2b         # repeat until all bits are set
li t0, 1
3:
    csrrc x0, hcounteren, t0    # clear walking 1
    slli t0, t0, 1          # walk 1
    bleu t0, t2, 3b         # repeat until all bits are set
csrrw t3, hcounteren, t6        # restore hcounteren

# hgeie
cp_hscsrwalk_hgeie_hs:
    csrr t6, hgeie  # save hgeie
    li t0, 1         # 1 in LSB
    li t1, -1        # all 1s
#ifdef __riscv_xlen
    #if __riscv_xlen == 64
        li t2, 0b1111
        slli t2, t2, 60
    #elif __riscv_xlen == 32
        li t2, 0b1
        slli t2, t2, 31
    #endif
    not t2, t2
#else
    ERROR: __riscv_xlen not defined
#endif

2:
    csrrc x0, hgeie, t1    # clear all bits
    csrrs t3, hgeie, t0    # set walking 1
    slli t0, t0, 1          # shift left
    bleu t0, t2, 2b         # repeat until all bits are set
li t0, 1
3:
    csrrc x0, hgeie, t0    # clear walking 1
    slli t0, t0, 1          # walk 1
    bleu t0, t2, 3b         # repeat until all bits are set
csrrw t3, hgeie, t6        # restore hgeie

# henvcfg
cp_hscsrwalk_henvcfg_hs:
    csrr t6, henvcfg  # save henvcfg
    li t0, 1         # 1 in LSB
    li t1, -1        # all 1s
#ifdef __riscv_xlen
    #if __riscv_xlen == 64
        li t2, 0b1111
        slli t2, t2, 60
    #elif __riscv_xlen == 32
        li t2, 0b1
        slli t2, t2, 31
    #endif
    not t2, t2
#else
    ERROR: __riscv_xlen not defined
#endif

2:
    csrrc x0, henvcfg, t1    # clear all bits
    csrrs t3, henvcfg, t0    # set walking 1
    slli t0, t0, 1          # shift left
    bleu t0, t2, 2b         # repeat until all bits are set
li t0, 1
3:
    csrrc x0, henvcfg, t0    # clear walking 1
    slli t0, t0, 1          # walk 1
    bleu t0, t2, 3b         # repeat until all bits are set
csrrw t3, henvcfg, t6        # restore henvcfg

# htval
cp_hscsrwalk_htval_hs:
    csrr t6, htval  # save htval
    li t0, 1         # 1 in LSB
    li t1, -1        # all 1s
#ifdef __riscv_xlen
    #if __riscv_xlen == 64
        li t2, 0b1111
        slli t2, t2, 60
    #elif __riscv_xlen == 32
        li t2, 0b1
        slli t2, t2, 31
    #endif
    not t2, t2
#else
    ERROR: __riscv_xlen not defined
#endif

2:
    csrrc x0, htval, t1    # clear all bits
    csrrs t3, htval, t0    # set walking 1
    slli t0, t0, 1          # shift left
    bleu t0, t2, 2b         # repeat until all bits are set
li t0, 1
3:
    csrrc x0, htval, t0    # clear walking 1
    slli t0, t0, 1          # walk 1
    bleu t0, t2, 3b         # repeat until all bits are set
csrrw t3, htval, t6        # restore htval

# hip
cp_hscsrwalk_hip_hs:
    csrr t6, hip  # save hip
    li t0, 1         # 1 in LSB
    li t1, -1        # all 1s
#ifdef __riscv_xlen
    #if __riscv_xlen == 64
        li t2, 0b1111
        slli t2, t2, 60
    #elif __riscv_xlen == 32
        li t2, 0b1
        slli t2, t2, 31
    #endif
    not t2, t2
#else
    ERROR: __riscv_xlen not defined
#endif

2:
    csrrc x0, hip, t1    # clear all bits
    csrrs t3, hip, t0    # set walking 1
    slli t0, t0, 1          # shift left
    bleu t0, t2, 2b         # repeat until all bits are set
li t0, 1
3:
    csrrc x0, hip, t0    # clear walking 1
    slli t0, t0, 1          # walk 1
    bleu t0, t2, 3b         # repeat until all bits are set
csrrw t3, hip, t6        # restore hip

# hvip
cp_hscsrwalk_hvip_hs:
    csrr t6, hvip  # save hvip
    li t0, 1         # 1 in LSB
    li t1, -1        # all 1s
#ifdef __riscv_xlen
    #if __riscv_xlen == 64
        li t2, 0b1111
        slli t2, t2, 60
    #elif __riscv_xlen == 32
        li t2, 0b1
        slli t2, t2, 31
    #endif
    not t2, t2
#else
    ERROR: __riscv_xlen not defined
#endif

2:
    csrrc x0, hvip, t1    # clear all bits
    csrrs t3, hvip, t0    # set walking 1
    slli t0, t0, 1          # shift left
    bleu t0, t2, 2b         # repeat until all bits are set
li t0, 1
3:
    csrrc x0, hvip, t0    # clear walking 1
    slli t0, t0, 1          # walk 1
    bleu t0, t2, 3b         # repeat until all bits are set
csrrw t3, hvip, t6        # restore hvip

# htinst
cp_hscsrwalk_htinst_hs:
    csrr t6, htinst  # save htinst
    li t0, 1         # 1 in LSB
    li t1, -1        # all 1s
#ifdef __riscv_xlen
    #if __riscv_xlen == 64
        li t2, 0b1111
        slli t2, t2, 60
    #elif __riscv_xlen == 32
        li t2, 0b1
        slli t2, t2, 31
    #endif
    not t2, t2
#else
    ERROR: __riscv_xlen not defined
#endif

2:
    csrrc x0, htinst, t1    # clear all bits
    csrrs t3, htinst, t0    # set walking 1
    slli t0, t0, 1          # shift left
    bleu t0, t2, 2b         # repeat until all bits are set
li t0, 1
3:
    csrrc x0, htinst, t0    # clear walking 1
    slli t0, t0, 1          # walk 1
    bleu t0, t2, 3b         # repeat until all bits are set
csrrw t3, htinst, t6        # restore htinst

# hgatp
cp_hscsrwalk_hgatp_hs:
    csrr t6, hgatp  # save hgatp
    li t0, 1         # 1 in LSB
    li t1, -1        # all 1s
#ifdef __riscv_xlen
    #if __riscv_xlen == 64
        li t2, 0b1111
        slli t2, t2, 60
    #elif __riscv_xlen == 32
        li t2, 0b1
        slli t2, t2, 31
    #endif
    not t2, t2
#else
    ERROR: __riscv_xlen not defined
#endif

2:
    csrrc x0, hgatp, t1    # clear all bits
    csrrs t3, hgatp, t0    # set walking 1
    slli t0, t0, 1          # shift left
    bleu t0, t2, 2b         # repeat until all bits are set
li t0, 1
3:
    csrrc x0, hgatp, t0    # clear walking 1
    slli t0, t0, 1          # walk 1
    bleu t0, t2, 3b         # repeat until all bits are set
csrrw t3, hgatp, t6        # restore hgatp

# hgeip
cp_hscsrwalk_hgeip_hs:
    csrr t6, hgeip  # save hgeip
    li t0, 1         # 1 in LSB
    li t1, -1        # all 1s
#ifdef __riscv_xlen
    #if __riscv_xlen == 64
        li t2, 0b1111
        slli t2, t2, 60
    #elif __riscv_xlen == 32
        li t2, 0b1
        slli t2, t2, 31
    #endif
    not t2, t2
#else
    ERROR: __riscv_xlen not defined
#endif

2:
    csrrc x0, hgeip, t1    # clear all bits
    csrrs t3, hgeip, t0    # set walking 1
    slli t0, t0, 1          # shift left
    bleu t0, t2, 2b         # repeat until all bits are set
li t0, 1
3:
    csrrc x0, hgeip, t0    # clear walking 1
    slli t0, t0, 1          # walk 1
    bleu t0, t2, 3b         # repeat until all bits are set
csrrw t3, hgeip, t6        # restore hgeip

# htimedelta
cp_hscsrwalk_htimedelta_hs:
    csrr t6, htimedelta  # save htimedelta
    li t0, 1         # 1 in LSB
    li t1, -1        # all 1s
#ifdef __riscv_xlen
    #if __riscv_xlen == 64
        li t2, 0b1111
        slli t2, t2, 60
    #elif __riscv_xlen == 32
        li t2, 0b1
        slli t2, t2, 31
    #endif
    not t2, t2
#else
    ERROR: __riscv_xlen not defined
#endif

2:
    csrrc x0, htimedelta, t1    # clear all bits
    csrrs t3, htimedelta, t0    # set walking 1
    slli t0, t0, 1          # shift left
    bleu t0, t2, 2b         # repeat until all bits are set
li t0, 1
3:
    csrrc x0, htimedelta, t0    # clear walking 1
    slli t0, t0, 1          # walk 1
    bleu t0, t2, 3b         # repeat until all bits are set
csrrw t3, htimedelta, t6        # restore htimedelta

# hedelegh
cp_hscsrwalk_hedelegh_hs:
    csrr t6, hedelegh  # save hedelegh
    li t0, 1         # 1 in LSB
    li t1, -1        # all 1s
#ifdef __riscv_xlen
    #if __riscv_xlen == 64
        li t2, 0b1111
        slli t2, t2, 60
    #elif __riscv_xlen == 32
        li t2, 0b1
        slli t2, t2, 31
    #endif
    not t2, t2
#else
    ERROR: __riscv_xlen not defined
#endif

2:
    csrrc x0, hedelegh, t1    # clear all bits
    csrrs t3, hedelegh, t0    # set walking 1
    slli t0, t0, 1          # shift left
    bleu t0, t2, 2b         # repeat until all bits are set
li t0, 1
3:
    csrrc x0, hedelegh, t0    # clear walking 1
    slli t0, t0, 1          # walk 1
    bleu t0, t2, 3b         # repeat until all bits are set
csrrw t3, hedelegh, t6        # restore hedelegh

# htimedeltah
cp_hscsrwalk_htimedeltah_hs:
    csrr t6, htimedeltah  # save htimedeltah
    li t0, 1         # 1 in LSB
    li t1, -1        # all 1s
#ifdef __riscv_xlen
    #if __riscv_xlen == 64
        li t2, 0b1111
        slli t2, t2, 60
    #elif __riscv_xlen == 32
        li t2, 0b1
        slli t2, t2, 31
    #endif
    not t2, t2
#else
    ERROR: __riscv_xlen not defined
#endif

2:
    csrrc x0, htimedeltah, t1    # clear all bits
    csrrs t3, htimedeltah, t0    # set walking 1
    slli t0, t0, 1          # shift left
    bleu t0, t2, 2b         # repeat until all bits are set
li t0, 1
3:
    csrrc x0, htimedeltah, t0    # clear walking 1
    slli t0, t0, 1          # walk 1
    bleu t0, t2, 3b         # repeat until all bits are set
csrrw t3, htimedeltah, t6        # restore htimedeltah

# henvcfgh
cp_hscsrwalk_henvcfgh_hs:
    csrr t6, henvcfgh  # save henvcfgh
    li t0, 1         # 1 in LSB
    li t1, -1        # all 1s
#ifdef __riscv_xlen
    #if __riscv_xlen == 64
        li t2, 0b1111
        slli t2, t2, 60
    #elif __riscv_xlen == 32
        li t2, 0b1
        slli t2, t2, 31
    #endif
    not t2, t2
#else
    ERROR: __riscv_xlen not defined
#endif

2:
    csrrc x0, henvcfgh, t1    # clear all bits
    csrrs t3, henvcfgh, t0    # set walking 1
    slli t0, t0, 1          # shift left
    bleu t0, t2, 2b         # repeat until all bits are set
li t0, 1
3:
    csrrc x0, henvcfgh, t0    # clear walking 1
    slli t0, t0, 1          # walk 1
    bleu t0, t2, 3b         # repeat until all bits are set
csrrw t3, henvcfgh, t6        # restore henvcfgh


# vsie
cp_hscsrwalk_vsie_m:
	csrr t6, vsie
	li t0, 1
	li t1, -1
#ifdef __riscv_xlen
	#if __riscv_xlen == 64
		li t2, 0b1111
		slli t2, t2, 60
	#elif __riscv_xlen == 32
		li t2, 0b1
		slli t2, t2, 31
	#endif
	not t2, t2
#else
	ERROR: __riscv_xlen not defined
#endif
2:
	csrrc x0, vsie, t1
	csrrs t3, vsie, t0
	slli t0, t0, 1
	bleu t0, t2, 2b
li t0, 1
3:
	csrrc x0, vsie, t0
	slli t0, t0, 1
	bleu t0, t2, 3b
	csrrw t3, vsie, t6

# vstval
cp_hscsrwalk_vstval_m:
	csrr t6, vstval
	li t0, 1
	li t1, -1
#ifdef __riscv_xlen
	#if __riscv_xlen == 64
		li t2, 0b1111
		slli t2, t2, 60
	#elif __riscv_xlen == 32
		li t2, 0b1
		slli t2, t2, 31
	#endif
	not t2, t2
#else
	ERROR: __riscv_xlen not defined
#endif
2:
	csrrc x0, vstval, t1
	csrrs t3, vstval, t0
	slli t0, t0, 1
	bleu t0, t2, 2b
li t0, 1
3:
	csrrc x0, vstval, t0
	slli t0, t0, 1
	bleu t0, t2, 3b
	csrrw t3, vstval, t6

# vsip
cp_hscsrwalk_vsip_m:
	csrr t6, vsip
	li t0, 1
	li t1, -1
#ifdef __riscv_xlen
	#if __riscv_xlen == 64
		li t2, 0b1111
		slli t2, t2, 60
	#elif __riscv_xlen == 32
		li t2, 0b1
		slli t2, t2, 31
	#endif
	not t2, t2
#else
	ERROR: __riscv_xlen not defined
#endif
2:
	csrrc x0, vsip, t1
	csrrs t3, vsip, t0
	slli t0, t0, 1
	bleu t0, t2, 2b
li t0, 1
3:
	csrrc x0, vsip, t0
	slli t0, t0, 1
	bleu t0, t2, 3b
	csrrw t3, vsip, t6

# vstvec
cp_hscsrwalk_vstvec_m:
	csrr t6, vstvec
	li t0, 1
	li t1, -1
#ifdef __riscv_xlen
	#if __riscv_xlen == 64
		li t2, 0b1111
		slli t2, t2, 60
	#elif __riscv_xlen == 32
		li t2, 0b1
		slli t2, t2, 31
	#endif
	not t2, t2
#else
	ERROR: __riscv_xlen not defined
#endif
2:
	csrrc x0, vstvec, t1
	csrrs t3, vstvec, t0
	slli t0, t0, 1
	bleu t0, t2, 2b
li t0, 1
3:
	csrrc x0, vstvec, t0
	slli t0, t0, 1
	bleu t0, t2, 3b
	csrrw t3, vstvec, t6

# vsscratch
cp_hscsrwalk_vsscratch_m:
	csrr t6, vsscratch
	li t0, 1
	li t1, -1
#ifdef __riscv_xlen
	#if __riscv_xlen == 64
		li t2, 0b1111
		slli t2, t2, 60
	#elif __riscv_xlen == 32
		li t2, 0b1
		slli t2, t2, 31
	#endif
	not t2, t2
#else
	ERROR: __riscv_xlen not defined
#endif
2:
	csrrc x0, vsscratch, t1
	csrrs t3, vsscratch, t0
	slli t0, t0, 1
	bleu t0, t2, 2b
li t0, 1
3:
	csrrc x0, vsscratch, t0
	slli t0, t0, 1
	bleu t0, t2, 3b
	csrrw t3, vsscratch, t6

# vsepc
cp_hscsrwalk_vsepc_m:
	csrr t6, vsepc
	li t0, 1
	li t1, -1
#ifdef __riscv_xlen
	#if __riscv_xlen == 64
		li t2, 0b1111
		slli t2, t2, 60
	#elif __riscv_xlen == 32
		li t2, 0b1
		slli t2, t2, 31
	#endif
	not t2, t2
#else
	ERROR: __riscv_xlen not defined
#endif
2:
	csrrc x0, vsepc, t1
	csrrs t3, vsepc, t0
	slli t0, t0, 1
	bleu t0, t2, 2b
li t0, 1
3:
	csrrc x0, vsepc, t0
	slli t0, t0, 1
	bleu t0, t2, 3b
	csrrw t3, vsepc, t6

# vscause
cp_hscsrwalk_vscause_m:
	csrr t6, vscause
	li t0, 1
	li t1, -1
#ifdef __riscv_xlen
	#if __riscv_xlen == 64
		li t2, 0b1111
		slli t2, t2, 60
	#elif __riscv_xlen == 32
		li t2, 0b1
		slli t2, t2, 31
	#endif
	not t2, t2
#else
	ERROR: __riscv_xlen not defined
#endif
2:
	csrrc x0, vscause, t1
	csrrs t3, vscause, t0
	slli t0, t0, 1
	bleu t0, t2, 2b
li t0, 1
3:
	csrrc x0, vscause, t0
	slli t0, t0, 1
	bleu t0, t2, 3b
	csrrw t3, vscause, t6

# vsatp
cp_hscsrwalk_vsatp_m:
	csrr t6, vsatp
	li t0, 1
	li t1, -1
#ifdef __riscv_xlen
	#if __riscv_xlen == 64
		li t2, 0b1111
		slli t2, t2, 60
	#elif __riscv_xlen == 32
		li t2, 0b1
		slli t2, t2, 31
	#endif
	not t2, t2
#else
	ERROR: __riscv_xlen not defined
#endif
2:
	csrrc x0, vsatp, t1
	csrrs t3, vsatp, t0
	slli t0, t0, 1
	bleu t0, t2, 2b
li t0, 1
3:
	csrrc x0, vsatp, t0
	slli t0, t0, 1
	bleu t0, t2, 3b
	csrrw t3, vsatp, t6

# vstimecmp (SSTC)
cp_hscsrwalk_vstimecmp_m:
	csrr t6, vstimecmp
	li t0, 1
	li t1, -1
#ifdef __riscv_xlen
	#if __riscv_xlen == 64
		li t2, 0b1111
		slli t2, t2, 60
	#elif __riscv_xlen == 32
		li t2, 0b1
		slli t2, t2, 31
	#endif
	not t2, t2
#else
	ERROR: __riscv_xlen not defined
#endif
2:
	csrrc x0, vstimecmp, t1
	csrrs t3, vstimecmp, t0
	slli t0, t0, 1
	bleu t0, t2, 2b
li t0, 1
3:
	csrrc x0, vstimecmp, t0
	slli t0, t0, 1
	bleu t0, t2, 3b
	csrrw t3, vstimecmp, t6

# vstimecmph (RV32)
cp_hscsrwalk_vstimecmph_m:
	csrr t6, vstimecmph
	li t0, 1
	li t1, -1
#ifdef __riscv_xlen
	#if __riscv_xlen == 64
		li t2, 0b1111
		slli t2, t2, 60
	#elif __riscv_xlen == 32
		li t2, 0b1
		slli t2, t2, 31
	#endif
	not t2, t2
#else
	ERROR: __riscv_xlen not defined
#endif
2:
	csrrc x0, vstimecmph, t1
	csrrs t3, vstimecmph, t0
	slli t0, t0, 1
	bleu t0, t2, 2b
li t0, 1
3:
	csrrc x0, vstimecmph, t0
	slli t0, t0, 1
	bleu t0, t2, 3b
	csrrw t3, vstimecmph, t6

///////////////////////////////////////////
// cp_hcsr_inaccessible
///////////////////////////////////////////

cp_hcsr_inaccessible_hs:

# mtval2 
    li t0, -1
    csrw mtval2, t0       # write all 1s
    csrr t1, mtval2       # read back
    csrw mtval2, x0       # write all 0s
    csrr t1, mtval2
    csrrs t1, mtval2, t0  # set all bits
    csrrc t1, mtval2, t0  # clear all bits

# mtinst 
    li t0, -1
    csrw mtinst, t0
    csrr t1, mtinst
    csrw mtinst, x0
    csrr t1, mtinst
    csrrs t1, mtinst, t0
    csrrc t1, mtinst, t0

///////////////////////////////////////////
// cp_replica
///////////////////////////////////////////

cp_replica_hs:
    # sstatus and vsstatus
    # generate random values 
	rdcycle t0
	rdtime t1
	xor t0, t0, t1
	slli t0, t0, 5
	xor t0, t0, t1
	slli t1, t0, 8
	xor t1, t1, t0

    # write random values and read 
	csrw sstatus, t0
	csrw vsstatus, t1
	csrr t2, sstatus
	csrr t3, vsstatus

    # sie and vsie
	rdcycle t4
	rdtime t5
	xor t0, t4, t5
	slli t0, t0, 3
	xor t0, t0, t5
	slli t1, t0, 7
	xor t1, t1, t0

	csrw sie, t0
	csrw vsie, t1
	csrr t2, sie
	csrr t3, vsie

    # stvec and vstvec
	rdcycle t4
	rdtime t5
	xor t0, t4, t5
	slli t0, t0, 2
	xor t0, t0, t5
	slli t1, t0, 6
	xor t1, t1, t0

	csrw stvec, t0
	csrw vstvec, t1
	csrr t2, stvec
	csrr t3, vstvec

    # sscratch and vsscratch
	rdcycle t4
	rdtime t5
	xor t0, t4, t5
	slli t0, t0, 4
	xor t0, t0, t5
	slli t1, t0, 8
	xor t1, t1, t0

	csrw sscratch, t0
	csrw vsscratch, t1
	csrr t2, sscratch
	csrr t3, vsscratch

    # sepc and vsepc
	rdcycle t4
	rdtime t5
	xor t0, t4, t5
	slli t0, t0, 5
	xor t0, t0, t5
	slli t1, t0, 7
	xor t1, t1, t0

	csrw sepc, t0
	csrw vsepc, t1
	csrr t2, sepc
	csrr t3, vsepc

    # scause and vscause
	rdcycle t4
	rdtime t5
	xor t0, t4, t5
	slli t0, t0, 6
	xor t0, t0, t5
	slli t1, t0, 9
	xor t1, t1, t0

	csrw scause, t0
	csrw vscause, t1
	csrr t2, scause
	csrr t3, vscause

    # stval and vstval
	rdcycle t4
	rdtime t5
	xor t0, t4, t5
	slli t0, t0, 2
	xor t0, t0, t5
	slli t1, t0, 5
	xor t1, t1, t0

	csrw stval, t0
	csrw vstval, t1
	csrr t2, stval
	csrr t3, vstval

    # sip and vsip
	rdcycle t4
	rdtime t5
	xor t0, t4, t5
	slli t0, t0, 1
	xor t0, t0, t5
	slli t1, t0, 4
	xor t1, t1, t0

	csrw sip, t0
	csrw vsip, t1
	csrr t2, sip
	csrr t3, vsip

    # satp and vsatp
	rdcycle t4
	rdtime t5
	xor t0, t4, t5
	slli t0, t0, 3
	xor t0, t0, t5
	slli t1, t0, 6
	xor t1, t1, t0

	csrw satp, t0
	csrw vsatp, t1
	csrr t2, satp
	csrr t3, vsatp

	mret            # switch to HS-mode

	 # sstatus and vsstatus
    # generate random values 
	rdcycle t0
	rdtime t1
	xor t0, t0, t1
	slli t0, t0, 5
	xor t0, t0, t1
	slli t1, t0, 8
	xor t1, t1, t0

    # write random values and read 
	csrw sstatus, t0
	csrw vsstatus, t1
	csrr t2, sstatus
	csrr t3, vsstatus

    # sie and vsie
	rdcycle t4
	rdtime t5
	xor t0, t4, t5
	slli t0, t0, 3
	xor t0, t0, t5
	slli t1, t0, 7
	xor t1, t1, t0

	csrw sie, t0
	csrw vsie, t1
	csrr t2, sie
	csrr t3, vsie

    # stvec and vstvec
	rdcycle t4
	rdtime t5
	xor t0, t4, t5
	slli t0, t0, 2
	xor t0, t0, t5
	slli t1, t0, 6
	xor t1, t1, t0

	csrw stvec, t0
	csrw vstvec, t1
	csrr t2, stvec
	csrr t3, vstvec

    # sscratch and vsscratch
	rdcycle t4
	rdtime t5
	xor t0, t4, t5
	slli t0, t0, 4
	xor t0, t0, t5
	slli t1, t0, 8
	xor t1, t1, t0

	csrw sscratch, t0
	csrw vsscratch, t1
	csrr t2, sscratch
	csrr t3, vsscratch

    # sepc and vsepc
	rdcycle t4
	rdtime t5
	xor t0, t4, t5
	slli t0, t0, 5
	xor t0, t0, t5
	slli t1, t0, 7
	xor t1, t1, t0

	csrw sepc, t0
	csrw vsepc, t1
	csrr t2, sepc
	csrr t3, vsepc

    # scause and vscause
	rdcycle t4
	rdtime t5
	xor t0, t4, t5
	slli t0, t0, 6
	xor t0, t0, t5
	slli t1, t0, 9
	xor t1, t1, t0

	csrw scause, t0
	csrw vscause, t1
	csrr t2, scause
	csrr t3, vscause

    # stval and vstval
	rdcycle t4
	rdtime t5
	xor t0, t4, t5
	slli t0, t0, 2
	xor t0, t0, t5
	slli t1, t0, 5
	xor t1, t1, t0

	csrw stval, t0
	csrw vstval, t1
	csrr t2, stval
	csrr t3, vstval

    # sip and vsip
	rdcycle t4
	rdtime t5
	xor t0, t4, t5
	slli t0, t0, 1
	xor t0, t0, t5
	slli t1, t0, 4
	xor t1, t1, t0

	csrw sip, t0
	csrw vsip, t1
	csrr t2, sip
	csrr t3, vsip

    # satp and vsatp
	rdcycle t4
	rdtime t5
	xor t0, t4, t5
	slli t0, t0, 3
	xor t0, t0, t5
	slli t1, t0, 6
	xor t1, t1, t0

	csrw satp, t0
	csrw vsatp, t1
	csrr t2, satp
	csrr t3, vsatp

	mret            # switch back to M-mode

    # read S and VS mode CSRs
	csrr t2, sstatus
	csrr t3, vsstatus
	csrr t2, sie
	csrr t3, vsie
	csrr t2, stvec
	csrr t3, vstvec
	csrr t2, sscratch
	csrr t3, vsscratch
	csrr t2, sepc
	csrr t3, vsepc
	csrr t2, scause
	csrr t3, vscause
	csrr t2, stval
	csrr t3, vstval
	csrr t2, sip
	csrr t3, vsip
	csrr t2, satp
	csrr t3, vsatp

///////////////////////////////////////////
// cp_hstatus_vgein
///////////////////////////////////////////

#define VGEIN_SHIFT X        # starting bit position of VGEIN
#define VGEIN_MASK ((1 << GEILEN) - 1)

cp_hstatus_vgein_hs: 
	li t6, 0                # clear t6 for temporary use

# save hstatus
	csrr t7, hstatus

# define test values
	li t0, 0
	li t1, 1
	li t2, GEILEN-1
	li t3, GEILEN
	li t4, GEILEN+1
	li t5, 63               # will mask later

# mask out old VGEIN field in hstatus
	li t6, VGEIN_MASK
	slli t6, t6, VGEIN_SHIFT
	csrrc x0, hstatus, t6

# write each test value (masked to legal range)
# value 0
	li t8, 0
	slli t8, t8, VGEIN_SHIFT
	csrrs x0, hstatus, t8
	csrr t9, hstatus        # read back

# value 1
	li t8, 1
	slli t8, t8, VGEIN_SHIFT
	csrrs x0, hstatus, t8
	csrr t9, hstatus

# value GEILEN-1
	li t8, GEILEN-1
	slli t8, t8, VGEIN_SHIFT
	csrrs x0, hstatus, t8
	csrr t9, hstatus

# value GEILEN
	li t8, GEILEN
	slli t8, t8, VGEIN_SHIFT
	csrrs x0, hstatus, t8
	csrr t9, hstatus

# value GEILEN+1 -> mask to legal value
	li t8, GEILEN+1
	and t8, t8, VGEIN_MASK
	slli t8, t8, VGEIN_SHIFT
	csrrs x0, hstatus, t8
	csrr t9, hstatus

# value 63 -> mask to legal value
	li t8, 63
	and t8, t8, VGEIN_MASK
	slli t8, t8, VGEIN_SHIFT
	csrrs x0, hstatus, t8
	csrr t9, hstatus

# restore hstatus
	csrrw x0, hstatus, t7

///////////////////////////////////////////
// cp_vscause_write
///////////////////////////////////////////

#define INTERRUPT_SHIFT (__riscv_xlen - 1)
#define CODE_MASK ((1 << CODE_WIDTH) - 1)

cp_vscause_write_hs:
# save vscause
	csrr t6, vscause

# Test interrupt = 0 (exception)
	li t0, 0          # interrupt bit = 0
	li t1, 0          # code = 0
	or t0, t0, t1
	csrw vscause, t0
	csrr t2, vscause

	li t1, 1          # code = 1
	or t0, t0, t1
	csrw vscause, t0
	csrr t2, vscause

	li t1, 64         # code = 64 (max)
	and t1, t1, CODE_MASK
	or t0, t0, t1
	csrw vscause, t0
	csrr t2, vscause

# Test interrupt = 1
	li t0, 1
	slli t0, t0, INTERRUPT_SHIFT  # set interrupt bit
	li t1, 0                      # code = 0
	or t0, t0, t1
	csrw vscause, t0
	csrr t2, vscause

	li t1, 1
	or t0, t0, t1
	csrw vscause, t0
	csrr t2, vscause

	li t1, 15                    # code max
	and t1, t1, CODE_MASK
	or t0, t0, t1
	csrw vscause, t0
	csrr t2, vscause

# restore original vscause
	csrrw x0, vscause, t6

///////////////////////////////////////////
// cp_tvm
///////////////////////////////////////////

#define TVM_BIT 20  # TVM bit position in mstatus

cp_tvm_hs:

# clear TVM (mstatus.TVM = 0)
	csrr t0, mstatus
	li t1, ~(1 << TVM_BIT)
	and t0, t0, t1
	csrw mstatus, t0

# write to satp
	li t0, 0x1234
	csrw satp, t0
	csrr t1, satp

# write to hgatp
	li t0, 0x5678
	csrw hgatp, t0
	csrr t1, hgatp

# set TVM (mstatus.TVM = 1)
	csrr t0, mstatus
	li t1, (1 << TVM_BIT)
	or t0, t0, t1
	csrw mstatus, t0

# access satp -> expect illegal instruction trap
	li t0, 0x1234
	csrw satp, t0
	csrr t1, satp

# access hgatp -> expect illegal instruction trap
	li t0, 0x5678
	csrw hgatp, t0
	csrr t1, hgatp

	csrw mstatus, t6
	csrw satp, t7
	csrw hgatp, t8

///////////////////////////////////////////
// VS-Mode Tests
///////////////////////////////////////////

///////////////////////////////////////////
// cp_hcsr_inaccessible
///////////////////////////////////////////

cp_hcsr_inaccessible_vs:

# mtval2 
    li t0, -1
    csrw mtval2, t0       # write all 1s
    csrr t1, mtval2       # read back
    csrw mtval2, x0       # write all 0s
    csrr t1, mtval2
    csrrs t1, mtval2, t0  # set all bits
    csrrc t1, mtval2, t0  # clear all bits

# mtinst 
    li t0, -1
    csrw mtinst, t0
    csrr t1, mtinst
    csrw mtinst, x0
    csrr t1, mtinst
    csrrs t1, mtinst, t0
    csrrc t1, mtinst, t0

///////////////////////////////////////////
// cp_hcsr_virtualinstructionfault
///////////////////////////////////////////

# csrrw, csrrc, csrrs, csrr each {HS/VS} H-Extension CSR

cp_hcsr_virtualinstructionfault_vs:

# hstatus
    li t0, -1
    csrw hstatus, t0
    csrr t1, hstatus
    csrw hstatus, x0
    csrr t1, hstatus
    csrrs t1, hstatus, t0
    csrrc t1, hstatus, t0

# hedeleg
    li t0, -1
    csrw hedeleg, t0
    csrr t1, hedeleg
    csrw hedeleg, x0
    csrr t1, hedeleg
    csrrs t1, hedeleg, t0
    csrrc t1, hedeleg, t0

# hideleg
    li t0, -1
    csrw hideleg, t0
    csrr t1, hideleg
    csrw hideleg, x0
    csrr t1, hideleg
    csrrs t1, hideleg, t0
    csrrc t1, hideleg, t0

# hie
    li t0, -1
    csrw hie, t0
    csrr t1, hie
    csrw hie, x0
    csrr t1, hie
    csrrs t1, hie, t0
    csrrc t1, hie, t0

# hcounteren
    li t0, -1
    csrw hcounteren, t0
    csrr t1, hcounteren
    csrw hcounteren, x0
    csrr t1, hcounteren
    csrrs t1, hcounteren, t0
    csrrc t1, hcounteren, t0

# hgeie
    li t0, -1
    csrw hgeie, t0
    csrr t1, hgeie
    csrw hgeie, x0
    csrr t1, hgeie
    csrrs t1, hgeie, t0
    csrrc t1, hgeie, t0

# henvcfg
    li t0, -1
    csrw henvcfg, t0
    csrr t1, henvcfg
    csrw henvcfg, x0
    csrr t1, henvcfg
    csrrs t1, henvcfg, t0
    csrrc t1, henvcfg, t0

# htval
    li t0, -1
    csrw htval, t0
    csrr t1, htval
    csrw htval, x0
    csrr t1, htval
    csrrs t1, htval, t0
    csrrc t1, htval, t0

# hip
    li t0, -1
    csrw hip, t0
    csrr t1, hip
    csrw hip, x0
    csrr t1, hip
    csrrs t1, hip, t0
    csrrc t1, hip, t0

# hvip
    li t0, -1
    csrw hvip, t0
    csrr t1, hvip
    csrw hvip, x0
    csrr t1, hvip
    csrrs t1, hvip, t0
    csrrc t1, hvip, t0

# htinst
    li t0, -1
    csrw htinst, t0
    csrr t1, htinst
    csrw htinst, x0
    csrr t1, htinst
    csrrs t1, htinst, t0
    csrrc t1, htinst, t0

# hgatp
    li t0, -1
    csrw hgatp, t0
    csrr t1, hgatp
    csrw hgatp, x0
    csrr t1, hgatp
    csrrs t1, hgatp, t0
    csrrc t1, hgatp, t0

# hgeip (read-only)
    csrr t1, hgeip

# htimedelta
    li t0, -1
    csrw htimedelta, t0
    csrr t1, htimedelta
    csrw htimedelta, x0
    csrr t1, htimedelta
    csrrs t1, htimedelta, t0
    csrrc t1, htimedelta, t0

# hedelegh
    li t0, -1
    csrw hedelegh, t0
    csrr t1, hedelegh
    csrw hedelegh, x0
    csrr t1, hedelegh
    csrrs t1, hedelegh, t0
    csrrc t1, hedelegh, t0

# htimedeltah
    li t0, -1
    csrw htimedeltah, t0
    csrr t1, htimedeltah
    csrw htimedeltah, x0
    csrr t1, htimedeltah
    csrrs t1, htimedeltah, t0
    csrrc t1, htimedeltah, t0

# henvcfgh
    li t0, -1
    csrw henvcfgh, t0
    csrr t1, henvcfgh
    csrw henvcfgh, x0
    csrr t1, henvcfgh
    csrrs t1, henvcfgh, t0
    csrrc t1, henvcfgh, t0

# vsstatus
    li t0, -1
    csrw vsstatus, t0
    csrr t1, vsstatus
    csrw vsstatus, x0
    csrr t1, vsstatus
    csrrs t1, vsstatus, t0
    csrrc t1, vsstatus, t0

# vsie
    li t0, -1
    csrw vsie, t0
    csrr t1, vsie
    csrw vsie, x0
    csrr t1, vsie
    csrrs t1, vsie, t0
    csrrc t1, vsie, t0


# vstval
	li t0, -1
	csrw vstval, t0
	csrr t1, vstval
	csrw vstval, x0
	csrr t1, vstval
	csrrs t1, vstval, t0
	csrrc t1, vstval, t0

# vsip
	li t0, -1
	csrw vsip, t0
	csrr t1, vsip
	csrw vsip, x0
	csrr t1, vsip
	csrrs t1, vsip, t0
	csrrc t1, vsip, t0

# vstvec
	li t0, -1
	csrw vstvec, t0
	csrr t1, vstvec
	csrw vstvec, x0
	csrr t1, vstvec
	csrrs t1, vstvec, t0
	csrrc t1, vstvec, t0

# vsscratch
	li t0, -1
	csrw vsscratch, t0
	csrr t1, vsscratch
	csrw vsscratch, x0
	csrr t1, vsscratch
	csrrs t1, vsscratch, t0
	csrrc t1, vsscratch, t0

# vsepc
	li t0, -1
	csrw vsepc, t0
	csrr t1, vsepc
	csrw vsepc, x0
	csrr t1, vsepc
	csrrs t1, vsepc, t0
	csrrc t1, vsepc, t0

# vscause
	li t0, -1
	csrw vscause, t0
	csrr t1, vscause
	csrw vscause, x0
	csrr t1, vscause
	csrrs t1, vscause, t0
	csrrc t1, vscause, t0

# vsatp
	li t0, -1
	csrw vsatp, t0
	csrr t1, vsatp
	csrw vsatp, x0
	csrr t1, vsatp
	csrrs t1, vsatp, t0
	csrrc t1, vsatp, t0

# vstimecmph
	li t0, -1
	csrw vstimecmph, t0
	csrr t1, vstimecmph
	csrw vstimecmph, x0
	csrr t1, vstimecmph
	csrrs t1, vstimecmph, t0
	csrrc t1, vstimecmph, t0

///////////////////////////////////////////
// cp_illegalupper
///////////////////////////////////////////

#ifdef __riscv_xlen
    #if __riscv_xlen != 64
        # error: cp_illegalupper is RV64 only
    #endif
#else
    ERROR: __riscv_xlen not defined
#endif

cp_illegalupper_vs:

# hedelegh
    li t0, -1
    csrw hedelegh, t0
    csrr t1, hedelegh
    csrw hedelegh, x0
    csrr t1, hedelegh
    csrrs t1, hedelegh, t0
    csrrc t1, hedelegh, t0

# htimedeltah
    li t0, -1
    csrw htimedeltah, t0
    csrr t1, htimedeltah
    csrw htimedeltah, x0
    csrr t1, htimedeltah
    csrrs t1, htimedeltah, t0
    csrrc t1, htimedeltah, t0

# henvcfgh
    li t0, -1
    csrw henvcfgh, t0
    csrr t1, henvcfgh
    csrw henvcfgh, x0
    csrr t1, henvcfgh
    csrrs t1, henvcfgh, t0
    csrrc t1, htimehenvcfghdeltah, t0

# vstimecmph
    li t0, -1
    csrw henvcfgh, t0
    csrr t1, henvcfgh
    csrw henvcfgh, x0
    csrr t1, henvcfgh
    csrrs t1, henvcfgh, t0
    csrrc t1, henvcfgh, t0

///////////////////////////////////////////
// cp_replica
///////////////////////////////////////////

cp_replica_vs:
    # sstatus and vsstatus
    # generate random values 
	rdcycle t0
	rdtime t1
	xor t0, t0, t1
	slli t0, t0, 5
	xor t0, t0, t1
	slli t1, t0, 8
	xor t1, t1, t0

    # write random values and read 
	csrw sstatus, t0
	csrw vsstatus, t1
	csrr t2, sstatus
	csrr t3, vsstatus

    # sie and vsie
	rdcycle t4
	rdtime t5
	xor t0, t4, t5
	slli t0, t0, 3
	xor t0, t0, t5
	slli t1, t0, 7
	xor t1, t1, t0

	csrw sie, t0
	csrw vsie, t1
	csrr t2, sie
	csrr t3, vsie

    # stvec and vstvec
	rdcycle t4
	rdtime t5
	xor t0, t4, t5
	slli t0, t0, 2
	xor t0, t0, t5
	slli t1, t0, 6
	xor t1, t1, t0

	csrw stvec, t0
	csrw vstvec, t1
	csrr t2, stvec
	csrr t3, vstvec

    # sscratch and vsscratch
	rdcycle t4
	rdtime t5
	xor t0, t4, t5
	slli t0, t0, 4
	xor t0, t0, t5
	slli t1, t0, 8
	xor t1, t1, t0

	csrw sscratch, t0
	csrw vsscratch, t1
	csrr t2, sscratch
	csrr t3, vsscratch

    # sepc and vsepc
	rdcycle t4
	rdtime t5
	xor t0, t4, t5
	slli t0, t0, 5
	xor t0, t0, t5
	slli t1, t0, 7
	xor t1, t1, t0

	csrw sepc, t0
	csrw vsepc, t1
	csrr t2, sepc
	csrr t3, vsepc

    # scause and vscause
	rdcycle t4
	rdtime t5
	xor t0, t4, t5
	slli t0, t0, 6
	xor t0, t0, t5
	slli t1, t0, 9
	xor t1, t1, t0

	csrw scause, t0
	csrw vscause, t1
	csrr t2, scause
	csrr t3, vscause

    # stval and vstval
	rdcycle t4
	rdtime t5
	xor t0, t4, t5
	slli t0, t0, 2
	xor t0, t0, t5
	slli t1, t0, 5
	xor t1, t1, t0

	csrw stval, t0
	csrw vstval, t1
	csrr t2, stval
	csrr t3, vstval

    # sip and vsip
	rdcycle t4
	rdtime t5
	xor t0, t4, t5
	slli t0, t0, 1
	xor t0, t0, t5
	slli t1, t0, 4
	xor t1, t1, t0

	csrw sip, t0
	csrw vsip, t1
	csrr t2, sip
	csrr t3, vsip

    # satp and vsatp
	rdcycle t4
	rdtime t5
	xor t0, t4, t5
	slli t0, t0, 3
	xor t0, t0, t5
	slli t1, t0, 6
	xor t1, t1, t0

	csrw satp, t0
	csrw vsatp, t1
	csrr t2, satp
	csrr t3, vsatp

	mret            # switch to VS-mode

# sstatus and vsstatus
    # generate random values 
	rdcycle t0
	rdtime t1
	xor t0, t0, t1
	slli t0, t0, 5
	xor t0, t0, t1
	slli t1, t0, 8
	xor t1, t1, t0

    # write random values and read 
	csrw sstatus, t0
	csrw vsstatus, t1
	csrr t2, sstatus
	csrr t3, vsstatus

    # sie and vsie
	rdcycle t4
	rdtime t5
	xor t0, t4, t5
	slli t0, t0, 3
	xor t0, t0, t5
	slli t1, t0, 7
	xor t1, t1, t0

	csrw sie, t0
	csrw vsie, t1
	csrr t2, sie
	csrr t3, vsie

    # stvec and vstvec
	rdcycle t4
	rdtime t5
	xor t0, t4, t5
	slli t0, t0, 2
	xor t0, t0, t5
	slli t1, t0, 6
	xor t1, t1, t0

	csrw stvec, t0
	csrw vstvec, t1
	csrr t2, stvec
	csrr t3, vstvec

    # sscratch and vsscratch
	rdcycle t4
	rdtime t5
	xor t0, t4, t5
	slli t0, t0, 4
	xor t0, t0, t5
	slli t1, t0, 8
	xor t1, t1, t0

	csrw sscratch, t0
	csrw vsscratch, t1
	csrr t2, sscratch
	csrr t3, vsscratch

    # sepc and vsepc
	rdcycle t4
	rdtime t5
	xor t0, t4, t5
	slli t0, t0, 5
	xor t0, t0, t5
	slli t1, t0, 7
	xor t1, t1, t0

	csrw sepc, t0
	csrw vsepc, t1
	csrr t2, sepc
	csrr t3, vsepc

    # scause and vscause
	rdcycle t4
	rdtime t5
	xor t0, t4, t5
	slli t0, t0, 6
	xor t0, t0, t5
	slli t1, t0, 9
	xor t1, t1, t0

	csrw scause, t0
	csrw vscause, t1
	csrr t2, scause
	csrr t3, vscause

    # stval and vstval
	rdcycle t4
	rdtime t5
	xor t0, t4, t5
	slli t0, t0, 2
	xor t0, t0, t5
	slli t1, t0, 5
	xor t1, t1, t0

	csrw stval, t0
	csrw vstval, t1
	csrr t2, stval
	csrr t3, vstval

    # sip and vsip
	rdcycle t4
	rdtime t5
	xor t0, t4, t5
	slli t0, t0, 1
	xor t0, t0, t5
	slli t1, t0, 4
	xor t1, t1, t0

	csrw sip, t0
	csrw vsip, t1
	csrr t2, sip
	csrr t3, vsip

    # satp and vsatp
	rdcycle t4
	rdtime t5
	xor t0, t4, t5
	slli t0, t0, 3
	xor t0, t0, t5
	slli t1, t0, 6
	xor t1, t1, t0

	csrw satp, t0
	csrw vsatp, t1
	csrr t2, satp
	csrr t3, vsatp

	mret            # switch back to M-mode

    # read S and VS mode CSRs
	csrr t2, sstatus
	csrr t3, vsstatus
	csrr t2, sie
	csrr t3, vsie
	csrr t2, stvec
	csrr t3, vstvec
	csrr t2, sscratch
	csrr t3, vsscratch
	csrr t2, sepc
	csrr t3, vsepc
	csrr t2, scause
	csrr t3, vscause
	csrr t2, stval
	csrr t3, vstval
	csrr t2, sip
	csrr t3, vsip
	csrr t2, satp
	csrr t3, vsatp

///////////////////////////////////////////
// cp_nonreplica
///////////////////////////////////////////

cp_nonreplica_vs:
# scounteren
	li t0, -1
	csrw scounteren, t0
	csrr t1, scounteren
	csrw scounteren, x0
	csrr t1, scounteren
	csrrs t1, scounteren, t0
	csrrc t1, scounteren, t0

# senvcfg
    li t0, -1
	csrw senvcfg, t0
	csrr t1, senvcfg
	csrw senvcfg, x0
	csrr t1, senvcfg
	csrrs t1, senvcfg, t0
	csrrc t1, senvcfg, t0

# scountinhibit
    li t0, -1
	csrw scountinhibit, t0
	csrr t1, scountinhibit
	csrw scountinhibit, x0
	csrr t1, scountinhibit
	csrrs t1, scountinhibit, t0
	csrrc t1, scountinhibit, t0

///////////////////////////////////////////
// cp_vsstatus_sd_write
///////////////////////////////////////////

# Write 1 and 0 to SD with FS/VS all 0.  Write cross-product of all bits of vsstatus. SD/ FS/ VS.
cp_vsstatus_sd_write_vs:
    csrr t6, vsstatus   # save original vsstatus
# clear FS and VS (assume FS at bits 13:12, VS at 11:10, SD at 63)
	li t0, ~(0b11 << 12)   # clear FS
	li t1, ~(0b11 << 10)   # clear VS
	and t2, t6, t0
	and t2, t2, t1
	csrw vsstatus, t2

# SD = 0
	li t0, 0
	csrw vsstatus, t0
	csrr t1, vsstatus   # read back
# SD = 1
	li t0, 1
	slli t0, t0, 63     # shift to SD bit
	csrw vsstatus, t0
	csrr t1, vsstatus   # read back

# iterate FS = 0..3, VS = 0..3, SD = 0..1
	li t2, 0             # FS
fs_loop:
	li t3, 0             # VS
	li t4, 0             # SD
vs_loop:
# assemble value
	slli t5, t2, 12      # FS shifted
	slli t6, t3, 10      # VS shifted
	slli t7, t4, 63      # SD shifted
	or t0, t5, t6
	or t0, t0, t7

	csrw vsstatus, t0
	csrr t1, vsstatus    # read back

# verify SD
# SD = 1 if FS != 0 or VS != 0
	and t8, t1, (1 << 63)
	or t9, t2, t3         # FS|VS
	bnez t9, sd_set
# FS=VS=0 -> SD should equal written value
# you could check here with your testbench
j next_sd
sd_set:
# SD should be 1
# testbench can verify t8 != 0
next_sd:
	addi t4, t4, 1
	ble t4, 1, vs_loop

	addi t3, t3, 1
	ble t3, 3, vs_loop

	addi t2, t2, 1
	ble t2, 3, fs_loop

    csrw vsstatus, t6


///////////////////////////////////////////
// cp_tvm
///////////////////////////////////////////

cp_tvm_vs:
    csrr t6, hstatus     # save hstatus
	csrr t7, mstatus     # save mstatus
	csrr t8, satp        # save satp
# clear VTVM (hstatus.VTVM = 0)
	csrr t0, hstatus
	li t1, ~(1 << VTVM_BIT)
	and t0, t0, t1
	csrw hstatus, t0

# clear TVM (mstatus.TVM = 0)
	csrr t0, mstatus
	li t1, ~(1 << TVM_BIT)
	and t0, t0, t1
	csrw mstatus, t0

# write to satp (VS-mode)
	li t0, 0x1234
	csrw satp, t0
	csrr t1, satp

# set VTVM (hstatus.VTVM = 1)
	csrr t0, hstatus
	li t1, (1 << VTVM_BIT)
	or t0, t0, t1
	csrw hstatus, t0

# write to satp → expect virtual instruction fault
	li t0, 0x5678
	csrw satp, t0
	csrr t1, satp

# read satp → expect virtual instruction fault
	csrr t1, satp

# set mstatus.TVM = 1, VTVM = 0
	csrr t0, mstatus
	li t1, (1 << TVM_BIT)
	or t0, t0, t1
	csrw mstatus, t0

# access satp 
	li t0, 0x9abc
	csrw satp, t0
	csrr t1, satp

# restore values
    csrw hstatus, t6
	csrw mstatus, t7
	csrw satp, t8

///////////////////////////////////////////
// U-Mode Tests
///////////////////////////////////////////

///////////////////////////////////////////
// cp_hcsr_inaccesible
///////////////////////////////////////////

cp_hcsr_inaccesible_u:
# mtval2 
    li t0, -1
    csrw mtval2, t0       # write all 1s
    csrr t1, mtval2       # read back
    csrw mtval2, x0       # write all 0s
    csrr t1, mtval2
    csrrs t1, mtval2, t0  # set all bits
    csrrc t1, mtval2, t0  # clear all bits

    # mtinst 
    li t0, -1
    csrw mtinst, t0
    csrr t1, mtinst
    csrw mtinst, x0
    csrr t1, mtinst
    csrrs t1, mtinst, t0
    csrrc t1, mtinst, t0

    # hstatus 
    li t0, -1
    csrw hstatus, t0
    csrr t1, hstatus
    csrw hstatus, x0
    csrr t1, hstatus
    csrrs t1, hstatus, t0
    csrrc t1, hstatus, t0

    # hedeleg 
    li t0, -1
    csrw hedeleg, t0
    csrr t1, hedeleg
    csrw hedeleg, x0
    csrr t1, hedeleg
    csrrs t1, hedeleg, t0
    csrrc t1, hedeleg, t0

    # hideleg 
    li t0, -1
    csrw hideleg, t0
    csrr t1, hideleg
    csrw hideleg, x0
    csrr t1, hideleg
    csrrs t1, hideleg, t0
    csrrc t1, hideleg, t0

    # hie 
    li t0, -1
    csrw hie, t0
    csrr t1, hie
    csrw hie, x0
    csrr t1, hie
    csrrs t1, hie, t0
    csrrc t1, hie, t0

    # hcounteren 
    li t0, -1
    csrw hcounteren, t0
    csrr t1, hcounteren
    csrw hcounteren, x0
    csrr t1, hcounteren
    csrrs t1, hcounteren, t0
    csrrc t1, hcounteren, t0

    # hgeie 
    li t0, -1
    csrw hgeie, t0
    csrr t1, hgeie
    csrw hgeie, x0
    csrr t1, hgeie
    csrrs t1, hgeie, t0
    csrrc t1, hgeie, t0

    # henvcfg 
    li t0, -1
    csrw henvcfg, t0
    csrr t1, henvcfg
    csrw henvcfg, x0
    csrr t1, henvcfg
    csrrs t1, henvcfg, t0
    csrrc t1, henvcfg, t0

    # htval 
    li t0, -1
    csrw htval, t0
    csrr t1, htval
    csrw htval, x0
    csrr t1, htval
    csrrs t1, htval, t0
    csrrc t1, htval, t0

    # hip 
    li t0, -1
    csrw hip, t0
    csrr t1, hip
    csrw hip, x0
    csrr t1, hip
    csrrs t1, hip, t0
    csrrc t1, hip, t0

    # hvip 
    li t0, -1
    csrw hvip, t0
    csrr t1, hvip
    csrw hvip, x0
    csrr t1, hvip
    csrrs t1, hvip, t0
    csrrc t1, hvip, t0

    # htinst 
    li t0, -1
    csrw htinst, t0
    csrr t1, htinst
    csrw htinst, x0
    csrr t1, htinst
    csrrs t1, htinst, t0
    csrrc t1, htinst, t0

    # hgatp 
    li t0, -1
    csrw hgatp, t0
    csrr t1, hgatp
    csrw hgatp, x0
    csrr t1, hgatp
    csrrs t1, hgatp, t0
    csrrc t1, hgatp, t0

    # hgeip 
    # read ONLY
    csrr t1, hgeip

    # htimedelta 
    li t0, -1
    csrw htimedelta, t0
    csrr t1, htimedelta
    csrw htimedelta, x0
    csrr t1, htimedelta
    csrrs t1, htimedelta, t0
    csrrc t1, htimedelta, t0

    # hedelegh 
    li t0, -1
    csrw hedelegh, t0
    csrr t1, hedelegh
    csrw hedelegh, x0
    csrr t1, hedelegh
    csrrs t1, hedelegh, t0
    csrrc t1, hedelegh, t0

    # htimedeltah 
    li t0, -1
    csrw htimedeltah, t0
    csrr t1, htimedeltah
    csrw htimedeltah, x0
    csrr t1, htimedeltah
    csrrs t1, htimedeltah, t0
    csrrc t1, htimedeltah, t0

    # henvcfgh 
    li t0, -1
    csrw henvcfgh, t0
    csrr t1, henvcfgh
    csrw henvcfgh, x0
    csrr t1, henvcfgh
    csrrs t1, henvcfgh, t0
    csrrc t1, henvcfgh, t0

    # vsstatus 
    li t0, -1
    csrw vsstatus, t0
    csrr t1, vsstatus
    csrw vsstatus, x0
    csrr t1, vsstatus
    csrrs t1, vsstatus, t0
    csrrc t1, vsstatus, t0

    # vsie 
    li t0, -1
    csrw vsie, t0
    csrr t1, vsie
    csrw vsie, x0
    csrr t1, vsie
    csrrs t1, vsie, t0
    csrrc t1, vsie, t0

    # vstval 
    li t0, -1
    csrw vstval, t0
    csrr t1, vstval
    csrw vstval, x0
    csrr t1, vstval
    csrrs t1, vstval, t0
    csrrc t1, vstval, t0

    # vsip 
    li t0, -1
    csrw vsip, t0
    csrr t1, vsip
    csrw vsip, x0
    csrr t1, vsip
    csrrs t1, vsip, t0
    csrrc t1, vsip, t0

    # vstvec 
    li t0, -1
    csrw vstvec, t0
    csrr t1, vstvec
    csrw vstvec, x0
    csrr t1, vstvec
    csrrs t1, vstvec, t0
    csrrc t1, vstvec, t0

    # vsscratch 
    li t0, -1
    csrw vsscratch, t0
    csrr t1, vsscratch
    csrw vsscratch, x0
    csrr t1, vsscratch
    csrrs t1, vsscratch, t0
    csrrc t1, vsscratch, t0

    # vsepc 
    li t0, -1
    csrw vsepc, t0
    csrr t1, vsepc
    csrw vsepc, x0
    csrr t1, vsepc
    csrrs t1, vsepc, t0
    csrrc t1, vsepc, t0

    # vscause
    li t0, -1
    csrw vscause, t0
    csrr t1, vscause
    csrw vscause, x0
    csrr t1, vscause
    csrrs t1, vscause, t0
    csrrc t1, vscause, t0

    # vsatp
    li t0, -1
    csrw vsatp, t0
    csrr t1, vsatp
    csrw vsatp, x0
    csrr t1, vsatp
    csrrs t1, vsatp, t0
    csrrc t1, vsatp, t0

    # hedelegh
    li t0, -1
    csrw hedelegh, t0
    csrr t1, hedelegh
    csrw hedelegh, x0
    csrr t1, hedelegh
    csrrs t1, hedelegh, t0
    csrrc t1, hedelegh, t0

    # htimedeltah
    li t0, -1
    csrw htimedeltah, t0
    csrr t1, htimedeltah
    csrw htimedeltah, x0
    csrr t1, htimedeltah
    csrrs t1, htimedeltah, t0
    csrrc t1, htimedeltah, t0

    # henvcfgh
    li t0, -1
    csrw henvcfgh, t0
    csrr t1, henvcfgh
    csrw henvcfgh, x0
    csrr t1, henvcfgh
    csrrs t1, henvcfgh, t0
    csrrc t1, henvcfgh, t0

    # vstimecmph
    li t0, -1
    csrw vstimecmph, t0
    csrr t1, vstimecmph
    csrw vstimecmph, x0
    csrr t1, vstimecmph
    csrrs t1, vstimecmph, t0
    csrrc t1, vstimecmph, t0


///////////////////////////////////////////
// cp_illegalupper
///////////////////////////////////////////

#ifdef __riscv_xlen
    #if __riscv_xlen != 64
        # error: cp_illegalupper is RV64 only
    #endif
#else
    ERROR: __riscv_xlen not defined
#endif

cp_illegalupper_u:

# hedelegh
    li t0, -1
    csrw hedelegh, t0
    csrr t1, hedelegh
    csrw hedelegh, x0
    csrr t1, hedelegh
    csrrs t1, hedelegh, t0
    csrrc t1, hedelegh, t0

# htimedeltah
    li t0, -1
    csrw htimedeltah, t0
    csrr t1, htimedeltah
    csrw htimedeltah, x0
    csrr t1, htimedeltah
    csrrs t1, htimedeltah, t0
    csrrc t1, htimedeltah, t0

# henvcfgh
    li t0, -1
    csrw henvcfgh, t0
    csrr t1, henvcfgh
    csrw henvcfgh, x0
    csrr t1, henvcfgh
    csrrs t1, henvcfgh, t0
    csrrc t1, htimehenvcfghdeltah, t0

# vstimecmph
    li t0, -1
    csrw henvcfgh, t0
    csrr t1, henvcfgh
    csrw henvcfgh, x0
    csrr t1, henvcfgh
    csrrs t1, henvcfgh, t0
    csrrc t1, henvcfgh, t0


///////////////////////////////////////////
// cp_scsr
///////////////////////////////////////////

cp_scsr_u:
# sstatus
    li t0, -1
    csrw sstatus, t0
    csrr t1, sstatus
    csrw sstatus, x0
    csrr t1, sstatus
    csrrs t1, sstatus, t0
    csrrc t1, sstatus, t0

# sie
    li t0, -1
    csrw sie, t0
    csrr t1, sie
    csrw sie, x0
    csrr t1, sie
    csrrs t1, sie, t0
    csrrc t1, sie, t0

# stvec
    li t0, -1
    csrw stvec, t0
    csrr t1, stvec
    csrw stvec, x0
    csrr t1, stvec
    csrrs t1, stvec, t0
    csrrc t1, stvec, t0

# sscratch
    li t0, -1
    csrw sscratch, t0
    csrr t1, sscratch
    csrw sscratch, x0
    csrr t1, sscratch
    csrrs t1, sscratch, t0
    csrrc t1, sscratch, t0

# sepc
    li t0, -1
    csrw sepc, t0
    csrr t1, sepc
    csrw sepc, x0
    csrr t1, sepc
    csrrs t1, sepc, t0
    csrrc t1, sepc, t0

# scause
    li t0, -1
    csrw scause, t0
    csrr t1, scause
    csrw scause, x0
    csrr t1, scause
    csrrs t1, scause, t0
    csrrc t1, scause, t0

# stval
    li t0, -1
    csrw stval, t0
    csrr t1, stval
    csrw stval, x0
    csrr t1, stval
    csrrs t1, stval, t0
    csrrc t1, stval, t0

# sip
    li t0, -1
    csrw sip, t0
    csrr t1, sip
    csrw sip, x0
    csrr t1, sip
    csrrs t1, sip, t0
    csrrc t1, sip, t0

# satp
    li t0, -1
    csrw satp, t0
    csrr t1, satp
    csrw satp, x0
    csrr t1, satp
    csrrs t1, satp, t0
    csrrc t1, satp, t0

# scounteren
    li t0, -1
    csrw scounteren, t0
    csrr t1, scounteren
    csrw scounteren, x0
    csrr t1, scounteren
    csrrs t1, scounteren, t0
    csrrc t1, scounteren, t0

# senvcfg
    li t0, -1
    csrw senvcfg, t0
    csrr t1, senvcfg
    csrw senvcfg, x0
    csrr t1, senvcfg
    csrrs t1, senvcfg, t0
    csrrc t1, senvcfg, t0

# scountinhibit
    li t0, -1
    csrw scountinhibit, t0
    csrr t1, scountinhibit
    csrw scountinhibit, x0
    csrr t1, scountinhibit
    csrrs t1, scountinhibit, t0
    csrrc t1, scountinhibit, t0

///////////////////////////////////////////
// VU-Mode Tests
///////////////////////////////////////////

///////////////////////////////////////////
// cp_hcsr_inaccesible
///////////////////////////////////////////

cp_hcsr_inaccesible_vu:
# mtval2 
    li t0, -1
    csrw mtval2, t0       # write all 1s
    csrr t1, mtval2       # read back
    csrw mtval2, x0       # write all 0s
    csrr t1, mtval2
    csrrs t1, mtval2, t0  # set all bits
    csrrc t1, mtval2, t0  # clear all bits

    # mtinst 
    li t0, -1
    csrw mtinst, t0
    csrr t1, mtinst
    csrw mtinst, x0
    csrr t1, mtinst
    csrrs t1, mtinst, t0
    csrrc t1, mtinst, t0

    # hstatus 
    li t0, -1
    csrw hstatus, t0
    csrr t1, hstatus
    csrw hstatus, x0
    csrr t1, hstatus
    csrrs t1, hstatus, t0
    csrrc t1, hstatus, t0

    # hedeleg 
    li t0, -1
    csrw hedeleg, t0
    csrr t1, hedeleg
    csrw hedeleg, x0
    csrr t1, hedeleg
    csrrs t1, hedeleg, t0
    csrrc t1, hedeleg, t0

    # hideleg 
    li t0, -1
    csrw hideleg, t0
    csrr t1, hideleg
    csrw hideleg, x0
    csrr t1, hideleg
    csrrs t1, hideleg, t0
    csrrc t1, hideleg, t0

    # hie 
    li t0, -1
    csrw hie, t0
    csrr t1, hie
    csrw hie, x0
    csrr t1, hie
    csrrs t1, hie, t0
    csrrc t1, hie, t0

    # hcounteren 
    li t0, -1
    csrw hcounteren, t0
    csrr t1, hcounteren
    csrw hcounteren, x0
    csrr t1, hcounteren
    csrrs t1, hcounteren, t0
    csrrc t1, hcounteren, t0

    # hgeie 
    li t0, -1
    csrw hgeie, t0
    csrr t1, hgeie
    csrw hgeie, x0
    csrr t1, hgeie
    csrrs t1, hgeie, t0
    csrrc t1, hgeie, t0

    # henvcfg 
    li t0, -1
    csrw henvcfg, t0
    csrr t1, henvcfg
    csrw henvcfg, x0
    csrr t1, henvcfg
    csrrs t1, henvcfg, t0
    csrrc t1, henvcfg, t0

    # htval 
    li t0, -1
    csrw htval, t0
    csrr t1, htval
    csrw htval, x0
    csrr t1, htval
    csrrs t1, htval, t0
    csrrc t1, htval, t0

    # hip 
    li t0, -1
    csrw hip, t0
    csrr t1, hip
    csrw hip, x0
    csrr t1, hip
    csrrs t1, hip, t0
    csrrc t1, hip, t0

    # hvip 
    li t0, -1
    csrw hvip, t0
    csrr t1, hvip
    csrw hvip, x0
    csrr t1, hvip
    csrrs t1, hvip, t0
    csrrc t1, hvip, t0

    # htinst 
    li t0, -1
    csrw htinst, t0
    csrr t1, htinst
    csrw htinst, x0
    csrr t1, htinst
    csrrs t1, htinst, t0
    csrrc t1, htinst, t0

    # hgatp 
    li t0, -1
    csrw hgatp, t0
    csrr t1, hgatp
    csrw hgatp, x0
    csrr t1, hgatp
    csrrs t1, hgatp, t0
    csrrc t1, hgatp, t0

    # hgeip 
    # read ONLY
    csrr t1, hgeip

    # htimedelta 
    li t0, -1
    csrw htimedelta, t0
    csrr t1, htimedelta
    csrw htimedelta, x0
    csrr t1, htimedelta
    csrrs t1, htimedelta, t0
    csrrc t1, htimedelta, t0

    # hedelegh 
    li t0, -1
    csrw hedelegh, t0
    csrr t1, hedelegh
    csrw hedelegh, x0
    csrr t1, hedelegh
    csrrs t1, hedelegh, t0
    csrrc t1, hedelegh, t0

    # htimedeltah 
    li t0, -1
    csrw htimedeltah, t0
    csrr t1, htimedeltah
    csrw htimedeltah, x0
    csrr t1, htimedeltah
    csrrs t1, htimedeltah, t0
    csrrc t1, htimedeltah, t0

    # henvcfgh 
    li t0, -1
    csrw henvcfgh, t0
    csrr t1, henvcfgh
    csrw henvcfgh, x0
    csrr t1, henvcfgh
    csrrs t1, henvcfgh, t0
    csrrc t1, henvcfgh, t0

    # vsstatus 
    li t0, -1
    csrw vsstatus, t0
    csrr t1, vsstatus
    csrw vsstatus, x0
    csrr t1, vsstatus
    csrrs t1, vsstatus, t0
    csrrc t1, vsstatus, t0

    # vsie 
    li t0, -1
    csrw vsie, t0
    csrr t1, vsie
    csrw vsie, x0
    csrr t1, vsie
    csrrs t1, vsie, t0
    csrrc t1, vsie, t0

    # vstval 
    li t0, -1
    csrw vstval, t0
    csrr t1, vstval
    csrw vstval, x0
    csrr t1, vstval
    csrrs t1, vstval, t0
    csrrc t1, vstval, t0

    # vsip 
    li t0, -1
    csrw vsip, t0
    csrr t1, vsip
    csrw vsip, x0
    csrr t1, vsip
    csrrs t1, vsip, t0
    csrrc t1, vsip, t0

    # vstvec 
    li t0, -1
    csrw vstvec, t0
    csrr t1, vstvec
    csrw vstvec, x0
    csrr t1, vstvec
    csrrs t1, vstvec, t0
    csrrc t1, vstvec, t0

    # vsscratch 
    li t0, -1
    csrw vsscratch, t0
    csrr t1, vsscratch
    csrw vsscratch, x0
    csrr t1, vsscratch
    csrrs t1, vsscratch, t0
    csrrc t1, vsscratch, t0

    # vsepc 
    li t0, -1
    csrw vsepc, t0
    csrr t1, vsepc
    csrw vsepc, x0
    csrr t1, vsepc
    csrrs t1, vsepc, t0
    csrrc t1, vsepc, t0

    # vscause
    li t0, -1
    csrw vscause, t0
    csrr t1, vscause
    csrw vscause, x0
    csrr t1, vscause
    csrrs t1, vscause, t0
    csrrc t1, vscause, t0

    # vsatp
    li t0, -1
    csrw vsatp, t0
    csrr t1, vsatp
    csrw vsatp, x0
    csrr t1, vsatp
    csrrs t1, vsatp, t0
    csrrc t1, vsatp, t0

    # hedelegh
    li t0, -1
    csrw hedelegh, t0
    csrr t1, hedelegh
    csrw hedelegh, x0
    csrr t1, hedelegh
    csrrs t1, hedelegh, t0
    csrrc t1, hedelegh, t0

    # htimedeltah
    li t0, -1
    csrw htimedeltah, t0
    csrr t1, htimedeltah
    csrw htimedeltah, x0
    csrr t1, htimedeltah
    csrrs t1, htimedeltah, t0
    csrrc t1, htimedeltah, t0

    # henvcfgh
    li t0, -1
    csrw henvcfgh, t0
    csrr t1, henvcfgh
    csrw henvcfgh, x0
    csrr t1, henvcfgh
    csrrs t1, henvcfgh, t0
    csrrc t1, henvcfgh, t0

    # vstimecmph
    li t0, -1
    csrw vstimecmph, t0
    csrr t1, vstimecmph
    csrw vstimecmph, x0
    csrr t1, vstimecmph
    csrrs t1, vstimecmph, t0
    csrrc t1, vstimecmph, t0

///////////////////////////////////////////
// cp_illegalupper
///////////////////////////////////////////

#ifdef __riscv_xlen
    #if __riscv_xlen != 64
        # error: cp_illegalupper is RV64 only
    #endif
#else
    ERROR: __riscv_xlen not defined
#endif

cp_illegalupper_vu:

# hedelegh
    li t0, -1
    csrw hedelegh, t0
    csrr t1, hedelegh
    csrw hedelegh, x0
    csrr t1, hedelegh
    csrrs t1, hedelegh, t0
    csrrc t1, hedelegh, t0

# htimedeltah
    li t0, -1
    csrw htimedeltah, t0
    csrr t1, htimedeltah
    csrw htimedeltah, x0
    csrr t1, htimedeltah
    csrrs t1, htimedeltah, t0
    csrrc t1, htimedeltah, t0

# henvcfgh
    li t0, -1
    csrw henvcfgh, t0
    csrr t1, henvcfgh
    csrw henvcfgh, x0
    csrr t1, henvcfgh
    csrrs t1, henvcfgh, t0
    csrrc t1, htimehenvcfghdeltah, t0

# vstimecmph
    li t0, -1
    csrw henvcfgh, t0
    csrr t1, henvcfgh
    csrw henvcfgh, x0
    csrr t1, henvcfgh
    csrrs t1, henvcfgh, t0
    csrrc t1, henvcfgh, t0

///////////////////////////////////////////
// cp_scsr
///////////////////////////////////////////

cp_scsr_vu:
# hstatus 
    li t0, -1
    csrw hstatus, t0
    csrr t1, hstatus
    csrw hstatus, x0
    csrr t1, hstatus
    csrrs t1, hstatus, t0
    csrrc t1, hstatus, t0

    # hedeleg 
    li t0, -1
    csrw hedeleg, t0
    csrr t1, hedeleg
    csrw hedeleg, x0
    csrr t1, hedeleg
    csrrs t1, hedeleg, t0
    csrrc t1, hedeleg, t0

    # hideleg 
    li t0, -1
    csrw hideleg, t0
    csrr t1, hideleg
    csrw hideleg, x0
    csrr t1, hideleg
    csrrs t1, hideleg, t0
    csrrc t1, hideleg, t0

    # hie 
    li t0, -1
    csrw hie, t0
    csrr t1, hie
    csrw hie, x0
    csrr t1, hie
    csrrs t1, hie, t0
    csrrc t1, hie, t0

    # hcounteren 
    li t0, -1
    csrw hcounteren, t0
    csrr t1, hcounteren
    csrw hcounteren, x0
    csrr t1, hcounteren
    csrrs t1, hcounteren, t0
    csrrc t1, hcounteren, t0

    # hgeie 
    li t0, -1
    csrw hgeie, t0
    csrr t1, hgeie
    csrw hgeie, x0
    csrr t1, hgeie
    csrrs t1, hgeie, t0
    csrrc t1, hgeie, t0

    # henvcfg 
    li t0, -1
    csrw henvcfg, t0
    csrr t1, henvcfg
    csrw henvcfg, x0
    csrr t1, henvcfg
    csrrs t1, henvcfg, t0
    csrrc t1, henvcfg, t0

    # htval 
    li t0, -1
    csrw htval, t0
    csrr t1, htval
    csrw htval, x0
    csrr t1, htval
    csrrs t1, htval, t0
    csrrc t1, htval, t0

    # hip 
    li t0, -1
    csrw hip, t0
    csrr t1, hip
    csrw hip, x0
    csrr t1, hip
    csrrs t1, hip, t0
    csrrc t1, hip, t0

    # hvip 
    li t0, -1
    csrw hvip, t0
    csrr t1, hvip
    csrw hvip, x0
    csrr t1, hvip
    csrrs t1, hvip, t0
    csrrc t1, hvip, t0

    # htinst 
    li t0, -1
    csrw htinst, t0
    csrr t1, htinst
    csrw htinst, x0
    csrr t1, htinst
    csrrs t1, htinst, t0
    csrrc t1, htinst, t0

    # hgatp 
    li t0, -1
    csrw hgatp, t0
    csrr t1, hgatp
    csrw hgatp, x0
    csrr t1, hgatp
    csrrs t1, hgatp, t0
    csrrc t1, hgatp, t0

    # hgeip 
    # read ONLY
    csrr t1, hgeip

    # htimedelta 
    li t0, -1
    csrw htimedelta, t0
    csrr t1, htimedelta
    csrw htimedelta, x0
    csrr t1, htimedelta
    csrrs t1, htimedelta, t0
    csrrc t1, htimedelta, t0

    # hedelegh 
    li t0, -1
    csrw hedelegh, t0
    csrr t1, hedelegh
    csrw hedelegh, x0
    csrr t1, hedelegh
    csrrs t1, hedelegh, t0
    csrrc t1, hedelegh, t0

    # htimedeltah 
    li t0, -1
    csrw htimedeltah, t0
    csrr t1, htimedeltah
    csrw htimedeltah, x0
    csrr t1, htimedeltah
    csrrs t1, htimedeltah, t0
    csrrc t1, htimedeltah, t0

    # henvcfgh 
    li t0, -1
    csrw henvcfgh, t0
    csrr t1, henvcfgh
    csrw henvcfgh, x0
    csrr t1, henvcfgh
    csrrs t1, henvcfgh, t0
    csrrc t1, henvcfgh, t0

    # vsstatus 
    li t0, -1
    csrw vsstatus, t0
    csrr t1, vsstatus
    csrw vsstatus, x0
    csrr t1, vsstatus
    csrrs t1, vsstatus, t0
    csrrc t1, vsstatus, t0

    # vsie 
    li t0, -1
    csrw vsie, t0
    csrr t1, vsie
    csrw vsie, x0
    csrr t1, vsie
    csrrs t1, vsie, t0
    csrrc t1, vsie, t0

    # vstval 
    li t0, -1
    csrw vstval, t0
    csrr t1, vstval
    csrw vstval, x0
    csrr t1, vstval
    csrrs t1, vstval, t0
    csrrc t1, vstval, t0

    # vsip 
    li t0, -1
    csrw vsip, t0
    csrr t1, vsip
    csrw vsip, x0
    csrr t1, vsip
    csrrs t1, vsip, t0
    csrrc t1, vsip, t0

    # vstvec 
    li t0, -1
    csrw vstvec, t0
    csrr t1, vstvec
    csrw vstvec, x0
    csrr t1, vstvec
    csrrs t1, vstvec, t0
    csrrc t1, vstvec, t0

    # vsscratch 
    li t0, -1
    csrw vsscratch, t0
    csrr t1, vsscratch
    csrw vsscratch, x0
    csrr t1, vsscratch
    csrrs t1, vsscratch, t0
    csrrc t1, vsscratch, t0

    # vsepc 
    li t0, -1
    csrw vsepc, t0
    csrr t1, vsepc
    csrw vsepc, x0
    csrr t1, vsepc
    csrrs t1, vsepc, t0
    csrrc t1, vsepc, t0

    # vscause
    li t0, -1
    csrw vscause, t0
    csrr t1, vscause
    csrw vscause, x0
    csrr t1, vscause
    csrrs t1, vscause, t0
    csrrc t1, vscause, t0

    # vsatp
    li t0, -1
    csrw vsatp, t0
    csrr t1, vsatp
    csrw vsatp, x0
    csrr t1, vsatp
    csrrs t1, vsatp, t0
    csrrc t1, vsatp, t0

    # hedelegh
    li t0, -1
    csrw hedelegh, t0
    csrr t1, hedelegh
    csrw hedelegh, x0
    csrr t1, hedelegh
    csrrs t1, hedelegh, t0
    csrrc t1, hedelegh, t0

    # htimedeltah
    li t0, -1
    csrw htimedeltah, t0
    csrr t1, htimedeltah
    csrw htimedeltah, x0
    csrr t1, htimedeltah
    csrrs t1, htimedeltah, t0
    csrrc t1, htimedeltah, t0

    # henvcfgh
    li t0, -1
    csrw henvcfgh, t0
    csrr t1, henvcfgh
    csrw henvcfgh, x0
    csrr t1, henvcfgh
    csrrs t1, henvcfgh, t0
    csrrc t1, henvcfgh, t0

    # vstimecmph
    li t0, -1
    csrw vstimecmph, t0
    csrr t1, vstimecmph
    csrw vstimecmph, x0
    csrr t1, vstimecmph
    csrrs t1, vstimecmph, t0
    csrrc t1, vstimecmph, t0

# sstatus
    li t0, -1
    csrw sstatus, t0
    csrr t1, sstatus
    csrw sstatus, x0
    csrr t1, sstatus
    csrrs t1, sstatus, t0
    csrrc t1, sstatus, t0

# sie
    li t0, -1
    csrw sie, t0
    csrr t1, sie
    csrw sie, x0
    csrr t1, sie
    csrrs t1, sie, t0
    csrrc t1, sie, t0

# stvec
    li t0, -1
    csrw stvec, t0
    csrr t1, stvec
    csrw stvec, x0
    csrr t1, stvec
    csrrs t1, stvec, t0
    csrrc t1, stvec, t0

# sscratch
    li t0, -1
    csrw sscratch, t0
    csrr t1, sscratch
    csrw sscratch, x0
    csrr t1, sscratch
    csrrs t1, sscratch, t0
    csrrc t1, sscratch, t0

# sepc
    li t0, -1
    csrw sepc, t0
    csrr t1, sepc
    csrw sepc, x0
    csrr t1, sepc
    csrrs t1, sepc, t0
    csrrc t1, sepc, t0

# scause
    li t0, -1
    csrw scause, t0
    csrr t1, scause
    csrw scause, x0
    csrr t1, scause
    csrrs t1, scause, t0
    csrrc t1, scause, t0

# stval
    li t0, -1
    csrw stval, t0
    csrr t1, stval
    csrw stval, x0
    csrr t1, stval
    csrrs t1, stval, t0
    csrrc t1, stval, t0

# sip
    li t0, -1
    csrw sip, t0
    csrr t1, sip
    csrw sip, x0
    csrr t1, sip
    csrrs t1, sip, t0
    csrrc t1, sip, t0

# satp
    li t0, -1
    csrw satp, t0
    csrr t1, satp
    csrw satp, x0
    csrr t1, satp
    csrrs t1, satp, t0
    csrrc t1, satp, t0

# scounteren
    li t0, -1
    csrw scounteren, t0
    csrr t1, scounteren
    csrw scounteren, x0
    csrr t1, scounteren
    csrrs t1, scounteren, t0
    csrrc t1, scounteren, t0

# senvcfg
    li t0, -1
    csrw senvcfg, t0
    csrr t1, senvcfg
    csrw senvcfg, x0
    csrr t1, senvcfg
    csrrs t1, senvcfg, t0
    csrrc t1, senvcfg, t0

# scountinhibit
    li t0, -1
    csrw scountinhibit, t0
    csrr t1, scountinhibit
    csrw scountinhibit, x0
    csrr t1, scountinhibit
    csrrs t1, scountinhibit, t0
    csrrc t1, scountinhibit, t0

