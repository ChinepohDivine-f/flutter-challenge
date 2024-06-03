import 'package:edi/views/challenge/first_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class AddItemPage extends StatelessWidget {
  const AddItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.grey.shade200,
              floating: true,
              pinned: true,
              leading: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const FirstScreen()));
                  },
                  child: const Icon(CupertinoIcons.back)),
              title: const Text(
                "Add New Items",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: firstSection(),
              ),
            ),
            SliverToBoxAdapter(

                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
              child: Column(
                
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Name of food
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Column(
                          children: [
                            _subTitle('Name'),
                            const CustomTextField(
                              hintText: 'Food name',
                              suffixIcon: null,
                            ),
                            
                            // Food something
                            _subTitle("Title"),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 55,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          children: [
                             Option(text: 'Pizza'),
                             Option(
                              text: 'Sushi', isSelected: true,
                            ),
                             Option(text: 'Ramen'),
                             Option(text: 'Pizza'),
                             Option(text: 'Sushi'),
                             Option(text: 'Ramen'),
                          ],
                        ),
                      ), 
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: [
                            const SizedBox(height: 20,),
                            // textfield for no reason
                            const CustomTextField(
                              hintText: 'eggg',
                              suffixIcon: null,
                            ),
                            // const SizedBox(height: 10,),
                            // Name of food
                            _subTitle('Name'),
                            const CustomTextField(
                              hintText: 'Something',
                              suffixIcon: Icon(CupertinoIcons.cart),
                            ),
                          ],
                        ),
                      ),
        // add button
                    ],
                  ),
                  const SizedBox(height: 40,),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                    child: CustomPrimaryButton(),
                  ),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }

  Padding _subTitle(String title) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Row(mainAxisAlignment: MainAxisAlignment.start,

        children: [
          Text(
            title,
            textAlign: TextAlign.left,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  Row firstSection() {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(15),
            decoration: const BoxDecoration(
                color: Colors.deepOrange,
                border: Border.symmetric(
                    vertical: BorderSide(color: Colors.deepOrange),
                    horizontal: BorderSide(color: Colors.deepOrange)),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                )),
            child: const Center(
              child: Text(
                'Blahahahahah',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(15),
            decoration: const BoxDecoration(
                color: Colors.white,
                border: Border.symmetric(
                    vertical: BorderSide(color: Colors.deepOrange),
                    horizontal: BorderSide(color: Colors.deepOrange)),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                )),
            child: const Center(
              child: Text(
                'Blahahahahah',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.deepOrange,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class Option extends StatelessWidget {
  const Option({
    super.key,
    required this.text,
    this.isSelected = false,
  });
  final String text;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return 
    (isSelected == true) ?  SizedBox(
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(style: BorderStyle.solid, color: Colors.deepOrange)
        ),
        padding: const EdgeInsets.all(15),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 18, color: Colors.deepOrange),
        ),
      ),
    ) :  SizedBox(
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(15),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.suffixIcon,
  });
  final String hintText;
  final Widget? suffixIcon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextField(
        style: const TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 18,
        ),
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10)),
          contentPadding: const EdgeInsets.all(15),
          hintText: hintText,
          hintStyle: const TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
        ),
      ),
    );
  }
}

class CustomPrimaryButton extends StatelessWidget {
  const CustomPrimaryButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
          backgroundColor: const MaterialStatePropertyAll(Colors.deepOrange),
          padding: const MaterialStatePropertyAll(
            EdgeInsets.all(15),
          ),
          shape: MaterialStatePropertyAll(ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(30)))),
      onPressed: () {},
      child: const Center(
          child: Padding(
        padding: EdgeInsets.all(0),
        child: Text(
          'Add Item',
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
      )),
    );
  }
}
