.PHONY: run clean

rom := hello.nes
objdir := obj
srcdir := src
config := $(srcdir)/nrom128.cfg

CC65 := cc65
CA65 := ca65
LD65 := ld65
CFLAGS65 :=
EMU := fceux

run: $(rom)
	$(EMU) $<

# Rules for PRG ROM

map.txt $(rom): $(objdir)/crt0.o $(objdir)/main.o $(wildcard $(srcdir)/*)
	$(LD65) -o $(rom) -m map.txt -C $(config) $(objdir)/crt0.o $(objdir)/main.o $(srcdir)/nes.lib

$(objdir)/crt0.o: $(srcdir)/crt0.s
	mkdir -p $(objdir)
	$(CA65) $(CFLAGS65) $< -o $@

$(objdir)/main.o: $(objdir)/main.s
	mkdir -p $(objdir)
	$(CA65) $(CFLAGS65) $< -o $@

$(objdir)/main.s: $(srcdir)/main.c
	mkdir -p $(objdir)
	$(CC65) $(CFLAGS65) $< -o $@

clean:
	-rm -rf $(objdir)/
