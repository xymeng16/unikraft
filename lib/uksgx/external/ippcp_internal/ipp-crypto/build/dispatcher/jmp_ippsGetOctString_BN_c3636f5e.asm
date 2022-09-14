%if ((__NASM_MAJOR__ > 2) || ((__NASM_MAJOR__ == 2) && (__NASM_MINOR__ > 14)))
  %xdefine elf_symbol_type :function
%else
  %xdefine elf_symbol_type
%endif
extern m7_ippsGetOctString_BN%+elf_symbol_type
extern n8_ippsGetOctString_BN%+elf_symbol_type
extern y8_ippsGetOctString_BN%+elf_symbol_type
extern e9_ippsGetOctString_BN%+elf_symbol_type
extern l9_ippsGetOctString_BN%+elf_symbol_type
extern n0_ippsGetOctString_BN%+elf_symbol_type
extern k0_ippsGetOctString_BN%+elf_symbol_type
extern k1_ippsGetOctString_BN%+elf_symbol_type
extern ippcpJumpIndexForMergedLibs
extern ippcpSafeInit%+elf_symbol_type


segment .data
align 8
dq  .Lin_ippsGetOctString_BN
.Larraddr_ippsGetOctString_BN:
    dq m7_ippsGetOctString_BN
    dq n8_ippsGetOctString_BN
    dq y8_ippsGetOctString_BN
    dq e9_ippsGetOctString_BN
    dq l9_ippsGetOctString_BN
    dq n0_ippsGetOctString_BN
    dq k0_ippsGetOctString_BN
    dq k1_ippsGetOctString_BN

segment .text
global ippsGetOctString_BN:function (ippsGetOctString_BN.LEndippsGetOctString_BN - ippsGetOctString_BN)
.Lin_ippsGetOctString_BN:
    db 0xf3, 0x0f, 0x1e, 0xfa
    call ippcpSafeInit wrt ..plt
    align 16

ippsGetOctString_BN:
    db 0xf3, 0x0f, 0x1e, 0xfa
    mov     rax, qword [rel ippcpJumpIndexForMergedLibs wrt ..gotpc]
    movsxd  rax, dword [rax]
    lea     r11, [rel .Larraddr_ippsGetOctString_BN]
    mov     r11, qword [r11+rax*8]
    jmp     r11
.LEndippsGetOctString_BN: