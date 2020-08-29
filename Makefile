SOURCE="https://download-cf.jetbrains.com/datagrip/datagrip-2020.2.2.tar.gz"
DESTINATION="build.tar.bz2"
OUTPUT="DataGrip.AppImage"


all:
	echo "Building: $(OUTPUT)"
	wget --output-document=$(DESTINATION) --continue $(SOURCE)
	
	tar -zxvf $(DESTINATION)
	rm -rf AppDir/opt
	
	mkdir --parents AppDir/opt/application
	cp -r DataGrip-*/* AppDir/opt/application

	chmod +x AppDir/AppRun
	export ARCH=x86_64; bin/appimagetool.AppImage AppDir $(OUTPUT)

	chmod +x $(OUTPUT)
# 
	rm -rf DataGrip-2020.1.2
	rm -f $(DESTINATION)
	rm -rf AppDir/opt
# 
