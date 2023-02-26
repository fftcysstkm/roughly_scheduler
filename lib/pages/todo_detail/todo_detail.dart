import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const double _kItemExtent = 32.0;

const _weeks = [
  '0',
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

  // 繰り返すかのチェック状態
  bool _checked = true;

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
          padding: const EdgeInsets.all(24.0),
          child: SingleChildScrollView(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('タイトル', style: Theme.of(context).textTheme.headline6),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                    decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                )),
              ),
              const SizedBox(height: 8, child: Spacer()),
              Text('お知らせ間隔', style: Theme.of(context).textTheme.headline6),
              Padding(
                padding: const EdgeInsets.only(top: 8, right: 8, left: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                        child: SizedBox(
                      height: 60,
                      child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12))),
                          child: Row(
                            children: [
                              // お知らせ間隔のインプット
                              Text(_weeks[_selectedFruit],
                                  style: const TextStyle(
                                      fontSize: 18, color: Colors.black)),
                              const Text(' 年'),
                              const Spacer(),
                              Text(_weeks[_selectedFruit],
                                  style: const TextStyle(
                                      fontSize: 18, color: Colors.black)),
                              const Text(' 月'),
                              const Spacer(),
                              Text(_weeks[_selectedFruit],
                                  style: const TextStyle(
                                      fontSize: 18, color: Colors.black)),
                              const Text(' 週後'),
                              const Spacer(
                                flex: 6,
                              ),
                            ],
                          ),
                          onPressed: () => _showDialog(
                                Row(
                                  children: [
                                    // 年
                                    Expanded(
                                      child: CupertinoPicker(
                                        magnification: 1.22,
                                        squeeze: 1.2,
                                        useMagnifier: true,
                                        itemExtent: _kItemExtent,
                                        onSelectedItemChanged:
                                            (int selectedIndex) {
                                          setState(() {
                                            _selectedFruit = selectedIndex;
                                          });
                                        },
                                        looping: true,
                                        children: List<Widget>.generate(
                                            _weeks.length, (index) {
                                          return Center(
                                              child: Text('${_weeks[index]}年'));
                                        }),
                                      ),
                                    ),
                                    // 月
                                    Expanded(
                                      child: CupertinoPicker(
                                        magnification: 1.22,
                                        squeeze: 1.2,
                                        useMagnifier: true,
                                        itemExtent: _kItemExtent,
                                        onSelectedItemChanged:
                                            (int selectedIndex) {
                                          setState(() {
                                            _selectedFruit = selectedIndex;
                                          });
                                        },
                                        looping: true,
                                        children: List<Widget>.generate(
                                            _weeks.length, (index) {
                                          return Center(
                                              child:
                                                  Text('${_weeks[index]}ヶ月'));
                                        }),
                                      ),
                                    ),
                                    // 週
                                    Expanded(
                                      child: CupertinoPicker(
                                        magnification: 1.22,
                                        squeeze: 1.2,
                                        useMagnifier: true,
                                        itemExtent: _kItemExtent,
                                        onSelectedItemChanged:
                                            (int selectedIndex) {
                                          setState(() {
                                            _selectedFruit = selectedIndex;
                                          });
                                        },
                                        looping: true,
                                        children: List<Widget>.generate(
                                            _weeks.length, (index) {
                                          return Center(
                                              child: Text('${_weeks[index]}週'));
                                        }),
                                      ),
                                    )
                                  ],
                                ),
                              )),
                    ))
                  ],
                ),
              ),
              CheckboxListTile(
                  title: const Text('繰り返す'),
                  activeColor: Theme.of(context).primaryColor,
                  value: _checked,
                  onChanged: ((value) {
                    setState(() {
                      _checked = value!;
                    });
                  })),
              const SizedBox(height: 8, child: Spacer()),
              Text('メモ', style: Theme.of(context).textTheme.headline6),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: noteArea,
                  keyboardType: TextInputType.multiline,
                  maxLines: 4,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16, right: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            fixedSize: const Size(90, 50),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12))),
                        child:
                            const Text('保存', style: TextStyle(fontSize: 16))),
                  ],
                ),
              )
            ],
          )),
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
