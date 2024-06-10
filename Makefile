## Makefile

# Code couleur
RED = \033[1;4;32m
NONE = \033[0m

CC = gcc
TARGET = algo

# Sources
SRC := $(wildcard $(shell find . -name '*.c'))

# Objets
OBJS = $(SRC:.c=.o)

# Flags
CFLAGS = -g3 -W -Wall -Wextra -I includes
LDLIBS = -L lib -lm

.PHONY: all clean fclean re $(TARGET)

all: $(TARGET)

$(TARGET): $(OBJS)
	@echo -e "$(RED)Compilation:$(NONE)"
	$(CC) -o $(TARGET) $(SRC) $(CFLAGS) $(LDLIBS)
	@echo -e "\n"

clean:
	@echo -e "$(RED)Clean objects:$(NONE)"
	rm -f $(OBJS)
	@echo -e "\n"

fclean:
	@echo -e "$(RED)Clean executable:$(NONE)"
	rm -f $(TARGET)
	@echo -e "\n"

re:	fclean all
	@echo -e "$(RED)Remake:$(NONE)"
	make clean
