NAME = minitalk
SERVER = server
CLIENT = client
CC = cc
CFLAGS = -Wall -Wextra -Werror
RM = rm -f
LIBFTPRINTF = ft_printf/libftprintf.a

all: $(NAME)
	@echo "\033[36m        		               welcome to  			               	       \033[0m"
	@echo "\033[32m                      ███              ███   █████              ████  █████     \033[0m"
	@echo "\033[32m                     ░░░              ░░░   ░░███              ░░███ ░░███      \033[0m"
	@echo "\033[32m     █████████████   ████  ████████   ████  ███████    ██████   ░███  ░███ █████\033[0m"
	@echo "\033[32m    ░░███░░███░░███ ░░███ ░░███░░███ ░░███ ░░░███░    ░░░░░███  ░███  ░███░░███ \033[0m"
	@echo "\033[32m     ░███ ░███ ░███  ░███  ░███ ░███  ░███   ░███      ███████  ░███  ░██████░  \033[0m"
	@echo "\033[32m     ░███ ░███ ░███  ░███  ░███ ░███  ░███   ░███ ███ ███░░███  ░███  ░███░░███ \033[0m"
	@echo "\033[32m     █████░███ █████ █████ ████ █████ █████  ░░█████ ░░████████ █████ ████ █████\033[0m"
	@echo "\033[32m    ░░░░░ ░░░ ░░░░░ ░░░░░ ░░░░ ░░░░░ ░░░░░    ░░░░░   ░░░░░░░░ ░░░░░ ░░░░ ░░░░░ \033[0m"
	@echo "\033[36m        		       by AbdulAzeez Shobajo                          \033[0m"

$(NAME): $(SERVER) $(CLIENT)

$(SERVER): server.c minitalk.h
	$(CC) $(CFLAGS) -o server server.c $(LIBFTPRINTF)

$(CLIENT): client.c minitalk.h
	$(CC) $(CFLAGS) -o client client.c $(LIBFTPRINTF)

clean:
	$(RM) $(SERVER) $(CLIENT)

fclean: clean

re: fclean all

.PHONY: all $(NAME) clean fclean re