import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _expandedHeight = 200.0;
  ScrollController _scrollController = ScrollController();
  double _previousScrollOffset = 0.0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    double scrollOffset = _scrollController.offset;
    double scrollDelta = scrollOffset - _previousScrollOffset;

    setState(() {
      if (scrollDelta > 0 && _expandedHeight > 100.0) {
        _expandedHeight -= scrollDelta;
        _expandedHeight = _expandedHeight.clamp(100.0, 200.0);
      } else if (scrollDelta < 0 && _expandedHeight < 200.0) {
        _expandedHeight -= scrollDelta;
        _expandedHeight = _expandedHeight.clamp(100.0, 200.0);
      }
    });

    _previousScrollOffset = scrollOffset;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            expandedHeight: _expandedHeight,
            floating: true,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
                // Your flexible space content
                ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => ListTile(
                title: Text('Item $index'),
              ),
              childCount: 50,
            ),
          ),
        ],
      ),
    );
  }
}
