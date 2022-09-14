%if ((__NASM_MAJOR__ > 2) || ((__NASM_MAJOR__ == 2) && (__NASM_MINOR__ > 14)))
  %xdefine elf_symbol_type :function
%else
  %xdefine elf_symbol_type
%endif
extern m7_ippsHMACGetSize_rmf%+elf_symbol_type
extern n8_ippsHMACGetSize_rmf%+elf_symbol_type
extern y8_ippsHMACGetSize_rmf%+elf_symbol_type
extern e9_ippsHMACGetSize_rmf%+elf_symbol_type
extern l9_ippsHMACGetSize_rmf%+elf_symbol_type
extern n0_ippsHMACGetSize_rmf%+elf_symbol_type
extern k0_ippsHMACGetSize_rmf%+elf_symbol_type
extern k1_ippsHMACGetSize_rmf%+elf_symbol_type
extern ippcpJumpIndexForMergedLibs
extern ippcpSafeInit%+elf_symbol_type


segment .data
align 8
dq  .Lin_ippsHMACGetSize_rmf
.Larraddr_ippsHMACGetSize_rmf:
    dq m7_ippsHMACGetSize_rmf
    dq n8_ippsHMACGetSize_rmf
    dq y8_ippsHMACGetSize_rmf
    dq e9_ippsHMACGetSize_rmf
    dq l9_ippsHMACGetSize_rmf
    dq n0_ippsHMACGetSize_rmf
    dq k0_ippsHMACGetSize_rmf
    dq k1_ippsHMACGetSize_rmf

segment .text
global ippsHMACGetSize_rmf:function (ippsHMACGetSize_rmf.LEndippsHMACGetSize_rmf - ippsHMACGetSize_rmf)
.Lin_ippsHMACGetSize_rmf:
    db 0xf3, 0x0f, 0x1e, 0xfa
    call ippcpSafeInit wrt ..plt
    align 16

ippsHMACGetSize_rmf:
    db 0xf3, 0x0f, 0x1e, 0xfa
    mov     rax, qword [rel ippcpJumpIndexForMergedLibs wrt ..gotpc]
    movsxd  rax, dword [rax]
    lea     r11, [rel .Larraddr_ippsHMACGetSize_rmf]
    mov     r11, qword [r11+rax*8]
    jmp     r11
.LEndippsHMACGetSize_rmf: