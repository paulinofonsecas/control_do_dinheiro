import 'package:flutter/material.dart';

class CustomDropdownMenu extends StatelessWidget {
  const CustomDropdownMenu({
    Key key,
    @required this.nomes,
  }) : super(key: key);

  final List<String> nomes;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      onChanged: (value) {},
      value: nomes[0],
      style: TextStyle(
        color: Colors.white,
        fontSize: 17,
      ),
      dropdownColor: Colors.red,
      items: nomes
          .map(
            (nome) => DropdownMenuItem(
              value: nome,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(90),
                      ),
                    ),
                    SizedBox(width: 20),
                    Text(nome),
                  ],
                ),
              ),
              onTap: () {},
            ),
          )
          .toList(),
    );
  }
}
