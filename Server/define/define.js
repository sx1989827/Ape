/**
 * Created by sunxin on 16/3/29.
 */
exports.dbpath="mongodb://123.57.77.6:27017/Ape";
exports.imgpath="/data";
exports.service = [
    {
        method:"GET",
        path:"/user/check",
        param: {
            phone:String,
        },
        data:Number
    },
    {
        method:"GET",
        path:"/user/login",
        param: {
            phone:String,
            pwd:String
        },
        data:
        {
            phone:String,
            name:String,
            photo:String
        }
    }
];
exports.retCode={
    ok:0,
    userNotFound:1,
    userOrPwdWrong:2,
    missParam:3,
    otherReason:4
}