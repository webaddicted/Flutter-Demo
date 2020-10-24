/// login : "webaddicted"
/// id : 38448422
/// node_id : "MDQ6VXNlcjM4NDQ4NDIy"
/// avatar_url : "https://avatars2.githubusercontent.com/u/38448422?v=4"
/// gravatar_id : ""
/// url : "https://api.github.com/users/webaddicted"
/// html_url : "https://github.com/webaddicted"
/// followers_url : "https://api.github.com/users/webaddicted/followers"
/// following_url : "https://api.github.com/users/webaddicted/following{/other_user}"
/// gists_url : "https://api.github.com/users/webaddicted/gists{/gist_id}"
/// starred_url : "https://api.github.com/users/webaddicted/starred{/owner}{/repo}"
/// subscriptions_url : "https://api.github.com/users/webaddicted/subscriptions"
/// organizations_url : "https://api.github.com/users/webaddicted/orgs"
/// repos_url : "https://api.github.com/users/webaddicted/repos"
/// events_url : "https://api.github.com/users/webaddicted/events{/privacy}"
/// received_events_url : "https://api.github.com/users/webaddicted/received_events"
/// type : "User"
/// site_admin : false
/// name : "Deepak Sharma"
/// company : "Infogain India Private Limited"
/// blog : ""
/// location : "Noida"
/// email : null
/// hireable : true
/// bio : null
/// public_repos : 27
/// public_gists : 0
/// followers : 7
/// following : 17
/// created_at : "2018-04-17T02:43:26Z"
/// updated_at : "2020-05-04T19:10:43Z"

class GitUserInfoBean {
  String _login;
  int _id;
  String _nodeId;
  String _avatarUrl;
  String _gravatarId;
  String _url;
  String _htmlUrl;
  String _followersUrl;
  String _followingUrl;
  String _gistsUrl;
  String _starredUrl;
  String _subscriptionsUrl;
  String _organizationsUrl;
  String _reposUrl;
  String _eventsUrl;
  String _receivedEventsUrl;
  String _type;
  bool _siteAdmin;
  String _name;
  String _company;
  String _blog;
  String _location;
  dynamic _email;
  bool _hireable;
  dynamic _bio;
  int _publicRepos;
  int _publicGists;
  int _followers;
  int _following;
  String _createdAt;
  String _updatedAt;

  String get login => _login;
  int get id => _id;
  String get nodeId => _nodeId;
  String get avatarUrl => _avatarUrl;
  String get gravatarId => _gravatarId;
  String get url => _url;
  String get htmlUrl => _htmlUrl;
  String get followersUrl => _followersUrl;
  String get followingUrl => _followingUrl;
  String get gistsUrl => _gistsUrl;
  String get starredUrl => _starredUrl;
  String get subscriptionsUrl => _subscriptionsUrl;
  String get organizationsUrl => _organizationsUrl;
  String get reposUrl => _reposUrl;
  String get eventsUrl => _eventsUrl;
  String get receivedEventsUrl => _receivedEventsUrl;
  String get type => _type;
  bool get siteAdmin => _siteAdmin;
  String get name => _name;
  String get company => _company;
  String get blog => _blog;
  String get location => _location;
  dynamic get email => _email;
  bool get hireable => _hireable;
  dynamic get bio => _bio;
  int get publicRepos => _publicRepos;
  int get publicGists => _publicGists;
  int get followers => _followers;
  int get following => _following;
  String get createdAt => _createdAt;
  String get updatedAt => _updatedAt;

  GitUserInfoBean(this._login, this._id, this._nodeId, this._avatarUrl, this._gravatarId, this._url, this._htmlUrl, this._followersUrl, this._followingUrl, this._gistsUrl, this._starredUrl, this._subscriptionsUrl, this._organizationsUrl, this._reposUrl, this._eventsUrl, this._receivedEventsUrl, this._type, this._siteAdmin, this._name, this._company, this._blog, this._location, this._email, this._hireable, this._bio, this._publicRepos, this._publicGists, this._followers, this._following, this._createdAt, this._updatedAt);

  GitUserInfoBean.map(dynamic obj) {
    this._login = obj["login"];
    this._id = obj["id"];
    this._nodeId = obj["node_id"];
    this._avatarUrl = obj["avatar_url"];
    this._gravatarId = obj["gravatar_id"];
    this._url = obj["url"];
    this._htmlUrl = obj["html_url"];
    this._followersUrl = obj["followers_url"];
    this._followingUrl = obj["following_url"];
    this._gistsUrl = obj["gists_url"];
    this._starredUrl = obj["starred_url"];
    this._subscriptionsUrl = obj["subscriptions_url"];
    this._organizationsUrl = obj["organizations_url"];
    this._reposUrl = obj["repos_url"];
    this._eventsUrl = obj["events_url"];
    this._receivedEventsUrl = obj["received_events_url"];
    this._type = obj["type"];
    this._siteAdmin = obj["site_admin"];
    this._name = obj["name"];
    this._company = obj["company"];
    this._blog = obj["blog"];
    this._location = obj["location"];
    this._email = obj["email"];
    this._hireable = obj["hireable"];
    this._bio = obj["bio"];
    this._publicRepos = obj["public_repos"];
    this._publicGists = obj["public_gists"];
    this._followers = obj["followers"];
    this._following = obj["following"];
    this._createdAt = obj["created_at"];
    this._updatedAt = obj["updated_at"];
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["login"] = _login;
    map["id"] = _id;
    map["node_id"] = _nodeId;
    map["avatar_url"] = _avatarUrl;
    map["gravatar_id"] = _gravatarId;
    map["url"] = _url;
    map["html_url"] = _htmlUrl;
    map["followers_url"] = _followersUrl;
    map["following_url"] = _followingUrl;
    map["gists_url"] = _gistsUrl;
    map["starred_url"] = _starredUrl;
    map["subscriptions_url"] = _subscriptionsUrl;
    map["organizations_url"] = _organizationsUrl;
    map["repos_url"] = _reposUrl;
    map["events_url"] = _eventsUrl;
    map["received_events_url"] = _receivedEventsUrl;
    map["type"] = _type;
    map["site_admin"] = _siteAdmin;
    map["name"] = _name;
    map["company"] = _company;
    map["blog"] = _blog;
    map["location"] = _location;
    map["email"] = _email;
    map["hireable"] = _hireable;
    map["bio"] = _bio;
    map["public_repos"] = _publicRepos;
    map["public_gists"] = _publicGists;
    map["followers"] = _followers;
    map["following"] = _following;
    map["created_at"] = _createdAt;
    map["updated_at"] = _updatedAt;
    return map;
  }

}