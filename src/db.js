import pg from "pg";
const { Client } = pg;

const client = new Client({
    user: "postgres",
    password: "1234",
    host: "localhost",
    port: 5432,
    database: "psql_db",
});
await client.connect();

export default client;
