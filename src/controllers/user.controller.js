import { getUserByIdDB, getUserPostsDB, searchUsersDB } from "../repositories/user.repository.js";

export async function getUserById(req, res) {
  const { id } = req.params;

  try {
    if (!req.headers.authorization)
      return res.status(401).send("Você precisa estar logado para acessar esse perfil.");

    const user = await getUserByIdDB(id);
    const post = await getUserPostsDB(id);

    const profile = {
      id: user.rows[0].id,
      name: user.rows[0].name,
      image: user.rows[0].profileImage,

      posts: post.rows.map((post) => ({
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
      image: user.profileImage,

      posts: user.posts.map((post) => ({
        id: post.id,
        description: post.description,
        link: post.link,
        likes: post.likes,
      })),
    }));

    res.send(results);
  } catch (err) {
    res.status(500).send(err.message);
  }
}
