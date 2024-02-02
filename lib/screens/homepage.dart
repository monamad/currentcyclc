import 'package:currencyclc/helper/customBottom.dart';
import 'package:currencyclc/helper/customDropdownbutton.dart';
import 'package:currencyclc/helper/customTextfield.dart';
import 'package:currencyclc/service/getcoinsname.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GetcoinsData getcoinsData = GetcoinsData();
  late Future<List<String>> data;
  List<String>? data2;
  late CustomDropButton customDropButton;
  late CustomDropButton customDropButton2;
  double sum = 0.0;
  double addedvalue = 0;
  double result = 0;
  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    data = getcoinsData.getcoinsName();
    data2 = await data;

    setState(() {
      customDropButton = CustomDropButton(
        data2: data2!,
        selectedcoin: selectedcoin,
      );
      customDropButton2 = CustomDropButton(
        data2: data2!,
        selectedcoin: selectedcoin,
      );
      //print(customDropButton.getSelectedCoin);
    });
  }

  String selectedcoin = 'USD';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "coins calculator",
        ),
      ),
      body: ListView(children: [
        CustomText(
          onchanged: (String? result) {
            addedvalue = double.parse(result!);
          },
          hint: '$sum',
          textInputType: TextInputType.number,
          label: 'sum',
          obscureText: null,
        ),
        const SizedBox(
          height: 20,
        ),
        Center(
            child: (data2 == null)
                ? const CircularProgressIndicator(
                    semanticsLabel: 'Circular progress indicator',
                  )
                : customDropButton),
        const SizedBox(
          height: 20,
        ),
        CustomBottom(
            text: 'add',
            ontap: () async {
              double asDolor = await getcoinsData
                  .getAsDolor(customDropButton.getSelectedCoin);
              setState(() {
                sum = sum + (addedvalue / asDolor);
              });
              print(sum);
            }),
        const Divider(
          thickness: 2,
        ),
        Container(
          width: 80,
          height: 80,
          color: Colors.red.shade300,
          child: Center(
            child: Text(
              '$result',
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Center(
            child: (data2 == null)
                ? const CircularProgressIndicator(
                    semanticsLabel: 'Circular progress indicator',
                  )
                : customDropButton2),
        const SizedBox(
          height: 20,
        ),
        CustomBottom(
            text: 'calculate',
            ontap: () async {
              double asDolor = await getcoinsData
                  .getAsDolor(customDropButton2.getSelectedCoin);
              setState(() {
                result = result + (sum * asDolor);
              });
            })
      ]),
    );
  }
}
