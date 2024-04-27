import 'package:flutter/material.dart';
import 'package:flutter_counter_app/presentation/home/page/page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Calculator'),
          bottom: const TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.calculate_outlined),
              ),
              Tab(
                icon: Icon(Icons.history_toggle_off_rounded),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            MathForm(),
            HistoryPage(),
          ],
        ),
      ),
    );
  }
}
