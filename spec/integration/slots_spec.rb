# spec/integration/slots_spec.rb
require 'swagger_helper'

describe 'Slot API' do

  path '/api/v1/slots' do

    post 'Creates a slot' do
      tags 'Slots'
      consumes 'application/json', 'application/xml'
      parameter name: :slot, in: :body, schema: {
        type: :object,
        properties: {
          user_id: { type: :integer },
          datetime_from: { type: :datetime },
          datetime_to: { type: :datetime },
        },
        required: [ 'user_id', 'datetime_from', 'datetime_to' ]
      }

      response '201', 'slot created' do
        let(:slot) { {user_id: 1, datetime_from: Time.now, datetime_to: Time.now.advance(minutes: 30)} }
        run_test!
      end

      response '422', 'invalid request' do
        let(:slot) { { datetime_from: Time.now } }
        run_test!
      end
    end
  end

  path '/api/v1/slots/{id}' do

    get 'Retrieves a slot' do
      tags 'Slots'
      produces 'application/json', 'application/xml'
      parameter name: :id, :in => :path, :type => :string

      response '200', 'blog found' do
        schema type: :object,
          properties: {
            id: { type: :integer },
            user_id: { type: :integer },
            datetime_from: { type: :datetime },
            datetime_to: { type: :datetime },
          },
          required: [ 'id', 'user_id', 'datetime_from', 'datetime_to' ]

        let(:id) { Slot.create({user_id: 1, datetime_from: Time.now, datetime_to: Time.now.advance(minutes: 30)}).id }
        run_test!
      end

      response '404', 'slot not found' do
        let(:id) { 'invalid' }
        run_test!
      end

      response '406', 'unsupported accept header' do
        let(:'Accept') { 'application/foo' }
        run_test!
      end
    end
  end
end