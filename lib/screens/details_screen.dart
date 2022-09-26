import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobile_store/constant.dart';
import 'package:mobile_store/widgets/detail_tile.dart';
import 'package:mobile_store/widgets/detail_floating.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  int quantity = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final product = ModalRoute.of(context)?.settings.arguments as ParseObject;
    final brand = product.get('brand').toString();

    return Scaffold(
      floatingActionButton: const DetailFloatingButton(),
      appBar: AppBar(
        foregroundColor: priClr,
        backgroundColor: secClr,
        title: Text(
          product.get(
            'name',
          ),
        ),
      ),
      backgroundColor: priClr,
      body: Column(
          children: [
            Expanded(
              child: SizedBox(
                height: size.height * 0.94,
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(
                        50,
                      ),
                      color: priClr,
                      width: size.width,
                      height: size.height * 0.5,
                      child: Image.network(
                        product.get('image').url,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: secClr,
                          borderRadius:  leftRightRadius,
                        ),
                        width: size.width,
                        height: size.height * 0.4,
                        padding: const EdgeInsets.all(20),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ListTile(
                                leading: Icon(
                                  FontAwesomeIcons.solidHardDrive,
                                  color: priClr,
                                ),
                                title: DetailTileTitle(
                                  txt: '${product.get('Storage').toString()}GB',
                                ),
                              ),
                              ListTile(
                                leading: Icon(
                                  FontAwesomeIcons.android,
                                  color: priClr,
                                ),
                                title: brand == 'Apple'
                                    ? DetailTileTitle(
                                        txt:
                                            'IOS ${product.get('Android').toString()}')
                                    : DetailTileTitle(
                                        txt:
                                            'Android ${product.get('Android').toString()}',
                                      ),
                              ),
                              ListTile(
                                leading: Icon(
                                  FontAwesomeIcons.display,
                                  color: priClr,
                                ),
                                title: DetailTileTitle(
                                  txt: '${product.get('size').toString()}"',
                                ),
                              ),
                              ListTile(
                                leading: Icon(
                                  FontAwesomeIcons.memory,
                                  color: priClr,
                                ),
                                title: DetailTileTitle(
                                  txt: '${product.get('Ram').toString()}GB',
                                ),
                              ),
                              ListTile(
                                leading: Icon(
                                  FontAwesomeIcons.dollarSign,
                                  color: priClr,
                                ),
                                title: DetailTileTitle(
                                  txt: product.get('Price').toString(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
  }
}
