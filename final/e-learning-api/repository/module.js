// moduleRepo.js
const db = require("./dbConnection");

async function insert({ teacherName, authorImg, title, imageUrl }) {
    try {
        console.log("Inserting:", { teacherName, authorImg, title, imageUrl });

        const [result] = await db("tbl_course").insert({
            teacherName,
            authorImg,
            title,
            imageUrl,
        });

        console.log("Insert Result:", result);

        return result;
    } catch (error) {
        console.error("Insert Error:", error);
        throw error;
    }
}

async function getAll() {
    try {
        const modules = await db("tbl_course").select("*");

        console.log("Retrieved Modules:", modules);

        return modules;
    } catch (error) {
        console.error("GetAll Error:", error);
        throw error;
    }
}



module.exports = {
    insert,
    getAll,

};
