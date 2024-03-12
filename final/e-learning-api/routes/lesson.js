const { Router } = require("express");
const LessonRepo = require("../repository/lesson");


const router = Router();

router.get("/", async (req, res) => {
    const courseId = req.query.courseId;

    const result = await LessonRepo.findByCourseId(courseId);

    return res.status(200).json({
        message: "Ok",
        data: result
    });
});

module.exports = router;