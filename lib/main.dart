import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main (){
  runApp(MaterialApp(
    home: HomePage(),
    debugShowCheckedModeBanner: false,
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  TextEditingController _controller1 = new TextEditingController();
  TextEditingController _controller2 = new TextEditingController();
  TextEditingController _controller3 = new TextEditingController();
  double? interest;
  double? total;

  // _controller.text is Amount
  // _controller2.text is Interest Rate
  // _controller3.text is Period

  void calculation(){
    final calinterestrate = (double.parse(_controller2.text)/100/12) * int.parse(_controller3.text);
    final calinterest = calinterestrate * int.parse(_controller1.text);
    setState(() {
      interest = calinterest;
      total = int.parse(_controller1.text) + interest!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.notes,
          size: 30,
          color: Colors.white,
        ),
        toolbarHeight: 50,
        backgroundColor: Colors.blue,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: Icon(
              Icons.info,
              size: 30,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: ListView(children: [
        Body(),
        SizedBox(height: 40)
      ]),
    );
  }

  Widget Body(){
    return Container(
      color: Colors.grey[100],
      child: Column(
        children: [
          Container(
            height: 170,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(100)
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Align(
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Fixed Deposit',
                      style: GoogleFonts.robotoMono(
                        fontSize: 35,
                        color: Colors.white
                      ),
                    ),
                    Text(
                      'Calculator',
                      style: GoogleFonts.robotoMono(
                          fontSize: 35,
                          color: Colors.white
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 10, 40, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InputForm(title: 'Deposit Amount: ', controller: _controller1, hintText: 'e.g 20000'),
                InputForm(title: 'Annual Interest Rate(%): ', controller: _controller2, hintText: 'e.g 3'),
                InputForm(title: 'Period(in month): ', controller: _controller3, hintText: 'e.g 3'),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: (){
                    calculation();
                  },
                  child: Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Center(
                      child: Text(
                        'CALCULATE',
                        style: GoogleFonts.robotoMono(
                          fontSize: 25,
                          color: Colors.white)
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                interest != null
                ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        'Result: ',
                        style: GoogleFonts.robotoMono(fontSize: 20)
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: Text(
                          'Interest: Rp' + interest!.toStringAsFixed(2),
                          style: GoogleFonts.robotoMono(fontSize: 20)
                      ),
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: Text(
                          'Total: Rp' + total!.toStringAsFixed(2),
                          style: GoogleFonts.robotoMono(fontSize: 20)
                      ),
                    ),
                  ],
                ) : SizedBox(),
              ],
            ),
          )
        ],
      ),
    );
  }
  
  Widget InputForm({required String title, required TextEditingController controller, required String hintText}){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.robotoMono(fontSize: 20),
        ),
        SizedBox(height: 5),
        Container(
          height: 60,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(borderSide: BorderSide.none),
              hintText: hintText
            ),
          ),
        ),
        SizedBox(height: 10)
      ],
    );
  }
}
