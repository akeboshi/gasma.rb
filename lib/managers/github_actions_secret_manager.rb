# frozen_string_literal: true

require 'octokit'
require 'octkit/client/organization_action_secrets'

module ActionsSecretManager
  class GitHubActionsSecretManager
    attr_reader :org, :client

    def initialize(org, token)
      @org = org
      @client = Octokit::Client.new(access_token: token, auto_paginate: true)
    end

    # repo_id に指定したリポジトリに対してすでに存在する organization secret を追加する
    # @param repo_id [Integer] Github Repository ID
    # @param secret_name [String] Name of secret
    def add_organization_secret_to_selected_repo(repo_id, secret_name)
      @client.add_selected_repository_to_organization_secret(org, repo_id, secret_name)
    end

    def add_organization_secret_to_selected_repos(repo_ids, secret_name)
      options = {
        selected_repository_ids: repo_ids.map(&:to_i)
      }
      @client.set_selected_repositories_for_an_organization_secret(org, secret_name, options)
    end
  end
end
