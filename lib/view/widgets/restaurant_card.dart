import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';


Widget restaurantCard(String name, String rating,String imageURL) {
    return Builder(
      builder: (context) {
        return Container(
          width: MediaQuery.of(context).size.width * .35,
          height: MediaQuery.of(context).size.height * .20,
          margin: const EdgeInsets.only(right: 15.0),
          decoration: 
            const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(15))
            ),
          child: Column(
            children: [
              const SizedBox(height: 15,),
              Image.network(
                      imageURL,
                      width:80,
                      height:80,),
              Text(
                name,
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                )
              ),

              RatingBar.builder(
                initialRating: double.parse(rating),
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemSize: 25,
                itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
                itemBuilder: (context, _) =>  const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              )
            ],
          ),
        );
      }
    );
  }