import Vapor

final class PostsController {
    func index(_ request: Request) throws -> Future<Response> {
        let posts = [Post(id: "1", title: "Hello", imageURL: "https://loremflickr.com/320/240"),
                     Post(id: "2", title: "Guys", imageURL: "https://loremflickr.com/320/240/dog"),
                     Post(id: "3", title: "This is ", imageURL: "https://loremflickr.com/g/320/240/paris"),
                     Post(id: "4", title: "Inside ios dev", imageURL: "https://loremflickr.com/320/240/brazil,rio")]
        let response = PostsResponse(posts: posts)
        return response.encode(status: .created, for: request)
    }
}
    
struct PostsResponse: Content {
    let posts: [Post]
}

struct Post: Content {
    let id: String
    let title: String
    let imageURL: String
}
