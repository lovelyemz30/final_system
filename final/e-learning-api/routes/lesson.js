const { Router } = require("express");
const lessonRepo = require("../repository/lesson");


const router = Router();

router.post("/", async (req, res) => {
    const { title, module_id, video } = req.body;

    if (!title || !module_id || !video)
        return res.status(400).json({
            message: "fill the required fields"
        });

    await lessonRepo.insert({
        title,
        module_id,
        video
    });

    return res.status(201).json({
        message: "Added successfully"
    });
});

router.get("/", async (req, res) => {
    const moduleId = req.query.moduleId;

    if (!moduleId)
        return res.status(404).json({
            message: `Can't GET ${req.originalUrl}. required query 'moduleId'`
        });

    const lessons = await lessonRepo.findByModuleId(moduleId);

    return res.status(200).json({
        message: "Success",
        data: lessons
    });
})

module.exports = router;