import { db } from "./db";


const TBL_NAME = "tbl_courses";

export interface Course {
    course_id: string;
    title: string;
    description: string;
    teacher_id: string;
}

export async function insert(data: Course) {
    try {
        const result = await db(TBL_NAME).insert(data);
        return result;
    } catch (error) {
        throw error;       
    }
}

export async function findAll() {
    try {
        const result = await db(TBL_NAME).select();
        return result;
    } catch (error) {
        throw error;
    }
}