import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  const MyCard({super.key, 
  required this.name, required this.author, required this.price, required this.imageURL,
  });
  final String name;
  final String author;
  final int price; 
  final String imageURL;

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xFFFED2A0),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 18),
                child: Image.network(imageURL, fit: BoxFit.cover,
                loadingBuilder: (BuildContext context, Widget child,ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) return child;
                  return 
                        Center(
                        child: CircularProgressIndicator(
                        color: Colors.grey,
                        value: loadingProgress.expectedTotalBytes != null ? 
                        loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                         : null,
      ),
    );
  },
                ),
              ),
            ),
          ),
          const SizedBox(height: 5,),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name),
                  Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(Icons.person_outlined, size: 18,),
                      Text(author, 
                      style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Text('$price\$'),
            ],
          )
        ],
      ),
    );
  }
}