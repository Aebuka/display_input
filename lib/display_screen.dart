import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DisplayInput extends StatefulWidget {
  const DisplayInput({Key key}) : super(key: key);

  @override
  _DisplayInputState createState() => _DisplayInputState();
}

class _DisplayInputState extends State<DisplayInput> {
  bool _istextDisplayed = false;
  final textInput = TextEditingController();

  @override
  void initState() {
    super.initState();
    print('Aebeauka');
    textInput.addListener(_clearUserInput);
  }

  void _clearUserInput() {
    _istextDisplayed = false;
  }

  @override
  void dispose() {
    textInput.dispose();
    super.dispose();
  }

  Widget reflectedText() {
    return _istextDisplayed == true
        ? Card(
            color: Color(0xFF231717),
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                      flex: 2,
                      child: Wrap(children: [
                        Text(textInput.text,
                            style: GoogleFonts.openSans(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Colors.white))
                      ])),
                ],
              ),
            ))
        : Text('');
  }

  @override
  Widget build(BuildContext context) {
    Size ssizeOfScreen = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFF2E2B40D),
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: ssizeOfScreen.height),
            child: SingleChildScrollView(
              physics: ClampingScrollPhysics(),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InputTextField(controller: textInput),
                        InkWell(
                          onTap: () => setState(() {
                            _istextDisplayed = true;
                          }),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 50,
                            margin: EdgeInsets.only(top: 5.0),
                            padding: EdgeInsets.all(5.0),
                            decoration: BoxDecoration(color: Color(0xFF231717)),
                            child: Center(
                              child: Text(
                                'Submit',
                                style: GoogleFonts.openSans(
                                    fontSize: 15,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 30),
                        reflectedText(),
                      ],
                    ),
                    Image(
                      image: AssetImage('images/I4G.png'),
                      height: 40,
                      width: 80,
                    ),
                    Image(
                      image: AssetImage('images/zuri.png'),
                      height: 40,
                      width: 80,
                    ),
                    Image(
                      image: AssetImage('images/hng.png'),
                      height: 40,
                      width: 100,
                    )
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}

class InputTextField extends StatelessWidget {
  InputTextField({this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: 'Enter text',
          hintStyle: GoogleFonts.openSans(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFFBDBDBD)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
          contentPadding: EdgeInsets.all(5.0),
          fillColor: const Color(0xFFF6F6F6),
          filled: true,
        ),
      ),
    );
  }
}
