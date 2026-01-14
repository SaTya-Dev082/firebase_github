import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RealtimeRecord extends StatelessWidget {
  RealtimeRecord({super.key});
  final Stream<QuerySnapshot> user = FirebaseFirestore.instance
      .collection('users')
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Real Time Update",
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: user,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          }
          return ListView.separated(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              final DocumentSnapshot document = snapshot.data!.docs[index];
              final Map<String, dynamic> data =
                  document.data()! as Map<String, dynamic>;

              return ListTile(
                title: Text(data['email']),
                subtitle: Text(data['phone']),
                trailing: Text(data['username']),
                hoverColor: Colors.black,
                textColor: Colors.black,
              );
            },
            separatorBuilder: (context, index) => Divider(color: Colors.grey),
          );
        },
      ),
    );
  }
}
