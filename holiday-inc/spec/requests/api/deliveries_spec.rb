require 'swagger_helper'

RSpec.describe 'api/deliveries', type: :request do
    path '/deliveries' do
      get 'reads available deliveries' do
        tags 'Deliveries'
        produces 'application/json'
        consumes 'application/json'
        response '200', 'found delivery' do
            run_test!
        end
      end

      post 'Create new article' do
        tags 'Deliveries'
        parameter name: :delivery, in: :body, schema: {
          type: :object,
          properties: {
            manifest: { type: :string },
            delivery_date: { type: :string, format: :datetime },
            customer_id: { type: :integer },
            assigned_to_id: { type: :integer },
            destination_id: { type: :integer },
            is_complete: { type: :boolean }
          },
          required: ['manifest', 'delivery_date', 'customer_id', 'destination_id']
        }

        response '201', :created do
          let(:delivery) {
            {
              manifest: 'test', 
              delivery_date: '2024-01-01',
              customer_id: 7,
              destination_id: 1
            }
          }
          run_test!
        end
      end
    end
end
