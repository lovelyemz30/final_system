// moduleRoutes.js
const { Router } = require("express");
const moduleRepo = require("../repository/module");
const multer = require("multer");
const path = require("path");

const router = Router();

const storage = multer.diskStorage({
    destination: "./uploads/",
    filename: function (req, file, cb) {
        cb(
            null,
            file.fieldname + "-" + Date.now() + path.extname(file.originalname)
        );
    },
});

const upload = multer({ storage: storage });


router.post("/add", upload.fields([{ name: "authorImg" }, { name: "imageUrl" }]), async (req, res) => {
    let { teacherName, title } = req.body;
    const authorImg = req.files["authorImg"][0].filename;
    const imageUrl = req.files["imageUrl"][0].filename;

    if (!teacherName || !authorImg || !title || !imageUrl)
        return res.status(400).json({
            message: "Fill the required fields",
        });

    try {
        await moduleRepo.insert({
            teacherName,
            authorImg,
            title,
            imageUrl
        });

        return res.status(200).json({
            message: "Module added successfully",
        });
    } catch (error) {
        console.error(error);
        return res.status(500).json({
            message: "Internal Server Error",
        });
    }
});
// ...

// ...

router.get("/course", async (req, res) => { // Change 'res' to 'req'
    try {
        const course = await moduleRepo.getAll(); // Assuming you have a function like getAll in moduleRepo
        return res.status(200).json(course);
    } catch (error) {
        console.error(error);
        return res.status(500).json({
            message: "Internal Server Error",
        });
    }
});

// ...

module.exports = router;
