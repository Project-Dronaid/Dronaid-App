const User = require('../models/user')
const bcrypt = require('bcryptjs')

const registerUser = async (req,res,next) => {
    const{name,email,password,phonenumber,age,gender,bloodgroup} = req.body
    if(password.length < 8){
      return res.status(400).json({message: "Password must be atleast 8 characters long"});
    }

    bcrypt.hash(password,10).then(async(hash) => {
        await User.create({
            name:name,
            email:email,
            password:hash,
            phonenumber: phonenumber,
    }).then(user => 
            res.status(200).json({
                message:"User created successfully",
                user:user,
            })
        ).catch((error)=>res.status(400).json({
            message:error.message
        })
    )
  });
}



const loginUser = async (req,res,next) => {
    const{email,password}= req.body
    if(!email||!password){
        return res.status(400).json({message:"Emailid or Password not present"});
    }
    try{
        const user=await User.findOne({email:email});
        if(!user){
            res.status(400).json({
                message:"Login not successful",
                error:"User not found"
            })
        }else{
            bcrypt.compare(password,user.password).then(function (result) {
                result?
                res.status(200).json(user):
                res.status(400).json({
                    message:"Login not successful",
                });
            });
        }
    }catch(error){
        res.status(400).json({
            message:"An error occured",
            error:error.message
        })
    }
}

const getpaticularuser= async (req,res,next) => {
    const{id}= req.params;
    try{
        const user=await User.findById(id);
        res.status(200).json({
            message:"User fetched successfully",
            user:user,
        })
    }catch(error){
        res.status(400).json({
            message:"An error occured",
            error:error.message
        })
    }
}


module.exports.registerUser=registerUser
module.exports.loginUser=loginUser
module.exports.getpaticularuser=getpaticularuser


