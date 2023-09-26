require 'swagger_helper'

RSpec.describe 'api/roles', type: :request do
    path '/roles' do
      get 'reads available roles' do
        tags 'Roles'
        consumes 'application/json'
        parameter name: :id, in: :path, type: :string

        response '200', 'blog found' do
            run_test!
        end
      end
    end
end
