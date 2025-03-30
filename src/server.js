import express from "express";
import client from "./db.js";

const app = express();
const PORT = 3000;

app.use(express.json());

app.get("/users", async (req, res) => {
    try {
        const result = await client.query("SELECT * FROM users");
        res.json(result.rows);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
});

app.post("/users", async (req, res) => {
    const { first_name, email, last_name, password, phone_number, address } = req.body;
    try {
        const result = await client.query(
            "INSERT INTO users (first_name, email, last_name, password, phone_number, address) VALUES ($1, $2, $3, $4, $5, $6) RETURNING *",
            [first_name, email, last_name, password, phone_number, address]
        );
        res.status(201).json(result.rows[0]);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
});

app.delete("/users/:id", async (req, res) => {
    const { id } = req.params;
    try {
        await client.query("DELETE FROM users WHERE users_id = $1", [id]);
        res.json({ message: "Foydalanuvchi ochirildi" });
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
});

app.get("/posts", async (req, res) => {
    try {
        const result = await client.query("SELECT * FROM posts");
        res.json(result.rows);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
});

app.post("/posts", async (req, res) => {
    const { title, content, slug, user_id } = req.body;
    try {
        const result = await client.query(
            "INSERT INTO posts (title, content, slug, user_id) VALUES ($1, $2, $3, $4) RETURNING *",
            [title, content, slug, user_id]
        );
        res.status(201).json(result.rows[0]);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
});

app.delete("/posts/:id", async (req, res) => {
    const { id } = req.params;
    try {
        await client.query("DELETE FROM posts WHERE posts_id = $1", [id]);
        res.json({ message: "Post ochirildi" });
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
});

app.get("/comments", async (req, res) => {
    try {
        const result = await client.query("SELECT * FROM comments");
        res.json(result.rows);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
});

app.post("/comments", async (req, res) => {
    const { content, post_id, user_id } = req.body;
    try {
        const result = await client.query(
            "INSERT INTO comments (content, post_id, user_id) VALUES ($1, $2, $3) RETURNING *",
            [content, post_id, user_id]
        );
        res.status(201).json(result.rows[0]);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
});

app.delete("/comments/:id", async (req, res) => {
    const { id } = req.params;
    try {
        await client.query("DELETE FROM comments WHERE comments_id = $1", [id]);
        res.json({ message: "Komment ochirildi" });
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
});

app.listen(PORT, () => {
    console.log(`Server http://localhost:${PORT} da ishlayapti`);
});