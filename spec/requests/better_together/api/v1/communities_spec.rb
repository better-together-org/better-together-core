require 'rails_helper'

RSpec.describe BetterTogether::Api::V1::CommunitiesController, type: :request do
  # let(:user) { create(:confirmed_user) }

  let(:valid_data) do
    {
      data: {
        type: 'communities',
        attributes: {
          name: 'f_name l_name'
        }
      }
    }
  end

  let(:invalid_data) do
    {
      data: {
        type: 'communities',
        attributes: {
          name: ''
        }
      }
    }
  end

  describe 'GET /api/v1/communities/' do
    context 'when an admin is requesting the data' do
      # let(:admin_user) { create(:confirmed_admin_user) }

      before do
        create_list(:better_together_community, 3)
        # login(admin_user)
      end

      it 'returns status 200' do
        get api_v1_communities_path
        expect(response).to have_http_status(200)
      end

      it 'returns all better_together_community records' do
        get api_v1_communities_path
        expect(json['data'].size).to eq(3)
      end
    end

    context 'when a normal user is requesting the data' do
      context 'when the user has an better_together_community' do
        before do
          create_list(:better_together_community, 3)
          # login(user)
        end

        it 'returns status 200' do
          get api_v1_communities_path
          expect(response).to have_http_status(200)
        end

        it 'returns only the better_together_community belonging to the user' do
          get api_v1_communities_path
          expect(json['data'].size).to eq(1)
        end
      end

      context 'when the user does not have an better_together_community' do
        # before do
        #   login(user)
        # end

        it 'returns status 200' do
          get api_v1_communities_path
          expect(response).to have_http_status(200)
        end

        it 'returns no better_together_communitys' do
          get api_v1_communities_path
          expect(json['data'].size).to eq(0)
        end
      end
    end
  end

  describe 'GET /api/v1/communities/:id' do
    let(:better_together_community) { create(:better_together_community) }

    context 'when an admin is requesting the data' do
      # let(:admin_user) { create(:confirmed_admin_user) }

      # before do
      #   login(admin_user)
      # end

      it 'returns status 200' do
        get api_v1_community_path(id: better_together_community.id)
        expect(response).to have_http_status(200)
      end

      it 'returns all better_together_community records' do
        get api_v1_community_path(id: better_together_community.id)
        expect(json['data'].size).to eq(3)
      end
    end

    context 'when a normal user is requesting the data' do
      context 'when the user has an better_together_community' do
        # before do
        #   login(user)
        # end

        it 'returns status 200' do
          get api_v1_community_path(id: better_together_community.id)
          expect(response).to have_http_status(200)
        end

        it 'returns the better_together_community belonging to the user' do
          get api_v1_community_path(id: better_together_community.id)
          expect(json['data']).to have_id(better_together_community.id.to_s)
          expect(json['data']).to have_type('better_together_communitys')
        end
      end

      context 'when the user does not have an better_together_community' do
        # before do
        #   login(user)
        # end

        it 'returns status 403' do
          get api_v1_community_path(id: better_together_community.id)
          expect(response).to have_http_status(403)
        end
      end
    end
  end

  describe 'POST /api/v1/communities/' do
    # before do
    #   login(user)
    # end

    context 'when the better_together_community data is valid' do
      it 'returns status 200' do
        post api_v1_communities_path, params: valid_data
        expect(response).to have_http_status(200)
      end
    end

    context 'when the better_together_community data is invalid' do
      it 'returns status 422' do
        post api_v1_communities_path, params: invalid_data
        expect(response).to have_http_status(422)
      end
    end
  end

  describe 'PUT /api/v1/communities/:id' do
    let(:better_together_community) { create(:better_together_community)}

    context 'when an admin is editing the data' do
      # let(:admin_user) { create(:confirmed_admin_user) }

      # before do
      #   login(admin_user)
      # end

      context 'when the better_together_community data is valid' do
        it 'returns status 200' do
          put api_v1_community_path(id: better_together_community.id), params: valid_data
          expect(response).to have_http_status(200)
        end
      end

      context 'when the better_together_community data is invalid' do
        it 'returns status 422' do
          put api_v1_community_path(id: better_together_community.id), params: invalid_data
          expect(response).to have_http_status(422)
        end
      end

    end

    context 'when a normal user is editing the data' do
      context 'when the user authorized to access the better_together_community' do
        # before do
        #   login(user)
        # end

        context 'when the better_together_community data is valid' do
          it 'returns status 200' do
            put api_v1_community_path(id: better_together_community.id), params: valid_data
            expect(response).to have_http_status(200)
          end
        end

        context 'when the better_together_community data is invalid' do
          it 'returns status 422' do
            put api_v1_community_path(id: better_together_community.id), params: invalid_data
            expect(response).to have_http_status(422)
          end
        end
      end

      context 'when the user is not authorized to access the better_together_community' do
        # before do
        #   login(user)
        # end

        context 'when the better_together_community data is valid' do
          it 'returns status 403' do
            put api_v1_community_path(id: better_together_community.id), params: valid_data
            expect(response).to have_http_status(403)
          end
        end

        context 'when the better_together_community data is invalid' do
          it 'returns status 403' do
            put api_v1_community_path(id: better_together_community.id), params: invalid_data
            expect(response).to have_http_status(403)
          end
        end
      end
      
    end
  end

  describe 'DELETE /api/v1/communities/:id' do
    let(:better_together_community) { create(:better_together_community)}

    context 'when an admin is deleting the data' do
      # let(:admin_user) { create(:confirmed_admin_user) }

      # before do
      #   login(admin_user)
      # end

      it 'returns status 204' do
        delete api_v1_community_path(id: better_together_community.id)
        expect(response).to have_http_status(204)
      end
    end

    context 'when a normal user is deleting the data' do
      context 'when the user authorized to access the better_together_community' do
        # before do
        #   create(:better_together_community_user_authorization, better_together_community: better_together_community, user: user)
        #   login(user)
        # end

        it 'returns status 204' do
          delete api_v1_community_path(id: better_together_community.id)
          expect(response).to have_http_status(204)
        end
      end

      context 'when the user is not authorized to access the better_together_community' do
        # before do
        #   login(user)
        # end

        it 'returns status 403' do
          delete api_v1_community_path(id: better_together_community.id)
          expect(response).to have_http_status(403)
        end
      end
      
    end
  end
end
