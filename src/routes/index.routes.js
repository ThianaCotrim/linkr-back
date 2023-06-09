import { Router } from "express";
import authRouter from "./auth.routes.js";
import postRouter from "./post.routes.js";
import userRouter from "./user.routes.js";
import commentsRouter from "./comments.routes.js";

const router = Router();

router.use(authRouter);
router.use(postRouter);
router.use(userRouter);
router.use(commentsRouter);

export default router;
