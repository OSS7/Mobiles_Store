import 'package:flutter/material.dart';
import 'package:mobile_store/constant.dart';
import 'package:mobile_store/models/category.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  Future<List<ParseObject>> getSpecificBrand(
    String className,
    String brand,
  ) async {
    QueryBuilder<ParseObject> queryTodo = QueryBuilder<ParseObject>(
      ParseObject(
        className,
      ),
    );
    queryTodo.whereEqualTo(
      'brand',
      brand,
    );

    final ParseResponse apiResponse = await queryTodo.query();
    if (apiResponse.success && apiResponse.results != null) {
      return apiResponse.results!.reversed.toList() as List<ParseObject>;
    } else {
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    final brand = ModalRoute.of(context)!.settings.arguments as CategoryItem;
    return Scaffold(
      appBar: AppBar(
        foregroundColor: priClr,
        backgroundColor: secClr,
        title: Text(
          '${brand.title}',
        ),
      ),
      backgroundColor: secClr,
      body: FutureBuilder<List<ParseObject>>(
          future: getSpecificBrand(
            'Mobiles',
            brand.title ?? 'Samsung',
          ),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return Center(
                  child: SizedBox(
                    width: 100,
                    height: 100,
                    child: CircularProgressIndicator(
                      backgroundColor: secClr,
                      color: brand.color!,
                    ),
                  ),
                );
              default:
                if (!snapshot.hasData) {
                  return Center(
                    child: SizedBox(
                      width: 100,
                      height: 100,
                      child: CircularProgressIndicator(
                        backgroundColor: secClr,
                        color: priClr,
                      ),
                    ),
                  );
                } else {
                  return GridView.builder(
                    itemCount: snapshot.data?.length,
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 300,
                      childAspectRatio: 1.8 / 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 0,
                    ),
                    itemBuilder: (context, index) {
                      final varProduct = snapshot.data![index];
                      final varTitle =
                          varProduct.get<String>('name') ?? ' null';
                      ParseFileBase? varImage = varProduct.get<ParseFileBase>(
                        'image',
                      );
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            '/DetailsScreen',
                            arguments: varProduct,
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: priClr,
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: const Offset(
                                  2,
                                  0,
                                ), // changes position of shadow
                              ),
                            ],
                            color: priClr,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(
                                25,
                              ),
                            ),
                          ),
                          margin: const EdgeInsets.all(
                            20,
                          ),
                          child: Center(
                            child: Stack(
                              children: [
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      bottom: 10.0,
                                    ),
                                    child: Image.network(
                                      varImage!.url.toString(),
                                      fit: BoxFit.fitHeight,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Container(
                                    width: double.infinity,
                                    height: 30,
                                    color: secClr.withOpacity(
                                      0.8,
                                    ),
                                    child: FittedBox(
                                      child: Text(
                                        varTitle.toString(),
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: brand.color, fontSize: 22),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }
            }
          }),
    );
  }
}
