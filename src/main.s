;; this is an comment 
section .data
				msg db "hello, world!"

;; code section
section .text
				;; code entrypoint definition
				global _start

_start: 
			;; make a sys_write
			mov rax, 1
			;; set write to stdout
			mov rdi, 1
      ;; store msg 
      mov rsi, msg
      ;; store msg lenght
      mov rdx, 13
      ;; make a syscall
      syscall
      ;; syscall number to exit
      mov rax, 60
      ;; set exit code to 0
      mov rdi, 0
      ;; call syscall exit
      syscall

			
				

