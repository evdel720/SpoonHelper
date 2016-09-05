# API Endpoints

## HTML API

### Root

- `GET /` - loads React web app

## JSON API

### Users

- `POST /api/users`
- `GET /api/users/:id`

### Session

- `POST /api/session`
- `DELETE /api/session`
- `GET /api/session`

### Categories

- `GET /api/categories`
- pass suggestions too
- `GET /api/categories/:id`


### Recipes

- `GET /api/recipes`
- `GET /api/recipes?title=search_title`
- accepts `title` query param to searched list recipes
- `GET /api/recipes/:id`
- `POST /api/recipes`
- `PATCH /api/recipes/:id`
- `DELETE /api/recipes/:id`


### Comments

- `POST /api/recipes/:recipe_id/comments`
- `DELETE /api/comments/:id`
