//名前空間関数の実装例
//この実装は破壊的ではなく、名前空間が存在していたら、それを再作成しない
var RGNAPP = RGNAPP || {};
RGNAPP.namespace = function(ns_string){
	var parts = ns_string.split('.'),
			parent = RGNAPP,
			i;
	//先頭の冗長なグローバルを取り除く
	if(parts[0] === "RGNAPP"){
		parts = parts.slice(1);
	}
	for(i = 0; i < parts.length; i += 1){
		//プロパティが存在しなければ作成する
		if(typeof parent[parts[i]] === "undefined"){
			parent[parts[i]] = {};
		}
		parent = parent[parts[i]];
	}
	return parent;
}
//▼utilityの処理▼
if(Object.keys(RGNAPP.namespace('RGNAPP.util.Event.Btn')).length === 0){
	RGNAPP.util.Event.Btn = (function(){
		var btnTabs = function(){
			//ボタンタブ切り替えの処理
			$(".btnTabs").append(" → 変更後");
		};
		return{
			btnTabs: btnTabs
		};
	}());
}
//▲utilityの処理▲

//▼イニシャライズ▼

if(Object.keys(RGNAPP.namespace('RGNAPP.btnEvent.Init')).length === 0){
	//作成可能
	RGNAPP.btnEvent.Init = (function(){
		var _btn = RGNAPP.util.Event.Btn,
				Constr = function(obj){
					this.first(obj);
				};
				Constr.prototype = {
					first : function(obj){
					//objはArrayを想定
					for(var i = 0; i < obj.length; i+=1){
						if(obj[i] === "standard"){
							_btn.btnTabs();
						}else if(obj[i] === "selector"){
							console.log("selectorの処理");
						}
					}
				}
			}
		return Constr;
	}());
}else{
	//すでにあるオブジェクト
}

if(Object.keys(RGNAPP.namespace('RGNAPP.Init')).length === 0){
	RGNAPP.Init = (function(){
		var testar,
			btnEvent = RGNAPP.btnEvent,
		Constr = function(o){
			this.firstMethod(o);
		};
		Constr.prototype = {
			hoge : "hogehoge",
			constructor : RGNAPP.Init,
			firstMethod : function(obj){
				this.testar = obj;
			},
			testar : testar,
			btnEvent: {
				init: function(o){
				 return btnEvent.Init(o);
			 }
			}
		};
		return Constr;
	}());
}


//▲イニシャライズ▲


/*
//実装イメージ
//ボタンタブ等、基本を利用する場合
var obj = new RGNAPP();
obj.Init("standard");
*/
//ボタンタブ、セレクターを利用する場合
/*
 * 以下、まだ考える必要あがありそう
var ragnaObject = new RGNAPP.Init("こんなかんじ");
console.log(ragnaObject.btnEvent);
ragnaObject.btnEvent.Init(["standard","selector"]);

var ragnaObject2 = new RGNAPP.Init("どうですか");
*/
new RGNAPP.btnEvent.Init(["standard","selector"]);




