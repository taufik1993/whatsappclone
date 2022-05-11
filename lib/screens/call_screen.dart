import 'package:flutter/material.dart';
import 'package:whatsappclone/models/call_model.dart';

class CallsScreen extends StatelessWidget {
  const CallsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: dummyData.length,
      itemBuilder: (context, position) => Column(
        children: [
          const SizedBox(height: 10.0,),
          ListTile(
            leading: CircleAvatar(
              foregroundColor: Theme.of(context).primaryColor,
              backgroundColor: Colors.grey,
              backgroundImage: NetworkImage(dummyData[position].avatarUrl),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      dummyData[position].name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Row(
                        children: [
                          if (dummyData[position].status == "Incoming") ...[
                            Transform.rotate(
                              angle: 20,
                              child: const Icon(
                                Icons.arrow_downward_sharp,
                                color: Colors.green,
                                size: 20,
                              ),
                            )
                          ] else ...[
                            Transform.rotate(
                              angle: 10,
                              child: const Icon(
                                Icons.arrow_downward_sharp,
                                color: Colors.red,
                                size: 20,
                              ),
                            )
                          ],
                          Text(
                            dummyData[position].time,
                            style: const TextStyle(
                                color: Colors.grey, fontSize: 15.0),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const Icon(Icons.call, size: 20, color: Colors.blueAccent)
              ],
            ),
          )
        ],
      ),
    );
  }
}
