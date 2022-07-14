####################################
#
#		GLOBAL INFORMATIONS
#
####################################

NAME		= chkcpu
FASM		= fasm
LDFLAGS		= -lc --dynamic-linker /lib/x86_64-linux-gnu/ld-2.31.so
SRC_S	 	= $(wildcard src/*.s)

OBJ_S	 	= $(SRC_S:.s=.o)
NUM_CF		= $(shell ls -l src/*.s | wc -l)
cnt			= 1

##################################
#
#			COLOR
#
##################################

GREEN 	= \033[38;5;82m
RED   	= \033[38;5;196m
YELLOW 	= \033[38;5;226m
ORANGE	= \033[38;5;202m
PURPLE	= \033[38;5;207m
LBLUE	= \033[38;5;45m
BLUE	= \033[38;5;26m
RESET 	= \033[00m

define ascii_art
 ▄████▄   ██░ ██ ▓█████  ▄████▄   ██ ▄█▀ ▄████▄   ██▓███   █    ██ 
▒██▀ ▀█  ▓██░ ██▒▓█   ▀ ▒██▀ ▀█   ██▄█▒ ▒██▀ ▀█  ▓██░  ██▒ ██  ▓██▒
▒▓█    ▄ ▒██▀▀██░▒███   ▒▓█    ▄ ▓███▄░ ▒▓█    ▄ ▓██░ ██▓▒▓██  ▒██░
▒▓▓▄ ▄██▒░▓█ ░██ ▒▓█  ▄ ▒▓▓▄ ▄██▒▓██ █▄ ▒▓▓▄ ▄██▒▒██▄█▓▒ ▒▓▓█  ░██░
▒ ▓███▀ ░░▓█▒░██▓░▒████▒▒ ▓███▀ ░▒██▒ █▄▒ ▓███▀ ░▒██▒ ░  ░▒▒█████▓ 
░ ░▒ ▒  ░ ▒ ░░▒░▒░░ ▒░ ░░ ░▒ ▒  ░▒ ▒▒ ▓▒░ ░▒ ▒  ░▒▓▒░ ░  ░░▒▓▒ ▒ ▒ 
  ░  ▒    ▒ ░▒░ ░ ░ ░  ░  ░  ▒   ░ ░▒ ▒░  ░  ▒   ░▒ ░     ░░▒░ ░ ░ 
░         ░  ░░ ░   ░   ░        ░ ░░ ░ ░        ░░        ░░░ ░ ░ 
░ ░       ░  ░  ░   ░  ░░ ░      ░  ░   ░ ░                  ░     
░                       ░               ░                          

					Version : 0.0.1 (Alpha)
					Author  : Sam0verfl0w


endef
export ascii_art

all: BANNER $(NAME)

BANNER:
	@printf "$(LBLUE)$$ascii_art$(RESET)"

%.o: %.s
	@printf "$(LBLUE)[$(PURPLE)+$(LBLUE)] compile $(GREEN)$<$(LBLUE) [$(GREEN)$(cnt)$(YELLOW)/$(NUM_CF)$(LBLUE)]     \r"
	@$(FASM) $<  $@ > /dev/null 2>&1
	@$(eval cnt=$(shell echo $$(($(cnt)+1))))

$(NAME): $(OBJ_S)
	@printf "\n"
	@ld $(OBJ_S) -o $(NAME) $(LDFLAGS)

clean:
	@rm -rf $(OBJ_S)

fclean: clean
	@rm -rf $(NAME)

re: fclean $(NAME)

.PHONY: all clean fclean re

