import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

enum Options { loanAmount, interest, period, emi }

class EmiCalculator extends HookWidget {

  // Options _opt = Options.loanAmount;

  @override
  Widget build(BuildContext context) {

    var _opt = useState(Options.loanAmount);

    TextEditingController _loanAmountFieldController = TextEditingController();
    _loanAmountFieldController.addListener(() { print('loan -> ' +_loanAmountFieldController.text);});

    TextEditingController _interestFieldController = TextEditingController();
    _interestFieldController.addListener(() { print(_interestFieldController.text);});

    TextEditingController _yearsFieldController = TextEditingController();
    _yearsFieldController.addListener(() { print(_yearsFieldController.text);});

    TextEditingController _monthsFieldController = TextEditingController();
    _monthsFieldController.addListener(() { print(_monthsFieldController.text);});

    TextEditingController _emiFieldController = TextEditingController();
    _emiFieldController.addListener(() { print(_emiFieldController.text);});

    FocusNode _loanFieldFocusNode = FocusNode();

    _resetForm () {
      _loanAmountFieldController.text = '';
      _interestFieldController.text = '';
      _yearsFieldController.text= '';
      _monthsFieldController.text = '';
      _emiFieldController.text = '';
      // FocusScope.of(context).requestFocus(_loanFieldFocusNode);
    }

    final _disabled = useState(true);
    
    useEffect(() {
      return () {
        _loanAmountFieldController.dispose();
        _interestFieldController.dispose();
      };
    }, []);
    // ignore: missing_return
    useEffect(() {
      print(_opt.value);
    }, [_opt.value]);

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
                          groupValue: _opt.value,
                          onChanged: (value) {
                            _opt.value = value;
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
                        focusNode: _loanFieldFocusNode,
                        controller: _loanAmountFieldController,
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
                          groupValue: _opt.value,
                          onChanged: ( value) {
                            _opt.value = value;
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
                          groupValue: _opt.value,
                          onChanged: ( value) {
                            _opt.value = value;
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
                          groupValue: _opt.value,
                          onChanged: ( value) {
                            _opt.value = value;
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
                      onPressed: _disabled.value ? null : () {},
                      disabledElevation: 3,
                      disabledColor: Colors.grey[400],
                      child: Text('Calculate', style: TextStyle(color: Colors.grey[600]),),
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
              )

            ]
        ),
      ),
    );
  }
}

