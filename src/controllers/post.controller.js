import urlMetadata from "url-metadata"
import { newPost } from "../repositories/posts.repository.js"

export async function createPost(req, res) {
    const {link, description} = req.body
    const {userId} = res.locals.session
    try{
        await newPost(userId, link, description)
        res.sendStatus(201)
    }catch (err) {
        res.status(500).send(err.message)
    }
}

export async function getAllPosts(req, res) {
    try{
        res.sendStatus(200)
    }catch (err) {
        res.status(500).send(err.message)
    }
}