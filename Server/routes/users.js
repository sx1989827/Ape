var express = require('express');
var check=require("./checkUser");
var userModel=require("../model/userModel");
var con=require("../define/define");
var router = express.Router();
router.get('/check', function (req, res)
{
  userModel.find({phone: req.query.phone}, function (err, result)
  {
    if (err)
    {
      res.json({
        code: con.retCode.otherReason,
        msg: err.message
      });
      return;
    }
    res.json({
      code: con.retCode.ok,
      data: result.length > 0 ? 1 : 0
    });
  });
});

router.get("/login",check,function (req, res) {
  if(req.query.pwd==req.userInfo.pwd)
  {
    res.json({
      phone:req.userInfo.phone,
      name:req.userInfo.name,
      photo:req.userInfo.photo
    })
  }
  else
  {
    res.json({
      code:con.retCode.userOrPwdWrong,
      msg:"密码错误"
    })
  }
})
module.exports = router;








