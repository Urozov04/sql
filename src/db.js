import pg from "pg";
const { Client } = pg;

const client = new Client({
    user: "postgres",
    password: "12345678",
    host: "localhost",
    port: 5432,
    database: "psql_db",
});
await client.connect();

export default client;