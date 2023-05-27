//
//  Result.swift
//  FoodRecipes
//
//  Created by Alaa on 26/05/2023.
//

import Foundation
struct Result: Decodable{
    let seoTitle: String?
<
    let language: String?


    let price: Price?
    let slug: String?
    //let brandId: Any
    let numServings: Int?

    let showId: Int?
    let show: Show?
    let renditions: [Rendition]?
    let isShoppable: Bool?
    let canonicalId: String?
    let keywords: String?

    //  let seoPath: Any?
    let aspectRatio: String?
    let thumbnailAltText: String?
    //let videoUrl: Any?
    //  let updatedAt: Int?
    // let beautyUrl: Any?
    let topics: [Topic]?
    //  let facebookPosts: [Any]?
    let servingsNounSingular: String?
    let tags: [Tag]?
    let name: String?
    // let buzzId: Any?

    let thumbnailUrl: String?
    let promotion: String?
    let country: String?
    let sections: [Section]?

    //    let compilations: [Any]?
    let isOneTop: Bool?
    let yields: String?
    //  let originalVideoUrl: Any?

    let servingsNounPlural: String?
    let instructions: [Instruction]?
    let userRatings: UserRatings?
    let id: Int?
    let createdAt: Int?
    let description: String?

    // let totalTimeMinutes: Any?
    let nutritionVisibility: String?
    let draftStatus: String?
    // let cookTimeMinutes: Any?
    let approvedAt: Int?
    //    let videoAdContent: Any?
    //  let brand: Any?
    // let prepTimeMinutes: Any?
    let nutrition: Nutrition?
    let tipsAndRatingsEnabled: Bool?
    // let inspiredByUrl: Any?
    let credits: [Credit]?
    // let videoId: Any?

    let similarity: Double?
    
    private enum CodingKeys: String, CodingKey {
        case seoTitle = "seo_title"
        case language = "language"
        case price = "price"
        case slug = "slug"
        //  case brandId = "brand_id"
        case numServings = "num_servings"
        //    case totalTimeTier = "total_time_tier"
        case showId = "show_id"
        case show = "show"
        case renditions = "renditions"
        case isShoppable = "is_shoppable"
        case canonicalId = "canonical_id"
        case keywords = "keywords"
        //    case seoPath = "seo_path"
        case aspectRatio = "aspect_ratio"
        case thumbnailAltText = "thumbnail_alt_text"
        //   case videoUrl = "video_url"
        //  case updatedAt = "updated_at"
        //  case beautyUrl = "beauty_url"
        case topics = "topics"
        //  case facebookPosts = "facebook_posts"
        case servingsNounSingular = "servings_noun_singular"
        case tags = "tags"
        case name = "name"
        //   case buzzId = "buzz_id"
        case thumbnailUrl = "thumbnail_url"
        case promotion = "promotion"
        case country = "country"
        case sections = "sections"
        // case compilations = "compilations"
        case isOneTop = "is_one_top"
        case yields = "yields"
        //  case originalVideoUrl = "original_video_url"
        case servingsNounPlural = "servings_noun_plural"
        case instructions = "instructions"
        case userRatings = "user_ratings"
        case id = "id"
        case createdAt = "created_at"
        case description = "description"
        //   case totalTimeMinutes = "total_time_minutes"
        case nutritionVisibility = "nutrition_visibility"
        case draftStatus = "draft_status"
        // case cookTimeMinutes = "cook_time_minutes"
        case approvedAt = "approved_at"
        //        case videoAdContent = "video_ad_content"
        //        case brand = "brand"
        //        case prepTimeMinutes = "prep_time_minutes"
        case nutrition = "nutrition"
        case tipsAndRatingsEnabled = "tips_and_ratings_enabled"
        //  case inspiredByUrl = "inspired_by_url"
        case credits = "credits"
        //  case videoId = "video_id"
        case similarity = "similarity"
    }
}
