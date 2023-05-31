import { Router } from "express";
import authRouter from "./auth.routes.js";
import postRouter from "./post.routes.js";

const router = Router()

router.use(authRouter)
router.use(postRouter)

export default router