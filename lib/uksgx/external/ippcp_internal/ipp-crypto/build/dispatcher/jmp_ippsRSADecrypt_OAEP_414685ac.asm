%if ((__NASM_MAJOR__ > 2) || ((__NASM_MAJOR__ == 2) && (__NASM_MINOR__ > 14)))
  %xdefine elf_symbol_type :function
%else
  %xdefine elf_symbol_type
%endif
extern m7_ippsRSADecrypt_OAEP%+elf_symbol_type
extern n8_ippsRSADecrypt_OAEP%+elf_symbol_type
extern y8_ippsRSADecrypt_OAEP%+elf_symbol_type
extern e9_ippsRSADecrypt_OAEP%+elf_symbol_type
extern l9_ippsRSADecrypt_OAEP%+elf_symbol_type
extern n0_ippsRSADecrypt_OAEP%+elf_symbol_type
extern k0_ippsRSADecrypt_OAEP%+elf_symbol_type
extern k1_ippsRSADecrypt_OAEP%+elf_symbol_type
extern ippcpJumpIndexForMergedLibs
extern ippcpSafeInit%+elf_symbol_type


segment .data
align 8
dq  .Lin_ippsRSADecrypt_OAEP
.Larraddr_ippsRSADecrypt_OAEP:
    dq m7_ippsRSADecrypt_OAEP
    dq n8_ippsRSADecrypt_OAEP
    dq y8_ippsRSADecrypt_OAEP
    dq e9_ippsRSADecrypt_OAEP
    dq l9_ippsRSADecrypt_OAEP
    dq n0_ippsRSADecrypt_OAEP
    dq k0_ippsRSADecrypt_OAEP
    dq k1_ippsRSADecrypt_OAEP

segment .text
global ippsRSADecrypt_OAEP:function (ippsRSADecrypt_OAEP.LEndippsRSADecrypt_OAEP - ippsRSADecrypt_OAEP)
.Lin_ippsRSADecrypt_OAEP:
    db 0xf3, 0x0f, 0x1e, 0xfa
    call ippcpSafeInit wrt ..plt
    align 16

ippsRSADecrypt_OAEP:
    db 0xf3, 0x0f, 0x1e, 0xfa
    mov     rax, qword [rel ippcpJumpIndexForMergedLibs wrt ..gotpc]
    movsxd  rax, dword [rax]
    lea     r11, [rel .Larraddr_ippsRSADecrypt_OAEP]
    mov     r11, qword [r11+rax*8]
    jmp     r11
.LEndippsRSADecrypt_OAEP: