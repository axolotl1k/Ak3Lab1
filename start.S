.syntax unified    @ Використовувати сучасний синтаксис ARM
.cpu cortex-m4     @ Вказуємо конкретний тип ядра
.thumb             @ Використовувати набір команд Thumb

.global vtable
.global reset_handler

.type vtable, %object
vtable:
    .word __stack_start    @ Перше слово — вказуємо адресу верхівки стеку
    .word __hard_reset__+1 @ Друге слово — адреса переходу після скидання (Reset)
    .size vtable, .-vtable

__hard_reset__:
    ldr r0, =__stack_start @ Завантажуємо адресу початку стеку в регістр r0
    mov sp, r0             @ Встановлюємо вказівник стеку (SP)
    b __hard_reset__       @ Зациклюємо програму
