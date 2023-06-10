module ActionsSecretManager
  class GitHubTeamManager
    attr_reader :org, :client

    def initialize(org, token)
      @org = org
      @client = Octokit::Client.new(access_token: token, auto_paginate: true)
    end

    def fetch_repository_ids_by_team(team_name)
      team = @client.team_by_name(@org, team_name)
      return [] unless team

      repos = @client.team_repos(team.id)
      return [] unless repos

      repos.reject(&:archived).map(&:id)
    end
  end
end
