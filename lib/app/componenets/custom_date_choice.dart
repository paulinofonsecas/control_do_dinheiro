import 'package:flutter/material.dart';

class CustomDateChoicer extends StatefulWidget {
  const CustomDateChoicer({
    Key key,
    @required this.dateTextController,
  }) : super(key: key);

  final TextEditingController dateTextController;

  @override
  _CustomDateChoicerState createState() => _CustomDateChoicerState();
}

class _CustomDateChoicerState extends State<CustomDateChoicer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: GestureDetector(
        onTap: () async {
          var data = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1960),
            lastDate: DateTime(2021),
          );
          if (data == null) return;
          setState(() {
            var ano = data.year;
            var mes = data.month;
            var dia = data.day;
            widget.dateTextController.text = '$ano-$mes-$dia';
          });
        },
        child: TextField(
          controller: widget.dateTextController,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
          ),
          decoration: InputDecoration(
            labelText: 'Data de nascimento',
            labelStyle: TextStyle(
              color: Colors.white,
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: Colors.white,
              ),
            ),
          ),
          enabled: false,
        ),
      ),
    );
  }
}