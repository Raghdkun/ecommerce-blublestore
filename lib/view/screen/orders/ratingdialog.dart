import 'package:flutter/material.dart';
import 'package:powerecommerce/core/constant/color.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'package:get/get.dart';
import 'package:powerecommerce/controller/orders/archivecontroller.dart';

// show the dialog
void ratingDialog(BuildContext context, String id) {
  showDialog(
    context: context,
    barrierDismissible: true, // set to false if you want to force a rating
    builder: (context) => RatingDialog(
      initialRating: 1.0,
      // your app's name?
      title: Text(
        'Rate Our Order',
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      // encourage your user to leave a high rating?
      message: Text(
        'Give Us Your Feedback! Please Be Honest And Rate Our Order',
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 15),
      ),
      // your app's logo?
      // image: Image.asset(
      //   AppImageAsset.logo,
      //   width: 200,
      //   height: 200,
      // ),
      submitButtonText: 'Submit',
      submitButtonTextStyle: TextStyle(color: AppColor.customBlack),
      commentHint: 'Your Comment', starSize: 30,
      onCancelled: () => print('cancelled'),
      onSubmitted: (response) {
        ArchiveOrderController controller = Get.find();
        // print('rating: ${response.rating}, comment: ${response.comment}');
        controller.submitRating(id, response.rating, response.comment);

        // TODO: add your own logic
        if (response.rating < 3.0) {
          // send their comments to your email or anywhere you wish
          // ask the user to contact you instead of leaving a bad review
        } else {
          // _rateAndReviewApp();
        }
      },
    ),
  );
}
