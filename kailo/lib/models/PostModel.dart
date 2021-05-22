class PostModel {
  String uid;
  String userName;
  String content;
  String feeling;
  DateTime time;
  int likes;

  PostModel(
      {this.uid,
      this.userName,
      this.content,
      this.feeling,
      this.time,
      this.likes});

  Map toMap(PostModel post) {
    var data = Map<String, dynamic>();
    data['uid'] = post.uid;
    data['username'] = post.userName;
    data['content'] = post.content;
    data['feeling'] = post.feeling;
    data['time'] = post.time;
    data['likes'] = post.likes;
  }
}
