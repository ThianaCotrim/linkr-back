import bcrypt from "bcrypt"
import { db } from "../database/database.connection.js"
import { creatUserDB, getUserByEmailDB } from "../repositories/user.repository.js"


export async function signUp(req, res) {

    const { email, password, name, profileImage } = req.body

    try {

        const user = await getUserByEmailDB(email)
        if (user.rowCount !== 0) return res.status(409).send({message: "Email já está cadastrado!"})

        const hash = bcrypt.hashSync(password, 10)

        await creatUserDB(email, hash, name, profileImage)

        res.sendStatus(201)
    } catch (err) {
        res.status(500).send(err.message)
    }
}


export async function signIn(req, res) {

    const { email, password } = req.body

    try {

    } catch (err) {
        res.status(500).send(err.message)
    }
}