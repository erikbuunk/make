# Template  makefile
# steps our in  reversed order.

FILE = gz_2010_01_140_00_500k
OUT_FILE = counties

$(OUT_FILE).json: $(FILE).shp
	ogr2ogr -f "GeoJSON" $(OUT_FILE).json $(FILE).shp

$(FILE).shp: $(OUT_FILE).zip
	unzip $(OUT_FILE).zip
	touch $(FILE).shp

$(OUT_FILE).zip:
	curl -o $(OUT_FILE).zip 'https://www2.census.gov/geo/tiger/GENZ2010/$(FILE).zip'


clean:
	rm -f $(FILE).*
	rm -f $(OUT_FILE).*

