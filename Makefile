OBJDIR = $(GARFIELD_HOME)/Object
SRCDIR = $(GARFIELD_HOME)/Source
INCDIR = $(GARFIELD_HOME)/Include
HEEDDIR = $(GARFIELD_HOME)/Heed
LIBDIR = $(GARFIELD_HOME)/Library

# Compiler flags
CFLAGS = -Wall -Wextra -Wno-long-long \
	`root-config --cflags` \
	-O3 -fno-common  \
	-I$(INCDIR) -I$(HEEDDIR)

# Debug flags
# CFLAGS += -g

LDFLAGS = -L$(LIBDIR) -lGarfield
LDFLAGS += `root-config --glibs` -lGeom -lgfortran -lm
# LDFLAGS += -g

all: completeavalanche viewfield

completeavalanche: completeavalanche.cc 
	$(CXX) $(CFLAGS) -c completeavalanche.cc
	$(CXX) $(CFLAGS) -o completeavalanche completeavalanche.o $(LDFLAGS)
	rm completeavalanche.o

viewfield: viewfield.cc 
	$(CXX) $(CFLAGS) -c viewfield.cc
	$(CXX) $(CFLAGS) -o viewfield viewfield.o $(LDFLAGS)
	rm viewfield.o

clean:
	 rm completeavalanche viewfield

