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

NAME = libft
SOURCES = ft_memset.c \
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
	  ft_isloweralpha.c \
	  ft_isupperalpha.c \
	  ft_isdigit.c \
	  ft_isprint.c \
	  ft_isalnum.c \
	  ft_isascii.c \
	  ft_isnan.c \
	  ft_isword.c \
	  ft_iswordalnum.c \
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
	  get_next_line.c \

SOURCES_FOLDER = .

CC = gcc
LIB_NAME = $(NAME).a
CFLAGS = -Wextra -Wall -Werror
TEST_FORDER = test
INCLUDES_FOLDER = includes
OBJECTS_FOLDER = ../.objects/$(NAME)
INCLUDES = $(NAME).h

SOURCES_DEPENDENCIES = $(foreach dep,$(DEPENDENCIES), ../$(dep)/$(dep).a)
LIBRARIES = $(foreach dep, $(DEPENDENCIES), -L../$(dep)/ -$(subst lib,l,$(dep)))
INCLUDES_LIBRARIES = $(foreach dep,$(DEPENDENCIES),-I ../$(dep)/includes)
HEADERS_LIBRARIES = $(foreach dep,$(DEPENDENCIES),../$(dep)/includes/$(dep).h)
MAKE_LIBRARIES = $(foreach dep,$(DEPENDENCIES),make -C ../$(dep);)
REBUILD_LIBRARIES = $(foreach dep,$(DEPENDENCIES),make re -C ../$(dep);)

OBJECTS = $(SOURCES:%.c=%.o)

all: init $(LIB_NAME)

ifdef DEPENDENCIES
init: $(SOURCES_DEPENDENCIES)
	$(MAKE_LIBRARIES)
	@mkdir -p $(OBJECTS_FOLDER)/$(SOURCES_FOLDER)

$(addprefix $(OBJECTS_FOLDER)/$(SOURCES_FOLDER)/, %.o): $(SOURCES_FOLDER)/%.c $(addprefix $(INCLUDES_FOLDER)/, $(INCLUDES))
	$(CC) $(CFLAGS) -I $(INCLUDES_FOLDER) $(INCLUDES_LIBRARIES) -o $@ -c $<
endif

ifndef DEPENDENCIES
init:
	@mkdir -p $(OBJECTS_FOLDER)/$(SOURCES_FOLDER)

$(addprefix $(OBJECTS_FOLDER)/$(SOURCES_FOLDER)/, %.o): $(SOURCES_FOLDER)/%.c $(addprefix $(INCLUDES_FOLDER)/, $(INCLUDES))
	$(CC) $(CFLAGS) -I $(INCLUDES_FOLDER) -o $@ -c $<
endif

$(MAIN_OBJECT): $(MAIN)
	$(CC) $(CFLAGS) -I $(INCLUDES_FOLDER) -o $(MAIN_OBJECT) -c $(MAIN)

$(LIB_NAME): $(addprefix $(OBJECTS_FOLDER)/$(SOURCES_FOLDER)/, $(OBJECTS))
	ar rc $(LIB_NAME) $(addprefix $(OBJECTS_FOLDER)/$(SOURCES_FOLDER)/, $(OBJECTS))
	ranlib $(LIB_NAME)

clean:
	rm -f $(addprefix $(OBJECTS_FOLDER)/$(SOURCES_FOLDER)/, $(OBJECTS))
	rm -f $(MAIN_OBJECT)
	rm -rf $(OBJECTS_FOLDER)

fclean: clean
	rm -f $(NAME)

re: fclean all
