import 'package:flutter/material.dart';

class BotaoParaSelecionarADataDeNascimento extends StatefulWidget {
  Function onTap;
  DateTime date;

  BotaoParaSelecionarADataDeNascimento({
    Key key,
    this.onTap,
    this.date,
  }) : super(key: key);

  @override
  _BotaoParaSelecionarADataDeNascimentoState createState() =>
      _BotaoParaSelecionarADataDeNascimentoState();
}

class _BotaoParaSelecionarADataDeNascimentoState
    extends State<BotaoParaSelecionarADataDeNascimento> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 20),
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(.05),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.white,
          ),
        ),
        child: Center(
          child: Text(
            widget.date != null
                ? 'Nascido em ${widget.date.toString().substring(0, 12 - 1)}'
                : 'Selecionar a data de nascimento',
            style: TextStyle(
              fontSize: 18,
              color: selecionado ? Colors.greenAccent : Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  bool get selecionado => widget.date != null;
}
