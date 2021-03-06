SRC=\
	*.pro \
	*.kicad_pcb \
	*.sch \
	fp-lib-table \
	*.pretty/*.kicad_mod \
	script/*

PLOT=\
	build/thelio-fan-female-CuBottom.gbr \
	build/thelio-fan-female-MaskBottom.gbr \
	build/thelio-fan-female-PasteBottom.gbr \
	build/thelio-fan-female-SilkBottom.gbr \
	build/thelio-fan-female-CuTop.gbr \
	build/thelio-fan-female-MaskTop.gbr \
	build/thelio-fan-female-PasteTop.gbr \
	build/thelio-fan-female-SilkTop.gbr \
	build/thelio-fan-female-EdgeCuts.gbr \
	build/thelio-fan-female-PTH.drl \
	build/thelio-fan-female-NPTH.drl \
	build/thelio-fan-male-CuBottom.gbr \
	build/thelio-fan-male-MaskBottom.gbr \
	build/thelio-fan-male-PasteBottom.gbr \
	build/thelio-fan-male-SilkBottom.gbr \
	build/thelio-fan-male-CuTop.gbr \
	build/thelio-fan-male-MaskTop.gbr \
	build/thelio-fan-male-PasteTop.gbr \
	build/thelio-fan-male-SilkTop.gbr \
	build/thelio-fan-male-EdgeCuts.gbr \
	build/thelio-fan-male-PTH.drl \
	build/thelio-fan-male-NPTH.drl \
	build/thelio-pwrbtn-female-CuBottom.gbr \
	build/thelio-pwrbtn-female-MaskBottom.gbr \
	build/thelio-pwrbtn-female-PasteBottom.gbr \
	build/thelio-pwrbtn-female-SilkBottom.gbr \
	build/thelio-pwrbtn-female-CuTop.gbr \
	build/thelio-pwrbtn-female-MaskTop.gbr \
	build/thelio-pwrbtn-female-PasteTop.gbr \
	build/thelio-pwrbtn-female-SilkTop.gbr \
	build/thelio-pwrbtn-female-EdgeCuts.gbr \
	build/thelio-pwrbtn-female-PTH.drl \
	build/thelio-pwrbtn-female-NPTH.drl \
	build/thelio-pwrbtn-male-CuBottom.gbr \
	build/thelio-pwrbtn-male-MaskBottom.gbr \
	build/thelio-pwrbtn-male-PasteBottom.gbr \
	build/thelio-pwrbtn-male-SilkBottom.gbr \
	build/thelio-pwrbtn-male-CuTop.gbr \
	build/thelio-pwrbtn-male-MaskTop.gbr \
	build/thelio-pwrbtn-male-PasteTop.gbr \
	build/thelio-pwrbtn-male-SilkTop.gbr \
	build/thelio-pwrbtn-male-EdgeCuts.gbr \
	build/thelio-pwrbtn-male-PTH.drl \
	build/thelio-pwrbtn-male-NPTH.drl

STEP=\
	build/thelio-fan-female.step \
	build/thelio-fan-male.step \
	build/thelio-pwrbtn-female.step \
	build/thelio-pwrbtn-male.step

.PHONY: all plot step clean

all: plot step

plot: $(PLOT)

step: $(STEP)

clean:
	rm -rf build

$(PLOT): $(SRC)
	for pcb in *.kicad_pcb; do ./script/plot "$$pcb" "$(@D)"; done

build/%.step: %.kicad_pcb $(SRC)
	mkdir -p "$(@D)"
	kicad2step --no-virtual --drill-origin --force -o "$@" "$<"
