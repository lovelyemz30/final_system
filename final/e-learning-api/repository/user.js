const db = require("./dbConnection");

async function insert(data) {
    try {
        // const id = v4();
        // data.user_id = id;
        const result = await db("tbl_user").insert(data);
        return result;
    } catch (error) {
        throw error;
    }
}

async function findByEmail(email, role) {
    try {
        let query = db('tbl_user').select().where({ email });

        if (role) {
            query = query.andWhere({ role });
        }

        const result = await query;
        return result;
    } catch (error) {
        throw error;
    }
}

module.exports = {
    insert,
    findByEmail
}


module.exports = {
    insert,
    findByEmail
}