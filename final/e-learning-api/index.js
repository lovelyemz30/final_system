const express = require("express");
const cors = require("cors")

const authRoute = require("./routes/auth");
const moduleRoute = require("./routes/module");
const quizRoute = require("./routes/quiz");
const lessonRoute = require("./routes/lesson");

const app = express();
const PORT = parseInt(process.env["PORT"] ?? "5000");

app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cors());

// Mga routes
app.use("/auth", authRoute);
app.use("/modules", moduleRoute);
app.use("/lessons", lessonRoute);
app.use("/quizes", quizRoute);

app.listen(PORT, () => console.log(`Server running on port ${PORT}`))