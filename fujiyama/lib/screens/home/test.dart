import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {

  Firestore firestore = Firestore.instance;

  List<DocumentSnapshot> courses = []; // stores fetched products

  bool isLoading = false; // track if products fetching

  bool hasMore = true; // flag for more products available or not

  int documentLimit = 10; // documents to be fetched per request

  DocumentSnapshot lastDocument; // flag for last document from where next 10 records to be fetched

  ScrollController _scrollController = ScrollController();

  getProducts() async {
    if (!hasMore) {
      print('No More Products');
      return;
    }
    if (isLoading) {
      return;
    }
    setState(() {
      isLoading = true;
    });
    QuerySnapshot querySnapshot;
    if (lastDocument == null) {
      querySnapshot = await firestore
          .collection('courses')
          .orderBy('title')
          .limit(documentLimit)
          .getDocuments();
    } else {
      querySnapshot = await firestore
          .collection('courses')
          .orderBy('title')
          .startAfterDocument(lastDocument)
          .limit(documentLimit)
          .getDocuments();
      print(1);
    }
    if (querySnapshot.documents.length < documentLimit) {
      hasMore = false;
    }
    lastDocument = querySnapshot.documents[querySnapshot.documents.length - 1];
    courses.addAll(querySnapshot.documents);
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Pagination with Firestore'),
      ),
      body: Column(children: [
        Expanded(
          child: courses.length == 0
              ? Center(
            child: Text('No Data...'),
          )
              : ListView.builder(
            controller: _scrollController,
            itemCount: courses.length,
            itemBuilder: (context, index) {
              return ListTile(
                contentPadding: EdgeInsets.all(5),
                title: Text(courses[index].data['title']),
                subtitle: Text(courses[index].data['description']),
              );
            },
          ),
        ),
        isLoading
            ? Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(5),
          color: Colors.yellowAccent,
          child: Text(
            'Loading',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        )
            : Container()
      ]),
    );
  }
}
