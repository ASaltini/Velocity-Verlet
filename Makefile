CC = gcc
CXX = g++
RM = rm -f
CPPFLAGS = -O3 -Wall -std=c++14
LDFLAGS = -O3 -Wall -std=c++14
LDLIBS =

PNAME = verlet.cpp
SRCS = $(PNAME)
OBJS = $(subst .cpp,.o,$(SRCS))

tool: $(OBJS)
	    $(CXX) $(LDFLAGS) -o $(subst .cpp,,$(SRCS)) $(OBJS) $(LDLIBS)

depend: .depend

.depend: $(SRCS)
	    $(RM) ./.depend
	    $(CXX) $(CPPFLAGS) -MM $^>>./.depend;

clean:
	    $(RM) $(OBJS)

dist-clean: clean
	    $(RM) *~ .depend

include .depend
