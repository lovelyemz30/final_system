const db = require("./dbConnection");

const TABLE_NAME = "tbl_courses";

async function insert(data) {
    try {
        const result = await db(TABLE_NAME).insert(data);
        return result;
    } catch (error) {
        throw error;
    }
}

async function findByTeacherId(id) {
    try {
        const result = await db(TABLE_NAME).select().where("teacher_id", id);
        return result;
    } catch (error) {
        throw error;
    }
}

async function findById(id) {
    try {
        const result = await db(TABLE_NAME).select().where("course_id", id);
        return result;
    } catch (error) {
        throw error;
    }
}

module.exports = {
    insert,
    findById,
    findByTeacherId
}