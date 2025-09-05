# Compiler settings
CC = gfortran
CPP = gfortran -cpp
CXXFLAGS = -g -O0 -Wall -Wextra -Wshadow -pedantic
LDFLAGS = 

# Application settings
APPNAME = myapp
SRCDIR = src/include
OBJDIR = obj
EXT = .f90

# List of source files
SRC = $(wildcard $(SRCDIR)/*$(EXT))
OBJ = $(SRC:$(SRCDIR)/%$(EXT)=$(OBJDIR)/%.o)
DEP = $(OBJ:$(OBJDIR)/%.o=%.d)

# Clean up
RM = rm -f

# Default target
.PHONY: all
all: $(APPNAME)

# Build executable
$(APPNAME): $(OBJ)
	$(CC) $(CXXFLAGS) -o $(APPNAME) $^ $(LDFLAGS)

# Object files
$(OBJDIR)/%.o: $(SRCDIR)/%$(EXT)
	$(CC) $(CXXFLAGS) -o $@ -c $<

# Clean up rules
.PHONY: clean
clean:
	$(RM) $(OBJ) $(DEP) $(APPNAME)




