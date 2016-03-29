/**
 * Created by sunxin on 16/3/29.
 */
/**
 * Created by sunxin on 15/11/15.
 */
var express=require("express");
var router = express.Router();
var user=require("../model/userModel");
var con=require("../define/define");

router.use(function(req,res,next)
{
    var bFind=false;
    var index;
    for(var key in con.service)
    {
        if(con.service[key].method==req.method && con.service[key].path==req.baseUrl+req._parsedUrl.pathname)
        {
            bFind=true;
            index=key;
            break;
        }
    }
    if(!bFind)
    {
        next();
        return;
    }
    var clientParam;
    var phone;
    if(req.method=="POST" || req.method=="PUT" || req.method=="DELETE")
    {
        if(/^multipart\/form-data/i.test(req.headers["content-type"]))
        {
            next();
            return;
        }
        phone=req.body.phone;
        clientParam=req.body;
    }
    else
    {
        phone=req.query.phone;
        clientParam=req.query;
    }
    var param=con.service[index].param;
    for(var key in param) {
        if (clientParam[key] == undefined || clientParam[key].toString() == "") {
            res.json({
                code: con.retCode.missParam,
                msg: "缺少" + key + "参数"
            });
            return;
        }
        else if (param[key] == Number && isNaN(clientParam[key])) {
            res.json({
                code: con.retCode.missParam,
                msg: "参数" + key + "必须为number"
            });
            return;
        }
    }
    user.find({
        phone:phone
    },function(err,result)
    {
        if(err)
        {
            res.json({
                code:con.retCode.otherReason,
                msg:err.message
            });
            return;
        }
        else if(result.length==0)
        {
            res.json({
                code:con.retCode.userNotFound,
                msg:"用户名不存在"
            });
            return;
        }
        req.userInfo=result[0];
        next();
    });
});

module.exports=router;