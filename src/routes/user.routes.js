import { Router } from "express";
import { tokenValidation } from "../middlewares/tokenValidation.js";
import { getUserById, searchUsers } from "../controllers/user.controller.js";

const userRouter = Router();

userRouter.get("/users/:id", tokenValidation, getUserById);
userRouter.get("/search", tokenValidation, searchUsers);

export default userRouter;
