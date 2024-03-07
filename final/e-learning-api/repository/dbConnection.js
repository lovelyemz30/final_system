const knex = require("knex");

const db = knex({
    client: "mysql",
    connection: {
        host: "localhost",
        port: 3306,
        database: "e_learning_app",
        user: "root"
    }
});

module.exports = db;