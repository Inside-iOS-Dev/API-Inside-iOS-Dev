import Vapor

final class PostsController {
    func index(_ request: Request) throws -> Future<Response> {
        let posts = [Post(id: 1, title: "First Post!"),
                     Post(id: 2, title: "second post title"),
                     Post(id: 3, title: "3rd Post")]
        let response = PostsResponse(posts: posts)
        return response.encode(status: .created, for: request)
    }
}
    
struct PostsResponse: Content {
    let posts: [Post]
}

struct Post: Content {
    let id: Int
    let title: String
}
