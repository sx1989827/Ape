/**
 * Created by sunxin on 16/3/29.
 */
var mongoose = require('mongoose');
var data=require("../define/define.js");
var db=mongoose.createConnection(data.dbpath);
module.exports=db;