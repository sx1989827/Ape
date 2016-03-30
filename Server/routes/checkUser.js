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
    
    user.find({
        phone:req.phone
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