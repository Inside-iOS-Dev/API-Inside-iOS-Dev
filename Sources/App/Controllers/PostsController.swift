import Vapor

final class PostsController {
    func index(_ request: Request) throws -> Future<Response> {
        let posts = [Post(id: "1", title: "Hello", imageURL: "https://loremflickr.com/320/240"),
                     Post(id: "2", title: "This", imageURL: "https://loremflickr.com/320/240/dog"),
                     Post(id: "3", title: "From ", imageURL: "https://loremflickr.com/g/320/240/paris"),
                     Post(id: "4", title: "The Backend", imageURL: "https://image.simplecastcdn.com/images/80304120-6f39-4345-8f8c-7e654e5ede07/a8c50ee6-0513-4e42-be32-abacacec2ab3/640x640/1493514588artwork.jpg")]
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
