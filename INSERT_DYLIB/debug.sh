rm -rf SampleDemo.app/Contents/MacOS/libInjectDylib.dylib
mv libInjectDylib.dylib SampleDemo.app/Contents/MacOS/libInjectDylib.dylib
./INSERT_DYLIB --weak libInjectDylib.dylib SampleDemo.app/Contents/MacOS/SampleDemo < y
rm -rf SampleDemo.app/Contents/MacOS/SampleDemo
mv SampleDemo.app/Contents/MacOS/SampleDemo_patched SampleDemo.app/Contents/MacOS/SampleDemo
