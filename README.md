# jsinteropsample

To test JS Interop and flutter features that needs to work with WASM

To build and run:

```
flutter clean; flutter pub get; flutter build web --release --wasm
cd build/web
cp ../../python/server.py
python3 server.py
```


Then open browser to localhost:8181

![image](https://github.com/user-attachments/assets/3df2f8e7-cad6-494e-bd17-3e1ee2c9f2de)

