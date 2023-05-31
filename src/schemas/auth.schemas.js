import joi from "joi";

export const userSchema = joi.object({
	email: joi.string().email().required(),
	password: joi.string().required(),
	name: joi.string().required(),
	profileImage: joi.string().required(),
});

export const loginSchema = joi.object({
	email: joi.string().email().required(),
	password: joi.string().required(),
});
