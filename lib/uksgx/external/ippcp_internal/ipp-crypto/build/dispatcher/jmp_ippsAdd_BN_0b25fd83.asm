%if ((__NASM_MAJOR__ > 2) || ((__NASM_MAJOR__ == 2) && (__NASM_MINOR__ > 14)))
  %xdefine elf_symbol_type :function
%else
  %xdefine elf_symbol_type
%endif
extern m7_ippsAdd_BN%+elf_symbol_type
extern n8_ippsAdd_BN%+elf_symbol_type
extern y8_ippsAdd_BN%+elf_symbol_type
extern e9_ippsAdd_BN%+elf_symbol_type
extern l9_ippsAdd_BN%+elf_symbol_type
extern n0_ippsAdd_BN%+elf_symbol_type
extern k0_ippsAdd_BN%+elf_symbol_type
extern k1_ippsAdd_BN%+elf_symbol_type
extern ippcpJumpIndexForMergedLibs
extern ippcpSafeInit%+elf_symbol_type


segment .data
align 8
dq  .Lin_ippsAdd_BN
.Larraddr_ippsAdd_BN:
    dq m7_ippsAdd_BN
    dq n8_ippsAdd_BN
    dq y8_ippsAdd_BN
    dq e9_ippsAdd_BN
    dq l9_ippsAdd_BN
    dq n0_ippsAdd_BN
    dq k0_ippsAdd_BN
    dq k1_ippsAdd_BN

segment .text
global ippsAdd_BN:function (ippsAdd_BN.LEndippsAdd_BN - ippsAdd_BN)
.Lin_ippsAdd_BN:
    db 0xf3, 0x0f, 0x1e, 0xfa
    call ippcpSafeInit wrt ..plt
    align 16

ippsAdd_BN:
    db 0xf3, 0x0f, 0x1e, 0xfa
    mov     rax, qword [rel ippcpJumpIndexForMergedLibs wrt ..gotpc]
    movsxd  rax, dword [rax]
    lea     r11, [rel .Larraddr_ippsAdd_BN]
    mov     r11, qword [r11+rax*8]
    jmp     r11
.LEndippsAdd_BN: