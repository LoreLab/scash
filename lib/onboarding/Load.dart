import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:scash/onboarding/dot_indicator.dart';
import 'package:scash/onboarding/page1.dart';
import 'package:scash/onboarding/page2.dart';
import 'package:scash/onboarding/page3.dart';
import 'package:scash/onboarding/page4.dart';
import 'package:scash/onboarding/page5.dart';


class _LoadState extends State<Load> {
  final _controller = new PageController();
  final List<Widget> _pages = [
    Page1(),
    Page2(),
    Page3(),
    Page4(),
    Page5(),
  ];
  int page = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.white,
        body: new Stack(
          children: <Widget>[
                new Positioned.fill(
                  child: new PageView.builder(
                    physics: new AlwaysScrollableScrollPhysics(),
                    controller: _controller,
                    itemCount: _pages.length,
                    itemBuilder: (BuildContext context, int index) {
                      return _pages[index % _pages.length];
                    },
                    onPageChanged: (int p){
                      setState(() {
                        page = p;
                      });
                    },
                  ),
                ),
                new Positioned(
                  bottom: 30.0,
                  left: 0.0,
                  right: 0.0,
                  child: new SafeArea(
                    child: new Column(
                      children: <Widget>[
                        new Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: new DotsIndicator(
                            controller: _controller,
                            itemCount: _pages.length,
                            onPageSelected: (int page) {
                              _controller.animateToPage(
                                page,
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.ease,
                              );
                            },
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            new Container(
                              width: 150.0,
                              height: 50.0,
                              decoration: BoxDecoration(
                                borderRadius: new BorderRadius.circular(5.0),
                                border: Border.all(color: Colors.green, width: 1.0),
                                color: Colors.transparent,
                              ),
                              child: new Material(
                                child: MaterialButton(
                                  child: Text('S\'INSCRIRE',
                                    style: Theme.of(context).textTheme.button.copyWith(color: Colors.grey),
                                  ),
                                  onPressed: (){Navigator.pushNamed(context, '/register');},
                                  highlightColor: Colors.green.withOpacity(0.5),
                                  splashColor: Colors.green.withOpacity(0.5),
                                ),
                                color: Colors.transparent,
                                borderRadius: new BorderRadius.circular(5.0),
                              ),
                            ),
                            new Container(
                              width: 150.0,
                              height: 50.0,
                              decoration: BoxDecoration(
                                borderRadius: new BorderRadius.circular(5.0),
                                border: Border.all(color: Colors.white, width: 1.0),
                                color: Color(0xFF17B296),
                              ),
                              child: new Material(
                                child: MaterialButton(
                                  child: Text('CONNEXION',
                                    style: Theme.of(context).textTheme.button.copyWith(color: Colors.white),
                                  ),
                                  onPressed: (){Navigator.of(context).pushNamed('/login');},
                                  highlightColor: Colors.green[400],
                                  splashColor: Colors.green[400],
                                ),
                                color: Color(0xFF17B296),
                                borderRadius: new BorderRadius.circular(5.0),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
    );
  }
}

class Load extends StatefulWidget {
  Load({Key key}) : super(key: key);

  @override
  _LoadState createState() => new _LoadState();
}