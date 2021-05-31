import 'package:covtrack_app_uas/animation/faderAnimation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'package:intl/intl.dart';

class Info extends StatefulWidget {
  @override
  _InfoState createState() => _InfoState();
}

class _InfoState extends State<Info> with TickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Covid-19 Tips",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'MyFont',
              fontSize: 20,
            ),
          ),
          shadowColor: Colors.blue,
        ),
            body: PersonalInfo(),
            )
      );
  }
}

class PersonalInfo extends StatelessWidget {
  @override

  var tips = ["Mencuci Tangan","Masker","Daya Tahan Tubuh","Physical Distancing"];
  var tipsFull = ["Mencuci tangan dengan benar","Menggunakan masker!","Menjaga daya tahan tubuh","Menerapkan Physical Distancing"];
  var startColor = [Colors.blue,Color(0xffFFB157),Colors.pink,Colors.green];
  var endColor = [Colors.lightBlueAccent,Color(0xffFFa057),Colors.redAccent,Colors.greenAccent];
  var imgList = ["images/imgList1.png","images/imgList2.png","images/imgList3.png","images/imgList4.png"];
  var descList = [
    "Mencuci tangan dengan benar adalah cara paling sederhana namun efektif untuk mencegah penyebaran virus 2019-nCoV. ",
    "Meski tidak sepenuhnya efektif mencegah paparan kuman, namun penggunaan masker ini tetap bisa menurunkan risiko penyebaran penyakit infeksi, termasuk infeksi virus Corona.",
    "Daya tahan tubuh yang kuat dapat mencegah munculnya berbagai macam penyakit. Untuk menjaga dan meningkatkan daya tahan tubuh, Anda disarankan untuk mengonsumsi makanan sehat.",
    "Pembatasan fisik atau physical distancing adalah salah satu langkah penting untuk memutus mata rantai penyebaran virus Corona. "];

  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
      return Stack(
            children:[
              Align(
                alignment: Alignment.topRight,
                child: Opacity(
                  opacity: 0.5,
                  child: Image.asset(
                    'images/covidGreen.png',
                    height: height * 0.6,
                  ),
                ),
              ),
              Positioned(
                top: height * 0.7,
                right: width * 0.4,
                child: Opacity(
                  opacity: 0.5,
                  child: Image.asset(
                    'images/covidRed.png',
                    height: height * 0.2,
                  ),
                ),
              ),
              Positioned(
                top: height * 0.6,
                right: width * 0.1,
                child : Opacity(
                  opacity: 0.5,
                  child: Image.asset(
                    'images/covidBlue.png',
                    height: height * 0.2,
                  ),
                ),
              ),
              ListView.builder(
                padding: EdgeInsets.symmetric(
                    horizontal: width * 0.04, vertical: height * 0.02,
                ),
                itemCount: tips.length,
                itemBuilder: (context,index){
                 return GestureDetector(
                   onTap: (){
                      showDialogue(context,imgList[index],tipsFull[index],descList[index]);
                   },
                   child: Center(
                     child: Padding(
                       padding: EdgeInsets.all(8.0),
                       child: Stack(
                         children: [
                           Container(
                             height: height * 0.15,
                             decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                               gradient: LinearGradient(
                                 colors: [startColor[index],endColor[index]],
                                 begin: Alignment.topLeft,
                                 end: Alignment.bottomRight
                               ),
                               boxShadow: [
                                 BoxShadow(
                                   color: endColor[index],
                                   blurRadius: 12,
                                   offset: Offset(0,6)
                                 )
                               ]
                             ),
                           ),
                           Positioned(
                             right: 0,
                             bottom: 0,
                             top: 0,
                             child: CustomPaint(
                               size: Size(height * 0.1,height * 0.15),
                               painter: CustomCardShapePainter(20,startColor[index],endColor[index]),
                             ),
                           ),
                           Positioned.fill(
                             child: Row(
                               children: [
                                 Expanded(
                                   flex: 2,
                                   child: Image.asset(imgList[index],height: 64,width: 64,),
                                 ),
                                 Expanded(
                                   flex: 4,
                                   child: Column(
                                     mainAxisSize: MainAxisSize.min,
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                       Text(tips[index],
                                           style: TextStyle(
                                                color: Colors.white,
                                               fontFamily: 'MyFont',
                                               fontWeight: FontWeight.w500,
                                               fontSize: 15)),
                                     ],
                                   ),
                                 ),
                                 Expanded(
                                   flex: 2,
                                   child:
                                       Icon(Icons.arrow_right,color: Colors.white,)
                                   ),
                               ],
                             ),
                           ),
                         ],
                       ),
                     ),
                   )
                 );
                }

            ),]
          );

  }

}

class CustomCardShapePainter extends CustomPainter{

  final double radius;
  final Color startColor;
  final Color endColor;

  CustomCardShapePainter(this.radius, this.startColor, this.endColor);



  @override
  void paint(Canvas canvas, Size size) {
   var radius = 24.0;

   var paint = Paint();

   paint.shader = ui.Gradient.linear(
     Offset(0,0),Offset(size.width,size.height),[
       HSLColor.fromColor(startColor).withLightness(0.8).toColor(),
     endColor
   ]);

  var path = Path()
   ..moveTo(0, size.height)
   ..lineTo(size.width - radius, size.height)
   ..quadraticBezierTo(size.width, size.height, size.width, size.height-radius)
   ..lineTo(size.width, radius)
   ..quadraticBezierTo(size.width, 0, size.width - radius,0)
   ..lineTo(size.width - 1.5 * radius, 0)
   ..quadraticBezierTo(-radius, 2*radius, 0, size.height)
   ..close();

  canvas.drawPath(path, paint);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}


showDialogue(context,img,title,desc){
  return showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: Material(
            type: MaterialType.transparency,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              padding: EdgeInsets.all(15),
              height: 400,
              width: MediaQuery.of(context).size.width * 0.7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.asset(
                      img,
                      width: 200,
                      height: 200,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey,
                      fontFamily: 'MyFont',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    // width: 200,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        desc,
                        style: TextStyle(fontSize: 15, color: Colors.grey[500],fontFamily: 'MyFont',),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );



}