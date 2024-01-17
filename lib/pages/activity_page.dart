import 'package:aitakata_app/models/activity.dart';
import 'package:aitakata_app/widgets/basic_checkbox.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ActivityPage extends StatefulWidget {
  const ActivityPage({super.key});

  @override
  State<ActivityPage> createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  double _progress = 0;

  final List<Activity> activityList = [
    Activity(title: 'Melakukan login harian di AITAKATA', isChecked: true),
    Activity(
        title: 'Makan makanan bergizi seimbang sesuai rekomendasi AITA',
        isChecked: false),
    Activity(title: 'Berolahraga 30 menit', isChecked: true),
    Activity(title: 'Tidak menghirup asap rokok', isChecked: false),
    Activity(title: 'Melakukan pemeriksaan di AITAKATA', isChecked: false),
    Activity(title: 'Tidur 7-8 jam sehari (kumulatif)', isChecked: true),
  ];

  void _calculateProgress() {
    int checked = 0;
    for (var activity in activityList) {
      if (activity.isChecked == true) {
        checked++;
      }
    }

    // setState(() {
    _progress = checked / activityList.length;
    // });
  }

  @override
  Widget build(BuildContext context) {
    _calculateProgress();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Container(
            alignment: Alignment.centerRight,
            child: const Image(
              image: AssetImage('assets/images/profile-photo.png'),
              alignment: Alignment.center,
            ),
          ),
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Nurul Izza',
                style: GoogleFonts.inter(fontSize: 14),
              ),
              Text(
                '29 tahun',
                style: GoogleFonts.inter(fontSize: 11),
              ),
            ],
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.history, color: Colors.black),
              // onPressed: () => Navigator.of(context).pop(),
              onPressed: () {},
            ),
          ],
        ),
        body: Column(
          children: [
            // kotak merah
            Container(
              width: double.infinity,
              color: const Color(0xFFFFEEED),
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Text(
                '''Lakukan semua rekomendasi to-do list aktivitas yang Aita
                  \nberikan agar gaya hidup kamu tetap sehat dan jauh dari potensi
                  \nkanker payudara!''',
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  height: 0.6,
                  fontSize: 12,
                  color: const Color(0xFF0A0A0A),
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text.rich(
                        TextSpan(
                          children: [
                            const WidgetSpan(
                              alignment: PlaceholderAlignment.middle,
                              child: Icon(
                                Icons.checklist_outlined,
                                color: Color(0xFF15CDC3),
                              ),
                            ),
                            const WidgetSpan(
                              child: SizedBox(width: 8.0),
                            ),
                            TextSpan(
                              text: 'To Do List',
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text.rich(
                        TextSpan(
                          children: [
                            const WidgetSpan(
                              alignment: PlaceholderAlignment.middle,
                              child: Icon(
                                Icons.keyboard_arrow_left_rounded,
                                color: Color(0xFF5B5B5B),
                                size: 22.0,
                              ),
                            ),
                            const WidgetSpan(
                              child: SizedBox(width: 4.0),
                            ),
                            TextSpan(
                              text: 'Kamis, 18 Januari 2024',
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            const WidgetSpan(
                              child: SizedBox(width: 4.0),
                            ),
                            const WidgetSpan(
                              alignment: PlaceholderAlignment.middle,
                              child: Icon(
                                Icons.keyboard_arrow_right_rounded,
                                color: Color(0xFF5B5B5B),
                                size: 22.0,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  LinearProgressIndicator(
                    value: _progress,
                    semanticsLabel: 'To do list progress bar',
                    minHeight: 8.0,
                    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                    color: const Color(0xFF15CDC3),
                  ),
                  const SizedBox(height: 10.0),
                  // ignore: sized_box_for_whitespace
                  Container(
                    width: double.infinity,
                    child: Text(
                      '80% selesai',
                      textAlign: TextAlign.end,
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ...activityList.map(
                        (activity) => BasicCheckbox(
                          title: activity.title,
                          isChecked: activity.isChecked,
                          onCheck: _calculateProgress,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
