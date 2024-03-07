const { Router } = require("express");
const userRepo = require("../repository/user")
const bcrypt = require("bcrypt");

const router = Router();

router.post("/register", async (req, res) => {
    let { firstname, lastname, email, password, role } = req.body;

    if (!firstname || !lastname || !email || !password)
        return res.status(400).json({
            message: "Please fill the required fields"
        });

    // if (role != "student" || role != "teacher")
    //     return res.status(400).json({
    //         message: "Invalid role"
    //     });

    const existingUser = await userRepo.findByEmail(email, role);

    if (existingUser.length > 0)
        return res.status(409).json({
            message: "Email already registered"
        });

    password = await bcrypt.hash(password, 10);
    console.log(role)
    await userRepo.insert({
        firstname,
        lastname,
        email,
        password,
        role
    });

    const user = await userRepo.findByEmail(email);

    return res.status(201).json({
        message: "Registration successful", data: user[0]
    });
});

router.post("/login", async (req, res) => {
    let { email, password, role } = req.body;


    const existingUser = await userRepo.findByEmail(email, role);
    console.log(existingUser)

    if (existingUser.length < 1)
        return res.status(400).json({
            message: "Invalid email or password"
        })

    const passwordMatch = await bcrypt.compare(password, existingUser[0].password);

    if (!passwordMatch)
        return res.status(400).json({
            message: "Invalid email or password"
        });


    return res.status(200).json({
        message: "Login successful",
        data: existingUser[0]
    })
});





module.exports = router;