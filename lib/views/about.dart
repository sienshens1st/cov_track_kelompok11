import 'package:covtrack_app_uas/animation/faderAnimation.dart';
import 'package:flutter/material.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> with TickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
color: Colors.orange,
      child: SafeArea(
            child:Center(
            child: PersonalInfo(),
            )
      ),
    );
  }
}

class PersonalInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      return Padding(
        padding: const EdgeInsets.all(30.0),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 0,horizontal: 15),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white
          ),
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 10,),
                Text("Tips Anti Korona",
                    style: TextStyle(
                        fontFamily: 'MyFont',
                        fontWeight: FontWeight.bold,
                    fontSize: 19)),
                SizedBox(),
                SizedBox(height: 10,),
                Text("Mencuci tangan dengan benar",
                    style: TextStyle(
                        fontFamily: 'MyFont',
                        fontWeight: FontWeight.bold)),
                Text("Mencuci tangan dengan benar adalah cara paling sederhana namun efektif untuk mencegah penyebaran virus 2019-nCoV. "

                ),
                SizedBox(height:  10,),
                Text("Menggunakan masker!",
                    style: TextStyle(
                        fontFamily: 'MyFont',
                        fontWeight: FontWeight.bold,
                    )),
                Text("Meski tidak sepenuhnya efektif mencegah paparan kuman, namun penggunaan masker ini tetap bisa menurunkan risiko penyebaran penyakit infeksi, termasuk infeksi virus Corona."
                ),
                SizedBox(height:  10,),
                Text("Menjaga daya tahan tubuh",
                    style: TextStyle(
                        fontFamily: 'MyFont',
                        fontWeight: FontWeight.bold,

                    )),
                Text("Daya tahan tubuh yang kuat dapat mencegah munculnya berbagai macam penyakit. Untuk menjaga dan meningkatkan daya tahan tubuh, Anda disarankan untuk mengonsumsi makanan sehat"
                ),
                SizedBox(height:  10,),
                Text("Menerapkan physical distancing",
                    style: TextStyle(
                        fontFamily: 'MyFont',
                        fontWeight: FontWeight.bold)),
                Text("Pembatasan fisik atau physical distancing adalah salah satu langkah penting untuk memutus mata rantai penyebaran virus Corona. "
                ),
                SizedBox(height:  15,),
                Text("Hal ini dapat dilakukan dengan cara tidak bepergian keluar rumah, kecuali untuk keperluan yang mendesak atau darurat, seperti berbelanja bahan makanan atau berobat ketika sakit."
                ),


              ],
            ),
          ),
        ),
      );

  }

}