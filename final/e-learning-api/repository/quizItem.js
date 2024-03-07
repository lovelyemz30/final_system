const db = require("./dbConnection");


async function insert(data) {
    try {
        const result = await db("tbl_quiz_item").insert(data);
        return result;
    } catch (error) {
        throw error;
    }
}

async function findByLessonId(lessonId) {
    try {
        const result = await db("tbl_quiz_item").select().where("lesson_id", lessonId);
        return result;
    } catch (error) {
        throw error;
    }
}
module.exports = {
    insert,
    findByLessonId
}