const { Router } = require("express");
const CourseRepo = require("../repository/course");

const router = Router();

router.get("/", async (req, res) => {
    const teacherId = req.params.teacherId;

    const result = await CourseRepo.findByTeacherId(teacherId);

    return res.status(200).json({
        message: "Ok",
        data: result
    });
});

module.exports = router;