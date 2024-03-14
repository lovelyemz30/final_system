import express from "express";

const app = express();

app.use(express.json());
app.use(express.urlencoded({ extended: false }));


const PORT = parseInt(process.env["PORT"] ?? "5000");
app.listen(PORT, () => console.log(`Server running on port ${PORT}`));