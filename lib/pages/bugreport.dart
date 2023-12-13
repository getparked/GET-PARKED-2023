import 'package:flutter/material.dart';

class Bugreport extends StatefulWidget {
  const Bugreport({Key? key}) : super(key: key);

  @override
  _BugreportState createState() => _BugreportState();
}

class _BugreportState extends State<Bugreport> {
  late TextEditingController _textController1;
  late TextEditingController _textController2;
  late FocusNode _textFieldFocusNode1;
  late FocusNode _textFieldFocusNode2;

  @override
  void initState() {
    super.initState();
    _textController1 = TextEditingController();
    _textFieldFocusNode1 = FocusNode();
    _textController2 = TextEditingController();
    _textFieldFocusNode2 = FocusNode();
  }

  @override
  void dispose() {
    _textController1.dispose();
    _textFieldFocusNode1.dispose();
    _textController2.dispose();
    _textFieldFocusNode2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          // start of app bar
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Color(0xFF0B191E),
              size: 30,
            ),
            onPressed: () {
              Navigator.of(context).pop();        // return to previous page
            },
          ),
          title: Text(
            'Report a Bug',
            style: TextStyle(         // text charateristics
              fontFamily: 'Urbanist',
              color: Color(0xFF0B191E),
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Create Bug Report',
                    style: TextStyle(
                      fontFamily: 'Urbanist',
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 4),
                    child: Text(
                      'Fill out the form below to submit a ticket.',
                      style: TextStyle(
                        fontFamily: 'Urbanist',
                        fontSize: 16,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                  SizedBox(height: 12),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Bug Name...',
                    ),
                    cursorColor: Colors.blue,
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: _textController2,
                    focusNode: _textFieldFocusNode2,
                    maxLines: 6,
                    minLines: 4,
                    decoration: InputDecoration(
                      labelText: 'Short Description of what is going on...',
                    ),
                    cursorColor: Colors.blue,
                  ),
                  SizedBox(height: 16),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      'https://storage.googleapis.com/getparked/logo.png',
                      width: double.infinity,
                      height: 100,
                      fit: BoxFit.cover,      // stretch to fit dimensions of screen
                    ),
                  ),
                  SizedBox(height: 16),
                  Container(
                    width: double.infinity,
                    constraints: BoxConstraints(maxWidth: 500),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Colors.black54,
                        width: 2,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Row(
                        children: [
                          Icon(
                            Icons.add_a_photo_rounded,
                            color: Colors.blue,
                            size: 32,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              'Upload Screenshot',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black54,        // fake screenshot bar
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {
                      print('Button pressed ...');        // submit ticket on press of button. No place to submit ticket
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.receipt_long,
                          size: 15,
                        ),
                        SizedBox(width: 8),
                        Text('Submit Ticket'),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      padding:
                          EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
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
