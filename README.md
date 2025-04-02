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

When using flutter 3.27.3

![image](https://github.com/user-attachments/assets/5233edba-ba3d-4ca9-80f5-afc7a1f2633c)


When using flutter 3.29.2
You can see the error in the browser console:
UnimplementedError: cannot call build on the facade implementation of WebViewX
![image](https://github.com/user-attachments/assets/060399f1-0a6a-403b-b43f-d8a832fc62e0)
