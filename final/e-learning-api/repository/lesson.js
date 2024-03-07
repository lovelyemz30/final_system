const db = require("./dbConnection");

async function insert(data) {
    try {
        const result = await db("tbl_lessons").insert(data);
        return result;
    } catch (error) {
        throw error;
    }
}

async function findByModuleId(moduleId) {
    try {
        const result = await db("tbl_lessons").select().where("module_id", moduleId);
        return result;
    } catch (error) {
        throw error;
    }
}

module.exports = {
    insert,
    findByModuleId
}