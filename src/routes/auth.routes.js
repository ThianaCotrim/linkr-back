import { Router } from "express";
import { validateSchema } from "../middlewares/validateSchema.js";
import { loginSchema, userSchema } from "../schemas/auth.schemas.js";
import { signIn, signUp } from "../controllers/auth.controllers.js";

const authRouter = Router()

authRouter.post("/singup", validateSchema(userSchema), signUp)
authRouter.post("/singin", validateSchema(loginSchema), signIn)

export default authRouter