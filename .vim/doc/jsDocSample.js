/** 
 * @fileOverview 動物クラスを記述するファイルです。
 * 
 * @author 遠藤 太志郎
 * @version 1.0.0
 */
 
/**
 * 動物の名前と性別をセットします。
 * 
 * @class 動物エンティティのクラスです。<br>
 * 動物の名前と性別の情報を所持し、それらを取り扱う機能を保有します。
 * 
 * @param {String} name	動物名
 * @param {String} sex	性別
 */
var Animal = function(name, sex) {
 
    /**
     * 名前
     * @return {String}
     */
    this.name = name;
 
    /**
     * 性別
     * @return {String}
     */
    this.sex = sex;
 
    /**
     * 文章化する。<br>
     * 名前と性別の情報を合わせて文章化する。
     * 
     * @param {String} sep 分割表示用マーク
     * @return {String} 表示用文章
     * 
     * @example 
     * tiger.toString("：");
     * 出力：「虎太郎：オス」
     * 
     */
    this.toString = function(sep) {
        return this.name + sep + this.sex;
    };
}
