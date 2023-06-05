import bcrypt from "bcrypt";
import { v4 as uuid } from "uuid";
import {
	creatUserDB,
	getUserByEmailDB,
} from "../repositories/user.repository.js";
import { createSessionDB } from "../repositories/auth.repository.js";

export async function signUp(req, res) {
	const { email, password, name, profileImage } = req.body;
	try {
		const user = await getUserByEmailDB(email);
		if (user.rowCount !== 0)
			return res.status(409).send({ message: "Email já está cadastrado!" });
		const hash = bcrypt.hashSync(password, 10);
		await creatUserDB(email, hash, name, profileImage);
		res.sendStatus(201);
	} catch (err) {
		res.status(500).send(err.message);
	}
}
export async function signIn(req, res) {
	const { email, password } = req.body;
	try {
		const user = await getUserByEmailDB(email);
		if (user.rowCount === 0)
			return res.status(401).send({ message: "Email ainda não cadastrado!" });
		const isPasswordCorrect = bcrypt.compareSync(
			password,
			user.rows[0].password
		);
		if (!isPasswordCorrect)
			return res.status(401).send({ message: "Senha incorreta" });
		const token = uuid();
		delete user.rows[0].password;
		await createSessionDB(user.rows[0].id, token);
		res.send({ token, usersInfo: user.rows[0] });
	} catch (err) {
		res.status(500).send(err.message);
	}
}
