# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'actions_secret_manager'

org = ENV.fetch('ORG', nil)
admin_team = ENV.fetch('Team', nil)

team_manager = ActionsSecretManager::GitHubTeamManager.new(org, ENV.fetch('TOKEN', nil))
repo_ids = team_manager.fetch_repository_ids_by_team(admin_team)

secrets = ['AKEBOSHI_HOGE']
secret_manager = ActionsSecretManager::GitHubActionsSecretManager.new(org, ENV.fetch('TOKEN', nil))

secrets.each do |secret|
  secret_manager.add_organization_secret_to_selected_repos(repo_ids, secret)
end
