class FidiData {
  String _name;
  String _Desc;
  String _url;
  String _Minicount;
  String _Maxcount;
  String _image;
  FidiData(this._name, this._Desc, this._url, this._Minicount, this._Maxcount,this._image);
  FidiData.map(dynamic obj) {
    this._name = obj['name'];
    this._Desc = obj['Desc'];
    this._url = obj['url'];
    this._Minicount = obj['Minicount'];
    this._Maxcount = obj['Maxcount'];
    this._image=obj['image'];
    
  }
  String get name => _name;
  String get Desc => _Desc;
  String get url => _url;
  String get Minicount => _Minicount;
  String get Maxcount => _Maxcount;
  String get image=>_image;

  Map<String ,dynamic> toMap(){
    var map=new Map<String,dynamic>();
    map['name']=_name;
    map['Desc']=_Desc;
    map['url']=_url;
    map['Minicount']=_Minicount;
    map['Maxcount']=_Maxcount;
    map['image']=_image;
    
    return map;
  }
  FidiData.fromMap(Map<String,dynamic> map){
    this._name=map['name'];
    this._Desc=map['Desc'];
    this._url=map['url'];
    this._Minicount=map['Minicount'];
    this._Maxcount=map['Maxcount'];
    this._image=map['image'];
    
  }
}
