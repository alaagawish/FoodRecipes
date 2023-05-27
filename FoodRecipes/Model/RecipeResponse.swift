//
//  RecipeResponse.swift
//  FoodRecipes
//
//  Created by Alaa on 27/05/2023.
//

import Foundation
struct RecipeResponse: Decodable{
    let approvedAt: Int
    let createdAt: Int
    let description: String
    let name: String
//    let prepTimeMinutes: Any
//    let totalTimeMinutes: Any
    let videoUrl: String
    let tags: [Tag]
    let userRatings: UserRatings
    let canonicalId: String
    let show: Show
    let numServings: Int
    let thumbnailAltText: String
    let keywords: String
    let promotion: String
    let servingsNounPlural: String
    let servingsNounSingular: String
    let showId: Int
    let yields: String
    let topics: [Topic]
    let isShoppable: Bool
    let slug: String
    let videoId: String
    let nutrition: Nutrition
    let tipsAndRatingsEnabled: Bool
    let nutritionVisibility: String
    let credits: [Credit]
    let price: Price
    let aspectRatio: String
    let language: String
    let id: Int
    let seoTitle: String
    let thumbnailUrl: String
    let compilations: [Compilation]
    let renditions: [Rendition]
    let country: String
    let draftStatus: String
    let isOneTop: Bool
    let updatedAt: Int
    let instructions: [Instruction]
    let sections: [Section]
    
    private enum CodingKeys: String, CodingKey {
        case approvedAt = "approved_at"
        case createdAt = "created_at"
        case description = "description"
        case name = "name"
//        case prepTimeMinutes = "prep_time_minutes"
//        case totalTimeMinutes = "total_time_minutes"
        case videoUrl = "video_url"
        case tags = "tags"
        case userRatings = "user_ratings"
        case canonicalId = "canonical_id"
        case show = "show"
        case numServings = "num_servings"
        case thumbnailAltText = "thumbnail_alt_text"
        case keywords = "keywords"
        case promotion = "promotion"
        case servingsNounPlural = "servings_noun_plural"
        case servingsNounSingular = "servings_noun_singular"
        case showId = "show_id"
        case yields = "yields"
        case topics = "topics"
        case isShoppable = "is_shoppable"
        case slug = "slug"
        case videoId = "video_id"
        case nutrition = "nutrition"
        case tipsAndRatingsEnabled = "tips_and_ratings_enabled"
        case nutritionVisibility = "nutrition_visibility"
        case credits = "credits"
        case price = "price"
        case aspectRatio = "aspect_ratio"
        case language = "language"
        case id = "id"
        case seoTitle = "seo_title"
        case thumbnailUrl = "thumbnail_url"
        case compilations = "compilations"
        case renditions = "renditions"
        case country = "country"
        case draftStatus = "draft_status"
        case isOneTop = "is_one_top"
        case updatedAt = "updated_at"
        case instructions = "instructions"
        case sections = "sections"
    }
}
