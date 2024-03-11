const Joi = require("joi");
const UserRepo = require("../repository/user");
const bcrypt = require("bcrypt");


const registrationSchema = Joi.object({
    firstname: Joi.string().max(50).required(),
    lastname: Joi.string().max(50).required(),
    email: Joi.string().max(50).email().required(),
    password: Joi.string().alphanum().min(8).required()
});

const loginSchema = Joi.object({
    email: Joi.string().email().required(),
    password: Joi.string().required()
});

const courseSchema = Joi.object({
    title: Joi.string().max(100).required(),
    description: Joi.string(),
    teacher_id
});

async function registrationValidator(body) {
    const { error } = registrationSchema.validate(body);

    if (error) return error.message;

    const matchedUser = await UserRepo.findByEmail(body.email);

    if (matchedUser) return "Email already taken";

    return null;
}

async function loginValidator(body) {
    const { error } = loginSchema.validate(body);

    if (error) return error.message;

    const matchedUser = await UserRepo.findByEmail();

    if (!matchedUser) return "Invalid email or password";

    const passwordMatches = await bcrypt.compare(body.password, matchedUser[0].password);

    if (!passwordMatches) return "Invalid email or password";

    return null;
}

module.exports = {
    registrationValidator,
    loginValidator
};