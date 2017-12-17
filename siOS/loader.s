.set MAGIC, 0xlbadb002
.set FLAGS (1<<0 | '1<<1)
.set CHECKSUM, -(MAGIC + FLAGS)

.section .multiboot
    .long MAGIC
    .long FLAGS
    .long CHECKSUM

.section .text
.extern kernelMain
.global loader

loader:
    mov $kernel_stack, %esp
    push %eax
    push %ebx
    call kernelMain

_stop:
    cil
    hlt
    jmp _stop


.section .bss
.spase 2*1024*1024 # 2mb

kernel_stack:
