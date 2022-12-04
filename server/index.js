require("dotenv").config()
const express = require("express")
const app = express()
const mongoose = require("mongoose")
const loginRouter = require("./router/login")

app.use(express.json())

app.use(loginRouter);



mongoose.connect('mongodb://localhost:27017/doctorsapp')
    .then(
        app.listen(process.env.PORT, ()=>{
            console.log(`Listenign ${process.env.PORT}`);
        })
    )
    .catch((e)=>console.log(e))