import 'package:flutter/material.dart';

class Hasil extends StatelessWidget {
  int totalSkor;
  Function resetKuis;

  Hasil(this.totalSkor, this.resetKuis);
  //Getter
  String get hasilText {
    String hasil;
    if (totalSkor <= 8) {
      hasil = 'Sepi banget ya hidupmu';
    } else if (totalSkor <= 12) {
      hasil = 'Hmmm... Lumayan juga ya kamu';
    } else if (totalSkor <= 16){
      hasil = 'Keren Banget';
    }else{
      hasil = 'Wow energi kamu luar biasa';
    }
    return hasil;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            hasilText,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          TextButton(
            onPressed: resetKuis,
            child: Text('Tekan Untuk Mulai Lagi'),
            style: TextButton.styleFrom(
              primary: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}
