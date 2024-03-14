import knex from "knex";

export const db = knex({
    client: "mysql",
    connection: {
        host: "localhost",
        user: "root",
        port: 3306,
        database: "e_learning_app2"
    }
});

