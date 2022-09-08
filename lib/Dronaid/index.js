const express = require('express')
const mongoose = require('mongoose')
const jwt = require('jsonwebtoken')
const app = express()
const port = 8000
require('dotenv').config()

const url = "mongodb://127.0.0.1:27017"
mongoose.connect(url,{useNewUrlParser:true})
const con = mongoose.connection

app.use(express.json())

try{
    con.on('open',()=>{
        console.log('Connected')
    })
}
catch(error){
    console.log(error)
}

app.get('/',(req,res)=>{
    res.send("Server is running successfully")
})

const userrouter=require("./routes/user");
app.use('/user',userrouter)

app.listen(port, () =>{
    console.log('Server started on port '+ port);
})