%if ((__NASM_MAJOR__ > 2) || ((__NASM_MAJOR__ == 2) && (__NASM_MINOR__ > 14)))
  %xdefine elf_symbol_type :function
%else
  %xdefine elf_symbol_type
%endif
extern m7_ippsAES_EncryptCFB16_MB%+elf_symbol_type
extern n8_ippsAES_EncryptCFB16_MB%+elf_symbol_type
extern y8_ippsAES_EncryptCFB16_MB%+elf_symbol_type
extern e9_ippsAES_EncryptCFB16_MB%+elf_symbol_type
extern l9_ippsAES_EncryptCFB16_MB%+elf_symbol_type
extern n0_ippsAES_EncryptCFB16_MB%+elf_symbol_type
extern k0_ippsAES_EncryptCFB16_MB%+elf_symbol_type
extern k1_ippsAES_EncryptCFB16_MB%+elf_symbol_type
extern ippcpJumpIndexForMergedLibs
extern ippcpSafeInit%+elf_symbol_type


segment .data
align 8
dq  .Lin_ippsAES_EncryptCFB16_MB
.Larraddr_ippsAES_EncryptCFB16_MB:
    dq m7_ippsAES_EncryptCFB16_MB
    dq n8_ippsAES_EncryptCFB16_MB
    dq y8_ippsAES_EncryptCFB16_MB
    dq e9_ippsAES_EncryptCFB16_MB
    dq l9_ippsAES_EncryptCFB16_MB
    dq n0_ippsAES_EncryptCFB16_MB
    dq k0_ippsAES_EncryptCFB16_MB
    dq k1_ippsAES_EncryptCFB16_MB

segment .text
global ippsAES_EncryptCFB16_MB:function (ippsAES_EncryptCFB16_MB.LEndippsAES_EncryptCFB16_MB - ippsAES_EncryptCFB16_MB)
.Lin_ippsAES_EncryptCFB16_MB:
    db 0xf3, 0x0f, 0x1e, 0xfa
    call ippcpSafeInit wrt ..plt
    align 16

ippsAES_EncryptCFB16_MB:
    db 0xf3, 0x0f, 0x1e, 0xfa
    mov     rax, qword [rel ippcpJumpIndexForMergedLibs wrt ..gotpc]
    movsxd  rax, dword [rax]
    lea     r11, [rel .Larraddr_ippsAES_EncryptCFB16_MB]
    mov     r11, qword [r11+rax*8]
    jmp     r11
.LEndippsAES_EncryptCFB16_MB: