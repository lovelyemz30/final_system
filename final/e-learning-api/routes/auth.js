const { Router } = require("express");
const UserRepo = require("../repository/user")
const bcrypt = require("bcrypt");
const { registrationValidator, loginValidator } = require("../utils/validator");

const router = Router();

router.post("/register", async (req, res) => {
    const error = registrationValidator(req.body);

    if (error) return res.status(400).json({
        message: error
    });

    // insert new user
    UserRepo.insert(req.body);

    return res.status(201).json({
        message: "Registration successful"
    });
});

router.post("/login", async (req, res) => {
    const error = loginValidator(req.body);

    if (error) return res.status(400).json({
        message: error
    })

    return res.status(200).json({
        message: "Login successful",
        data: existingUser[0]
    })
});

module.exports = router;