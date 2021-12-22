import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'Pref_controller.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _counter = PrefController().counter;
  String _content = PrefController().content;
  //String _content = 'استغفر الله العظيم';

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              ++_counter;
              PrefController().saveCounter(counter: _counter);
            });
          },
          child: Icon(
            Icons.add,
            color: Colors.white,
            size: 30,
          ),
          backgroundColor: Colors.teal.shade500,
        ),
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: Text(
            'سبحة الأذكار',
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 30,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            PopupMenuButton<int>(
              onSelected: (int value) {
                switch (value) {
                  case 1:
                    _changeContent(newContent: 'استغفر الله العظيم');
                    PrefController().saveContent(content: _content);
                    break;
                  case 2:
                    _changeContent(newContent: 'سبحان الله وبحمده');
                    PrefController().saveContent(content: _content);
                    break;
                  case 3:
                    _changeContent(newContent: 'لا اله الا الله');
                    PrefController().saveContent(content: _content);
                    break;
                }
              },
              itemBuilder: (context) {
                return [
                  PopupMenuItem(
                    value: 1,
                    child: Text(
                      'استغفر الله العظيم',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  PopupMenuItem(
                    value: 2,
                    child: Text(
                      'سبحان الله وبحمده',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  PopupMenuItem(
                    value: 3,
                    child: Text(
                      'لا اله الا الله',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ];
              },
            ),
          ],
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: AlignmentDirectional.topStart,
              end: AlignmentDirectional.bottomEnd,
              colors: [
                Colors.teal.shade100,
                Colors.teal.shade400,
                Colors.teal.shade700,
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                 backgroundImage: AssetImage('Tasbih.jpg'),
                radius: 50,
              ),
              SizedBox(
                height: 10,
              ),
              Card(
                margin: EdgeInsets.only(bottom: 30),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                clipBehavior: Clip.antiAlias,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        _content,
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      alignment: AlignmentDirectional.center,
                      decoration: BoxDecoration(
                        color: Colors.teal,
                      ),
                      child: Text(
                        _counter.toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 25,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 40, horizontal: 50),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            ++_counter;
                            PrefController().saveCounter(counter: _counter);
                          });
                        },
                        child: Text(
                          'تسبيح',
                          style: TextStyle(
                            //color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 25,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.teal.shade600,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _counter =0;


                          });
                        },
                        child: Text(
                          'اعادة',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 25,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.teal.shade300,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _changeContent({required String newContent}) {
    if (_content != newContent) {
      setState(() {
        _content = newContent;
        _counter = 0;
      });
    }
  }
}
