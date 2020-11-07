import 'package:control_do_dinheiro/app/pages/registrar_venda/componenets/trabalhador_mini_item.dart';
import 'package:control_do_dinheiro/core/modules/entitys/trabalhador.dart';
import 'package:flutter/material.dart';

class EscolherTrabalhador extends StatefulWidget {
  EscolherTrabalhador({
    Key key,
    @required this.trabalhadores,
    @required this.trabalhadoresSelecionados,
    this.only = false,
  }) : super(key: key);

  final List<Trabalhador> trabalhadores;
  final List<Trabalhador> trabalhadoresSelecionados;
  final bool only;
  @override
  _EscolherTrabalhadorState createState() => _EscolherTrabalhadorState();
}

class _EscolherTrabalhadorState extends State<EscolherTrabalhador> {
  bool isSelecionado(Trabalhador trabalhador) {
    return widget.trabalhadoresSelecionados.contains(trabalhador);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Center(
      child: SizedBox(
        width: size.width * .8,
        height: size.height * .5,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Scaffold(
            backgroundColor: Colors.white,
            body: Container(
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: widget.trabalhadores.length,
                      itemBuilder: (context, index) {
                        var trabalhador = widget.trabalhadores[index];
                        return TrabalhadorMiniItem(
                          trabalhador: trabalhador,
                          isSelected: isSelecionado(trabalhador),
                          onPressed: () {
                            if (widget.only) {
                              setState(() {
                                widget.trabalhadoresSelecionados.clear();
                                widget.trabalhadoresSelecionados
                                    .add(trabalhador);
                              });
                            } else {
                              setState(() {
                                if (widget.trabalhadoresSelecionados
                                    .contains(trabalhador)) {
                                  widget.trabalhadoresSelecionados
                                      .remove(trabalhador);
                                } else {
                                  widget.trabalhadoresSelecionados
                                      .add(trabalhador);
                                }
                              });
                            }
                          },
                        );
                      },
                    ),
                  ),
                  FlatButton(
                    child: Text('Concluido'),
                    onPressed: () {
                      Navigator.pop(context, widget.trabalhadoresSelecionados);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
