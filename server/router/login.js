const express = require("express")
const loginRouter = express.Router()
const User = require("../models/user")

loginRouter.post("/api/validateUser", async(req,res)=>{
    try {
        const{email, password} = req.body;
        let user = await User.findOne({email});

        if(!user){
            return res.status(400).json({msg: "Invalid Credentials"})
        }
        let isPasswordValid = false
        if(user.password == password){
            isPasswordValid = true
        }

        if(!isPasswordValid){
            return res.status(400).json({msg: "Invalid Credentials"})
        }

        user = await user.save();
        res.json(user);

    } catch (err) {
        res.status(500).json({error: err.message})
    }
})

module.exports = loginRouter;