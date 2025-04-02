import 'package:flutter/material.dart';
import 'package:jsinteropsample/webx_view_wrapper.dart';

class MyWebXView extends WebViewWrapper {


  const MyWebXView({super.key
      });



  @override
  double getHeight(BuildContext context) {
    return MediaQuery.of(context).size.height - 300;
  }

  @override
  double getWidth(BuildContext context) {
    return MediaQuery.of(context).size.width - 120;
  }

  // the r for no string interpolation because bootstrap uses $ for js
  @override
  String loadHTML() {
    return r'''
    <!DOCTYPE html>
<html lang="en">
<head>
</head>
<body style="background-color: #E8F5E9;">

<button  type="submit">Submit</button>

</body>
</html>


    ''';

    
  }

  @override
  String preProcessing(String html) {
    return html;
  }
}