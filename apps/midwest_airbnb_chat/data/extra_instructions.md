# Extra Instructions

Rules the LLM follows when it writes SQL for `listings`.

- `price` is the nightly price in U.S. dollars. When the user asks what something costs, use `price` and round money to whole dollars in the answer.

- `host_is_superhost` and `instant_bookable` use the text values `t` and `f`, not TRUE/FALSE. When filtering on these fields, use `t` for yes and `f` for no.

- When the user gives a city name, match it case-insensitively so `chicago`, `Chicago`, or `CHICAGO` all work.

- When calculating an average `review_scores_rating`, exclude rows where `review_scores_rating` is `NULL`.