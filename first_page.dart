import 'package:edi/views/challenge/add_items.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const SliverAppBar(
              floating: true,
              pinned: true,
              leading: Icon(CupertinoIcons.back),
              title: Text(
                "Read Messages",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
             SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Spagetti ball',
                      style: TextStyle(fontSize: 18),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const AddItemPage()));
                      },
                      child: const Row(
                        children: [
                          Icon(CupertinoIcons.add_circled,
                              color: Colors.deepOrange),
                          Text(
                            ' Add item',
                            style:
                                TextStyle(fontSize: 18, color: Colors.deepOrange),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 10,
              ),
            ),
            SliverList.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return const ItemsTile();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ItemsTile extends StatelessWidget {
  const ItemsTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: Row(
          children: [
            Container(
              height: 80,
              width: 80,
              child:  const Padding(
                padding: EdgeInsets.all(10),
                // child: Center(child: Image.asset()),
                child: Center(child: Text('Image')),
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.shade200),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Container(
                // width: double.infinity,
                // width: double.maxFinite,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      child: _itemsName(),
                    ),
                    SizedBox(child: _itemsProps())
                  ],
                ),
              ),
            )
          ],
        ));
  }

  Column _itemsName() {
    return const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Pizza',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            'Hot and spicy',
            style: TextStyle(fontSize: 16),
          ),
        ]);
  }

  Column _itemsProps() {
    return const Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
      Text(
        '105kl',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
      Text(
        'Hot and spicy',
        style: TextStyle(fontSize: 16),
      ),
    ]);
  }
}
