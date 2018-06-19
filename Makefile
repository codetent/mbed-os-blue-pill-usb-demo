################################################################################
# define the name of the generated output file
#
TARGET        = main

################################################################################
# TOOLS & ARGS
#
SRC           = $(wildcard *.cpp)
TERMINAL      = gnome-terminal
TOOLCHAIN     = GCC_ARM
BOARD         = BLUEPILL_F103C8
BUILDDIR      = BUILD
MBED          = mbed

# DETERMINE OS
ifdef SystemRoot
  RM = del /Q
  RM_DIR = rmdir /Q /S
  FixPath = $(subst /,\,$1)
else
  RM = rm -rf
  RM_DIR = $(RM)
  FixPath = $1
endif

################################################################################
# BUILD RULES
all: $(SRC) build

################################################################################
# CREATE A DEBUG VESRION
build: $(SRC)
	@echo "----------------------------------------------------------------------"
	@echo "Building with DEBUG Symbols"
	@echo ""
	$(MBED) compile -m $(BOARD) -t $(TOOLCHAIN) -N main --profile mbed-os/tools/profiles/debug.json
	@echo ""

################################################################################
# CREATE A RELEASE VESRION
release: $(SRC)
	@echo "----------------------------------------------------------------------"
	@echo "Build a RELEASE version"
	@echo ""
	$(MBED) compile -m $(BOARD) -t $(TOOLCHAIN) -N main
	@echo ""

################################################################################
# RUN RULES
run: build $(BUILDDIR)/$(BOARD)/$(TOOLCHAIN)/$(TARGET).bin
	ST-LINK_CLI -c SWD -P "$(BUILDDIR)/$(BOARD)/$(TOOLCHAIN)/$(TARGET).bin" 0x08000000 -V -Rst

################################################################################
# ERASE DEVICE
erase:
	ST-LINK_CLI -c SWD -ME

################################################################################
# CLEAN RULES
clean:
	$(RM) $(call FixPath, *.pyc)
	$(RM_DIR) $(call FixPath, ${BUILDDIR})

################################################################################
# EOF
################################################################################