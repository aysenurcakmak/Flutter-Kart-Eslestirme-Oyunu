import 'package:flutter/material.dart';

void main() {
  runApp(MemoryGameApp());
}

class MemoryGameApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kart Eşleştirme Oyunu',
      theme: ThemeData(primarySwatch: Colors.pink),
      home: MemoryGamePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MemoryGamePage extends StatefulWidget {
  @override
  _MemoryGamePageState createState() => _MemoryGamePageState();
}

class _MemoryGamePageState extends State<MemoryGamePage> {
  final List<IconData> iconList = [
    Icons.star,
    Icons.favorite,
    Icons.cake,
    Icons.pets,
  ];

  List<IconData?> cards = [];
  List<bool> revealed = [];
  List<int> selectedIndexes = [];

  int matches = 0;
  int turns = 0;
  bool waiting = false;

  @override
  void initState() {
    super.initState();
    _startNewGame();
  }

  void _startNewGame() {
    setState(() {
      final doubledIcons = [...iconList, ...iconList];
      doubledIcons.shuffle();
      cards = List<IconData?>.from(doubledIcons);
      revealed = List.filled(cards.length, false);
      selectedIndexes.clear();
      matches = 0;
      turns = 0;
      waiting = false;
    });
  }

  void _onCardTap(int index) async {
    if (waiting || revealed[index]) return;

    setState(() {
      revealed[index] = true;
      selectedIndexes.add(index);
    });

    if (selectedIndexes.length == 2) {
      waiting = true;
      turns++;

      await Future.delayed(Duration(seconds: 1));

      int first = selectedIndexes[0];
      int second = selectedIndexes[1];

      if (cards[first] == cards[second]) {
        matches++;
      } else {
        revealed[first] = false;
        revealed[second] = false;
      }

      selectedIndexes.clear();
      waiting = false;

      if (matches == cards.length ~/ 2) {
        _showWinDialog();
      }

      setState(() {});
    }
  }

  void _showWinDialog() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Tebrikler!'),
        content: Text('Tüm kartları eşleştirdiniz!\nToplam hamle: $turns'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _startNewGame();
            },
            child: Text('Yeni Oyun'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Kapat'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kart Eşleştirme Oyunu"),
        toolbarHeight: 25,
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'new') _startNewGame();
              if (value == 'exit') Navigator.pop(context);
            },
            itemBuilder: (context) => [
              PopupMenuItem(value: 'new', child: Text('Yeni Oyun')),
              PopupMenuItem(value: 'exit', child: Text('Çıkış')),
            ],
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Eşleşmeler: $matches", style: TextStyle(fontSize: 20)),
                Text("Hamleler: $turns", style: TextStyle(fontSize: 20)),
              ],
            ),
          ),
          Expanded(
            child: GridView.count(
              padding: EdgeInsets.all(16),
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1.1,
              children: List.generate(cards.length, (index) {
                return GestureDetector(
                  onTap: () => _onCardTap(index),
                  child: Card(
                    color: revealed[index]
                        ? Colors.pink[100]
                        : Colors.pink[300],
                    child: Center(
                      child: revealed[index]
                          ? Icon(cards[index],
                          size: 55, color: Colors.pink[400])
                          : null,
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}