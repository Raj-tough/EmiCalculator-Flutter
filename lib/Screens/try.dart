import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EmiCalculator1 extends StatefulWidget {
  @override
  _EmiCalculator1State createState() => _EmiCalculator1State();
}

enum Options { loanAmount, interest, period, emi }

class _EmiCalculator1State extends State<EmiCalculator1> {

  var _opt = Options.loanAmount;

  bool _disabled = true;

  TextEditingController _loanAmountFieldController = TextEditingController();
  TextEditingController _interestFieldController = TextEditingController();
  TextEditingController _yearsFieldController = TextEditingController();
  TextEditingController _monthsFieldController = TextEditingController();
  TextEditingController _emiFieldController = TextEditingController();


  FocusNode _loanFieldFocusNode = FocusNode();

  _resetForm () {
    _loanAmountFieldController.text = '';
    _interestFieldController.text = '';
    _yearsFieldController.text= '';
    _monthsFieldController.text = '';
    _emiFieldController.text = '';
    // FocusScope.of(context).requestFocus(_loanFieldFocusNode);
    setState(() {
      _opt = Options.loanAmount;
    });
  }
  
  _checkInputs () {
    if(_loanAmountFieldController.text != '' && _interestFieldController.text != '' && _yearsFieldController.text != '' && _monthsFieldController.text != '' && _emiFieldController.text != '') {
      setState(() {
        _disabled = false;
      });
    } else {
      setState(() {
        _disabled = true;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loanAmountFieldController.addListener(_checkInputs);
    _interestFieldController.addListener(_checkInputs);
    _yearsFieldController.addListener(_checkInputs);
    _monthsFieldController.addListener(_checkInputs);
    _emiFieldController.addListener(_checkInputs);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    _loanAmountFieldController.dispose();
    _interestFieldController.dispose();
    _yearsFieldController.dispose();
    _monthsFieldController.dispose();
    _emiFieldController.dispose();
  }

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
                          onChanged: (value) {
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
                        // focusNode: _loanFieldFocusNode,
                        controller: _loanAmountFieldController,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(10),
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                        ],
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          errorText: !true ? 'asasd' : '',
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
                          onChanged: ( value) {
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
                        controller: _interestFieldController,
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
                          onChanged: ( value) {
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
                            controller: _yearsFieldController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                labelText: 'Years'
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.2,
                          child: TextField(
                            controller: _monthsFieldController,
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
                          onChanged: ( value) {
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
                        controller: _emiFieldController,
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
                      onPressed: _disabled ? null : () {},
                      disabledElevation: 3,
                      disabledColor: Colors.grey[300],
                      child: Text('Calculate', style: TextStyle(color: _disabled ?  Colors.grey[600] : Colors.white),),
                      color: Colors.deepPurple,
                      textColor: Colors.white,
                    ),
                    RaisedButton(
                      onPressed: _resetForm,
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
                    ),
                  ],
                ),
              ),
              // Table(
              //   children: [
              //     TableRow(children:
              //     [
              //       Text('Raja'),
              //       Text('Raja')
              //     ]
              //     )],
              //   border: TableBorder.all(width: 1),
              // )
            ]
        ),
      ),
    );
  }
}
