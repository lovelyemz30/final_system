const { Router } = require("express");
const multer = require("multer");
const path = require("path");

const quizItemRepo = require("../repository/quizItem");

const storage = multer.diskStorage({
    destination: (req, file, cb) => {
        cb(null, 'static/images/'); // Specify the upload directory
    },
    filename: (req, file, cb) => {
        const extname = path.extname(file.originalname);
        cb(null, file.fieldname + '-' + Date.now() + extname);
    },
});

const upload = multer({
    storage
});

const router = Router();

router.post("/", upload.single("question_image"), async (req, res) => {
    const { lesson_id, correct_answer } = req.body;

    if (!lesson_id || !correct_answer || !req.file)
        return res.status(400).json({
            message: "Please fill all the required fields"
        });

    const image = req.file;

    await quizItemRepo.insert({
        lesson_id,
        correct_answer,
        question_image: image.path
    });

    return res.status(201).json({
        message: "Added successfully",
    });
});

router.get("/", async (req, res) => {
    const lessonId = req.query.lessonId;

    if (!lessonId)
        return res.status(404).json({
            message: `Can't GET ${req.originalUrl}. required query 'lessonId'`
        });

    const quizes = await quizItemRepo.findByLessonId(lessonId);

    return res.status(200).json({
        message: "Success",
        data: quizes
    })
})

module.exports = router;