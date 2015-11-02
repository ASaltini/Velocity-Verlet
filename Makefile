CC = gcc
CXX = g++
RM = rm -f
CPPFLAGS = -O3 -Wall -std=c++14
LDFLAGS = -O3 -Wall -std=c++14
LDLIBS =

MAIN = verlet.cpp
SRCS = $(MAIN)
OBJS = $(subst .cpp,.o,$(SRCS))

.PHONY: all clean dist-clean

all: $(subst .cpp,,$(SRCS))

$(subst .cpp,,$(SRCS)): $(OBJS)
	    $(CXX) $(LDFLAGS) -o $(subst .cpp,,$(SRCS)) $(OBJS) $(LDLIBS)

depend: .depend

.depend: $(SRCS)
	    $(RM) ./.depend
	    $(CXX) $(CPPFLAGS) -MM $^ >> ./.depend;

clean:
	    $(RM) $(OBJS)

dist-clean: clean
	    $(RM) *~ .depend

include .depend
