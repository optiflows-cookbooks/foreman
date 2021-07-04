require_relative 'spec_helper'

describe 'foreman::database' do
  include_context 'foreman_stubs'

  describe 'ubuntu' do
    cached(:subject) do
      ChefSpec::ServerRunner.new.converge(described_recipe)
    end

    it 'should install gems' do
      expect(subject).to install_gem_package('activerecord-postgresql-adapter')
    end

    # TODO: since removing deprecated database dependency and using the newer postgres cookbook resources these tests no longer work
    # it 'should configure postgresql' do
    #   expect(subject).to create_postgresql_database('foreman')
    #     .with(owner: 'foreman')
    #   expect(subject).to create_postgresql_database_user('create-foremanuser')
    #     .with(username: 'foreman',
    #           password: 'foreman',
    #           host: '127.0.0.1')
    #   expect(subject).to grant_postgresql_database_user('grant-foremanuser')
    #     .with(username: 'foreman',
    #           password: 'foreman',
    #           database_name: 'foreman',
    #           privileges: [:all])
    # end

    it 'should run rake tasks' do
      expect(subject).to run_foreman_rake('db:migrate')
      expect(subject).to run_foreman_rake('db:seed')
        .with(environment: {
                'SEED_ADMIN_USER' => 'admin',
                'SEED_ADMIN_PASSWORD' => 'changeme',
                'SEED_ADMIN_FIRST_NAME' => nil,
                'SEED_ADMIN_LAST_NAME' => nil,
                'SEED_ADMIN_EMAIL' => nil,
                'SEED_ORGANIZATION' => nil,
                'SEED_LOCATION' => nil,
              })
      expect(subject).to run_foreman_rake('apipie:cache')
    end
  end
end
