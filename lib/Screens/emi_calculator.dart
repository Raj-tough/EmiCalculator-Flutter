import 'package:flutter/material.dart';

class EmiCalculator extends StatefulWidget {
  @override
  _EmiCalculatorState createState() => _EmiCalculatorState();
}

enum Options { loanAmount, interest, period, emi }

class _EmiCalculatorState extends State<EmiCalculator> {

  Options _opt = Options.loanAmount;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.amber,
        title: Text('Emi Calculator',
          style: TextStyle(color:  Colors.black),
        ),
      ),
      body: Container(
        // width: MediaQuery.of(context).size.width,
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  width: 150,
                  child: Row(
                    children: [
                      Radio(
                        value: Options.loanAmount,
                        groupValue: _opt,
                        onChanged: (Options value) {
                          setState(() {
                            _opt = value;
                          });
                        },
                      ),
                      Text('Loan Amount'),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: 'Enter Loan Amount',
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  width: 150,
                  child: Row(
                    children: [
                      Radio(
                        value: Options.interest,
                        groupValue: _opt,
                        onChanged: (Options value) {
                          setState(() {
                            _opt = value;
                          });
                        },
                      ),
                      Text('Interest %'),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Enter Interest %',
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  width: 150,
                  child: Row(
                    children: [
                      Radio(
                        value: Options.period,
                        groupValue: _opt,
                        onChanged: (Options value) {
                          setState(() {
                            _opt = value;
                          });
                        },
                      ),
                      Text('Period'),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.2,
                        child: TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              labelText: 'Years'
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.2,
                        child: TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              labelText: 'Months'
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  width: 150,
                  child: Row(
                    children: [
                      Radio(
                        value: Options.emi,
                        groupValue: _opt,
                        onChanged: (Options value) {
                          setState(() {
                            _opt = value;
                          });
                        },
                      ),
                      Text('EMI'),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Enter EMI',
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  RaisedButton(
                    onPressed:
                      () {},
                    child: Text('Calculate'),
                    color: Colors.deepPurple,
                    textColor: Colors.white,
                  ),
                  RaisedButton(
                    onPressed:
                        () {},
                    child: Text('Reset'),
                    color: Colors.deepPurple,
                    textColor: Colors.white,
                  ),
                  RaisedButton(
                    onPressed:
                        () {},
                    child: Text('Details'),
                    color: Colors.deepPurple,
                    textColor: Colors.white,
                  )
                ],
              ),
            )

          ]
        ),
      ),
    );
  }
}
