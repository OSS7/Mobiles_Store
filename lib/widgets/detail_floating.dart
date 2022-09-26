import 'package:flutter/material.dart';
import 'package:mobile_store/constant.dart';

class DetailFloatingButton extends StatelessWidget {
  const DetailFloatingButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: priClr,
      onPressed: () {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text(
                  "Success!",
                ),
                content: Text(
                  'Added to the cart ',
                  style: TextStyle(
                    color: secClr,
                  ),
                ),
                actions: <Widget>[
                  TextButton(
                    child: Text(
                      "Ok",
                      style: TextStyle(
                        color: secClr,
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            });
      },
      child: Icon(
        Icons.add_shopping_cart,
        color: secClr,
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:mobile_store/constant.dart';
//
// class DetailFooter extends StatefulWidget {
//   const DetailFooter(Key? key) : super(key: key);
//
//   @override
//   State<DetailFooter> createState() => _DetailFooterState();
// }
//
// class _DetailFooterState extends State<DetailFooter> {
//   @override
//   Widget build(BuildContext context) {
//    final size = MediaQuery.of(context).size;
//    return Container(
//      padding: EdgeInsets.all(8),
//      width: size.width,
//
//      height: size.height * 0.07,
//      color: priClr,
//      child: Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//        Container(
//         width: 50,
//         height: 50,
//         decoration: BoxDecoration(
//             color: secClr,
//
//             borderRadius: BorderRadius.all(const Radius.circular(50))
//         ),
//         child: Center(
//          child: IconButton(
//           splashRadius: 50,
//           // color: Colors.orangeAccent,
//           // foregroundColor: secClr,
//           onPressed: () {
//            setState(() {
//             widget.quantity++;
//            });
//           },
//           icon:Icon(
//            Icons.add,
//            color: priClr,
//           ),
//          ),
//         ),
//        ),
//        FittedBox(
//         child: Column(
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: [
//           TextButton(
//            onPressed: () {
//             widget.quantity != 0 ? showDialog(
//                 context: context,
//                 builder: (context) {
//                  return AlertDialog(
//                   title: const Text("Success!"),
//                   content: Text('Added ${widget.quantity} mobiles to the cart ',style: TextStyle(
//                       color: secClr
//                   ),),
//                   actions: <Widget>[
//                    TextButton(
//                     child: Text(
//                      "Ok",
//                      style: TextStyle(color: secClr),
//                     ),
//                     onPressed: () {
//                      Navigator.of(context).pop();
//                     },
//                    ),
//                   ],
//                  );
//                 }):null;
//            },
//            child: Text(
//             'Add to cart',
//             style: TextStyle(color: widget.quantity == 0 ? Colors.grey : secClr, fontSize: 20),
//            ),
//           ),
//           Text('quantity : ${widget.quantity}')
//          ],
//         ),
//        ),
//        Container(
//         width: 50,
//         height: 50,
//         decoration: BoxDecoration(
//             color: secClr,
//             borderRadius: BorderRadius.all(Radius.circular(50))
//         ),
//         child: IconButton(
//          splashRadius: 50,
//          // color: Colors.orangeAccent,
//          // foregroundColor: secClr,
//          onPressed: () {
//           setState(() {
//            widget.quantity > 0?
//            widget.quantity-- : null;
//           });
//          },
//          icon:Center(
//           child: Icon(
//            Icons.minimize,
//            color: priClr,
//           ),
//          ),
//         ),
//        ),
//       ],
//      ),
//     );
//   }
// }
