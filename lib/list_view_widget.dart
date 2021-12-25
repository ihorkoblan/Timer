import 'package:flutter/cupertino.dart';

import 'CellWidget.dart';

class ListViewWidget extends StatefulWidget {
  ListViewWidget({required this.items, Key? key}) : super(key: key);

  List<String> items;

  @override
  _ListViewWidgetState createState() => _ListViewWidgetState();
}

class _ListViewWidgetState extends State<ListViewWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      reverse: false, // змінити порядок перегляду цього списку
      padding: EdgeInsets.only(top: 30),
      itemCount: widget.items.length,
      itemBuilder: (BuildContext context, int index) {
        return Dismissible(
          //  можливість видалення збереженого часу
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: CellWidget(
                text: '${widget.items[index]}',
                fontSize: 25,
              ),
            ),
          ),
          onDismissed: (direction) {
            setState(() {
              widget.items.removeAt(index);
            });
          },
          key: UniqueKey(),
        );
      },
    );
  }
}
