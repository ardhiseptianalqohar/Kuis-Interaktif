import 'package:flutter/material.dart';
import './kuis.dart';
import './hasil.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _soalindex = 0;
  var totalSkor = 0;

  var pertanyaan = [
    {
      'pertanyaan': 'Tempat apa yang akan anda kunjungi?',
      'jawaban': [
        {'teks': 'Pegunungan', 'skor': 10},
        {'teks': 'Pantai', 'skor': 5},
        {'teks': 'Mall', 'skor': 3},
        {'teks': 'Hutan', 'skor': 7},
      ],
    },
    {
      'pertanyaan': 'Apa warna kesukaan anda?',
      'jawaban': [
        {'teks': 'Merah', 'skor': 7},
        {'teks': 'Biru', 'skor': 3},
        {'teks': 'Hijau', 'skor': 5},
        {'teks': 'Hitam', 'skor': 1},
      ],
    },
    {
      'pertanyaan': 'Apa hobby anda?',
      'jawaban': [
        {'teks': 'Sepak Bola', 'skor': 2},
        {'teks': 'Basket', 'skor': 3},
        {'teks': 'Berenang', 'skor': 6},
        {'teks': 'Ngoding', 'skor': 4},
      ]
    },
  ];

  void resetKuis() {
    setState(() {
      _soalindex = 0;
      totalSkor = 0;
    });
  }

  void _jawaban(int skor) {
    totalSkor = totalSkor + skor;
    setState(() {
      _soalindex += 1;
    });
    if (_soalindex < pertanyaan.length) {
      print('Masih Ada Soal Berikutnya');
    } else {
      print('Sudah Tidak Ada Soal Lagi!');
    }

    print(_soalindex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Kuis Interaktif'),
        ),
        body: _soalindex < pertanyaan.length
            ? Kuis(
                jawaban: _jawaban,
                pertanyaan: pertanyaan,
                soalIndex: _soalindex,
              )
            : Hasil(totalSkor, resetKuis),
      ),
    );
  }
}
