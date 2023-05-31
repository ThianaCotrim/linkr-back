import urlMetadata from "url-metadata"
import { newPost } from "../repositories/posts.repository.js"
import { theMetadata } from "../repositories/metadata.repository.js"

export async function createPost(req, res) {
    const {link, description} = req.body
    const {userId} = res.locals.session
    try{
        const {rows: response} = await newPost(userId, link, description)
        const postId = response[0].id

        const metadata = urlMetadata(link).then((response) => {
            const { title, image, description} = response
            theMetadata(title, description, image, postId)
        })
        
        

        res.sendStatus(201)
    }catch (err) {
        res.status(500).send(err.message)
    }
}
async function getMetadata(link) {
    return urlMetadata(link)
}

export async function getAllPosts(req, res) {
    try{
        res.sendStatus(200)
    }catch (err) {
        res.status(500).send(err.message)
    }
}