
import { createSessionDB, validateToken } from "../repositories/auth.repository.js";

export async function tokenValidation(req, res, next){
    const {authorization} = req.headers;
    const token = authorization?.replace("Bearer ", "");
    if(!token) return res.sendStatus(401);
    try {
    const session = await validateToken(token);
    if(session.rowCount === 0) return res.sendStatus(401);
    res.locals.session = session.rows[0];
    next();

    } catch (error) {
        return res.status(500).send(error.message);
    }   
}