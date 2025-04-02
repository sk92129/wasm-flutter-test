import 'dart:js_interop';

@JS('demoMethod')
external void _demoMethod(String message);

@JSExport()
class JSHelper {
 void demoMethod(String message) {
   _demoMethod(message);
 }
}