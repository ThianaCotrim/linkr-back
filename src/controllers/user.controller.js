import { getUserByIdDB, getUserPostsDB, searchUsersDB } from "../repositories/user.repository.js";

export async function getUserById(req, res) {
  const { id } = req.params;

  try {
    if (!req.headers.authorization)
      return res.status(401).send("You must be logged in to access this user's profile.");

    const user = await getUserByIdDB(id);
    const posts = await getUserPostsDB(id);

    const profile = {
      id: user.id,
      name: user.name,
      profileImage: user.profileImage,
      posts: posts.map((post) => ({
        id: post.id,
        description: post.description,
        link: post.link,
        likes: post.likes,
      })),
    };

    res.status(200).send(profile);
  } catch (err) {
    res.status(500).send(err.message);
  }
}

export async function searchUsers(req, res) {
  const { name } = req.query;

  try {
    const users = await searchUsersDB(name);
    const results = users.rows.map((user) => ({
      id: user.id,
      name: user.name,
      profileImage: user.profileImage,
      posts: user.posts
        ? user.posts.map((post) => ({
            id: post.id,
            description: post.description,
            link: post.link,
            likes: post.likes,
          }))
        : [],
    }));

    res.send(results);
  } catch (err) {
    res.status(500).send(err.message);
  }
}
