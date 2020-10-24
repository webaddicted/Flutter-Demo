/// login : "endang121"
/// id : 38448419
/// node_id : "MDQ6VXNlcjM4NDQ4NDE5"
/// avatar_url : "https://avatars1.githubusercontent.com/u/38448419?v=4"
/// gravatar_id : ""
/// url : "https://api.github.com/users/endang121"
/// html_url : "https://github.com/endang121"
/// followers_url : "https://api.github.com/users/endang121/followers"
/// following_url : "https://api.github.com/users/endang121/following{/other_user}"
/// gists_url : "https://api.github.com/users/endang121/gists{/gist_id}"
/// starred_url : "https://api.github.com/users/endang121/starred{/owner}{/repo}"
/// subscriptions_url : "https://api.github.com/users/endang121/subscriptions"
/// organizations_url : "https://api.github.com/users/endang121/orgs"
/// repos_url : "https://api.github.com/users/endang121/repos"
/// events_url : "https://api.github.com/users/endang121/events{/privacy}"
/// received_events_url : "https://api.github.com/users/endang121/received_events"
/// type : "User"
/// site_admin : false

class GitUserBean {
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

  GitUserBean(this._login, this._id, this._nodeId, this._avatarUrl, this._gravatarId, this._url, this._htmlUrl, this._followersUrl, this._followingUrl, this._gistsUrl, this._starredUrl, this._subscriptionsUrl, this._organizationsUrl, this._reposUrl, this._eventsUrl, this._receivedEventsUrl, this._type, this._siteAdmin);

  GitUserBean.map(dynamic obj) {
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
    return map;
  }

}