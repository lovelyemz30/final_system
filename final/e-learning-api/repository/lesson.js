const db = require("./dbConnection");

const TABLE_NAME = "tbl_lessons";

async function insert(data) {
    try {
        const result = await db(TABLE_NAME).insert(data);
        return result;
    } catch (error) {
        throw error;
    }
}

async function findByCourseId(id) {
    try {
        const result = await db(TABLE_NAME).select().where("teacher_id", id);
        return result;
    } catch (error) {
        throw error;
    }
}

module.exports = {
    insert,
    findByCourseId
}