import 'package:flutter/material.dart';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 13),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Text(
              "Write your review",
              style: TextStyle(fontSize: 25),
            ),
            Container(
              height: 400,
              width: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: "Comment"),
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text("Rate this product"),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.star_border),
                      Icon(Icons.star_border),
                      Icon(Icons.star_border),
                      Icon(Icons.star_border),
                      Icon(Icons.star_border),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    height: 250,
                    width: 400,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            const Divider(),
            const Text(
              "Reviews",
              style: TextStyle(fontSize: 25),
            ),
            Container(
              height: 400,
              width: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
