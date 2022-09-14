%if ((__NASM_MAJOR__ > 2) || ((__NASM_MAJOR__ == 2) && (__NASM_MINOR__ > 14)))
  %xdefine elf_symbol_type :function
%else
  %xdefine elf_symbol_type
%endif
extern m7_ippsSHA384Duplicate%+elf_symbol_type
extern n8_ippsSHA384Duplicate%+elf_symbol_type
extern y8_ippsSHA384Duplicate%+elf_symbol_type
extern e9_ippsSHA384Duplicate%+elf_symbol_type
extern l9_ippsSHA384Duplicate%+elf_symbol_type
extern n0_ippsSHA384Duplicate%+elf_symbol_type
extern k0_ippsSHA384Duplicate%+elf_symbol_type
extern k1_ippsSHA384Duplicate%+elf_symbol_type
extern ippcpJumpIndexForMergedLibs
extern ippcpSafeInit%+elf_symbol_type


segment .data
align 8
dq  .Lin_ippsSHA384Duplicate
.Larraddr_ippsSHA384Duplicate:
    dq m7_ippsSHA384Duplicate
    dq n8_ippsSHA384Duplicate
    dq y8_ippsSHA384Duplicate
    dq e9_ippsSHA384Duplicate
    dq l9_ippsSHA384Duplicate
    dq n0_ippsSHA384Duplicate
    dq k0_ippsSHA384Duplicate
    dq k1_ippsSHA384Duplicate

segment .text
global ippsSHA384Duplicate:function (ippsSHA384Duplicate.LEndippsSHA384Duplicate - ippsSHA384Duplicate)
.Lin_ippsSHA384Duplicate:
    db 0xf3, 0x0f, 0x1e, 0xfa
    call ippcpSafeInit wrt ..plt
    align 16

ippsSHA384Duplicate:
    db 0xf3, 0x0f, 0x1e, 0xfa
    mov     rax, qword [rel ippcpJumpIndexForMergedLibs wrt ..gotpc]
    movsxd  rax, dword [rax]
    lea     r11, [rel .Larraddr_ippsSHA384Duplicate]
    mov     r11, qword [r11+rax*8]
    jmp     r11
.LEndippsSHA384Duplicate: