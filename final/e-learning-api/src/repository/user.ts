import { db } from "./db";

export const TBL_NAME = "tbl_user";

export interface User {
    user_id: string;
    firstname: string;
    lastname: string;
    email: string;
    password: string;
    role: "student" | "teacher";
}

export async function insert(data: User) {
    try {
        const result = await db(TBL_NAME).insert(data);
        return result;
    } catch (error) {
        throw error;       
    }
}

export async function findByEmail(email: string) {
    try {
        const result = await db(TBL_NAME).select().where("email", email);
        return result;
    } catch (error) {
        throw error;
    }
}