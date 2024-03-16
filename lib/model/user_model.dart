import 'package:assistant_ai/core/consts.dart';

class USerModel {
  String uid;
  String name;
  String phone;
  String image;
  String token;
  String statusAboutMe;
  String lastSeen;
  String createAt;
  bool isOnline;
  List<String> friendsUIds;
  List<String> friendsRequestUIDs;
  List<String> sentFriendsRequestUIDs;

  USerModel({
    required this.uid,
    required this.name,
    required this.phone,
    required this.image,
    required this.token,
    required this.statusAboutMe,
    required this.lastSeen,
    required this.createAt,
    required this.isOnline,
    required this.friendsUIds,
    required this.friendsRequestUIDs,
    required this.sentFriendsRequestUIDs,
  });

  factory USerModel.fromJson(Map<String, dynamic> json) {
    return USerModel(
      uid: json[Consts.uid] ?? '',
      name: json[Consts.name] ?? '',
      phone: json[Consts.phone] ?? '',
      image: json[Consts.image] ?? '',
      token: json[Consts.token] ?? '',
      statusAboutMe: json[Consts.statusAboutMe] ?? '',
      lastSeen: json[Consts.lastSeen] ?? '',
      createAt: json[Consts.createAt] ?? '',
      isOnline: json[Consts.isOnline] ?? false,
      friendsUIds: List<String>.from(json[Consts.friendsUIds] ?? []),
      friendsRequestUIDs:
          List<String>.from(json[Consts.friendsRequestUIDs] ?? []),
      sentFriendsRequestUIDs:
          List<String>.from(json[Consts.sentFriendsRequestUIDs] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      Consts.uid: uid,
      Consts.name: name,
      Consts.phone: phone,
      Consts.image: image,
      Consts.token: token,
      Consts.statusAboutMe: statusAboutMe,
      Consts.lastSeen: lastSeen,
      Consts.createAt: createAt,
      Consts.isOnline: isOnline,
      Consts.friendsUIds: friendsUIds,
      Consts.friendsRequestUIDs: friendsRequestUIDs,
      Consts.sentFriendsRequestUIDs: sentFriendsRequestUIDs,

      // 'uid': uid,
      // 'name': name,
      // 'phone': phone,
      // 'image': image,
      // 'token': token,
      // 'statusAboutMe': statusAboutMe,
      // 'lastSeen': lastSeen,
      // 'createAt': createAt,
      // 'isOnline': isOnline,
      // 'friendsUIds': friendsUIds,
      // 'friendsRequestUIDs': friendsRequestUIDs,
      // 'sentFriendsRequestUIDs': sentFriendsRequestUIDs,
    };
  }
}
