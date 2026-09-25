# Midwest Airbnb Listings: Data Dictionary

**Dataset:** `listings` table in `midwest_airbnb.db` (SQLite), 14,887 rows and 29 columns
**Source:** Inside Airbnb (https://insideairbnb.com/get-the-data/), the detailed `listings.csv.gz` file for each of three regions: Chicago (snapshot 2026-07-20), Columbus (snapshot 2026-07-23), and Twin Cities MSA (snapshot 2026-07-21). Column meanings follow Inside Airbnb's data dictionary and assumptions (https://insideairbnb.com/data-assumptions/).
**Course:** ISA 401, Miami University

> One row is one listing that showed a nightly price on the snapshot date; listings with no price were dropped. Empty cells are stored as SQL `NULL`.

---

## Field Definitions

| Field | Type | Description |
|---|---|---|
| `city` | text | Which Inside Airbnb region the listing came from: `Chicago` (7,439 rows), `Columbus` (2,587), or `Twin Cities` (4,861). The Twin Cities file covers the Minneapolis-St. Paul metro area, not just the two cities. |
| `snapshot_date` | text | Date Inside Airbnb compiled the file, stored as an ISO text string, not a date: `2026-07-20` for Chicago, `2026-07-23` for Columbus, `2026-07-21` for Twin Cities. Every row of a city shares the same value. |
| `id` | text | Airbnb's listing id. Unique across the table (14,887 distinct values). Stored as text even though it looks numeric, so compare it to a quoted string. |
| `name` | text | Listing title as shown on Airbnb (for example "Tiny Studio Apartment 94 Walk Score"). Never empty. |
| `price` | real | Nightly price in U.S. dollars on the snapshot date, with the dollar sign and commas removed. Ranges from 2.56 to 11,412; never `NULL` (rows without a price were dropped). |
| `room_type` | text | Airbnb's four listing categories: `Entire home/apt` (11,652 rows), `Private room` (2,951), `Hotel room` (246), or `Shared room` (38). |
| `host_id` | text | Unique ID for the host who owns or manages the listing. Stored as text even though it looks numeric. |
| `host_name` | text | Public display name of the host associated with the listing. |
| `host_since` | text | Date the host first joined Airbnb, stored as a date-like text value. |
| `host_is_superhost` | text | Indicates whether the host is an Airbnb Superhost: `t` for true, `f` for false; may be `NULL`. |
| `neighbourhood` | text | Cleaned neighbourhood assigned by Inside Airbnb by comparing the listing's geographic coordinates with city-defined neighbourhood boundaries. Corresponds to Inside Airbnb's `neighbourhood_cleansed` field. |
| `latitude` | real | Approximate latitude of the listing. Airbnb anonymizes listing locations, so the displayed location may be roughly 0–450 feet (150 metres) from the actual address. |
| `longitude` | real | Approximate longitude of the listing. Airbnb anonymizes listing locations, so the displayed location may be roughly 0–450 feet (150 metres) from the actual address. |
| `property_type` | text | Detailed property category supplied by Airbnb, such as an entire rental unit, private room, condo, or home. |
| `accommodates` | integer | Maximum number of guests the listing says it can accommodate. |
| `bedrooms` | real | Number of bedrooms reported for the listing; may be `NULL`. |
| `beds` | real | Number of beds reported for the listing; may be `NULL`. |
| `bathrooms_text` | text | Text description of the bathrooms, such as `1 bath`, `2 baths`, or `1 shared bath`. |
| `minimum_nights` | integer | Minimum number of nights a guest must book for the listing. |
| `availability_365` | integer | Number of days shown as available during the next 365 days, from 0 to 365. An unavailable day may be either booked or blocked by the host because Airbnb's calendar does not distinguish between the two. |
| `number_of_reviews` | integer | Total number of reviews recorded for the listing. Reviews can be used as an input when estimating booking activity, but not every guest leaves a review. |
| `number_of_reviews_ltm` | integer | Number of reviews the listing received during the last twelve months. |
| `first_review` | text | Date of the listing's earliest recorded review; `NULL` for listings with no reviews. |
| `last_review` | text | Date of the listing's most recent recorded review; `NULL` for listings with no reviews. |
| `review_scores_rating` | real | Overall Airbnb review rating for the listing; may be `NULL` when a listing has not received enough reviews. |
| `reviews_per_month` | real | Average number of reviews received per month over the period the listing has been active; may be `NULL`. |
| `instant_bookable` | text | Indicates whether guests can book immediately without host approval: `t` for true and `f` for false. |
| `estimated_revenue_l365d` | real | Estimated revenue over the last 365 days. This is a modeled estimate rather than actual reported host income, so it should not be treated as exact revenue. | 
| `amenities_count` | integer | Number of items in the listing's amenities list. This field was computed for the course rather than supplied directly by Inside Airbnb. |
Continue the table for the remaining 23 columns (Assignment 05): `host_id`, `host_name`, `host_since`, `host_is_superhost`, `neighbourhood`, `latitude`, `longitude`, `property_type`, `accommodates`, `bedrooms`, `beds`, `bathrooms_text`, `minimum_nights`, `availability_365`, `number_of_reviews`, `number_of_reviews_ltm`, `first_review`, `last_review`, `review_scores_rating`, `reviews_per_month`, `instant_bookable`, `estimated_revenue_l365d`, `amenities_count`.

Two hints: `neighbourhood` is Inside Airbnb's `neighbourhood_cleansed` column, and `amenities_count` is not an Inside Airbnb column; it was computed for this course as the number of items in each listing's `amenities` list. Everything else keeps its Inside Airbnb name, so the data dictionary linked above explains it.

