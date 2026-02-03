NAME		= libasm.a

# Assembler and flags
ASM			= nasm
AFLAGS		= -f elf64
CC			= cc
CFLAGS		= -Wall -Wextra -Werror

# Directories
OBJ_DIR		= obj

# Source files
SRCS		= \
# 				ft_strlen.s \
# 			  ft_strcpy.s \
# 			  ft_strcmp.s \
# 			  ft_write.s \
# 			  ft_read.s \
# 			  ft_strdup.s

# Object files
OBJS		= $(addprefix $(OBJ_DIR)/, $(SRCS:.s=.o))

# Colors
GREEN		= \033[0;32m
RED			= \033[0;31m
RESET		= \033[0m

# Rules
all: $(NAME)

$(NAME): $(OBJS)
	@echo "$(GREEN)Creating $(NAME)...$(RESET)"
	@ar rcs $(NAME) $(OBJS)
	@echo "$(GREEN)$(NAME) created successfully$(RESET)"

$(OBJ_DIR)/%.o: %.s
	@mkdir -p $(OBJ_DIR)
	@echo "Assembling $<..."
	@$(ASM) $(AFLAGS) $< -o $@

clean:
	@echo "$(RED)Cleaning object files...$(RESET)"
	@rm -rf $(OBJ_DIR)

fclean: clean
	@echo "$(RED)Removing $(NAME)...$(RESET)"
	@rm -f $(NAME)
	@rm -f test

re: fclean all

# Test compilation
test: all
	@echo "$(GREEN)Compiling test program...$(RESET)"
	@$(CC) $(CFLAGS) main.c -L. -lasm -o test
	@echo "$(GREEN)Run ./test to execute$(RESET)"

# Docker commands
DOCKER_PLATFORM ?= linux/amd64

docker-build:
	@DOCKER_DEFAULT_PLATFORM=$(DOCKER_PLATFORM) docker compose build

docker-up:
	@DOCKER_DEFAULT_PLATFORM=$(DOCKER_PLATFORM) docker compose up -d

docker-down:
	@DOCKER_DEFAULT_PLATFORM=$(DOCKER_PLATFORM) docker compose down

docker-shell:
	@DOCKER_DEFAULT_PLATFORM=$(DOCKER_PLATFORM) docker compose exec libasm /bin/bash

.PHONY: all clean fclean re test 
