import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:test_search/detail.dart';
import 'package:test_search/main.controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coding test',
      theme: ThemeData(
        fontFamily: "Quicksand",
        primarySwatch: Colors.deepPurple,
      ),
      home: const MyHomePage(title: 'Root view controller'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _fbKey = GlobalKey<FormBuilderState>();
  final SearchController _controller = SearchController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          widget.title,
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.w600),
        )),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FormBuilder(
              key: _fbKey,
              child: Center(
                  child: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                  Container(
                    padding: EdgeInsets.only(left: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xffBBBBBBF),
                    ),
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.055,
                    child: FormBuilderTextField(
                      cursorColor: Colors.black,
                      name: 'search',
                      decoration: InputDecoration(
                        hintText: 'GitHubのリポジトリ',
                        suffixIcon: InkWell(
                              child: MaterialButton(
                                onPressed: (){
                                  if(_fbKey.currentState!.saveAndValidate()){
                                    _fbKey.currentState!.reset();
                                  }
                                },
                                child: Icon(
                                  Icons.clear,
                                  size: 18,
                                  color: Colors.black87,

                                ),
                              ),
                            ),

                        border: InputBorder.none,
                      ),
                      onChanged: (dynamic val) async {
                        if (val != "") {
                          await _controller.fetchData(val.toString());
                        } else {
                          _controller.repoData.clear();
                        }
                        setState(() {});
                      },
                    ),
                  ),
                ],
              ))),
          Expanded(
              child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.06),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...List.generate(
                      _controller.repoData.length,
                      (index) => FlatButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            print(_controller.repoData[index]['full_name']);
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => RepoDetail(_controller.repoData[index])),
                            );
                          },
                          child: Container(
                              child: Text(
                            _controller.repoData[index]['full_name'].toString().trim(),
                            style: TextStyle(fontSize: 16),
                          ),
                          ),
                      )
                  )
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}
