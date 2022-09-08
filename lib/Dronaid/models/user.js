const mongoose = require('mongoose')

const UserSchema = mongoose.Schema({
    name: {
        type: String,
        required : true,
    },
    email: {
        type: String, unique : true,
    },
    password:{
        type: String,
        required : true,
        default: "password",
        minlength: 8
    },
    phonenumber: {
        type: Number, unique: true,
    },
    age: {
        type: Number,
    },
    gender: {
        type: String,
    },
    bloodgroup: {
        type: String,
    },
})

var userdata = mongoose.model('userdata',UserSchema)
module.exports = userdata