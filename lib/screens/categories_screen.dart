import 'package:flutter/material.dart';
import 'package:mobile_store/constant.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  Future<List<ParseObject>> getCategories(
    String className,
  ) async {
    QueryBuilder<ParseObject> queryTodo = QueryBuilder<ParseObject>(
      ParseObject(
        className,
      ),
    );

    final ParseResponse apiResponse = await queryTodo.query();
    if (apiResponse.success && apiResponse.results != null) {
      return apiResponse.results as List<ParseObject>;
    } else {
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () async {
                final user = await ParseUser.currentUser() as ParseUser;
                var response = await user.logout();
                if (response.success) {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      '/LoginScreen', (route) => false);
                }
              },
              icon: const Icon(
                Icons.login,
              ),
            ),
          ],
          foregroundColor: priClr,
          backgroundColor: secClr,
          title: const Text(
            'Categories',
          ),
        ),
        backgroundColor: secClr,
        body: FutureBuilder<List<ParseObject>>(
            future: getCategories('Categories'),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return Center(
                    child: SizedBox(
                      width: 100,
                      height: 100,
                      child: CircularProgressIndicator(
                        backgroundColor: secClr,
                        color: secClr,
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
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          final varCategory = snapshot.data![index];
                          final title = varCategory.get('title');
                          Color color =
                              Color(int.parse(varCategory.get('color')));
                          return GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/ProductsScreen',
                                  arguments: categories[index]);
                            },
                            child: Container(
                              width: 120,
                              height: 180,
                              padding: const EdgeInsets.all(
                                20,
                              ),
                              margin: const EdgeInsets.all(
                                20,
                              ),
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(
                                      0.4,
                                    ),
                                    spreadRadius: 1,
                                    blurRadius: 10,
                                    offset: const Offset(
                                      0,
                                      1,
                                    ), // changes position of shadow
                                  ),
                                ],
                                gradient: LinearGradient(
                                  colors: [color.withOpacity(0.5), color],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(
                                    35,
                                  ),
                                ),
                                color: priClr,
                              ),
                              child: Stack(
                                children: [
                                  SizedBox(
                                    width: size.width * 0.5,
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Image.asset(
                                        'assets/${title!.toLowerCase()}.png',
                                        fit: BoxFit.fitWidth,
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      title ?? 'null',
                                      style: const TextStyle(
                                        fontSize: 25,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                  }
              }
            }));
  }
}
