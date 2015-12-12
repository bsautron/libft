# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: bsautron <bsautron@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2015/02/25 00:45:50 by bsautron          #+#    #+#              #
#    Updated: 2015/12/12 17:29:05 by bsautron         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

CC = gcc
CFLAGS = -Wall -Wextra -Werror

SRC = ft_memset.c \
	  ft_bzero.c \
	  ft_memcpy.c \
	  ft_memccpy.c \
	  ft_memmove.c \
	  ft_memchr.c \
	  ft_memcmp.c \
	  ft_memalloc.c \
	  ft_memdel.c \
	  ft_free_tab.c \
	  \
	  ft_putchar.c \
	  ft_putstr.c \
	  ft_putnbr.c \
	  ft_putendl.c \
	  ft_putchar_fd.c \
	  ft_putstr_fd.c \
	  ft_putendl_fd.c \
	  ft_putnbr_fd.c \
	  ft_putstr_tab.c \
	  \
	  ft_strlen.c \
	  ft_strlen_esp.c \
	  ft_strcpy.c \
	  ft_strncpy.c \
	  ft_strcmp.c \
	  ft_strncmp.c \
	  ft_strdup.c \
	  ft_strndup.c \
	  ft_strcat.c \
	  ft_strncat.c \
	  ft_strlcat.c \
	  ft_strchr.c \
	  ft_strrchr.c \
	  ft_rstrchr.c \
	  ft_strstr.c \
	  ft_strnstr.c \
	  ft_strnew.c \
	  ft_strdel.c \
	  ft_strclr.c \
	  ft_striter.c \
	  ft_striteri.c \
	  ft_strmap.c \
	  ft_strmapi.c \
	  ft_strequ.c \
	  ft_strnequ.c \
	  ft_strsub.c \
	  ft_strjoin.c \
	  ft_strtrim_white_space.c \
	  ft_strtrim.c \
	  ft_strsplit.c \
	  ft_strsplit_white_space.c \
	  ft_atoi.c \
	  ft_itoa.c \
	  ft_swap.c \
	  ft_reverse.c \
	  \
	  ft_sort_wordtab.c \
	  ft_intlen.c \
	  ft_strsort.c \
	  ft_strcheck_char.c \
	  ft_sort_params.c \
	  ft_sort_params_rev.c \
	  ft_charcheck_in_str.c \
	  ft_strtrim_letter.c \
	  \
	  ft_isalpha.c \
	  ft_isdigit.c \
	  ft_isprint.c \
	  ft_isalnum.c \
	  ft_isascii.c \
	  ft_toupper.c \
	  ft_tolower.c \
	  \
	  ft_lstnew.c \
	  ft_lstdelone.c \
	  ft_lstdel.c \
	  ft_lstadd.c \
	  ft_lstadd_back.c \
	  ft_lstiter.c \
	  ft_lstmap.c \
	  \
	  get_next_line.c

OBJ = $(SRC:%.c=.obj/%.o)
OBJ_DIR = .obj/

INCLUDE_DIR = includes/
INCLUDE_FILES = libft.h \
				get_next_line.h

NAME = libft.a

all: dor $(NAME)

$(NAME): $(OBJ)
	@ar rc $(NAME) $(OBJ)
	@ranlib $(NAME)
	@echo "\033[0m"

dor:
	@mkdir -p $(OBJ_DIR)

.obj/%.o: %.c $(addprefix $(INCLUDE_DIR), $(INCLUDE_FILES))
	@echo "\033[36m   $<"
	@$(CC) -o $@ $(FLAGS) -I includes/ -c $<

clean:
	rm -f $(OBJ)
	@rmdir .obj/ 2> /dev/null || env -i
	@echo "\033[33;31m===> Suppresion des objets"

fclean: clean
	rm -f libft.a
	@echo "\033[35;31m===> Suppression de la libft"

re: fclean all
