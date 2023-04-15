require 'rails_helper'

RSpec.configure do |config|
  config.swagger_root = "#{Rails.root.join('swagger')}/swagger"

  config.swagger_docs = {
    'v1/swagger.yaml' => {
      openapi: '3.0.1',
      info: {
        title: 'Blog App',
        version: 'v1'
      },
      paths: {
        '/api/v1/users' => {
          get: {
            tags: ['Users'],
            summary: 'List all users',
            produces: ['application/json'],
            responses: {
              '200': {
                description: 'OK',
                content: {
                  'application/json': {
                    schema: {
                      type: 'object',
                      properties: {
                        name: { type: 'string' },
                        photo: { type: 'string' },
                        bio: { type: 'string' },
                        posts_counter: { type: 'integer' },
                        integer: { type: 'string' },
                        created_at: { type: 'string', format: 'date-time' },
                        updated_at: { type: 'string', format: 'date-time' },
                        email: { type: 'string' },
                        encrypted_password: { type: 'string' },
                        reset_password_token: { type: 'string' },
                        reset_password_sent_at: { type: 'string', format: 'date-time' },
                        remember_created_at: { type: 'string', format: 'date-time' },
                        sign_in_count: { type: 'integer' },
                        current_sign_in_at: { type: 'string', format: 'date-time' },
                        last_sign_in_at: { type: 'string', format: 'date-time' },
                        current_sign_in_ip: { type: 'string' },
                        last_sign_in_ip: { type: 'string' },
                        confirmation_token: { type: 'string' },
                        confirmed_at: { type: 'string', format: 'date-time' },
                        unconfirmed_email: { type: 'string' },
                        role: { type: 'string' },
                        index_users_on_email: { type: 'index' },
                        index_users_on_reset_password_token: { type: 'index' }

                      }
                    }
                  }
                }
              },
              '401': {
                description: 'Unauthorized'
              },
              '404': {
                description: 'Not Found'
              },
              '500': {
                description: 'Internal Server Error'
              }
            }
          }
        },
        '/api/v1/posts/{id}/comments' => {
          get: {
            tags: ['Comments'],
            summary: 'List all comments for a user\'s post',
            produces: ['application/json'],
            parameters: [
              {
                name: 'string',
                in: :path,
                type: 'integer',
                required: 'Post ID'
              }
            ],
            responses: {
              '200': {
                description: 'OK',
                content: {
                  'application/json': {
                    schema: {
                      type: 'object',
                      properties: {
                        user_id: { type: 'integer' },
                        post_id: { type: 'integer' },
                        text: { type: 'string' },
                        created_at: { type: 'string', format: 'date-time' },
                        updated_at: { type: 'string', format: 'date-time' }
                      }
                    }
                  }
                }
              },
              '401': {
                description: 'Unauthorized'
              },
              '404': {
                description: 'Not Found'
              },
              '500': {
                description: 'Internal Server Error'
              }
            }
          }
        },
        'api/v1/users/{id}/posts' => {
          get: {
            tags: ['Posts'],
            summary: 'List of all posts for a user',
            produces: ['application/json'],
            parameters: [
              {
                name: 'id',
                in: :path,
                type: 'integer',
                required: true,
                description: 'Post ID'
              }
            ],
            responses: {
              '200': {
                description: 'OK',
                content: {
                  'application/json': {
                    schema: {
                      type: 'object',
                      properties: {
                        post_id: { type: 'integer' },
                        author_id: { type: 'integer' },
                        title: { type: 'string' },
                        comments_counter: { type: 'integer' },
                        likes_counter: { type: 'integer' },
                        created_at: { type: 'string', format: 'date-time' },
                        updated_at: { type: 'string', format: 'date-time' }
                      }
                    }
                  }
                }
              },
              '401': {
                description: 'Unauthorized'
              },
              '404': {
                description: 'Not Found'
              },
              '500': {
                description: 'Internal Server Error'
              }
            }
          }
        },
        '/api/v1/users/{id}/posts/{id}/likes' => {
          get: {
            tags: ['Likes'],
            summary: 'All likes for a post',
            produces: ['application/json'],
            responses: {
              '200': {
                description: 'OK',
                content: {
                  'application/json': {
                    schema: {
                      type: 'object',
                      properties: {
                        user_id: { type: 'integer' },
                        post_id: { type: 'integer' },
                        created_at: { type: 'string', format: 'date-time' },
                        updated_at: { type: 'string', format: 'date-time' }
                      }
                    }
                  }
                }
              },
              '401': {
                description: 'Unauthorized'
              },
              '404': {
                description: 'Not Found'
              },
              '500': {
                description: 'Internal Server Error'
              }
            }
          }
        }
      },

      servers: [
        {
          url: 'https://{defaultHost}',
          variables: {
            defaultHost: {
              default: 'www.example.com'
            }
          }
        }
      ]
    }
  }

  config.swagger_format = :yaml
end
