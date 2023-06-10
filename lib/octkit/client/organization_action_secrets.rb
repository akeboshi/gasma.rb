require 'octokit'

module Octokit
  class Client
    module OrganizationActionsSecrets
      # Add selected repository to an organization secret
      #
      # @param org [String] Name of organization
      # @param repository_id [Integer] A GitHub repository ID
      # @param secret_name [String] Name of secret
      # rescue Octokit::Error => e
      # @see https://docs.github.com/rest/reference/actions#add-selected-repository-to-an-organization-secret
      def add_selected_repository_to_organization_secret(org, repository_id, secret_name)
        puts "#{Organization.path(org)}/actions/secrets/#{secret_name}/repositories/#{repository_id}"
        put "#{Organization.path(org)}/actions/secrets/#{secret_name}/repositories/#{repository_id}"
      end

      def set_selected_repositories_for_an_organization_secret(org, secret_name, options = {})
        put "#{Organization.path(org)}/actions/secrets/#{secret_name}/repositories", options
      end
    end

    include OrganizationActionsSecrets
  end
end
