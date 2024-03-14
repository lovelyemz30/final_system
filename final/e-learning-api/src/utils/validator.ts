import Joi from "joi";
import { User } from "../repository/user";
import * as userRepo from "../repository/user";

import bcrypt from "bcrypt";


const registerSchema = Joi.object({
    firstname: Joi.string().max(100).required(),
    lastname: Joi.string().max(100).required(),
    email: Joi.string().email().max(50).required(),
    password: Joi.string().alphanum().min(8).required()
});

const loginSchema = Joi.object({
    email: Joi.string().required(),
    password: Joi.string().required()
});


export async function registerValidation(user: User) {
    const { error } = registerSchema.validate(user);

    if (error) return error;

    const matchedUser = await userRepo.findByEmail(user.email);
    if (matchedUser) return "Email already taken";

    return null;
}

export async  function loginValidation(user: User) {
    const {error} = loginSchema.validate(user);

    if (error) return error;

    const matchedUser = await userRepo.findByEmail(user.email);
    if (!matchedUser) return "Invalid username or password";

    if ((!await bcrypt.compare(user.password, matchedUser[0].password)))
        return "Invalid username or password";

    return null;
}