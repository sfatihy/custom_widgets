import 'package:flutter/material.dart';

import '../widgets/indicators/animated_dot_loading_indicator_widget.dart';

class InfiniteScrollView extends StatefulWidget {
  const InfiniteScrollView({super.key});

  @override
  State<InfiniteScrollView> createState() => InfiniteScrollViewState();
}

class InfiniteScrollViewState extends State<InfiniteScrollView> {
  late final ScrollController scrollController;
  List items = List.generate(10, (index) => index);
  bool isFetching = false;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if (!isFetching) {
          fetchData();
        }
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  Future fetchData() async {
    setState(() {
      isFetching = true;
    });
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      items.addAll(List.generate(10, (index) => items.length + index));
      isFetching = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Infinite Scroll'),
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        controller: scrollController,
        padding: const EdgeInsets.only(bottom: 80.0),
        itemCount: items.length + 1,
        itemBuilder: (context, index) {
          return index < items.length
              ? Container(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.blueAccent.withValues(alpha: 0.1),
                      child: Text(
                        '${items[index] + 1}',
                        style: const TextStyle(
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Item ${items[index] + 1}',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Description for item ${items[index] + 1}',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: Colors.grey
                    ),
                  ],
                ),
              )
              : isFetching
                ? const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Center(
                    child: AnimatedDotLoadingIndicatorWidget(
                      color: Colors.blueAccent,
                      size: 40.0,
                    ),
                  ),
                )
                : const SizedBox();
        },
      ),
    );
  }
}
