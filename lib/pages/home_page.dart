import 'package:flutter/material.dart';
import '../utils/math.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController aController = TextEditingController();
  TextEditingController bController = TextEditingController();
  TextEditingController cController = TextEditingController();
  TextEditingController resultController = TextEditingController();

  String get validateForm {
    String a = aController.text.trim();
    String b = bController.text.trim();
    String c = cController.text.trim();

    if ((a == '') || (b == '') || (c == '')) {
      return 'Field is required';
    }

    try {
      double.parse(a);
      double.parse(b);
      double.parse(c);
    } on FormatException {
      return 'Field must be a number';
    }

    // if (double.parse(a) == 0.0) {
    //   return 'a must be not equal 0';
    // }

    return 'success';
  }

  @override
  void initState() {
    super.initState();
    resultController.text = 'Result';
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0)
                .copyWith(top: 40.0),
            child: Column(
              children: [
                const Text(
                  'a*x2 + b*x + c = 0',
                  style: TextStyle(color: Colors.blue, fontSize: 22.0),
                ),
                const SizedBox(height: 30.0),
                TextField(
                  controller: aController,
                  decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 16.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0)),
                    hintText: 'Input a',
                    hintStyle: TextStyle(color: Colors.grey.withOpacity(0.8)),
                    labelText: 'Input a',
                  ),
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 18.0),
                TextField(
                  controller: bController,
                  decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 16.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0)),
                    hintText: 'Input b',
                    hintStyle: TextStyle(color: Colors.grey.withOpacity(0.8)),
                    labelText: 'Input b',
                  ),
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 18.0),
                TextField(
                  controller: cController,
                  decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 16.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0)),
                    hintText: 'Input c',
                    hintStyle: TextStyle(color: Colors.grey.withOpacity(0.8)),
                    labelText: 'Input c',
                  ),
                  textInputAction: TextInputAction.done,
                ),
                const SizedBox(height: 36.0),
                ElevatedButton(
                  onPressed: () {
                    if (validateForm == 'success') {
                      double a = double.parse(aController.text.trim());
                      double b = double.parse(bController.text.trim());
                      double c = double.parse(cController.text.trim());

                      List<double>? result =
                          Math.giaiPhuongTrinhBacHai(a: a, b: b, c: c);

                      String resultStr;
                      if (result == null) {
                        resultStr = 'Phương trình vô số nghiệm';
                      } else if (result.isEmpty) {
                        resultStr = 'Phương trình vô nghiệm';
                      } else if (result.length == 1) {
                        resultStr = 'x1 = x2 = ${result[0].toStringAsFixed(4)}';
                      } else {
                        resultStr =
                            'x1 = ${result[0].toStringAsFixed(4)},  x2 = ${result[1].toStringAsFixed(4)}';
                      }

                      setState(() {
                        resultController.text = resultStr;
                      });
                    } else {
                      final snackBar = SnackBar(
                        content: Text('$validateForm 😐'),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.grey)),
                  child: const Text(
                    'Calculate',
                    style: TextStyle(color: Colors.yellow, fontSize: 16.8),
                  ),
                ),
                const SizedBox(height: 18.0),
                TextField(
                  controller: resultController,
                  readOnly: true,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
