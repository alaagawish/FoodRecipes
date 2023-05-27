//
//  Result.swift
//  FoodRecipes
//
//  Created by Alaa on 26/05/2023.
//

import Foundation
struct Result: Decodable{
    let seoTitle: String?
    let language: String?
    let price: Price?
    let slug: String?
    let numServings: Int?
    let showId: Int?
    let show: Show?
    let renditions: [Rendition]?
    let isShoppable: Bool?
    let canonicalId: String?
    let keywords: String?
    let aspectRatio: String?
    let thumbnailAltText: String?
    let topics: [Topic]?
    let servingsNounSingular: String?
    let tags: [Tag]?
    let name: String?
    let thumbnailUrl: String?
    let promotion: String?
    let country: String?
    let sections: [Section]?
    let isOneTop: Bool?
    let yields: String?
    let servingsNounPlural: String?
    let instructions: [Instruction]?
    let userRatings: UserRatings?
    let id: Int?
    let createdAt: Int?
    let description: String?
    let nutritionVisibility: String?
    let draftStatus: String?
    let approvedAt: Int?
    let nutrition: Nutrition?
    let tipsAndRatingsEnabled: Bool?
    let credits: [Credit]?
    let similarity: Double?
    
    private enum CodingKeys: String, CodingKey {
        case seoTitle = "seo_title"
        case language = "language"
        case price = "price"
        case slug = "slug"
        case numServings = "num_servings"
        case showId = "show_id"
        case show = "show"
        case renditions = "renditions"
        case isShoppable = "is_shoppable"
        case canonicalId = "canonical_id"
        case keywords = "keywords"
        case aspectRatio = "aspect_ratio"
        case thumbnailAltText = "thumbnail_alt_text"
        case topics = "topics"
        case servingsNounSingular = "servings_noun_singular"
        case tags = "tags"
        case name = "name"
        case thumbnailUrl = "thumbnail_url"
        case promotion = "promotion"
        case country = "country"
        case sections = "sections"
        case isOneTop = "is_one_top"
        case yields = "yields"
        case servingsNounPlural = "servings_noun_plural"
        case instructions = "instructions"
        case userRatings = "user_ratings"
        case id = "id"
        case createdAt = "created_at"
        case description = "description"
        case nutritionVisibility = "nutrition_visibility"
        case draftStatus = "draft_status"
        case approvedAt = "approved_at"
        case nutrition = "nutrition"
        case tipsAndRatingsEnabled = "tips_and_ratings_enabled"
        case credits = "credits"
        case similarity = "similarity"
    }
}
