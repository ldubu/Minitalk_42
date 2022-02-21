MAKEFLAGS = --silent

CC = 		gcc

CFLAGS =	-Wall -Werror -Wextra

IFLAGS = 	-I includes -I libft_42/includes

RM =		rm -rf

HEADER = 	includes/

OBJS_PATH = objs/

_GREY=	$'\033[30m
_RED=	$'\033[31m
_GREEN=	$'\033[32m
_YELLOW=$'\033[33m
_BLUE=	$'\033[34m
_PURPLE=$'\033[35m
_CYAN=	$'\033[36m
_WHITE=	$'\033[37m
_END= 	$'\033[37m

SRC =		

OBJ = $(addprefix $(OBJS_PATH), $(SRC:.c=.o))

$(OBJS_PATH)%.o: %.c $(HEADER)
	@mkdir -p $(dir $@)
	@$(CC) $(CFLAGS) $(IFLAGS) -c $< -o $@
	@printf "%-15s ${_YELLOW}${_BOLD}$<${_END}...\n" "Compiling"			

serveur: 	$(OBJ) $(HEADER) libft
	@printf "%-15s ${_PURPLE}${_BOLD}serveur${_END}...\n" "Compiling"	
	@$(CC) $(CFLAGS) $(IFLAGS) serveur.c $(OBJ)
	@printf "\n${_GREEN}${_BOLD}[Serveur OK]${_END}\n"

client:		$(OBJ) $(HEADER) libft
	@printf "%-15s ${_PURPLE}${_BOLD}client${_END}...\n" "Compiling"	
	@$(CC) $(CFLAGS) $(IFLAGS) client.c $(OBJ)
	@printf "\n${_GREEN}${_BOLD}[Client OK]${_END}\n"
	
all: serveur client

libft:
	@make -C libft_42/
	@cp libft_42/libft.a ./

clean:
	@$(RM) $(OBJ)
	@make clean -C libft_42/

fclean:		clean
	@$(RM) $(NAME) $(OBJS_PATH) libftprintf.a
	@make fclean -C libft_42/

re: 	fclean all

.PHONY: 	clean fclean re all