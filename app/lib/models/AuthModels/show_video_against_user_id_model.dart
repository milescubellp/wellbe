// To parse this JSON data, do
//
//     final showVideosAgainstUserIdModel = showVideosAgainstUserIdModelFromJson(jsonString);

import 'dart:convert';

ShowVideosAgainstUserIdModel showVideosAgainstUserIdModelFromJson(String str) => ShowVideosAgainstUserIdModel.fromJson(json.decode(str));

String showVideosAgainstUserIdModelToJson(ShowVideosAgainstUserIdModel data) => json.encode(data.toJson());

class ShowVideosAgainstUserIdModel {
  ShowVideosAgainstUserIdModel({
    this.public,
    this.private,
  });

  List<Public>? public;
  List<dynamic>? private;

  factory ShowVideosAgainstUserIdModel.fromJson(Map<String, dynamic> json) => ShowVideosAgainstUserIdModel(
    public: json["public"] == null ? [] : List<Public>.from(json["public"]!.map((x) => Public.fromJson(x))),
    private: json["private"] == null ? [] : List<dynamic>.from(json["private"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "public": public == null ? [] : List<dynamic>.from(public!.map((x) => x.toJson())),
    "private": private == null ? [] : List<dynamic>.from(private!.map((x) => x)),
  };
}

class Public {
  Public({
    this.video,
    this.user,
    this.sound,
  });

  Video? video;
  User? user;
  Sound? sound;

  factory Public.fromJson(Map<String, dynamic> json) => Public(
    video: json["Video"] == null ? null : Video.fromJson(json["Video"]),
    user: json["User"] == null ? null : User.fromJson(json["User"]),
    sound: json["Sound"] == null ? null : Sound.fromJson(json["Sound"]),
  );

  Map<String, dynamic> toJson() => {
    "Video": video?.toJson(),
    "User": user?.toJson(),
    "Sound": sound?.toJson(),
  };
}

class Sound {
  Sound({
    this.id,
    this.audio,
    this.duration,
    this.name,
    this.description,
    this.thum,
    this.soundSectionId,
    this.uploadedBy,
    this.publish,
    this.created,
  });

  String? id;
  String? audio;
  String? duration;
  String? name;
  String? description;
  String? thum;
  String? soundSectionId;
  String? uploadedBy;
  String? publish;
  String? created;

  factory Sound.fromJson(Map<String, dynamic> json) => Sound(
    id: json["id"],
    audio: json["audio"],
    duration: json["duration"],
    name: json["name"],
    description: json["description"],
    thum: json["thum"],
    soundSectionId: json["sound_section_id"],
    uploadedBy: json["uploaded_by"],
    publish: json["publish"],
    created: json["created"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "audio": audio,
    "duration": duration,
    "name": name,
    "description": description,
    "thum": thum,
    "sound_section_id": soundSectionId,
    "uploaded_by": uploadedBy,
    "publish": publish,
    "created": created,
  };
}

class User {
  User({
    this.id,
    this.firstName,
    this.lastName,
    this.gender,
    this.bio,
    this.website,
    this.dob,
    this.socialId,
    this.email,
    this.phone,
    this.password,
    this.profilePic,
    this.profilePicSmall,
    this.profileGif,
    this.role,
    this.username,
    this.social,
    this.deviceToken,
    this.token,
    this.active,
    this.lat,
    this.long,
    this.online,
    this.verified,
    this.authToken,
    this.version,
    this.device,
    this.ip,
    this.city,
    this.country,
    this.state,
    this.region,
    this.locationString,
    this.countryId,
    this.wallet,
    this.paypal,
    this.private,
    this.profileView,
    this.resetWalletDatetime,
    this.created,
    this.pushNotification,
    this.privacySetting,
  });

  String? id;
  String? firstName;
  String? lastName;
  String? gender;
  String? bio;
  String? website;
  DateTime? dob;
  String? socialId;
  String? email;
  String? phone;
  String? password;
  String? profilePic;
  String? profilePicSmall;
  String? profileGif;
  String? role;
  String? username;
  String? social;
  String? deviceToken;
  String? token;
  String? active;
  String? lat;
  String? long;
  String? online;
  String? verified;
  String? authToken;
  String? version;
  String? device;
  String? ip;
  String? city;
  String? country;
  String? state;
  String? region;
  String? locationString;
  String? countryId;
  String? wallet;
  String? paypal;
  String? private;
  String? profileView;
  String? resetWalletDatetime;
  String? created;
  PushNotification? pushNotification;
  PrivacySetting? privacySetting;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    gender: json["gender"],
    bio: json["bio"],
    website: json["website"],
    dob: json["dob"] == null ? null : DateTime.parse(json["dob"]),
    socialId: json["social_id"],
    email: json["email"],
    phone: json["phone"],
    password: json["password"],
    profilePic: json["profile_pic"],
    profilePicSmall: json["profile_pic_small"],
    profileGif: json["profile_gif"],
    role: json["role"],
    username: json["username"],
    social: json["social"],
    deviceToken: json["device_token"],
    token: json["token"],
    active: json["active"],
    lat: json["lat"],
    long: json["long"],
    online: json["online"],
    verified: json["verified"],
    authToken: json["auth_token"],
    version: json["version"],
    device: json["device"],
    ip: json["ip"],
    city: json["city"],
    country: json["country"],
    state: json["state"],
    region: json["region"],
    locationString: json["location_string"],
    countryId: json["country_id"],
    wallet: json["wallet"],
    paypal: json["paypal"],
    private: json["private"],
    profileView: json["profile_view"],
    resetWalletDatetime: json["reset_wallet_datetime"],
    created: json["created"],
    pushNotification: json["PushNotification"] == null ? null : PushNotification.fromJson(json["PushNotification"]),
    privacySetting: json["PrivacySetting"] == null ? null : PrivacySetting.fromJson(json["PrivacySetting"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "first_name": firstName,
    "last_name": lastName,
    "gender": gender,
    "bio": bio,
    "website": website,
    "dob": "${dob!.year.toString().padLeft(4, '0')}-${dob!.month.toString().padLeft(2, '0')}-${dob!.day.toString().padLeft(2, '0')}",
    "social_id": socialId,
    "email": email,
    "phone": phone,
    "password": password,
    "profile_pic": profilePic,
    "profile_pic_small": profilePicSmall,
    "profile_gif": profileGif,
    "role": role,
    "username": username,
    "social": social,
    "device_token": deviceToken,
    "token": token,
    "active": active,
    "lat": lat,
    "long": long,
    "online": online,
    "verified": verified,
    "auth_token": authToken,
    "version": version,
    "device": device,
    "ip": ip,
    "city": city,
    "country": country,
    "state": state,
    "region": region,
    "location_string": locationString,
    "country_id": countryId,
    "wallet": wallet,
    "paypal": paypal,
    "private": private,
    "profile_view": profileView,
    "reset_wallet_datetime": resetWalletDatetime,
    "created": created,
    "PushNotification": pushNotification?.toJson(),
    "PrivacySetting": privacySetting?.toJson(),
  };
}

class PrivacySetting {
  PrivacySetting({
    this.id,
    this.videosDownload,
    this.directMessage,
    this.duet,
    this.likedVideos,
    this.videoComment,
  });

  String? id;
  String? videosDownload;
  String? directMessage;
  String? duet;
  String? likedVideos;
  String? videoComment;

  factory PrivacySetting.fromJson(Map<String, dynamic> json) => PrivacySetting(
    id: json["id"],
    videosDownload: json["videos_download"],
    directMessage: json["direct_message"],
    duet: json["duet"],
    likedVideos: json["liked_videos"],
    videoComment: json["video_comment"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "videos_download": videosDownload,
    "direct_message": directMessage,
    "duet": duet,
    "liked_videos": likedVideos,
    "video_comment": videoComment,
  };
}

class PushNotification {
  PushNotification({
    this.id,
    this.likes,
    this.comments,
    this.newFollowers,
    this.mentions,
    this.directMessages,
    this.videoUpdates,
  });

  String? id;
  String? likes;
  String? comments;
  String? newFollowers;
  String? mentions;
  String? directMessages;
  String? videoUpdates;

  factory PushNotification.fromJson(Map<String, dynamic> json) => PushNotification(
    id: json["id"],
    likes: json["likes"],
    comments: json["comments"],
    newFollowers: json["new_followers"],
    mentions: json["mentions"],
    directMessages: json["direct_messages"],
    videoUpdates: json["video_updates"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "likes": likes,
    "comments": comments,
    "new_followers": newFollowers,
    "mentions": mentions,
    "direct_messages": directMessages,
    "video_updates": videoUpdates,
  };
}

class Video {
  Video({
    this.id,
    this.userId,
    this.description,
    this.video,
    this.thum,
    this.gif,
    this.view,
    this.section,
    this.soundId,
    this.privacyType,
    this.allowComments,
    this.allowDuet,
    this.block,
    this.duetVideoId,
    this.oldVideoId,
    this.duration,
    this.promote,
    this.pinCommentId,
    this.pin,
    this.repostUserId,
    this.repostVideoId,
    this.qualityCheck,
    this.viral,
    this.story,
    this.countryId,
    this.city,
    this.state,
    this.country,
    this.region,
    this.locationString,
    this.share,
    this.created,
    this.like,
    this.favourite,
    this.repost,
    this.commentCount,
    this.likeCount,
    this.playlistVideo,
  });

  String? id;
  String? userId;
  String? description;
  String? video;
  String? thum;
  String? gif;
  String? view;
  String? section;
  String? soundId;
  String? privacyType;
  String? allowComments;
  String? allowDuet;
  String? block;
  String? duetVideoId;
  String? oldVideoId;
  String? duration;
  String? promote;
  String? pinCommentId;
  String? pin;
  String? repostUserId;
  String? repostVideoId;
  String? qualityCheck;
  String? viral;
  String? story;
  String? countryId;
  String? city;
  String? state;
  String? country;
  String? region;
  String? locationString;
  String? share;
  String? created;
  dynamic like;
  dynamic favourite;
  dynamic repost;
  dynamic commentCount;
  dynamic likeCount;
  PlaylistVideo? playlistVideo;

  factory Video.fromJson(Map<String, dynamic> json) => Video(
    id: json["id"],
    userId: json["user_id"],
    description: json["description"],
    video: json["video"],
    thum: json["thum"],
    gif: json["gif"],
    view: json["view"],
    section: json["section"],
    soundId: json["sound_id"],
    privacyType: json["privacy_type"],
    allowComments: json["allow_comments"],
    allowDuet: json["allow_duet"],
    block: json["block"],
    duetVideoId: json["duet_video_id"],
    oldVideoId: json["old_video_id"],
    duration: json["duration"],
    promote: json["promote"],
    pinCommentId: json["pin_comment_id"],
    pin: json["pin"],
    repostUserId: json["repost_user_id"],
    repostVideoId: json["repost_video_id"],
    qualityCheck: json["quality_check"],
    viral: json["viral"],
    story: json["story"],
    countryId: json["country_id"],
    city: json["city"],
    state: json["state"],
    country: json["country"],
    region: json["region"],
    locationString: json["location_string"],
    share: json["share"],
    created: json["created"],
    like: json["like"],
    favourite: json["favourite"],
    repost: json["repost"],
    commentCount: json["comment_count"],
    likeCount: json["like_count"],
    playlistVideo: json["PlaylistVideo"] == null ? null : PlaylistVideo.fromJson(json["PlaylistVideo"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "description": description,
    "video": video,
    "thum": thum,
    "gif": gif,
    "view": view,
    "section": section,
    "sound_id": soundId,
    "privacy_type": privacyType,
    "allow_comments": allowComments,
    "allow_duet": allowDuet,
    "block": block,
    "duet_video_id": duetVideoId,
    "old_video_id": oldVideoId,
    "duration": duration,
    "promote": promote,
    "pin_comment_id": pinCommentId,
    "pin": pin,
    "repost_user_id": repostUserId,
    "repost_video_id": repostVideoId,
    "quality_check": qualityCheck,
    "viral": viral,
    "story": story,
    "country_id": countryId,
    "city": city,
    "state": state,
    "country": country,
    "region": region,
    "location_string": locationString,
    "share": share,
    "created": created,
    "like": like,
    "favourite": favourite,
    "repost": repost,
    "comment_count": commentCount,
    "like_count": likeCount,
    "PlaylistVideo": playlistVideo?.toJson(),
  };
}

class PlaylistVideo {
  PlaylistVideo({
    this.id,
    this.playlistId,
    this.videoId,
    this.order,
    this.created,
    this.playlist,
  });

  dynamic id;
  String? playlistId;
  String? videoId;
  String? order;
  String? created;
  Playlist? playlist;

  factory PlaylistVideo.fromJson(Map<String, dynamic> json) => PlaylistVideo(
    id: json["id"],
    playlistId: json["playlist_id"],
    videoId: json["video_id"],
    order: json["order"],
    created: json["created"],
    playlist: json["Playlist"] == null ? null : Playlist.fromJson(json["Playlist"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "playlist_id": playlistId,
    "video_id": videoId,
    "order": order,
    "created": created,
    "Playlist": playlist?.toJson(),
  };
}

class Playlist {
  Playlist({
    this.id,
    this.userId,
    this.name,
    this.created,
  });

  String? id;
  String? userId;
  String? name;
  String? created;

  factory Playlist.fromJson(Map<String, dynamic> json) => Playlist(
    id: json["id"],
    userId: json["user_id"],
    name: json["name"],
    created: json["created"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "name": name,
    "created": created,
  };
}
