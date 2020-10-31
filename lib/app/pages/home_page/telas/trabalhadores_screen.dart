import 'package:control_do_dinheiro/app/pages/home_page/telas/resgistros_screen.dart';
import 'package:flutter/material.dart';

class TrabalhadoresScreen extends StatefulWidget {
  const TrabalhadoresScreen({
    Key key,
  }) : super(key: key);

  @override
  _TrabalhadoresScreenState createState() => _TrabalhadoresScreenState();
}

class _TrabalhadoresScreenState extends State<TrabalhadoresScreen>
    with SingleTickerProviderStateMixin {
  PageController _pageViewController;

  @override
  void initState() {
    _pageViewController = PageController(
      viewportFraction: .7,
      initialPage: 1,
      keepPage: false,
    );
    super.initState();
  }

  var scale = 1.0;
  var gndex = 1;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            children: [
              CustomAppBar(
                title: 'Trabalhadores',
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.stacked_line_chart,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Container(
                width: double.infinity,
                height: 500,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 28.0),
                  child: PageView.builder(
                    controller: _pageViewController,
                    scrollDirection: Axis.horizontal,
                    itemCount: 8,
                    itemBuilder: (_, index) => TrabalhadorItem(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TrabalhadorItem extends StatelessWidget {
  const TrabalhadorItem({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * .60,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.06),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/profile.JPG'),
              ),
            ),
            width: 200,
            height: 200,
          ),
          Text(
            'Paulino Ciaia',
            style: TextStyle(
              fontSize: 22,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
