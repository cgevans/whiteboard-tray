# Whiteboard Tray Makefile
# Exports FreeCAD file to STL for 3D printing

FREECAD_FILE = whiteboard-tray.FCStd
STL_FILE = whiteboard-tray.stl
FREECAD_CMD = $(shell command -v freecad >/dev/null 2>&1 && echo "freecad" || echo "flatpak run org.freecad.FreeCAD")

.PHONY: all clean

all: $(STL_FILE)

$(STL_FILE): $(FREECAD_FILE)
	$(FREECAD_CMD) -c "import FreeCAD; doc = FreeCAD.openDocument('$(FREECAD_FILE)'); [obj.Shape.exportStl('$(STL_FILE)') for obj in doc.Objects if hasattr(obj,'Shape') and obj.Label == 'Body']; FreeCAD.closeDocument(doc.Name)"

clean:
	rm -f $(STL_FILE)
