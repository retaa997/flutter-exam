import 'package:doctor/models/patient.dart';
import 'package:flutter/material.dart';

class CustomListTile extends StatefulWidget {
  final List<Patient> patientData;
  final int index;
  const CustomListTile(
      {super.key, required this.patientData, required this.index});

  @override
  State<CustomListTile> createState() => _CustomListTileState();
}

class _CustomListTileState extends State<CustomListTile> {
  @override
  Widget build(BuildContext context) {
    List<String> firstAndLast =
        widget.patientData[widget.index].name.split(" ");
    String name = '${firstAndLast[0]} ${firstAndLast[1][0]}.';
    return ListTile(
      contentPadding: EdgeInsets.all(0),
      leading: CircleAvatar(
        backgroundImage: AssetImage(widget.patientData[widget.index].image),
      ),
      title: Text(
        name,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: Text(
        '${widget.patientData[widget.index].time} · ${widget.patientData[widget.index].problem}',
        style:
            const TextStyle(fontWeight: FontWeight.w400, color: Colors.black),
      ),
    );
  }
}
