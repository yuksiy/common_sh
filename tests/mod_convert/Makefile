# System Configuration
srcdir = ../..


# Inference Rules

# Macro Defines
PROJ = common_sh

MOD_STR2OCT_ARGS = \
	d--------- \
	---------x \
	--------w- \
	-------r-- \
	-------rwx \
	------x--- \
	-----w---- \
	----r----- \
	----rwx--- \
	---x------ \
	--w------- \
	-r-------- \
	-rwx------ \
	d--------T \
	d-----S--- \
	d--S------ \
	d--S--S--T \
	d--------t \
	d-----s--- \
	d--s------ \
	d--s--s--t \
	drwsrwsrwt \
	drwsrwsrwt+ \


# Target List
all: \
				test \

# Test
test: \
	test-MOD_STR2OCT

test-MOD_STR2OCT:
	@. $(srcdir)/mod_convert_function.sh; \
	for i in $(MOD_STR2OCT_ARGS); do \
		echo "+ MOD_STR2OCT \"$${i}\""; \
		MOD_STR2OCT "$${i}"; \
	done
	@echo "-I \"$@\" has ended successfully." ; echo

