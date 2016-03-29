/**
 * Created by sunxin on 16/3/29.
 */
var mongoose = require('mongoose');
var db=require("../db/db.js");
var model=new mongoose.Schema({
    phone:String,
    name:String,
    pwd:String,
    question:String,
    answer:String,
    photo:String,
    code:String
});
var dbManage=db.model("User",model);
module.exports=dbManage;