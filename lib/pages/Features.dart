import 'package:flutter/material.dart';



class features extends StatefulWidget {
  const features({super.key});

  @override 
  _featuresState createState() => _featuresState();
}

class _featuresState extends State<features> {
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
      onTap: () => _textFieldFocusNode1.canRequestFocus
          ? FocusScope.of(context).requestFocus(_textFieldFocusNode1)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Color(0xFF0B191E),
              size: 30,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: Text(
            'Suggest a Feature',
            style: TextStyle(
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
                    'Create Feature Report',
                    style: TextStyle(
                      fontFamily: 'Urbanist',
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 4),
                    child: Text(
                      'Fill out the form below to submit a ticket.',
                      style: TextStyle(
                        fontFamily: 'Urbanist',
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    child: TextFormField(
                      controller: _textController1,
                      focusNode: _textFieldFocusNode1,
                      decoration: InputDecoration(
                        labelText: 'Feature name...',
                        labelStyle: TextStyle(
                          fontFamily: 'Outfit',
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                        hintText: 'Feature name...',
                        hintStyle: TextStyle(
                          fontSize: 14,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey[400]!,
                            width: 2,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blue,
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    child: TextFormField(
                      controller: _textController2,
                      focusNode: _textFieldFocusNode2,
                      decoration: InputDecoration(
                        labelText: 'Short Description...',
                        labelStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        hintText: 'Short Description of how it works..',
                        hintStyle: TextStyle(
                          fontSize: 14,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey[400]!,
                            width: 2,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blue,
                            width: 2,
                          ),
                        ),
                      ),
                      maxLines: 6,
                      minLines: 3,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: Container(
                      width: double.infinity,
                      constraints: BoxConstraints(
                        maxWidth: 500,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Colors.grey[400]!,
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
                              padding: EdgeInsets.only(left: 16),
                              child: Text(
                                'Upload Screenshot',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 24, bottom: 12),
                    child: ElevatedButton(
                      onPressed: () {
                        print('Button pressed ...');
                        

                        
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
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
                        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                        textStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
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

void main() {
  runApp(MaterialApp(
    home: features(),
  ));
}