import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const double _kItemExtent = 32.0;

const _weeks = [
  '1',
  '2',
  '3',
  '4',
];

class ToDoDetail extends StatefulWidget {
  static const path = 'detail';

  const ToDoDetail({super.key});

  @override
  State<StatefulWidget> createState() => _ToDoDetailState();
}

class _ToDoDetailState extends State<ToDoDetail> {
  // 選択した週
  int _selectedFruit = 0;

  // メモ欄のコントローラー
  TextEditingController noteArea = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Rough Scheduler'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('タイトル', style: Theme.of(context).textTheme.headline6),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                    decoration: InputDecoration(
                  border: OutlineInputBorder(),
                )),
              ),
              const SizedBox(height: 8, child: Spacer()),
              Text('通知', style: Theme.of(context).textTheme.headline6),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text('Selectd Fruit:'),
                    OutlinedButton(
                      onPressed: () => _showDialog(
                        Row(
                          children: [
                            Expanded(
                              child: CupertinoPicker(
                                magnification: 1.22,
                                squeeze: 1.2,
                                useMagnifier: true,
                                itemExtent: _kItemExtent,
                                onSelectedItemChanged: (int selectedIndex) {
                                  setState(() {
                                    _selectedFruit = selectedIndex;
                                  });
                                },
                                looping: true,
                                children: List<Widget>.generate(_weeks.length,
                                    (index) {
                                  return Center(
                                      child: Text('${_weeks[index]}ヶ月'));
                                }),
                              ),
                            ),
                            Expanded(
                              child: CupertinoPicker(
                                magnification: 1.22,
                                squeeze: 1.2,
                                useMagnifier: true,
                                itemExtent: _kItemExtent,
                                onSelectedItemChanged: (int selectedIndex) {
                                  setState(() {
                                    _selectedFruit = selectedIndex;
                                  });
                                },
                                looping: true,
                                children: List<Widget>.generate(_weeks.length,
                                    (index) {
                                  return Center(
                                      child: Text('${_weeks[index]}週'));
                                }),
                              ),
                            )
                          ],
                        ),
                      ),
                      child: Text(_weeks[_selectedFruit]),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 8, child: Spacer()),
              Text('メモ', style: Theme.of(context).textTheme.headline6),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: noteArea,
                  keyboardType: TextInputType.multiline,
                  maxLines: 4,
                  decoration:
                      const InputDecoration(border: OutlineInputBorder()),
                ),
              )
            ],
          ),
        ));
  }

  // This shows a CupertinoModalPopup with a reasonable fixed height which hosts CupertinoPicker.
  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(
        context: context,
        builder: (BuildContext context) => Container(
              height: 216,
              padding: const EdgeInsets.only(top: 6.0),
              // The Bottom margin is provided to align the popup above the system navigation bar.
              margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              // Provide a background color for the popup.
              color: CupertinoColors.systemBackground.resolveFrom(context),
              // Use a SafeArea widget to avoid system overlaps.
              child: SafeArea(
                top: false,
                child: child,
              ),
            ));
  }
}
