import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:the_silent_void/app/utils/custom_color.dart';

class BugPage extends StatefulWidget {
  const BugPage({Key? key}) : super(key: key);

  @override
  _BugPageState createState() => _BugPageState();
}

class _BugPageState extends State<BugPage> {
  String? selectedOption;

  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0, 30),
          end: Offset(0, 0),
        ),
      ],
    ),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff353545),
      appBar: AppBar(
        backgroundColor: Color(0xff353545),
        automaticallyImplyLeading: false,
        title: Text(
          'Submit Ticket',
          style: TextStyle(color: Colors.white),
        ),
        actions: [],
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome to support',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'ShareTech',
                    fontSize: 28,
                    fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                child: Text(
                  'Submit a Ticket',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'ShareTech',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    DropdownButtonFormField2<String>(
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsetsDirectional.fromSTEB(0, 16, 0, 16),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.amber,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.red,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blue,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      value: selectedOption,
                      items: [
                        DropdownMenuItem(
                          child: Container(
                            child: Text(
                              'Crashes',
                              style: TextStyle(
                                  color: Colors
                                      .white), // Ganti warna teks saat dipilih
                            ),
                          ),
                          value: 'Crashes',
                        ),
                        DropdownMenuItem(
                          child: Container(
                            child: Text(
                              'Kinerja',
                              style: TextStyle(
                                  color: Colors
                                      .white), // Ganti warna teks saat dipilih
                            ),
                          ),
                          value: 'Kinerja',
                        ),
                        DropdownMenuItem(
                          child: Container(
                            child: Text(
                              'Kompatibilitas',
                              style: TextStyle(
                                  color: Colors
                                      .white), // Ganti warna teks saat dipilih
                            ),
                          ),
                          value: 'Kompatibilitas',
                        ),
                        DropdownMenuItem(
                          child: Container(
                            child: Text(
                              'Jaringan',
                              style: TextStyle(
                                  color: Colors
                                      .white), // Ganti warna teks saat dipilih
                            ),
                          ),
                          value: 'Jaringan',
                        ),
                        DropdownMenuItem(
                          child: Container(
                            child: Text(
                              'UI/UX Issue',
                              style: TextStyle(
                                  color: Colors
                                      .white), // Ganti warna teks saat dipilih
                            ),
                          ),
                          value: 'UI/UX Issue',
                        ),
                      ],
                      validator: (value) {
                        if (value == null) {
                          return 'Please select option !';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          selectedOption = value;
                        });
                      },
                      buttonStyleData: const ButtonStyleData(
                        padding: EdgeInsets.only(right: 15),
                      ),
                      iconStyleData: const IconStyleData(
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: Colors.white,
                        ),
                        iconSize: 24,
                      ),
                      dropdownStyleData: DropdownStyleData(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.blueGrey,
                        ),
                      ),
                      hint: Text(
                        'Pilih jenis issue atau bugs !',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),

                    //TEXT FIELD TITLE
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      autofocus: false,
                      obscureText: false,
                      style: TextStyle(color: Colors.white),
                      cursorColor: Colors.amber,
                      decoration: InputDecoration(
                        hintText: 'Judul Title',
                        hintStyle: TextStyle(color: Colors.grey),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 2, color: Colors.amber),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        contentPadding:
                            EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),

                    //TEXT FIELD DESKRIPTION
                    TextFormField(
                      autofocus: false,
                      obscureText: false,
                      decoration: InputDecoration(
                        hintText: 'Short Description of what is going on...',
                        hintStyle: TextStyle(color: Colors.grey),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.amber,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.red,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blue,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        contentPadding:
                            EdgeInsetsDirectional.fromSTEB(16, 24, 16, 12),
                      ),
                      style: TextStyle(
                          color: Colors
                              .white), // Custom warna Text didalam Textfiled
                      maxLines: 16,
                      minLines: 6,
                      cursorColor: Colors.amber,
                    ),

                    //UPLOUD FILE SS
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                      child: Container(
                        width: double.infinity,
                        constraints: BoxConstraints(
                          maxWidth: 500,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Colors.grey,
                            width: 2,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Icon(
                                Icons.add_a_photo_rounded,
                                color: Colors.black,
                                size: 32,
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                                child: Text(
                                  'Upload Screenshot',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ).animateOnPageLoad(
                        animationsMap['containerOnPageLoadAnimation']!,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 12),
                      child: FFButtonWidget(
                        onPressed: () {
                          print('Button pressed ...');
                        },
                        text: 'Submit Ticket',
                        icon: Icon(
                          Icons.receipt_long,
                          size: 15,
                        ),
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 48,
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                          iconPadding:
                              EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                          color: ColorUtils.button.color,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Readex Pro',
                                    color: Colors.white,
                                  ),
                          elevation: 4,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(60),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
